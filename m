Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032832C1092
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924290; cv=none; b=ad6g6ijMD6OxIlxKyMOprasD8WYmBqEgWIqFBquuzaEN/sMzFMVrLIrpKY3B43VG6SMVLmASiqnTlE9EdBIo8VrIjqwH8D2IitBemcnoBTzoeg6y1sKzPGHv8Rx0PLEtE52d5ZEXJE5HasrHFns48ZK9zCkrBmy9EfgIRJK+/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924290; c=relaxed/simple;
	bh=fphufsS75GYBBcFBWnCVeA34fEKRwNsxRNgx6yLY/T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QM1MCmJjH4DzCYUazYUGjzpDySk8HYM+85yLBKzTqwlwdy3cE1BDB5qqB9uTxYy/oRn9iJ8s1YYPFmEJfQokCp2NSOhhlIikez1a64mf5n1GmHcXyIw7y8hiJWiIRI3S85clJ578ywYxeV2704xwYmKB7yOuLfWGf+sbnnQP2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsnynrfk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsnynrfk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA20vx030210
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HT3dXf2eHLieMKHvIETGpanBPjJB3EafGATYzblRr4Y=; b=lsnynrfkYSExDHk0
	qC6TmENVBTmHEkJX7poM3MPvbsAWEnQksNZTLS2LL7TwWlEjXn/96eaRxZcVtiKj
	Jjw8GfLKRn3uvDjPiwq5rr+Qafc2L690S9J7FJTzQjBUVQ67GPo4tKLGoNqXGQYK
	7Bv4aN4YsTrx4rXN3wq41a5xJIhOSMz6Hzym2btIy8/+lKjAfztbyf4MD/H/4fPx
	6jdmjf/k2gwKsCCoRJccdN3Ds81eV01D8521cxvnVuSgmSQx/2Xa5QUDuNUEZ05m
	rG8se3gaswcHVWMAwmwoFN1uKwPEq9mYh3DZcf0X7kooYeO1/60Ixfvawop6ZLTO
	AIoZ4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevkcdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:58:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c76062c513so101492085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924287; x=1746529087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HT3dXf2eHLieMKHvIETGpanBPjJB3EafGATYzblRr4Y=;
        b=wuVrKVE6tjrTuv9aJ4LygpoJIYBmuTVE4m8Nfqw66vr5+bX1O2+OsKWxMgtQDsITY4
         ltjIw7ybzm0QRbs/mYxAVe2WMzaSHtH1yDBXnIgpYK9sQDMMLc/WEe6NMTG1LZa2fp8x
         LZf4TCq6BVZ8jWu2SfHsEv/csucKRI7+lVtSNeXxAljqlfwtRh/7VlhI9/8//viBzXv+
         mGrihCJ58uuaceSoZtmMay3f3Bv36d9Rq3D6HOTAoIXbm+Lyd9CqDkACGwyBTEnUfMzV
         IX03p/JurlzSKEMHdOyPrGBmDXntuDqkVyjEzKdlH8kJZduJq4cNba5emXDFCP3vs+iC
         GIRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz6PmII/3H3NtEAht2ZcucTNw2ZSm6LKS3ZUJvjNCsDXlFFKsf5TEr0yY4deyr35MHKoEZ2kmdAFpu/qU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIZlhgnBzSlwJItUhf/TQ40trBRNWp+9Dc7me0AJSga823PpbI
	cLeh7euTFiBS9JRy0E7KWvBZ4smNo5n+4oDtqkg0jWQBDUM8dogHpGPWv0NwH0OfBBmt9GrZExG
	yGclMKWb3r6ZDcHrwm+q9VMSbwqZXwimBPiau6+5qiyhZWeRHU8p+DyjFPwuWJS4=
