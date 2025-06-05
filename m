Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083162114;
	Thu,  5 Jun 2025 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106023; cv=none; b=nwXG7h7ywbDdMH3UxxGrybX0Lpmn/9iswvEibTSfHmtIhJu9f3h3UkWBPOWjIcPpXW4vEWPnHQZbY+jAQdJkN59psyOJ+sgI+5u8VmSawgxK3dWn7OdDXfQs2+gBvPJL9YzkvVfpCllXt6A65B6INn6rOODxK1Ba8OFH9hZahdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106023; c=relaxed/simple;
	bh=eCUjOx4w5jRxLq4+wJFYHnxODTQe3MFcxVYHstsW84o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYhi3K9YqZoNM+cbnMg2LndA7yE7iquuYNWcDgCzOWkYzc0MZ2oDZLo+xOSyWh1jm3NL+XOJg+x6QbZQ0TzCCVppeUvTge2XG+g0jW5UkJPuyQq93hQgUlZvs5AjBA+hHK2JOSOqkXrwtkVwVz+0YWWTKcR6Ug3XtM4d6/YpcRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plwJplOI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plwJplOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EABC4CEE7;
	Thu,  5 Jun 2025 06:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749106022;
	bh=eCUjOx4w5jRxLq4+wJFYHnxODTQe3MFcxVYHstsW84o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=plwJplOIO5WfFxoe86W030lbE74oVfEAQ9ASKf19kAmqN11LAJahjrS5uNW2Xa4hH
	 +ldLzT5SYcb6kWzcve5T8qZWxvHp921mW/Y1eP2f+PWfDL4IibPzDrGgjSrIIU4QxL
	 bqPHQbB1xokvg7FT7ewyO7IMmRzjdNheqdCKj+7Dr96CVzETjWFyA2/7tIFJBOwl6q
	 w9qODWhjISnmffhYGR3+8q0iSIgf4l6Ag2G1SPerH99Em7AdnYZLJMCvmprEX4wsxO
	 Y75/iDN7HQ6f7LMBfdy/sg3R8u4PA/Qe9+Ooc/yk+XDlOE+HK7PH0ywSqNShh6K5Kn
	 C7ohC5+038Nmw==
Message-ID: <01538054-c50f-4dc3-ac2a-37b594940e6e@kernel.org>
Date: Thu, 5 Jun 2025 08:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] devicetree: bindings: mux: reg-mux: Add support for
 new property 'mux-reg-masks-state'
To: Chintan Vankar <c-vankar@ti.com>, Thorsten Blum
 <thorsten.blum@linux.dev>, Andrew Davis <afd@ti.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 s-vadapalli@ti.com, vigneshr@ti.com, nm@ti.com, danishanwar@ti.com
References: <20250605063422.3813260-1-c-vankar@ti.com>
 <20250605063422.3813260-2-c-vankar@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250605063422.3813260-2-c-vankar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2025 08:34, Chintan Vankar wrote:
> The DT binding for reg-mux currenly requires specifying register offset
> and masks in the "mux-reg-masks" property, while corresponding register
> values are defined in the "idle-states" property. This approach imposes a
> constraint where "mux-reg-masks" and "idle-states" must remain
> synchroniszed, adding complexity when configuring specific registers or a

Typo

> set of registers with large memory spaces.
> 
> Add support of a new property "mux-reg-masks-state" to remove this
> constraint, allowing offset, mask and value to be specified together as a
> tuple.
> 

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> ---
>  .../devicetree/bindings/mux/reg-mux.yaml      | 32 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mux/reg-mux.yaml b/Documentation/devicetree/bindings/mux/reg-mux.yaml
> index dc4be092fc2f..b029e2f28df0 100644
> --- a/Documentation/devicetree/bindings/mux/reg-mux.yaml
> +++ b/Documentation/devicetree/bindings/mux/reg-mux.yaml
> @@ -32,11 +32,39 @@ properties:
>          - description: pre-shifted bitfield mask
>      description: Each entry pair describes a single mux control.
>  
> -  idle-states: true
> +  idle-states:
> +    description: Each entry describes mux register state.
> +
> +  mux-reg-masks-state:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: register offset
> +        - description: pre-shifted bitfield mask
> +        - description: register value to be set
> +    description: This property is an extension of mux-reg-masks which

How one is supposed to use both (since this is extension)?

> +                 allows specifying register offset, mask and register
> +                 value to be set.

Anyway, this is getting too complex (next will be
mux-reg-masks-enable-state and mux-reg-masks-foo-state), just define
your own device schema.

> +
> +allOf:
> +  - oneOf:
> +      - required: [mux-reg-masks]
> +      - required: [mux-reg-masks-state]

So not an extension but replacement?

> +
> +  - if:
> +      required: [mux-reg-masks-state]
> +    then:
> +      not:
> +        required: [idle-states]

You cannot un-require a field. Where was it made required?

> +
> +  - if:
> +      required: [mux-reg-masks]
> +    then:
> +      properties:
> +        idle-states: true

This is no-op. I have no clue what you wanted to express here.


>  
>  required:
>    - compatible
> -  - mux-reg-masks
>    - '#mux-control-cells'
>  
>  additionalProperties: false


Best regards,
Krzysztof
