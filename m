Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909619E998
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743806348; cv=none; b=DnE2Z4dGObIlUMycsyXsN+dagwiHj04s8rieqpZ/uUYj8rbEHd9pFY4ZOlMeWZYdsiGW3hVHXwR02X2GZmBeEw1/Eer4ITV/4gooY2+wlsuCGoH5Taukttl8LREGQqWgzx12gaywk+2wuYW1HBC+RfY0RYgFPVEcaEQ8jvqKKDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743806348; c=relaxed/simple;
	bh=T/MCyJIHRMBfFYIprBnwBWLv+76jEvvXlt9IoNC6Q98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2jdfkZv79U0XfoLRRGHbAW4kf47UDrlW0OY8jpu2XSUOHYzwS8DyDkFHmsA3ZpWDRZp36jaL6g/qZV0T9a0aYCR4M1ufvEicvFyuSg0fEqhqOxqo194bw+Y/RqdpOKQBfQ1LbUMWA84cvbK9pEJaoJ/9GIm3nSYmypFbMT4W5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOhfj/0z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOhfj/0z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEZ5i000546
	for <linux-kernel@vger.kernel.org>; Fri, 4 Apr 2025 22:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oAQPPAwHz4E9W2g7oqIWAj/qTk23uygOmdFEWxol8hk=; b=jOhfj/0zRCcAbJQe
	qFeozMfMur4+mg0GLAWSsq/qWByJ10Zn03FKYICtyOqJ7DehQikQ8TOuqhBixExJ
	qxm3qFcRlkD6ry99hrq+4CiY7ydxVWN0gLiYpvPZ6gAg6+RaUIZeEmwJJn5vVdF7
	hkQxR9J3+JLhWhbXzcNHegkIDOyB6f54PSiOLrd5vapiiw/3oB4bqvAdqPx9l4hg
	W8cSl2mPs8VwYSFCkGHNuHXR6CSyaLtP2mi5JfyjxqFnbrEuuzIQhz16bbSkhJOE
	vXB8vcrhSCLAhAj6dnExSJHsKIyqWH5HOqnsJYmEVZZg4KFTX60kxRZ/7ZQBKchK
	BTdAsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8b1qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 22:39:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5841ae28eso69762785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806345; x=1744411145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAQPPAwHz4E9W2g7oqIWAj/qTk23uygOmdFEWxol8hk=;
        b=g706FOBgYGUyfIyz+Tp3IFs6woYeWoX/54o7v+vvMy7e8B32G6PmVWu9LlrjZRrrLH
         uTbdqgSPT5b4Mh7lZlnSzJoib0dydg6LZWP8i9iFJVKKTq1WgW5/KPm15XBlRvRcwePb
         cFZkDGB1U6V1kE9J0gXDIJMpd9PoJP5Um5z3l069dn682pA1H8rQbGmFR1hwWRRNTk4E
         ExAx2wP0VYWQtjgERg+MC25WD0an+R2ay0iYCCbM1+HRMr6AuaFlXeEzFNuLQK7Um3EP
         0zUup4BItYSkIWavIGWilbTLwE12dykgrBRSMnH6ncR84kaJq0gQ2u6La9H7MRQf9dfv
         Uqcg==
X-Forwarded-Encrypted: i=1; AJvYcCUxBceWCq+iiyI08zdG78h7zj6io0jHhGPt9/09WWVEs2H5k724Sl3jJaHin9aaBUhV1mf5l072I0SDvMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiNfJq3jH6AIybiP/RAZNETwyxltMBL8Iw41Kmp3OuB3hJsy72
	ll2gwPWLtikTmePaKeWGwH8SV3zRUSteTINmbFyKoR4bCFdnAMX4QsjJxhxcGH7InwCt3XRSD3N
	qormzLgwBfAy/VTgyDeGrFj/CslBOdluakUoPz1HLTC1OZdWs2a7mj3mZ/SrVESg=
X-Gm-Gg: ASbGncv2S29OZpOMbKnvkbhhGJPo2nSsZrF7ZoyyysskNArRB7y5jZSlkCJpM8x/8sz
	RpKZ81lzVWWKR0IyHKaPtN+wb3CiFseZnwIRoVRM7NNh2KtrJTQKpt7kpsJI7GdfQ7EQtt4OLNB
	7MNebjnKCSois3YGE7iAfDMUd/Z1+wnO8mtRT48O5Zk0jrX+KPCGeQzWUmSCacLb0gIuxVAhyGg
	X+URIWY8L+WbCeIB3rG1G8P8HOAzXOTgg391FTjiFQ97M0aDliiuOiPQV4gObXmsxhpvg/fi1uI
	o7fggkmtoNoEtw6qM6lB8NNJD5j1o/ddr1gffrxmGnrTN6LG/xytVr8dyDN9gO96KyzpIQ==
X-Received: by 2002:a05:622a:1898:b0:475:876:ac3d with SMTP id d75a77b69052e-479249e2cd1mr26006421cf.13.1743806345083;
        Fri, 04 Apr 2025 15:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+NzcEKIjX/Q355mfL2t7DYQXJRcMD6VxP8/NFF8Z5Gmr/gnpuijoylXIpLqB0qI6DVbx04w==
X-Received: by 2002:a05:622a:1898:b0:475:876:ac3d with SMTP id d75a77b69052e-479249e2cd1mr26006291cf.13.1743806344699;
        Fri, 04 Apr 2025 15:39:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a9c9sm3106401a12.41.2025.04.04.15.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:39:04 -0700 (PDT)
Message-ID: <79c9ab2d-f970-4dfb-9170-ac3dd8b1c772@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 00:39:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250404115539.1151201-8-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PqmTbxM3 c=1 sm=1 tr=0 ts=67f05f8a cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=GLHRRWOWZVtnXAxWSSAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9asb_c-3eLTKkBUWwCXP_1sgGjctMRnW
X-Proofpoint-GUID: 9asb_c-3eLTKkBUWwCXP_1sgGjctMRnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=714 mlxscore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040156

On 4/4/25 1:55 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

[...]

> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		gpio2-hog {
> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "dsi0_int_pin";

Are you sure hogging is what you need here? Aren't those GPIOs only
required to be in a certain state when the connected devices are active?

Konrad
