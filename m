Received: from proxy41135.mail.163.com (proxy25215.mail.163.com [103.129.252.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDB828A1FB;
	Mon,  7 Jul 2025 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.252.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875649; cv=none; b=mzAoIRV0pN62ZOz1qBT9vdEZal7sT+eqiRdlcalo0IIypv62TLtimM2YCeNDoPWdDzoRo+Ardln1lgkFvznKhDhSftV+8MhXVJZ2EM1W24y16Nmv/7/18prcmz0fsxAiFB1r8iRtxuUfewxkgbLLlUZEl6AAdtpUwC9LM2KItpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875649; c=relaxed/simple;
	bh=Q6WPFHuWWUDH9MZY9SgddwsUkXudgzIVOChasOefjEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/ldDzqJwBC+7NtldYlOQJK2yN/UHpt7F8a2ucNGnpOvX+VEgkv7BoS+nDEtExAA0fQD/VP8JoMZ7LTvWEWJGqRKuUQhBNSPaur3VT0KTChHReKcReOahRPiENES9fKl8WPx+FK4xHy5WJkWa1cLXXxD3RypzyZe7hgBn0i5twA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BbL1vs6b; arc=none smtp.client-ip=103.129.252.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BbL1vs6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VwnTHZKkfxEnp/Ss1vXJUtlWc7EFWd8bXzp0BCH6DE4=;
	b=BbL1vs6bgrfXA5oer3T3euuo1ru71ZQhna5Ez6l37/zsnzehv65QHggSz5CZEh
	50ITyzDsyTxJFWeerdBL0BjHoBHJ9BJC1v5PpkcC5zMcPmGDg7U5wooY/KbZXry2
	km9L1+KIljbYgKP9PixWKdPPnEZUQD9BbbJaBakQx+xyM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnlanpf2toiac8AA--.9068S3;
	Mon, 07 Jul 2025 16:06:03 +0800 (CST)
Date: Mon, 7 Jul 2025 16:06:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Add
 watchdog ext-reset-output pin
Message-ID: <aGt_6Kfe4IJ0XeVc@dragon>
References: <20250626071629.3380656-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626071629.3380656-1-primoz.fiser@norik.com>
X-CM-TRANSID:Mc8vCgBnlanpf2toiac8AA--.9068S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOmhFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQsPdGhrf+tXygAA3P

On Thu, Jun 26, 2025 at 09:16:29AM +0200, Primoz Fiser wrote:
> On phyCORE-i.MX93 SoM, the SoC WDOG_ANY output line is connected to the
> external pca9451a PMIC WDOG_B input. Apply pinctrl and set the property
> "fsl,ext-reset-output" for watchdog to trigger board reset via PMIC on
> timeout/reset.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied, thanks!

