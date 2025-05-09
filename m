Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620328EA42;
	Fri,  9 May 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785494; cv=none; b=LCD4NnnGtJ5k8s8T3wTTKeV8gax5niZ3iGCOkTJirC5kWvukqy2srZ4YIMqoKb7OEdrBGmyaDGd7oszmCzy5iwZW9xAiDIaCBmspjuOitSGlQpXSjlr7cYZ/pWkDrbjjFXpXikwkg8RCEgcByS2aVIJcAinDnEKCS2fGHxJ48IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785494; c=relaxed/simple;
	bh=lqziQpMlughBedTUO+EzYkiCIUZJo/QheOWVzWoKiJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aORMfYla9nFZjw7dXYMk3lDtC7en5p2Fj3H/R19GHFGoTIjXVZEmYxdXvoMR+av+JyJTHv5lqFIxo1Op31oM+ujBQg++2ci0/ih9C5rGkb4XZ/wQlCyx9DJqPAuibC4UnExVeptMRmbLmLohPiP1mVkYMln9lPFSThJJKfv6Qcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=keWZgP8c; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="keWZgP8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=izERVxm2+ntmpqePiAy07uUJR+42twLW2H2vEA4ju50=;
	b=keWZgP8cSVuU62zuRHKBjK7P9EZ6VdTqDnuXp+dF4RFUw8G1hPbfC+oqhhKSIo
	0z/GgMWQWsRPfTXQaiFjIzYwQRXF6vIEKlxxPSZ9zAm6E/Tu4gTiqyin50dfm9pP
	mHbPVX1tuKgHvJCJPRONRH75Pd/xo8tQ4LofoslkyEcPM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD31w6f1B1ol0OqAA--.12430S3;
	Fri, 09 May 2025 18:10:40 +0800 (CST)
Date: Fri, 9 May 2025 18:10:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v4 00/15] Update PHYTEC i.MX93 DTS
Message-ID: <aB3Unt2tKNaIBnBS@dragon>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
X-CM-TRANSID:Ms8vCgD31w6f1B1ol0OqAA--.12430S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1rAFy5tr43Cr45ZFyrJFb_yoWkuFg_uF
	4fWrn7Gr1kJrs3Aw15A3Wjq3s29FWYyFyrKFyUW3Z5tr9rGFnIkr9ru3yfGF4qgFnF9r17
	CF18JwnaqrWYgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbfgA7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRdIZWgdnHfvXAAAse

On Tue, Apr 22, 2025 at 12:56:29PM +0200, Primoz Fiser wrote:
> Primoz Fiser (15):
>   arm64: dts: freescale: imx93-phycore-som: Add PMIC support
>   arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
>   arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
>   arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
>   arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
>   arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v flag
>   arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card
>     write-protect
>   arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
>   arm64: dts: freescale: imx93-phyboard-segin: Set CMD/DATA SION bit to
>     fix ERR052021
>   arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
>   arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
>   arm64: dts: freescale: imx93-phyboard-segin: Add USB support
>   arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
>   arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
>   arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetically

Applied all, thanks!

