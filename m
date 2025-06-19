Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6393D24467A;
	Thu, 19 Jun 2025 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319032; cv=none; b=t8R2f3zEjoIYz6HkqaSoYs/3P+EmdxxiGL2dJdfRc8CshXQWwi8hUZe1NCWHrVzAUp/+Dka3Vd5eK2+jicXMxREAXLdvkQMzcehGBWgHixx2ytq+qczwckvWL2MbqHB1jG6kxGV2MrA1t4GJyQQQ//XI+IXM22Tohhqz2am23ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319032; c=relaxed/simple;
	bh=rbT33KMGZn5PjflB+2U7aFNbMysCNyytlu8rmV/EDOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXWS1cQ6O9M1MecJplUrQW+dthldB7ym/yvidby/59nXj+0iM1Bhi08Tz32xkgr1SVIzVjl74+6ACJf+SBOIOmhfOfF2WcBsWoasPExbFcybbAqt8G6aRSJRw/LvJD2Wrv7r7n0tE4KWZYU6wP+yTESD9D2rg1h2MZtC2qbRvtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Il1fwPTx; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Il1fwPTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gx9ZYZEfMPvpNfsm7y2FmscG8VU7g8hiMvYXHAUSJ20=;
	b=Il1fwPTxBxtqZ3FQjQNk7TdfLMfBJFI1gsaPam5Fw7dTvDxqCeWquWZvrpcYoO
	CkHpyKXr0o/3nsk3h3ksRjfHnbVKrmhxe22UaPuEEptqQ0Mgel6XsDPF9VBNqA3w
	qRhykdiJzzw/H99mxJw5OIFmnp8yj6BL+z2wAzHjCdvHw=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXHzwnv1NoPNT5AA--.63344S3;
	Thu, 19 Jun 2025 15:41:29 +0800 (CST)
Date: Thu, 19 Jun 2025 15:41:27 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Xiubo Li <Li.Xiubo@freescale.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: vfxxx: Correctly use two tuples for timer
 address
Message-ID: <aFO/J1+Q8mWiffKi@dragon>
References: <20250523071921.43216-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523071921.43216-2-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID:M88vCgDXHzwnv1NoPNT5AA--.63344S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzOzVUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQnoTmhTvylr5gAA3u

On Fri, May 23, 2025 at 09:19:22AM +0200, Krzysztof Kozlowski wrote:
> Address and size-cells are 1 and the ftm timer node takes two address
> spaces in "reg" property, so this should be in two <> tuples.  Change
> has no functional impact, but original code is confusing/less readable.
> 
> Fixes: 07513e1330a9 ("ARM: dts: vf610: Add Freescale FlexTimer Module timer node.")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

