Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD3E21858E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573453; cv=none; b=VigbZzaPAkpzNaRnskjhUNAWMTTcYbiDKPVKlNdXqi0IGjWKEMekfpNsfZIV0/3ebJu7de2ZMvMAiKYRRaE24J3CqJkHjRGojb4siJtJVmYiArpmGmA6z+bKUF9neqVPQUNoEsvlzN3GocLHnUUYimOFSDiXPa2X+pq8FQZvwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573453; c=relaxed/simple;
	bh=3FVyvo4rQEASBdeLs2jUpPzQ3T7QZ+fT6TGxQJmNZow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIj11RM5G0b6CQG9FGQYzG8AQ6s+keEk7SRD4UItBjOfJSGYdfeSLqBT2BAMVM82rN1rChBr869dB/nB6WFDSRFvOrcTMrlAuWfE3jmL2LAs/XsugJNyOHJpDcQiIf1T8PAFlLSzahVekSoJfpyVGRxhA0x6MnxC+aXWo+PUYXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQ8XlJ6d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQ8XlJ6d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TGNq008750
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmHsSpCNcapdB0caM5YixdmlQ/ZNsk9RfZS1cEFj9A4=; b=hQ8XlJ6dQpBZZLKY
	tFGFz5oJhH5WwjYnRzEgkAZtyeEdZ1LVCygSThs+GzGjt53ZB+n2HiOiVKlw9eYd
	qZHg9ASFeIWMzkB8LBqRdq8bXvT0kDEti3Zz3ja3zMvZWDVc8g8gM4Q0LerIbRLF
	OY5Q5kyCD7iKRhswS+zZrwn+ju5hT3wggrXbJNCioOmLyln/H26ExIy669r/zEGf
	IaPFXD0HM8ZDT/TziFjjyjA9gP/zmh68XTlryWxgSvzlhiZp9PfAk3DjWqssdbby
	5BDc55AtqtzvC0jR6KhItyG8bVXPddzUYOR4mX7DhpFJIHugbZ/Ay/i8XuAtiB61
	fUbBRw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy8f27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:30:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4775bdbcdc3so5105541cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573442; x=1746178242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmHsSpCNcapdB0caM5YixdmlQ/ZNsk9RfZS1cEFj9A4=;
        b=PkU9YcRn6EclMfCeOtcKTgreJMVdR1OnYAAlj4/AyUhXrFIAFwRy0z0q1ZLn5sbyDs
         BVSaCgvhs6NqJO8WKes6c06NQhQQXSVCyEfqMxHvNH3qGa0EuWLuVmQA1v92YJaavt2H
         2dlbCh6Ecs+zqq5qIIHhCdQKZtGrt//L59GLHI7v6CBrltMUn19P+fGf4uK1nmYQV0xZ
         3YIEgSillOuGWEJ78KNgq4KMmGqtURsGTpkLBgWVWO5wrmhCrjZZ0vmA1OC6jRAQr+Hj
         uTVcUkHjmBlWEEFh2tDWyZ49bUT4Mj9DuG8TONofvztDtk9m2Sx3j+Dmxl7yknFmjcAp
         5Dsg==
X-Forwarded-Encrypted: i=1; AJvYcCUWz1Zf1Qhp0KjVLyrPMi636rgov1oeD2KmoJyLWiwxDDh6dG8UW7PXs+DiZbxLo2KcUNWHk9jO4/Hjzqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZQBphd41a5pW+3x40LDTpGnZx3TvqhXorOqeRBrUqx8PMGNpt
	hOlxrfHRch/AbG6NH7t6CcRO9cXDeZYh+ujEXnJ8BtyiGKv9eO24/4usw15xJ7oit6N+xdryjll
	Dd29fr0TLquXjhWNLFrP1JuHu1eRlEJ4vOQkKlBXTQm/q7mkxo0Otx/Ob1wbHczo=
