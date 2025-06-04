Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED95F28A709
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025229; cv=none; b=Jp7b9WFwhp6F/gy95mjuE6nyKhs5gmnr7CXYsMmgAK9TBPFNwdELajIGv5bIea/9Vi2rrZNPFB58FGrD9jZ7BW3uU8U/6Go6KWLplx8A5GVbuYgL1dMpz+C3pKImTHCc2iWSQIRaIs4SjcsJZaHDZ9QUWFbdSsGaUNnuoZuoBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025229; c=relaxed/simple;
	bh=JGb+bcQ7NdVKw0dLe5OBFj+zTR3c/g4nArMOnaZSxa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiArrJYVTXH0siGrXZAoJanKzIYUZAYuModFNrYAA5LMVYcAI26Jl6Yl/kiePyMqvcfMlsX5Fq7lflkZVTy6a2AI4WrDAb1/sDqm4fd7NzDbGoX82Hcdd8+th3K8/7Enh7yrBRRXelf5y8bjNPpZEjFQIVE1vKaVjIxnk0iV3fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pU0ZQv6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pU0ZQv6F"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547C400010372
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 08:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaRFKW90tCNGsHKMAQuGxaLk
	aZHa3/TSvu4/2YBRcCs=; b=pU0ZQv6FnO0i8aTtrrczIVeKRWlpCSRMfvG0Rcjy
	YboZDqCzyVe6UHk4mdT0OZJnREGDviF3MMx9BfKy2ef7p/hKj6hQ1Hi92z4aMs99
	icvMXuQ2Pis0SoODIQftgotDe7h0lJnTu9Cl4yuHQBGIjbPz7oQhLVICewCmCw1Q
	OF7IhwJf2O5zlruvxcwZWSlHTaClY2k74BkEY30MTslXPCj680oNRdTvRpF7JUMz
	795wNusnbdyCRVLGkymOK6IRhXZMJ6mr0cScMO72IIRFBcC4Ue4y8TIOKQoO2Kv+
	0VUAazL68NWJUHR+J2ksYmWv1DLQLvxZ+0ysMThAp5iiGA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ynb5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:20:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad1f7f175so11492476d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025226; x=1749630026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaRFKW90tCNGsHKMAQuGxaLkaZHa3/TSvu4/2YBRcCs=;
        b=xTHsejNlIlpn3MJ2FAh7qeC5oapE5aOBC/VTiG3g8QRMKnniAa+bDgqVl/QM1Id0R2
         PPQi0veCkesUIPSz2Y4icXw0ZHaK6X0/dk1DQ3PuEBcOjHoJtb+K83oNnIkWxnoxY724
         rEukybpnBGL4w2dhQ20Fp3t/xIbaMsajHvTwqRUtrmFoiQz2i8r0EEnZN3bYY+0TgYNq
         wKepdo7s5oU1xtrVdcWTEVsb7RdRSWIodesprch4XH0KtK+/m6ke7jRyRStIJ1cuqdjZ
         3vFakbELLMUh+8E0S+oi/TThvFz99kJwjq+UHwZRnsVRw/dFVY5hNXFk0rL/oPq7wP+0
         N1/g==
X-Forwarded-Encrypted: i=1; AJvYcCVHKPjP156uLZhf1RMXBPOyIacsMx1PgYXz6wtu3xu+1FDe+l+pFniucBULEO4ia5uRMsX32SFA9wSe8nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR31qviTaXBUCUSG3qo15reXNpE+XzWVrtcPiZdbH1GTIEcRjf
	7cMbW7gyJMNXQJCEYjrQ5a8chdP/0jUAyXNCPifh8QBV6eYttWsItIGiKVRItxLJ+0uo5CYIe81
	IP89LW4C70K7X2R0Cbh2MYqYo/3KkQLw8qQDCZQczw6VtvRbxpc3++6eoIMsgl/q8BWc=
X-Gm-Gg: ASbGncv95svxeAlUwh7UbK2rHaeWgFkC6BqDfJ10XTC3/g+b2zD/Qht/SWq8zbyaXs0
	gC6qNNDtBuntM56f/ReO3adWJtHcMymRRHpDmkpZ2y+YG3nUhkGFWIxlor4QyJbvytI2WbB+0RY
	fbtWjhuri5rKZxuL64xCSnnXrZlMPNYbG6DKE+zF2GeX21dqSC0ul9Z23OFFCC/R2kaJMMHxfr1
	ROzg4kljOcg7gsS7w/7VNaYMFxCDgAVx82rk94Q/nlQef0QhNu3ub/3vcA861motiroX2PqqBSJ
	NdkHNhmkZW9xIauGpANJ5EgxCXHlRZMcv+fU3QMCaF5UdFMftho1WJnzVlfkanRUc8EX52sAw+A
	=
