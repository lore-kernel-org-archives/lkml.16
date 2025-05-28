Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C62882AB;
	Wed, 28 May 2025 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441943; cv=none; b=ItLbbT6MXSAa8HXISsDbTnhF7DS3ucr2zduTR+WA9JPi+dJFcOs5wCX8JAe7+oieWnaOTyoYk5MJrjLutMtBuLrHcaTH20j64+a6ew17ueHfPm0synGu4uP4coIglj3/7ffGmoQkgSFKs9lcnt4R5bWXWF/lgoGvOGPMjW6zXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441943; c=relaxed/simple;
	bh=78K9IapfEUA0fFpl8LYkfjYQvXb/zqZqFdh+VYT4FJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkLXKmZwE6eeN1k5rQ7gP5s7ejwLouPEFY9AqV5bmxP8hMkQzgvaDd8TBQ0r3NYq36t1Fquu8xjxBXYByvZ+cRzj/XUXf41BsNotCBTwHfepzsXa5DLAXQ83Fp+8xxNLXPnm0nNPHHOrgCtG9wsUKb9ZJFhR8K1lcBFciB16iGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkeOzXk5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkeOzXk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB70CC4CEE3;
	Wed, 28 May 2025 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748441943;
	bh=78K9IapfEUA0fFpl8LYkfjYQvXb/zqZqFdh+VYT4FJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VkeOzXk5eN+qrU03KZerCJkDAKnh8wRqro+X+AhBJBc8PifbmrRAc7xFN7hOyrJhv
	 YuWH3To3Cku6KJ6Bj4LyKfoGNRaQt+JCqQi/HpFULd1mEXAAMfNVTJrYyJXBGFi9t/
	 CiI7iQfuvkIIi3N+R8u5PnQI3VT07VKW86Uy6Fq67CgEpm7Z2BTV4KDWrCFMw7rR/X
	 DG1T56yPZ9LShXI/wJZGo4wrbTVonT2ei3JlAf4qD9t3Mc4zL69HkK4qubSV76E+rN
	 aqs/b1z/Ix2qzhtSvjo6CrXO6LPVQy60spli6q5XfIGfNYT5NmG3VUxjqzV4stWCft
	 xrS69ZDzlonEQ==
Date: Wed, 28 May 2025 09:19:01 -0500
From: Rob Herring <robh@kernel.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jank@cadence.com, edgar.iglesias@amd.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: fixed-mmio-clock: Add optional
 ready reg
Message-ID: <20250528141901.GA3966725-robh@kernel.org>
References: <20250528140917.876453-1-edgar.iglesias@gmail.com>
 <20250528140917.876453-2-edgar.iglesias@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528140917.876453-2-edgar.iglesias@gmail.com>

On Wed, May 28, 2025 at 04:09:16PM +0200, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add an optional ready register and properties describing bitfields
> that signal when the clock is ready. This can for example be useful
> to describe PLL lock bits.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  .../bindings/clock/fixed-mmio-clock.yaml      | 37 ++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> index e22fc272d023..57419b4de343 100644
> --- a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> @@ -10,6 +10,11 @@ description:
>    This binding describes a fixed-rate clock for which the frequency can
>    be read from a single 32-bit memory mapped I/O register.
>  
> +  An optional ready register can be specified in a second reg entry.
> +  The ready register will be polled until it signals ready prior to reading
> +  the fixed rate. This is useful for example to optionally wait for a PLL
> +  to lock.
> +
>    It was designed for test systems, like FPGA, not for complete,
>    finished SoCs.
>  
> @@ -21,7 +26,10 @@ properties:
>      const: fixed-mmio-clock
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Fixed rate register
> +      - description: Optional clock ready register
>  
>    "#clock-cells":
>      const: 0
> @@ -29,6 +37,24 @@ properties:
>    clock-output-names:
>      maxItems: 1
>  
> +  ready-timeout-us:
> +    description:
> +      Optional timeout in micro-seconds when polling for clock readiness.
> +      0 means no timeout.
> +    default: 0
> +
> +  ready-mask:
> +    description:
> +      Optional mask to apply when reading the ready register.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0xffffffff
> +
> +  ready-value:
> +    description:
> +      When a ready register is specified in reg, poll the ready reg until
> +      ready-reg & ready-mask == ready-value.
> +    $ref: /schemas/types.yaml#/definitions/uint32

And next someone wants to add an enable bit, so there's another 2-3 new 
properties. And it never ends...

So no, create a specific binding for your h/w.

Rob
