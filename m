Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F1A191F92
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611574; cv=none; b=F48D+HKAKH1e05ibprG+JaHTU8j3TUTfeiwYnIC3GIkSfM2/FrCM+zuByK8a7mOe9ltr4j/tFO0wY6Ksa87JsuKDZHKntPq2WSjhGqPp8VeMooC2zgkSrmAY+L6e3KSEkR/hxC9uwfGsvrDr45kyvTLejfaezV0l6Hm+8JbXCLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611574; c=relaxed/simple;
	bh=oSnWoBvwiL8zXIfukoiTiTzqEKDcbv0yN7J/kywW3EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHxybFF35czWGpkvoMfkVG5czvt4OxAfEXyDX3slE83FDKhcd7xWVOJl6Z5ipSNFyVFQRODtxK2zJ4RjWhX9oLMSpD7+bGqqGqoG0xGDwEvlIe2wJRip1lFuqGXmoNqfFPjJ157afNLIRcBlUT1+shnk31bbOzq9S67GRtIacPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oUKhVsLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oUKhVsLY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK15F021809
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbkzYlr9FcucS7S5VCQ3UfLEUKAWk1iYNuI80KBt6hs=; b=oUKhVsLYbYpS4gsG
	Jo08Cx5fDePu9XX8NoSq5zbFvEp9MCchBV52OU1EEYxMRrsHhDDkD4a4tLDsKQ+s
	JSSOB9swc/ZdirF1p/Tlf9N6Fhwbw1j+FTMvfqx9xHsluiHRi1X7FGdtXpgw4akc
	qFb2GxQ3wLUZVPYwHPxXEktHjO+9pq9n0GFaMLzBhMVb4evvOF5RAb/06mBlrPim
	jgYO8KA16bGjkGOe79jvFwZbUHPkqbiJ8NlN8Mmmr6pLdUHrhFW6sfpF0EGhrmKH
	QindxyjxDKlW1MMTdvXQ0nBFO8aruSQEPq5EuUr37VVsAdi9WYKMYtq4G4sFi3yY
	bEZtmQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5j7sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:06:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4775bdbcdc3so6381771cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745611570; x=1746216370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JbkzYlr9FcucS7S5VCQ3UfLEUKAWk1iYNuI80KBt6hs=;
        b=EGfiCDtKpYQy1Z+6WZcB360ZFD1AATCqvw4pJS96/3GbSj7gGKxSGuq5XeJIXj551l
         bxHDSQCBsam0KO2EoY8cwu7SwqzPT4M30d3k3GO2OZmt7zbvdgRvsQh9vYTsMtzycTiD
         RtA6PkrTM1LYGISfPcvZNCvoiEsg/T806gn24MM2oj2zKpbnmAEBJOr+EwDUaFsq6KTt
         yh6AwFxJMVoyxo5jq4HHJDs6NUOUaepNEfljKOYkaXkPni6M2445IcokKtBcCKccHFAE
         3YvSLLDC1t/UAMoijVECZkqDSiXNGI8zud0EfyRD4PGj4Y6Rt9nThQj2+dCOO17EhSHL
         jE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/DimBQu0yFMrahDtX6NGum9W+Zk3RAnvnZTWpPCaz9QmSUX49+UJc6CB6REHBtIcWn2MYIu8qiJZ5wY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7toUtORhqIQWqpbA3RNzVvYa9xfQgG6ASUM0AqqS0WT5txm28
	U7lCQ7dnn01XxaxD9nnNCvU0Y2kNPTin20til6TFQQXhVlk4uJprdCXPLZ7874P9M9otfu7y/u9
	Ce0iSY1u+YgjIzEg0w/qGnP0OdTD1marncucq41ofvhbwzLJhhhHzFH53XX2nYYU=
X-Gm-Gg: ASbGncuGCWlkQd4kPyIrBjjMvhYH890t+WH0xyydG1V0zZeYi3UsRmUCuSbOLZbf0rK
	kciNQYQhwF4FuAhqu6poGpOhXs7O60Vrj0CbQEz/nmljqpd9T7J6p7V19I+2tGt3vCXHaI2N7qv
	+cOca/Xud9Yi6QvhC49URQucUsVozwoGQpeD3/jY/C8WEKdULkFBy4B18lEO5mbHWMk3XzBTzkH
	1avn42Yd5dCLEYLCz9yIZaYrqHB2n8/Jf/G7B0/0axGv0L1MEZy9e99MnGRKg39mBdedON0BV72
	rSP6ZAG5HCdTrg12pt6h4cSL1CeHI57kSQFpOpizDPZPO4YW003d5ZZM+sKi60RhdVE=
