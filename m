Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EA54B1E6E;
	Tue,  6 May 2025 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548308; cv=none; b=COkAXeuas1tnTtMCAtn08lvjJ/MssO4MkIzPUrjYSdsrinlwYXXtL16LaxA+7jY0ZWxiIByEvVsm5W0C+elEZUVsX6tExA3nnZWV1ohUWux35qslld22w/yWamYSMGKM9UUyLQV8ovQZOTt3TgIDAOS+QK2RwC/msgT3JxjkqEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548308; c=relaxed/simple;
	bh=emBjgCM5I1Y2fXlW9rfDJETXzlGbP29LeHdhehNHrHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l81cOslY8SnkFgJMlNCxbmQ+pSyS1sSdAfrWJ4D/U9HaDmOfo+Kquy2y14Y4hP+EPWytDodK6FaGxJMuCOmILMWfM8epjyjDu0kpoEtn8mmEyQZQMG+F8kq4XvVZE9/Z07SyxczvcCfydqAO8IqTFQ5H1HKg9ixWm7lzfx/jRU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TW7Hfs+f; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TW7Hfs+f"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso37763015e9.3;
        Tue, 06 May 2025 09:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746548305; x=1747153105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1cS61LVZKrWXnKuYKhuBHfGsirDMufbR946FM/MtgEU=;
        b=TW7Hfs+f/8rloT6/KH9Ne+IP3qI7w35DMmzpy8cYiUPBHfLvvBOakT7s/nZ5xr2/dT
         OeO1XX8qEJdggV4VFpQCF1K3cR/biPipoPovXtgAeWURFbczeRhn/lgHr6li39Ng2O9t
         rR4v2yUpvJTh0QbJiJTKuebZK+FSe8QVZXpbBTXewYKVN21if2Ac1W7E2nbtQA0YaRPy
         twpZUZg3PvmNXc8V6IbRPXW4zAldC/D6WcwselysuDTbSiPyTCxcKBvE5Ub0SSXYIAGg
         TKsFGeeJLt2InKVvWaEQNrGqiTzWUmqLNBNPcuy+smRVQwWiD8K5sZrzcBlSih/4SABn
         xndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548305; x=1747153105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cS61LVZKrWXnKuYKhuBHfGsirDMufbR946FM/MtgEU=;
        b=Rd9YINHJThr5AoQuikmLN/EDL2AtSr4WW9Q5yfjgwNq1pQ0Y0yq27buvpvMONXs1GO
         F7HDURvjSILA6ykUPVYrrnIYLttHryX2XkQxzk1+AoSxH5sSgmHDecl64PZ3w+MSuT+8
         rcN5m19GNzbM2RTSxZuzb7roFyqyJhZT5IQsFd4wzVTZdEnuEYk3OaXvI/2qFzfjMUQB
         uo13+p9eYjpCX3IczA7mI9R+HAth6qD9BHRzf9P3zMaKmUK8T+AFs597/TuRiTuMzYV5
         yRMw0yada/0O2VFQEa64GPzW6FXy+Kk8OKXgNL5bt/FVY3hu6nTOFgftM69n8sKdwNv3
         uDKg==
X-Forwarded-Encrypted: i=1; AJvYcCUYvaA6actUnGZGjDjSeZhDP6R4210Ndq01Mpz2iisv1zE2G5eglAJ8Pg0tkmgzYvD8TarZ6C3f3YZy@vger.kernel.org, AJvYcCUy+i0nBH4uwx9uczWQ05LkIorsKY/tww+QKJeELnJO1oOwp16ItePMm9B1FfW6D7l5CAcPhgGfoPkKsb+O@vger.kernel.org
X-Gm-Message-State: AOJu0YzVUbAAoE8x+PvEYnExZHgTjI7vbkqGarqQ6laayvZQvbNdKAJ5
	QW7sp32QeSjeRT96g3ppLUcmfqFS55T+V0HzWf3lgMCSTweV/MurSCKZaA==
X-Gm-Gg: ASbGncsbfE7MwDKdVip017jls5hfPFcCkA2sSQyUA/GMj/kSn0E0jWTttF/CpfbcKhG
	ABbIwTPZxmJST3lQ97JfbOSG7oS/9Tc/h7Zwja+Bv/OPQZm50AgFxJ4K/72j/kaR/vm8G51t0Ub
	k1CXeHix7lqIh+6Oq86b16trQfUjnOv7su62ijt1aqCUvFW/kIt2Vf6hVs53QlAn3LlqKI6/ZSa
	ycgrsyldl6ztia/mCBE5tswPm+szsyPvP8//2FVQrKy1fhL/OBcsCfsGqkQFLzUPhFYvkVmgUs/
	dKqWoCW7oH9CmVQzFMwmFU7QkMPmdFvs8QlPPw/+RmBqonqDP5vtBJc/9DB8YIDgksH6EvtKcL0
	Ladj3
X-Google-Smtp-Source: AGHT+IGU0TQhAHjXxrq16kn+BpAYKB1LsUoYHW7I7DRlj5KmeEWnSKtEqVOK2yC4MXtiz++M8MQo5g==
X-Received: by 2002:a05:600c:871b:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-441d053bf8dmr41414035e9.33.1746548304730;
        Tue, 06 May 2025 09:18:24 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a315bdsm178436865e9.39.2025.05.06.09.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:18:23 -0700 (PDT)
Date: Tue, 6 May 2025 17:18:22 +0100
From: Stafford Horne <shorne@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 opencores,or1k-pic to DT schema
Message-ID: <aBo2TpT2hadJq49M@antec>
References: <20250505144803.1291424-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505144803.1291424-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:48:02AM -0500, Rob Herring (Arm) wrote:
> Convert the OpenRISC PIC interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../opencores,or1k-pic.txt                    | 23 -----------
>  .../opencores,or1k-pic.yaml                   | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.txt
> deleted file mode 100644
> index 55c04faa3f3f..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -OpenRISC 1000 Programmable Interrupt Controller
> -
> -Required properties:
> -
> -- compatible : should be "opencores,or1k-pic-level" for variants with
> -  level triggered interrupt lines, "opencores,or1k-pic-edge" for variants with
> -  edge triggered interrupt lines or "opencores,or1200-pic" for machines
> -  with the non-spec compliant or1200 type implementation.
> -
> -  "opencores,or1k-pic" is also provided as an alias to "opencores,or1200-pic",
> -  but this is only for backwards compatibility.
> -
> -- interrupt-controller : Identifies the node as an interrupt controller
> -- #interrupt-cells : Specifies the number of cells needed to encode an
> -  interrupt source. The value shall be 1.
> -
> -Example:
> -
> -intc: interrupt-controller {
> -	compatible = "opencores,or1k-pic-level";
> -	interrupt-controller;
> -	#interrupt-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.yaml
> new file mode 100644
> index 000000000000..995b68c3aed4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/opencores,or1k-pic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenRISC 1000 Programmable Interrupt Controller
> +
> +maintainers:
> +  - Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - opencores,or1k-pic-level
> +      - opencores,or1k-pic-edge
> +      - opencores,or1200-pic
> +      - opencores,or1k-pic
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +        compatible = "opencores,or1k-pic-level";
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +    };

This looks ok to me, I will queue via the OpenRISC queue.

-Stafford
