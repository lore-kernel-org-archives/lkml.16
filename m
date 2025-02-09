Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516684C79;
	Sun,  9 Feb 2025 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739085593; cv=none; b=oghdwLICbgfCAcC4aQuhMChnSd76fmmZ2Ccy2r3EsUb5TtYpTCg9o4R/+Bv8Odozqhi1fjGpT+o64Ouhq7BkCjSpDJqThVmOzJYFFC5FQ6W6i7w28c9NBNe8+mNEh46SaTEISCHShN0xQUONQMblaZafyFH5gXLIXt0VJbP6Q0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739085593; c=relaxed/simple;
	bh=oyPECCN2DAU40f2vql43GXcHR5p+X/1lApzAq5e6U1E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ww63cTSEctbBBtx5J4GG8pyj8gG1QUWdgrRhtcRaEpWd9J140mS+DpHY/DeHmnLxC7qyY9WxdcjZV9ZMgw4pnm4umaf0n9+itfi82C2Conpq7dBxHHS6N8YUUavQdtlIwl4s0QSHEkYJnYdT+rGW6j0RXfewCDStot8sMVqMsc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxAKGXuD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxAKGXuD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso5343414a91.0;
        Sat, 08 Feb 2025 23:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739085591; x=1739690391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2cj7ha/gqP2f9kwW0+eEddR1aTP3HEi/s3Z64VeajU=;
        b=bxAKGXuDVudqvDRjkRrdytj8JY++LyLYSdTx3oLx951uxsYFClLyEexPwOW3SyR0CA
         7J1bjqrelw7/J9lg1i5DlZCuxcl2oToQvfogQHaiv4UnHUDer9thmc9tustZijg2pXUT
         P9qBjpr4Q4bOeiq1egNiKmhAUBkPfmhsL2DLlAquMMhP/h/6QS5BWPvp7sox3ICtfukH
         hNE0koIWNfyoWicJJjUjCdWT1Ehsu278PQYNUgIhvJg/ZTwZf9vQ0dvr/RVw5Xm+1OyM
         CyaPzx4ZwrDaW99o6pJP9CFO28wyxpbWKczvyGu0uUT6/qO9WZSrI3By6VrKdY0DGrl1
         L50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739085591; x=1739690391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2cj7ha/gqP2f9kwW0+eEddR1aTP3HEi/s3Z64VeajU=;
        b=V64V821tMcvA4Rmln/DqtZhookzUdifbV9Pkq9Pti8Fw2QuHToooCaiUsbfuh9KerM
         ZJ0XXr2jW8vGObkno3af36s4QmMd+i8dMWWG0/CF3H3aHeKxvyPuRWeI1uEoeoTwon1u
         INH/djV0jim9oBtt4YSTPdMaTv+B/y+bR9SQOFV5/ux0LaQUGl1+xc6w6zri9qcWIZOQ
         RI3PCD/0DutY2tqcas1/cCd6bmDp8NM5wm02ahMTZ/gxRg9l8kwtLDoBv0bvJ6oqCH+A
         baXYdUeDNHD08TuVMHKZLqXSPlQ8cQDnRyBHLJlq5AwPj57q9PsBJ26QvHxCgb/VD6Pu
         dHfg==
X-Forwarded-Encrypted: i=1; AJvYcCVWQ3rgqoGYHnDW5tXRQr86zepmTVOYdhqTKBMPoDz6H4lW/VPqL4CS2jujsO6u362irVH3Xi4J+Yp0@vger.kernel.org, AJvYcCX50A+7Nj4oMeLjYQoYfLdSJJniqtpMG5JsSJ9q/R4K/8NFL5RAd2nK/7gKBgbHr18nS+coZVMTZebYzLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxK4s4wqEmN0v/VZiHGKRm/McnDPxyOEQK5+WNTbBhfNfIw4cl
	eoYZThBUs4bQzh6z3+ywr4P4b/yEO5ZL1I0Yu4ITO1hAAOI0KB6YJMd7sGPVX6I=
X-Gm-Gg: ASbGncvC37fcsghHVhrfiYv6ZaMiEBdWqq28m3oNUWkryynRT5vmi9O/OGGbBlLysL+
	c51ZPChpHYAf4ELN3BaOYLLUwVTQzQgF9r5zpSB3c6n2dXya9jnpWEca0EWwMJqOUn05an8thLf
	Aay+In5ZBcmmFebNJYHLteDZ89nw0ydmWzahuBQPdvOAkqqXrfNxkYyozXBPqkmaN7Qv9+VarGd
	aKpEhoZH6PMUTjAdLjD3u2QsDsb0Y+Zlg2ThzGLmxho/AAnZANFMq9JS5TSXSzlvVlV7yl0gG36
	sO31yxvJk/QVimKSznRVlwU=
X-Google-Smtp-Source: AGHT+IEmS16rrJDZG1L9seci5kX1DAB5NhQflhsk7qQ9E/gF48nCKgfLHRl8CBLOYynsO+YNTyzynA==
X-Received: by 2002:a17:90b:350e:b0:2ef:ad48:7175 with SMTP id 98e67ed59e1d1-2f9ffb7ba83mr22981814a91.15.1739085591408;
        Sat, 08 Feb 2025 23:19:51 -0800 (PST)
Received: from localhost ([36.45.119.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650eca2sm55883925ad.19.2025.02.08.23.19.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2025 23:19:51 -0800 (PST)
From: joswang <joswang1221@gmail.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jos Wang <joswang@lenovo.com>
Subject: [PATCH 1/1] usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode
Date: Sun,  9 Feb 2025 15:19:26 +0800
Message-Id: <20250209071926.69625-1-joswang1221@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jos Wang <joswang@lenovo.com>

Although some Type-C DRD devices that do not support the DP Sink
function (such as Huawei Mate 40Pro), the Source Port initiates
Enter Mode CMD, but the device responds to Enter Mode ACK, the
Source port then initiates DP Status Update CMD, and the device
responds to DP Status Update NAK.

As PD2.0 spec ("6.4.4.3.4 Enter Mode Command")，A DR_Swap Message
Shall Not be sent during Modal Operation between the Port Partners.
At this time, the source port initiates DR_Swap message through the
"echo device > /sys/class/typec/port0/data_role" command to switch
the data role from host to device. The device will initiate a Hard
Reset for recovery, resulting in the failure of data role swap.

Therefore, when DP Status Update NAK is received, Exit Mode CMD is
initiated to exit the currently entered DP altmode.

Signed-off-by: Jos Wang <joswang@lenovo.com>
---
 drivers/usb/typec/altmodes/displayport.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index ac84a6d64c2f..b09b58d7311d 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -393,6 +393,10 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 		break;
 	case CMDT_RSP_NAK:
 		switch (cmd) {
+		case DP_CMD_STATUS_UPDATE:
+			if (typec_altmode_exit(alt))
+				dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
+			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
-- 
2.17.1

