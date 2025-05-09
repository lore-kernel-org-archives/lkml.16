Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610321C2324;
	Fri,  9 May 2025 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774046; cv=none; b=PBsuXtbInWLnbpXRwxSgc/5RaW/6N1QcScrSPxSHdYYCPAELLQK8UMChuW6ZYDDYjd7DRNI5pXt0tizBGsofGjwY8SEAjsPYhHGU0Fyo1fdp3i74MVCQWGkYnED1DhKN9J+DyfLckpgc1VoZw3Z6njOiRE/QnI13dxaLWk6pLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774046; c=relaxed/simple;
	bh=yfQkWx9DeJmRw8TBVfrP8PbDAnwkQi7w1kwefSN2X/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJh34a2SIhJlK9Rj/1ro7ANl9CbcaXvQWM7KNfo3/+Fx4WUD41MisZywWVv+uYsP9t7h2F0f4RjQ90gvc8DvthV1F9/6ku/ial8q850rKxHKyIqeOHUqsC+MfCeTIcIlxnbWCghE47FKmjyzDG/Pjb34Q2c9VBE3XJrvx//L3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5TW3pVS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5TW3pVS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54714C4CEE4;
	Fri,  9 May 2025 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746774045;
	bh=yfQkWx9DeJmRw8TBVfrP8PbDAnwkQi7w1kwefSN2X/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I5TW3pVST8qjxTKtl4nXW2aEgiYKXPJRDPncjobsXP9HiqxyKZG5VlS+/Ry+AO4I6
	 Iw7+jREtjmvt1iQp6eyTSs0AYpIQYthYjQCeTAS86Tk7tqLknxL+HMMTtSs4KFhwgY
	 owRB6sd/8of5Z5dorjNl41bkD8wT72b7fG66JRKFtLvByPjQkl08gHoaN0OvLQBE4e
	 UgUKnuauyZL5rssVXVLFF4fsBbTVWLU1x5nnvDr1UP4J5w3iTpItuRoF9hYHRFtdeF
	 8PeLubrhXgnK7PuFvTp6yLNVxIzf16P88Bs3BReSgKs/tixTrc+ceoG063pxdSeKfX
	 cikpbm71pc9FQ==
Message-ID: <606a3d9a-857a-4fd6-a9b9-76a9c8d60cea@kernel.org>
Date: Fri, 9 May 2025 09:00:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] dt-bindings: hwmon: Add bindings for mpq8785
 driver
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Noah Wang <noahwang.wang@outlook.com>, Michal Simek <michal.simek@amd.com>,
 Fabio Estevam <festevam@gmail.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Shen Lichuan <shenlichuan@vivo.com>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
 <20250509065237.2392692-6-paweldembicki@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250509065237.2392692-6-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2025 08:51, Pawel Dembicki wrote:
> Add device tree bindings for Monolithic Power Systems MPQ8785, MPM82504
> and MPM3695 PMBus-compliant voltage regulators.
> 
> These bindings also documents the optional
> "mps,vout-fb-divider-ratio-permille" property.
> 
> ---
> v2:
>   - remove mps,mpq8785 from trivial-devices.yaml
>   - fix alphabetical order
>   - rename voltage-scale-loop to mps,vout-fb-divider-ratio-permille
>   - add mps,vout-fb-divider-ratio-permille min and max values
>   - rewrite mps,vout-fb-divider-ratio-permille description

If you are going to send a new version, then reorder the patches so the
bindings are before the user (see submitting patches in DT doc dir).

> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>  .../bindings/hwmon/pmbus/mps,mpq8785.yaml     | 88 +++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |  2 -
>  2 files changed, 88 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> new file mode 100644
> index 000000000000..3c61f5484326
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8785.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Monolithic Power Systems Multiphase Voltage Regulators with PMBus
> +
> +maintainers:
> +  - Charles Hsu <ythsu0511@gmail.com>
> +
> +description:
> +  Monolithic Power Systems digital multiphase voltage regulators with PMBus.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mps,mpm3695
> +      - mps,mpm3695-25
> +      - mps,mpm82504
> +      - mps,mpq8785
> +
> +  reg:
> +    maxItems: 1
> +
> +  mps,vout-fb-divider-ratio-permille:
> +    description:
> +      The feedback resistor divider ratio, expressed in permille
> +      (Vfb / Vout * 1000). This value is written to the PMBUS_VOUT_SCALE_LOOP
> +      register and is required for correct output voltage presentation.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1

maximum: 4095
default: X

required: block goes here, before allOf: block.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: mps,mpq8785
> +    then:
> +      properties:
> +        mps,vout-fb-divider-ratio-permille:
> +          maximum: 2047
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: mps,mpm82504

That's enum with mpm3695

> +    then:
> +      properties:
> +        mps,vout-fb-divider-ratio-permille:
> +          maximum: 1023
> +
Best regards,
Krzysztof
