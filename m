Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7200019F421;
	Mon,  7 Jul 2025 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878830; cv=none; b=ZlIgaGLUcqMcM4a35503WfIUBTY8EW62DK+9aUstEPfvKzU4cW3G/r6Pqy+cXCpVkatWSclb6DvPnZpFqbxiM3HYS63HeexjmqQjhnJNjyCFX/lYWOiMVgttZ5uk+wbjGP9+ezZVM7DYIXzcojNlQLorQFB3W/Lq8Od0L3BT0rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878830; c=relaxed/simple;
	bh=MTKpsIgeW6LKhzv/n15vzUl20MWMaQ5G9qNXsAqBv9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaZJgYEBV0ZFvXmXRHSx1+JiKu0R6V3LUbVzrPcsFsPTK/pJdNy90LknNCpiCZ2l7Jn8SDzWTlauOCyjmJGenXp0BfswKI4Nrqs/ZhqjlevS/ErAJmyexCGWXp5/LaiqaiSX0Cqj4jstNeGG0OrZeOqqOQnASZtgH02QGCnVQsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=j+zmUsHV; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="j+zmUsHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=NlfspyJjbSk5hoUC2w/Rc3ZtDhkI9SmVzdkEY6k5DMg=;
	b=j+zmUsHVSPFrZdUoR2WWjvIiHwwkKBdwCqCPC+3NmBplpzl+/IgDHia0T1yfBL
	ni5LiRmgaBonuMSXa8K5DIhxTCrLNTaDNop8Uxyy0aEXVt31RqqSoXmlkgpVsW4Y
	aLTSjXURy0k3RWhBb9ruUNAUsVVgYYNr6cYzqy3/No8hQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXluN_jGtoVAF6AA--.63095S3;
	Mon, 07 Jul 2025 16:59:45 +0800 (CST)
Date: Mon, 7 Jul 2025 16:59:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Message-ID: <aGuMf9A0gONkaOmr@dragon>
References: <20250703113810.73023-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703113810.73023-1-aford173@gmail.com>
X-CM-TRANSID:Ms8vCgCXluN_jGtoVAF6AA--.63095S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwYLvDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQWDZWhrVpnALQAAsL

On Thu, Jul 03, 2025 at 06:38:09AM -0500, Adam Ford wrote:
> UART2 is often used as the console, so the DMA was likely left
> off on purpose, since it's recommended to not use the DMA on the
> console. Because, the driver checks to see if the UART is used for
> the console when determining if it should initialize DMA, it
> should be safe to enable DMA on UART2 for all users.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied both, thanks!

