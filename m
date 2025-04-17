Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA3A2DFA36
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744886450; cv=none; b=WVd74GLodhrr4xvTeGlpdcVwqGMY016lvoHR3/pb28Z/KAW4msR/Uc4+GXG1y/2DbXwcNrpu5zACBHp8llb9LTD4heEqc79kzXeGwptWEz2iYmRw52Kla4ENUY+yB50CBXnKQwYGKvhsNPlC8JApoFqg+OgFPXl5vHh0pQOAL90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744886450; c=relaxed/simple;
	bh=5IYFlhP43jwcIgMbNywlXkP7SVMmApinxUSPQWuA9cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLqSlKCcYWiZhKWbZJiU7X9/2408EqPFdBrDP3l11/hnDBnVc1XfSTRNpK4MaGNbdJSbLTSdNUx/CntZozPRvJtaoO+SSE4ZD0SYDqa5kCny33XNzKfw2F2C8XkgyKA5yrhVAT8E+6RiPkwBYhXYM2/aeh8FWDzEkBLv8W895Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbak8cI5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbak8cI5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lGwd007060
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BjuAWeJK5hlBcayQ9LKvqOos
	Uc8OqTctTywMTRf5ORQ=; b=nbak8cI5wjIQO6uUIznf424kTrDzTn/9K6GVP0tC
	DQSa3ZpmDdvwWVI64JsD7GtF9lDiVsVOp1ac9cFWIEzd0kOQwLMS5AD7DKqj57hf
	kv2QhUSltme7lzAkD4N+LMcNbChzk3ztBl7prlt6Olub6H1wVTqfGAFmeUDItA61
	NGgpEcImagTbnFygZCFeO/DUafoTRyHR+5mfcnokURzZaYruh2OuLGSOS7Iw6pmP
	7NeGCKDmCIOHO5I6NYIv+vEzIPM3lb7CDzTEmrq59h3AuOQMfqRIc4pu+Eeml6z/
	tqyMkwzXZy8HutaRIPs6kv8JMKOg10oNsboprHUkcgppjA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1eg0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:40:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ec18a29aso6720146d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 03:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744886427; x=1745491227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjuAWeJK5hlBcayQ9LKvqOosUc8OqTctTywMTRf5ORQ=;
        b=VbCvU0fTBVBiW9rQKXOYdFTp/n05n+1SzlIKJfyHOhC9FKKAMl8p4vVSQ2npag4kPM
         gfuwlFIJt+YsPCxb9yDrXM4Pm7EXWs4xKYu+im/I3JjT4l6VcawIC/y2Ef39gBf33osb
         Si5girT29UzxCWL5+g/0ujIyw9rhmGpCn6Mc5l2JtxIdtjkXIKcVso0DeX5b87FyjUdG
         BIQp4ZrlGkthDmMXt4Tv2DEnD7+B3zADaoeQggEoJVLBNQJCPEmqBrf5DEz8+tBRKFhc
         FDAqWt7pIuCIEET0pSBvdgG3fX8pGeSWxk3cmB2pyGBzTwEjKlRfCBEzKa7ziv+c1gkl
         s8TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2JyjV2J8ira8fM4J5vFKV0bWEri9Rf9wM3J3ah//XtGlQ3x6SKff263Lwk502c6IfGVbP1bKt+D7+Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/ros7Ti8NXgwdlGdcQGscyPNBpbC0BsJmtoNgfmTpM23vw9Q
	2Zx6k5pqTgTeLe4zM2ZUUmXfnVq5Kd+gRjIVdhWWP9gCekMvzo7pcygAVOqANOh6QT18C2XPbYn
	6AE6khEDMxKe3wva8Q7LExF0iEISbKCidISK1u0b/eTluE14BNkMqfeIbynrOPhM=
X-Gm-Gg: ASbGnctP6CFte6DXUn0ZU3+Y4rywI4Ydq/7boGUc8qRpY3DA2LmKYAFsXlAv+IoR4cE
	sYqG/vyeonr2U7snPESmbAD8b/jb/ChGs4Bwc0JGkQayqM7nDZPaMP1aQKWrqBXKpHLmGfXIWBl
	pvO51clTJUDswaXxB4EzV99f/q99XCslZkwYZNGqpF55whJggBkO7C+pby/fLEaPTp5BI661znB
	XTeRjvsOaPBkWTAIX7BWa2sEj2teoeia+M9cH4NHrKKEMyYuiAI65E8ZHAKQCGTUaxVkYTu/xxo
	5McqtwCCgYsuTXzfrP6izQJXFwccrI8eO8ac7IO6JeYTtqRcm2akEKf3CzvjGxe+JH1b5BjySeU
	=
X-Received: by 2002:a05:6214:4001:b0:6e8:9e9c:d212 with SMTP id 6a1803df08f44-6f2b2dc00e7mr77993236d6.0.1744886427391;
        Thu, 17 Apr 2025 03:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWp4eovQ0JlsFx/TXAsBf4ivXXpH+ynJJ2l0sinoyay/KdVJnwv8l7W0CfA/7FfRZ5I9Fg8A==
X-Received: by 2002:a05:6214:4001:b0:6e8:9e9c:d212 with SMTP id 6a1803df08f44-6f2b2dc00e7mr77992926d6.0.1744886427069;
        Thu, 17 Apr 2025 03:40:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50253csm1981832e87.129.2025.04.17.03.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:40:26 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:40:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
        robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <qnhfnxvdsgnw5jh4xxaqz3p2x67qcrr7kn3vwdnyz5huchdtzy@aagflznjrvly>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-8-amakhija@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417053909.1051416-8-amakhija@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=6800daaf cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=49572xSsTLiTCUh2GlUA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nWN7NQqHbe_QdHvGOufYKi2tdIRIq6bG
X-Proofpoint-ORIG-GUID: nWN7NQqHbe_QdHvGOufYKi2tdIRIq6bG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=945 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170080

On Thu, Apr 17, 2025 at 11:09:05AM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 180 +++++++++++++++++++++
>  1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..d5b2dabe927d 100644
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
> @@ -519,7 +550,107 @@ &i2c18 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&qup_i2c18_default>;
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

No reset-gpios? Is the expander being used by something else so that we
don't want it to be reset during the bootup?

> +
> +		pinctrl-0 = <&io_expander_intr_active>,
> +			    <&io_expander_reset_active>;
> +		pinctrl-names = "default";
> +	};
> +

The rest LGTM

-- 
With best wishes
Dmitry
