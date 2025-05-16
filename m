Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A485C2222D1
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389826; cv=none; b=e5EM19wC6KeBDuQSaJayzFk5AYgtX0R8N20uQoQQH805yr7ty3uUKvIqAZ6jYsWeBC+Cz7asH+Qs2ySMzBj2x3Ip16ozOW8cD9W1tdNRjY2VQYVAcVirH6PXExPj0RHUaP+9ZjbZsfBns3b+JN/O5JSQm4kJukeMIwgALwE/iI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389826; c=relaxed/simple;
	bh=lrexQhvrSA4eIFS/2VzVR5zjJAl/8AXo6hFi8KANLc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXyrBGTVt/fmJtSCUq4oKEeXGh46bc5EnCUzz3goJwXYoHmlbIoTAZnCEUtXqFOSRFUb58Mizvor2C1lse1U2GTyoqSN0WVAKn1UW3+3iZE/gDBQgaQyrKuVftc9izxHJ7n9eJPgreIS0xYCSZXCiK7RAZv89wH+swHZRKEJSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKX+u9di; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKX+u9di"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3xUg5007835
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TaqrocneNA5gHeHz1uqPfsZCpYggCy4KBggZedF+E8=; b=bKX+u9diBlt/bTm0
	DMiuM4/aS4bEWDLoReBGhfix4+3ifA6T8qqudzXS4PMbeHDfYbQFYmJOVae0BgNO
	gYCKFTDZ2hpGC1ugwc9Cyxq79AM9I8uZspGuGzxvPbK4qVfu/695sM5axwCl1l/7
	v26Yxvl/tfKa7BV5sShvkGjigIxN/bgudB4uOq7RWpYBE1bGNorBOWaJ3/U7Gvd8
	DYd4s7dEakZdY326ciZuZ+uxz+l8TiVyqu6c0ksAJhbmgcyuJ3SPy/6oP45vpuVv
	+lZCFHpXJIAcPXyuXjdvXOPaS9tFihQdKBcHvQ/mMvW29BX/RA1nw2ERGXtiMiXq
	9fC6sw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcq1gx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:03:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5466ca3e9so44416585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389822; x=1747994622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TaqrocneNA5gHeHz1uqPfsZCpYggCy4KBggZedF+E8=;
        b=fD42tF27vsL6v8dj1A5083/Dz+LDPfb4aA2BHsKBiLfcaJrL7HZBgsFVvrXAkvQxeS
         eWhiOxlpC7XTYEPWvohgIFL/ttDYi3yPNffXJSzFUmCuEM3wi1sa7dsJB91iqDpiEbPA
         kH5nLjCWxO3XWFQkeTQ1tYBYoGSR2dgzMqyHted0p9x/LufcYGDX+f8OneYVcic4AMpU
         0UlfOi+HlRrNVF59n6FuBNUjVU43zKuF0W6A9qdlnOm0J5XWvwn174TVllGIVAAEKPdA
         pMgu1YQCl9Bce/B33kRAPR5SxVaLWwbXZ8tPf/hpBL3D7Rv5OEaSycuZsUjD84Mdzc7O
         yOlw==
X-Forwarded-Encrypted: i=1; AJvYcCUIj5a+jYz1bxTZd0OGLaIE59L31YRYoYJj8Hu+bXKF0vjDdfCU/Amfvem+NlS0DEve0urwA2frhRyA1Jo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy90P+1qv/L+komCIPSfvrqx/TeGE0Wuy5XVW7SNRvujtZT7Qy
	c7Al9hXkeZgp6MRlSTsNok6KKIEx/CWVSyRT+1HFWDAgK8fnc90bylq0kTzcHiZ7JK576BjZiQg
	HCK/a64DKj01y4T45AOiNflC2YNhXGCiXEHvDk4483gXjnztMABYtceGuM2+b7kagtns=
X-Gm-Gg: ASbGncsQQO2zprf28CdPC8Gk0V1tXPfBEXV5Lh3jTvle3rrV4WGQwB6i1QHNHh6+TPr
	+UeATSv/hmlQ98jF8TrWLeC4XmOzjbZ5g0TbVgyRw7eCJJcFkWUO9klLnHJQC1T4trUKHT1NA+s
	Mc61GbjQ0VbEIEvqYzrI1J290j/H8Nf+d6Mvthyp3SuZSvNXrimOlh8HvyEKrfTqGFcRVN0QiRh
	YpD2cBEavfdCYlWQ+HhRjXrA0z6ztDHz4+ntDmFHlyFLMU2IMFMRZ6EpMaBSFJwJ2TZNFfLjomA
	mRSlvgkbYnm8Ovq/hOFv8GJqGYK8CeueunTShnTwmSYfkdqAA8DyKyDHSmaPetdyYA==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr18880746d6.1.1747389822297;
        Fri, 16 May 2025 03:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu4NBQ3Up5uG6/MJvur9vd8EnZx0WKlMAcJY8MkzmIHbw9TDd6bcUnooWcu1VHN8Nyj5f92w==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr18880586d6.1.1747389821846;
        Fri, 16 May 2025 03:03:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac35e33sm1148539a12.60.2025.05.16.03.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 03:03:41 -0700 (PDT)
