Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3EE1F4C87
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749058044; cv=none; b=UIxBl0jbzBD+2LrbOtg/eNFDjJA3lkAHlkPNgXmTMMHxPOmDiySUShasOY1KwNwrd6Hxo/6ziCPrWX0cDc+QzPt1u+rw7phYgZPd9m2umRpWkeL3DES1Vrn4S/LHn+GAgd/B9iJ39BvW8GWPfMuhGTrDXp0YDWbOLSQIXA3NvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749058044; c=relaxed/simple;
	bh=WkrEjRTp7ONtQhwntim4NbZfLp3T6Zg6YR+mnF+dMEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUGBJ+BaucPEuwkWnhRPLb8ulil2pltpBk6D86Du6Cr5SpTFRetUxBRcCyILMgewdrKgT6kVZafWEIdFckanwg9vEYQnBb0Cy/E8j+P4cg+q2fRvpxMrW8Dt949JZ++mWo+yfwhcI/75fUea9Z3ZXqyXPK9DEUgcocGpGEigNvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qhc2Xxnv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qhc2Xxnv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2345c60507bso723305ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749058041; x=1749662841; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7B9otxjjw86LIN97ls2HG35KDJxQJSkzx4ZMv9DYuA=;
        b=Qhc2XxnvYhc2xbBFlt4/ZtiyFaSJj9HROLP8Lk3fk9k1i31htYcyGGfpKu4jjTRyzc
         Lu9hvXd+oqAA+psnRWZP5335+oeAG4iO33bAkq7Q/ZRZSblkLPYdNabLeAKAt54G8rYj
         e9k2eeks3aBOOUurbZ8FRhcPRUHLi3PWvg0036RMbXrUuU/3kErWNg6BvTgzLdUG/Ogn
         Yjr2R6i7OkUribCXksS4PqPL5TX20SrWt5qkn0pr5Fgw/+2KPGdl5vOtpfP6PJosiV5r
         8M7f7I72PEUjiMzA5kwogebwlnegqkkPOW8GbHFedk064XZeu6auR+iaSusfm9mOX5bL
         chMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058041; x=1749662841;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7B9otxjjw86LIN97ls2HG35KDJxQJSkzx4ZMv9DYuA=;
        b=ftSCClYQiJNyFthNFr0GuJQf0vwISdGaxwNH+G0Ait9Soyf68shunC89lE9TTB0q2w
         cQ3URuvgOLQ/d8QlwpQomgyN9JVnXsfxPgRNK/6ctAbrzsReQ8j3D6E4OgqifcBpJJcq
         2GdUpCoi3cCPE+6aKNL6dnc4Nz+TA/ZfrFlpDT7LjB5tKHU5gZ1y6uWfZ+a/ZJaOaMlN
         EDOkabCMoejwGllYSuT8Pd9ryih+Y8jn3Kb287616aly6ttL7LSUEqRvx1QMAKxwedq3
         l4nr5JeMnmwMz4bd523ROV9w7py1rfQR5uSIzma52UWexJlE7P8/RnxAxcKIB0PIenkx
         5w4A==
X-Forwarded-Encrypted: i=1; AJvYcCXu1JlBgfSzAxg3/fLFKvRy2kMwhNI1+fFgei0QPJcqWethkgVmttgxZJZjPuZ6ro7ifrU3wMwxVc2bLjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6lcodupcmXV9a2OSHCCR8a4jJSxvZj1qeqqOrF38dangz7uI3
	b4dIri2EqQjAySKgiuvXRE+/Vk6qqKRyIlMUx19qfhtMPVv2adIglvhnijvJbLUZnw==
X-Gm-Gg: ASbGncu+IVWMZso5KmM9wzYaudj2W8rO2+b4YIbmZZ2ZnWyNsMl0KHPdHxwQ5M5DpZD
	1az+8ZAiEqWo1YhRt3PQkIQ5HRBqm6Xl0EY6qXfBFpYCzmnAUNUF3tlK53vHLrF9CQ4qXLHL/eX
	4yYOtLoijHSFVSivPMjDuThp4EY3qwabd/x8Tftz9XNoav/px9TmRxHHIvrbn2vY0xEAVBUHqUG
	dJ4GrEKRhe6OvE3C9I6gGLw+unZGPZCaDzz20d9YgdIZmvrlkFPt42RfL6p3QL57WOm3s/2cglx
	7SWtv89SYH+t3bmIWTeeqvrvbMrr9Uh8RTZyr5ttbfTUBw6u6rohY9h4P50Wow==