X-Gm-Gg: ASbGnctEqcvo55MIU9X9noNb1k0yAqsN6pUCjSMu9ud6EmTmRVWx+RvC2s5iGM7qGnm
	Imy+bI6DBTU+jS4BbCjGhP6qjIWsgkjOQMApjDlpyZXwLGAFkrkGUbAKq3lOEQqXFEbIC2Z99nw
	dTWrAFGgewVmkgznKmimL/0AkQpAiKn0eQFhLHZ39qplRwUb4QdEHRtu3gc65ghbq01WneZ07ki
	qi/6lQhn1/soUsAKdLii00W7E9mzH7HwjpmKW+EcENJXXH5SJsnvBnxXmU7aBiX4Pt2No6KHQ/V
	KuuH0R9xTHUIZaDHiFhivk56LB4HbRMhOW/m9ueIhvaDn4VQDZLEJHgkEWhSDI1M
X-Received: by 2002:a05:620a:408c:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c9606a5a7emr105131985a.2.1745573442523;
        Fri, 25 Apr 2025 02:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDRyY4PM8jzTjzoC1dvp3QYYo4+2XjnvPPlpbIBlFWpeQUEACI8O0HFOiJIeU/wAirNuAVkw==
X-Received: by 2002:a05:620a:408c:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c9606a5a7emr105129085a.2.1745573442069;
        Fri, 25 Apr 2025 02:30:42 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e69b8sm105678766b.41.2025.04.25.02.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:30:41 -0700 (PDT)
Message-ID: <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:30:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OSBTYWx0ZWRfX9ZXD5gKW6Tyg Dj1+S3q8iztTy613BFsB5Vs8izSbVxcfAlCmwjPZJEqk0Usk5mJDMf8U8GwcQ35HVRnXw6b3o6/ PyUnbed7TDhpslhKkA4wmmHJ2VoXkzE+6B6Lg9XH1OiKWmxMI164KXZrPNLxDSJjFf16yVl7nlM
 k108IWMb3ab/HZ5ejEMkbpZGVdODetwycMuvLEaCQrV1BgLtLTPOIvzA0iak9QMJybyRWlfw6YN hMIpKFF66P9XJoxyuc3P/i8OqVwf4ghBI3zRqXinqUjuSArilzhiIdsGSXvgz1GhiOKLLs0XiJ/ MEKAoBO2PIwT0ytuj31d+z/mHaPmv0TkJpuCrXDVyxOBghfQ6WZsvPvWsvrPtFwx1Hmg8bRCemp
 /jdKr4LRQOTn+T1Ryf33YQsEoPU09XmpAANG8duvWBzDX8HTTXlZkPddvIxAIrvgHH1pxoht
X-Proofpoint-GUID: 6sZhGTw8RcjT3G2bpOKEQQd3fssJUBJg
X-Proofpoint-ORIG-GUID: 6sZhGTw8RcjT3G2bpOKEQQd3fssJUBJg
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b564a cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=BFmnnolzGEVUYXV1o_QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250069

On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
> Add device nodes for most of the sound support - WSA883x smart speakers,
> WCD9395 audio codec (headset) and sound card - which allows sound
> playback via speakers and recording via DMIC microphones.  Changes bring
> necessary foundation for headset playback/recording via USB, but that
> part is not yet ready.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> +	sound {
> +		compatible = "qcom,sm8750-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8750-MTP";
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS3", /* MIC4 on schematics */
> +				"VA DMIC1", "MIC BIAS3", /* MIC1 on schematics */

Is this a mistake in what the codec driver exposes, or just a fumble
in numbering $somewhere?

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

'co'dec < 'cp'u

[...]

> +		/*
> +		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
> +		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
> +		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
> +		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
> +		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
> +		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
> +		 */
> +		qcom,rx-port-mapping = <1 2 3 4 5 9>;

Does this deserve some dt-bindings constants?

Konrad
