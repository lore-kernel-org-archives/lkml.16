Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33892746D;
	Sun,  2 Feb 2025 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738502667; cv=none; b=qzSmpgBqCQnByIV21Zeig/HxDh8uDfmGfwOGako8UrlBw2/RDzf2ifJb3ZU270iutoFlGdZ/FrteDUt38tW9klA15OatN3ZRyLF9iogwZDQdjoEdB+GjCypMFRPdwp42xWCC7o/NcDxNBeW5NWyJPkr/fU3VJ5wcciEymACSzeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738502667; c=relaxed/simple;
	bh=o/QA4a3yfupBgO6h2sIehTP5xuRwv6WZE/LItNQNjkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2kxiDjAtVt0ToCxihS0hQh+A1gKdcVxZh9LnnwugVaGF7JMUwM4HUNFCQXXyWQQ5AtM7cyOJKWkQBgHcUnaLoI1NSP82/Vk9yhUqsoNUvS2PrOmQLMUPGmLuTCNML/TdY+RjdWDSILxlk14nKSadS7tK0S+n/no9cYHgWXLJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quO+gtAP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quO+gtAP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868DBC4CED1;
	Sun,  2 Feb 2025 13:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738502666;
	bh=o/QA4a3yfupBgO6h2sIehTP5xuRwv6WZE/LItNQNjkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=quO+gtAPcOEYdBG9JD1mpcY9aFy5AtYJRpAbBNKvjMCoLQA9OIuSbhD9+7A6A8845
	 mdCVbbHiYN0dBJCB+Clna8bkSvocKNuglkP6KgC1PlwNQpGPfQCZHXfW2CSNz8wiDc
	 i+p/Ch5s1okw6NIo++Yk39Z+C3nIjXPDgG0vgFLp197rqd57QCJtPyxKp/1HlhCOVX
	 /jcto8cteu7dzMz805YAsMDxkm5b2fuqPyWKQK7gjlYwjGo2DEGtuZpo6Wh8dd+Wjj
	 KWBBSoCCZnKqkBXwz0FYCwjoLKf4t1pKmq/zF5wh3TtH7H06kUhklqSSo9AaQghq1N
	 05XvmMxIZgCAg==
Date: Sun, 2 Feb 2025 14:24:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stanislav Jakubek <stano.jakubek@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 2/7] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
Message-ID: <20250202-noisy-impala-of-triumph-c9aa8b@krzk-bin>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>

On Fri, Jan 31, 2025 at 07:13:50PM +0100, Artur Weber wrote:
> The BCM59054 MFD is fairly similar to the BCM59056, and will use
> the same driver. Add compatible and specify the allowed regulator
> nodes.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v3:
> - Split regulator node into separate file
> - Removed quotes around compatible
> ---
>  .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 26 +++++++++-
>  .../bindings/regulator/brcm,bcm59054.yaml          | 55 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
> index 3296799eb452fca2a4b03699fcb5aa27005a8e8d..87d663416ed9e7f5ec4aa25c1aa2d9e650c42e2c 100644
> --- a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: brcm,bcm59056
> +    enum:
> +      - brcm,bcm59054
> +      - brcm,bcm59056
>  
>    reg:
>      maxItems: 1
> @@ -22,7 +24,6 @@ properties:
>    regulators:
>      type: object
>      description: Container node for regulators.
> -    $ref: ../regulator/brcm,bcm59056.yaml

Refs should rather stay here, so I don't think keeping these devices in
one binding makes it simpler.

Simpler - drop ref and add properties compatible with enum for your
regulator compatibles.

...

> +$id: http://devicetree.org/schemas/regulator/brcm,bcm59054.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM59054 Power Management IC regulators
> +
> +description: |
> +  This is a part of device tree bindings for the BCM590XX family of power
> +  management ICs.
> +
> +  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
> +  additional information and example.
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +# The valid regulator node names for BCM59054 are:
> +#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
> +#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
> +#   csr, iosr1, iosr2, mmsr, sdsr1, sdsr2, vsr,
> +#   gpldo1, gpldo2, gpldo3, tcxldo, lvldo1, lvldo2
> +
> +patternProperties:
> +  "^(cam|sim|mmc)ldo[1-2]$":
> +    type: object

Missin unevaluatedProperties everywhere. Look how other bindings do it.

> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +  "^(rf|sd|sdx|aud|mic|usb|vib|tcx)ldo$":
> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +  "^(c|mm|v)sr$":
> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +  "^(io|sd)sr[1-2]$":
> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +  "^gpldo[1-3]$":
> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +  "^lvldo[1-2]$":
> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +properties:
> +  "vbus":

No quotes.

Best regards,
Krzysztof

