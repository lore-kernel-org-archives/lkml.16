Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D262FC0F6;
	Tue,  6 May 2025 03:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746501383; cv=none; b=Wghjj8g648HlwQUwAPsFWhD7/HK1wmSBmavfamYUZa/OTf6nDQV0YJJebvL5JZJX9GGVlNRvY7W1r/cB8WDWRixA9aSi3rnPkpPxdiMbmdc/xeONxQV/mi1dhvnamLCMpbpEWQkHOgXkJqCNN8xbxghS+qxI4OmEI70aoIhbsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746501383; c=relaxed/simple;
	bh=BvOr7NK5R2aGH1ZVeHRXfa7u1FmSfQWOwX4gQOAnSvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=llnVw/L9TofC0Pd6zmvmMi4seZ+ungcdMn8FpyQbxjDKCMaDQPVejZnm9U5slcX1l63xaWTlT8YZ9GVvzDHGC4vDsUJ/pL+OTtyll7poTl6m6eltr/6G6FtUXZ62zlRRWx4coJ4GnaHgywiqlXVGPa+wUXTLe4HwV3YQWSVMUjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=QEzvMZMw; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="QEzvMZMw"
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 3A59B440EA1;
	Tue,  6 May 2025 06:16:09 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1746501369;
	bh=BvOr7NK5R2aGH1ZVeHRXfa7u1FmSfQWOwX4gQOAnSvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QEzvMZMw4a6uOv9CxaGuj+i4uu+7yVAVgs3F74nLbhHrichdcXqSdsugr3kFzQ9+6
	 K3kx5ajkGVv5PvRTcmX39/BLk8zKVJEMvknm/hXXLK8hRVLxWuImC2YC5UZHWKYaej
	 hHwipghZCzA761JXtMh8W0mRjwTr8/EATBPR/g740s63+b9EUkFg+5Mprv8Q2+c9eN
	 6zyhk1vm/xSeTaThKNpyQBO05/SwbkG17OqY6J4LFz9SUdnJNbgwdDpRY5NGBfd43D
	 yNEEh8BeH26y9QtV35Xpd74blUl5Es+zr+rTb2GfKgMZ/fxMg8ZeK+f165JMpzfkAB
	 q5bZ5X03sbq+g==
From: Baruch Siach <baruch@tkos.co.il>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert cnxt,cx92755-timer to DT
 schema
In-Reply-To: <20250506022232.2587186-1-robh@kernel.org> (Rob Herring's message
	of "Mon, 5 May 2025 21:22:31 -0500")
References: <20250506022232.2587186-1-robh@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 06 May 2025 06:16:16 +0300
Message-ID: <87plgmzawv.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Rob,

On Mon, May 05 2025, Rob Herring (Arm) wrote:

> Convert the Conexant Digicolor SoCs Timer binding to DT schema format.
> It's a straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  .../bindings/timer/cnxt,cx92755-timer.yaml    | 49 +++++++++++++++++++
>  .../bindings/timer/digicolor-timer.txt        | 18 -------
>  2 files changed, 49 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/digicolor-timer.txt
>
> diff --git a/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
> b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
> new file mode 100644
> index 000000000000..8f1a5af32a36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cnxt,cx92755-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Conexant Digicolor SoCs Timer Controller
> +
> +maintainers:
> +  - Baruch Siach <baruch@tkos.co.il>
> +
> +properties:
> +  compatible:
> +    const: cnxt,cx92755-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Contains 8 interrupts, one for each timer
> +    items:
> +      - description: interrupt for timer 0
> +      - description: interrupt for timer 1
> +      - description: interrupt for timer 2
> +      - description: interrupt for timer 3
> +      - description: interrupt for timer 4
> +      - description: interrupt for timer 5
> +      - description: interrupt for timer 6
> +      - description: interrupt for timer 7
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@f0000fc0 {
> +      compatible = "cnxt,cx92755-timer";
> +      reg = <0xf0000fc0 0x40>;
> +      interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
> +      clocks = <&main_clk>;
> +    };
> diff --git a/Documentation/devicetree/bindings/timer/digicolor-timer.txt
> b/Documentation/devicetree/bindings/timer/digicolor-timer.txt
> deleted file mode 100644
> index d1b659bbc29f..000000000000
> --- a/Documentation/devicetree/bindings/timer/digicolor-timer.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Conexant Digicolor SoCs Timer Controller
> -
> -Required properties:
> -
> -- compatible : should be "cnxt,cx92755-timer"
> -- reg : Specifies base physical address and size of the "Agent Communication"
> -  timer registers
> -- interrupts : Contains 8 interrupts, one for each timer
> -- clocks: phandle to the main clock
> -
> -Example:
> -
> -	timer@f0000fc0 {
> -		compatible = "cnxt,cx92755-timer";
> -		reg = <0xf0000fc0 0x40>;
> -		interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
> -		clocks = <&main_clk>;
> -	};

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
