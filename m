Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843A186E2D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970380; cv=none; b=KxGg2Tf5MkeRELsOtogVo0MoeD1LwzpawmLbqDaAelnW59/mPn6TsFGvveKweSPQemhXJIXKeZu4KxNWFvYGG2FJ4MrP6nXSaRS6qiMXgrxBMyuZUDTUdda0oEb3FAxCZ2Hrx8MTaGusDEsulxmAmRH3qOfGG5IhFS0b0i4HlhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970380; c=relaxed/simple;
	bh=fn3XIv374GafpmFsN99R+3aPdYkl1Tqj8epH+8kLyrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8hrumdukANBOm7pe0Ya1SGNowKe6orsii2OYSWVUZGCcB8/OvMXi69jjL4wkwtJDs9t8xQPRXUxDf35YBM4hwFJgbeZXHmBqlBTZQa9nKlx0SE8yaQfJC1nY1ND6U5l9FjJKpUFKxedQul1N5H4wKzm10Xp5BNHRNRBxNpcoZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2c5c0C+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2c5c0C+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536IrGox030687
	for <linux-kernel@vger.kernel.org>; Sun, 6 Apr 2025 20:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CF/FhaEsCR/+W8yHZpCK1Z4y
	/u8MKd7X9wwGafUA/ZE=; b=e2c5c0C+A1QJkl1S8mBqKwwsXeYpNYXuiqKDhhRp
	YucyENyy7sfSIHbVDqqSSOqMQ3NOs2VZ2QKzrLQchP6LSuSd2aHFSSZqMBaF2wpH
	Ugk3adWn+40XqIoQ5nRb9MDAyk2z/r5T8dOOdGlELdZpJftxVqyj0Dr1+t7YlvTh
	xnM0n25HBfHsxElkhYaDHqcPv1vMupQtsiT47m2pnSuAHdIJ0C06lqrlr1zKzyrn
	3IeIi7ZwkY3mdMZSFgP1x4YPfOn6pHX5bdOQk1+PpLrRQ+JgFuRhA+hYwnCTSyWF
	hyfeJbKFS6KOZ3I0PubyMy/nTqcKq7q8pWDTBKynleZOvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbua9qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 20:12:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c3c8f8ab79so591666385a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970376; x=1744575176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF/FhaEsCR/+W8yHZpCK1Z4y/u8MKd7X9wwGafUA/ZE=;
        b=u6aygEH/D6zoyg4yRybdYak9CXES3E766ivG6GEpO+vzoceFhUilG8uhblaL9+Aom0
         2mMWk3FkwC4GrR+us4pQfF8m+vZdiTAZDX985N7cUqdrY8Y3xoFl2QTTIf+bJSE6GxuT
         tVAjMfU40TVC7jhm7vC8ieAiOdKEszxvZupNOE40Efvsqu6NckL4z41Q8/NImo4h4JPA
         zTLAw6S8hLZjS0afjPGxHh4wINadrCHOOnbGiwV3dNFEt35XJUx08Svme+xUjM7/kk2X
         tubIBkGuEZPoJwDPWUpRzrYkM3fYRtskFHIqkHOe3f0QPrHwOvmUgPWsNv0Hyq2yslSh
         EkQw==
X-Forwarded-Encrypted: i=1; AJvYcCXDb3OBjdUmUW7vbK3nScYjQfNx0ZROsLB9k3BAZGAOHpnzyPVb/Q2Hk9QWqu6LFBTV+ZHGyOynsFrdphs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxfs+OqLxcFI2O6ZELWT73LBJhcS9Hl6iuVJooivhKqnk0UpgO
	scXS2cgbQWMaZTmwllOScvwwC3RbKCriYFlX784PgGVDhgu1ReCH5YnleUZiLVWOfPRe22ngOIQ
	bF7v64EbIFpFORYG57PotSNkTp/pPxsjLF3FygFRQiYs9g5/zikaj1OoTAEWhKes=
X-Gm-Gg: ASbGnctTiJKvtQhE6KIMxfGmbyuYI+rk9NffHgooQPFsAuL6vRfrq3Wakxcu/WuVhLi
	5oRoaRZ9hi96GP6b3Kxk1VACnne3KXZn4aMwww6BRwDYtAVEM2BNZm1xy0KXUTOtECRdAt5eamY
	zp0HffRrWPdWs3FT5Kg5Ir4DKEmSPI3Mjcr97HksilK36knMeQa5U9t07q3bFd7hQhRMuru9YuE
	xBdRXP8arLzy2wDBPU9GL02YMVyfA9KVlhn/11UPrkUx7q8Cg9AVlbnyQ0c+2PIQZPrt+SIgog4
	anADpD4Lcq56A13oLctYzf4tEwWAem8MPVzGL8QGFwGQmbxlRwLetJItccOGt2hhRHcmRuBW/Ut
	rrVQ=