X-Gm-Gg: ASbGncuMtmrT9rSFxYZCfBQRlC3wvMraLUVSZxvMFh5HVRyTH+bHRi9RSyGfaZE5MVr
	xB+zxaSynNv+G9a9xb7WBZe3QK2U3WpAxSBETYBdXKg5SAwHAkpkP9TOUahhlJrDS+CONNG6Ypx
	5aYkAqJ6IUcwDW/rCK6lZBKY82jofVyZZkdqRTTYHvwXytFQbO0R5QlWNa86s1rvuOXoNOHAKKt
	JNOas6Q6Aasp1qizUsA8yJJndiQWIAJrzVgCHaGWVaM+g45kTPJupxAEknIDVCkbuqC+HmLll3T
	Axc9L2TUg+Oj4+f59ZHm4XW18I+N6Z8dTgktpoHPhCoHyHdM2vL+u9+6TUi2Amto+A==
X-Received: by 2002:a05:6214:c42:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f4f1bbe3cfmr14938306d6.5.1745924286808;
        Tue, 29 Apr 2025 03:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFvT9qdeZKM8ZtWBzJM4XZYLNdlPQWbzdfnDzWOcBFG6syPrx7jRpwCUdNaPIAqcCLrSuRGg==
X-Received: by 2002:a05:6214:c42:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f4f1bbe3cfmr14938216d6.5.1745924286435;
        Tue, 29 Apr 2025 03:58:06 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f701400565sm7365680a12.26.2025.04.29.03.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:58:05 -0700 (PDT)
Message-ID: <cffa3374-c88f-4390-af7e-d6309a870b63@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:58:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _5XoQaDYUKdScaphmjwj2UAN0_Cwkibu
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=6810b0c0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=LhcYZv6hF2g8wJCaxG8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _5XoQaDYUKdScaphmjwj2UAN0_Cwkibu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MSBTYWx0ZWRfXwFpAA5ydpt5s gI5kSFDbcCzQ1IK+37xiQluqrbG8jgvBKlDmQ3+reCJCsLGIoDm4sTbEbobTIuWM2gKgxUUpNfl v2OS4haoF4y9vSc/bKHWG0+UwbJxazuLiMg+dL1bBzgJjXRkhA8fRIuxKRZMWnaJ+V2duxyZv4B
 +2HyAtpu/q9U1zUuH7qW1GEOQHJ52DZkdyxXGQ+TQB8soa9uUWr8l6sEnsZq+5MXbMmom8fmO1v hHnAC1HVsO/k5VrQg/GAfcaSBi12f6X9wTWSJaW/rCv7GGIhBQoOQ4/C2i7HjmQcOlGDyakKJ5R t23L7pIOvIr/N4+Euv5JWWxLD8j+LuqScfoin7j2Z6Y+01FdSOwDArP1t1myFDcGcwEEnJizExb
 Ri3tZrnZsN0utVxyMixFv9w1Fl1oB/fhOq2DR7AiMwZ74+o2XJWUZe/gqTBi7dQZg6tWzijB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290081

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and digital on-board mics.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 49 ++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 43cbdbe43afd..9cfe648e29bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1078,6 +1078,55 @@
>  	status = "okay";
>  };
>  
> +&sound {
> +	compatible = "qcom,qcs6490-rb3gen2-sndcard";
> +	model = "qcs6490-rb3gen2-snd-card";
> +
> +	audio-routing =
> +		"SpkrLeft IN", "WSA_SPK1 OUT",

Please unbreak the line and align the entries

[...]

> +		"SpkrRight IN", "WSA_SPK2 OUT",
> +		"VA DMIC0", "vdd-micb",
> +		"VA DMIC1", "vdd-micb",
> +		"VA DMIC2", "vdd-micb",
> +		"VA DMIC3", "vdd-micb";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +	wsa-dai-link {
> +		link-name = "WSA Playback";
> +
> +		codec {
> +			sound-dai = <&left_spkr>, <&right_spkr>, <&swr2 0>,
> +					<&lpass_wsa_macro 0>;

Please align the <s

Konrad
