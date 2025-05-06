Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEBD278143;
	Tue,  6 May 2025 05:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510216; cv=none; b=ADuUto+Y51Udyv3TtuZke9p83AQkGHHUnHhYmS6TOawm7qYpvMnZVgwYDAj3Ae0p56++MOSeJce6kBLYkVoO8xiYwtfoZFwkseapnsFb30znm3IVNfIWawfeI9LLT/x8UgFghe9Ts+ZU2FcbCXLWSFXDfIkafNEyBeBoajX8K9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510216; c=relaxed/simple;
	bh=7XwLIBHNyaR4D3EHao4WqBfo3YlsWI6g5g0z8mcQuAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPUj/8z4PmLbLY78BIVEbFVlkd3NYJrRoJkT/Ca1OYGLq0gsXXShlkhGN31al9YaFUiZrlbLBOh9YPuKNG33ZmJ6adcKDwVYWpybYZZixA4ITnGXMcouvnq336jWAhmUHvWfbc9d92YW/YbdOhIpkI/RGEmYhTMUUkMRo9qzoIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkCmDIOq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkCmDIOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9C9C4CEF0;
	Tue,  6 May 2025 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746510214;
	bh=7XwLIBHNyaR4D3EHao4WqBfo3YlsWI6g5g0z8mcQuAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SkCmDIOqI0esO8WwYORNQWVsD+ASzXtF9fcdP1BYxhuVHgim17Kg8UvPcWD4rAuyC
	 eyRaPgyJAwsG4QDGIsj/OvQqdlSgBhTgu06atySEJ8hCz8aKXFiMrLpA5tI2PW1/yf
	 De2kHwbyH2LR4645YqNSpHvXKfKeVJE+82zERkzp/6DaeUI4UKWZrZPfkjUE17cVt9
	 Llr++TQdPqHSe4PMcWATPBaQDES6Jk4FyVXpNGUeqdwVXrCNLIbXzaaUaYxAi651oi
	 QTLH0mDvwWbtMgZRCPErAkTJMar5JFdbP0m/W0XfLclQRlcmdKcO6qS/V+9jSD07m7
	 ieh1oeQu4BvwA==
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf257158fso28091515e9.2;
        Mon, 05 May 2025 22:43:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWplyKV8y7Fo6ZR/Ov4lGwA1Wadx4fSnEUJHkZB7qQbk3RI6gD88yIKDhjJuG0a02vEzmh5fkXsJTPLA==@vger.kernel.org, AJvYcCVQei97h4XAIvq1jRbtKqPUHHzNvpIgBDJAOWQQk8u9PTaMKE1fh4ceBuFz1GFFZomlIFbrCzW6PDUSWgdK@vger.kernel.org, AJvYcCVrhtEyP9e605NP/yD1nUzq9gEWKBALYZxyCbD2RF4MnVf2x0yvweMHvj6IKRgG9D23KD/9Rblo1WdQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxWr5SArbegQESHEsAWtnD7TnKMIkSfmqYIkpz0xTWu6u5Ft439
	rpv1inodLXGfN1lAkdrzOc4AYfowDqtoY8HlKVcQrASHyvth8yUUo08xDhaGAQGDvVEIAVctEeb
	ZLstvISpORN8d27U/k5ZZjAiS42M=
X-Google-Smtp-Source: AGHT+IHEBOSh22wh5ytRtsODpOSzl48x8Ut967As0R1wo2tOnP0ve4mwXy2I3o+AVTldsnmSd3AW0XCK1qG32tMyPqc=
X-Received: by 2002:a05:600c:34c9:b0:43c:f85d:1245 with SMTP id
 5b1f17b1804b1-441d050c216mr15057885e9.17.1746510212996; Mon, 05 May 2025
 22:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506022228.2587029-1-robh@kernel.org>
In-Reply-To: <20250506022228.2587029-1-robh@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 May 2025 13:43:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQO-EP6ht=jh5aLrMSy8YUddgXzbN2n4JO5YhSBnPRPmA@mail.gmail.com>
X-Gm-Features: ATxdqUFnK1iDC-lJ4GruNVQYuUDUrz8Y8vCPRWcvgcW0BDO0JeVowJP6Z6s56jU
Message-ID: <CAJF2gTQO-EP6ht=jh5aLrMSy8YUddgXzbN2n4JO5YhSBnPRPmA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: Convert csky,mptimer to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Flavio Suligoi <f.suligoi@asem.it>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Guo Ren <guoren@kernel.org>

On Tue, May 6, 2025 at 10:22=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Convert the C-SKY Multi-processor timer binding to DT schema format.
> It's a straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/timer/csky,mptimer.txt           | 42 -----------------
>  .../bindings/timer/csky,mptimer.yaml          | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.=
txt
>  create mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.=
yaml
>
> diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.txt b/D=
ocumentation/devicetree/bindings/timer/csky,mptimer.txt
> deleted file mode 100644
> index f5c7e99cf52b..000000000000
> --- a/Documentation/devicetree/bindings/timer/csky,mptimer.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> -C-SKY Multi-processors Timer
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> -
> -C-SKY multi-processors timer is designed for C-SKY SMP system and the
> -regs is accessed by cpu co-processor 4 registers with mtcr/mfcr.
> -
> - - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
> - - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
> - - PTIM_CCVR "cr<3, 14>" Current counter value reg.
> - - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
> -
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> -timer node bindings definition
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> -
> -       Description: Describes SMP timer
> -
> -       PROPERTIES
> -
> -       - compatible
> -               Usage: required
> -               Value type: <string>
> -               Definition: must be "csky,mptimer"
> -       - clocks
> -               Usage: required
> -               Value type: <node>
> -               Definition: must be input clk node
> -       - interrupts
> -               Usage: required
> -               Value type: <u32>
> -               Definition: must be timer irq num defined by soc
> -
> -Examples:
> ----------
> -
> -       timer: timer {
> -               compatible =3D "csky,mptimer";
> -               clocks =3D <&dummy_apb_clk>;
> -               interrupts =3D <16>;
> -               interrupt-parent =3D <&intc>;
> -       };
> diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.yaml b/=
Documentation/devicetree/bindings/timer/csky,mptimer.yaml
> new file mode 100644
> index 000000000000..12cc5282c8f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/csky,mptimer.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/csky,mptimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: C-SKY Multi-processors Timer
> +
> +maintainers:
> +  - Flavio Suligoi <f.suligoi@asem.it>
> +  - Guo Ren <guoren@kernel.org>
> +
> +description: |
> +  C-SKY multi-processors timer is designed for C-SKY SMP system and the =
regs are
> +  accessed by cpu co-processor 4 registers with mtcr/mfcr.
> +
> +   - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
> +   - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
> +   - PTIM_CCVR "cr<3, 14>" Current counter value reg.
> +   - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: csky,mptimer
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer {
> +        compatible =3D "csky,mptimer";
> +        clocks =3D <&dummy_apb_clk>;
> +        interrupts =3D <16>;
> +    };
> --
> 2.47.2
>


--=20
Best Regards
 Guo Ren
