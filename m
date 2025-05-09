Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61228632C;
	Fri,  9 May 2025 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802350; cv=none; b=ZYRLubSmhcpjEcgfXe/JfglIGU9c3KVHiM9e+PPyUPkLSBHd1eoSJGM7qoEvgKBqverwKD0kG0LuoD9a3xnnJSJftdi41cqjTd7BQ2kIdqIDUQPw+jUc/RCG4cMGph0WnQstpuapaFf1mlg9eY5HOr3DGy+nSZIy3nZQK4Bxvu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802350; c=relaxed/simple;
	bh=OTEN1DaOtUjbVq8sprWL2gVWbGZfMrJbFzgeJAqvJaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqTb2d/N2+McoJ3mkPqJ7wLmt4JfQ7VbmeTe0pyUc8E8Xods6ZtWETXVVxf/UHMgCLR7QSGMz1a6rjGBp1G/SbMPH9rLdEAOH0N5A9Y1aD1wPqPmcb6//SIIbdlHtN1WWWLtZdz0gFHGlQkN091OI0kbjXiFDsBaCijMPuJhqR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ANF7p8rN; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ANF7p8rN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YuQstWxJDXR/04PVLTbjP9qbMp3yZCsqLaieSEbXh9o=;
	b=ANF7p8rNE2VTcGJHz/ZlduVP9KN3auIwL60liLPmQLodnIBzBxcx4nTgpNN4Hu
	FTMWfjc7/1lb/SH3e/Vkse2sbu3y1OdSKxb6CKXcMnXRKA6xNNx61Zl/zWfWqkLE
	q1eCqk++4HmdwdXB7cW95QOZlmJdbTxdC0aelboymgDp8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXTxNyFh5odDutAA--.16540S3;
	Fri, 09 May 2025 22:51:32 +0800 (CST)
Date: Fri, 9 May 2025 22:51:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/2] bindings: arm: fsl: Add PHYTEC
 phyBOARD-Nash-i.MX93 board
Message-ID: <aB4Wcr0WtASkP0la@dragon>
References: <20250505075107.2579801-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505075107.2579801-1-primoz.fiser@norik.com>
X-CM-TRANSID:Ms8vCgDXTxNyFh5odDutAA--.16540S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBREqWgeFnS9gAAA3k

On Mon, May 05, 2025 at 09:51:06AM +0200, Primoz Fiser wrote:
> Add devicetree bindings for PHYTEC phyBOARD-Nash-i.MX93 board based on
> the existing PHYTEC phyCORE-i.MX93 SoM (System-on-Module).
> 
> Adjust the compatibles for the existing phyBOARD-Segin-i.MX93 board, to
> be able to add additional board based on the phyCORE-i.MX93 SoM.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!

