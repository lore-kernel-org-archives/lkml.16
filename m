Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D41865EE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964422; cv=none; b=DxN7Ky++PzoCWyvy9d4KWao6PAoPA1c9ZoSgE1SoFHSaQvclOY4r799LA/F1B0YhXRfLW7/G9Zm/7N2f0UylIgGvKwXKBwyZ16S2870bspH5DqotuAiZfl4Nam1tchqp6eSnudhGEDdNRRbtDKkLXMdsKldM//WChNblXCeDR0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964422; c=relaxed/simple;
	bh=cgW2/0GcD+8/Xjq6KPCjePfx9B2N7GArAsp7JHCiCt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfUVt4MZN2/vwlEq2cW6wqTioo8odoQeiZrzZcRV/enfI3NJvmA8J+HqKgpXfuiwW0qyqHjgIHPNiiHKc6243zpwU7DnqbreGJAj3VJ/MzZJhCddKQiBVB6Aklc7/nMjeYWkt1veVQT7HNEzKLj2CG0LRts3et96asvwF2MeFAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBqPUJvB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBqPUJvB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIPcug013378
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SS9xc2aX1hgyRpQbo/UFT04KNBAkslTcigFYKQmcTfE=; b=bBqPUJvBbl3v4dPN
	n/ms21tFLtiAK3US+E/Q7+L4Rkw8JG1n87FdwCx11dcfx7vq9jnzBai/0/m7P1os
	0x8fZHpDx4P+ggY3pQl7reLaB9yLbbw5/WpfwX0T50D4CMj4EOTbD3d0VrGRI9OF
	IyNIQq01umLyjRgsQj4c+UktZNZ0iR971xmz2dWIDD3bUZpGT3kxFG6cADoH/3af
	c0jHpaFSZb6VKc5pwseKL9icwiN+OBWCI0/bGpTWRhIRsMpvMqdfVO3Qhc1fWsJa
	R3ToIL10bz2cFBDaMT4QBYWJw1QPgjfCra03JOoT/WDhM7BLJj2vH74+c1VptqvM
	6P0CJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm22xmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:00:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso26549985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750964418; x=1751569218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS9xc2aX1hgyRpQbo/UFT04KNBAkslTcigFYKQmcTfE=;
        b=roz654WVutr8A6lV1q0u8MWWWwOhEwi5a5rVINsUFUsiOAKGo4ljWZHWZN9aSf2k7d
         SkJ34KUKcdlU+efkX/ksnaS+fiKPMqfXHsNcSJW5C6d5N98CWQfFUdpwtRHr0gwlc3/K
         3jfsI+4DBu5kRdOwN1bvpnKq1vlSp93dSN91cpF4q3b5aeTU0/Np5kqMkr909hdkhGLy
         ldHe/aj6/gswX4bRorvUmuUpa7B0zeSVQ5GL70JxMszG7yVX0ugWHdYiyZ5qEbzi3/xS
         8mpLDoPb5M1DJ/nbcc+AsTBbanD3nFY2DqluVRLNJWMPuTZnPM5SABUF8LVAWPI+qBo6
         Trew==
X-Forwarded-Encrypted: i=1; AJvYcCWPlibFJK7U4xMxDCWwehu0meBkVfxSx/ctfNmXB47MlpGKGwav4p7/2KcSFXwFtFOPA2dmrW2YtRnCm7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2drtvJWyDWMSEZfL3T7Iwc9ue6uMfCimJThzmYKOg86JqHfb4
	nBO3nnpY4UPaHhok7rUdWgqP5sUPPY3TsgLz1AqNHL300KwLc6uKwg3DdTDOYBLZLbU9+GUvXEo
	VulWvx8D4RMO9Mb/b4Kms5qguu1y4fRRaJztVgbBo2Prf08HYKH6u3gIQQdrDeFWVRs+Q6wFWWQ
	E=