X-Received: by 2002:a05:622a:20f:b0:474:e213:7480 with SMTP id d75a77b69052e-4801e6f355emr20583991cf.15.1745611569846;
        Fri, 25 Apr 2025 13:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9Hh7yNKXMC83orMEjh4un0cdx38I27WuSPe2cISBmPqnEl2ZJLXpyzGB/8t69yh0ofQvoFw==
X-Received: by 2002:a05:622a:20f:b0:474:e213:7480 with SMTP id d75a77b69052e-4801e6f355emr20583801cf.15.1745611569404;
        Fri, 25 Apr 2025 13:06:09 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8955sm181397866b.117.2025.04.25.13.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:06:08 -0700 (PDT)
Message-ID: <891c7909-69ef-4d9c-a99c-8d6d08dbfd02@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:06:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add support for X1E80100 Dell
 Inspirion 14 Plus 7441
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
 <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-2-ace76b31d024@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-2-ace76b31d024@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NCBTYWx0ZWRfX8qjZ0pthjm9M WrmRZ6hc5iTHsasb6kOzrumwp6nvKGBfwQUL371lmthIHr4FH7scAefeN0YZx3pYfgD5nkH00ck t8vMZGJs08y0AhETXg0TQ6JE3aAYEHskhhbbwsP5m4INCRz3RzyKABqG8UESOBE3HwxTOUER4Hf
 iuF51uy56COscTqA4zY8h0Gf2QvhCwgl0QZ4EzI+a16GyKbNdisW0a2zOvLo+1ud7OrEVq3oHw4 TY8XheGS1npShPMcR/LSn33txEDQkCo3cjmh5FihzzQfjDclWaHCd+jn+3Ssqv+m2RUTO0jl8gr agaVNWPWS7ZcWdEnzl4lW+21wxiHyC8eNOuyT/X46ZxNL/pXUMm2SxDzFdFI+H8bnZ5lwc9Bkao
 jqlFxFGwAZXHPMczrlGhm7VFCmSX+Djps88NdvM1p92LTFbtut0lZYHS07K1osIXo2kp6cJE
X-Proofpoint-GUID: 2XkA4jV73z6l63vxM3fBp0tRHgmnIdxt
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680beb32 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=LY3U4cgvXuRfn2pE898A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2XkA4jV73z6l63vxM3fBp0tRHgmnIdxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250144

On 4/24/25 1:53 AM, Bryan O'Donoghue wrote:
> Add support for Dell Inspiron 14p 7441.
> 
> Working:
> - WiFi
> - Bluetooth
> - USB Type-C x 2
> - USB Type-A
> - USB Finger Print reader
> - Display
> - NVME
> - Keyboard
> - Touchpad
> 
> WIP not included:
> - Audio
> - Camera
> - Embedded Controller
> - Battery
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

[...]

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_indicator_en>;

property-n
property-names

file-wide, please

[...]

> +	/*
> +	 * TODO: These two regulators are actually part of the removable M.2
> +	 * card and not the CRD mainboard. Need to describe this differently.
> +	 * Functionally it works correctly, because all we need to do is to
> +	 * turn on the actual 3.3V supply above.
> +	 */

Well there's definitely no CRD mainboard in there.. not quite, anyway

[...]

> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* Type A Port1 */

But there only seems to be one?

[...]

> +	/* FRP eUSB */

Factory Reset Protection?

Please spell out Fingerprint scanner if that's what that is

[...]

> +&i2c20 {
> +	/* GPIO_80, GPIO_81 */

That can be tracked down by looking up the node definition, it
would be however good to know what sits on this bus and at what
addresses

[...]

> +	cam_rgb_default: cam-rgb-default-state {
> +		mclk-pins {
> +			/* cam_aon_mclk4 */

I don't think this comment adds much

[...]

> +&usb_mp_dwc3 {
> +	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
> +	phy-names = "usb2-0", "usb3-0";

Any reason to limit these?

looks nice otherwise

Konrad
