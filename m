Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A98DDAB;
	Mon, 30 Jun 2025 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751254346; cv=none; b=TySpe9J8tc77ooeGj9ut5a75oYDW/chMYghU791fDbEdGjwAS8jn+uUzWUet/LuMIM1RHZ9a7J2IJmu4fzdjiTqH5PsCosgtugi+KmpSBIJyMmUSxHXjPKI/ktBsoVrc6ppO3zyus6XM236jIfoqw1Iv4tIpa8CKSAh5Wmrbs2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751254346; c=relaxed/simple;
	bh=9HXwaKOCU9N32PhkYUdCh2niibtPEZxJwu0R7t6hyBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaFRpIEXvMfvfTKTcHxOSCdZShj8ST8wMmMHz/mQJbAHfS8quvx/ONMSiDRCqyA8WeXwE4DovtuuVveZ7MlFGcEb2o67x5LocAVEnu3Zw3oWVQ5vsiqgJV1xchjQ2kcn4ijJt9DTcwl9uaCuTRTXIiqni/cW6BcdBCBUXwplA34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JjPxa0dT; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JjPxa0dT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eMBvYrfcJhEzV4RAOAmAuxyy61g3GX1XMHx4/6zqp6E=;
	b=JjPxa0dTW5h72qIOXR/CH0HfNVHEGE/jvjLlQD3CWmgu9Z54+8maopt2F9+Kyw
	uqE5Bh6yP0YOeo/f5nj49/vi/AnrQF0tHHW4FuVOUvjmd98Z1s5k4Cx3GHrfKwWe
	vxIq65+m8wtQWHNwJsF53hRfuCCruDKXgmTfD0hNljZNg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBnLxXzBGJoSvnNAQ--.18360S3;
	Mon, 30 Jun 2025 11:31:01 +0800 (CST)
Date: Mon, 30 Jun 2025 11:30:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH v2 0/6] arm64: dts: imx943: Add sound card support
Message-ID: <aGIE86uLisSjCK+h@dragon>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528015837.488376-1-shengjiu.wang@nxp.com>
X-CM-TRANSID:M88vCgBnLxXzBGJoSvnNAQ--.18360S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYZ2-UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ98ZWhh4l2X2QAAsn

On Wed, May 28, 2025 at 09:58:31AM +0800, Shengjiu Wang wrote:
> Add sound card and related i2c device support
> - micfil
> - bt-sco
> - wm8962
> 
> changes in v2:
> - use (FSL_EDMA_MULTI_FIFO | FSL_EDMA_RX)
> 
> Carlos Song (2):
>   arm64: dts: imx943-evk: add lpi2c support
>   arm64: dts: imx943-evk: add i2c io expander support
> 
> Shengjiu Wang (4):
>   arm64: dts: imx94: Add micfil and mqs device nodes
>   arm64: dts: imx943-evk: add sound-wm8962 support
>   arm64: dts: imx943-evk: add bt-sco sound card support
>   arm64: dts: imx943-evk: Add PDM microphone sound card support

Applied all, thanks!