X-Received: by 2002:a05:620a:c4d:b0:7c5:4c6d:7f95 with SMTP id af79cd13be357-7c77dddd504mr1034348785a.48.1743970375848;
        Sun, 06 Apr 2025 13:12:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8HcuVy420ofuMxKjaap5079mCf5g49f9eFhqlYXviEaGsK9bqA0z16b86EzmKh4ysjdA81w==
X-Received: by 2002:a05:620a:c4d:b0:7c5:4c6d:7f95 with SMTP id af79cd13be357-7c77dddd504mr1034343085a.48.1743970375372;
        Sun, 06 Apr 2025 13:12:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03124530sm13925971fa.9.2025.04.06.13.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:12:54 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:12:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-8-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: x2CIBkl6v_uOTdf4TxS77GFrrCwrs5rI
X-Proofpoint-ORIG-GUID: x2CIBkl6v_uOTdf4TxS77GFrrCwrs5rI
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f2e049 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=DHtXK5enkGFnJ6Jc3mUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=914 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504060147

On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>  1 file changed, 207 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..8e784ccf4138 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,13 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>  	vreg_conn_1p8: vreg_conn_1p8 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg_conn_1p8";
> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	dp-dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi0_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge0_out>;
> +			};
> +		};
> +	};
> +
> +	dp-dsi1-connector {
> +		compatible = "dp-connector";
> +		label = "DSI1";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi1_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge1_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -517,9 +548,135 @@ &i2c11 {
>  
>  &i2c18 {
>  	clock-frequency = <400000>;
> -	pinctrl-0 = <&qup_i2c18_default>;
> +	pinctrl-0 = <&qup_i2c18_default>,
> +		    <&io_expander_intr_active>,
> +		    <&io_expander_reset_active>;

These pinctrl entries should go to the IO expander itself.

>  	pinctrl-names = "default";
> +
>  	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		gpio2-hog {

This needs a huuge explanation in the commit message. Otherwise I'd say
these pins should likely be used by the corresponding anx bridges.

> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "dsi0_int_pin";
> +		};
> +
> +		gpio3-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_LOW>;
> +			output-high;
> +			line-name = "dsi0_cbl_det_pin";
> +		};
> +
> +		gpio10-hog {
> +			gpio-hog;
> +			gpios = <10 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "dsi1_int_pin";
> +		};
> +
> +		gpio11-hog {
> +			gpio-hog;
> +			gpios = <11 GPIO_ACTIVE_LOW>;
> +			output-high;
> +			line-name = "dsi1_cbl_det_pin";
> +		};
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9543";
> +		#address-cells = <1>;
> +
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			bridge@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> +				vdd10-supply = <&vph_pwr>;
> +				vdd18-supply = <&vph_pwr>;
> +				vdd33-supply = <&vph_pwr>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dsi2dp_bridge0_in: endpoint {
> +							remote-endpoint = <&mdss0_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dsi2dp_bridge0_out: endpoint {
> +							remote-endpoint = <&dp_dsi0_connector_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			bridge@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupts-extended = <&io_expander 10 IRQ_TYPE_EDGE_FALLING>;
> +				enable-gpios = <&io_expander 9 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;
> +				vdd10-supply = <&vph_pwr>;
> +				vdd18-supply = <&vph_pwr>;
> +				vdd33-supply = <&vph_pwr>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dsi2dp_bridge1_in: endpoint {
> +							remote-endpoint = <&mdss0_dsi1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dsi2dp_bridge1_out: endpoint {
> +							remote-endpoint = <&dp_dsi1_connector_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  };
>  
>  &mdss0 {
> @@ -566,6 +723,40 @@ &mdss0_dp1_phy {
>  	status = "okay";
>  };
>  
> +&mdss0_dsi0 {
> +	vdda-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&dsi2dp_bridge0_in>;
> +};
> +
> +&mdss0_dsi0_phy {
> +	vdds-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi1 {
> +	vdda-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi1_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&dsi2dp_bridge1_in>;
> +};
> +
> +&mdss0_dsi1_phy {
> +	vdds-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> +
>  &pmm8654au_0_gpios {
>  	gpio-line-names = "DS_EN",
>  			  "POFF_COMPLETE",
> @@ -714,6 +905,21 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  		};
>  	};
>  
> +	io_expander_intr_active: io-expander-intr-active-state {
> +		pins = "gpio98";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	io_expander_reset_active: io-expander-reset-active-state {
> +		pins = "gpio97";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
>  	qup_uart10_default: qup-uart10-state {
>  		pins = "gpio46", "gpio47";
>  		function = "qup1_se3";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
