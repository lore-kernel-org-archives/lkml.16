Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C06C17C98;
	Fri, 25 Apr 2025 01:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546150; cv=none; b=M19v8vqE0n3yPJ7DUhoH+phX2o+LHPz92uMnam0iO6v1n6L02aycFb4tCEpztYwM6M3t0wfaC0W++tbB8TsMa8O/t0I+OP0tHukXAhTJO+j+KfWrtXZ67PVKjQJy7XErXrhFmv7QWJehAsLytzXc0GxU4bgh9jcx6sRRI/nz+lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546150; c=relaxed/simple;
	bh=mxwpAhhP6PGemJvPsnX77aX3b1YCcQSc3Ls+GASAh98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0rLQ92g21sWbe8sdsPR3ax0jD69jlS0FspD1x88M2rmBZRw1HK8lgI2ac+TEMUDQrcYqm6bEhuA2zD3ZdLHU+7h+EJJD5wxh74Kx9C+qsLXbuj/aQHEJfYMKQLVESCu62reC4bjdgbsY0+Ip3tbae3EAxxhSi64/S6Y7PCeKko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=XK7jsiJc; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="XK7jsiJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Id22/7tm+Zaocd+//weofrSOLUTaguDbJHut8xcfyCY=;
	b=XK7jsiJcvUalXjrajYdMc3nboZ3OB4yi1na1bZ64d+AI78qWdVfWuZoJYPl886
	bGl2ZaxaQDVqJxNOXsDYxtdadTdJb0OtiIhzvaAIG5Na7AkXAyElEQsuhuZCJgyq
	AZVGph5nnNaSuP91oopBWGh5nMK8tdHpI/z5hi8i/uwAA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHBNNs6wpoRjTaAw--.27963S3;
	Fri, 25 Apr 2025 09:54:54 +0800 (CST)
Date: Fri, 25 Apr 2025 09:54:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Vitor Soares <ivitro@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add support for Toradex SMARC i.MX8MP
Message-ID: <aArrbFZxJKRJ1vCT@dragon>
References: <20250414123827.428339-1-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414123827.428339-1-ivitro@gmail.com>
X-CM-TRANSID:Mc8vCgAHBNNs6wpoRjTaAw--.27963S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyxJry5KryDJw1xur18Grg_yoW3Krc_Ka
	n3GrykArZrJF47GanIk3WSvrZYkay2yF13t34kZr1SyrWkCF93JFykKw18Aw1fWFy5XF1r
	A3sxAws5ZrW7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0RWlDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCws6ZWgKsODTPwAAsB

On Mon, Apr 14, 2025 at 01:38:25PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds support for the new Toradex SMARC i.MX8MP
> System-on-Module (SoM) and its Development carrier board.
> 
> More information on the SoM and carrier board can be found here:
> https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx-8m-plus
> https://www.toradex.com/products/carrier-board/smarc-development-board-kit
> 
> Changes in v2:
>  - Move the Makefile rule to the proper place. (Daniel Baluta)
>  - Remove the dsp_reserved node, it is already disabled in imx8mp.dtsi
>  - Add Acked-by from Conor Dooley
> 
> Vitor Soares (2):
>   dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier
>   arm64: dts: freescale: add Toradex SMARC iMX8MP

Applied both, thanks!

