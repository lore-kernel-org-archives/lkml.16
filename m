Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49841EDA0E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262685; cv=none; b=iBHANkky49bZZnc946jIA+U7TXBlPyGqNRUqUkQMCRjSbfPAwhVxV5/K/evVAyF3IgmxcIkWIPPwfsC8oQPagEuu/9ibdQlWyPOIAU72VUqDq2C0J98NSUbNz4DDyU6tLE4VbG0psxF4WHkjNuIPQBU306rwpQjIG5v3f8+kRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262685; c=relaxed/simple;
	bh=8PYakAlyro5zJa4mSrGo6B1JdD1Wy5Jt8irra5IfyBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TeuqZsld+FLFse5Jmv593IL7moYen55bJOnzpFdvGub78ZIMfpHBtGxXTNa4m1VWzJvoEQnY26QefjgaBrybSulLwTRsjO9dvJBdNi//GjZt+/7Yzw2bySgjEshyduvnECveFHlNskzXm7wnqWWLSXyTP08jndLMItQpFhz+n58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=L1+m4H5Q; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="L1+m4H5Q"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4766cb762b6so44001461cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745262677; x=1745867477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxyUs0OyB6PY4ktlF6VOi53xW7dyCbW5pgQaVkoPnVQ=;
        b=L1+m4H5QksqPuVnjhjlNhPJVN3ad9fnKtt5TCKCop8dFcFBuzA62pasdgTVObmdyX7
         yZZD456fHjCEkh52E1sZ0mFxIvXCb9Nh06klOlxqj5WkKXWsKPHxhiqOPt7KOgIPO82i
         v94naqfOGXbHtK3NX0Zuix0hRIOHL/lDIAkQ5KKatO88At6yHhvkLWGBr+LGRl+9bYAL
         Cw1559TdbuXqxKeCR+FULzcPn34UdAUZP5Mr0J9CeyIWTWRTHbY3Gz4QaIkXAnnrvcwj
         MC+fkYsX2lXZSLocAVs9IETFnf3B1fQeUunc1/yTdxkM2fNpmaiM9hwWyhwVcGAGaQIz
         6WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745262677; x=1745867477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxyUs0OyB6PY4ktlF6VOi53xW7dyCbW5pgQaVkoPnVQ=;
        b=IF2ZsdITlVU/y9TZt1BlMIJpiQL2RTltleVuKgx71O6p2aTgu9wh557PYDzNjLNLU+
         bpE3wDnbU4rwtSYNlyO+rPeyMB85XavgUEIqdcKzQbotuDnhaFhjCxgjOYZSf4eyyv2+
         oHiraixi2K8rZ81UBJN0gAW8D19wO7iZse0PIqb9JJSk4Aqg7GnoPfLRoyr47G0wHMPC
         mvwGAweyIlF8/qOS87DHGzNGGc0LiGqB/BaucOiB1tjce/je6WSP+lxW9+xxcyLmkuHF
         rM3+vfHHbALBEL4pPcWhk4CWXeBdjzslvs58lXBGLCPQmXBmDLucMh8sdfPvshM5dhhh
         M1gg==
X-Forwarded-Encrypted: i=1; AJvYcCXBCicpB8HnYtvUYo9iUT/UBS8iv8w4t+JIj5w7aXVKgnl39fX0GubVsqqgwU5rvelgpdvmkSu+o5D0TOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2N81negM1YH8I2Y8SRR7GKBQI38HgjHd8fmJQPxclIMQZKtJV
	VibLi+jkFCQnAQ7GMCHbVgbwRco/v++cGq7P0l8jqi/gXuxVpb4K1zfpNl/UWC0=
X-Gm-Gg: ASbGncszi8vv1151cdIwTRbSgKE9KZ/Tx/pZY9TjRYayL+OPZBBeB+roe3EqWWeVmtV
	+eEkbpjSVdVE1AxDOFAB7pRf9C/Fg8K+SYSaeEfGW9DhUXA8AFpPVs848Q2V2NrjID+Qv6DHXoU
	N65LiKWFPl/yBOef3UxOLXzoylW03dffOR85RakzgaSZi8m5caQJSk1rxldlnvAreQQ2kBQLrim
	ixI54hcjHgQYuWFwIfKzBwml9uM8SgHRVwDp5w0Ed0lBP0cBWaQE8rZQfAXFPnoK7N3nS53g2LN
	djnfaoU0agIiMjDiUdZP0ZqgqAzoXESYTs20QrZWMAAan+EGPBVCJ8fQ+Bbv9OLwHL0bekYoOnK
	ezh01
X-Google-Smtp-Source: AGHT+IE8DZnLBNjUXN98eE0o/f4gMGDTtMaO/BL+aNlsPXo+fPOuUfQ1NdNuqmT1zTZSez0uNY8scA==
X-Received: by 2002:a05:622a:1c19:b0:477:84f5:a0b with SMTP id d75a77b69052e-47ae96515c1mr236320951cf.2.1745262677629;
        Mon, 21 Apr 2025 12:11:17 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c188a8sm45206481cf.8.2025.04.21.12.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 12:11:17 -0700 (PDT)
Message-ID: <8e7cdada-6623-41ee-8839-b6db1d24050f@riscstar.com>
Date: Mon, 21 Apr 2025 14:11:16 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: spacemit: add clock and
 reset property
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
 <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 7:15 PM, Yixun Lan wrote:
> SpacemiT K1 SoC's pinctrl controller requires two clocks in order
> to work properly, also has one reset line from hardware perspective.

You mention the reset line here but that isn't implemented
by this patch (or the next).

I assume the reset series will be merged soon, and if that's
the case, maybe you can add two more patches to incorporate
that in the next version of this series.

Other than the description, this looks good to me.  You'll
want one of the DT maintainers to sign off, though.

					-Alex

> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index b01ecd83b71b5e9f47256adde23bc8b183bef05e..d80e88aa07b45f4a3d90e8217caf93d32655927d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -17,6 +17,19 @@ properties:
>       items:
>         - description: pinctrl io memory base
>   
> +  clocks:
> +    items:
> +      - description: Functional Clock
> +      - description: Bus Clock
> +
> +  clock-names:
> +    items:
> +      - const: func
> +      - const: bus
> +
> +  resets:
> +    maxItems: 1
> +
>   patternProperties:
>     '-cfg$':
>       type: object
> @@ -94,6 +107,8 @@ patternProperties:
>   required:
>     - compatible
>     - reg
> +  - clocks
> +  - clock-names
>   
>   additionalProperties: false
>   
> @@ -108,6 +123,9 @@ examples:
>           pinctrl@d401e000 {
>               compatible = "spacemit,k1-pinctrl";
>               reg = <0x0 0xd401e000 0x0 0x400>;
> +            clocks = <&syscon_apbc 42>,
> +                     <&syscon_apbc 94>;
> +            clock-names = "func", "bus";
>   
>               uart0_2_cfg: uart0-2-cfg {
>                   uart0-2-pins {
> 

