Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393AF23AE7C;
	Wed,  2 Jul 2025 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451830; cv=none; b=jdEK/x9EQYs33MxX69PiEmBi2Rvh+5Ki4448Y8EUrayTKTFmCtP3V7TakgzBPgbfIU+T8//Jl95pzl7jZgrB5nYhyNpdCAAAFpLRZ9w9zVh1XSJVNaXdspGCO5LGlAJpB3vFQjA16dBDj0sdojN5wiYvA6LduOzeiyeeL7UtHvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451830; c=relaxed/simple;
	bh=Av12LK1mnUPfzSa1s5qDHMGRo6c3vT8kL2n9sQL8Zzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6ZEjeqZLnTtZMdCKZef1X9KqsHDW2OaaCfRkEGmjJr/Zx0ybYeuVcw6Zi3Sp4hFnZvbXjl3zFdkEKpuslPwTkHQenEk1hnA8u/MgU9zEbzx7NvVCw0MzNjUF4+YSOeaYYNb457e1/12mmu2zjVhhPlCEF/FB5ztGK713dwp3k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=UUNchQHJ; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="UUNchQHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=y6uuRBxXrjF0Ae2i4iwLQbYWtBNxDN7FCHlkGJdSue0=;
	b=UUNchQHJYtiIreHerLC+4ldDYXQdm980I6yqLnHndHjhim136KwOAMoGGgLC5D
	x90VxOOmhp2O9LworOeZEvAox/NWhcdnoMvGOBb9lRY//EoLGRSOODYdrOu1uJCl
	O5mOYo/4330hbwt/F0E4fwz7q32mYCX7H+9IGBtQqOVLI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnpuOLCGVorhUqAA--.26800S3;
	Wed, 02 Jul 2025 18:23:09 +0800 (CST)
Date: Wed, 2 Jul 2025 18:23:07 +0800
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
Subject: Re: [resend v2 1/1] arm64: dtsi: imx93: add edma error interrupt
 support
Message-ID: <aGUIi62j+5btTDME@dragon>
References: <20250616181259.1989295-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616181259.1989295-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgCnpuOLCGVorhUqAA--.26800S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzSdyUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIA6Y-WhlCI7XAQAA3W

On Mon, Jun 16, 2025 at 02:12:59PM -0400, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
> 
> Add edma error irq for imx93.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
> Tested-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Changed subject prefix to "arm64: dts: imx93: ...", and applied.

Shawn

