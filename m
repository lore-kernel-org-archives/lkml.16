Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5402C1465A1;
	Tue,  1 Jul 2025 21:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751406357; cv=none; b=V9dzb8KPvdM9jfvj8xg5Q2oKtJjtBCV4LG70qArOhbSYIZxJM6/JqQs+x4H9qgI3fnK4nF8sG+m/zWsEJ6a8MfAJ3ApLKOs8H2ELO27YdraOv6qEN53ChRu2xF/cxlK2OZXgTmk0AUC4xcrZTj3MTbbQMl8+3AXKBRjHqEZlST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751406357; c=relaxed/simple;
	bh=wLIl6wjv9qZK62mh9qcB0+hf3Zv/Vi5btL4SPdy+N1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aE7qb4lNMtdcXjFNhxi+GKP5ru/a2E7wON+YJit8MODZ7xi9OzFMCX7k8cjr1Z4FmlR3zgX6ovtDpeV/EmAd7C0KXGGT4uCj77iUxZ2mI3s9jEoCSWCV3Ziq+PNYKhiYJpdpFJfQtel7sxHVVfO4U1/2ku2C2/DCabW6gA3ev8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeDGGSiN; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeDGGSiN"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-749248d06faso6344810b3a.2;
        Tue, 01 Jul 2025 14:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751406355; x=1752011155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56uWvgX1GZPSULtDFX8jGEMGBZ+EASUKT10eiWNp9o0=;
        b=jeDGGSiNtK6VuEqGmL+qCNiYekABco0H6bNPVqZ3TncMv2StmTK6NVkid6urFbAthe
         iokzkqxHyXU4MvKpY+VOmKvsO6d63yNkGrZWJ5Q8hG/TZZ+F6blcVaTxSkBulAuhaYHj
         aHO4It6xZR4eoEy4gePJpAfQI5PT4qIW9adoXJNXYQOfXTQA5bl+YzHp40ydnsqFeobM
         czMoaFfq7n02E+VMPyWFHAG4LXE9K35HfHA2BeX4inZKkMtJNRz2eGEPqq+sVn9awFQm
         qNNYi9kAd0JC60g6G08SN+p2ukA1zXpTh70LZztXcve74yT6Mbe1/ok+POeZD+ZDpFAW
         byrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751406355; x=1752011155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56uWvgX1GZPSULtDFX8jGEMGBZ+EASUKT10eiWNp9o0=;
        b=wxfGBwNYZwhwGXwgr5rVY/N5ERXqwoknuF9TFVHOTZ7QOGgeE6g5cp0eIXOB8YykxK
         +B5qPZBzoAZfoO38zygLyRQUjTuXxy8bMAfF6r4Ht819nmE5Od4+LjzQLtlZwgtzooRZ
         KCN1MgYKTXTO+G/qqlLBvYkfklgQ5LoDIPBdaPMbR7gxrx9JJ7qvb7PI66CbmjQah2tU
         hA3AgaJ8PsVDm0G4WEdycsmF4IowQQD4SvRoJKwVyIPfM2LW3d0sLjnVE1GBkFa0/ndQ
         f5uCprXFxQSTqUBYaGZIT3bxV4isXupJhe+AlCVSHbIYJphELPhUGAxgun2sg80aLjyC
         0+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa3+V7ysjjSyQHl9nUYNW3F7ijhSDVmk3WGfcS8Xd6OrWsyBM37s3BDoRvK7hqjDqw58E8kzVlNBucLyk=@vger.kernel.org, AJvYcCVD2AwwYs2TL9XReGpxzasSyS3S2xX0Sj47A+/y699977ALxRJ6BLsFaWV5xY1rSmg3JwGFIDQUWjp1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4s0q4PTiOOfPA1iKrqUlO1HUsYviOnmNeRk0Bh+bKO7Y4irO+
	7LJXBK2FsXLM8rKhrIYZsawmmmgF5np0IEOoN9w4Z2w+DqQIoF4WQ8Oe
X-Gm-Gg: ASbGncsXRigZ7MANBIsoe9dgta9UIzKDLkvv5DcQYiCDOo/KZZfYautC5tPTDNWrFSg
	G1lQVQuolrK41d9oPCa62+8udcI8jEUF2PBKoOevPVi+egCCUPROrfxXtIXb0Qt9UghOWby4+EW
	Ng4mbjk2mhn1P2inGj4yeyT2FgUputqmTQsznHWhuROpa207aJ+rksyPB6N8nYvueG4ZJn7q/nc
	MU3BdPl5D0eEFhlr7iSVcxfOQFZ6FHWGKtcKHPBnyslJc8wr5sIhtftk2Z7M4xXJklGDy79cjgu
	uMkw9za/air+NeDhf1QMirB9l8YZN/OrjLoS10VHCkPTQkknGCEUToo6S7pLpT/uggjo3YaM1pv
	y1w6TP8lMyoR6u7C3DOXz
X-Google-Smtp-Source: AGHT+IFsFq4oeJLSYN3Z9KAPEGWIZkKkofdxqlHrJEK23rvGP8dMZGc+dV2BAXooJ1JiWFQwRrc88Q==
X-Received: by 2002:a05:6a00:2312:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-74b5104ce4bmr502787b3a.12.1751406355380;
        Tue, 01 Jul 2025 14:45:55 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([2401:4900:88f6:b5fe:79a8:925d:efc5:a1ba])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56d49aesm13078858b3a.139.2025.07.01.14.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:45:54 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: gregkh@linuxfoundation.org
