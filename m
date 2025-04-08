Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA30253B44
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141057; cv=none; b=p4CqXMJxYNZwhFhPmPPsQnvz7tpubl/MoP558ZerSKfRhID0VHnXIgWXOS2rlMVGiznAitSou54Ppb4TSJJvWpZy4at6R7f3yZ9tiEnclcIUsp27pYLfkUFF2PI96hiBzxumoySSAlQKnf/J/KLxBlIkV4OXuYJqqV1CMhTg2OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141057; c=relaxed/simple;
	bh=NTJ5KjJ/ZBgfEJpw4A0/HInj2/oRXkh+bzZ1SdLcYc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbyjptlWG3BxhhqSW3W7ip4eD6yHVVjF9tF4ZfJhWbjZUrBpxrFYlpWtIh4mzNA8fd8r6Ne9+ZTDHCEby4m4ceRbLPTrj9ZBceT/fIcQu3fbWXk2MKWYLuMLfXouXFIFGoEca5w9RJsi49qe7FWLwrxbAmKcD23DWGWvHXul8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=K2rdQed6; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="K2rdQed6"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d5e2260f52so34981115ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141054; x=1744745854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ob4oUqAxpn+J+G+4QGZ2IAdpzs1pkYoXWSPEpJ9MtRw=;
        b=K2rdQed6xFOwRoOmlDJZKe3Cnr2U4I5bpFt9nIRuzfJGpnT9VUO4G3h7SzGGCY86jl
         wx/lp7sgA1Vhb3x5Ep5cteGCwHkj+Uhy/bQh3YI4RF6haR1HZVcjlru9Ba+dNC0W1J8Z
         NFptXBFKNK89Y1GcGCae7SOA2wxp6JMHCAO+NAuKLKjvmYINO9D7Vqbu6UzFT6Ps7rre
         z22/98o1D9EaTut76wEpOB81eXHYSJ4TKqffSJz4M0CS/AQ5go4UscYHMQ2SdmZ8E7I8
         g8jgQZnFUNexd8hbReFhwhNKYgYajTUCfmRbMS/jUimvd5bnOCxC7cD0YLeizFZqEfVA
         /a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141054; x=1744745854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob4oUqAxpn+J+G+4QGZ2IAdpzs1pkYoXWSPEpJ9MtRw=;
        b=oMCGvlEuHh99GJHrWM0jS5agACu4fIPfuoZIdEqkdI4s+bgCat7TWajWkjqhqL7dgM
         C8yhJX7YDLXbUqjx8PPRzgdes9D0JzPfZ1ShLA4FgXpInFQh9vnnmRF5Gf+WmipMtrod
         xcdSfVZe/axVifVTI6SvEmhjVUHz61PTwqKudEGfH3iqxrzX3Op4T16fsH6QdMe9DLpp
         hxIzW8ctbxiNV0Rm5nNSjBKQTqUaw4eZTku6/Rg+GvhszUyXc4A2SUX76TO2Q2HcrrsR
         xPYM4pHZAeqbaVdpkoGSBxJna2AbGIMBF8fV1R21fX12UfLCqGQ6KZvcDw3ART9nREgY
         9dOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4BeOd4rheWIW4KB3O0CtHScVVHNpQ1MI0PgsOU+WecHUwSGpnzowo6ZsIda1zN4DJdWK7y+NKNEq4CXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSmsgjZTZrlMuT5Erc3fAaxDXb2Q3ACcmfTIhZ5mZtMw6jeWCF
	735xk5P4zFqPYwKPMD+ufTNHTx61lx2o90ij9nq0VoC2mrpJhyCUKi1IDT0SSVo=
X-Gm-Gg: ASbGnctuJq9QRR3F/eY4ojAsZV2ZHCl+9CUHu6Ll7XZShnJLL8w/ZsFQEszMrJNfrua
	UOYobkg4FTapCRf3qzTnTsKps4fOFh66oDyM/xH6JB359UHqyIOuEGcsRFsHdEL+bYOMSbZ6aM6
	KFr4VUPHJzycUBZ6tBUGlcQSUsyF9d3MAdC5hRYXhWfNjeQPJM5ZcLeiRZHssivG9ErBDJiP78c
	LgqUnZRvZe7H5hk76m9erqIAVGbu6CtacS9G7sicBDtnc8RxHiuzS0018avGoWhG+EBLNCLXNRX
	Y7+/GH41faSQPkpVLGKNe9WOLAS/fpwjcKr39RjtrNx1yzU0HZ6CjC/ifGc1YSxpLZyFfCxO6v1
	TcNEeDaNw8WH7ldoCdW4=
X-Google-Smtp-Source: AGHT+IE7j1OBiF96wzmsrWHFXnRl197F3CnscJiSLVvRNPdCYjy+kg0LczV2LeKhYQRulMXH9GWIZw==
X-Received: by 2002:a05:6e02:144b:b0:3d4:3ef4:d4d9 with SMTP id e9e14a558f8ab-3d77c2b260bmr1879095ab.14.1744141054359;
        Tue, 08 Apr 2025 12:37:34 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703c0665esm5904485ab.50.2025.04.08.12.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:34 -0700 (PDT)
Message-ID: <c7bb5f17-1d64-449b-ba33-4de63efa4286@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] riscv: dts: spacemit: Add clock tree for SpacemiT
 K1
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-6-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-6-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 12:24 PM, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

Other than the suggestion that you rename the "spacemit,mpmu"
property (mentioned in patch 3), this looks good to me.

Whether you change that or not:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c670ebf8fa12..584f0dbc60f5 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -3,6 +3,8 @@
>    * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>    */
>   
> +#include <dt-bindings/clock/spacemit,k1-syscon.h>
> +
>   /dts-v1/;
>   / {
>   	#address-cells = <2>;
> @@ -306,6 +308,36 @@ cluster1_l2_cache: l2-cache1 {
>   		};
>   	};
>   
> +	clocks {
> +		vctcxo_1m: clock-1m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <1000000>;
> +			clock-output-names = "vctcxo_1m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_24m: clock-24m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "vctcxo_24m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_3m: clock-3m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <3000000>;
> +			clock-output-names = "vctcxo_3m";
> +			#clock-cells = <0>;
> +		};
> +
> +		osc_32k: clock-32k {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			clock-output-names = "osc_32k";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		interrupt-parent = <&plic>;
> @@ -314,6 +346,17 @@ soc {
>   		dma-noncoherent;
>   		ranges;
>   
> +		syscon_apbc: system-control@d4015000 {
> +			compatible = "spacemit,k1-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>   		uart0: serial@d4017000 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
>   			reg = <0x0 0xd401e000 0x0 0x400>;
>   		};
>   
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k1-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x209c>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: system-control@d4090000 {
> +			compatible = "spacemit,k1-pll";
> +			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-control@d4282800 {
> +			compatible = "spacemit,k1-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>   		plic: interrupt-controller@e0000000 {
>   			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>   			reg = <0x0 0xe0000000 0x0 0x4000000>;

