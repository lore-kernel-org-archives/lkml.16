Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF079170A11;
	Mon, 10 Feb 2025 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176646; cv=none; b=gvi/WXyAasyCt9SueOW2qGlmciV9EyoNxgdcWxukCZnupQr4SzNZqo4crlDDfIsNL5oj+yneLbrstt0TGi9gAQgwK76yzVj37sofilRUyVcLFCfybCDnw6k4JAQTJZcYQua7c46FR99Sl/pSadypEzjx0C4JFgQCKIlKAN53DBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176646; c=relaxed/simple;
	bh=gVW1Ci/hBiOwhrvk4HMfXY1CpOf8CZu61REaDP54geE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UH991Yo/uSvWaMMFDZSRtc+9sLSVZSVs67vH6FHtIkVcwT/F37qwehjvJ5Q8tG/fFGY0Lbomzxns5jfx1obB7lDQdxCCzwPqMMDjIvFeLnVLPAUq18VSTH8cTmccnALiDXqZQepT/hkFJx1mYVT4iILhIK6Xf/+A3yoYd5J0MYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=He8ycZms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="He8ycZms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879BEC4CED1;
	Mon, 10 Feb 2025 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739176645;
	bh=gVW1Ci/hBiOwhrvk4HMfXY1CpOf8CZu61REaDP54geE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=He8ycZms14WBqwwnV/eJPBgttownG6g8BvlbV5dY7J9snsE7c5ehqfoibIJtXBaKc
	 fkXq7z0XdQOKRzfWX9WFjv2bCzmQoLZSXRQFn8lw2CcaXrgCo79KVCME5EFBuVqOc0
	 QOWtDmUTX5ZOlJU8N53vJHrk+qi99g6KbS3kEf47J2cffpK9II4pCb8L8YECSvLY4a
	 xgPBwY2MeXthOPgSbKPSsm+0/Uugft6zeqR06/vVWr938Y78gv7p8JqrEQoCzowzaH
	 skTCstHaSyDMJYnBq6UkqDEsqYmC9/grm0etrezIipXaPUM8X6zybzGHw4Z3g3GECH
	 KA93b/2Lqd8Og==
Date: Mon, 10 Feb 2025 09:37:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Celine Joy A. Capua" <celinejoy.capua@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: regulator: Document the ltc7871
 regulator
Message-ID: <20250210-melodic-lush-bettong-9de9d0@krzk-bin>
References: <20250210-staging-ltc7871-v1-0-c593ad86aab2@analog.com>
 <20250210-staging-ltc7871-v1-2-c593ad86aab2@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-staging-ltc7871-v1-2-c593ad86aab2@analog.com>

On Mon, Feb 10, 2025 at 10:30:53AM +0800, Celine Joy A. Capua wrote:
> The LTC7871 is a bidirectional buck or boost
> switching regulator controller that operates in
> either buck or boost mode on demand. Add
> corresponding DT bindings.

This fails tests, so limited review follows.


Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> 
> Signed-off-by: Celine Joy A. Capua <celinejoy.capua@analog.com>
> ---
>  .../bindings/regulator/adi,ltc7871-regulator.yaml  | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/adi,ltc7871-regulator.yaml b/Documentation/devicetree/bindings/regulator/adi,ltc7871-regulator.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b1ae8b16e19c11b3faf2d4a41a4ae4f615ca3c1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/adi,ltc7871-regulator.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2025 Analog Devices, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/adi,ltc7871-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC7871 Buck-Boost Voltage Regulator

Blank line

> +maintainers:
> +  - Celine Joy Capua <celinejoy.capua@analog.com>
> +
> +description:
> +  The LTC7871 is a high performance bidirectional buck or boost switching
> +  regulator controller that operates in either buck or boost mode on demand.
> +  It regulates in buck mode from VHIGH-to-VLOW and boost mode from
> +  VLOW-to-VHIGH depending on a control signal, making it ideal for 48V/12V
> +  automotive dual battery systems

Blank line. Open existing bindings and see how it is done there.

> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc7871
> +      - adi,ltc7872

Are devices compatible?

> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,enable-chip-ctrl-wp:
> +    description: If present, this indicates the use of regulator's
> +      internal write protection.
> +    type: boolean
> +
> +  adi,ra-external-ohms:
> +    description: External Resistor used to compute the value of
> +      programmable VLOW in buck mode.
> +    default: 10000
> +
> +  adi,rb-external-ohms:
> +    description: External Resistor used to compute the value of
> +      programmable VLOW in buck mode.
> +    default: 107000
> +
> +  adi,rc-external-ohms:
> +    description: External Resistor used to compute the value of
> +      programmable VHIGH in boost mode.
> +    default: 12700
> +
> +  adi,rd-external-ohms:
> +    description: External Resistor used to compute the value of
> +      programmable VHIGH in boost mode.
> +    default: 499000
> +
> +  adi,idac-setcur-microamp:
> +    description: Adjusts the IDAC_SETCUR to program SETCUR
> +      pin's sourcing current.
> +    minimum: -63
> +    maximum: 64
> +    default: 0
> +
> +  adi,freq-spread-percentage:
> +    description: Sets the range of modulation with respect to the
> +      switching frequency.
> +    enum: [+-12%, +-15%, +-10%, +-8%]

That's something new. Where is such property suffix defined?

> +    default: +-12%
> +
> +  adi,switching-freq-divider:
> +    description: The factor at which the switching frequency is
> +      divided to get the modulation frequency.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [512, 1024, 2048, 4096, 256, 128, 64]

Keep this ordered by increasing value.

> +    default: 512
> +
> +required:
> +  - compatible
> +  - reg

Best regards,
Krzysztof

