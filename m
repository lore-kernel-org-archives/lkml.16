Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE402609C0
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135046; cv=none; b=YCcQUJEIZB2UHPVWnPwDarRMKaMWntq8N+5ymiYyPt0oYNBZ6w6lfuLJk7lP+u+LXMDgVovyJRtfj9R8EhiOSYnjyRcZULRnRzlT62FQn/7sbvpCIuDMb+doIslHpE7mGBcw5kbom4lrWwZ5tZyvR+PtPVmGKFt/6BL5Z5pi3q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135046; c=relaxed/simple;
	bh=fVYrTnV4596MY4xP2V30U8n3S+cujdL2K1rYUrXul6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vFJxj24SlqExP4r2U6iWnk7JLd6VT1CwA5tiz4diX+7iV8ah7raOIsDPnwZ+Fy2k/9FdZtvzzcWBJZOnBPW2qPJIGlE3dpBQPalwZ2TFcuont0sTyPWo2DSERuc0k4Ku8q07YFIEn6wVMD7jQKN3LaJmVBuffvs0OcSwyYFUkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL7VUtc1; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL7VUtc1"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so2055824a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135043; x=1746739843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++LiMK+jPbWovw+5sDKphiLRP3X5ThooPqXEgIEf/wU=;
        b=mL7VUtc1hJDGct4hruBRLUWC6KaFyqK0/hNxFvd1JifgfvPYOa5X5/NJHAWcTBLyoE
         pWPyMaHWD7A0VkMSLBNBqpN/1zk4GewOQzHXuZRk2SEsYpAwZTE9B3Kf7xDtAsa7JfAT
         SsTBpl3SGQV3TEUC6tb5MgG7BIkNPNAyB0RrATHZ0kbIezRuf7rW4C0U4UCPMGu0zjPA
         Q48fMyv7IlC+bDXIntqrpTbTM4XU9AEaJikEdTk/MDJMiYWzM6EaPXy7lYHMewxmt8vX
         G9E7Tz+saqHfEfqy08UYNaa69pWBeFZ88CnlxRNvUpykogV3ZNSFI84AGtzhnUjLxPd0
         fqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135043; x=1746739843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++LiMK+jPbWovw+5sDKphiLRP3X5ThooPqXEgIEf/wU=;
        b=sljf/KT47Nb2k0Bb1sOBN+Q4TZ1PT0KNWXfHlZUg2rbNu28aJ/QMY5c4IC3lkgjMJj
         4yNXmetlNzVmSN3joOY4ysQPxusF5AnTBoJN5EVuRbM5wFCn+AXs9TlVV/zNz57N1/F0
         9CCqWfo5E1EPhjMxoFZwU1IOfef9d3cMdtc4Kydtc8gfy5WhstbxF64Xu01eLz8yTUOS
         kH3Dcv55vpwx6KCY0mM8BvU9965jiRf5TDj/QCvBheauKXL7fBB49vATRaIUOwv1+Np6
         8eCWE8iQEgVWPKuiPYZvSKmAVacyfsMhU8W6e+3kMdPKB9lB9SKkTwJCtVcgdy00HNg8
         nrxw==
X-Forwarded-Encrypted: i=1; AJvYcCXVEAzCRdri+lIMeXF9UJ3pxxgI6fihEpibz9xNObXdDPKx3tQimEg2PXoRXtMgwBl6p0GcDWjHO1daG80=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWiwBoNS9Kc5Dsue2olGNnpiPlMcw83st6MO2S42XmeslJYouU
	LjkcnwkFPPFE6OAKWH0owYhxkQ+SG+7+2wY6YRP2spAPiL4uVtoW
X-Gm-Gg: ASbGncuqnoU/3bxeAi5MHoD1T7svdfTCkWjcaZtt9gU4REPl7LXcFkT2hIBZSW6utyv
	cfAcm2K13rIOhA+n4NjSFujRSlNt5tWu5xgL6Gj0udQtc1i4J73tKkPAMFwkscYJwX9gDYi9ASV
	eBk5S+OKi4EkC63t7VZaHR7mNRBGENIG66ksPWyayLNmA17SQHZYP25IcyU7WoKh5CcpRVeFkKt
	eJGEtRWQKVo2BjnZeT8mcSqfqUQYYoFoeTJlYtjUy8ZoubuFsrqYEWYFr+f5r8SEbiXSrxoG5fj
	IXdNYhIuajhm97dn3R1PtDq7vgtJQ8C0NqnJmNVIlKa3CFlaoEzaXyNqi+zl0GtCSrwBvFlJZJI
	Yo998+vu5dtGoicULLWzdR9rTP+y7pijJ3uAHpsF6bqEmZ912r9gZtTeFprIPOrk8TVlTWwiL2v
	/kig==
X-Google-Smtp-Source: AGHT+IHGzNWQi9IaRBS+T9Q4dLFoyLyqFwYD3k3LrzonB4SsYe0hPBZHiar4FKK9vFlty1E8tA4Wvw==
X-Received: by 2002:a17:906:478a:b0:ac3:8537:904e with SMTP id a640c23a62f3a-ad17af78ffbmr62529666b.49.1746135042771;
        Thu, 01 May 2025 14:30:42 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:42 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 6/8] Staging: gpib: Updated return type for `request_system_control`
Date: Thu,  1 May 2025 23:30:35 +0200
Message-Id: <066ffcdbdefc54557c690c0c5a663695c198897b.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function `ni_usb_request_system_control` used by
`request_system_control` now returns int.
Reinstated return values by removing comments from previously
commented-out return statements.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 9f1b9927f025..a41e4f472d89 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -1049,7 +1049,7 @@ static int ni_usb_go_to_standby(struct gpib_board *board)
 	return 0;
 }
 
-static void ni_usb_request_system_control(struct gpib_board *board, int request_control)
+static int ni_usb_request_system_control(struct gpib_board *board, int request_control)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1059,7 +1059,7 @@ static void ni_usb_request_system_control(struct gpib_board *board, int request_
 	unsigned int ibsta;
 
 	if (!ni_priv->bus_interface)
-		return; // -ENODEV;
+		return -ENODEV;
 	usb_dev = interface_to_usbdev(ni_priv->bus_interface);
 	if (request_control) {
 		writes[i].device = NIUSB_SUBDEV_TNT4882;
@@ -1091,12 +1091,12 @@ static void ni_usb_request_system_control(struct gpib_board *board, int request_
 	retval = ni_usb_write_registers(ni_priv, writes, i, &ibsta);
 	if (retval < 0) {
 		dev_err(&usb_dev->dev, "register write failed, retval=%i\n", retval);
-		return; // retval;
+		return retval;
 	}
 	if (!request_control)
 		ni_priv->ren_state = 0;
 	ni_usb_soft_update_status(board, ibsta, 0);
-	return; // 0;
+	return 0;
 }
 
 //FIXME maybe the interface should have a "pulse interface clear" function that can return an error?
-- 
2.34.1

