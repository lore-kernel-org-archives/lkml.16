Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DB3219A9D;
	Thu,  8 May 2025 06:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684474; cv=none; b=m/zS2OvOY8A9yk5ErAmGSW7AWl8h0BLfng1Kc7EdtWy4pMnH2FYr7UkYsR+gHWCIVKiga7CNGY6ah8c4RNzYs/ivn7xcAnkCrumO/1mlVWOIKKIDNl/G7qFskG9eCcHBnWT4bfH1gqnDDaJhhfajc6hd1fA8vTf6oeIxmMNEJjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684474; c=relaxed/simple;
	bh=hrmfO8tAr/cw382o+bzA/FlXqDpilUHVCNE5epju3bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxIDEY3+oRbYhTUEgvp2yKdJALJXrc7q59/XXnhHFAmDp3bNdZJGUjKeCyS71DjKa+2KY7Mw03erstidL31wOAOSQ/0HmTmGze2eW8QGuGZamo3xmE1k89LrTsnm+D0bDJRmHNLaUkh9JTwp4qfZDUdbuc9tFiEipKmstq4qYvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKCyQ3xn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKCyQ3xn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F9AC4CEED;
	Thu,  8 May 2025 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746684474;
	bh=hrmfO8tAr/cw382o+bzA/FlXqDpilUHVCNE5epju3bA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vKCyQ3xnSUcVkfLKJ+4oR2f8+ALgiNFW2XpzCZ1ED1OfhX+JMIDb9gjZfY2+lLqr9
	 VhxKBa7r3jGhw2C1TR7bRP8j/RcGZVN+GuDqTujsYo3M0j8JqUE7dijjQod91t8SCe
	 S85/hgHZLXzN/N5sgLIScmF0QbldbvzdzxdGGeaOccgpHcmiu1L7HokE2jogH1qGDB
	 MV+ey0c3w3CR12z5+FO7s15H5RcUe3Nx9SYSBH0vJB/D2vnUrc3erjM1S7g8shfobE
	 aEU5f1oiKb4L+HpQsBrt2aWaskt7otCnYEsc1cNLOVbEu5g/XSw/ofeZMTARtfU/AH
	 7M0RbLcxfrx5g==
Message-ID: <17145d2f-5d07-4939-8381-74e27cde303c@kernel.org>
Date: Thu, 8 May 2025 08:07:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
 alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com,
 shashank.rebbapragada@nxp.com, Frank.Li@nxp.com
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2025 06:57, Aman Kumar Pandey wrote:
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> ---
> V1 -> V2: Cleaned up coding style and addressed review comments
> ---
>  .../bindings/i3c/p3h2840-i3c-hub.yaml         | 332 ++++++++++++++++++

Not much improved. I have doubts that you really looked at other bindings.

Filename matching compatible.


>  MAINTAINERS                                   |   8 +
>  2 files changed, 340 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml
> new file mode 100644
> index 000000000000..f3b5aabf5fe0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml
> @@ -0,0 +1,332 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/p3h2840-i3c-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: P3H2X4X I3C HUB

nvidia? NXP? What is it?

> +


> +maintainers:
> +  - Vikash Bansal <vikash.bansal@nxp.com>
> +  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> +
> +description: |
> +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
> +  hub devices that connect to:-
> +  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to multiple
> +     peripheral devices on the downstream  side.
> +  2. Have two Controller Ports which can support either
> +     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
> +  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
> +  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
> +     Target ports can be configured as I2C/SMBus, I3C or GPIO and connect to
> +     peripherals.
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^hub@[@.*]+,[0-9a-f]+$"

Drop


> +
> +  Compatible:

Nothing improved. There is no single code with such syntax and I asked
to use existing files as an example. You just ignored that comment and
this is not acceptable.


> +    const: nxp,p3h2x4x

No, you need specific compatibles.

> +
> +  cp0-ldo-enable:
> +    type: boolean
> +    description:
> +      Enables the on-die LDO for controller Port 0.
> +
> +  cp1-ldo-enable:
> +    type: boolean
> +    description:
> +      Enables the on-die LDO for controller Port 1.
> +
> +  tp0145-ldo-enable:
> +    type: boolean
> +    description:
> +      Enables the on-die LDO for target ports 0/1/4/5.
> +
> +  tp2367-ldo-enable:
> +    type: boolean
> +    description:
> +      Enables the on-die LDO for target ports 2/3/6/7.
> +

NAK for all above properties.

> +  cp0-ldo-microvolt:

Do you see anywhere device properties named like that? Without prefix?

I am not going to review the rest. You did not try hard enough to
fulfill previous review request, you did not really test it.

Start from scratch from latest accepted schema or from example-schema.

Best regards,
Krzysztof
