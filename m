Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A46A21B9CD;
	Thu, 19 Jun 2025 04:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305902; cv=none; b=MqBdZHFHigXOI2vJYrOhtmUqdQ7uH+1dbie6ZWWj3o+Jvaa2AV7gYQPV64h1a+r6RS/AQ/ydmADk8gk1mhiD/WiTIWEn4RfY6jsay4RpE5Q6Ps0yuYjca/7gPJFVfcNKZ1jfDMSdtJyMhIN8BWAIZL56YYFEl95o2X44IOXNek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305902; c=relaxed/simple;
	bh=kmlXgdsNUgn8XgiTxVSrLP4WUDdb5I7hA+XEzKU2m78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv1Lkd9OUiYr6iwx2n6Gh428mEjDTVRukg6eurfjEg/3OSyGegrNT1PPSnste3uFC5J6JbLshbquL1ErDeU1ESMM9SfWxdJMH2oFSOY03aUASQoFal3qGb6mCjAwbY3rQ38kn5c8BlzSZVM0b1ubotE2Fld/DfsBNR70chI7bZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bSShQE55; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bSShQE55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9jL3UrAs4Pzh8kulwSxN4uC93Iezx2+kJVwgk+0EkKw=;
	b=bSShQE55tirU3sipXpiYeBLELSwKyTdAktdIeB5Ju68r2tne88Yk3mvskCIpQe
	HaLjME3x4OYb9HAHv3p5Sog2wQltkjwVHUSM5K0shcFeGUdLE7NdLhmi6nUsGiIl
	0sxO22PUZx64GHwecIFZYm772I4O74C7b/1xl/FcsfCPQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnjlE_jFNomST8AA--.27276S3;
	Thu, 19 Jun 2025 12:04:17 +0800 (CST)
Date: Thu, 19 Jun 2025 12:04:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Display
Message-ID: <aFOMP+eFULDDAtOr@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-7-a8f0195420aa@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-7-a8f0195420aa@gocontroll.com>
X-CM-TRANSID:Mc8vCgBnjlE_jFNomST8AA--.27276S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7sqXDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgtxZWhThWMa0QAAsb

On Tue, May 20, 2025 at 08:34:56AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
> comes with a 10.1 1280x720 display with a touchscreen (not working in
> mainline).
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!

