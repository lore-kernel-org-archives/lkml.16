Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2DE27C17B;
	Tue,  6 May 2025 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510177; cv=none; b=aMW0G/S0mNySqawz4YsvH8bJXd1aYEALpTmAaUZ83Hxj3iOPZQcw1ZAaQQeAZOeejnvC8WcLgJs5Tj1ySfHNb70jwzmdBEiyojvq/oRsAZ36jvuVBSO9X6zogE7GG7/8h7KF9ladStpFx5o3ndHk93wH3nSPY0JKofXO9viBJeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510177; c=relaxed/simple;
	bh=vN6313YRStxLjwbXfk+PPA3holHWjj2ITlnRmUb5ZBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOkbfMTsumIXBFQFjsH1oRMgtFSy1/og/rTqrib8DuhGdzUznmZf5MlIKIGS2pFN4yGqMyEwYI3VWY+KZb/OT1LNPWVI6iReL/mEz7e/wZ5GMNtyru43WmPm3JscER0cW0TCaRn2sRAvk02jaAjRdC5JCiiP+02GEL/ufqHOAmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgPykVIP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgPykVIP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042BBC4CEE4;
	Tue,  6 May 2025 05:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746510177;
	bh=vN6313YRStxLjwbXfk+PPA3holHWjj2ITlnRmUb5ZBU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GgPykVIPIFvYa6lcW6so/5gmR+sPv1LIg53CU35mihZMiYF7f1DjhhyqOvt8RWSkQ
	 nOU7OU2MMQ9Q5/IRp0Jm7nbY+JFmNP/SYdD0zbABP3KJo+Bu8Ieh+tprDQlVTlLBIQ
	 3kvXRJcuKcwqQIkpFBJaWlGXAgZ12j4hYwmXgdrOpOfEJ4qSCKR5mA4vug091ZwxGO
	 hAJKvvVSEFZjIQlAWGfwlSJE9GREqonUbLm5jP4tu6SudxBK6ZWUCeucRiVwm9edgJ
	 CbWMRcfwaO/MO1Y5UXiCtIh8tFjuoRKEizy+TRyRXZx5SXkOHXDJPOY+wonD41ee8L
	 6AKpCKjsh5ZoQ==
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so6230495f8f.3;
        Mon, 05 May 2025 22:42:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvwxmmr3PRib2iBP/xPlzst7umlShvTrxWIZ3PiO3x735crLnPBfEvYagNvWD30bon+O6d5pTMcP1V8Q==@vger.kernel.org, AJvYcCWKlMKKZaf7/ua/IpD0v6+RXKIqdhJCm3QS1/AcMoiw1urhZLELvehaHRh2Qiu8uD1BRbnxkdXigkSL7+Zb@vger.kernel.org, AJvYcCXoK8BOdieE2bn9Ce3IkUuBpwQPkRGvVLite0RJZZzxZhYRQwSK4kQybKvY00e1iZjLfOIruAQUjwUm@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ8+g0AQg2a/jnyKBPoXwZpB89iXmPRCZ5FsaqcMVqzQQDWO6t
	qqI/nnaAoDHgseRHMhXkAZLfO71Ckx6zXxoFAwwcu1BDNddG6yqG+AgQEuJPPcgmD0f9aX4N/5N
	HE319O6Il2iy4EmV0ZqZJjItpk1Y=
X-Google-Smtp-Source: AGHT+IEpne/77MYjT2Ew1y+GK/Ne9FQBzPV4ltq1REufnqRMiBjfdX96WgGK09ltaOF3qSD7ILtJuRl9aTL2JHnwEy0=
X-Received: by 2002:a05:6000:186c:b0:39f:9f:a177 with SMTP id
 ffacd0b85a97d-3a09fd88c00mr7020990f8f.17.1746510175603; Mon, 05 May 2025
 22:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506022224.2586860-1-robh@kernel.org>
In-Reply-To: <20250506022224.2586860-1-robh@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 May 2025 13:42:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRXiCi2D1XZzqiFKEMY3YF5T7E-m_3hrxDuEvjgOSEptQ@mail.gmail.com>
X-Gm-Features: ATxdqUFaAs6SdDiDuHIesuJYu7wwDfGnchyldojMY3YXo-OIVDNnvvy0Vt8uxCM
Message-ID: <CAJF2gTRXiCi2D1XZzqiFKEMY3YF5T7E-m_3hrxDuEvjgOSEptQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: Convert csky,gx6605s-timer to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Guo Ren <guoren@kernel.org>

On Tue, May 6, 2025 at 10:22=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Convert the C-SKY gx6605s timer binding to DT schema format. It's a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/timer/csky,gx6605s-timer.txt     | 42 -------------------
>  .../bindings/timer/csky,gx6605s-timer.yaml    | 40 ++++++++++++++++++
>  2 files changed, 40 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-=
timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-=
timer.yaml
>
> diff --git a/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.t=
xt b/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
> deleted file mode 100644
> index 6b04344f4bea..000000000000
> --- a/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -gx6605s SOC Timer
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The timer is used in gx6605s soc as system timer and the driver
> -contain clk event and clk source.
> -
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> -timer node bindings definition
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> -
> -       Description: Describes gx6605s SOC timer
> -
> -       PROPERTIES
> -
> -       - compatible
> -               Usage: required
> -               Value type: <string>
> -               Definition: must be "csky,gx6605s-timer"
> -       - reg
> -               Usage: required
> -               Value type: <u32 u32>
> -               Definition: <phyaddr size> in soc from cpu view
> -       - clocks
> -               Usage: required
> -               Value type: phandle + clock specifier cells
> -               Definition: must be input clk node
> -       - interrupt
> -               Usage: required
> -               Value type: <u32>
> -               Definition: must be timer irq num defined by soc
> -
> -Examples:
> ----------
> -
> -       timer0: timer@20a000 {
> -               compatible =3D "csky,gx6605s-timer";
> -               reg =3D <0x0020a000 0x400>;
> -               clocks =3D <&dummy_apb_clk>;
> -               interrupts =3D <10>;
> -               interrupt-parent =3D <&intc>;
> -       };
> diff --git a/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.y=
aml b/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml
> new file mode 100644
> index 000000000000..888fc8113996
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/csky,gx6605s-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: gx6605s SOC Timer
> +
> +maintainers:
> +  - Guo Ren <guoren@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: csky,gx6605s-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@20a000 {
> +        compatible =3D "csky,gx6605s-timer";
> +        reg =3D <0x0020a000 0x400>;
> +        clocks =3D <&dummy_apb_clk>;
> +        interrupts =3D <10>;
> +    };
> --
> 2.47.2
>


--=20
Best Regards
 Guo Ren
