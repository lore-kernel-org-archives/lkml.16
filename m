Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C0F242D96;
	Thu, 19 Jun 2025 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318440; cv=none; b=UkQ1krnOQrXnhUpIcB2OVG2l3g7w6k0soiUrTk93xtg4fCKSZY6zpL9p7MkrYMvmKxQ5FylF3mAuP4uEqR4fLHmtl/w8OysZbRl/PNBQZylALY3vZps19haK8X3Iv9/7rE2WE+i/aISes1+kW7+OCMGgE/4Bh7Cd1nJQUTfzGLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318440; c=relaxed/simple;
	bh=Qrruz0ihY1HWjqyIP6ErG3IY/GM/vgxQHIPcy+7dJyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SL3J1iTHzuZbolaRgu0TCkfXvoYqM/fUEhqGmbVZz/gxS2GHvffIJyY1euOSO9c4vXSaC06Cgt7hgZFvf2MUqDVQKuVIeqQWRa1VG2ybufOcDjKQMVsEUS6ekJBoUPvzOjnIhet31mKadTb/Ty585jiSFQW9Z/3THmNtx5/RboY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lxTLwirY; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lxTLwirY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qQc8KBNXic1DZnFfIwGfGX0puZguj5Ag4lvx2OkjmOM=;
	b=lxTLwirY93ccLYht3790YvQzbm2YudORaWDoDB3WQ4mKTfszjLri6EFbpbUF9l
	x65H8Uhi1E33Ds5odQC0owBP2s0cw3RvxDrcwRx0ajC/wXUMGUxzgbV33MURRIQZ
	zxh32iF+9i9aIC0XwrDAGyK7TUgkBlwu5RR4AUESYidvo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBXVlEzvVNo33X_AA--.29592S3;
	Thu, 19 Jun 2025 15:33:08 +0800 (CST)
Date: Thu, 19 Jun 2025 15:33:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-phycore-som: Move
 ethernet0 alias to SoM
Message-ID: <aFO9MpNOSzTGfyJU@dragon>
References: <20250522083909.533567-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522083909.533567-1-primoz.fiser@norik.com>
X-CM-TRANSID:Mc8vCgBXVlEzvVNo33X_AA--.29592S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrGw43Kr4fXF4fJr4xJry7ZFb_yoWxArc_CF
	W8u3WDAw4UAFya9343CFyFy3s3tw1kJr1IvrWagr93t34Fg3s3Gryvvas5CF4xW39xtr13
	u3WSkFWSqrnagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjMmh5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRVr0GhTvTVkkAAA3I

On Thu, May 22, 2025 at 10:39:08AM +0200, Primoz Fiser wrote:
> Move alias for ethernet0 interface to the phyCORE-i.MX93 SoM include
> file. The reason behind it is that the physical location of the PHY chip
> connected to FEC interface is on the SoM itself and alias thus belongs
> into the SoM device-tree. Consequently, it can be used by all boards
> based on the phyCORE-i.MX93 SoM (phyBOARD-Segin and phyBOARD-Nash).
> 
> This also enables us to mark FEC interface as the primary / first for
> networking in the bootloader and systemd (predictable interface names).
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied both, thanks!

