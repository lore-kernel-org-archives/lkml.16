Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0032580ED
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747637772; cv=none; b=RpAUvuoGwYQa0YXmBProYU2IJSqmrVkfjsqcDtglbHCxDrO7q1E0/nzR0s9n7sE3K+5JdYFmWk7r2fylaPGQfrmKIf6kMSq45MqDJmqDQtgepuSTVt+7eCoMUkG6BZVNLM9x6RcYRJJvFaNKGWEf7OmhF9QC+Rn406Zyw0wwgfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747637772; c=relaxed/simple;
	bh=r0QAQo8DKJvxX11f5a5qO1KXV7pNz4v6TpoBqPz0D5E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J9EQSY20zgqyGwcOFmF1BaU7vey/BIH2UU47BjkILX0nQpxIpXm76NHHRIkTQgw47o1/UJew2xwvzgnOGCU6Gi1d1BIfPCviBTxKrWlrTLFd2evd9zh13kcZ83rV+ml85sV3QBApb2OOd4+D/QKZeGnGdAbHMx410TaeGXsTwqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=cibZjoDD; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="cibZjoDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747637758; x=1747896958;
	bh=/e5nDVoSpAG6m2Qux1gMaDdPlzdjh+ifO94Id8klpUc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=cibZjoDDBOXgfzATRfD9eH6IXIW2tIZfDEWcYUEsLVX8IBJdQhDvbh0XNdys8Ggi1
	 Jyqr9rJ5UKT1F4WE9yuk5O1Pb/MCFbEqpx812eOddbSuUSBWeCgIIo02avUj2tgdKq
	 0y5OLi2vduronph9KOGBk+FUdabAXicmLcS5JqdtHyMTRaia38ET5bkxwSn42rdqeG
	 sKLxdGWkbwt03rp7gDaAz9aPDeXexSfI6AJKz2cLOPZI7gQ3bWdo/TWRriNBo0AQI/
	 wd95Ob/tdmlrFGaBNMPnY6t4LAox35yRpINC2Kzks413nayrJoJnyeaJauRGnx5UX9
	 mhjCi6n+22vDw==
From: Esben Haabendal <esben@geanix.com>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: "Dong Aisheng" <aisheng.dong@nxp.com>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Shawn Guo" <shawnguo@kernel.org>,  "Jacky Bai"
 <ping.bai@nxp.com>,  "Pengutronix Kernel Team" <kernel@pengutronix.de>,
  "NXP S32 Linux Team" <s32@nxp.com>,  "Linus Walleij"
 <linus.walleij@linaro.org>,  <linux-gpio@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] pinctrl: freescale: Enable driver if platform is
 enabled.
