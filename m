Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700F5259CA7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617991; cv=none; b=lSV+ibjbQCnL+EmyKX4JMPearxeSpUX5dF6YTbVgVf24JBal4DhB2mTrO0P+ZaO/6tq/uEbVPnfyCEWgGwtUKaaMglRmRi1qRUcheENKMrwrslxdacbG8Vl/DJpRHVJeWRwey79avc72+nJbx85e3J9gu8II3cxGwVDpa3p9PjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617991; c=relaxed/simple;
	bh=Tt6na1JgL9gZhGym0N2yqcFVRTJSFPyk7p6xzBcJWzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+a+fZLAhRyARxtPmr8p+X/gdzptX5C2Y1OpM0Qr9WbG1j/Gu8dBLbYUwL1AGRtJF+STnQLTl4jDBb8fJBCxQgOj0KUz47fYrW69zXd3yNvVGagHSFFMGyMIyTw1YnWwrXNIYS/m46gHB+JI+e3vyLtDtVEOO5uC/0PMba/IUVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5jFPU+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l5jFPU+1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DNjeSG021538
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=px7Blgm8qx6BAMDM/eVg3Hlb
	wIYCiUozHBvsIkG9+po=; b=l5jFPU+1JFnl3gsrOOMLiYU3rmI8ssnqt7CZdg+M
	YCdvc8K8irjy6j783KN/4fpyxm5vmiHo8rqfR15AhCjk20R+7RkeZb2wJa6CatP2
	XiS11dMEqwWyXeKRqV2Gh9E9UbAMlZcyMj2o/JQyR+B5lnFA3dtxuIKGgrdNQw1O
	Svu/H10lyffm5KlaQny1i8Oe8JL8HE1j3f1wSYhzXE7MhFHzOQll/5N1wPQAzOiQ
	NDIUBMU7AwBkeoElJn0AH737kcL1Kk1HcI/agEOxNvBhVVQnWq8q+gW1ULqIBO//
	wZuBYmIlpvqwf3tzCdpcrnyguV23knlU1MabJ4T1AmmcEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpkmue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:06:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so675009885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 01:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617987; x=1745222787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px7Blgm8qx6BAMDM/eVg3HlbwIYCiUozHBvsIkG9+po=;
        b=vPi1ETBD8IkRZaAOAVu3dyOaboGYKyiNUfSAv7pfOn8xEhWW4PkLb03gFGvGMY0pz+
         9+0smVEm/oJY1M0bEsVlh/xO6D4zxi9uA8ef+tBXDbq/fCNQCs6UzLigdarM0OkDvHEm
         vOojBokS4ncgefYN2lqY0fyIYrYgon7S1PsJub26RTBxavwEW/aoXLu2JRZgOeRBazNE
         cNly7b8FrKjsod+gcHsCV6UT0rQjWvXqA/fAvXebY458VKfoZQswls81hLF+7KVmrV+/
         Fb8Z6MI3wQWFe+Tzr3FVxK75hh+w+XQurmJ+NYxozj9F+ZY5iOY2LUdnP9Astw9jpcGE
         OjBA==
X-Forwarded-Encrypted: i=1; AJvYcCU/OY0my4Z3qwoBx2kkuQh2yiw8VLN1jsDWDUrvqTm0E+e5Pn2IOnK4uvk+L5hXhmISgkbBB/ULdTGNyuo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Kz+Be2s51oPKCq/0kdaRmltHQTwggfUsOw8qesOuNkRL/rUD
	U08ErPehnlqwVnK/O9vXPVxoMR3uJ3+JRL0sqLJDl0TT9HoD/9AMVTExClWLEEFQ01aDNFG0TTz
	DVlB4Rcor6drVn7R4MUfP83VdpMckbvH90OvawuxGpV3j63x5SOc2Lc0Xa/RVilQ=
