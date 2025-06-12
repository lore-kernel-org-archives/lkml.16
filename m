Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265722309B2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719321; cv=none; b=JvJdSaQeeagWC4w3I0XrITizO6XofGhUdvss4p1PVQbCXmDB2p2D+9ISWDZUtdyc02kD04w0fCgzFVkenhzJsa5l2hXsxlf8TvUj6D6ng+jyKtcnsnJvCXAIyZW94Ra4GhK+wehiA53X44eqA5LZe9bHjgpfbEhhuyuInzW/xQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719321; c=relaxed/simple;
	bh=8ifJB4hg/p3+muYHK02GRujAVjrJjqz6OwSqDSpqHFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhkEC/++jsdWKbSBLdPxjWaWOvnJd0tEKg2IAAEEhZrjRArRm5KjzBdfSp44uZ4iUdLIJaRDc7txonuKNnjGEIgZVMfieh6vKkZpml0HtzCn/nXTMK9EsyQhHwNZe5mzSXhmeYzdX+r+C+q8gh4YHvIPo/Q24wPB42MpFLXo048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=D+xbHKPd; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="D+xbHKPd"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-604f26055c6so3501176a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719317; x=1750324117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O28qAmYDQtgK9Y67h6VNYLousdi9GmznEuxxlZe6y6g=;
        b=D+xbHKPd12n/1Hoo15cYch45y8I6vcax1xXUqAihvccOQdujQr4u/W43Tvn36g36tQ
         oAQsX+ODLqCJwz7HmPUG644yF9Vu0qQ8ARvP1foVi/iNBbo1c47fiw8FcC1wNnPh0wHf
         vVSi+DJhzKh9lv/T1zpdWGTxPzwk2uWIqrUP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719317; x=1750324117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O28qAmYDQtgK9Y67h6VNYLousdi9GmznEuxxlZe6y6g=;
        b=I2ECOwHng17V4OwY1qSNco10HcM/GKa+ZMkcRsuyg+xurlwLmQfZv3FjkatzLxEMv/
         oJ8PfbOiV9gUHF2ryu7JQVrD4llg3WHvfkZa41Lu0qn/77trgOFC8h331MjU/YITb5Nk
         TUMqnb/kZfXtfD1OiS23VUEOF29QE57iYJd4jUDzD5mCzhBP1qqrQx8aGQRquCOHCkFw
         AOnX4XLZROf8oaWcpJEbSIOFsulXwzWlCwD/9pSD9/4BJOulLeOYxtkRoz8kSSRyGm10
         rr0YSoAqu+r5UmiD9F8qkRCYGOwU8LobghEsOPnfuMR7QrBiG8KkSdNgFRz/G1Ltpeve
         Ijfw==
X-Gm-Message-State: AOJu0YwH9xHcp+CfsTEKzZc5izmYRL+PCVytV7OtG0uq//EK45mx5641
	OJdOjHEx+jssvo3az2U/7zzNGeN/3UTu3t+sWpWrr9dnvBNE20N7UfszzbdGDUE6fJq6eQjLIkh
	hHBoW
X-Gm-Gg: ASbGncvXDYm0XCaz+MxPMowlXbuIoQJqaAdSZRQ2DG39tqxDxJE/JXMoj/GmPRmJoR9
	XDeMvULbI2Wy1CJSaHeFQFm32OWfEBTFKGZHJDtWWfQKt3PeG3PAqSF+W7vrogDfIj6tyZUYyqM
	/rsMHrZHuISfNT3VrLwG3pP0ammQT/zoQpmci64lac+r+NDZaG2vW2rczzwNjgh1URUhlKSiCX6
	LBvT2R2PZ5klnW56bi2cgEZCaM/zpy2T/T5sPrqfgvRHNCOd7Ql/K21H65egfnTlQ6s0riXpTLi
	2tHRaBu8fOiAi1GWUCRfMifMRfQGnOcl3dkB+3paaFjEVfgioga90t1UZ7QI6mljq3qGRGGGcZP
	1cQnnsAcb2aNPFtFdgNtniWngBQ==
