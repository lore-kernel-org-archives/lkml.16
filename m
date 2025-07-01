Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DA14A60C;
	Tue,  1 Jul 2025 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375215; cv=none; b=iU3HHLop3DtLst70IL9hvNm2sJRWtlUSgS//S0K7fRlviDuye/mrM2A2TMvWUkAK6qGJ7XzPmzPM1xqLPK9Z5KcSmOeo+tqwGrIn6jLF7KpW7X2fbdi7oQBXoQNHKE7u4stVIbhhEutJjZHT4ChZoMpgjTbTrps0TdywLg797Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375215; c=relaxed/simple;
	bh=fuT/LDLh5OxFNOcsCU4pYYDRvoCcLPF3BEgrFESR5YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtEbAUUKyA/VJQzHme6DV6UevfDWh9FIV6tYXkX6XyUc0EV8kHh9qRisFbKOFftrUd0MlnNDK2AQQQ3vOKfONnFEo4FqWuKNxeRft5IdlQToBkJRSCnbrY5ysBmo1wQjfj4HHoowNQ/aP/clqqpRsdAYedy43/His/7Mo6NZYro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=eZ07VeVY; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="eZ07VeVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sEnrDDcCW0+uNi7Li/7EBjKT/lB/N/YIH1Gam18Rgys=;
	b=eZ07VeVYykK8lNUX1eBXrC/u3PXr/45h/URm8aa1PhSrcmLsoJDRgGWmGWoMHb
	jXDL4U0F0EwXNHekUBnBFb0gg/1c8+rAeBpWQUO+z3bL3KJoZVKeJOUskb8xlFx/
	Re94eKkN+NRJNicXXsWimzKC+EEcA+enODCIvQJ/y0tSM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHVuQ43WNo87YbAA--.10731S3;
	Tue, 01 Jul 2025 21:06:01 +0800 (CST)
Date: Tue, 1 Jul 2025 21:05:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phyboard-nash: Move ADC
 vref to SoM
Message-ID: <aGPdNy8Bn37XiOpy@dragon>
References: <20250602125207.2265222-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602125207.2265222-1-primoz.fiser@norik.com>
X-CM-TRANSID:Ms8vCgDHVuQ43WNo87YbAA--.10731S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr15WF17tw47WryruF4xCrg_yoWxKFc_ua
	48WFWvyr1UJF4xua13GF12v3s3G3WUJrWxZr4fGrn3tr92yayxG3sYy345Jw47Xw4DArsI
	vF1rAa1rur1Y9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj7DGUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBp43Whj3TqWqAAA3N

On Mon, Jun 02, 2025 at 02:52:07PM +0200, Primoz Fiser wrote:
> Move configuration for ADC voltage reference from board DTS to a SoM
> include file. The SoC ADC reference voltage is connected to a "VDDA_1V8"
> voltage node and supplied by the PMIC's BUCK5 regulator. The reference
> voltage is thus defined by the SoM and cannot be changed by the carrier
> board design and as such belongs into the SoM include file.
> 
> Moreover, with this in place, customers designing own carrier boards can
> simply include imx93-phycore-som.dtsi and enable adc1 in their own DTS
> without the need to define dummy ADC vref regulator themselves anymore.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied, thanks!

