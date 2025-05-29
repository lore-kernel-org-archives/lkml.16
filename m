Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A41022D795
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529364; cv=none; b=o79nJ8Ynbap44VqYmtn5QygGGTPZhAIwrOVt76gA3RGHyfcgFUAiuHmNkQOVkT8MhRXgh3+VQX5Djjs40lwwKp4M3hdcEDiFX/BKWzYQFvAfE2cdgmE2q93evGcaZBoJre+JwYU2TKeeBdKw0UbNhmiqGSgcl7rDVA+eWYbAz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529364; c=relaxed/simple;
	bh=RpvvMj/K5uVzGiJH1mIG91vdZyDBkvd7mqNAf+vhWvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KkTtNYdSfWChwO2iFBLwmkVSkDNcmFKP/QE6LwkU3TpcLsmWIRnEerBj+27Gc1Zc/Zza+ajK73z8Qx211aUa4yfvkQa5uiS1xz1QveGXXtt8rFkOMMlHy4Ou3CXod2CXc/XfMa1SD/A4aDiPocw0oeqPify2365HexzKLTXs1Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=SHkVxNPf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SHkVxNPf"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acae7e7587dso142295166b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529361; x=1749134161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=SHkVxNPfy+LR7MSsG9zvc24kO8OfLUO78sayURCoBoyqeseNuBIZj8bA+YW5O6dgb5
         FWc8Hs4K/74JeFW2fAKmis4gdo7T5WVIqMI7YLywkhLRKOvDKjYwvqO1OIoFmMqi4C1x
         rgNvzlAwxhqoQX7GFBdRwMGOAAV/bl+wRelww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529361; x=1749134161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=nSXKHOLGJ4RczbAKxYyAAEomF6pRsZoCKR98vBTablC6Rk6xkGI9Jykkuiqw2V3J2i
         5TK4qNOBfuML86AnnLk7HLs3L750I/o1C1uaasRhn/m601b3uZE60EevlftzB0axmz1c
         FL0/06ND891igzpPsGDDe+vP8PojX1zJTY9Giia8h31SeXNzW9Td6x0TwfkktvJfnaTK
         aL6AkE9OlBYMqqlFqpboE0Izt3uHN6A6j69bw9vGQ+d8j9wEJMEKjuBv6VFke1e93FTU
         ijKG9HaPQQZWjOt6QOSP2Led7mqrVYrXLjWpb37KsfGURHDVcWIXh1fvsODmwC4DkDpg
         gXog==
X-Gm-Message-State: AOJu0Yw31ltj2qQC3SlLE3Oj7OfbJCAMeXpDTvY8Nxmc0WHag9RnQDjH
	yDs3hjAczl/cw7tXH0Z2io8F1KIP/KxSPjiFlBRw+I84uJOh7h4F5eypMKP+YQr2C6T48vJY5E1
	Z0QzA
X-Gm-Gg: ASbGncvxO/3BVqbFJKretuYLzpC4GzV0jl1FSWSYz9ylFmSMVnzgEgTYloUkXSF+qbD
	8N4bunKhsrkqCKvw9d6zcY5jxaHBpBllw1ZmSRP68wsY9Aq5s3AqOPBB1TQcFRlUwWusS/wPKw9
	rQPBTtv33IVLwmRxChtnG72YVXDYmP5YSO5ZBYEiB2RcM0G96hYTqJPtZg7v3tLKYVlQWFB4rpM
	1ZOhDRPca5tNy6xTS3ILCV7ESNRYuNjTl1Fv0zbQku0OtFY/JvBfLiGzLBhjPl2NOlLi4SiPusa
	cG+0hSnQ3y8lfIgS/gNNAN+nTP98uRfFPMwK2CoYqrOo1FRmuikWqS9o1IKXgVpVU1WudwgIBbJ
	8MiCFjOWrcoIMhlFW
X-Google-Smtp-Source: AGHT+IHLbgs6cMrNEhnJZTad08BJDPcqxBNJSOsMwsYd7juFM8aU5XWIyBIRrYfe55LQYTGTKQIT4g==
X-Received: by 2002:a17:907:3f1f:b0:ad8:96d2:f42 with SMTP id a640c23a62f3a-ad896d21361mr957537266b.36.1748529361561;
        Thu, 29 May 2025 07:36:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:36:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v4 5/6] ARM: mxs_defconfig: Cleanup mxs_defconfig
Date: Thu, 29 May 2025 16:35:12 +0200
Message-ID: <20250529143544.2381031-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
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

