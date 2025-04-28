Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083AC1DF99C;
	Mon, 28 Apr 2025 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828957; cv=none; b=gOh0XtIWSsJtMdDnvP+lMR72ihJjn2Tbl6Y6SkI5MZ08ogCNOwUP/FZs6cqNpQWgo+lZJQmsLJt1ydJcJ1//MGXCLk0V+/rEawrnstw5DA/bEAAh3Lk3r943VKKf5qJntac6t8T/9mqDTyLIo4QJnWoOPht6f7IoFiArrRx8XyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828957; c=relaxed/simple;
	bh=cGQWR8jhKsA88ie48McerFwOTjkySfn7kxfyN/o03kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eF4nwb3yPVGc/dq8LBN0CVeMjKLNdUOik3MWv/lf6n2zUlXioHp1AU0teSvTKjkzs62HJdwHwqb6yKnoRqPCgmeNYhNkl62wgT/BPrLV3cxCI/tI5Kflgq3QHypReZQ35zamfOA2/GAaC2+zscf7QMp+eG3wGFC5Z6BqZXVpiFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSsc9NbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSsc9NbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DB9C4CEE4;
	Mon, 28 Apr 2025 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745828956;
	bh=cGQWR8jhKsA88ie48McerFwOTjkySfn7kxfyN/o03kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSsc9NbZ2OSX6s0FYmkOrwZ4Y74di5SxQ6HBbf6tgdP7n2h957ekjxLAv9ilO/rD2
	 dirqo66vOK6jJtwxntmnjuAfK9JdXlgGf4sMesLv7Z90drZS9fZqpl1+Rp8d65/pPI
	 mp7I/0Yp9ILFuLR+wwL2ZEysja3HLgT2u23WG603H1EOPEP/zec4Hv1SlX2AiT5/nb
	 8OFdNeDp7A5nB5ztO+cBYLW9M5WOIRlOvIMjX8G0jPGnf+7haxCnlpQL6CHQOT65AI
	 GyiRBBGT0lQxy/mI6HpomVcx38Hje4+xxayzjLfDhLTb1r1mr+OiVaHn6TNEDuzojP
	 3GREHEKb+H+TA==
Date: Mon, 28 Apr 2025 10:29:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93
 board
Message-ID: <20250428-neat-manul-from-avalon-b2db3a@kuoka>
References: <20250425064107.174548-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425064107.174548-1-primoz.fiser@norik.com>

On Fri, Apr 25, 2025 at 08:41:06AM GMT, Primoz Fiser wrote:
> Add devicetree bindings for PHYTEC phyBOARD-Nash-i.MX93 board based on
> the existing PHYTEC phyCORE-i.MX93 SoM (System-on-Module).
> 
> Adjust the compatibles for the existing phyBOARD-Segin-i.MX93 board, to
> be able to add additional board based on the phyCORE-i.MX93 SoM.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

