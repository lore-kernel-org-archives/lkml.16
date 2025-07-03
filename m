Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898042AE99;
	Thu,  3 Jul 2025 06:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524610; cv=none; b=nyNuO9eZpk2dwk8MDcRaubegiseL2KZFUZ7mCT2zapCc2FsTOHPnRg/dJkBZ/NTPZ5mSP6XCARhjSdwJjB8KmSRunbSf38R4ffzeL0FHr1Kzkb0gp7jovCyjPrOIY4pV9WNFVKbrNoa7AZu/76kz3xQMJ21GzOZarN+mWj5wdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524610; c=relaxed/simple;
	bh=dSUkszJ4lcJpNTq3Dl2f1r5xOrk/U8o/wHIi5YJyF7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCbLAVxNhRjqXappRqTm8Jl1PESnM7sDKi+BrYNnnG8D52GwaRrvyPBG8n9/hzEUY5yZtWTCbSNIc4v49WSvQaNPhbI7aUucJlLrQiwbQjjDE/2iTTaBLb2Fg9aw03W0TilKoRD8hJ9I55Csvb7riB2NDC2x3ZqldcMxKC9vbzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdtpLa6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdtpLa6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A3BC4CEE3;
	Thu,  3 Jul 2025 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751524610;
	bh=dSUkszJ4lcJpNTq3Dl2f1r5xOrk/U8o/wHIi5YJyF7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TdtpLa6OJWh5hxj3g/hXsdN2bJaUNGz5zoCcbhF1wBp9BuoIynV/wxz0GdtsjfTEX
	 ENjJskqJbY9MBaTvxPNvY3llufRVMf2bGCz8mY4FzuLTa++dGcmle8qbem+VngPBEJ
	 QF1WmXJ+LHvGGq2+Myi7SkU2ubIV5GfrY2zealXidS1k/ueXjoQPXyIvZOCH0fa/64
	 6WTJ/BdEcQdmZ9DiaFnraio99cwlhALDljIKIxg/9WZKgUHJjZsb/o+9a4M5WVFKFD
	 0SdqDn3nY+NWWmaO3YB+lIxCZaRSyyuqxVqmld34CoC9l3kbtQf0Lzu4C/NmccJaj+
	 TkDNeYDTAdxFQ==
Message-ID: <9c75041d-a06a-49ef-92d1-011faeb39496@kernel.org>
Date: Thu, 3 Jul 2025 08:36:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S
 audio amplifiers
To: Nick <nick.li@foursemi.com>, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com
Cc: like.sin@gmail.com, xiaoming.yang@foursemi.com,
 danyang.zheng@foursemi.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-4-nick.li@foursemi.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250703035639.7252-4-nick.li@foursemi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/07/2025 05:56, Nick wrote:
> From: Nick Li <nick.li@foursemi.com>
> 
> This patch adds bindings for FourSemi FS2104/5S audio amplifiers
> which can support both I2S and I2C interface.
> 
> Signed-off-by: Nick Li <nick.li@foursemi.com>

Your patches are not correctly ordered. Vendor prefix is supposed to be
before is being used. Bindings are before their users.

> ---
>  .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> new file mode 100644
> index 000000000..3a1aba9b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml

Choose one compatible as filename.

> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/foursemi,fs210x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: FourSemi FS2104/5S Digital Audio Amplifier
> +
> +maintainers:
> +  - Nick <nick.li@foursemi.com>
> +
> +description: |
> +    The FS2104 is a 15W Inductor-Less, Stereo, Closed-Loop,
> +    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
> +    The FS2105S is a 30W Inductor-Less, Stereo, Closed-Loop,
> +    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - foursemi,fs2104
> +      - foursemi,fs2105s

Your driver suggests these are compatible, so express that with fallback.

> +
> +  reg:
> +    maxItems: 1
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      I2C address of the amplifier. Refer to datasheet for possible values:
> +      0x68/0x69/0x6A/0x6B
> +
> +  clocks:
> +    items:
> +      - description: The clock of I2S BCLK
> +
> +  clock-names:
> +    items:
> +      - const: bclk
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  pvdd-supply:
> +    description: |

Do not need '|' unless you need to preserve formatting.


> +      Regulator for power supply(PVDD in datasheet).
> +
> +  dvdd-supply:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Regulator for digital supply(DVDD in datasheet).
> +
> +  sdz-gpios:

Use standard properties - see gpio-consumer-common

> +    maxItems: 1
> +    description: |
> +      SDZ(Shut Down) pin is active low, it will power down the chip,
> +      and then reset the chip to shut down state.
> +
> +  fs,fwm-name:

No, use standard properties (see writing bindings)

> +    description: |
> +      The name of firmware that should be loaded for this
> +      instance. The firmware is gernerated by FourSemi's tuning tool.
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  fs,dai-name:

No, it's already in dai-common

> +    description: |
> +      The name of FS210x DAI, it can be set different name when
> +      there are multiple FS210x devices in the system.
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +required:
> +  - compatible
> +  - reg
> +  - sdz-gpios
> +  - fs,fwm-name
> +  - '#sound-dai-cells'
> +

Missing ref to dai common

> +additionalProperties: false

And this should be unevaluatedProperties instead


Best regards,
Krzysztof
