Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B1123ABAB;
	Thu, 19 Jun 2025 04:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305924; cv=none; b=EwTzHCMu1GpqM7hj04bX69P+ZqWDIsPT4UPJ/55R72/pFMb+aSJwSCyJFNbFgTp/tKvRLnaY7Iav9rrSkn0qUmXQhRoqkB0qtJmUKjLjmd7gEz+UZWl5HvCL59YGMCGptIia8vXN8B1/cAWS7XoQRhnm1vwZ2Io39GGFlhHho2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305924; c=relaxed/simple;
	bh=DIG5albF6lOxDimZvvSfwW/v6tUAmJv6CFsTPIwACj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMVtK41ORQb8HHgVo3c1GB5J+8AlwKB42tTyKKNF5BgYMao9J9aeVIuI/VDts5xoj1U71AYztBYuJh/OzknhEMSV8+dFIHCMsCIzUKR0YIsrZKy3A4Tyb5luEQzXy5QNZ1fpPID6TUcHPH2Kp5+abT0/v+iNl6gDl2FFmlxL+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=DD9uyEy9; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="DD9uyEy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SzXacRK9YyFVZryxioMdSBKnpxohJunnJcdvONlrj6s=;
	b=DD9uyEy90xjxZI9nMIRPXAkeq9hWWuDmp7fJSn8SaodTOeG9gRBe6H8p4pR/2u
	Ht/s+uJ4KBVe25WCd4+Oste0xNIeqKsJqnGztSCOHrfUMouYfuviEWP9l6PK8/w+
	lCBDJpkm182xoD/NARtXY5o3QgdM8l60x1iECvsQSKxK4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA3rw5SjFNo5nn2AA--.35256S3;
	Thu, 19 Jun 2025 12:04:36 +0800 (CST)
Date: Thu, 19 Jun 2025 12:04:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 8/8] arm64: dts: freescale: Add the BOE av123z7m-n17
 variant of the Moduline Display
Message-ID: <aFOMUq5JcovQEW5V@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-8-a8f0195420aa@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-8-a8f0195420aa@gocontroll.com>
X-CM-TRANSID:M88vCgA3rw5SjFNo5nn2AA--.35256S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7sqXDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR1xZWhTVBnN5wAAsU

On Tue, May 20, 2025 at 08:34:57AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add the BOE av123z7m-n17 variant of the Moduline Display, this variant
> comes with a 12.3" 1920x720 display.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!

