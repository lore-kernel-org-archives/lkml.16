Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0B2749CB;
	Tue,  1 Jul 2025 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376833; cv=none; b=tSoAxrR5oMVGjtWqN1JS3QTlVT35ld1kBNHi6hl81ZpUv83n8WAhODDSvQXXa1rHz9D6kgS/s88LfuQjHvtPQUcdI2RlbPkmaMIcVnfJjMxQ2c2mLBqZyzIjeJ8gePGMw/qwvgoqGd6xYR9r3y4+cql7NzptG7/uwyRocbOSK/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376833; c=relaxed/simple;
	bh=tmckpZ+LeV4gRKeqYD0pXo1Otiha2TbVF8apliPBVwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0gVujA7cOhulCOHws8oVL6GxBZzu7qjAxhb1GMivH0wvnuS/OrmsbALbmUxklt7T0X2xcem+C4zSBzUvuRh8fZ5LmEQHZWcDp1XwMIpk4wU/PLnBJN/ZUBY+uHVYqrT2YVRaH9UaDKDz6ctiZrXx28+QapzyM0JFwZBA+o2rkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=oxGR1fJR; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="oxGR1fJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YlOXn2QdKGfBXkKhkm4yPrNrC5aKO1sGXt2KBKxXjcA=;
	b=oxGR1fJRqwlIx3lhqKThp4PryCDSK8yu7lv8JhvaNJNTBJRiAJ7/xkRHDjC0IG
	IYyfPMSrYflApQ/dDtdwxBle02eLGsIHDF54Mi4VnLupRF9dvpctYaXjM2Lakcnu
	Et/XuQVxpBWuU9/PhV+8ocAGfR8deKrTy2mbRGt/QP5co=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3l9qO42NoKVABAA--.3311S3;
	Tue, 01 Jul 2025 21:33:04 +0800 (CST)
Date: Tue, 1 Jul 2025 21:33:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: freescale: imx93-tqma9352: add memory
 node
Message-ID: <aGPjjrT4AAwGh//b@dragon>
References: <20250604093122.203929-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604093122.203929-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgD3l9qO42NoKVABAA--.3311S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOPfHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRAQdWhj45APxwAA3k

On Wed, Jun 04, 2025 at 11:31:21AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Although the bootloader should fixup with real memory size,
> add memory node here with smallest assembled size for
> readability.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

