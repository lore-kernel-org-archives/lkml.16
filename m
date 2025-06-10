Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4578428DF0E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553649; cv=none; b=No3x3k9Eagi6hBiB4qdiEyODDmFbsGb8nTOsf9nTyi9E2fuWUlQgin/RVhngiqgYwhspKi+J8mE8Y3HsyndHjjxWek+tAS80n42lmR5DKJOSZjG5ymR1gaWUdqhmql8TSQF4GmchWK1jqPrjg0ZK8ax7QE0GxFTMs/ZCTzb+cK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553649; c=relaxed/simple;
	bh=UPlSsOeQrv5JUW5Lfe0X5nkvCTI9hlUwH96nurL1irc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKxmV32YQxGfD7mBNbDlw1IqLfhYEPtjCm9lYQxc/iYZ4mjpLRH6hl1huyt3VxuluneAYDhNKqduNB74q22T57YiReJLPX0FMYmHH/waCcmcYgPh8Cj5Kz4o7UHHYnWEbFBtFqHJmPb23lBlT75mIP3uCT43cOOoHq9s1F7MCeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozUwuk4p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozUwuk4p"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AAD9xa011076
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=67IOVthVyAUCNLQvy2dAGJFK
	71qcOVj/j2a2DCuKxFc=; b=ozUwuk4pI0e+BxTK6z0TRimpey/N3EVTyiLkO8F/
	ZdhOSPQny7XTvFSQtffbeCuqqhPCZhVcUfTxOOwAlIJsoJztI3ck/uc/lAMXBcxQ
	2CkfXC9Y58MUy9wKtnaeSLhFEE/Iy+gp/WxWMk4uXl/z/rdE8nZqg4WPcFBNz4+K
	+nPw3fv2LnzRgJYv8YObNiOedcMZOCahxWelcy/FEIi32XGtuq8vTck+vFh2Vsvp
	jHHS17fUDzCywifq6rOXnC1Lm5hFSPciCBNMFebGqVvptcWfnEBGJmyYyzEztA3I
	Q2CU4gQ5O0p2w1WTnWWqjnT4bSMQsqRdwlSzlfdU0uaTNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh85bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:07:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0aa9cdecdso491301485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553646; x=1750158446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67IOVthVyAUCNLQvy2dAGJFK71qcOVj/j2a2DCuKxFc=;
        b=qKjGhFacqn2Bq6fXctOi7NhAiKE6zhnfoBUlgE3TPfuGP4MgPtyTOdVl/58KHIotnK
         VyG9m+ydiEp5xIFqHuJtQaVvA4VudlECpqgfis8HvoD8xjt7R5EStygFxslhUD5qB7wg
         v2ik8XBPj7/QFrKDPEFB0LP9ZnFpQfvpYlCCu1/gzt7edeGwOoAzf+9cxntUoJJK96DM
         PE8N2QETznbBULWDgVb92ovDtP3sJAyb2zlXgEs+CG/E673vNNbA+33K/YaGep2CdE1j
         VhbiWH8h7L+hax+Jz3eDO92crvsEGlM+XMuWmknsep3kFGiUEcZqrYVYBKSJ9DEPTuB8
         /GyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtgnvUyB4xymhPWDRPqm32HFGBLHy9p9iWHL6Gyyx7wsuAj37qmolOHrN1bfWU61ryDg1fui9xc/CCyVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMAQSWsEP+16QC1x5H+/ngHlxTPHc05hqxijdxgaG0tD/jc0XV
	WdNrM0+UJxIiBrKLgt2lkUjYbcvLxO4CTAbDhH62E3DUJekGUzzP5h9zF+93yZZ+EylX+4uOHVP
	U7gJC8c/zza+2m8eMaQqX7XsP3paahdtvquSLRANjmc/Ulh71Y5yAsASk2jTQv6U6vGI=
