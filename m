Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB7219DF9A;
	Wed, 16 Apr 2025 00:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763332; cv=none; b=qIuhHnTe+mmILqYDRpTWhW4p5Lb97e5b3FZaDNfsnf3XJ8IT7w0POpq4FNoWQ9MZqEvU3po74cRBKEUWZSGGABpomew0nGZw/SO+ZbAIx0S4jQ5Sb/YrGF/2b/Xi3T8IYTCDvESSEWC81JFiCI+iN7k1GBA67OvlQzy5tlc+g8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763332; c=relaxed/simple;
	bh=aZ8e9E4oy+FC9t47KpCQnXZ1uYFzFoMu5h6MhZiLvsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdTFfD4zTAQRosjO5IlUOKd9TZM1LBxQHX/7KivXVRIAc9jKkbVOg8+LdzWTsfILb9cXXczg9/sFLBQJkIGXACF8t8IrTlC9hlrm8dds4gYxaRWiUNtg91UG4i/u5VNrGZ6m4utQLyVKF9mPKKpQy7kenltrJIJv1I4V5hPNDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhPpLZGH; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhPpLZGH"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b06e9bcc986so2547307a12.0;
        Tue, 15 Apr 2025 17:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744763330; x=1745368130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/jQln6EvrU5OsZbEU25l6V6bVkwJkGV9R7Ry8hxcQY=;
        b=hhPpLZGHeqUdptUrCLGezpsrlWSrqhZTf3Ou3ex4DLcZs2j/MB8ciL80HEyly7DW0J
         6P+me8I7A3NEenltLX6ptQPvhPCB0WOGq6yJSp/MNDHmNFjFYSKATRApF/4O2QPFO0sC
         PC7F1NHQayzJMxjfKSTRJxbOBcA3C8TI1eqNJhc8oTx3liYxxure4G6O+6QSQGQU2YVx
         cWGDjgsMN+WZyVduQVW+sIUVOddrm7F2nIBq2lx+smd3zwvd8T2K0xWFyh9LoUf6Krp7
         6R3d27odR9fwJoRL7PNbqsaogSmrTLpeivkQPl2h+8c50yjDeBpidWpvD1nfO+z7dXqE
         uA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744763330; x=1745368130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/jQln6EvrU5OsZbEU25l6V6bVkwJkGV9R7Ry8hxcQY=;
        b=hUmBHsR4m50Gad52f+IRM8iuTomBIrk14HHxnq1+Hc0oNSFPcWzd0t6mGDX2rNRCki
         2zpDbjoVLPkp+KKrRSFrGQGOfUaXGSfxKCxipDHrJuSICKcBbXji38LQFdHDGkK6bHO5
         YXdaFMjbWnEgxJtmuyArt6pRhuyP9eY+IdTeWx0+jKhYOW0p/3HCtN1wi6HGvOu4vk1c
         2lWQFdl7EY132GhEpfkWavSzTlaNXA9gTOqs/IGFgneOOugQ+472VcTmKyaB1ltfr6/i
         /jI0BELxbDi6V42tlrIfOmYuQksU+JtXzWX3jL/z3d37enZ0rMzIOPmMLM6RbQvn9C+g
         nfTA==
X-Forwarded-Encrypted: i=1; AJvYcCV+2x7SFlWmxBeLjohGIRFPuL+pMszGIEpXGde4fr5uScR42syCIPBS6h7HmovxQ33I5YpLgy8v1Mo3sGvx@vger.kernel.org, AJvYcCX+S/CbXOepov1/crBOeJ/ODwthhr+g3cfOiOVcpFYdJVPzGhT8TJ4gKKkP3RYf0Sa9hw60WV5yq9fe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5xQFENvWz1nZKkzSyYLIFlSxq06SwLcsAQf+dEH2ACtX6/Gj7
	9y7ZfE49fXK2fzYKQrjmdfYTXf50/KpBW1wvSdCjytj+Yoml7+hI
X-Gm-Gg: ASbGncvCkZao/Kbu/4o36mjB5b8LIkkho+AnqrWhaQc1WLgyRAYU/dFNZGuHcoJ11I3
	Ivr0LUbYjNIce6J8lo98p33LwWyvUpqbuDzvtJMAH/GY/UpwUxOY4skdvnkw+iWYHV+RW79XFK3
	L86MENioLgAGHkPKXpQnT/rRvXat0i8kQX7Apa7yZ9Nwo+9Sm3dIa1lFE1FiyEvl2jeCJUF1Mcj
	POLW4WjmzS/xGN/05TXmloQHN7m4/fdl502IPkz9rEMrp9/ky+qeefrr4VU6JE7OV8PJO/RPQ+p
	3icL56RrBQRDHB3/Oxjcy9g0U2qvHI+2+9q9rPo6pS5Giw6UxaezJ/17AWv2Xl+q
X-Google-Smtp-Source: AGHT+IGtQ/Ej18r+8kc7C8PSEgqWMtrQoxZsB9NyLbPlB+AasEwznrdWOuaSLp8n5bhqJPQw3iGZKg==
X-Received: by 2002:a17:90b:2784:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-3085eedbef2mr2079796a91.15.1744763329584;
        Tue, 15 Apr 2025 17:28:49 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b3719sm263756a91.33.2025.04.15.17.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:28:49 -0700 (PDT)
Message-ID: <47643fc7-240e-4af8-80c5-236f1afa8524@gmail.com>
Date: Wed, 16 Apr 2025 08:28:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: apple: Add PMU NVMEM
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-3-22067be253cf@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-3-22067be253cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Finkelstein via B4 Relay 於 2025/4/16 清晨5:52 寫道:
> From: Hector Martin <marcan@marcan.st>
>
> Add device tree entries for NVMEM cells present on the PMU
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t6001.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t6002.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi      | 50 +++++++++++++++++++++++++++++++
>  5 files changed, 152 insertions(+)