X-Google-Smtp-Source: AGHT+IHyqmEYTBhGp9wmuj09IvWbbab8cKlzqZ+aklGymfkyiu6cjdcivLQK1OiluqCOtgkI4h8ITQ==
X-Received: by 2002:a17:907:805:b0:ade:44da:d2cf with SMTP id a640c23a62f3a-adea566604dmr278459866b.18.1749719312964;
        Thu, 12 Jun 2025 02:08:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 04/10] ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
Date: Thu, 12 Jun 2025 11:07:49 +0200
Message-ID: <20250612090823.2519183-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generate imx_v6_v7_defconfig by doing:

make imx_v6_v7_defconfig
make savedefconfig
cp defconfig arch/arm/configs/imx_v6_v7_defconfig

No functional change. The goal here is to cleanup imx_v6_v7_defconfig
file to make easier and cleaner the addition of new entries.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Fix commit title. It was referring to a wrong configuration

 arch/arm/configs/imx_v6_v7_defconfig | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 062c1eb8dd60..d40ca9edd264 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -12,6 +12,7 @@ CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_MULTI_V6=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX31=y
@@ -32,7 +33,6 @@ CONFIG_ARM_PSCI=y
 CONFIG_HIGHMEM=y
 CONFIG_ARCH_FORCE_MAX_ORDER=13
 CONFIG_CMDLINE="noinitrd console=ttymxc0,115200"
-CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
@@ -129,7 +129,6 @@ CONFIG_CS89x0_PLATFORM=y
 CONFIG_QCA7000_SPI=m
 # CONFIG_NET_VENDOR_SEEQ is not set
 CONFIG_SMC91X=y
-CONFIG_SMC911X=y
 CONFIG_SMSC911X=y
 # CONFIG_NET_VENDOR_STMICRO is not set
 CONFIG_MICREL_PHY=y
@@ -153,9 +152,7 @@ CONFIG_MWIFIEX_PCIE=m
 CONFIG_WL12XX=m
 CONFIG_WL18XX=m
 CONFIG_WLCORE_SDIO=m
-# CONFIG_WILINK_PLATFORM_DATA is not set
 CONFIG_INPUT_EVDEV=y
-CONFIG_INPUT_EVBUG=m
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=y
 CONFIG_KEYBOARD_IMX=y
@@ -190,9 +187,7 @@ CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_FSL_LPUART=y
 CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_GPIO=y
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_I2C_ALGOPCF=m
@@ -204,14 +199,9 @@ CONFIG_SPI_FSL_QUADSPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_FSL_DSPI=y
-CONFIG_PINCTRL_IMX8MM=y
-CONFIG_PINCTRL_IMX8MN=y
-CONFIG_PINCTRL_IMX8MP=y
-CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_MXC=y
 CONFIG_GPIO_SIOX=m
-CONFIG_GPIO_VF610=y
 CONFIG_GPIO_MAX732X=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
@@ -225,7 +215,6 @@ CONFIG_W1_SLAVE_THERM=m
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-CONFIG_POWER_SUPPLY=y
 CONFIG_RN5T618_POWER=m
 CONFIG_SENSORS_MC13783_ADC=y
 CONFIG_SENSORS_GPIO_FAN=y
@@ -283,13 +272,13 @@ CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_ADV7180=m
 CONFIG_IMX_IPUV3_CORE=y
 CONFIG_DRM=y
-CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_MSM=y
 CONFIG_DRM_PANEL_LVDS=y
-CONFIG_DRM_PANEL_SIMPLE=y
-CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
+CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
+CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_LVDS_CODEC=m
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_TI_TFP410=y
@@ -310,7 +299,6 @@ CONFIG_LCD_PLATFORM=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_GPIO=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
@@ -380,11 +368,8 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
-CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_ONESHOT=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
@@ -453,7 +438,6 @@ CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
-# CONFIG_PRINT_QUOTA_WARNING is not set
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_ISO9660_FS=m
@@ -490,5 +474,4 @@ CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SLUB_DEBUG is not set
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
-- 
2.43.0