X-Gm-Gg: ASbGncsrFgMkEc3dUwoESOWPgZCEEWiCn5ku9IrcbJ2YpTxlr+RLcSipXSwg4P2/Z84
	+0Pj3RDD/n6MCdQ4xLzfchh4FedKxV4Ov9uXXIq+5jvjveV4nptXUcYMQRqhKF4L7H81r+tiPIR
	h5Dq5Hf+740ydSrCdGALEhmRi+XZC0mu8elRTNlmXmwRHJKYpDvIE0KiYDM+JQfkc5r9+YvxCfj
	LOAj26jpnxV/EXT6HQcXg7gnAeWOaILV8rmO6PtIrq+A0veuesJ/zBrHDOw9iGwOrI7d3MDqaEM
	kxK6ZPwXERHjuOTGw37sHv8+UjIgSGDOUoIALS6pm0rG3RQpQO0I+vonyRVkdjjh6UeKPHHWK40
	=
X-Received: by 2002:a05:620a:2b93:b0:7c7:a5b7:b288 with SMTP id af79cd13be357-7c7af12e661mr1704241985a.19.1744617986799;
        Mon, 14 Apr 2025 01:06:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAoYHyf5+XK2qQjpZ4XxjJYJBB3jlyzLSFJ8UqK/f647FyCb562GXZofuaa+BHngQwYN52Ow==
X-Received: by 2002:a05:620a:2b93:b0:7c7:a5b7:b288 with SMTP id af79cd13be357-7c7af12e661mr1704236885a.19.1744617986266;
        Mon, 14 Apr 2025 01:06:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238d5dsm1023356e87.93.2025.04.14.01.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:06:25 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:06:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
Subject: Re: [PATCH v2 2/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
Message-ID: <hcficagxw4p6h5nr4non25vuwdyor4nvbff3vxz7z6rgztltxl@vcoi7dacv5wc>
References: <20250414-perst-v2-0-89247746d755@oss.qualcomm.com>
 <20250414-perst-v2-2-89247746d755@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-perst-v2-2-89247746d755@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DVKnNCfDbK21SbDKifjndSI2wyOkths3
X-Proofpoint-GUID: DVKnNCfDbK21SbDKifjndSI2wyOkths3
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fcc204 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dLDDg6SP7YSfz8vGITsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140057

On Mon, Apr 14, 2025 at 11:09:13AM +0530, Krishna Chaitanya Chundru wrote:
> Move phy, perst, to root port from the controller node.
> 
> Rename perst-gpios to reset-gpios to align with the expected naming
> convention of pci-bus-common.yaml.

Note that the cover letter doesn't land in the git history. Anybody
browsing file history would have hard time understanding the reason for
the change.

> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   | 5 ++++-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 5 ++++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi           | 6 ++----

I can only hope that after the series is landed, there will be a
followup from you, convering all other platforms.

>  4 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..3dd58986ad5da0f898537a51715bb5d0fecbe100 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -709,8 +709,11 @@ &mdss_edp_phy {
>  	status = "okay";
>  };
>  
> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcie1 {
> -	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>  
>  	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 2ba4ea60cb14736c9cfbf9f4a9048f20a4c921f2..ff11d85d015bdab6a90bd8a0eb9113a339866953 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -472,10 +472,13 @@ &pcie1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie1_clkreq_n>, <&ssd_rst_l>, <&pe_wake_odl>;
>  
> -	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>  	vddpe-3v3-supply = <&pp3300_ssd>;
>  };
>  
> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pm8350c_pwm {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 7370aa0dbf0e3f9e7a3e38c3f00686e1d3dcbc9f..3209bb15dfec36299cabae07d34f3dc82db6de77 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -414,9 +414,12 @@ &lpass_va_macro {
>  	vdd-micb-supply = <&vreg_bob>;
>  };
>  
> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcie1 {
>  	status = "okay";
> -	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>  
>  	vddpe-3v3-supply = <&nvme_3v3_regulator>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..376fabf3b4eac34d75bb79ef902c9d83490c45f7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2271,9 +2271,6 @@ pcie1: pcie@1c08000 {
>  
>  			power-domains = <&gcc GCC_PCIE_1_GDSC>;
>  
> -			phys = <&pcie1_phy>;
> -			phy-names = "pciephy";
> -
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pcie1_clkreq_n>;
>  
> @@ -2284,7 +2281,7 @@ pcie1: pcie@1c08000 {
>  
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -2292,6 +2289,7 @@ pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +				phys = <&pcie1_phy>;
>  			};
>  		};
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
