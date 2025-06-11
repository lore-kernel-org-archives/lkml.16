Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300A118787A;
	Wed, 11 Jun 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667615; cv=none; b=H0CeqcSSIz3ImhqLyc5dH7TykTIbH/bx5UMjqt0ih5BiLRCu+jQPSUtm994QetV1Z+MBA2v9Uf7URLdwsgvryT3w6RZTqjwE6Trol0DXR6PubWnJ4jneKoJKR9Xfqzj7rt15AbPm33pqxH+IZaMt0eyRfVpg65Yjehb7nNH4izU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667615; c=relaxed/simple;
	bh=a4l2CHrqJdsjNmKQhyuxmXX7as3MmuRLONCmwbTJ5xI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHOdxPuhndTA1hJ2wyCLQzmIzsjJagcZ7XsuGrJCkIThvdQbZl9wlhi7APaWum9dj5FAd1U2HFW6D3bDFRLE6uFBxQSTSndy/P64yRyIhC3UL6Q1P+YUwMVtEkBmoH622IVuM+rVXJ9qCajdaoBtzQwpKjYhXX1MVhztKCqvHYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMtwMTsB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMtwMTsB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ED2C4CEE3;
	Wed, 11 Jun 2025 18:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749667614;
	bh=a4l2CHrqJdsjNmKQhyuxmXX7as3MmuRLONCmwbTJ5xI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MMtwMTsBlxDHmWS/yYHJCRLjsUdF8XYGDVnIGVsgIjNqR0No/vpJjrSEt7xFJvfXl
	 I3Bno5FFVJZfM767cUsKq6tYTTJYEAbXVHRI74trjZ1iQ0VLYID81bwvuCc8jahGmJ
	 gdHybPESN18I3iMd6JyYHqTdtdsj1KIRWH2MzgS3H1qGz7oYOJLGcCZ7z6HQ37bXHk
	 N7NCne3qWTZo5+LkhccEGi8y8C91sGKJH2zJQBbCvfGkMhWPHrjyqIzVBjCF2pZhDQ
	 UhSFiT0TpIMMPLyE/cnVE8SKQYX9ZodVFyEECM0cyT+b2okgN7FgR2oUEvrnLw5roE
	 yZRp9M18Ydz9Q==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso22994366b.2;
        Wed, 11 Jun 2025 11:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAu6JZMUnEEeqeOKcSBmTIpYzm23j6CBJvvfvSui/+W/xaWMi8kgM7NgCqDmzjlzt0Bjom16Kl0wM0OFR6@vger.kernel.org, AJvYcCVkpd7fmuXj+gJwofpI0UTTXImI5e7X+5W4GXdydJuJusqXp/97b8/3afizWxsKffoblQLeoKeWPi50@vger.kernel.org
X-Gm-Message-State: AOJu0YzNUNFRILXAs59oNVZmYB69CqiMFROATyM90DxlM12siq4GbO8q
	knsSkBARl5KoTM/XN2ys3fSz8Frc7lmcYj//fLbYn4dQ3t+OhtwKNLewbvronTxqYfRrUUPxSj3
	aERDrfCIdaV5aHeMY3p8eXVFYJ0B6XA==
X-Google-Smtp-Source: AGHT+IEtiYLqZxPX6vg79k1l4PJrPl4a356jYKlMYVrfSiN34x4GAKFDsw4RbXmE6kLrUUCaPNybODY9V3P09GFhmaM=
X-Received: by 2002:a17:906:6a14:b0:ad8:99cc:774c with SMTP id
 a640c23a62f3a-adea9456cdfmr18086266b.58.1749667612085; Wed, 11 Jun 2025
 11:46:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com> <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
In-Reply-To: <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Jun 2025 13:46:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
X-Gm-Features: AX0GCFsOeaA5WdIXO14g7zVwNMaCmTI9osasLBHNTNRqJq2RE6YUF5IFXoLClZA
Message-ID: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 12:32=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for the GPU present in Apple SoCs
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/apple,agx.yaml | 95 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  MAINTAINERS                                          |  1 +
>  2 files changed, 96 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/apple,agx.yaml b/Docum=
entation/devicetree/bindings/gpu/apple,agx.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..23df3ebd689b1e885eb99ca57=
3343fe7f2d09dc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/apple,agx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SoC GPU
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: apple,agx-g13g
> +      - items:
> +          - enum:
> +              - apple,agx-g13s
> +              - apple,agx-g13c
> +              - apple,agx-g13d
> +          - const: apple,agx-g13x

I'm assuming the 'x' is a wildcard. The preferred thing to do make one
of the 3 actual devices the fallback. Typically, the oldest one is
used.

> +      - items:
> +          - const: apple,agx-g14g

This and the 1st entry can be a single enum.

> +  reg:
> +    items:
> +      - description: ASC coprocessor control
> +      - description: GPU block MMIO registers

Seems odd that the main GPU registers are not first in the list, but
either way is fine.

> +
> +  reg-names:
> +    items:
> +      - const: asc
> +      - const: sgx
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  memory-region:
> +    items:
> +      - description: Region containing GPU MMU TTBs
> +      - description: Region containing GPU MMU page tables
> +      - description:
> +          Region containing a shared handoff structure for VM
> +          management coordination
> +      - description: Driver-opaque calibration blob
> +      - description: Calibration blob
> +      - description: Shared global variables with GPU firmware
> +
> +  memory-region-names:
> +    items:
> +      - const: ttbs
> +      - const: pagetables
> +      - const: handoff
> +      - const: hw-cal-a
> +      - const: hw-cal-b
> +      - const: globals
> +
> +  apple,firmware-compat:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 3
> +    description:
> +      MacOS version the current firmware is paired with, used to pick
> +      the version of firmware ABI to be used.
> +      Bootloader will overwrite this
> +
> +required:
> +  - compatible
> +  - reg
> +  - mboxes
> +  - memory-region
> +  - apple,firmware-compat
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> +    gpu@6400000 {
> +        compatible =3D "apple,agx-g13g";
> +        reg =3D <0x6400000 0x40000>,
> +              <0x4000000 0x1000000>;
> +        reg-names =3D "asc", "sgx";
> +        mboxes =3D <&agx_mbox>;
> +        power-domains =3D <&ps_gfx>;
> +        memory-region =3D <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>=
,
> +                        <&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>=
;
> +        memory-region-names =3D "ttbs", "pagetables", "handoff",
> +                              "hw-cal-a", "hw-cal-b", "globals";
> +
> +        apple,firmware-compat =3D <0 0 0>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa163f9fe8fe3f04bf66426f9a894409..2a32c9c4ee355a1109a3e2031=
ea3663c39cc8c68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2331,6 +2331,7 @@ F:        Documentation/devicetree/bindings/arm/app=
le/*
>  F:     Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:     Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.y=
aml
>  F:     Documentation/devicetree/bindings/dma/apple,admac.yaml
> +F:     Documentation/devicetree/bindings/gpu/apple,agx.yaml
>  F:     Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:     Documentation/devicetree/bindings/input/touchscreen/apple,z2-mult=
itouch.yaml
>  F:     Documentation/devicetree/bindings/interrupt-controller/apple,*
>
> --
> 2.49.0
>
>
