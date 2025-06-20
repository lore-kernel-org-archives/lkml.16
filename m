Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17561CD3F;
	Fri, 20 Jun 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414707; cv=none; b=O0ZZscbgbP4b0C3B9Hl15uggOAy0uYTcsgYVCcwGIidQvMwcxXtHEnJkwm9J7Dctz0GUGQFFqjCNmWqifKk5xBVc2xmKSoy1Adiv6Q8w2Jv84f79JJoavCnf4aJhOoQ73RbJgZFmWea1pBMm0VdOmhzQW+fCf3zN0iLl+6CatUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414707; c=relaxed/simple;
	bh=OHTAFr4Nnkci8fC0Hh5erGR+z237oK6yJIyN/wHUb7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nbNCFpb+iBChJfuk00KUoukDfaFUsjDS8+xrTvU8vRYVth7qvFb3qg1HXydzien4RcoJ+g1UA/6LjV9bzhqz9TWJTod1ij3UabMQHHTRvevxfKutKQOk+/2UMc7Pd8epqtI8UksXyC7mHg7mjkRX2hfZXBcw/XWytAoGpudmHVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQQwA8O2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQQwA8O2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso1355470a91.0;
        Fri, 20 Jun 2025 03:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750414705; x=1751019505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Y45Af1N12sdqf4ktAW2A1RMwZEJjew8c9wqS+B0/8Y=;
        b=gQQwA8O2BqISl359BbWRxL8YUAGNCWrvyUmJyDwXdFvG5pOkzLeXZgZAlnMygMmXBA
         jnt0FwDxZ8N8lRimn9RiCyqT6mYvEaj2VoD2xWZ34VtlflIZTbtkn12Ie1q9HPvhXrG+
         bkql9se8yGes5YRcoZr8nljlZKawKEnPxCqAyeYqrs6H9O9t9/NOXhI8hxop0s8RLjAP
         AE6fUTPEIE3QNpC9kkbNDXmvO5yFPWLF1SC/Z6L8ZYjWPZKIV9+Fd5kw/c3ApwJCrsmv
         2gklIUMR3UPMg9tCZOORiieJTnHDSLBRAfCMpBSnv8nQ6QTd26t1m+jNv3L/q1UZwnPz
         gbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750414705; x=1751019505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Y45Af1N12sdqf4ktAW2A1RMwZEJjew8c9wqS+B0/8Y=;
        b=INkm7SSBQcRdA+/6RuuUKz+JUQ5iRkgnusWF8mEDYs+JI4ZFoplm3nfJP3sMRNL08Z
         wAkabr9b4sCu1QT8VztlTtCKjVTQ20t2jIQqXpHXa/pGPBgU0n0wo0yKtX92XdHrwFLc
         FTrhv7DWkp+CSMoPAK5KtiltvPLi5oYFGBMOGhwl7ou7mGdEcEEYJDnSl5IbjSBF/BpX
         LhqCycSyftCDiYryo5nnK3sfLCc86E6bgRfYt35jTdzRIpcwN8kwv1zMFnfCoLvn1ZV1
         e92LOt4sxFnDxg8T38qKLud1aLXiyDBs9CODUokHiuDPV0UcD6i36hvUQL7A32FJWQ4M
         eCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVse4lBNxGrPRkdiNrz0u0MwooZVXV5mx858FgSCHG0xcg33e+YW4B03efyp9BtDRJRS9X0g7+yRPZY@vger.kernel.org, AJvYcCVw023A7jqI06rtjZyJ5Fcaz9ILHttdIAtc3R1uFgBoD2ieuXlB0g7pkLlMcmqYcynAmYzhthTI54vHTn8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uk8EoEbiyRfGBpH0vIK06/5s4m5PVbEyx59hTh94QwAy3KTx
	61abJPyh7WpSdzDJz68hw+4XUao+bxu4Rthn9fV4qDmTkZnr1GdAEqux
