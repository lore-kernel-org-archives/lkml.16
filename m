Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FB7291C1A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774196; cv=none; b=POFb3JwOB35sSdJDRGBmdqRhHMzR7Gq8xEEGfxIbB/HYeGPSiSbVyYkrry42euYO1w+1vgcN/lZ5+nVOcJNweTM/GqtSRSgI4cTDjpLzYk3abq45s37dchWwIaHAsPpxEqKVM+nVfJdx1W7Gly2+ox9OIHRdHCksEXxU2hRXiqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774196; c=relaxed/simple;
	bh=lC5cRjaojZ5t/DeqN4fUzCwenXZ0a0iWp5ap87muVhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Uaxr6sbSarfjZCQ3yKkj27h8UrgPkBhLdjww6aCJEdBZwaSdwZ+f9jX0bzMvBQHjvTOI1/Q+iMXUqKTc3SQ4oAZXJkcuo+7sdWIHVF2OjS/IONo6LtBvvrna8kbRnb7Y/rUwkLa7Yyeh3AfhYnk+T7BPoRv+hATpt1Z3Whw4lCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=SWvRsrU7; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="SWvRsrU7"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so688615a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1750774193; x=1751378993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur3pkSe32TVriqGAIz7br9BFdD6ELIY4joveCHedb2Y=;
        b=SWvRsrU72zhFSUL3An21JgXMNui1ef6wozDOevdKciWMA2Ho7t5vwQ/znPdcPUXTOr
         l2rGTiai4tIIMsOVjziV4sxp/WljqQdk1Yil2mP+f8PdH8ueE68kvCFbnrB2RFPcQgvD
         HBu2/mYGxwy5kNu7oxZ4jKOQZ1qraHHb9N5rD3hig1Wxw2D9yAGMSccpbSR3hLrU+VG4
         uzUrRXJzWZ6DBuXX7GQ9N9y0nfbN7osCEJZbvETOrbuWiDRuQvSdKU5rMbYJEOV0Codp
         W2sgVFP0guqMbRaoM4gNVc4g5FADYbWSg0a7id3bX0rIL8PdO3z/Q+SnJsZNrBV6DQNK
         lSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774193; x=1751378993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur3pkSe32TVriqGAIz7br9BFdD6ELIY4joveCHedb2Y=;
        b=DncMf3oWc3RcHXD/3O/HiJhCmWolaAd32D6XaVUOZLz4hvfu0TICRbTLqQ2i7NUMhb
         aYbzKuc4fO8PoV40MyFJpxxqlmxOGQQGWAZDH1TmxooUqCrtF5eeMcSnZYIQz7VBSCDa
         2m9kbUMm4MhjUdIIlgxfJg+p+hbt0B+jfQqXIQhAaFj/xM2MULHVos/TYPu2hvLrlRKq
         rIMu1CvmCpq6SK6uQz4iCqwQRlXZi8HFWfV/Zboz2rExt0Q65h2Wmc3oug6BFszvwpfF
         ebfL/7Efn8OWYSC8TjDoXJkgsd4XmvzKsb7scUKkx8H3IsjsghDQo+H3y+UffDycgPPJ
         zd8g==
X-Forwarded-Encrypted: i=1; AJvYcCWBeZEwyKWyEkSe+oR/1Bt+3Beu1h8ydt7gjF+HnexbCmz+ZPNscCAJZDEuMYX4D87+WhynUOPKpDnwIto=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLQhKEr9u3udr/Ch9ILsc4xDroJCDAVi04FXcs3eJNqGFqdzbI
	rZGWihDMeY1hxzZkkytbgEco6JldbDrFudEHU2X6MLZFbVbvNJXWqSwjM0g9ay9BzQ==
X-Gm-Gg: ASbGnctqvT2HuNUWfCQFhASjZV/o9Of871ZrBgYhPPV6wzEE74DCoBueqgY39yD/pgq
	IaegtCeRnPa5X4qfyfinFJEzOQDDRwZXaI56VW3y6QcCwiplExuWWTfBvn3YQTRoGm/sJXsp7NA
	RtZg6sx7VeN4/Zq+73b4MvCLe0wYwcjUl3SC/AB9+NxkOeC759J6dJKiXnioPrbHODnazgYZdZW
	lCYwyaHuF9zFeG7tA6Pc1S+rY6e9zfZ+hbOuYYmVObpnCPJOGj10OQLraKbQoNfQuMUnIOFHRTb
	O3pO0nC1q23npRNKpPzHYRJu1sqPHdua2GrmwiCwaEHdSMfyRb25MvW13IW48LzGvDNzVXdwKZ5
	MGU7tP4MYqnNMzxMrN4PyESa+Kkl6iQ6+DNNdH6E1eEnohJPYLYhaNdFxfOF0
X-Google-Smtp-Source: AGHT+IEEg7l4G6SUorjlq4/b8X8X+akKFfbR+kWJrhsVArb1J01hupz0jyLFc8JQcBOKyckjtmGZIg==
X-Received: by 2002:a05:6a20:7284:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-22026f162a1mr24443721637.20.1750774192878;
        Tue, 24 Jun 2025 07:09:52 -0700 (PDT)
Received: from system.mynetworksettings.com (pool-71-126-161-43.washdc.fios.verizon.net. [71.126.161.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e42ad8sm1982115b3a.70.2025.06.24.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:09:52 -0700 (PDT)
From: Drew Hamilton <drew.hamilton@zetier.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Hamilton <drew.hamilton@zetier.com>,
	Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Subject: [PATCH] usb: musb: fix gadget state on disconnect
Date: Tue, 24 Jun 2025 10:09:30 -0400
Message-Id: <20250624140930.25887-1-drew.hamilton@zetier.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unplugging the USB cable or disconnecting a gadget in usb peripheral mode with
echo "" > /sys/kernel/config/usb_gadget/<your_gadget>/UDC,
/sys/class/udc/musb-hdrc.0/state does not change from USB_STATE_CONFIGURED.

Testing on dwc2/3 shows they both update the state to USB_STATE_NOTATTACHED.

Add calls to usb_gadget_set_state in musb_g_disconnect and musb_gadget_stop
to fix both cases.

Tested against 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3.

Co-authored-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Signed-off-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Signed-off-by: Drew Hamilton <drew.hamilton@zetier.com>
---
 drivers/usb/musb/musb_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 6869c58367f2..caf4d4cd4b75 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1913,6 +1913,7 @@ static int musb_gadget_stop(struct usb_gadget *g)
 	 * gadget driver here and have everything work;
 	 * that currently misbehaves.
 	 */
+	usb_gadget_set_state(g, USB_STATE_NOTATTACHED);
 
 	/* Force check of devctl register for PM runtime */
 	pm_runtime_mark_last_busy(musb->controller);
@@ -2019,6 +2020,7 @@ void musb_g_disconnect(struct musb *musb)
 	case OTG_STATE_B_PERIPHERAL:
 	case OTG_STATE_B_IDLE:
 		musb_set_state(musb, OTG_STATE_B_IDLE);
+		usb_gadget_set_state(&musb->g, USB_STATE_NOTATTACHED);
 		break;
 	case OTG_STATE_B_SRP_INIT:
 		break;
-- 
2.34.1

