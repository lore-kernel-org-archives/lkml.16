Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D52AE97;
	Tue,  1 Jul 2025 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378600; cv=none; b=IG/2D9XSziAFZ4APJlzaltjY0I1lMCHp00dnShPSr+MBVkuCwxDv+pLAi0Y6pR5CqFrEYE5UnU7q59dU3j9Bk1IAynIb58/N1WfummR6IR7zK+xAmcK+aju/LFAoDdZAg6Cf0WlA8xCBReswMdISr2ZYBZ+3T28i0tHweKRf3aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378600; c=relaxed/simple;
	bh=yd+dBNtBkUXAFtwEN3ayJRELOIDfTT3ldH9eeDwqeac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdJdzQ86mhp+cNziAahkvyXrq2UNJDVMylKub/Xkxi7+x5B5r6OXMzSxBYwHjxsGNTtXdV2cn8qGncYGMTGcdmmNqrOs1bQxkOHZ19zg+YmlR3wakzmgip5CZoFCzAWzq17URRakoCKPXPMPfa+q9qnP4gdfEU+sUXBnOHRcuis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LV+rGDcD; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LV+rGDcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=6vBKiSD84mol3nmkRzXKHoMDlvMazbOUAfI03BMNNJM=;
	b=LV+rGDcDEFXGiAzqBs0SFmO02V5Q74fQpn2i3cDqyZPjwauIrYBj2WnuwzWV9U
	mjUM0Mbri96xRf9OmNDL7MOXMPJa0uIm3+GeAiarGIZx/dnBclprOZwj0SEHvmZm
	+iNJ9mrvlleVTBov7J6uiOC5KTjWNvtnvR6SQA5R2b3Oo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3f+x06mNoRp4BAA--.4021S3;
	Tue, 01 Jul 2025 22:02:30 +0800 (CST)
Date: Tue, 1 Jul 2025 22:02:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: imx95-19x19-evk: add adc0
 flexcan[1,2] i2c[2,3] uart5 spi3 and tpm3
Message-ID: <aGPqdBfNxwvxUroN@dragon>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606190045.1438740-1-Frank.Li@nxp.com>
X-CM-TRANSID:M88vCgD3f+x06mNoRp4BAA--.4021S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUF2-eUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBbKMGhj6nbFigAA3U

On Fri, Jun 06, 2025 at 03:00:41PM -0400, Frank Li wrote:
> Add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 tpm3 netc_timer and related phys
> regulators pinmux and related child nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

