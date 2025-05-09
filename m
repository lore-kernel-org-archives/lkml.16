Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B32274655;
	Fri,  9 May 2025 08:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778683; cv=none; b=JyttUmQ7anvB/OKqQ+JZkcwXyNEulpTIjMA7rGfEtFkEFSGs+vfvAPB7eJIxxMz2QvHsQ+1mj5BJ71Re34c3Oh3gTPq+sfUU8z0CFDWRFSjQZtO8mAp4LXRSDKew5nRr6zBEx89pRjGXuqwztVN2uWS9tAunxgvG3RS4J2E8ZI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778683; c=relaxed/simple;
	bh=LEc7U+I9G51sqHV7RljhvrdYtvuLXLnuCERRfYfMQ9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzrs9u2ijWqZSj9ioqDjDGt+e2QZP0vjiLv4FhQMdOnh3gLDSy+uReatSTLNhAW60ParsZpk650JtaDd9ZLZLS0i4lolr9akzOWMAYh0W7tKZFbxilfGJGXRpHfIdhCcM8L1oF3ldXl9d9VQ+tRRA/H56ngJu+bVa0uTPanZFUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gkwARIDO; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gkwARIDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=MV3SBaP/NkJLElhKVQb3ChLAstdzKu69i8UbJJug81s=;
	b=gkwARIDO8HqvFi5wDJfHa30q7ILPqvIcbpTEwH9BgxhvqMDwTfUGnY49gXSEXy
	sfTavXq2+2Uw5iccg5Br1Twy8thHfjuLIcS8JnNOIonNqInAosvs4iGBrk01ze6N
	ndNxfTguVrKHupZAvZ0zmTUdBAUWof589jGxgqZXLkRAM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3n_wVuh1o3uioAA--.11456S3;
	Fri, 09 May 2025 16:17:27 +0800 (CST)
Date: Fri, 9 May 2025 16:17:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
Message-ID: <aB26FRq/Ets5fiRK@dragon>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
X-CM-TRANSID:Ms8vCgD3n_wVuh1o3uioAA--.11456S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrZryDuF1xGw48Xw4fJw1DJrb_yoW8Jr4kpw
	18Krs3CFn3JFsFkF1rKa1Yvw15ZFykGFW8uFZIv34vvFnxtFs0qw4DtwsI9rWDXF43Wr4r
	JrnI9r17Ww47XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVCJPUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQFIZWgdteEUjgAAsG

On Thu, Apr 17, 2025 at 12:14:04PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
> module bindings.
> 
> This support is not officially done by Ka-Ro electronics, if they at
> some point will supporting mainline, this should be changed to them.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91fb6431570045495ec23 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12779,6 +12779,12 @@ S:	Maintained
>  F:	Documentation/hwmon/k8temp.rst
>  F:	drivers/hwmon/k8temp.c
>  
> +KA-RO TX8P COM MODULE
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +L:	imx@lists.linux.dev
> +S:	Maintained
> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> +

I'm not fond of such changes, as MAINTAINERS file could be bloated
quickly by individual DTS.

Shawn

>  KASAN
>  M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
>  R:	Alexander Potapenko <glider@google.com>
> 
> -- 
> 2.49.0
> 
> 

