Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3FF20ADDD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600038; cv=none; b=rhsUjXS8RHI2VZCWSiXYfd+ExGRfvUp47222kpnt82i6Nr4VOABnk6wqcztgMyNeRX6jFq7MfHgH1f9xVtpu6fIEYX7fUyTRavN4Z21NeleAOEiydhsqvtzWgjQmUO1t6lRtO2xT+W+T1gOZw6s9+dp4b2GmPcHH9xcFfqMCLxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600038; c=relaxed/simple;
	bh=rR7hQh33KP0bP7q4B4IjjrkJyufHdp8U5zeSr0Radkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+jnKjJzUePeoK/6DH/NXC/3nnbKnvv6U0rV9NGP/+Ji0RiQ6Rbp19mOPA0e5Fo+vFWNgMZZnHXjdyqVlo8WMB2swKQaUZeGb/LwsWnl+cZ70KTDptUqlSnYajxbIsNQ0dGt0Af/H6cmT8xJFKQampRAZH4NsXB3TBhSlPqareM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIFJrGqT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIFJrGqT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21644aca3a0so107927985ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 08:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738600035; x=1739204835; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JBg6gLdWMQpS46gItbVGZbM0/ir52n7XG2Rtnoa7Rhs=;
        b=aIFJrGqTh8IncU6vk+Rcs9nl8kIT4zd3ghDKjeuOVTcsriJMfKlzNCGf6kww3UGxmE
         rLfNeOV3PQ7BdNCwbIL/RDjxRJASk4wccuQH8xG7E1JxLH+uFtvLkIGwp6I9aW6eODaE
         tY0z1qvOOy3YWaN7tMj1w5cN24AOQyiUtPnJetK3mFFWFfSgCdft2cCZiOALv+E7RDdF
         w+qPZgkI6wUlkPV8WHf9jJeOhAm+3JzKT06dnL6WGo/t+VIAtFoqb3YAPiixt26n/Ikv
         nMcEXdmcb3spECKD93aXlHWRMxAUUkYY/s3ejlI9QTJRAyj5rMuf11T+M1W1Q7pxy0xH
         1L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600035; x=1739204835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBg6gLdWMQpS46gItbVGZbM0/ir52n7XG2Rtnoa7Rhs=;
        b=eCaWtqUGs7BQVq8sqAwWFtqeGhUGXBR/gGSTYctsiH8hQdkh0n1zlPpBKzlSsQ1Nja
         RYL0zrijYh+3pFNZAGsQX/XSZ5JaHKu4umcyBEy9WR+w3JKTTf1GsIByRx196uf5l02z
         v8Mg7VORJ/SbqzBhI2YNfAJHJ0st982eRLC2t6o+NyzHQSeJ7KE8pwN7pSYC2FrHXdoS
         1qiFXtm9gH8i8nK1XfTCAJB5daM6XYvYUsi7+mCVR2bEM8vqNfYnrhtqtIemtj7Z8q0S
         MzBYC7LB4eGGKR7WJgPBuJrEk49UjXPhs32CpEuxvDJkt4pIb4fWtSE+4+mDeijTPHuz
         8A9g==
X-Forwarded-Encrypted: i=1; AJvYcCV6w28zbU9l0UH2R1GLQ0iRZdmW7W0XHZS7RtxJdF1mjMDZoGTnjm4OXZBV9jUpgyXfnnjTbxrxWFRmXnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNZvr56/xPKCc7f2DOK5S34qq3Ice7gTsBsfY4kvFX7nF1aHUB
	PRHFb1eJbtyhEjpvn9OmXSg8NyTRupajYyHHA0lRaS2G0WXqhiKZEQPq3ZNNag==
X-Gm-Gg: ASbGnct7JzhAXJZHUfEfmVYDzgDzUojdUeiDS33Rw7lZaDMZv5SMd5YW1ks6Ov771at
	LpWmDWgYqqcKpIXlp0ysK3PV6LJxmeWHuK2MGORfTxkoTCtSomA6fj3PFeJv1wi0DelLOXPSO+E
	T+U5HYtNjT04TKrUNUJJT6RWIllF1ZCpLxJ3sPCwfjwbmdOj3Msq3iI4cRcJEzsXh2PPTOUyKcO
	VzWkuG4FGvxZThkbNWnnWK65Oope2rCeO5d6EUabnSTwC0hMHPwvMq3VEYq7M0c8fM0rBW1PztP
	8aSgpfrrO/GAXGKNiANCEk3dow==
X-Google-Smtp-Source: AGHT+IHuJ1CvxSLBHcjRE6fl9BYtU6v4T+2YCHXV92PHfDZwQle0B9YOYr0Awsg0UnhM953ytkygeg==
X-Received: by 2002:a17:902:7c93:b0:21b:bc95:e8d4 with SMTP id d9443c01a7336-21dd7dcb1e7mr291187365ad.35.1738600033231;
        Mon, 03 Feb 2025 08:27:13 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7927sm78526795ad.99.2025.02.03.08.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:27:12 -0800 (PST)
Date: Mon, 3 Feb 2025 21:57:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, quic_nsekar@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: qcom: ipq5332-rdp441: Enable PCIe
 phys and controllers
Message-ID: <20250203162706.bz2xtpyuvylgzfdw@thinkpad>
References: <20250122063411.3503097-1-quic_varada@quicinc.com>
 <20250122063411.3503097-8-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122063411.3503097-8-quic_varada@quicinc.com>

On Wed, Jan 22, 2025 at 12:04:11PM +0530, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Enable the PCIe controller and PHY nodes for RDP 441.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> v5: Add 'Reviewed-by: Konrad Dybcio'
> 
> v4: Fix nodes sort order
>     Use property-n followed by property-names
> 
> v3: Reorder nodes alphabetically
>     Fix commit subject
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 76 +++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> index 846413817e9a..79ec77cfe552 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> @@ -32,6 +32,34 @@ &sdhc {
>  	status = "okay";
>  };
>  
> +&pcie0 {
> +	pinctrl-0 = <&pcie0_default>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	pinctrl-0 = <&pcie1_default>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	status = "okay";
> +};
> +
>  &tlmm {
>  	i2c_1_pins: i2c-1-state {
>  		pins = "gpio29", "gpio30";
> @@ -40,6 +68,54 @@ i2c_1_pins: i2c-1-state {
>  		bias-pull-up;
>  	};
>  
> +	pcie0_default: pcie0-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio37";
> +			function = "pcie0_clk";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio38";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +			output-low;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio39";
> +			function = "pcie0_wake";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie1_default: pcie1-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio46";
> +			function = "pcie1_clk";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio47";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +			output-low;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio48";
> +			function = "pcie1_wake";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	sdc_default_state: sdc-default-state {
>  		clk-pins {
>  			pins = "gpio13";
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
