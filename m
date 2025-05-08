Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE10717A2F0;
	Thu,  8 May 2025 06:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746687145; cv=none; b=EmgF8U76OFpKxtQ4zIDPfTZxYm5vsvUMbict9aHe/lA0XphtNd/UIkc9h53aoTLDDNuen7knRaH3DtJt0wVGVKTOGh0MslAtMhZPAWB5650v6i3KlDEFKegd8f8EQyuBoC2k+C5kFpDxQbpA6P9mbfCj1oASGj2IvbH73sXmQxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746687145; c=relaxed/simple;
	bh=tecbk3ac3kzS2flvcrppX2MqqPsn+j7M/ac16YLakR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lINWDBdtVwSJXtbCE8uQGCBOqAve/KWyoBoLPvgRmz4FMEYEDk8LElqbQI3G+MVKAwF0SZGS1FVhaYpQ8Tg7xAUrXXXK+m9v3/lLyLc5IwwDgj/1LoBaap9xbnvA+NryHDXi4PzUI/MNA/fDZEVCd+qySlvuxpCCaZX8IEh3J7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTV1rZSu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTV1rZSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBE6C4CEEB;
	Thu,  8 May 2025 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746687145;
	bh=tecbk3ac3kzS2flvcrppX2MqqPsn+j7M/ac16YLakR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTV1rZSuPPwkbhR8m+X3vtJqwr+OJ2p8ManFhj0/2KhA9YwFLEyv6kqG60V75Sptm
	 WbcUr0Cv7XZvDOQqHl0O7vh8/Vx4uFqjWDfMZQszNF4w6MIY9pBOydIbKz6M38lH+I
	 uUYeKba8PCDkW+wmSfgqQxVq/YG5EBHPaZPnJ1++m1mjdzxvKFRcnRAc4a6d5w6rEH
	 K8Gw2XR+rw169Wqvj3xXNhZgS867Ayom+YElg7bskbT7nmiVfvD7m1A5psQ081xL9R
	 eHZQjba1O8+7zNpvBfc2putL22EbnKmx6y2oBCo/bhcP/YpC5SPvHodNVGI/xTjxLT
	 kTz58a4DeVyOg==
Date: Thu, 8 May 2025 08:52:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250508-illegal-caracara-from-hyperborea-b77eda@kuoka>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507-am62lx-v5-2-4b57ea878e62@ti.com>

On Wed, May 07, 2025 at 10:09:20PM GMT, Bryan Brattlof wrote:
> +
> +	uart6: serial@2860000 {
> +		compatible = "ti,am64-uart", "ti,am654-uart";
> +		reg = <0x00 0x02860000 0x00 0x100>;
> +		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&scmi_pds 82>;
> +		clocks = <&scmi_clk 322>;
> +		clock-names = "fclk";
> +		status = "disabled";
> +	};
> +
> +	conf: syscon@9000000 {
> +		compatible = "syscon", "simple-mfd";

Not much improved here. You cannot have such compatibles alone and the
bindings test this.

Are you sure you tested this?

Best regards,
Krzysztof

