Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686319D07E;
	Wed, 25 Jun 2025 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863759; cv=none; b=aosMqpvhIIoiHZM3nNk4HausR+S5r63TBEu3Vnekxd0VopRw75/fuyawbz/FLZRUThpEF9nuP66XtAKtNwCVpwhyf92+8OfKqrpwlShPXoXsi1+N+S11n/jp8J8GYwe5ps23iJxBSIrvegDRUg9iHaUebiUmXIQKN2JcVTGJ2UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863759; c=relaxed/simple;
	bh=WSAs/XlrvMWOmX/zE5KdDXxcjmxX0zhDxhinjFuFuC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2EKisAkVaWO9J9I5oJOIAmRpY2N5lJNf5uMVL+Cl8Z4DlunGQBqR50rocH0qammSEG68qIkm7eWkQnreT3cW1F/iL6r5PGwaDYZPKEBLAyIXTCXHgsgiZ0dlUMaueoKQ0WppiKu1N/oF39ZTNuFtQtFrpHEu/7kzFVxiQNvAUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEAheYkO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEAheYkO"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so932798f8f.3;
        Wed, 25 Jun 2025 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750863755; x=1751468555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QamFA6yvN7ODtshGR3J6pQWh2DuwAqjt13u4C6QWdt4=;
        b=HEAheYkOqSbtghpew83T8rnjmZVFkK4bvNjkJHzfmUGHDfNDsuRVU/s4t14qnTEFNb
         p5IGwBBlF8C7hyEayA73EBGjyM97sXHe9/uFlYkwqiHkFV+XHeji4BvxKaIGKUdiZZC4
         ax/ckE4E/2zuVyOIKj7PSTjfmxt1nuAY22Z0ZvbYsNkFRnf01rgQ4Y/DpRq36hRUEl8O
         HROBOkc0OqelMD0uTjPyl6KI5bIYz3K8tRoFQbybjfIVMr1TI7YxaDJuoYLTooJ/rfRN
         ju7laAWARREZou/4OL0ivgNEB0HpPLymhKw8S/bf1KyjCXN3za4sCEeoUS1AQ5xbDgLq
         AZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863755; x=1751468555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QamFA6yvN7ODtshGR3J6pQWh2DuwAqjt13u4C6QWdt4=;
        b=FhbTjbBpmzHrd1rRqCHC9wWI5R/9tiQErRk25541CAgr/UQLdzlefUW1Y0Ubum6Rmt
         RB9SEHfD81RhLHB8wFiDULphdNEbbR0LBydLskvihjyJCS1uhL+Lvea73g7v6kvN09Dl
         XMMyUaCYW0qGti7rpCQtg3nnBb6nkEvIJRqXBKEYnCukprzQiIma9gAdIIsRYZwK2gvq
         7nLSzYZiskqTcuGne+MbKUYhPDArLNdXzDdN974vwHENw9N8qf7/IzRr4walj8Elz4XA
         Gv2eVURVW/v2toui39moRrsrJsry8lfAx4HtqN+ZxDytXBmWVZsctZEZ9RlaznSR787Q
         Rvaw==
X-Forwarded-Encrypted: i=1; AJvYcCUII6VZC6cj8wpsd+O6wu6Fa+42C8r3FO34+R7Tayyq9fWF/UfB7abQ2hmt+HV344DhLxZNe8pnSE0=@vger.kernel.org, AJvYcCVayjjb3xwfpwzc0O+SYq2TFffo70pgVNhbWlR0uuDPe/mXYLcowtxc7tX0MMUsThJvBdbV230bc34gvJsW@vger.kernel.org
X-Gm-Message-State: AOJu0YwXpk1AN+4VIEOLUnj61KWZkgbKmmHvodjvWbPEd9DMe3778nuN
	uu+jcXASYLP0zEis8S3zaJxOBCDsVTat+TBxnj31vj7MPAcy37WIxsA=
X-Gm-Gg: ASbGncvjr97ELB/c1BINSJu6iEq9xTrNwKWh4OaFf6R3Sd8PaKJ8woZMHLo1RpRWmDc
	lZ6vFND3h+MMp57QZTWifAcCalrRscz+hhbjqRYIXrTJzN1yseZnWE/4Etyw3SwK5bQ/8QtfaVd
	VI3H3ZhZat02CAKF7NBSmuvqj+H5DEunBrw75zkXNlCdnIzkXWnZP5GtpkNMsR22lzqJnuY/Tym
	A4MLV9aFcgD3m+UXJuMdutsAu595UPUllKNaUb3V90c/eSdTLf6r9GMg6uLC5nsY1RvLdTfwWny
	THvNCXV22YKSuXqlPC00vZ1MtRBMGSScI31hGGJA14o5J2oRbPwmM98XnVd7WnG/JDtKFKuvKqi
	6+k/s2tEVnStkNEKhJFGDy1PpjFnReQ==
X-Google-Smtp-Source: AGHT+IGEBBqo8CTkqEBEYNyvmiu/os9UVuTbwz2AcxEeNVTUJsIKircUofrp4w17i/bjIq2dnNMIQQ==
X-Received: by 2002:a05:6000:230d:b0:3a5:324a:9bd with SMTP id ffacd0b85a97d-3a6ed608ffdmr1076168f8f.2.1750863753744;
        Wed, 25 Jun 2025 08:02:33 -0700 (PDT)
