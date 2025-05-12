Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C8F252908;
	Mon, 12 May 2025 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068881; cv=none; b=otGlI6WnEV+YpCy6kDTAzv4ZZOGSp0au+kdaLSZj4iJ7Ygeu2MScwYU05k5Z8WOj75s7hpJli85RfdE149RU90E8pJXs0/10nTSmyRxo9ArzlPqjqJ9VoDWMFT28bCN5mDPnEpBKZO9kPj2uBUs6huh50QR4zqcqdUbxMFvf59Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068881; c=relaxed/simple;
	bh=DOkieu2c/As5OFutbPhmnXPXloxqiulZTsFGw/r3wro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akwh1qmoyqNF9COid536zTNXlbOmacQ3X3fIMYxSICUQ5SB7XX4tL1QAv1QLrxWM0s6FBWT2LsKFw+VTlaeNzT6BtFUb/FowVhSD51ZSaFc9TIOO4P+ksJ7KZGHiW5u82Cs//XsjYyQ5Akc7of0BXim2ohDj07NCJEBOLyf8mcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJoJ5l++; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJoJ5l++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC02CC4CEE7;
	Mon, 12 May 2025 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747068880;
	bh=DOkieu2c/As5OFutbPhmnXPXloxqiulZTsFGw/r3wro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJoJ5l++Z+dcFY6SizXnpd6EHzB6naYhpvlSsblZ51SAuS6wfPtcPLCkRGQR0s4h8
	 5v97FKgpO3NAs8jDNfdQWdsmDSYYLH/CF4l4rAOjzeQTZlcAAIm4LKRvCgKkwqZFtZ
	 NfTlv9g9LbWEypPlT9nxKjw4zIJ/6T+RZP+BNaxqpY7SpQQpb+W8jMZH7Su0TcCCmt
	 shXg7d08i3t/ttvGQEtWpA2bjIakKI0vlj47i8w6shFrdkl20vuTEmepWLuVI/YkRc
	 vBuw0jNMChoLvzO2yxPGltjbQHgmfi1EDH4iAJ4/QjRr4+KCOT4yauk2ecxXOIIdaq
	 1CEwRKbhN2i0w==
Date: Mon, 12 May 2025 18:54:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, vladimir.oltean@nxp.com
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Message-ID: <20250512-festive-aquamarine-junglefowl-572f90@kuoka>
References: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
 <20250509152940.2004660-2-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509152940.2004660-2-ioana.ciornei@nxp.com>

On Fri, May 09, 2025 at 06:29:35PM GMT, Ioana Ciornei wrote:
> This adds device tree bindings for the board management controller -

"Add devicetree bindings...."

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> QIXIS CPLD - found on some Layerscape based boards such as LX2162A-QDS,
> LX2160AQDS, LS1028AQDS etc.
> 

...

> +title: NXP's QIXIS CPLD board management controller
> +
> +maintainers:
> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The board management controller found on some Layerscape boards contains
> +  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
> +  etc. The QIXIS CPLD on these boards presents itself as an I2C device.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,ls1028a-qds-qixis-cpld
> +      - fsl,lx2160a-qds-qixis-cpld
> +      - fsl,lx2162a-qds-qixis-cpld

I think my question why existing compatibles cannot work is still valid.
If you responded to that and I missed reply, please point me, but I see
I replied on 7th May and you sent it later - on 9th May.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  '^mux-controller(@[a-f0-9]+)?$':

Either children have bus addressing or not. This should not be flexible,
because rarely devices differ. If devices differ, then you need separate
schema most likely.

> +    $ref: /schemas/mux/reg-mux.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"

Best regards,
Krzysztof

