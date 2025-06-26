Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571F2ECD3E;
	Thu, 26 Jun 2025 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951931; cv=none; b=DGO/QaX34ZaFnrHr5jobjk/wvVtMJ8fZ6YwXT+XSzFV39faDys5g2h5J/pUYlf3qwIKJJIOgDxIdna9cYuFKVVqmmm5cpbhIj6wnu3fPpGgsPLmyoVKM+aMfW/vt/6vCHIC25YD4oSnrnAjD//iA+qgMz6Lka6b6AHxWR2K5fnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951931; c=relaxed/simple;
	bh=9cBzVZrNtKrfd33efqkWagZMjsWvvlG6F/Mn2eyIc6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZlXBaUX6PLGjKltCMcKStLml+1eLL2URgj88foA9/QoTAazXRIIBZSklika3DtoKXYU5RJITH+ltIz/oobTHpc4KEdD+WhIJu+Ow/pku6vTGQIoJIa6WjkkVDBZRaLR7pmoXG2YBeCnMaxmhqbz6BkHvVi6DqMXtC2/f2of+vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKFFjvGl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKFFjvGl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1330111b3a.0;
        Thu, 26 Jun 2025 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951929; x=1751556729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOPju5AumU2Kn0t+yuh195AN33tJhLKQXSfJHeANdZI=;
        b=bKFFjvGlw5i/Oe5DMEMUGH7Z9oxlwmwRKoRi17TGM4g/bygPxXhrh3H9ldqgnrQ2Ie
         hqQ5B5lvb1KnWTQvMaSwMzlNpOmqQ4HVZquH6htqpGnmVTr+4jbZWIWumlK3RWu3m5Lz
         3NctjxSzBGWSmwoj8a5R3qZhX0g3vmclsaPlq7tHQrFTI8GIT6WpvdVOIDPvWrQJT2nB
         xo0IUJMcBwJ4XU6M1OFGTcK0f3d91S/hwWPEVYDyQV6aAhqYR9ScT7db3ok4Il/TE5Tz
         vG5alV6xCDFVM1BmemQOg1zhsHRRtEqQHJ0xGcECSLRQRmtxI00KtwYhFSoYAJwXiWva
         7qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951929; x=1751556729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOPju5AumU2Kn0t+yuh195AN33tJhLKQXSfJHeANdZI=;
        b=J6+8J/R102+RkuEWnRG1E/crmRsC/YQ7C2SVMt1Ja0gf8zsGn91JdC+hsaSRUvpjg4
         MaSZV0fLxk+MHXCxE3RD2i8QuiDYHtSchVs6OuOdWKEeuMk/cA1E9jn/U9OjyFe7B333
         Kw2EmrVs2ZPt+Y1w+MkGwzmf7cgrkfgt2thnTCKZ8s6z6e/iVZieUAx724A3ugZZEz8l
         7nyxG1R19yYHUkvgj0dyL0m/3G0r25lwEEQlLj9p8pQnnkQc3HZ0dUyTrteA89ai7OIf
         XCrE32vpAY6ROBNaN1TvYjirVTcrgNnrOEsHWywfqL96Jh0CTaCqyw41/td/W41o70LR
         SEgA==
X-Forwarded-Encrypted: i=1; AJvYcCU+xESvuSgbBlnIS/qkM7J3WBXMK0t7J9A92LOId72mAVXCiS2z9ALphPDFTnSh96cdHDCrRy6jWmjXpP8=@vger.kernel.org, AJvYcCXHzGqXtsJr4Vl4+Wrwjus+C1qEwf4aoSm6N1wGswMsqAkfgSKn306ooT46aFxfttQ5tUHFU6djKJgO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrmrvli9UUEiDi4LsMwUi4G+ILjGnRjWsfit92cTtNnNxbLSvk
	3ygxX6Kw0UhUcE9nv+jmfKoRMKnDf89cmKwywhJnHgIkHwftYvZqWhud
X-Gm-Gg: ASbGnct/dtyFhDfECayYYxLMJKypJKSiQA0hfDddr8u3vv++KIQtaGfA94eNTYL8Dqx
	5EGj1TcUjKY9Un9lyfdk2LUMHR2p4sVZMT2MV7F6H+WifeVDAII+98ED8Rd0XrnJtfzx6e7EstI
	rj/X2RIHV0pvWE7JgLTrsyKL5tJlRUn4OibnY6p44Sw1+g5TGG8dBGwna4vo9veAyzopPT9D8MF
	KFqZiBAxY3eX30gbEqw028L+SlBDfZgR1MCgiJlFPlkc0MLJTC0VCC/TtnuhrSJ2iKeMRHLqQLL
	NXIm72Kf2Qy+n87y81CaU6pNLNpyNEph0oml9NcjYLh2xK/OeBS01+W1z6GxcaDHQhq+uO3cX7f
	WGxV5g4bIt/gkO3L9VQ1a