X-Received: by 2002:ad4:5e8d:0:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6faf6a5edaemr36769296d6.1.1749025225859;
        Wed, 04 Jun 2025 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERKsmanwW4+EAKRRkksLhDnRdNukd08U7k5f/+bCH8VteShFBDGHrCAbfCdnarM2/Uk9qSpQ==
X-Received: by 2002:ad4:5e8d:0:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6faf6a5edaemr36769026d6.1.1749025225527;
        Wed, 04 Jun 2025 01:20:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bc4f55sm21266081fa.76.2025.06.04.01.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:20:24 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:20:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v4 5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
Message-ID: <wqirhpizetdi3o46grz4jrz2hyoosf3ih3qlxa6i3hqmimanjs@4oqczqllyek4>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-6-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527111227.2318021-6-quic_pkumpatl@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2NCBTYWx0ZWRfX1/3Wux6fxR4b
 xSAPwTapOHnjSJrZ1eSKMu8FKqttdjLQ1cQTbeF1covzBFL5HdHkxYS9vmLaVvK6mBvdVgXRwUw
 gZjewTOAoQvzH5oGg4oQBbhGJVglmWSJOKCOFH4S8RaF/iB50NtMvpF79MpNDjDTMtyVOrP5HtP
 qsWJM0THjiCM5UCv8OVUuQAd3scvHVRk3LEpxJHffk89Wyr5/IK+Xq9sucI+5VSwgFL7gyzXy2S
 ME6qrVFmX+qGaZemMj6AGi13iDYscFSV2aV5amQyChyooThTMILLbcQgpvHBDXrmBHb7sMcI4+C
 Wp38QrQTVsHuj5Qaq0h3p8BjKnimU9ghCCK4aSKysGauX0jWyq94C3gFa4wK0NS80MLm5UwairK
 H2dy3Kr6AizBQpxzES1trBRTkTrwGEcTYYKcE0O73LPoNPDX05U2IW06UbUtwUg6qzvQoW0i
X-Proofpoint-ORIG-GUID: wEQFElHwnaJfRe_mpkzjbVWLIlQhJP5y
X-Proofpoint-GUID: wEQFElHwnaJfRe_mpkzjbVWLIlQhJP5y
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=684001ca cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=B248RJrvpR2VuhuRRl4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040064

On Tue, May 27, 2025 at 04:42:24PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 18 ++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 4111091f77b2..542a39ca72bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -11,6 +11,24 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
> +&lpass_dmic01_clk {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&lpass_dmic01_data {
> +	bias-pull-down;
> +};
> +
> +&lpass_dmic23_clk {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&lpass_dmic23_data {
> +	bias-pull-down;
> +};
> +
>  &lpass_rx_macro {
>  	/delete-property/ power-domains;
>  	/delete-property/ power-domain-names;
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 5fbcd48f2e2d..21cb392c36fa 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -19,6 +19,7 @@
>  #include "pm7325.dtsi"
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
> +#include "qcs6490-audioreach.dtsi"
>  
>  /delete-node/ &ipa_fw_mem;
>  /delete-node/ &rmtfs_mem;
> @@ -765,6 +766,14 @@ redriver_usb_con_sbu: endpoint {
>  	};
>  };
>  
> +&lpass_va_macro {

[   10.942165] va_macro 3370000.codec: qcom,dmic-sample-rate dt entry missing


> +	status = "okay";
> +};
> +
> +&lpass_wsa_macro {
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> @@ -1039,6 +1048,32 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&swr2 {
> +	status = "okay";
> +
> +	left_spkr: speaker@0,1 {
> +		compatible = "sdw10217020200";
> +		reg = <0 1>;
> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrLeft";
> +		#thermal-sensor-cells = <0>;
> +		vdd-supply = <&vreg_l18b_1p8>;
> +		qcom,port-mapping = <1 2 3 7>;
> +	};
> +
> +	right_spkr: speaker@0,2 {
> +		compatible = "sdw10217020200";
> +		reg = <0 2>;
> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrRight";
> +		#thermal-sensor-cells = <0>;
> +		vdd-supply = <&vreg_l18b_1p8>;
> +		qcom,port-mapping = <4 5 6 8>;
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
