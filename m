Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F53E239597;
	Thu, 19 Jun 2025 04:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305783; cv=none; b=iVN3QnxITomHpxOvHw0+js0hTaX+8BeLUzP/aKRH7Anx1c782H4fSO/kW43S/H/5YxMIFfwNPMdYZfp02JY31BZwMnQD+GdNuP16FvEwF03dyYLjMeUR4OARwtpzaZCYJrmICHEXxmz20+kq5I4QGFyyURejI2tmGLu3qSm+WXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305783; c=relaxed/simple;
	bh=Pi4qrtCpLUahgMVpz6PVdsi6+O+xYoZbDJIzawuwvNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvBsFYQtP+Q3LmsEhxqAn+a8R96zlowefZ+RpvZ5jp+WAI1e+xYE3061OARdAePJpTiPq/Q29gI2qgTlWqGPZ/tNFFpAJbQkaH4fXPmq2OTD7tXPFpjDEEC3dWOrYiJ9hNtfyxQ9Uf4iqMBO22K76AkFkLezCt19m9ly6tYenxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GIoFFEYC; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GIoFFEYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5fk4eKprQME0ysShGROXKcBb5kPJKh5RJXwot7YF45c=;
	b=GIoFFEYCbxt+94DCzf/RcjER+1ekHvOr01qXrgNZfnLtO+ZCxm0o0Y2JGyI85Z
	7MQOuUPtFIHf85X3Z/pIRRGp0WpjJ6Oa5rs2uBLoc0GhjKz7zX3vVlr0oveGjMCx
	wfkGvqp/cL9AKtmj9O27asFYT38OfdBQwIjAqiMlLKCJU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD33_TIi1NotZ38AA--.63985S3;
	Thu, 19 Jun 2025 12:02:18 +0800 (CST)
Date: Thu, 19 Jun 2025 12:02:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
Message-ID: <aFOLyCB5plPmrRyp@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-5-a8f0195420aa@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-5-a8f0195420aa@gocontroll.com>
X-CM-TRANSID:Ms8vCgD33_TIi1NotZ38AA--.63985S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOpnQUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQoEaWhTi8prIQAA3i

On Tue, May 20, 2025 at 08:34:54AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has
> 2 GB of ram and 8 GB of eMMC storage on board.
> 
> Add it to enable boards based on this Module
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!

