Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EDB275854
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924500; cv=none; b=mcr2yP09Qz0UPKcvvsLpviZ1BlQHro8+NRGYcU0wWo548N/E0Ix0rym71WMSG8Ps/jQIKTMhBhQT1KbmuvsaudsfDxvyY0KaXj51vTIOmSeCxovGVZGDBe7T98GReX3K86gOFuI8SRjLFG+lgY55A7+WxmjBm6RH8flQxCfP3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924500; c=relaxed/simple;
	bh=tK87mDXHrUzV/mUBmwnSGvuIGijl2gsSjT9cGJhZgIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqTwKqmG36t9GEY5Pn0lGGcD8wvQnHYDfOlPTkk3dJV9vyt5oD+q1O5mJITQTKPGD7T2TG3cxX+OCSjvZQPIUn5VvD3zqgz6iPBuwWKCbap50eBBbFDpI5kMryE2E1HIHhgLJ3l8M51LFvVBg5CZ2v+gwdIMPOYoWvOYj8SfUjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtlRGvEU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtlRGvEU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAhiLn013324
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQLf0DfTJQP1GapTZrUiwg6YdnEoPjhKa1i6J4lKnp4=; b=YtlRGvEUCG+39ZQ9
	nJNvvwP23kTtX1b70cJcLtsXBrQtCfnm6NwqvBwGVYTmanEhfzLu46UuCgkgrom9
	UVqtbH786BoAAtllpyvkihtZe0vapdaiZxiV5PWGjxSQz0BPzpBnICtTtHAr3qNY
	6NoGeJ9CL0IcM5Y2QyFWVI5teQhMRaw6hCKdiqHBUp5s4HUKgLQzsvJf2uRye+3m
	Hsll9QV/Cf+1knFmIqQK1C2G6t2hq7zsQ/QnbaX9gn6uCv4Qe5Ux7pbhuDNZ/vhD
	S2ajLjLR1woawouCm9Jd8yRL1qdO+xFFnhTwTvA7Kv5I0pLt1vb+B8JeH7cteKhI
	4Wb1EQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn35kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:01:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c545ac340aso63380785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924497; x=1746529297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQLf0DfTJQP1GapTZrUiwg6YdnEoPjhKa1i6J4lKnp4=;
        b=YkSi3rGdh8aMA0K9VxbBZN0hpfy0idvjSbUPXSTbYO+iGIywaeWtyARRccU/eXDIRY
         QelDiztWbwKuCZLTG1OosmVVBDZKrgZbTqEF7GaXdHB2rSpNYiCqDNgM+aFEQjlbVWeh
         W6QVH74br1a/3kS958s31O71ZGSD+xeKeYYgxFEZhXq+uSN+Aw4BgwJZL1EpPWBbGjLv
         N582wV2WejIzpueCJLPybVBJbZjkZ03ZYgr78MxsWr9D5nyn2Ll3+5bjYKPkLO/edBQZ
         ij8ZJB41UnPmAEIiJ3IsFvYCQDXTSO7rzpih1B0WnvkBTAy2SqYPP7s+J2XrYkv7/TIt
         m/vw==
X-Forwarded-Encrypted: i=1; AJvYcCW7WKLhCrOR+0bYNK00lF3YNaFH4QPneczsE+A9+2IH+H+xsS+TDuAQ1PKWw8SJo9nEhW1JahJ1BU+UBno=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh4Zj1IiV/s9bucndyjuvdvfLokyrpr+WN1MXCIwo1CoPJPFXn
	ODG8C3jtgz/TmZarYAAl5DoJ19bz91paVBNRKGriN805AO9nxgBkVOwOYA6W0pWN/VQxf+y4mEt
	FRO6y+cnXAJ+lXceUKbe5vp7/PdO2+nfszRuZ0L5Vm+84xPYHr0qEOSHjIv987bo=
X-Gm-Gg: ASbGncsAckz5S3YwC+OQ1Kkhcd2EvYkThcF6UR3Dm2zWgNKsqk6vNzeU0yN6kxH9K2I
	qZ5VY3PWTFSMFCs6Twzz56bJ72EDQNHVcISYME2YHzCGu1RN5D3tx1panizjER+jSiVp1wti/j+
	fvCpPjTOx+PLHU5Jtyt8OX325JOyhbka/yKS686rl/VqeJvif97U/1q7ZksJsJp1EsEnr4xFv7P
	m43fsobUfQyTu6eCWgEaDAvwPif5N52DXX3gI2ItiiXM7KIxfrBoRKM+Tp9CYUkCwowCbiAhNNJ
	cKMUvjlJzW0rKtdfZ0fCGkRP/ZxMwBrjXygLriMcdaywb6rvNNdN41oMYtJdI9ru3w==
