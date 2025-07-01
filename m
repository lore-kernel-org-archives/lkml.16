Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503CD4A0C;
	Tue,  1 Jul 2025 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357062; cv=none; b=b4hH/y9Zm1yjNTxPsULwg4Jeex/VUXeMeZRjQrJ18VikJJb5iUEdacDQgdW0lKgh0uk54n0DTK/YbypZ7A3biIYh5h3WZdyoXfs+pE+3emnq0FfGrz2CuzurZA9Nf/d0b/3rbQaFd0jrufo33GZj+p4OjSPK0rYaPKFxlq5/No8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357062; c=relaxed/simple;
	bh=+nn4mynfVncLnfXsLNW0CJkiDB5PX367L7nyfXb/Cnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+3H4VF9zyfh0+K2MLxO4GeZsO9pOYThYAUmPlhQ+sfWT6fV29qGXunJVu8WMlLQJBol4aDK73tLxMPAhYDP0SPgwEK3jQUtRO3RPZlIyjFYIUnYxh3Wy8MStqLqrkc+3httFiCczm2rIXglgDmCipQIi+PXEzCTrb6F82lLndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dt0PJLkA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dt0PJLkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAD7C4CEEB;
	Tue,  1 Jul 2025 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357061;
	bh=+nn4mynfVncLnfXsLNW0CJkiDB5PX367L7nyfXb/Cnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dt0PJLkAnO5XXRxaKU/+MBh0mj06IYi2I9TYuxJAOgkM/LurIHOjtv3xmZ336T4iO
	 hV30SDjShYSqvhuBxdxJsrBcqhcgdSfyQfCKgrN/K0bWMgJkyq4CaPkI64Ni0ROoAc
	 G3Qe/gwpq9lOtzvExJBjpfVKBW5EjQ4s+/kRrqdSBgvmFnOcJ6WLWrt4uu5/+2qjo1
	 CTNEhuvkKjbVfnD9Frqi5bxJCR7sWntp/EEsUqyNCvDYEqPzpEgoFI+fxgrTV/cMqo
	 /sUfz/uYDEr8uYNodWml9XwPFVnVlS1CTWW0cAu6K4JOeE/CZg6g4XwlvLqYAH4cT5
	 FH6ksZJeS9wzg==
Date: Tue, 1 Jul 2025 10:04:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: imx: add dts for the imx8ulp evk9
 board
Message-ID: <20250701-quiet-hidden-terrier-ff0ad1@krzk-bin>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
 <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701002239.972090-3-laurentiumihalcea111@gmail.com>

On Mon, Jun 30, 2025 at 08:22:39PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add DTS for the i.MX8ULP EVK9 board.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 4da7501ece17..4b288b324d38 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb

You got comment about ordering, so it applies here as well.

Best regards,
Krzysztof