X-Gm-Gg: ASbGncuAOU0taf/6t0tq5f65gV/r/fh66UTDQU8RhVRSg594jfXO/cXoSVbI7Lj6nml
	SFkdUFhYZyJpbqSTqLeOeGpn7ZT/Qg3ZTUbS+Vhh/yYvXzRKalMVi1rXXKYcXCIqdPZ2bHrPeh4
	b3/Gx1wLWXbsVLssH1OJOQULO+dsaisTIcYRRSZrIFUtlZOVMZJJkIy+2a2f9LqQ6UbH9ZWrxsM
	B9EzWCXN3kt/CmAFP21A9RO3NHDccS4rr2cdPRacRi7vIiqg2FUem1zQ8Ziw+nC1zJijFsV8c1V
	bnMsEhEpbWcYPgQLaAf2eX7jtqw3wldGlNU+lzy5fZ82/ZiRX6RlNpuNaq4eNPCyTnj22Xyc9f1
	A+Xlir3G2R/utH/AkE6hPedW3MdwbEOO4HN4=
X-Received: by 2002:a05:620a:17a5:b0:7ca:f09d:1473 with SMTP id af79cd13be357-7d22997212cmr2105916385a.28.1749553646124;
        Tue, 10 Jun 2025 04:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQUgDPSzkOF7xlBQA+g6oVPlHMD5leL1gdy86R0SYpc/kGI1tFwHixo/KGMNQxz18+0VYj+A==
X-Received: by 2002:a05:620a:17a5:b0:7ca:f09d:1473 with SMTP id af79cd13be357-7d22997212cmr2105912785a.28.1749553645647;
        Tue, 10 Jun 2025 04:07:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772aa46sm1503884e87.187.2025.06.10.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:07:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:07:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8450-qrd: add pmic glink node
Message-ID: <20250610110721.tn7kkbcucbfx2o2e@umbar.lan>
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091805.2997546-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610091805.2997546-2-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684811ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5fFL1RxHffGAKPhwOvIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SIx7ptTrkphp_fKK8MVlnJA1eCVmGuPU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfXzwTfTyjNnB/K
 BowojTZeZSyEOlMiLk8NOz691zVKMPyhIZts2YumBbh7DV/xDXPs/qxrO5P9SwT9++GiK6QZIJf
 Pe57NL5ayrsWORE/7iK/kaPVsEmZNp6IQ3Qk9pkE/vL0s2T95kg7oq/OaviQCbnGjAIK6NF7Toy
 hHp27UatW7kCCopPsbTpKR1+9t2DNBaUfYMA1FeFe/N0XLcuwFCo/lCbq90LOjmV7xpGfSx0gg/
 9nqX87h5DfuC9SRLP14gljzUtIOYXXuFZ5JLhC8aH4bm8cRFKeQeVLc9ZXnI0BSdQMdv92lthDx
 PH1MxvqceyMNSzmszYp9lM1t2u5br5lkyHVtm27/u1O5oTJQ4xFMc2AgFObpHzrHE0qlMhOBU3L
 oGTbV6LMstDyjyE+5FbVU1UWViKLcfrtC14yaraD/lpporgW0B5LQRD5/7MngnvZ7ughU+BD
X-Proofpoint-GUID: SIx7ptTrkphp_fKK8MVlnJA1eCVmGuPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=924
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100086

On Tue, Jun 10, 2025 at 02:48:04PM +0530, Krishna Kurapati wrote:
> Add the pmic glink node linked with the DWC3 USB controller
> switched to OTG mode and tagged with usb-role-switch.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 54 ++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> index 8c39fbcaad80..0580408485eb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> @@ -37,6 +37,49 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +					};
> +				};
> +
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -462,7 +505,12 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";

It should be a default, you can drop it.

> +	usb-role-switch;

This should go to sm8450.dtsi

> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
>  };
>  
>  &usb_1_hsphy {
> @@ -487,3 +535,7 @@ &usb_1_qmpphy {
>  	vdda-phy-supply = <&vreg_l6b_1p2>;
>  	vdda-pll-supply = <&vreg_l1b_0p91>;
>  };
> +
> +&usb_1_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
