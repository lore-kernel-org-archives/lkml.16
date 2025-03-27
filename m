Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D41C8634
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096582; cv=none; b=LF0+b7/9gzMXLhELkolSwxuwEZ8uF6Xe6sfZGW6enV+lj/1nJqC15HGhj+EfgelQbsgbvOQiDsTH8jwFRPqyR3iCWEPc+/qOpCAR8gHz/zwZe+lS6i4y3p8nW7RYOdUjTi3BUbW0LDmLClE9N/mQFBUSM6R7FRmgFB+WlMpd+9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096582; c=relaxed/simple;
	bh=OZOUMn7eWVEe+quoJzHzusizR9zi54OhgtUY1wqnIkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGLlgbY3JS48iS2VvUC4wWnR29ruBWGJpGmXrQcX2Qq798J+xdhRUiaFLe3jZHPag9K6OlwkifibkYSfZp0X4JIvt0PBThNejSq1DfZxmZrUDCR3P/gKrcCLmw3haB5dsuAWI3PH++5ErB0MsLeqaHSqPtIffcrhGetmgTOtesU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGykoCHF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGykoCHF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224341bbc1dso27427555ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743096579; x=1743701379; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xUAnTAtDNuNnJIdSSQ+Rk9ZfVSwofE0KN7R4UOP1qhM=;
        b=zGykoCHFQPArIFXkw7/cqDhWopIJKCzoJDZQo8VeFRWwdgralGhrO85LVSys/keiwA
         C2pCPo5TcsVuql02vgUuuERcoXCBYfA1wXcXI5JaixleBVOVH2mj3JnLPuKouQbSCUfG
         hO+5wZxLaphMo8FOpeELjXzJmBYiwmHa6k2Yzv3xXN4Fv4noUvLoMuT44P6EqAipg5/0
         krsmPUBQXngU4UY4F7MkxjNmc4s7tBuMMheSjOJ5/grgCjiRG3fiLWuFSpKqHwC9QjzX
         1WL3O3f0b4IJfCE1cIK/wyv/kkztjPpByYkRKd2nhLeIkz+UvrPwx5xEJKUnKzRU5bKB
         7KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743096579; x=1743701379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUAnTAtDNuNnJIdSSQ+Rk9ZfVSwofE0KN7R4UOP1qhM=;
        b=c3e4n9tpZLhLMi3Xr2iJWGnGHzyEUor6okmW2IbqC1ay7vM9ZUdR5DBa/rpRp7rfFo
         DPj9GhTG5S8A6pk5x8k4Y7FD+wbWulj9RV9aZZOiIP2dnSfjDCteZXu/NIEd8RnNxs3R
         AR+6AQt1YEQ1wRdoP8LoEtNzADbFnfoCfYOknu4DwwfU/e3APETPixdq9RVvkIctWYJa
         LT3KXPXMgHD/r7IIl1q8LRH6fjWkHnkVpFUdGl85b2J3yuZYZaAo2AeJwy94w+Fi3hOF
         eByOlmk7hcaB6C9TEGF7FyPumyaoOl6MXoZ3shCMbQFfBthj7tpAbxkN/ohz05T/iZe8
         nCNw==
X-Forwarded-Encrypted: i=1; AJvYcCWhWWytvVej22RsohK9NrvwW7hCdvE71AL06EYRk/6wbScUnbHGHz29oBccztjQfpWE03DghinLgPMMsOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6cyyMZdNMFKy6XVIhXOrQ/fNxlHGLIuba6H1Y/JaZS+2Qrds8
	vlWiy2aDP7uaGGVE0O0JcHou1Uhb/Dqwe4vSgIlemwgbJgCt//2jJl1M5zyZ4A==
X-Gm-Gg: ASbGncv+YeMXzRHaQov9OOf8kx+KzLCwCD6L0JD3qonhxq5FhVqZ0awxBFYf1m6Icmh
	FMpIg+RJvPF8IzNlVmBmrc1SoJFjGzy9/J+u74/58gAmxBkEhgM2TVUzv1FZNl0072v6y1LRryk
	Qyf9d2W06dc8imZmuRhJyPbCjzi8EKW4iVam/U2mgPJwbaY2XX51IZWxvjUW+JFZhpl3IoVmOZl
	cS5gwR5MoE+TPomV7v/nkH5sQELMZwEDR7pBqunrmaJ25oJpjFY3Wm08vD2dVcCarQVcJaT3jz+
	jkmbYID1erWZaRgsH/8yFNEMzAZIsu/rYprVyiBoJUB8UcUmyB4sn2w=
