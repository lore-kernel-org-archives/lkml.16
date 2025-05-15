Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E121288C33
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298230; cv=none; b=sl5ZVQvnyANe3w1oYrPznUbMyQ7rpLakFQ7JcEq2FAz6wPKBe3j9qANtLkiSHyngPF3Euy23rj+H34tew8MjhfsLjvzhVmDecCPfzviCYvrW3gd2sT2HpL931AgMOPvsIv4urVRPhD+vQKrqUEhhpMwS5eoCGZpc3FE+JjsOIE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298230; c=relaxed/simple;
	bh=pfZEqn7xS5lSMrZ8BWmE+kx91wUR5qeBCgiElHGM9kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCYXMcwaTFUIiuMtMgPR30WvTJGlS899v34Z3U8U9paAATsf0AgGE7oP36EFao6bw4W6y/Jz03A11XOK+WqkcGj4E1Fhl3cZ+Z3OcJheyNJ1zN7AQG04HmXq/cWeN7qtrygwgJNbbfWrI4Qz3z3MEPzltEsVpSg7ctzkSfNFlT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fus1si1P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fus1si1P"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-441ab63a415so6798365e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747298227; x=1747903027; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BIzrdar4Xr4Yn7VJnhohVXle0hMXzlUPEm7nDd/YT8M=;
        b=fus1si1Pi0hyoEVHP3FCUGmD79gWURkYafihm72nZLhYkuqxV34yN95Xm39PrjVrZQ
         3aE+zBacuVXNZB73FGknc8DMQ6M6wAJ3b451bMKcGCgLZEDYGzrLV3uYYM1fZXyPh4BS
         k0T/3DxmidAPbYjAWrQ0gPCQpDXe9RHonhQ/MD7Xk5buxbrk4JThqXr8xBXYxdVSp161
         U1jqIOpWpnDcYzcMZ1lZcheQuZLu+fDEQ6dVT4NNrWiQOCHKFaNBBa9KOjKojdbjYEDW
         7ZbOdsr+uRN/Bl27GYkyFdHRkIjjxhzcDYRRSqTNr2cV9Cu6UcYsz4qjOsjkwoGaOX+e
         eKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298227; x=1747903027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BIzrdar4Xr4Yn7VJnhohVXle0hMXzlUPEm7nDd/YT8M=;
        b=foGGRmMeZ7Z4H8CN3EVoT9g8y0x973YgAlA997dOZPjuFfEa8fcB8myrdoLeqzoAWi
         aKgaBklGNJBcAz5VEDZAkcVIerLH0VxI4tHEiYmwbUUGbQgE4ebin3Tb5MVphoShB+QK
         UaW8raV+pQSBqp5rBumNQTweuYY0qKhYXwVhDWozStU+8hXdIqdmqmcR3qmzU1uUnIpa
         uPP8kS0pKJr0VGWp3cB019YRQ0WtVd9X2MBtiwnqH8GlHb5KxZMl5dmurAMhD/8+gJPU
         kd97OI7NvWqvlurGPCrg9zm0UXXJgmO3Pi2cWLrLkYn8WHndVFkEps13S8nVasyRbrHh
         hK+g==
X-Forwarded-Encrypted: i=1; AJvYcCXiu6YH3wgXQZQRf/20HRjlXKISEk7Xr2YKyo8yDebRU94KR1SFRsUBnWjYywJt2PrJlC/YRpHurgBeErQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUzP46IIHotDb4yoYHT6Wy5skgtr2Ld0SLVlJJ9+a5BnJ/SNp6
	7U/fjUBrSgC9KySTOMxiEC5lZaWiO+53aj9pUTZBTQZmawqGz5QCyh29R7tMRhI=
X-Gm-Gg: ASbGncs29SxNxOroEBCQQM+p1fp7JUiVk9pCwN0G4RMtmASP7SUt7mNllUN8AneC7Kd
	sXfv4JIHvfxn62ws6e2cy8zSZBsKwmqngiaBcN1Puv7xYJNcnfwOxNi2x3dAkVthCRDJYp4lq/i
	1eujmYRfAcfKkLZqB5vQfyvFHSFmxpW24Kz0MLe1aRDoI70pb5rpb2J3DjQR9NN7AKuVucVwYnN
	VfEK2EBe7VgvUKy1zK+IT79HUkOzRq3e2hGSovmQCTSccPpXl1+C1IKA6Vg4fBVtT7JrtNg02Y+
	hvZ2LL2N6UR5W2Z4cAAvQLJi1uyPuj1crX0/IloZwzLtRxD0pmHT9zaCpO1CfYjpfKRSq+v/AzS
	ay9BFxLWhFrrwrw==