Received: from localhost (238.red-80-39-144.dynamicip.rima-tde.net. [80.39.144.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c749sm23165795e9.4.2025.06.25.08.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:02:32 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	DOC ML <linux-doc@vger.kernel.org>,
	KERNEL ML <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: replace git protocol for github
Date: Wed, 25 Jun 2025 17:02:31 +0200
Message-ID: <20250625150231.241687-1-xose.vazquez@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

It was removed time ago:
https://github.blog/changelog/2022-03-15-removed-unencrypted-git-protocol-and-certain-ssh-keys/

Cc: Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: DOC ML <linux-doc@vger.kernel.org> (open list:DOCUMENTATION)
Cc: KERNEL ML <linux-kernel@vger.kernel.org> (open list)
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 MAINTAINERS | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 23840fc19199..c4672371609c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -158,7 +158,7 @@ S:	Maintained
 W:	http://github.com/v9fs
 Q:	http://patchwork.kernel.org/project/v9fs-devel/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git
-T:	git git://github.com/martinetd/linux.git
+T:	git https://github.com/martinetd/linux.git
 F:	Documentation/filesystems/9p.rst
 F:	fs/9p/
 F:	include/net/9p/
@@ -2521,7 +2521,7 @@ M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://github.com/ulli-kroll/linux.git
+T:	git https://github.com/ulli-kroll/linux.git
 F:	Documentation/devicetree/bindings/arm/gemini.yaml
 F:	Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
 F:	Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
@@ -2727,7 +2727,7 @@ M:	Vladimir Zapolskiy <vz@mleia.com>
 M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://github.com/vzapolskiy/linux-lpc32xx.git
+T:	git https://github.com/vzapolskiy/linux-lpc32xx.git
 F:	Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
 F:	arch/arm/boot/dts/nxp/lpc/lpc32*
 F:	arch/arm/mach-lpc32xx/
@@ -2893,7 +2893,7 @@ M:	Romain Perier <romain.perier@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
-T:	git git://github.com/linux-chenxing/linux.git
+T:	git https://github.com/linux-chenxing/linux.git
 F:	Documentation/devicetree/bindings/arm/mstar/*
 F:	Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml
 F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
@@ -3813,7 +3813,7 @@ ATHEROS 71XX/9XXX GPIO DRIVER
 M:	Alban Bedel <albeu@free.fr>
 S:	Maintained
 W:	https://github.com/AlbanBedel/linux
-T:	git git://github.com/AlbanBedel/linux
+T:	git https://github.com/AlbanBedel/linux.git
 F:	Documentation/devicetree/bindings/gpio/gpio-ath79.txt
 F:	drivers/gpio/gpio-ath79.c
 
@@ -3821,7 +3821,7 @@ ATHEROS 71XX/9XXX USB PHY DRIVER
 M:	Alban Bedel <albeu@free.fr>
 S:	Maintained
 W:	https://github.com/AlbanBedel/linux
-T:	git git://github.com/AlbanBedel/linux
+T:	git https://github.com/AlbanBedel/linux.git
 F:	Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
 F:	drivers/phy/qualcomm/phy-ath79-usb.c
 
@@ -3886,7 +3886,7 @@ F:	drivers/net/ethernet/cadence/
 ATMEL MAXTOUCH DRIVER
 M:	Nick Dyer <nick@shmanahar.org>
 S:	Maintained
-T:	git git://github.com/ndyer/linux.git
+T:	git https://github.com/ndyer/linux.git
 F:	Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
 F:	drivers/input/touchscreen/atmel_mxt_ts.c
 
@@ -19713,7 +19713,7 @@ L:	linux-pm@vger.kernel.org
 S:	Supported
 W:	https://01.org/pm-graph
 B:	https://bugzilla.kernel.org/buglist.cgi?component=pm-graph&product=Tools
-T:	git git://github.com/intel/pm-graph
+T:	git https://github.com/intel/pm-graph.git
 F:	tools/power/pm-graph
 
 PM6764TR DRIVER
@@ -20104,8 +20104,8 @@ M:	Haojian Zhuang <haojian.zhuang@gmail.com>
 M:	Robert Jarzmik <robert.jarzmik@free.fr>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://github.com/hzhuang1/linux.git
-T:	git git://github.com/rjarzmik/linux.git
+T:	git https://github.com/hzhuang1/linux.git
+T:	git https://github.com/rjarzmik/linux.git
 F:	arch/arm/boot/dts/intel/pxa/
 F:	arch/arm/mach-pxa/
 F:	drivers/dma/pxa*
@@ -22867,7 +22867,7 @@ M:	Casey Schaufler <casey@schaufler-ca.com>
 L:	linux-security-module@vger.kernel.org
 S:	Maintained
 W:	http://schaufler-ca.com
-T:	git git://github.com/cschaufler/smack-next
+T:	git https://github.com/cschaufler/smack-next.git
 F:	Documentation/admin-guide/LSM/Smack.rst
 F:	security/smack/
 
@@ -25209,7 +25209,7 @@ TRADITIONAL CHINESE DOCUMENTATION
 M:	Hu Haowen <2023002089@link.tyut.edu.cn>
 S:	Maintained
 W:	https://github.com/srcres258/linux-doc
-T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
+T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
 F:	Documentation/translations/zh_TW/
 
 TRIGGER SOURCE - PWM
-- 
2.50.0