X-Google-Smtp-Source: AGHT+IGq9WA9Mg+aD9Pf6gxE2w7nofLRKq3e9u+4e1o+z4k8xCGL05Lgi/yGgHNUkZz6Z+X/JLWE9w==
X-Received: by 2002:a05:6a20:2589:b0:1fd:e9c8:cf3b with SMTP id adf61e73a8af0-1fea2f4c4e7mr10560727637.30.1743096579450;
        Thu, 27 Mar 2025 10:29:39 -0700 (PDT)
Received: from thinkpad ([120.60.71.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deeea2sm81237b3a.21.2025.03.27.10.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 10:29:39 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:59:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Praveenkumar I <quic_ipkumar@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	20250317100029.881286-1-quic_varada@quicinc.com, 20250317100029.881286-2-quic_varada@quicinc.com, 
	Sricharan R <quic_srichara@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 5/6] arm64: dts: qcom: ipq5018: Add PCIe related nodes
Message-ID: <vmka3ediym33gjwy6vztxn25j2gwfeeht3s3nbx3ozinuz2k7n@7nho6bfvsuo5>
References: <20250326-ipq5018-pcie-v7-0-e1828fef06c9@outlook.com>
 <20250326-ipq5018-pcie-v7-5-e1828fef06c9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326-ipq5018-pcie-v7-5-e1828fef06c9@outlook.com>

On Wed, Mar 26, 2025 at 12:10:59PM +0400, George Moussalem via B4 Relay wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add phy and controller nodes for a 2-lane Gen2 and
> a 1-lane Gen2 PCIe bus. IPQ5018 has 8 MSI SPI interrupts and
> one global interrupt.
> 
> NOTE: the PCIe controller supports gen3, yet the phy is limited to gen2.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 246 +++++++++++++++++++++++++++++++++-
>  1 file changed, 244 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 8914f2ef0bc47fda243b19174f77ce73fc10757d..9f695f0d9c6b7f29c4564977cadd6a78b55a044f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -147,6 +147,40 @@ usbphy0: phy@5b000 {
>  			status = "disabled";
>  		};
>  
> +		pcie1_phy: phy@7e000{
> +			compatible = "qcom,ipq5018-uniphy-pcie-phy";
> +			reg = <0x0007e000 0x800>;
> +
> +			clocks = <&gcc GCC_PCIE1_PIPE_CLK>;
> +
> +			resets = <&gcc GCC_PCIE1_PHY_BCR>,
> +				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
> +
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			num-lanes = <1>;
> +
> +			status = "disabled";
> +		};
> +
> +		pcie0_phy: phy@86000{
> +			compatible = "qcom,ipq5018-uniphy-pcie-phy";
> +			reg = <0x00086000 0x800>;
> +
> +			clocks = <&gcc GCC_PCIE0_PIPE_CLK>;
> +
> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> +
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			num-lanes = <2>;
> +
> +			status = "disabled";
> +		};
> +
>  		tlmm: pinctrl@1000000 {
>  			compatible = "qcom,ipq5018-tlmm";
>  			reg = <0x01000000 0x300000>;
> @@ -170,8 +204,8 @@ gcc: clock-controller@1800000 {
>  			reg = <0x01800000 0x80000>;
>  			clocks = <&xo_board_clk>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <0>,
>  				 <0>,
>  				 <0>,
> @@ -387,6 +421,214 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		pcie1: pcie@80000000 {
> +			compatible = "qcom,pcie-ipq5018";
> +			reg = <0x80000000 0xf1d>,
> +			      <0x80000f20 0xa8>,
> +			      <0x80001000 0x1000>,
> +			      <0x00078000 0x3000>,
> +			      <0x80100000 0x1000>,
> +			      <0x0007b000 0x1000>;
> +			reg-names = "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "parf",
> +				    "config",
> +				    "mhi";
> +			device_type = "pci";
> +			linux,pci-domain = <0>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <1>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			/*
> +			 * In IPQ5018, the PCIe controller supports gen3,

nit: no need to mention IPQ5018.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
