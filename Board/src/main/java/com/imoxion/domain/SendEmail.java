package com.imoxion.domain;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.web.multipart.MultipartFile;

public class SendEmail {

	public void mail(String mail, BoardVO board, List<BoardAttaVo> list)
			throws AddressException, MessagingException, UnsupportedEncodingException {
		Properties props = new Properties();
		String filePath = "";
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");

		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("aptmanager.kosta111@gmail.com","kosta111");
			}

		};

		Session session2 = Session.getDefaultInstance(props, auth);

		MimeMessage message = new MimeMessage(session2);
		message.setSender(new InternetAddress(mail));
		message.setSubject(board.getB_title() +"   ["+board.getM_id()+"님이 작성한 게시물입니다.]");

		message.setRecipient(Message.RecipientType.TO, new InternetAddress(mail));

		Multipart mp = new MimeMultipart();
		MimeBodyPart mbp1 = new MimeBodyPart();
		mbp1.setText(board.getB_content());
		mp.addBodyPart(mbp1);

		for (int i = 0; i < list.size(); i++) {
			filePath = "c:\\upload\\"+list.get(i).getAtta_id();
			MimeBodyPart mbp2 = new MimeBodyPart();
			FileDataSource fds = new FileDataSource(filePath);
			mbp2.setDataHandler(new DataHandler(fds));
			mbp2.setFileName(MimeUtility.encodeText(list.get(i).getAtta_name(), "UTF-8", "B"));
			mp.addBodyPart(mbp2);

		}

		message.setContent(mp);

		Transport.send(message);
	}
}