X-Google-Smtp-Source: AGHT+IH1DWvZbMUTKY0iYBnPsO3u5V0VrOXZgYbT6v4V4ZwUlpiIxHERxxyfrv3KJRUYnHRg6IZfnA==
X-Received: by 2002:a17:902:dacb:b0:234:d10d:9f9f with SMTP id d9443c01a7336-235e11fc8bfmr52595515ad.40.1749058041460;
        Wed, 04 Jun 2025 10:27:21 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92f8sm106368255ad.88.2025.06.04.10.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:27:21 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:57:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a779g3: Describe split
 PCIe clock on V4H Sparrow Hawk
Message-ID: <gfr63eotna6javssbrxj6lxifo3o3gypv62t5kg3tzjcyp6zbn@skh6th5vggwb>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <20250530225504.55042-3-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530225504.55042-3-marek.vasut+renesas@mailbox.org>

On Sat, May 31, 2025 at 12:53:21AM +0200, Marek Vasut wrote:
> The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
> bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
> Describe this split bus configuration in the board DT. The topology looks
> as follows:
> 
>  ____________                    _____________
> | R-Car PCIe |                  | PCIe device |
> |            |                  |             |
> |    PCIe RX<|==================|>PCIe TX     |
> |    PCIe TX<|==================|>PCIe RX     |
> |            |                  |             |
> |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> '------------'      ||  ||      '-------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|======''  ||
> |   CLK DIF1<|==========''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Use pciec0_rp/pciec1_rp phandles to refer to root port moved to core r8a779g0.dtsi
> ---
>  .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 31 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> index b8698e07add56..9ba23129e65ec 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -130,6 +130,13 @@ mini_dp_con_in: endpoint {
>  		};
>  	};
>  
> +	/* Page 26 / PCIe.0/1 CLK */
> +	pcie_refclk: clk-x8 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +	};
> +
>  	reg_1p2v: regulator-1p2v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-1.2V";
> @@ -404,6 +411,14 @@ i2c0_mux2: i2c@2 {
>  			reg = <2>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			/* Page 26 / PCIe.0/1 CLK */
> +			pcie_clk: clk@68 {
> +				compatible = "renesas,9fgv0441";
> +				reg = <0x68>;
> +				clocks = <&pcie_refclk>;
> +				#clock-cells = <1>;
> +			};
>  		};
>  
>  		i2c0_mux3: i2c@3 {
> @@ -487,26 +502,38 @@ msiof1_snd_endpoint: endpoint {
>  
>  /* Page 26 / 2230 Key M M.2 */
>  &pcie0_clkref {
> -	clock-frequency = <100000000>;
> +	status = "disabled";
>  };
>  
>  &pciec0 {
> +	clocks = <&cpg CPG_MOD 624>, <&pcie_clk 0>;
>  	reset-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  };
>  
> +&pciec0_rp {
> +	clocks = <&pcie_clk 1>;
> +	vpcie3v3-supply = <&reg_3p3v>;
> +};
> +
>  /* Page 25 / PCIe to USB */
>  &pcie1_clkref {
> -	clock-frequency = <100000000>;
> +	status = "disabled";
>  };
>  
>  &pciec1 {
> +	clocks = <&cpg CPG_MOD 625>, <&pcie_clk 2>;
>  	/* uPD720201 is PCIe Gen2 x1 device */
>  	num-lanes = <1>;
>  	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  };
>  
> +&pciec1_rp {
> +	clocks = <&pcie_clk 3>;
> +	vpcie3v3-supply = <&reg_3p3v>;
> +};
> +
>  &pfc {
>  	pinctrl-0 = <&scif_clk_pins>;
>  	pinctrl-names = "default";
> -- 
> 2.47.2
> 

-- 
மணிவண்ணன் சதாசிவம்
