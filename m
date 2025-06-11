Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E838C1D6DB4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749672341; cv=none; b=f88ELhVPpL00YRWqS1IxOqotrRpUGVlGiDhalgCTzpETfrplI4e7eu+JiidXqPiss95UBrPDM96NI9TaVMIL8nLERZm23AGTd5ZxaImOldVxEfQ7iyRoZgdsmeDQdOxiWMGKaVW8DMnGKWZt4FLX7gzDH27XfgTkmeo4kMFNiyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749672341; c=relaxed/simple;
	bh=FERAxty6FWk+nBiTRutJ8aIrtDAq1QWNEDiEQocpa88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pixkFUD/XWPFNEid+MSsO4Wkr/+Ogy94Hd0/TCSb0NeTuaAy86vM0OLAccFgl/qfedRrJ7YTlqY1KpMzrtr39AMcKPiNHv0uti976mmZSoSLADKqZ9a8KmcOKHOVhzQmP0V6ZhQbdccARkPtJKCXqwXRyzfUKiS2eFTjJZmKDEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Uue4H9mh; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Uue4H9mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1749672309; x=1750277109; i=wahrenst@gmx.net;
	bh=GELzex4j1RU3gBWRbk07Pyw4LxOa909IVJD/bMzX/sI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Uue4H9mhyp1+x8eBb/+lrrjqEwQ0PCoCww/MxWouWldfTdn86P4VCkqj36OivRbh
	 kotxs7O8a2VBzcvDzfHni6DdcmzjJOs144wjT6ws4kGNWJLRZfC5u7S3Z9U+glzK+
	 nH0/wZUueS6uJjAtj4hpOQAbqueIguJXMmETo6Rx+82GB0Ljgf1q46JOqO0vJ/eEl
	 5qlOZPvRMBgfd9Y/oH7SXTagbcL/ftDRuHKPJzMdrm/bLcBjhdyaLZnB5YnEcipeS
	 BRo8lASf4fUyTQjPePMYfg2TdUeHM3mM64C0iM4m/A2Sdowj3BPCaXWVK8V1d+fiI
	 rp6EzWGB0fBs7mXWfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.103] ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwfWU-1ujcH02tKs-017y1u; Wed, 11
 Jun 2025 22:05:08 +0200
Message-ID: <dfa95c5b-45ab-400b-b962-16d9ca87748e@gmx.net>
Date: Wed, 11 Jun 2025 22:05:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula@amarulasolutions.com,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andreas Kemnade <andreas@kemnade.info>, Ard Biesheuvel <ardb@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Eric Biggers <ebiggers@google.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
 <20250610100139.2476555-5-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250610100139.2476555-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d8ZDp+jT0EAx1MakeP+mL0z54c7XtFFOBTFWYYPSedYn9DG618l
 haZGL31ya9kFahsz4Jok+4HgRSyHEElrJTTUWHfSo26LnE9/XQZCqGB3ez/kgPwPr0ngUlZ
 75H4rvCSRl6b+2L6gdbOqgrYszgQm6tkMSQecv+cHQqhxDiqTynFVuvN+vO9q9uSJmr7crP
 fyvT2cIHfuuOyK3lkvLaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VFYFUUL0hBQ=;EWUCfMT+ybbEUfD+STDyda6mToA
 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

Hi Dario,