X-Google-Smtp-Source: AGHT+IEKNMiZ/Dao4WCMOpQoN5MHi4xf5XJixRA3rQXwHPXJ4hB04Gl/HkzVD/DYYMWEmopMe9nRTg==
X-Received: by 2002:a05:600c:4ecf:b0:442:e011:7eb with SMTP id 5b1f17b1804b1-442f2179993mr74502955e9.30.1747298226647;
        Thu, 15 May 2025 01:37:06 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f397926asm59378265e9.36.2025.05.15.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:37:06 -0700 (PDT)
Date: Thu, 15 May 2025 10:37:04 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert fsl,gtm to DT schema
Message-ID: <aCWnsIpMal8_m9Y8@mai.linaro.org>
References: <20250506022245.2587662-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022245.2587662-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:43PM -0500, Rob Herring wrote:
> Convert the Freescale General Purpose Timer binding to DT schema format.
> Add the specific compatibles in use. Drop the "fsl,cpm2-gtm" compatible
> which is not used. The examples are all similar, so just leave 1
> example.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

I'm not applying this one, it was already converted by patch:

https://lore.kernel.org/r/20250412-gtm-yaml-v2-1-e4d2292ffefc@posteo.net

>  .../devicetree/bindings/timer/fsl,gtm.txt     | 30 ----------
>  .../devicetree/bindings/timer/fsl,gtm.yaml    | 55 +++++++++++++++++++
>  2 files changed, 55 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/fsl,gtm.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/fsl,gtm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/fsl,gtm.txt b/Documentation/devicetree/bindings/timer/fsl,gtm.txt
> deleted file mode 100644
> index fc1c571f7412..000000000000
> --- a/Documentation/devicetree/bindings/timer/fsl,gtm.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -* Freescale General-purpose Timers Module
> -
> -Required properties:
> -  - compatible : should be
> -    "fsl,<chip>-gtm", "fsl,gtm" for SOC GTMs
> -    "fsl,<chip>-qe-gtm", "fsl,qe-gtm", "fsl,gtm" for QE GTMs
> -    "fsl,<chip>-cpm2-gtm", "fsl,cpm2-gtm", "fsl,gtm" for CPM2 GTMs
> -  - reg : should contain gtm registers location and length (0x40).
> -  - interrupts : should contain four interrupts.
> -  - clock-frequency : specifies the frequency driving the timer.
> -
> -Example:
> -
> -timer@500 {
> -	compatible = "fsl,mpc8360-gtm", "fsl,gtm";
> -	reg = <0x500 0x40>;
> -	interrupts = <90 8 78 8 84 8 72 8>;
> -	interrupt-parent = <&ipic>;
> -	/* filled by u-boot */
> -	clock-frequency = <0>;
> -};
> -
> -timer@440 {
> -	compatible = "fsl,mpc8360-qe-gtm", "fsl,qe-gtm", "fsl,gtm";
> -	reg = <0x440 0x40>;
> -	interrupts = <12 13 14 15>;
> -	interrupt-parent = <&qeic>;
> -	/* filled by u-boot */
> -	clock-frequency = <0>;
> -};
> diff --git a/Documentation/devicetree/bindings/timer/fsl,gtm.yaml b/Documentation/devicetree/bindings/timer/fsl,gtm.yaml
> new file mode 100644
> index 000000000000..31d8534ac868
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/fsl,gtm.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/fsl,gtm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale General-purpose Timers Module
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8308-gtm
> +              - fsl,mpc8313-gtm
> +              - fsl,mpc8315-gtm
> +          - const: fsl,gtm
> +      - items:
> +          - enum:
> +              - fsl,mpc8569-qe-gtm
> +              - fsl,mpc8360-qe-gtm
> +          - const: fsl,qe-gtm
> +          - const: fsl,gtm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 4
> +    description:
> +      One interrupt for each timer
> +
> +  clock-frequency:
> +    description: Specifies the frequency driving the timer.
> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clock-frequency
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@440 {
> +        compatible = "fsl,mpc8360-qe-gtm", "fsl,qe-gtm", "fsl,gtm";
> +        reg = <0x440 0x40>;
> +        interrupts = <12>, <13>, <14>, <15>;
> +        clock-frequency = <0>;
> +    };
> -- 
> 2.47.2
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
