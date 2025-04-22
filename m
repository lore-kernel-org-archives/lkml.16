Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2055433C9;
	Tue, 22 Apr 2025 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289785; cv=none; b=tQeRBd4YJ1JJFyf7+Bknfz4Rua8wTSVFmRbhEXRW0vJ7vfbpdwstDbkUqlnq1ujBqzzaVbAGDQ2pqBgDOUO1gUwhKLMMzBfSbv7jam3gOO31PnOskJ3SvFoIGOlFWSU28pAcuy/FF4revfA5M4A3JNwfXMf0kKe9ew8ygy+94JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289785; c=relaxed/simple;
	bh=xpHrAJAJFPedpOrzRaEiKA30G7AWT2p9S4LcTSMGqGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Clhm3mvqU8nKZuQyEpwuAuC0QrfmLeFzLjrPBIdXndFfDNIqSfL0Ibzuu6FaDSr1SqbGnyuJpb5qjN0zD7GMjLin/caFLapMu/S8En6iyfNmgGUaOJEmmsnwQggZAhepE+Q+cOpTh7T9wqsCsB4iWP3WTBRcsy04+cM63a6qoyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WXAaQiA9; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WXAaQiA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=cUmlgYxptIyCDT5PtD6XKTU21aZLoOCOFtmQ8g7a1dw=;
	b=WXAaQiA9yyF3hY/Sa591LBbEdVNrTZYGNWOtMOtS+7dloeJ0DRJPcgdEruuLTz
	itRwd2LcOwZyAL/rlc4/XZMju/yXtq8EF6mEBQvhbceuaSpn9gjUjHq7KXjgseIA
	NOf+siWJ7LW/qnOFE/+QNVaM4HXlKoop7tJ6icBa/ZDhk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3tUIWAgdouj+8Aw--.13044S3;
	Tue, 22 Apr 2025 10:42:32 +0800 (CST)
Date: Tue, 22 Apr 2025 10:42:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Julien Boibessot <julien.boibessot@armadeus.com>
Subject: Re: [PATCH] ARM: dts: opos6ul: add ksz8081 phy properties
Message-ID: <aAcCFtuktdDOXyoS@dragon>
References: <20250314-opos6ul-fix-ethernet-v1-1-1c0172949b40@armadeus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314-opos6ul-fix-ethernet-v1-1-1c0172949b40@armadeus.com>
X-CM-TRANSID:Ms8vCgC3tUIWAgdouj+8Aw--.13044S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4CD7UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRs3ZWgG8J5SSAAAsa

On Fri, Mar 14, 2025 at 05:20:38PM +0100, Sébastien Szymanski wrote:
> Commit c7e73b5051d6 ("ARM: imx: mach-imx6ul: remove 14x14 EVK specific
> PHY fixup") removed a PHY fixup that setted the clock mode and the LED
> mode.
> Make the Ethernet interface work again by doing as advised in the
> commit's log, set clock mode and the LED mode in the device tree.
> 
> Fixes: c7e73b5051d6 ("ARM: imx: mach-imx6ul: remove 14x14 EVK specific PHY fixup")
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

Applied, thanks!

