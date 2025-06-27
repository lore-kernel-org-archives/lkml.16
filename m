Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9CB21A421;
	Fri, 27 Jun 2025 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011437; cv=none; b=ThesSFdiJSeYTjFZdS1pBkNCy9g/zaudpvpsvwMMGNfx8wU30/j2+44cn1MUYW9KFlgMyoplU9Dh7063ESCs68yyRzI6rf7mYZu/obiQmqUrq8wjBhPI5cqlUsUwt98EVUPF7595i9qtY27lj6A/nD47siQW2DlRvvIl7tcKwLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011437; c=relaxed/simple;
	bh=DR0iURhckp5XfzMvSk4LgMuAnciQyHbp2E9NxNgrSgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpxIhiAxeu9VHkW1Hj+D1Ws/YlIw/60vkckBAvZY1e/BVdttSYJ2ngKRpcbFMOn/B8JvNpkCK4cz6cb3VoSUlAJPU+eipaeMAtRMeDrJ54aCPThyrN+392xXXT0G2H+esLwvqxVpZwc3jepeoMvTarbm3cN/TFXeqVC/p0rT/po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKdPvAM1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKdPvAM1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674EEC4CEE3;
	Fri, 27 Jun 2025 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751011437;
	bh=DR0iURhckp5XfzMvSk4LgMuAnciQyHbp2E9NxNgrSgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKdPvAM1SwN5SgSDdLEEOTC9vk+owg/oWIwcT5dP3WpUetyEuoQJKkYwXDxEENE5d
	 vhX35a6Tlr+PsBjbSwQsd2vHWBj8o5AXfAvF6Sq2OmK/2ncWANrWkVK2HkzAzb7WBJ
	 H5K2MrlZgoLw0qghldvzWZPN+SagJ80l+TdWZmIVhMAUL5LqYKCxZrRtpFgIFQ8cWy
	 UMBU9QnzwkCqklZecwcMC2WZ15qgXZTNPAOvDzoocBmoqHWN2G0PW3bXLW0TBaVAcK
	 WZzAqZI1E3ygtO0naX4bqMfIPaEcZttCIt1lTS6SjItT1jt9sGcuJ9sDt306SR7Kkh
	 5RztUAAts5Fpg==
Date: Fri, 27 Jun 2025 10:03:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: loongson2: Add Loongson
 2K0300 compatible
Message-ID: <20250627-gay-sepia-reindeer-2fde2a@krzk-bin>
References: <20250617162426.12629-1-ziyao@disroot.org>
 <20250617162426.12629-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617162426.12629-2-ziyao@disroot.org>

On Tue, Jun 17, 2025 at 04:24:19PM +0000, Yao Zi wrote:
> Document the clock controller shipped in Loongson 2K0300 SoC, which
> generates various clock signals for SoC peripherals.
> 
> Differing from previous generations of SoCs, 2K0300 requires a 120MHz
> external clock input, and a separate dt-binding header is used for
> cleanness.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../bindings/clock/loongson,ls2k-clk.yaml     | 26 ++++++---
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/clock/loongson,ls2k0300-clk.h | 54 +++++++++++++++++++
>  3 files changed, 75 insertions(+), 6 deletions(-)
>  create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> index 4f79cdb417ab..3e0a894cfb2f 100644
> --- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> @@ -16,6 +16,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - loongson,ls2k0300-clk
>        - loongson,ls2k0500-clk
>        - loongson,ls2k-clk  # This is for Loongson-2K1000
>        - loongson,ls2k2000-clk
> @@ -24,19 +25,32 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: 100m ref
> +    maxItems: 1
>  
> -  clock-names:
> -    items:
> -      - const: ref_100m
> +  clock-names: true

No. How does this implement my comment?

It makes no sense, why 100m even appeared here. I already objected last
time!


>  
>    '#clock-cells':
>      const: 1
>      description:
>        The clock consumer should specify the desired clock by having the clock
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson,ls2k-clk.h
> -      for the full list of Loongson-2 SoC clock IDs.
> +      and include/dt-bindings/clock/loongson,ls2k0300-clk.h for the full list of
> +      Loongson-2 SoC clock IDs.
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k0300-clk
> +    then:
> +      properties:
> +        clock-names:
> +          const: ref_120m

NAK, stop doing this pattern. You already got comment on this.

Best regards,
Krzysztof