Message-ID: <b9cc6e1f-9a20-4091-9071-4d6673a44fac@oss.qualcomm.com>
Date: Fri, 16 May 2025 12:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 device
 tree
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
 <20250516-tb16-dt-v2-4-7c4996d58ed6@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-tb16-dt-v2-4-7c4996d58ed6@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SpaVlDFsQCFnzsYpx-fTHEXPBwRKD3FY
X-Proofpoint-ORIG-GUID: SpaVlDFsQCFnzsYpx-fTHEXPBwRKD3FY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5NSBTYWx0ZWRfX5WzpCHi0Izpo
 jqSNOCwcLcGGQhw6IzLdKeQ1Z1L65gAvAgbkP8lOIWsBOWpZ/vkXgefBB1gKqMVTcksEWqP66bc
 DTrWZJoOz5C6QV7JwlzKY4p+1SopAi3/Uasr32AC7DDfoa9xC20UxCb08OxZm9cBGRQElA1Q879
 qo6DDxi+aHseiSEjfXaDDJIlB3/edQJb5HcSCM6JLT1IhbmfDIbLi3wHgL3QJuS1sBln6CDMwsY
 c1+bP8dQKvLRkuSnj4Rxfr1eJagWAGfDe8pCCR14yIhIqopce0sAnco88XbDqVQlyQ8XzJhYE3P
 mTOooV0QcntnB0BMQg4cXk5YNiO+x3w1sRtowXQkDPzv19QWMpe9imeygCD4k9g9Bkdf9Xjp/oG
 kU7uWD0KZ+Sx0tGlrBEneX1NC1I7JN01Dg/QK3EZpCTk6pAF7f111k7edtowHwCG9XLDJ8dV
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68270d7f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=umWwXBIl-rVG75nBen4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160095

On 5/16/25 8:43 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Lenovo Thinkbook 16 G7 QOY

[...]

> - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> but not the faster ones.

Please list which kinds work and which don't, maybe we can work it out

> (X1-45, apparently A730).

No.

> The SoC has 2 instead of 3 thermal sensor banks. I have disabled all sensors on
> the 3rd bank to get rid of dmesg errors. Many of these sensor nodes have a place
> on the remaining 2 banks, but I don't know which. So the thermal management is
> clearly incomplete, but the firmware monitoring the chip does a power off before
> overheating (not experienced yet). For the Thinkbook, it has a pretty decent fan
> that can develop some air flow, so maybe this has prevented the emergency cutoff.
> As a result of these unknowns, I had to modify x1e80100.dtsi and x1p42100.dtsi to
> delete the non-existend nodes.

Please remove these changes, the sensors are reassigned on the SoC, I'll send a
patch to fix that.

[...]

> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +							<&tlmm 123 GPIO_ACTIVE_HIGH>;

broken indentation, please make sure you tab width is 8

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-LENOVO-ThinkBook-16";

I believe this one only comes in the P flavor

> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS3",
> +				"VA DMIC1", "MIC BIAS3",
> +				"VA DMIC2", "MIC BIAS1",
> +				"VA DMIC3", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS3",
> +				"VA DMIC1", "VA MIC BIAS3",
> +				"VA DMIC2", "VA MIC BIAS1",
> +				"VA DMIC3", "VA MIC BIAS1",
> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +			};
'co'dec < 'cp'u

[...]

> +	vreg_cam_5p0: regulator-cam-5p0 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_CAM_5P0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&tlmm 44 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +		regulator-always-on;

always-on for camera.. spooky..

[...]

> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/LENOVO/21NH/qcdxkmsuc8380.mbn";

This file won't work

[...]

> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +
> +	pinctrl-0 = <&qup_i2c2_data_clk>, <&tpad_default>, <&kybd_default>;

Please assign the pins to their specific users

[...]

> +&sdhc_2 {
> +	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
> +	pinctrl-names = "default", "sleep";
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l6b_1p8>;
> +//	bus-width = <4>;
> +//	no-sdio;
> +//	no-mmc;

bus width is set in the SoC dt, please either uncomment or drop the
other ones

Konrad
