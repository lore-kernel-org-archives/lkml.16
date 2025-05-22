Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F7191F89
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937570; cv=none; b=YN+Adit7ZA+Fpe29eJawrJq9eCKUNTzzBEJlVgcIvRDX9A38U9ttYJ9SZp883ME3layN9+fVWJTEbEi/5ofyWK7xcvAfzJqTykvrqfjK97WSmvMZmN5MADdBVhWUtjD7EPgpwmEK6uJvbIlKN3eKzuAnPsJFWC8SSomBv/trOZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937570; c=relaxed/simple;
	bh=4+L3iLZ1PQ+3x9OrSxwxJm5UHnJLQRCjkTTkw4U8OIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kewpqNrntaPjyAhWpNXuNGabuE01NIvyBL3zacEnX8MnfWKxssGtONeY9MiiRBnkiedJQpR4ypxrA5XLcqWT1sUgpR/lJEMSTIl1Fy1zUJkFVIsVVxSDUlgth7aTdTS05pUIJws72mJ8KBMWa5W6bIC1j9H08RcwaJTs47vTL1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvvJmXzs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvvJmXzs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHHUfd027612
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rHki3C+ZJvXgoBcG7+ipq9fxEApEk5oINZU9My5zwuc=; b=SvvJmXzs4qhEv6e4
	eu5PSNbUjxTvBr3wpO5xfBrukRDoZnoUGkAbZquRuMqauab4U/JvX1/DCkkCF1Q5
	pgRiYI1cHElaBcsmuGjmrGo2+e9Sju8uoH4jnlcU9We5XJAc1vHw65Ci5kbtkHJX
	+0J3vU8dye65Nz1TCuMoS5Rq7G5UZ8puLgM5q45gb1oQ364chtrxl1j3DV4hJ541
	MSBym109Lw3QrwchAGPl6EpRfg+oFjVhB2OjVfdBYpvRwikJJ/sNYn56djEnlK2l
	WfQMzqYBh4rL3omNI04Oufc7JOuqGvFzG82AcKB8zkudukePlJ3sQO9xCs4lVGp+
	7l3icg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9f5n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:12:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ad42d6bcso225440085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937566; x=1748542366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHki3C+ZJvXgoBcG7+ipq9fxEApEk5oINZU9My5zwuc=;
        b=UkCLgrcpeTYsdL1baQ98mTmqDhsW77pW0T6J4VQN0p78Vne8gp6OvFnwrrza88zZ3D
         YEIf6J0Nw+oZLX/KbTN0Y/k7rGq+WpIerOdJMFjWF80aex+bcYztC5+5toaK+9YXbB1D
         4R7i5Fob7zmAVC538u5jfOlRnPiszGYBAQdeW1RLUgrRh83IVeO1GFHPBNnNK69+CniF
         sXjB75SSG26q7C44jvLYaNEYr7FBTBDA7xuPeIrYRnowLiMsGS2r4/Uf52Te2KRr22WT
         YWm+OQSZ3MXYWtbb24zntzAU+RPereV0vS8CBLsk6gF7E2SgRTDDcg3Vo4ninrml76Li
         TuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoDliYpiSLoxNZpZBORNZHWLOIpVWhwX7kTPUk5HfSQwvIvGJ1kXmXjCCpXs1Cqj5DI8wHz/luProij6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGjoeOEs/cTxqLuH1XXhKi+sk2PoidTEryafvLp4yExxD6KUe
	8ZfFAsP65O33Umm/r0XFewJgRpyBY5323ANfn1cX6VbzmylCarJFFtkz2PGjTT+7k3hPTdT9Z7L
	Kl/sQLpZ/eTg3sYlDDz94YhKR7C1rtQTLiv1It3Wa47EjPMczcL9fvO9M0YPG6bXdByE=
