Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2282753FC;
	Tue, 18 Feb 2025 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739859700; cv=none; b=Cd3TTd9v9EmhK5oz6q4TpngmGdG7C117+e0Bp0BtzJkhFCXxEU8BGsM8mWzHyUz3YPa8+2RDKesJSMV0YUGyzDFWe3HR/hXaNBARsOCTx219J1cIAJefSNhXPpz5O8QgRqpoWffOCxBxVA7VwVhFJHbcLcFy2c5nLvLm4R1vZSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739859700; c=relaxed/simple;
	bh=q158+Z5Icwl7GdjtXoRJILiV8zKFdnDo/ECKGMP0O3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7NTPi34IKjrWhik6nckaV1ZbEO0OKAMqcCqZcYGmy34w1NhA20eaba130drLLCtdXmbCow55spzy9PcEifbYOyX6eP2yw72imi16oq+Ie6G4tyzaaybhfIeanqvynG1aURxgi3TLIhDsG9rGMJ0B/pFE/VD+4E+EIsbhzt+9sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=XrHC4xvq; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="XrHC4xvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=r51NZJyM932DUUX3KUZoKs91XCO6S2lEq75YZIvO/ug=;
	b=XrHC4xvq1nhQsM6JiwiQ6eiZVYe6wh9M1+/GhpkdU705ElP6eQIApCwPG09TBT
	lUsDAd4R4DLFgC+HUSIfNaarwEXmuks5cNgnXMQ5+rLQ9fpJaaP6EbeBRkoz/45+
	u5W0lCGFQC0bu/lK/jVlMYcF3Au5OIox4BP4G3w5fHFdg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXOVXEJrRnVhA3CQ--.18612S3;
	Tue, 18 Feb 2025 14:20:53 +0800 (CST)
Date: Tue, 18 Feb 2025 14:20:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: freescale: tqma8mpql: Fix vqmmc-supply
Message-ID: <Z7Qmw51J0Dc3a88d@dragon>
References: <20250107150310.996683-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107150310.996683-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgDXOVXEJrRnVhA3CQ--.18612S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3oGQUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhj3ZWe0E1YVmgADsC

On Tue, Jan 07, 2025 at 04:03:09PM +0100, Alexander Stein wrote:
> eMMC is supplied by BUCK5 rail. Use the actual regulator instead of
> a virtual fixed regulator.
> 
> Fixes: 418d1d840e421 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

