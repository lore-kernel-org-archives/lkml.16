Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FBA944F;
	Mon,  7 Jul 2025 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878970; cv=none; b=shY2+esfHnmjJfukaMaszM3ZYA2iBt2Y3H5/J8X+2LVfuzYjo3XGjGPKnLJ6fXVsGj4WHK0oPlDAUp8gqij70yc1CgkDMggXpqxYdV3+Z4Xl3vklLoyLIvSPXeVNpM9aiucFbHoFbb5O15BMaft2BFlLO0wZ6rgM1aan8vhtfNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878970; c=relaxed/simple;
	bh=FTGqUyW93lewUVwmc1LrpUgjcIqBOp7eeSxuuA4yea8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFuUy8mh5GNaLC7NCN9fhmdVAErWgNzo0zAraR3YU2FD94Ey3N2Nv3uTdParGi+Bb7eWu88PqmphH/idGEwfZdiLfWCZIG94wMw2QVc9kQJB4/fHAtLmhytCpwcSCZQIMJsrOR/ah2eEaWWmNC1C/LBMAM1IOdsrGjbWpmr0llw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Eljto0eD; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Eljto0eD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sHBLCi+DIw3uUiQhPef0s/I0wx23cXQdEUx2HNS8QpA=;
	b=Eljto0eDL4gDa1GyStcrRd56ugcUeW2ozC1EmSo2NJY9WiDhyzsu8P8mLlV6UW
	RUvhfRh7JKgAqWqKk0r/TBbbrdLNVjHOvB13UKjnDVAq5B5lFy5l6HZmE4jqLiJx
	nd1OcXpYQRiUvFqVZQ6nYjxpfw8vK+4/IpKWg4X9JB9gE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD37wgRjWtoZQp6AA--.22272S3;
	Mon, 07 Jul 2025 17:02:11 +0800 (CST)
Date: Mon, 7 Jul 2025 17:02:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, ping.bai@nxp.com, haibo.chen@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH V2] arm64: dts: imx94: add missing clock related
 properties to flexcan1
Message-ID: <aGuNES0DTTcm-eCm@dragon>
References: <20250702062724.2459200-1-sherry.sun@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702062724.2459200-1-sherry.sun@nxp.com>
X-CM-TRANSID:Ms8vCgD37wgRjWtoZQp6AA--.22272S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7jg4UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhNcwWhrjRNGAAAA33

On Wed, Jul 02, 2025 at 02:27:24PM +0800, Sherry Sun wrote:
> Add missing clocks and clock-names properties for flexcan1 in
> imx94.dtsi to align with other FlexCAN instances.
> 
> Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for imx943")
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Applied, thanks!

