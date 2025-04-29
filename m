Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B91221DBC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923922; cv=none; b=eGB3h+8x06BUqVjseZaxUFir9Pm89fIWpBeLUA5CvJYWSYnVa7g9xqv06blMTXfavGm6OOLImNOXShErFp0neJ0OnT4ra/oqEoFPsSfJBxoEL92ZbWGwXHXkLgeYrcpSPZMZsP8yKCNPx02d/eQN0YR+3+RRd/H8h7m9zSGCPrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923922; c=relaxed/simple;
	bh=1WCmgyxNki9ViUDLOicGwtgd49yw1FxS9L57KJq4vGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olPWcj24VcYD8fTsTOd7cBNxTgwMAvl1ELODDxcd7wfL1a1caKF/7nhEtRNhOjU8Sv1B6Rxi1P0oJIFRhbvJhs03fQahXreJ5IZyXmR6t/E5uheAxqFbB7UoPv9vNqUn4KKeXOhd5LRU4gSMT1nF+gdedK7GlPJP79S1+f9sRQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ew3LVzrR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ew3LVzrR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA7XSV011884
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTRzGhSg5MlZSKJHgUS2LB4fHsRaKP9Q0pvSFNNeMoE=; b=Ew3LVzrR2lth11ab
	BODcPHM3KlJ29eNgNCZ2Z1jdqbzu61MvUGfXOPxSVUbDMRy/n2R9yS/CvptOdZ/y
	B68lk8emIMZ8SQ9KgpYWf7GJF9v+VwodMRao2/PeekQC2iquA+cb/PrDNqdyxSmf
	jLl1JTb1skRReWPawc7qbA7pbAFKq8YFtveIpXZB7/k9YuTUsLeL5EPvnW6OTgU6
	BbMYG/HswLSFDk7C3II0iAKlzpEW1ydFeXj8phNWBcXi3KCGZp+P0lFeUXqyKGOG
	UcSvKge+gEojM8vXChDRaAzTgR/yjyQh+DBmm3mFOBZHHGoZyXfqvE7QKQifxa7g
	EUGYJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q3246bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:51:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f3766737so15073006d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923918; x=1746528718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTRzGhSg5MlZSKJHgUS2LB4fHsRaKP9Q0pvSFNNeMoE=;
        b=iPfYCrizThmME2eaGP4xOcj609afifoxINc5OqUMla7xV33ncpIaxupx4IdQPH8FNR
         OaztxrOx0p+w3DVUXsQADxjsu+gvlzBrCxAy/1KLNsSCKigbWNKf/tVoxpDxUX8dQSLx
         k9ipu5CBOtDnA+ho3cdnild/e2tNFXH/c14bxqZeWJxHXPk3X3GIpMee0PCW6Zid3cBa
         ZdX4SDFkRrTAikNe3xTrKyZatpc4OgqGDxrVMaZsJplEFajdzDSrH7bHx2kXzPJhLYmW
         mwhHa4vQTCFHhBLidEmLkClAV2mIhV8Le97h5i8hWYgbhk5FkWq/afx3qpTwwFgasUBF
         RKOg==
X-Forwarded-Encrypted: i=1; AJvYcCXZFoLD83j2ljdUYxryoIMwY6P8xPUiZjQnKkHwjeQcvK+JOo9RAKssoCjNvIiJq2PXOw/zVEeJzz1tUTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzH+Qt9m8eLBKM3gNcdg511XnQFUl7/mJ5CyfhIbusYdDcJ9Ts
	+5FSIWqZM4v9rmir/XObZ3feU2PtB4h8y/e7PaERPdauBvQMvj82rAf01SNZ8uvhoIJDahSyFDK
	qQxtWGW7z/csjDzBFls9VEIVO5r3pi02hefYQOjegsIxU8dir6JxtmPPStZY8ygU=