X-Gm-Gg: ASbGncux0FmLYGW8SfJNs89zYmbJ8Pt7h32V82gG0vH6DPo5QPMeKlnFKMjn3CiLD9h
	tquvQuq6Kwg+jssi3gieicC+t/uQ1VKi04l/zxKzbtyMUD9LKsmiMh2sP0IOluRX0ZjdgE17ag8
	Fmvnio0jQ9AALrOSrEbUfMimZDWyal+qzhqG0cf4tDlIMrbqk7zWwBi88Sk13Q92IDM0ggoBMZy
	gspnWf9eiwCdyld+TwhjPzyA8JAyv25UqpqU0e/gWbhSZJeAvZkGsLHlZDGsEZJH3t3F7GVBD/o
	gawC/KdPoU3IXZELEjALLCd+tXIKUB/2l9nGOiLZagS/1E0h1YdYdOIkCxIs7DWD4h9Dss56L6m
	pM3IRfrciRS0q9lCSWwDl
X-Google-Smtp-Source: AGHT+IFYGJR6MaGA9mStiZCu12sHdYaIfhEEdv4L4LD7a8Gz8AbDnUs0wl5OiasTPmssNSG5qpwPOw==
X-Received: by 2002:a17:90b:5212:b0:311:b3e7:fb3c with SMTP id 98e67ed59e1d1-3159d8fef6dmr3122724a91.31.1750414705069;
        Fri, 20 Jun 2025 03:18:25 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([2401:4900:8fcd:fb65:ad27:6b54:185c:e7fc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a227253sm3919952a91.3.2025.06.20.03.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:18:24 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [RFC PATCH] usb_wwan : add locking around shared port data in two FIXME-marked places
Date: Fri, 20 Jun 2025 15:47:47 +0530
Message-ID: <20250620101747.39037-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two locking-related FIXME comments by adding a mutex
 to protect shared fields in `usb_wwan_port_private`.

- In `usb_wwan_dtr_rts()`, access to `rts_state`
and `dtr_state` is now protected by `portdata->lock`.
- In `usb_wwan_tiocmset()`, access to `rts_state`
 and `dtr_state` is now also synchronized with the same mutex.

These changes prevent possible data races
and inconsistent state updates when the port is written concurrently.

Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>

---
usb_wwan_chars_in_buffer() have this:
/* FIXME: This locking is insufficient as this_urb may
		   go unused during the test */
How can we do proper locking there ?
Do we need to lock portdata in other places also ? I see no other FIXME related to locking

Thank You

Regards

Abinash
---
 drivers/usb/serial/usb-wwan.h | 3 +++
 drivers/usb/serial/usb_wwan.c | 7 ++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
index 519101945..3cc0d4ef4 100644
--- a/drivers/usb/serial/usb-wwan.h
+++ b/drivers/usb/serial/usb-wwan.h
@@ -59,6 +59,9 @@ struct usb_wwan_port_private {
 	int ri_state;
 
 	unsigned long tx_start_time[N_OUT_URB];
+
+	/* Locking */
+	struct mutex lock;
 };
 
 #endif /* __LINUX_USB_USB_WWAN */
diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
index 0017f6e96..4bd81b21f 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -80,10 +80,10 @@ void usb_wwan_dtr_rts(struct usb_serial_port *port, int on)
 		return;
 
 	portdata = usb_get_serial_port_data(port);
-	/* FIXME: locking */
+	mutex_lock(&portdata->lock);
 	portdata->rts_state = on;
 	portdata->dtr_state = on;
-
+	mutex_unlock(&portdata->lock);
 	usb_wwan_send_setup(port);
 }
 EXPORT_SYMBOL(usb_wwan_dtr_rts);
@@ -120,7 +120,7 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
 	if (!intfdata->use_send_setup)
 		return -EINVAL;
 
-	/* FIXME: what locks portdata fields ? */
+	mutex_lock(&portdata->lock);
 	if (set & TIOCM_RTS)
 		portdata->rts_state = 1;
 	if (set & TIOCM_DTR)
@@ -130,6 +130,7 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
 		portdata->rts_state = 0;
 	if (clear & TIOCM_DTR)
 		portdata->dtr_state = 0;
+	mutex_unlock(&portdata->lock);
 	return usb_wwan_send_setup(port);
 }
 EXPORT_SYMBOL(usb_wwan_tiocmset);
-- 
2.43.0

