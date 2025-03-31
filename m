Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31130487BE;
	Mon, 31 Mar 2025 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408574; cv=none; b=fiYzglAByDpyUCgM7qxQLkCGK9LqtlFWg6m7MJ3bYMuVbIRxDDO5ZCaSeAQROjtsAVVOx3aULizSxj+G1BMJ+dtekOJTt5u93rRg+tTPNy58zav7zYU4fswRBZETQwHfbxcmxl5bcCrnBCdOH3az9TP6lZobYDDMl2pb4AFOhRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408574; c=relaxed/simple;
	bh=wh3Ef4aBpntCDkoqe//eDseW1k34c3jT5K5YmBy5R8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2H2L0JdZuTGSFTgMPsH9ufNwK5D6bRgaiEfMruJNl/jEwlX/TeBRfwKj2QSIceu55I+gph7AJfj5xAfQhx2/giE7FoYAkd/KrsPrfz4XMMGrynE2ynFgNdIX2vjL9AAU4S/kGTOrtsaWGvd+4NHEAzbV8QBESFAIeGKP/t6qPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVZxK4Mv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVZxK4Mv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0982C4CEE3;
	Mon, 31 Mar 2025 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743408573;
	bh=wh3Ef4aBpntCDkoqe//eDseW1k34c3jT5K5YmBy5R8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVZxK4MvrqaZJbnEoAUUM+ton446gvY1jaHiSwlGtDGLozvG/yFxJOrTc1B/rooj2
	 5Tbg9NwfQ0qBrL0PXJyX90IsWmGP5TOCNRFbFbeqckyEoeF919D8OQflcBCi9zq+QU
	 QTDaKkIqWzFWRAhLbobsPoYx16hQpJIPPY30WAZFQNO3DxdO5yq1fuNYva8U7GF3CB
	 v7SDMM2GC6LHrayIu+wSU9nyaFF7wu2Nf+yWUoYl5yyI3Wn6ZaTBSIWgBepu6/W+2X
	 I26Rw1fnXDdDCuFbuNxl7b4DsOd9JEzGu7tRpq8EcvRVcw3FVp+e35Ls3b+s/O9fBn
	 vcgIadcw1V2og==
Date: Mon, 31 Mar 2025 10:09:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add binding for PS5511 hub
 controller
Message-ID: <20250331-loud-micro-booby-e0fd4a@krzk-bin>
References: <20250328082950.1473406-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328082950.1473406-1-treapking@chromium.org>

On Fri, Mar 28, 2025 at 04:28:45PM +0800, Pin-yen Lin wrote:
> +
> +title: PS5511 4+1 Port USB 3.2 Gen 1 Hub Controller

s/PS5511/Parade PS5511/

> +
> +maintainers:
> +  - Pin-yen Lin <treapking@chromium.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb1da0,5511
> +      - usb1da0,55a1
> +
> +  reg: true
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  reset-gpios:
> +    items:
> +      - description: GPIO specifier for GRST# pin.
> +
> +  vddd11-supply:
> +    description:
> +      1V1 power supply to the hub
> +
> +  vdd33-supply:
> +    description:
> +      3V3 power supply to the hub
> +
> +  peer-hub:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the peer hub on the controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

I don't understand why do you need OF graph here. Children are already
defined in patternProperties as usb-devices.

Where is any upstream DTS using this schema?

> +
> +    properties:
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          1st downstream facing USB port
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          2nd downstream facing USB port
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          3rd downstream facing USB port
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          4th downstream facing USB port
> +
> +      port@5:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          5th downstream facing USB port
> +
> +required:
> +  - compatible
> +  - reg
> +  - peer-hub
> +
> +patternProperties:

patternProperties follow immediately properties, so move it up.

> +  '^.*@[1-5]$':
> +    description: The hard wired USB devices
> +    type: object
> +    $ref: /schemas/usb/usb-device.yaml
> +    additionalProperties: true
> +
> +additionalProperties: false
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            enum:
> +              - usb1da0,usb55a1
> +    then:
> +      properties:
> +        port@5: false

No such property.

Best regards,
Krzysztof

