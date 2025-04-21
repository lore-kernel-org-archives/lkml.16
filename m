Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEBE18DF86;
	Mon, 21 Apr 2025 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271516; cv=none; b=KH5nYwFxRoqk0Koj1FPKtk7alNTVH3eRttWiJlEttAyUmSxl4pMUxm89vIKW8eFGxUBpBU26yPe006K+up7ylLwomrXcdJkt3xNXyFVJMH2kXnEIwn17aEfFGd3Pg34ck3fgAaM9LOBk1LspaQGu1YzJhtJGeW9E+AqCc2y7ODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271516; c=relaxed/simple;
	bh=teUYICP7yxIXUdOVNrYCte8DQh1l8t6HHmNsrha758w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUl9hIsqR8zrLiNEFbhYBgEc3IYM4pwvaz7mzFbfR66ca2GFrS5EfZ8VCoxsLbzzhlGz7NcZqhXPcPn7acnwrRv68i1KCLPHfTYUa95sMS5iTtAaLQqvWnFjgOpNyvd/J9wTjnWkLMuXx9tJxPcd3z2tLy3ULZeCbg60VOGclvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brih1nJa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brih1nJa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AD3C4CEE4;
	Mon, 21 Apr 2025 21:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271515;
	bh=teUYICP7yxIXUdOVNrYCte8DQh1l8t6HHmNsrha758w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=brih1nJa/PjX5hVF83+YmG1qJS+oDhbzGboBmkmjVmmkWCf7VGmK7+sX/GaHn8RWQ
	 WQcdc4fYLk7MF2rwQ3fnV5xIRtRs+zxHla5KLEswQuAPMkhd1du5EIFrKd3W2bWljJ
	 oauBvw4tfteGbe/lF4yR7+ozUr91LXlJ9PwlCEzJyMt0BicuYfYQCEKXxBbI1nCleX
	 9ZTNAig5mE7XglwCcA1oK9Awy8soREhYWX6UmcxJ5e5pMPXpMGFo83FdtlgVuDQvTU
	 TLNcl37f/y4YbXWxQdjwHmHbXD0PFsXQpv6zwScJXbOHbfLqArW3wYuGFgt/MLIPFK
	 UKRKEK4ZqjNag==
Date: Mon, 21 Apr 2025 16:38:33 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, houlong.wei@mediatek.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: mailbox: mediatek,gce-mailbox: Add support
 for MT6893
Message-ID: <20250421213833.GA2966253-robh@kernel.org>
References: <20250416120230.147844-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120230.147844-1-angelogioacchino.delregno@collabora.com>

On Wed, Apr 16, 2025 at 02:02:30PM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
> SoC using MT8195 as a fallback, and add a header for the GCE
> mailbox found in MT6893.
> 
> Similarly to MT8195, this SoC has two GCE hardware instances, but
> the event values are different (hence requiring its own header).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mailbox/mediatek,gce-mailbox.yaml         |   4 +
>  include/dt-bindings/gce/mediatek,mt6893-gce.h | 312 ++++++++++++++++++
>  2 files changed, 316 insertions(+)
>  create mode 100644 include/dt-bindings/gce/mediatek,mt6893-gce.h
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> index 73d6db34d64a..277d290d852b 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - mediatek,mt6779-gce
> +          - mediatek,mt6893-gce
>            - mediatek,mt8173-gce
>            - mediatek,mt8183-gce
>            - mediatek,mt8186-gce
> @@ -29,6 +30,9 @@ properties:
>        - items:
>            - const: mediatek,mt6795-gce
>            - const: mediatek,mt8173-gce
> +      - items:
> +          - const: mediatek,mt6893-gce
> +          - const: mediatek,mt8195-gce

You shouldn't have with and without a fallback.

>  
>    "#mbox-cells":
>      const: 2
