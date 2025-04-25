Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1AB223702
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614755; cv=none; b=MBVVv280uS5zZgxEGBX43EqtFBKQUub4oc7ReKrp2IrYb7v9PqK5Dbuav8fL0+ix+7Py8GAYvXiBJp1lK0DQt/O/fnDwhMtCsNL0GLrCmye6VYEKvDLcNTzQG3+vdwDNszAOTZDtvakE7VbnYIaeZk93HgQsRYxc1Hwved8VWjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614755; c=relaxed/simple;
	bh=U77G/pwPSxuG0YbGLIuyGneBztbU3/zw1RUcuJ9AOg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maGfNy6kRrDobFZjePf4rcW0GepsetNvbhPoA1w+wLSCRjXUIT97VKG2QwreULj3IWptskjzRk+wgmOfQqIvYYNTeYXWFDfNjta7fTQB041gqdJVdf8jMEC99WK0FBSnDN8J3HnH7GRWPcULYm5phJlTXfUosCPXN4wAvhoUG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWbMlZeE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWbMlZeE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJu7Z024751
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LRFKuyQj8tzl/ipkd3V4uRPUSagaj6nf2RE33l4njU=; b=aWbMlZeEd1EckDQS
	VPzjP/hQDdZRJxEh+p0DZGaTR1Hkao4CYTGWChsY5lnXcxzYS3HOzeHjRu+QprPt
	mDp6Qi9hkqNGXqgA89Z3497QMKG3kCyPmLQaaOhPhojaEBkBWTtF+x9VDOLpURjh
	ixWZm+31W7m9HRkenWmVRgbAkkJvs5LcieSU1Shg2wLNG8zDZsV5FHvU6wPeKxFz
	Upa8xM+v8ebRX2StHuc7ZwBM5yrLhrgzwjs4tV0WBbdXWXolQloCPXAl+pul0vCZ
	5ixhJRBNHX0IVbCcVmS5HUpCZtbc+Ozojj9W3S0P+QQKi272gI5WI+J2qFaseuNE
	3MHakg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t56k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:59:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso7026276d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614751; x=1746219551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LRFKuyQj8tzl/ipkd3V4uRPUSagaj6nf2RE33l4njU=;
        b=RZFHzSLTqbJuE8B8a6g/d0bep2IwKjBf/5iqOlCSKj2nmvBlATaImoc4tMrfzWoV8M
         OazDx2lX+aK1BXOyDlLlCyb+elK0GDOdPXDYFmS5N/iDen3a4UeozIlNrhO2ttglSZ3B
         cM2/WIrqxAfO8cDEsnOYpEJDnaJzQsGJdsZpKTcMJbnBuaY+XrHK7xG6o87ZvJp/uKuX
         nXUwqDIlIeYvtWrl+35+rZZQULaYCkQP4B7M/R1oz90WqKghibunuYiXRY9vJNGGiFUr
         be7U1EnzI8HBs5U6KGAq5BIab+2wjMM1jp3GbZcccQ4SptsSBv698chKJ4WKRWROd2eP
         Lxrg==
X-Forwarded-Encrypted: i=1; AJvYcCXTGLu0VqcQJhUcKYjGZINMZzoSQgptfDP2f7uszGn8s9YwxcPsH7sPSOKl1+89ZCb31G+MuEsGrPOfmCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3diJVnAzqkFbFELuZvnxpiLeEbiFJTXO4pVecDAkWkyYVCN5W
	D58jeig9xHCtQB197Lrk6DTpVl5LJVSX4ZdzQNKTaFn7waDRNY08DOrqbD0tHwg42UAk9v/SGkR
	48AlCk2oXFb7tVNeu1kemxvwUnqFlxKd5iCLp8dAncEpSaqbgoNcLPjv55J69vj8=
X-Gm-Gg: ASbGncvCoDwB4RQI3ud1ydENLbXzjOVH7EGuBP4PzjWmmv6dgFO9pCu04pd/xopjPa3
	Vjr69/9W3MYovfBAm2MB+5oE/Xe+db4znU5rKB89Z+kPr/0X7n9Umk+vt7NX4+Kgi5P0R6sD+oU
	hjt1ROQarCkDd6z5IiFq7C3A2zsqdmjxvwpRq0es2osNzu17u+aN2U6giRT5FMeWdqKgFGT7qU/
	oQc2EUVsXEhQCXiHMDa8rqMuDqF0URDsvBV1CFeDpaxP7+LpmtJwoE+dLuA+2v5YP0ITj/oOMrI
	X+/ODkYMVFCiJWH3lfzmUfATxnR5txSMBNlqjjhJNgSezBlck7bBEUKqDSrSi2Ay6Rk=
X-Received: by 2002:a05:620a:bcc:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c9606e2a2fmr207584185a.4.1745614751637;
        Fri, 25 Apr 2025 13:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxSw5TJpnLmV47NsHo1BnQTpTa/Sw5u0NUbO0lbNkne0UoYmYWA/fJrjJvN1Yw56jJoKlr6A==
X-Received: by 2002:a05:620a:bcc:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c9606e2a2fmr207581985a.4.1745614751239;
        Fri, 25 Apr 2025 13:59:11 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa375sm187614966b.121.2025.04.25.13.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:59:10 -0700 (PDT)
Message-ID: <f0443faf-ab55-4962-bab8-ddf31a751459@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:59:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
 <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HIDhqqRiAyOeKyV5py-zLSnFq6_gd4IO
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bf7a0 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=yamDa2HSj1aoHl3nUysA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HIDhqqRiAyOeKyV5py-zLSnFq6_gd4IO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MCBTYWx0ZWRfXwt1zqbfwGjQd 24PJvElux5v+v2ckZNTxNEW1kGRMeDtoMi4O+znbRMduMiMzZ9vqn03mkW5qlUK+OFmqrLMkqI2 2iU8Sqz+fyvsm1nbXf7u42CLsoGDyBUVJklg2G+9apdaWJoYQbhMzcJpTwdLPwgZ+TI+Sjf3UcN
 JngTG1SETDLpGZ7T6Ut7qzhEGPDwbERYVJupbRMleUlONXzSO2R7u2XUMPyXxa9xSGVYXUBg2Yu UWnxQBvpB1k6odL3myUxc0ZFc+p9Nx2nNuWYM4eX1k3uWHaoCK4jxXDuNkD27ZhfusoAJTzkz2d Bu9OiYXAF3OIiqhwVM3Qp3AGI1Z69H2ZzBBKbe7q9kxWTdyNfifdPTwp4wbRTPyrDg4O6vhVIeN
 wc0At3sYLmOJx+e63QiVv2FpQVIFP2rKIWlrgAqCc+tsMm7D+O72N+esKQBq+4XF6bekolKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=934 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250150

On 4/17/25 1:27 PM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index e2f6e342db7e2f7cfbda17cbe28199546de5449d..74bf2f48d93522d3f5b7ca990c06519ca664d905 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -858,6 +858,36 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
> +		vdd-l7-supply = <&vreg_bob1>;
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name = "vreg_l3m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;

Is this and below +8000mV a fluke?

> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vrer_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

typo: vrer-vreg

> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p9: ldo7 {
> +			regulator-name = "vreg_l7m_2p9";
> +			regulator-min-microvolt = <2912000>;
> +			regulator-max-microvolt = <2912000>;

PM8010 coupled with SM8450 has:

regulator-min-microvolt = <2912000>;
regulator-max-microvolt = <3304000>;

although the x1e crd schem calls this pin ...2p9 (though the names are
doubtful at times too) - please check if the consumer is happy with 2.9v
