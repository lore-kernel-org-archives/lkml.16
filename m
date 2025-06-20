Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3E228C99
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406801; cv=none; b=BP7Nm7ZdhcpL7OHTNl8YJBU5wK0k69Lk+qQeNtVR6dGDS8NqcXmKwNcSjf3TqJBMD6YgdylyisIEBPA+mFJAa5h8rCYwCJSxaG0xAXnuW9GuLibqcz/rxKJC38yJKwMSmMDft34rAp87PfCgWucLZxM8W0Z+ANqb7PCuTfUVxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406801; c=relaxed/simple;
	bh=RpvvMj/K5uVzGiJH1mIG91vdZyDBkvd7mqNAf+vhWvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7OmomlRJjSxpf/wgpvfoQHusNLv9n4ItOc79B0MHVFrHDJtDdrP8NbIAL+N4vm9W3vQ6hjr+UnOHPjj3wZeiQzB3XFzncqYxrhLIOjQqmF9FRjibW2xwcRsTk6sO4HQOsHdZfI/h2MpIl5NW7r1ZkFo34tnz3oxX1WVRYeqwh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XgS82+Pg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XgS82+Pg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d54214adso11494785e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406798; x=1751011598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=XgS82+PgXDPKuxnmMeX261Rx/9Cp1JA1cSjG0FGbj5nGG5tK5bWURWIlcVmZ/N6QY/
         4Sm07TpDIKGU4G4f4ZikY1p0uocMMtPgSA/NODmz+UctftyH5/FYbyxuwBTJeQ+hUjFN
         hJ4qbV/td30M0fUavsGVrrtDMH780PP9rdIyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406798; x=1751011598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=TvvIZBD1omH29617WAsp6c4odqOJTyeJCUbeBW7osc80w8ol7AwhN19QF1zu9WLKlG
         Jnckw5Nyk6HgG8d7Nm3KqVju69RS/Ud3Xh3O1gNjGPQ03jhc55Nw7zwtP9HtU/ZLiH3u
         Hrm6yHa3Bq1pWhhWmbYhvQMDfkr2xjo1K/WihbrX5ie1etVUraetozr+OtGoEpvfD6FN
         cxEy+p9lek5hJxYwMChty9pHDddn/VL6T6M0Ap2j1Ukl5LwmrlLI4jYBVMGxFImkBMpx
         1fsvDEtwCQ1s6j8nVwg8B49E8T1yHhgMr5MX27yKy97At3vd0J6H0cRI8jN2xwAJDXRl
         FcGg==
X-Gm-Message-State: AOJu0Yz33ElGhqDBv8E4i6WGkZq4ZViUpEVMmf+p9eBUcocr5rnLS6lk
	FaJlOLr8vCcexHlcfppDUhhu9Rsz5lslaS88YRt7AJBuT7zs5VP3COqmtkenqmLqThVwbCUEy3t
	wYIO/
X-Gm-Gg: ASbGncsi0sLR6KC7fX3OJiHRl9UpsiP3AQF18aKNHEX9cuo90TNVFhjMQ5v4BpatN4E
	l+8AuzN/8QS10H+d7VFHqf4/WuPej4wyKJOSTk2nG2ionfldIkv3gUAD4efKGRuOb0cuu/ly+so
	B6x803jk1T64BS70sWATTL8xnOp5PbOWA8iYyRiQoap8YXAm+G+duvqgrgU+QbGmv1rvhAO+AOD
	+/MPjLtMHsXf8gO0VmLARmoRroAAjyjtZwhI9D7M93xjhkPVT8LjA2A35b0qk5FTUcDO7CAAr8W
	f+/I5N+9sqG/ovFAMnXEd4X84QVb3ySD5fu8aNj/p73sYczCIBow4rNQb+w3Iqrz9hf9uumOl7e
	XVN+/NIaOQhJEJFmmLpXr2xXybhxu9avNHpgBz5r3BY/UXLp4fRo2
X-Google-Smtp-Source: AGHT+IGb4WTKjAgplBaJ43AcvLwV9rDMcYvZ4FV3Nqt1/QYZAA9vX0TgK6mvlDJ83u+kYk4oGRTS0A==
X-Received: by 2002:a05:600c:3542:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-453659edd18mr14377475e9.27.1750406797641;
        Fri, 20 Jun 2025 01:06:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/5] ARM: mxs_defconfig: Cleanup mxs_defconfig
Date: Fri, 20 Jun 2025 10:06:20 +0200
Message-ID: <20250620080626.3580397-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generate mxs_defconfig by doing:

make mxs_defconfig
make savedefconfig
cp defconfig arch/arm/configs/mxs_defconfig

No functional change. The goal here is to cleanup mxs_defconfig file to
make easier and cleaner the addition of new entries.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/mxs_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index c76d66135abb..91723fdd3c04 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -32,9 +32,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_CAN=m
@@ -45,7 +42,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
@@ -60,7 +56,6 @@ CONFIG_ENC28J60=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
-CONFIG_SMSC_PHY=y
 CONFIG_CAN_FLEXCAN=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC95XX=y
@@ -77,13 +72,11 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_MXS_AUART=y
 # CONFIG_HW_RANDOM is not set
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MXS=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=m
 CONFIG_SPI_MXS=y
-CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_STMP3XXX_RTC_WATCHDOG=y
@@ -138,10 +131,6 @@ CONFIG_PWM_MXS=y
 CONFIG_NVMEM_MXS_OCOTP=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
-CONFIG_NETFS_SUPPORT=m
-CONFIG_FSCACHE=y
-CONFIG_FSCACHE_STATS=y
-CONFIG_CACHEFILES=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.43.0