X-Google-Smtp-Source: AGHT+IGKqAPTE+91pLgSVbkrh/0uvi3JsBdef2MyY88JBpFky3mK+FDQw7En9IeOx8upC2PzlOgl2Q==
X-Received: by 2002:a05:6a20:7d8b:b0:215:efed:acfc with SMTP id adf61e73a8af0-2207f14d5f6mr11290030637.7.1750951929356;
        Thu, 26 Jun 2025 08:32:09 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([2401:4900:88e3:29c5:7a4e:6494:9023:72af])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c44b4755sm1976776a12.73.2025.06.26.08.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:08 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: oneukum@suse.com
Cc: abinashlalotra@gmail.com,
	abinashsinghlalotra@gmail.com,
	gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: serial: usb_wwan: Fix data races by protecting dtr/rts state with a mutex
Date: Thu, 26 Jun 2025 21:01:56 +0530
Message-ID: <20250626153156.50131-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f2419bb9-2d81-4a6d-838d-b404e3ce7786@suse.com>
References: <f2419bb9-2d81-4a6d-838d-b404e3ce7786@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two previously noted locking-related issues in usb_wwan by introducing
a mutex to serialize access to the shared `rts_state` and `dtr_state`
fields in `struct usb_wwan_port_private`.

- In `usb_wwan_dtr_rts()`, the fields are now updated under the new
  `portdata->lock` to prevent concurrent access.
- In `usb_wwan_tiocmset()`, the same lock is used to protect both updates
  to the modem control lines and the subsequent `usb_wwan_send_setup()`
  call.

The mutex is initialized during `usb_wwan_port_probe()` when the port
private data is allocated. This ensures consistent state and avoids
data races when multiple threads attempt to modify control line state.

This change resolves the two old `FIXME` comments and improves thread
safety for modem control signal handling.

Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
Thank You very much for your feedback .
You don't have to say sorry , your feedback
is valueable for me.


v2 :
	initialized the mutex during probing
	droping lock after returning from usb_wwan_send_setup()

Regards
Abinash
---
 drivers/usb/serial/usb-wwan.h |  1 +
 drivers/usb/serial/usb_wwan.c | 12 ++++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
index 519101945769..e8d042d9014f 100644
--- a/drivers/usb/serial/usb-wwan.h
+++ b/drivers/usb/serial/usb-wwan.h
@@ -59,6 +59,7 @@ struct usb_wwan_port_private {
 	int ri_state;
 
 	unsigned long tx_start_time[N_OUT_URB];
+	struct mutex lock;
 };
 
 #endif /* __LINUX_USB_USB_WWAN */
diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
index 0017f6e969e1..cd80fbd1dc6f 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -80,11 +80,12 @@ void usb_wwan_dtr_rts(struct usb_serial_port *port, int on)
 		return;
 
 	portdata = usb_get_serial_port_data(port);
-	/* FIXME: locking */
+	mutex_lock(&portdata->lock);
 	portdata->rts_state = on;
 	portdata->dtr_state = on;
 
 	usb_wwan_send_setup(port);
+	mutex_unlock(&portdata->lock);
 }
 EXPORT_SYMBOL(usb_wwan_dtr_rts);
 
@@ -113,6 +114,7 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
 	struct usb_serial_port *port = tty->driver_data;
 	struct usb_wwan_port_private *portdata;
 	struct usb_wwan_intf_private *intfdata;
+	int ret;
 
 	portdata = usb_get_serial_port_data(port);
 	intfdata = usb_get_serial_data(port->serial);
@@ -120,7 +122,7 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
 	if (!intfdata->use_send_setup)
 		return -EINVAL;
 
-	/* FIXME: what locks portdata fields ? */
+	mutex_lock(&portdata->lock);
 	if (set & TIOCM_RTS)
 		portdata->rts_state = 1;
 	if (set & TIOCM_DTR)
@@ -130,7 +132,9 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
 		portdata->rts_state = 0;
 	if (clear & TIOCM_DTR)
 		portdata->dtr_state = 0;
-	return usb_wwan_send_setup(port);
+	ret = usb_wwan_send_setup(port);
+	mutex_unlock(&portdata->lock);
+	return ret;
 }
 EXPORT_SYMBOL(usb_wwan_tiocmset);
 
@@ -452,7 +456,7 @@ int usb_wwan_port_probe(struct usb_serial_port *port)
 	portdata = kzalloc(sizeof(*portdata), GFP_KERNEL);
 	if (!portdata)
 		return -ENOMEM;
-
+	mutex_init(&portdata->lock);
 	init_usb_anchor(&portdata->delayed);
 
 	for (i = 0; i < N_IN_URB; i++) {
-- 
2.43.0