X-Received: by 2002:a05:620a:1915:b0:7c5:6fee:246f with SMTP id af79cd13be357-7cabe5ddafcmr140984085a.1.1745924497358;
        Tue, 29 Apr 2025 04:01:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOSVqDj+j76mRD44NfZzmdC5Ayntdd4PUJHV3DE1hReLwHo3dOWMUTDt9itRaCAW81o4srmQ==
X-Received: by 2002:a05:620a:1915:b0:7c5:6fee:246f with SMTP id af79cd13be357-7cabe5ddafcmr140981885a.1.1745924496841;
        Tue, 29 Apr 2025 04:01:36 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec585fc8sm3660827a12.54.2025.04.29.04.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 04:01:36 -0700 (PDT)
Message-ID: <7322bb2c-5778-48cd-8661-91308ea8cfc8@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 13:01:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-7-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-7-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ye4ustOPWBOrSMNPGEHpr0bMOe7aJ4LD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MiBTYWx0ZWRfX8xJ+xNOb1uKD JXLXdGyxsvbsp5ViOpGbylHndfbO1JFe2rcRtUdUMLt0FIVqYwPm4w1xVKCXaJ+2aiDgmAfKQuR I2j808F2o8qzLaVxaBIfBrp7ngdrGZVHave8a+hDs0KxpJVkNSJ6jlws4vlle2Dfu85kW9hj6pX
 fhCDog3/8+GpwplKhnbEo/mjbBc5ZM/m9jY54Qn9oyhbKD2RUO34tR6IkKRK1nI+l5Sz5ADwaG2 Hjl0avOLxaeQZ3Dng75/FSZvaS5tv3lSZODcQuTx4pTv86bVFs9VEyw7IyAxpeozWv5DHM4gQPS VhX/oR4A/R7zwVkAnq57rh+POYVnZi83/gSac3u+VrMOskkcAJmdxTR01Np7TBqCWpVgW+UqrRV
 eRaOCLeN1KuopPTerws3IXpEF6HMM+cAb+xVsd1ltPdN5Y7Zp7gKXUHxeqcie4IzHKZu0gFs
X-Proofpoint-GUID: Ye4ustOPWBOrSMNPGEHpr0bMOe7aJ4LD
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6810b192 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=hnSZPa_brixH1gHJoW4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290082

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers and WCD9370 headset codec
> on qcm6490-idp board.
> 
> Enable lpass macros along with audio support pin controls.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 162 +++++++++++++++++++++++
>  1 file changed, 162 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 7a155ef6492e..1a59080cbfaf 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -18,6 +18,7 @@
>  #include "pm7325.dtsi"
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
> +#include "qcs6490-audioreach.dtsi"
>  
>  /delete-node/ &ipa_fw_mem;
>  /delete-node/ &rmtfs_mem;
> @@ -169,6 +170,30 @@
>  		regulator-min-microvolt = <3700000>;
>  		regulator-max-microvolt = <3700000>;
>  	};
> +
> +	wcd9370: audio-codec-0 {
> +		compatible = "qcom,wcd9370-codec";
> +
> +		pinctrl-0 = <&wcd_reset_n>;
> +		pinctrl-1 = <&wcd_reset_n_sleep>;
> +		pinctrl-names = "default", "sleep";

Does audio work for you? For inexplicable reasons, it didn't for me
on rb2 when the sleep state was defined

> +
> +		reset-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-buck-supply = <&vreg_l17b_1p7>;
> +		vdd-rxtx-supply = <&vreg_l18b_1p8>;
> +		vdd-px-supply = <&vreg_l18b_1p8>;
> +		vdd-mic-bias-supply = <&vreg_bob_3p296>;
> +
> +		qcom,micbias1-microvolt = <1800000>;
> +		qcom,micbias2-microvolt = <1800000>;
> +		qcom,micbias3-microvolt = <1800000>;
> +
> +		qcom,rx-device = <&wcd937x_rx>;
> +		qcom,tx-device = <&wcd937x_tx>;
> +
> +		#sound-dai-cells = <1>;
> +	};
>  };
>  
>  &apps_rsc {
> @@ -536,6 +561,76 @@
>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>  };
>  
> +&lpass_dmic01_clk {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&lpass_dmic01_data {
> +	bias-pull-down;

As a testament to these definitions belonging in the soc dtsi, you
added them in the file you included already.

[...]

>  &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
> @@ -725,6 +868,25 @@
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	sw_ctrl: sw-ctrl-state {
> +		pins = "gpio86";
> +		function = "gpio";
> +		bias-pull-down;
> +	};

Again, unused

> +
> +	wcd_reset_n: wcd-reset-n-state {
> +		pins = "gpio83";
> +		function = "gpio";
> +		drive-strength = <8>;

Since the definition is otherwise identical to the sleep state,
you should define the (other) bias type that should be set when
active.

Konrad
 > +	};
> +
> +	wcd_reset_n_sleep: wcd-reset-n-sleep-state {
> +		pins = "gpio83";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
>  };
>  
>  &uart5 {
