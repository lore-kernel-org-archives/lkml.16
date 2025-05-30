Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB215238174
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621285; cv=none; b=hQRuG5alT1/Q3a7lwNvaA3FiZvPljjuMbA4T/vnnpYUQo4Sytlm27UzXcp7a42vxim/5asyx+cQND3lN5bzI9A+eO5mOuGYFGqPcBEiaP3UR5qvRyHHA/IPxF2vr44LF4v9N43LXLGu2clKRVyegvSdxEkbSFXIGXLHn/CEGkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621285; c=relaxed/simple;
	bh=RpvvMj/K5uVzGiJH1mIG91vdZyDBkvd7mqNAf+vhWvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1eh+61CcEiYHqVlkuovjcXHP2gGO/BL4NWS7Bh5yxbnPWsZ1BW/mgI8jyTwSp4YCd/1kFz0hMrIZ3rgEYAskNkKOH5a3o2P0rI3+HA0mXvstyunZDi775Tr+mp0OdbJ8mDz4hW1XoKuppwFwm0QQgBYUnGQL8BZ9+tsfpUA0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OCsbcR8D; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OCsbcR8D"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so14920945e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621282; x=1749226082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=OCsbcR8Dqm5JpbU+zljoSZ1IlqYAN0R3+ho+z3hIyMdXW0qqiI7XwnuECM/oskO7t6
         PfaEefhyr/VD8tz1POBxvj+DeLyURsSzabx6RqrxFtFXEXXVpE4UykTIMuhMNsPchHV1
         T6wwyaDNLGeOxyyGnLFntYBIASBn+cX+aDGRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621282; x=1749226082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=EGyTJngDM14aBwNaN48H3pYkvgSMX+5hJGoAV+Pb1mmaEfhEt12+CuivOttEbuf5pd
         K3Y5n2JcAoc4arthfcKuyj93SQG6iF0iN1PAKa6/Banm5A3+2Tp/CkmEUDURK3YV4NTs
         BZOvdVbu981vue1p8MdyvSDoBbQRviW0uE5wGHfKriRgce/TVMg4s51Tn42B53fzAwqF
         hmToOA2YSQnjJzt8u+CxomN2D5+2L3iB3FNAREokiSEdKw6yagK9KgCot0Ux4+NoKqUN
         w245X74ZzEqEPdNM6BwvikBD/Za1qmeKb03PAzcUC1z1viifxjyh/M6TB7Ue13x4Gsrm
         Q7Hw==
X-Gm-Message-State: AOJu0Yw5IqYMbJP1arTwAPVIF9iAy9s1TPxCziGb9SoWTSuHTCjTE4e1
	2jzWv5Hci0WFKeo5NlxW5BK+CjKV2QQX6HzO8CVCyDDRC5ghzka9pAZz0V5PnP2sODkaMMMgJsf
	FqvKI
X-Gm-Gg: ASbGncssziZy01nrbZE+j3gMMxiLvh2qthRFhP1RzjWHZ5p2p35sRo6XsQGBX4n4iCX
	y/Fw9iRG9VDCNvqu/nBO4FvdCqbdhCEtICTRgo/D4iWE4sUZSh0Erooa6gy5SmNuvrR+dpK925Q
	atOddE5Ui6wSlVHuJ2KwirVB9urnYjhLxP0tZS3xLzaLIMB49P3kNJAXHl7sJTlll9It3Zn7e9W
	DsiK71xZGcOnmc4ByJp3TJVSIEt6RaICcaDhEDt5bVVDRoM/BWlasRACGQINT5nvGX+XMiFKF6e
	KnxOGJuHOA6xQzP8dSb3pylYXo/xBrLl+ebnbzskHyWFlBOX9VLvZ7MJdd/vsJ+5qlTsEhA7zaw
	zNY5eZVvDHDDSRoXgCdgVreflq4AwcnYKcKLs/QU/oCSypJQSqIw=
X-Google-Smtp-Source: AGHT+IHB4KCY+ASia3MI/531qxYpWVifkfMHclrIx7cEJgeFFM0P1DgHGGwchnm9I8j/YZZJXHCf/w==
X-Received: by 2002:a05:600c:6286:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-450d657fbf9mr35257455e9.21.1748621281779;
        Fri, 30 May 2025 09:08:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:08:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v5 5/6] ARM: mxs_defconfig: Cleanup mxs_defconfig
Date: Fri, 30 May 2025 18:07:36 +0200
Message-ID: <20250530160748.2476088-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
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