X-Gm-Gg: ASbGnct5FQXycyLe7fR4bBagIdHF/CMcZDvscwOVEv7b991t2dC8e+pfOmHNsXa8K9s
	N0u7gp1kE/o9Fv1Nz6jJ+EYK0SfK/ZP88LUL+Htq9n9n27iQ5hDiLPtd7+aH1EIXwetSn+2wr24
	DVQJ4a9pv658UYcQ566SIfB3oG69x46jRS5Emzeq2RCEYMUHbMKZUlT2c2vbNjiaJnLY96z2mZU
	2JD+yN8anApcysRwzCzN9/ucjBPd+M0SEN5VNRUzxitr+eAfIEkDDAhbH4/MZRst8f0HOJ3zkHE
	sgN7KoYaZQLWbGBQUHP1meU+y9hhVH8CjhM5HRho0bWQpJVxnFGVf2fvccPFPSTwOw==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr1648092985a.6.1747937566295;
        Thu, 22 May 2025 11:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKApsZc0tAvzeoyie/NaHZmrsLj7RHyx8qKKdLeYJhqJZ/GOhS6Az5AsscGMsme0KdMurL7Q==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr1648090685a.6.1747937565936;
        Thu, 22 May 2025 11:12:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d43830esm1123536966b.98.2025.05.22.11.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:12:44 -0700 (PDT)
Message-ID: <a8b2f310-2b1b-454b-9977-f74d975e6e66@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:12:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: sm4250: add description of
 soundwire and dmic pins
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VZjmTmo_aQrw3SPSFUfslhNBvaQJEo3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX75SW0GWaUWCt
 zyo0Sj1q3cgYC0ioPM4pkg6cQyQk4ghntRghIjT3r/HdnNIsl6cEKc5X0d7AJM9v6tExBJQXDQb
 L2ICtgH4xPeW4z9T8/D9RrzMXSgP6e+a4vBC+fDboUAeEKItLgtvKiB2kaH/jl4yh2V6ct17t+w
 UYGp9lYx3yjGhBuP+h7X4XqcRE60d42JHfG3jw3IEZApwzOBtMQeoITFQdsfbi91HxXzbgxTW//
 d3nNiKVRxlBj/SAu4dBlu1hGDNXCCLwFQGUVrxMkdFxBfVZsSbpkxpabZJDaNVh7WRzXnuxiED3
 9AhuUbXeuEoBwru/TdHv6sW4Oy9QtIphD7EaGywf5AoTip4vavzLLsqyg/cXSsT6AhsTrBIgw//
 vP2JEn9dlJ1VKpHvFFMM9RAigVf3a9IcSKVQCPy1fFDbrjcv1gASW6tyN++Uu7aH6dJQlqlm
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f691f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=tiPGpea89PUxzv1JMdAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VZjmTmo_aQrw3SPSFUfslhNBvaQJEo3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220183

On 5/22/25 7:40 PM, Alexey Klimov wrote:
> Adds data and clock pins description (their active state) of
> soundwire masters and onboard DMIC.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm4250.dtsi | 62 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> index cd8c8e59976e5dc4b48d0e14566cf142895711d5..723391ba9aa21d84ba2dda23932c20bd048fbe80 100644
> --- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> @@ -37,10 +37,36 @@ &cpu7 {
>  	compatible = "qcom,kryo240";
>  };
>  
> +&swr0 {
> +	pinctrl-0 = <&lpass_tx_swr_active>;
> +	pinctrl-names = "default";
> +};
> +
> +&swr1 {
> +	pinctrl-0 = <&lpass_rx_swr_active>;
> +	pinctrl-names = "default";
> +};
> +
>  &lpass_tlmm {
>  	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
>  	gpio-ranges = <&lpass_tlmm 0 0 27>;
>  
> +	lpass_dmic01_active: lpass-dmic01-active-state {
> +		clk-pins {
> +			pins = "gpio6";
> +			function = "dmic01_clk";
> +			drive-strength = <8>;
> +			output-high;
> +		};
> +
> +		data-pins {
> +			pins = "gpio7";
> +			function = "dmic01_data";
> +			drive-strength = <8>;
> +			input-enable;
> +		};

Other SoCs put these in the common dtsi

Konrad