X-Gm-Gg: ASbGnctrEAsM5OTRzTS1zx/d7F2nJkEbT99EtaLrEY/ZRGm1Itm9dZnB0uqesFzskKc
	kBTEqk0sxAOnpOZeYCjFP1STSsqZ3qdcK2DodrA5zIosM5SNC17pVAUfhxYIWFtxm+cc2RgqRZS
	Q4V4fmhBXgCJwkVnE2A/yafY6amrWwHLGAdPmoHrHHuPo6X7xxUfJ1sMJRgueWqJhDKd7ovfL8Q
	Nz1/UTNVvM/+bI3XvJCMTR4tO1qM3sX37ImPn+5u2th+EP2QkVLjL2s3qULX9oJQtaKTO+2/YS0
	HjCA1EmhVr/H0Upqt6CbLJgZq8IxTWgxl5wzqIDMTD9eWUiDOaUo4o/NomkYYDHDjw==
X-Received: by 2002:ac8:5a12:0:b0:476:66fb:4df4 with SMTP id d75a77b69052e-4885fadd2c8mr15067291cf.0.1745923918436;
        Tue, 29 Apr 2025 03:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3JzNjbV3+PlqpydBQfX+3fP7408wC6Qg6TNd/6IYV9tyTw3iWCLqCkgU0oaTDWVeOMiCk5Q==
X-Received: by 2002:ac8:5a12:0:b0:476:66fb:4df4 with SMTP id d75a77b69052e-4885fadd2c8mr15067161cf.0.1745923918113;
        Tue, 29 Apr 2025 03:51:58 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec4fbc9c2sm126949366b.171.2025.04.29.03.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:51:57 -0700 (PDT)
Message-ID: <7bd9fd43-7159-48a2-bf0a-712de9cb2bc0@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:51:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=6810af4f cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=u0yWLgZLcdoHeyFTXL0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ldqtlwceIm77LugWVdANloTufkxIpeT8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MSBTYWx0ZWRfXwSW6h7MY/uYW fL8T9XTeFnHMIzrpA/bp702ByzXWLOAeULewamkMHsDqNHqAYTbDWchnA16wpAvcDl93Za9fHkD aAtiR5wJIWHd3QXTy0+V4rtFHoXXBg+Phfwxfmbt8lSkArcvwztrCKHndlVZdgVh6N3qIJBNvVs
 ZN0SD26z0RXsHXfw/c2YJHwyCZvJaianSD3qTOHPUwLLh6m0SO1Pw1L80im8X9s0Jaaucmwm8Yw EmXombj3Nc9zCdx0XdBI7aW87q0U9E+cwp0LGWRp6jLc6RZpfFz5rUynlPXP6M3HUC1Og72CVyl 2JIEcSiHm6T6I0oPZzFF8e+Lea2HEa/MQnmhIMSHz+fJRXynNx2Q/IvEG4ZOFFhR07TDmd/DtbD
 nkdnph/kvhO3862ItAA1pryReK3F6VRKCh0R2a+xpMo7JLed/M4pg0Q0HP4U2iRDSqHGDdom
X-Proofpoint-ORIG-GUID: ldqtlwceIm77LugWVdANloTufkxIpeT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290081

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add WSA LPASS macro Codec along with SoundWire controller.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 68 ++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3453740c0d14..d4aacb97a18c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2601,6 +2601,64 @@
>  			status = "disabled";
>  		};
>  
> +		lpass_wsa_macro: codec@3240000 {
> +			compatible = "qcom,sc7280-lpass-wsa-macro";
> +			reg = <0x0 0x03240000 0x0 0x1000>;
> +
> +			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
> +				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
> +				 <&lpass_va_macro>;
> +			clock-names = "mclk", "npl", "fsgen";

Please make this a vertical list

> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;

property-n
property-names

across all changes, please

[...]

> +		swr2: soundwire@3250000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x03250000 0x0 0x2000>;
> +
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&lpass_wsa_macro>;
> +			clock-names = "iface";
> +
> +			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
> +			reset-names = "swr_audio_cgcr";
> +
> +			qcom,din-ports = <2>;

The computer tells me it should be 3


Konrad