Aside from things that are already mentioned in the feedback for the bindings:

>
> diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
> index 620b17e4031f069874aaabadbf06b7b29ec4031e..d2cf81926f284ccf7627701cc82edff31d4d72d6 100644
> --- a/arch/arm64/boot/dts/apple/t6001.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6001.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  #include "multi-die-cpp.h"
>  
> diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
> index a963a5011799a0480f88688fb4372a31f0bbf806..e36f422d257d8fe3a62bfa6e0f0e0dc6c34608a4 100644
> --- a/arch/arm64/boot/dts/apple/t6002.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6002.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  #include "multi-die-cpp.h"
>  
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index 4c224e686ffe5602329f7f394d3354559c4130ab..9e4402b0bdc085a32d26048ccf1ac4ea20c1e0c2 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -50,6 +50,56 @@ nub_spmi0: spmi@2920a1300 {
>  		reg = <0x2 0x920a1300 0x0 0x100>;
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> +
> +		pmu1: pmu@f {
> +			compatible = "apple,maverick-pmu", "spmi-nvmem";
> +			reg = <0xf SPMI_USID>;
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				pm_setting: pm-setting@1405 {
> +					reg = <0x1405 0x1>;
> +				};
> +
> +				rtc_offset: rtc-offset@1411 {
> +					reg = <0x1411 0x6>;
> +				};
> +
> +				boot_stage: boot-stage@6001 {
> +					reg = <0x6001 0x1>;
> +				};
> +
> +				boot_error_count: boot-error-count@6002 {
> +					reg = <0x6002 0x1>;
> +					bits = <0 4>;
> +				};
> +
> +				panic_count: panic-count@6002 {
> +					reg = <0x6002 0x1>;
> +					bits = <4 4>;
> +				};
> +
> +				boot_error_stage: boot-error-stage@6003 {
> +					reg = <0x6003 0x1>;
> +				};
> +
> +				shutdown_flag: shutdown-flag@600f {
> +					reg = <0x600f 0x1>;
> +					bits = <3 1>;
> +				};
> +
> +				fault_shadow: fault-shadow@867b {
> +					reg = <0x867b 0x10>;
> +				};
> +
> +				socd: socd@8b00 {
> +					reg = <0x8b00 0x400>;
> +				};

Please order by unit address.

> +			};
> +		};
>  	};
>  
>  	wdt: watchdog@2922b0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index bdb1cb9e406a441e458b1c735359b0148146e91b..03bfe1cb173de009b4cd46508e24358008cf42f5 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -747,6 +747,56 @@ nub_spmi: spmi@23d0d9300 {
>  			reg = <0x2 0x3d0d9300 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmu1: pmu@f {
> +				compatible = "apple,sera-pmu", "spmi-nvmem";
> +				reg = <0xf SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					pm_setting: pm-setting@d001 {
> +						reg = <0xd001 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@d100 {
> +						reg = <0xd100 0x6>;
> +					};
> +
> +					boot_stage: boot-stage@9f01 {
> +						reg = <0x9f01 0x1>;
> +					};
> +
> +					boot_error_count: boot-error-count@9f02 {
> +						reg = <0x9f02 0x1>;
> +						bits = <0 4>;
> +					};
> +
> +					panic_count: panic-count@9f02 {
> +						reg = <0x9f02 0x1>;
> +						bits = <4 4>;
> +					};
> +
> +					boot_error_stage: boot-error-stage@9f03 {
> +						reg = <0x9f03 0x1>;
> +					};
> +
> +					shutdown_flag: shutdown-flag@9f0f {
> +						reg = <0x9f0f 0x1>;
> +						bits = <3 1>;
> +					};
> +
> +					fault_shadow: fault-shadow@a67b {
> +						reg = <0xa67b 0x10>;
> +					};
> +
> +					socd: socd@ab00 {
> +						reg = <0xab00 0x400>;
> +					};

Please order by unit address.

> +				};
> +			};
>  		};
>  
>  		pinctrl_nub: pinctrl@23d1f0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 950d1f906ba3023c1d118179207a2099345aae94..55ab72cf627efe2e3295409b9af1b2128b829801 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -787,6 +787,56 @@ nub_spmi: spmi@23d714000 {
>  			reg = <0x2 0x3d714000 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmu1: pmu@e {
> +				compatible = "apple,stowe-pmu", "spmi-nvmem";
> +				reg = <0xe SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					pm_setting: pm-setting@f801 {
> +						reg = <0xf801 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@f900 {
> +						reg = <0xf900 0x6>;
> +					};
> +
> +					boot_stage: boot-stage@f701 {
> +						reg = <0xf701 0x1>;
> +					};
> +
> +					boot_error_count: boot-error-count@f702 {
> +						reg = <0xf702 0x1>;
> +						bits = <0 4>;
> +					};
> +
> +					panic_count: panic-count@f702 {
> +						reg = <0xf702 0x1>;
> +						bits = <4 4>;
> +					};
> +
> +					boot_error_stage: boot-error-stage@f703 {
> +						reg = <0xf703 0x1>;
> +					};
> +
> +					shutdown_flag: shutdown-flag@f70f {
> +						reg = <0xf70f 0x1>;
> +						bits = <3 1>;
> +					};
> +
> +					fault_shadow: fault-shadow@867b {
> +						reg = <0x867b 0x10>;
> +					};
> +
> +					socd: socd@8b00 {
> +						reg = <0x8b00 0x400>;
> +					};

Please order by unit address.

> +				};
> +			};
>  		};
>  
>  		pinctrl_smc: pinctrl@23e820000 {
>