Am 10.06.25 um 12:00 schrieb Dario Binacchi:
> Generate imx_v6_v7_defconfig by doing:
>
> make imx_v6_v7_defconfig
> make savedefconfig
> cp defconfig arch/arm/configs/imx_v6_v7_defconfig
>
> No functional change. The goal here is to cleanup imx_v6_v7_defconfig
> file to make easier and cleaner the addition of new entries.
there is something wrong with the subject, because the patch isn't about=
=20
mxs_defconfig.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
> (no changes since v1)
>
>   arch/arm/configs/imx_v6_v7_defconfig | 25 ++++---------------------
>   1 file changed, 4 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx=
_v6_v7_defconfig
> index 062c1eb8dd60..d40ca9edd264 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -12,6 +12,7 @@ CONFIG_RELAY=3Dy
>   CONFIG_BLK_DEV_INITRD=3Dy
>   CONFIG_EXPERT=3Dy
>   CONFIG_PERF_EVENTS=3Dy
> +CONFIG_KEXEC=3Dy
>   CONFIG_ARCH_MULTI_V6=3Dy
>   CONFIG_ARCH_MXC=3Dy
>   CONFIG_SOC_IMX31=3Dy
> @@ -32,7 +33,6 @@ CONFIG_ARM_PSCI=3Dy
>   CONFIG_HIGHMEM=3Dy
>   CONFIG_ARCH_FORCE_MAX_ORDER=3D13
>   CONFIG_CMDLINE=3D"noinitrd console=3Dttymxc0,115200"
> -CONFIG_KEXEC=3Dy
>   CONFIG_CPU_FREQ=3Dy
>   CONFIG_CPU_FREQ_STAT=3Dy
>   CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy
> @@ -129,7 +129,6 @@ CONFIG_CS89x0_PLATFORM=3Dy
>   CONFIG_QCA7000_SPI=3Dm
>   # CONFIG_NET_VENDOR_SEEQ is not set
>   CONFIG_SMC91X=3Dy
> -CONFIG_SMC911X=3Dy
>   CONFIG_SMSC911X=3Dy
>   # CONFIG_NET_VENDOR_STMICRO is not set
>   CONFIG_MICREL_PHY=3Dy
> @@ -153,9 +152,7 @@ CONFIG_MWIFIEX_PCIE=3Dm
>   CONFIG_WL12XX=3Dm
>   CONFIG_WL18XX=3Dm
>   CONFIG_WLCORE_SDIO=3Dm
> -# CONFIG_WILINK_PLATFORM_DATA is not set
>   CONFIG_INPUT_EVDEV=3Dy
> -CONFIG_INPUT_EVBUG=3Dm
>   CONFIG_KEYBOARD_GPIO=3Dy
>   CONFIG_KEYBOARD_SNVS_PWRKEY=3Dy
>   CONFIG_KEYBOARD_IMX=3Dy
> @@ -190,9 +187,7 @@ CONFIG_SERIAL_IMX_CONSOLE=3Dy
>   CONFIG_SERIAL_FSL_LPUART=3Dy
>   CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
>   CONFIG_SERIAL_DEV_BUS=3Dy
> -# CONFIG_I2C_COMPAT is not set
>   CONFIG_I2C_CHARDEV=3Dy
> -CONFIG_I2C_MUX=3Dy
>   CONFIG_I2C_MUX_GPIO=3Dy
>   # CONFIG_I2C_HELPER_AUTO is not set
>   CONFIG_I2C_ALGOPCF=3Dm
> @@ -204,14 +199,9 @@ CONFIG_SPI_FSL_QUADSPI=3Dy
>   CONFIG_SPI_GPIO=3Dy
>   CONFIG_SPI_IMX=3Dy
>   CONFIG_SPI_FSL_DSPI=3Dy
> -CONFIG_PINCTRL_IMX8MM=3Dy
> -CONFIG_PINCTRL_IMX8MN=3Dy
> -CONFIG_PINCTRL_IMX8MP=3Dy
> -CONFIG_PINCTRL_IMX8MQ=3Dy
>   CONFIG_GPIO_SYSFS=3Dy
>   CONFIG_GPIO_MXC=3Dy
>   CONFIG_GPIO_SIOX=3Dm
> -CONFIG_GPIO_VF610=3Dy
>   CONFIG_GPIO_MAX732X=3Dy
>   CONFIG_GPIO_PCA953X=3Dy
>   CONFIG_GPIO_PCA953X_IRQ=3Dy
> @@ -225,7 +215,6 @@ CONFIG_W1_SLAVE_THERM=3Dm
>   CONFIG_POWER_RESET=3Dy
>   CONFIG_POWER_RESET_SYSCON=3Dy
>   CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy
> -CONFIG_POWER_SUPPLY=3Dy
>   CONFIG_RN5T618_POWER=3Dm
>   CONFIG_SENSORS_MC13783_ADC=3Dy
>   CONFIG_SENSORS_GPIO_FAN=3Dy
> @@ -283,13 +272,13 @@ CONFIG_VIDEO_OV5645=3Dm
>   CONFIG_VIDEO_ADV7180=3Dm
>   CONFIG_IMX_IPUV3_CORE=3Dy
>   CONFIG_DRM=3Dy
> -CONFIG_DRM_I2C_NXP_TDA998X=3Dy
>   CONFIG_DRM_MSM=3Dy
>   CONFIG_DRM_PANEL_LVDS=3Dy
> -CONFIG_DRM_PANEL_SIMPLE=3Dy
> -CONFIG_DRM_PANEL_EDP=3Dy
>   CONFIG_DRM_PANEL_SEIKO_43WVF1G=3Dy
> +CONFIG_DRM_PANEL_EDP=3Dy
> +CONFIG_DRM_PANEL_SIMPLE=3Dy
>   CONFIG_DRM_DISPLAY_CONNECTOR=3Dy
> +CONFIG_DRM_I2C_NXP_TDA998X=3Dy
>   CONFIG_DRM_LVDS_CODEC=3Dm
>   CONFIG_DRM_SII902X=3Dy
>   CONFIG_DRM_TI_TFP410=3Dy
> @@ -310,7 +299,6 @@ CONFIG_LCD_PLATFORM=3Dy
>   CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>   CONFIG_BACKLIGHT_PWM=3Dy
>   CONFIG_BACKLIGHT_GPIO=3Dy
> -CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>   CONFIG_LOGO=3Dy
>   CONFIG_SOUND=3Dy
>   CONFIG_SND=3Dy
> @@ -380,11 +368,8 @@ CONFIG_MMC=3Dy
>   CONFIG_MMC_SDHCI=3Dy
>   CONFIG_MMC_SDHCI_PLTFM=3Dy
>   CONFIG_MMC_SDHCI_ESDHC_IMX=3Dy
> -CONFIG_NEW_LEDS=3Dy
> -CONFIG_LEDS_CLASS=3Dy
>   CONFIG_LEDS_GPIO=3Dy
>   CONFIG_LEDS_PWM=3Dy
> -CONFIG_LEDS_TRIGGERS=3Dy
>   CONFIG_LEDS_TRIGGER_TIMER=3Dy
>   CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
>   CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> @@ -453,7 +438,6 @@ CONFIG_EXT3_FS_POSIX_ACL=3Dy
>   CONFIG_EXT3_FS_SECURITY=3Dy
>   CONFIG_QUOTA=3Dy
>   CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> -# CONFIG_PRINT_QUOTA_WARNING is not set
>   CONFIG_AUTOFS_FS=3Dy
>   CONFIG_FUSE_FS=3Dy
>   CONFIG_ISO9660_FS=3Dm
> @@ -490,5 +474,4 @@ CONFIG_PRINTK_TIME=3Dy
>   CONFIG_MAGIC_SYSRQ=3Dy
>   CONFIG_DEBUG_FS=3Dy
>   # CONFIG_SLUB_DEBUG is not set
> -# CONFIG_SCHED_DEBUG is not set
>   # CONFIG_FTRACE is not set