X-Gm-Gg: ASbGncuTl1kjlWLwWQpZIU2fWV7+8hc9pFn11fEyKk0BTYNIEYyJodBbC6AXGyK3tyV
	aiNHt84wC+EewuoKdFv7YmjwXyqV6YIsySjRuvjO+yuv4OkBMJeBsoG483EnLygJWZn1ubI6wAh
	KajVFk7zSow23wUiTIVl3PhKPdeLzLvgnnURukRGKPNF7UvUFv8xCOaS7BzHKulWfH92A/+eBsv
	/Yl6OH/EWZAaUYVl7B3bhWrFJHVmhjsXOUZIPuVZ18TyBMAfW0PYp8inJ/yps5zLB2yYZq+pmqE
	dgZLx8/p1YorPGJ07v4vZjO7dIdxk79sSqSS/jWsruSeJx8QdZyuATHiqxgThCTus5OmEoZlw7B
	ANaI=
X-Received: by 2002:a05:620a:4251:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7d44388a2c1mr34018585a.0.1750964417623;
        Thu, 26 Jun 2025 12:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxTq00cRCINqzwitl+zzIt72e0Yn8UwFVvdcPcObxnLLYMaqJZWvj2ssieb4NoIKfzFtvNg==
X-Received: by 2002:a05:620a:4251:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7d44388a2c1mr34014185a.0.1750964416934;
        Thu, 26 Jun 2025 12:00:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae202026e0fsm41259666b.14.2025.06.26.12.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 12:00:16 -0700 (PDT)
Message-ID: <78b8a1fb-a584-4547-b6cf-1320d40186f5@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 21:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
 <20250625-qcs615-v2-2-0f1899647b36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcs615-v2-2-0f1899647b36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685d98c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=0ryZ_V9OgMW2RYKJuugA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Y_Yj7S8P9IGYzN1fgPsI0DMUXYaoebaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2MSBTYWx0ZWRfX1o+nxBVjUeFR
 evNs8cD+HHSaZJMgiSbccLRpUN5VbVVs2oBDHVIIyCwPW4CLgripee+Iz+fzg1LG6VcWvNsP0Ys
 TRwSFKkApd+CRReLvfQmsvwL1YGnPtlx3C0JBd9ktYTdLEzEx0BYIcqdupri5Oube8nnFnEvwdi
 9898yxr4aNKmMfDsZW2L9eFNXol29Cbm1GXtQhgC3iCW2hVIvHhaDLDTnAmJtrHCL5KBAN2GfI+
 TxlFkFsbOz6xi5XNQBzYazr6J6Qhs8bfB1A2YAVAuIoJOb8g5j0FqKkRHRYzeLBBXy8DI94xA7V
 Xv40n27tlAPaTwodrY/NlwQugb1Z/OeWB3MmQL9V6WvbFyio9J7KEDvRU4ATDmdzkvP4hSSk8ru
 f5kq3/jHVot70EkqTkbuSIUL4PHUhxqg+2GxC/JMjacnT86DlG0WqZflLLpxo8I+HofrsDDH
X-Proofpoint-ORIG-GUID: Y_Yj7S8P9IGYzN1fgPsI0DMUXYaoebaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260161

On 6/25/25 9:55 AM, Yu Zhang(Yuriy) wrote:
> Add a node for the PMU module of the WCN6855 present on the qcs615 ride
> board. Assign its LDO power outputs to the existing WiFi/BT module.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> ---

[...]

> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> +		pinctrl-names = "default";
> +
> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply = <&vreg_conn_pa>;
> +		vddaon-supply = <&vreg_s5a>;
> +		vddpmu-supply = <&vreg_conn_1p8>;
> +		vddrfa0p95-supply = <&vreg_s5a>;
> +		vddrfa1p3-supply = <&vreg_s6a>;
> +		vddrfa1p9-supply = <&vreg_l15a>;
> +		vddpcie1p3-supply = <&vreg_s6a>;
> +		vddpcie1p9-supply = <&vreg_l15a>;

You're missing some supplies (in a couple nodes), as the bot pointed out 

[...]

> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,ath11k-calibration-variant = "QC_QCS615_Ride";

Use 'qcom,calibration-variant' instead

[...]

>  &tlmm {
> +	bt_en_state: bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		output-low;
> +		bias-pull-down;

Please put output properties below bias (for consistency)

Konrad
