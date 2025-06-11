Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD6C17736;
	Wed, 11 Jun 2025 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630588; cv=none; b=QE6MV9KflixYkoBh61PIba/CRm/LeHGIoKfg0X9ROGvaFpEC+CGyUBG0ORcj5jn1AQhBjM3IlIDZCYodxW7I6ZLi02TlPFRlBqA5sEHelt178CrRxWj+WtqvrYmQJTGnfTtk+CWnCc7HRTTySYUsV8fP7fQd/Vmy6TbXYxHWYmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630588; c=relaxed/simple;
	bh=K01kD1CXP4y2QvIDW79/rq2TlSMRwkIQQVW462JBFmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkGM4km3JPvod+Kk8fi5L/2lbPRHRYyeA6Va1dd0M5S1sbtVmeSlytyyD+Hg4uOLHuu0I4QjQFnnzwNgVdQrnvXHeQBbeCkbroRq5El2OvUuNqPYcKIb12gdr3cQqQKdazQan1OjIOKIM8A2aTKdYH7xRLX1migTGeEQTsEE49Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cXeBc1fD; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cXeBc1fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ahMwYnzAqR2ccux8pEM9neDBaxqHAvqHao7Hj/i4BgE=;
	b=cXeBc1fDyuCnOgI1P/kEJBnpW0hvRhbh+DUKSFrRLqp798QPGZtjWM+AleqnS4
	UdkB0yM0B0UpZBk9YL8Rbs0oTRvlDIO1pBFdLatlmPSDattVvdTbGkqcJedj5W18
	NobAAPqqAYTnn4oMeK9oYqLLdhK5J4UYwTCPYMCAaytbY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgA3180UPkloM8lpAA--.43803S3;
	Wed, 11 Jun 2025 16:28:06 +0800 (CST)
Date: Wed, 11 Jun 2025 16:28:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V4 3/3] arm64: dts: imx95: correct i3c node in imx95
Message-ID: <aEk+FEq+Ivj5wfVW@dragon>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
 <20250427083230.3325700-4-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427083230.3325700-4-carlos.song@nxp.com>
X-CM-TRANSID:Ms8vCgA3180UPkloM8lpAA--.43803S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOKsjUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBYBZmhJPhYL6gAA35

On Sun, Apr 27, 2025 at 04:32:30PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> I.MX95 I3C only need two clocks so add clock fix. Add "nxp,imx95-i3c"
> compatible string for all imx95 i3c nodes.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Applied, thanks!

