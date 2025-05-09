Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1967E230D14;
	Fri,  9 May 2025 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802481; cv=none; b=cXJAYS14q9fxrM7Ea5eYlkHWUOWx7L/6HUkC9zkbJxj5NqU3fjaOgZe2LmVQyqraLtiKAyQ444Po9dD0fq0Wd9h4cyOzNP8LUcBvYV+Z7JIlWQvioOB/ZfaWHyzI2GMqFleP+eawJTfCpphoV6ChZJ9zd6yEeyFJcK5nk63sVdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802481; c=relaxed/simple;
	bh=ftCFmTDm4MpBp+NrzQlh8AVYNKU4PO8esHvpD3a43fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWyx0rThMppXzkmAMRjxGUBTyW6fDhufGgSNPHdt6iJMiYmcL3NkyoSvGJpCHWCMToLCxlnu0DInR9wg/0HCzzJ5LlH6JbFeivnaTOpartrRLRhpNbjpTIfJlBVG+4/qdhGIDeLhecOTrg95TXjFIGok2KCDNuI5zEqFn5eP1Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CAQD5QrC; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CAQD5QrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oPlOYtBazf98uWZHxWpdn4kV8cJsQLj4ZpKTkdWd44U=;
	b=CAQD5QrCGozhLcpHXuJIkNPy0br7JHKOGqMxioVLuJXJ+uMSG8o8WB6qdujPvn
	sVt5Qn9NJecoUJJ7DO4kKog3/jnunrHXckX7hbzvSaXuJCu0kk86T4JBarYja0Y4
	PVopQAyz/2dotQLiOa/SkXRlk6wkw2lh+aTp9OiV5Rrxw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn3_MIFx5o9kGtAA--.4244S3;
	Fri, 09 May 2025 22:54:01 +0800 (CST)
Date: Fri, 9 May 2025 22:53:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: mxs: use padconfig macros
Message-ID: <aB4XB+OcNBCkcW3m@dragon>
References: <20250507141504.1332054-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507141504.1332054-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID:Ms8vCgDn3_MIFx5o9kGtAA--.4244S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwxhlDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwpIZWgd37XrywAAsT

On Wed, May 07, 2025 at 04:14:58PM +0200, Dario Binacchi wrote:
> Convert mx2{3,8} dts files to use the padconfig macros defined in
> mxs-pinfunc.h.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied, thanks!