In-Reply-To: <20250514131342.755840-2-alexander.stein@ew.tq-group.com>
	(Alexander Stein's message of "Wed, 14 May 2025 15:13:40 +0200")
References: <20250514131342.755840-1-alexander.stein@ew.tq-group.com>
	<kdCOm0Ze3fMeCln1AP5DdLtMRljlNKdu6Ok4XwaKs4_cI-gGO0PoM4VA6I27p1b21KiJFXdtcuDvxrcp2ZH_5w==@protonmail.internalid>
	<20250514131342.755840-2-alexander.stein@ew.tq-group.com>
Date: Mon, 19 May 2025 08:55:57 +0200
Message-ID: <87cyc5nl6q.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alexander Stein" <alexander.stein@ew.tq-group.com> writes:

> The pinctrl drivers are not enabled in defconfig. Instead of listing
> each driver in the defconfig, enable then by default if the platform/soc
> support is enabled as well.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * None
>
> Changes in v2:
> * default pinctrl driver depending on SoC support
>
> The discussion at [1] resulted it is better to default SoC-specific pinctrl
> drivers to thei SoC support instead of adding to defconfig or selecting
> pinctrl.
>
> [1] https://lore.kernel.org/all/20250507124414.3088510-1-alexander.stein@ew.tq-group.com/
>
>  drivers/pinctrl/freescale/Kconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
> index d1610e2f21427..8d24decd3f074 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -22,6 +22,7 @@ config PINCTRL_IMX_SCU
>  	tristate
>  	depends on OF
>  	depends on IMX_SCU || COMPILE_TEST
> +	default IMX_SCU
>  	select PINCTRL_IMX
>
>  config PINCTRL_IMX1_CORE
> @@ -160,6 +161,7 @@ config PINCTRL_IMX8MM
>  	tristate "IMX8MM pinctrl driver"
>  	depends on OF
>  	depends on SOC_IMX8M || COMPILE_TEST
> +	default SOC_IMX8M
>  	select PINCTRL_IMX
>  	help
>  	  Say Y here to enable the imx8mm pinctrl driver
> @@ -168,6 +170,7 @@ config PINCTRL_IMX8MN
>  	tristate "IMX8MN pinctrl driver"
>  	depends on OF
>  	depends on SOC_IMX8M || COMPILE_TEST
> +	default SOC_IMX8M
>  	select PINCTRL_IMX
>  	help
>  	  Say Y here to enable the imx8mn pinctrl driver
> @@ -176,6 +179,7 @@ config PINCTRL_IMX8MP
>  	tristate "IMX8MP pinctrl driver"
>  	depends on OF
>  	depends on SOC_IMX8M || COMPILE_TEST
> +	default SOC_IMX8M
>  	select PINCTRL_IMX
>  	help
>  	  Say Y here to enable the imx8mp pinctrl driver
> @@ -184,6 +188,7 @@ config PINCTRL_IMX8MQ
>  	tristate "IMX8MQ pinctrl driver"
>  	depends on OF
>  	depends on SOC_IMX8M || COMPILE_TEST
> +	default SOC_IMX8M
>  	select PINCTRL_IMX
>  	help
>  	  Say Y here to enable the imx8mq pinctrl driver
> @@ -192,6 +197,7 @@ config PINCTRL_IMX8QM
>  	tristate "IMX8QM pinctrl driver"
>  	depends on OF
>  	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
> +	default ARCH_MXC
>  	select PINCTRL_IMX_SCU
>  	help
>  	  Say Y here to enable the imx8qm pinctrl driver
> @@ -200,6 +206,7 @@ config PINCTRL_IMX8QXP
>  	tristate "IMX8QXP pinctrl driver"
>  	depends on OF
>  	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
> +	default ARCH_MXC
>  	select PINCTRL_IMX_SCU
>  	help
>  	  Say Y here to enable the imx8qxp pinctrl driver
> @@ -208,6 +215,7 @@ config PINCTRL_IMX8DXL
>  	tristate "IMX8DXL pinctrl driver"
>  	depends on OF
>  	depends on (IMX_SCU && ARCH_MXC && ARM64) || COMPILE_TEST
> +	default ARCH_MXC
>  	select PINCTRL_IMX_SCU
>  	help
>  	  Say Y here to enable the imx8dxl pinctrl driver
> @@ -216,6 +224,7 @@ config PINCTRL_IMX8ULP
>  	tristate "IMX8ULP pinctrl driver"
>  	depends on OF
>  	depends on ARCH_MXC || COMPILE_TEST
> +	default ARCH_MXC
>  	select PINCTRL_IMX
>  	help
>  	  Say Y here to enable the imx8ulp pinctrl driver
> @@ -240,6 +249,7 @@ config PINCTRL_IMX93
>  	tristate "IMX93 pinctrl driver"
>  	depends on OF
>  	depends on ARCH_MXC || COMPILE_TEST
> +	default SOC_IMX9
>  	select PINCTRL_IMX
>  	help
>  	  Say Y here to enable the imx93 pinctrl driver
> --
> 2.43.0

Acked-by: Esben Haabendal <esben@geanix.com>