Cc: abinashlalotra@gmail.com,
	abinashsinghlalotra@gmail.com,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oneukum@suse.com
Subject: [PATCH v2] usb: serial: usb_wwan: Fix data races by protecting dtr/rts state with a mutex
Date: Wed,  2 Jul 2025 03:15:32 +0530
Message-ID: <20250701214543.981626-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025062815-uninsured-twentieth-c41c@gregkh>
References: <2025062815-uninsured-twentieth-c41c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The rts_state and dtr_state fields in usb_wwan were updated without
any locking, which could lead to data races if accessed from multiple
threads.

Fixes proper locking using guard(mutex) to ensure
safe access to these shared fields. To avoid holding the lock during
USB control message transmission, the values are passed explicitly
to usb_wwan_send_setup().

This resolves two previously marked FIXME comments and improves
the thread safety of modem control line handling.

Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
v2:
- I missed the "v2" tag in the subject line earlier — added now, sorry about that.
- Regarding the concern about locking while calling functions: I was unsure if
  it’s safe to hold the lock across `usb_wwan_send_setup()`, since it may block.
  To be safe, I’ve changed the function to take `rts_state` and `dtr_state` as
  arguments, so it no longer accesses shared state directly.
- I’ve now used `guard(mutex)` so the lock will automatically release when
  `portdata` goes out of scope.

   Is this the correct way to use gaurd if we don't want the lock held during
   usb_wwan_send_setup() ?

> How was this tested?

I haven’t been able to test this patch due to lack of hardware access. If you
have any suggestions on how to test this kind of change without actual hardware,
I’d appreciate your guidance.

Thanks for the feedback!
---
 drivers/usb/serial/usb-wwan.h |  1 +
 drivers/usb/serial/usb_wwan.c | 29 ++++++++++++++++-------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
index 519101945769..5a990fc2e140 100644
--- a/drivers/usb/serial/usb-wwan.h
+++ b/drivers/usb/serial/usb-wwan.h
@@ -59,6 +59,7 @@ struct usb_wwan_port_private {
 	int ri_state;
 
 	unsigned long tx_start_time[N_OUT_URB];
+	struct mutex lock;  /* protects rts_state and dtr_state */
 };
 
 #endif /* __LINUX_USB_USB_WWAN */
diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
index 0017f6e969e1..042d63aa8ec6 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -38,19 +38,16 @@
  * Generate DTR/RTS signals on the port using the SET_CONTROL_LINE_STATE request
  * in CDC ACM.
  */
-static int usb_wwan_send_setup(struct usb_serial_port *port)
+static int usb_wwan_send_setup(struct usb_serial_port *port, int rts_state, int dtr_state)
 {
 	struct usb_serial *serial = port->serial;
-	struct usb_wwan_port_private *portdata;
 	int val = 0;
 	int ifnum;
 	int res;
 
-	portdata = usb_get_serial_port_data(port);
-
-	if (portdata->dtr_state)
+	if (dtr_state)
 		val |= USB_CDC_CTRL_DTR;
-	if (portdata->rts_state)
+	if (rts_state)
 		val |= USB_CDC_CTRL_RTS;
 
 	ifnum = serial->interface->cur_altsetting->desc.bInterfaceNumber;
@@ -80,11 +77,12 @@ void usb_wwan_dtr_rts(struct usb_serial_port *port, int on)
 		return;
 
 	portdata = usb_get_serial_port_data(port);
-	/* FIXME: locking */
+	{
+	guard(mutex)(&portdata->lock);
 	portdata->rts_state = on;
 	portdata->dtr_state = on;
-
-	usb_wwan_send_setup(port);
+	}
+	usb_wwan_send_setup(port,on,on);
 }
 EXPORT_SYMBOL(usb_wwan_dtr_rts);
 
@@ -113,14 +111,15 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
 	struct usb_serial_port *port = tty->driver_data;
 	struct usb_wwan_port_private *portdata;
 	struct usb_wwan_intf_private *intfdata;
+	int rts, dtr;
 
 	portdata = usb_get_serial_port_data(port);
 	intfdata = usb_get_serial_data(port->serial);
 
 	if (!intfdata->use_send_setup)
 		return -EINVAL;
-
-	/* FIXME: what locks portdata fields ? */
+	{
+	guard(mutex)(&portdata->lock);
 	if (set & TIOCM_RTS)
 		portdata->rts_state = 1;
 	if (set & TIOCM_DTR)
@@ -130,7 +129,11 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
 		portdata->rts_state = 0;
 	if (clear & TIOCM_DTR)
 		portdata->dtr_state = 0;
-	return usb_wwan_send_setup(port);
+
+	rts = portdata->rts_state;
+	dtr = portdata->dtr_state;
+	}
+	return usb_wwan_send_setup(port, rts, dtr);
 }
 EXPORT_SYMBOL(usb_wwan_tiocmset);
 
@@ -452,7 +455,7 @@ int usb_wwan_port_probe(struct usb_serial_port *port)
 	portdata = kzalloc(sizeof(*portdata), GFP_KERNEL);
 	if (!portdata)
 		return -ENOMEM;
-
+	mutex_init(&portdata->lock);
 	init_usb_anchor(&portdata->delayed);
 
 	for (i = 0; i < N_IN_URB; i++) {
-- 
2.43.0

