Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B53D2E7644
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035869; cv=none; b=ecGasyGF9otBZBeBeGQjt1fjDYTDllHtEUAdbvOV/YHvv21tPIFFVuNuF2u34eFnhKpQncflN4YkN6wnGVfjWLSQHTn+58t6sMz58tp/J0Q4ZVoYHSWSyknTqMFZIRuZ5QamG433vOTrML9e7qVqPLp/LqSiOiplSzXEULRCvGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035869; c=relaxed/simple;
	bh=7rtraUnuZEglIw9bM3jvt7JTU0MMScfXHqqtKcchIKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqKY1y5pbKWNOkdzVS5M3hR3BXW73qcPdpMYTax1fZm6C16qGH7htKyM0c8qKySsCFgW5c7lvZEPq7m7jIfBS7N9PUL1LC4p5sZFk8biJKbLRbHpE51FTCu0110aqWBQe38SdAwoZdhC3Yu1tBCXI0Wqti2ombR6/ej3CuNSUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epyDyZSz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epyDyZSz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBRr8M009570
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rtraUnuZEglIw9bM3jvt7JTU0MMScfXHqqtKcchIKk=; b=epyDyZSzyFl+MJZf
	VvTrWRZwWi+CJrg4dBLVr8AGET00Udrlwr5ChES4CENzsHTPyZdBKPD4JsXXglmR
	/AfeHOHbg3nAmIBV60ucOmyWysINbAAXOUgbzaqM6duhGmOnqvL+wdCyG4Y2Q8ca
	pSHmEJk8SB6igGgoCBHNAx/E2cUHluoxLCpq3i+XjGSdhv6AkpLSmFfkl/cV4zwz
	eA7jJgsde/V/c0JrgcIqqtXogfhc4gmStUQl0mIxDgeGYa1S4OtPIvuMkmneYunO
	GnIDkBuG3WaVPtHMK/oYmOGt17T5FQRzBeTK34DC5nIvdiC4L9W2y+bfMWDgXFTx
	Eu7mQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b4744f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:51:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3eeb07a05so19322285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035865; x=1751640665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rtraUnuZEglIw9bM3jvt7JTU0MMScfXHqqtKcchIKk=;
        b=R7MPT6zxkhuYPYtA+ir9kSoYP3HtkTkRZN6092/lrkHJ6AfdWnNpiFe98HdJ8bTsUc
         KH0n4WLT+YSKyMxNwCu2OPupL9Xbignk4dNHuJAR4jlbzOLAnIqdRcDqgQX8ApruxgdY
         OdtDTaaJ8JgBXWwOL2OhVOVg2AeoIvnCIDyIryaxeQPmg0lb9TJ+ZiPU/mabIjHsJrQV
         YMjZSaMPc0Msq48nTjRkI8skN88vWBUZII2m6CKqzUsZO3WnJ0SoyRFGGhmDWOOpcVZi
         0mrNsW8A1HLr15PRr3kAo9svhLueinvURO299RhUAMFtgocDTHxUGfzdQrmp9uqyggVh
         Phpw==
X-Forwarded-Encrypted: i=1; AJvYcCWT+nKKpZhXABmVKaqyefyeV4QJPR21WVjiKExjjbKNnh4/cKfwvO1sQV8QxoSEr0nMAoIC0sfQN8WuxS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxExKFl0oEU+l7A22hqzFMxmb2CKcHe62nfE/Ce/BiEpYqeqzqS
	mA8NlduOHsE+I+rDfu9UfZV+fZQiFmI7pxix6oT2ud7wS9TDW7PUXw35ODmxTqfXGpbcTlhhd48
	yLWxJKXewGJ14nBzF+mdfXVU+QuqiW90u6kd1Mmv4XQp54XY3+LPhL61DbXkBszu3DZQ=
X-Gm-Gg: ASbGncvHKd+53QcAWqBpacUcZpO5ztCuhvlMDvtxur0R98uEpQcFOlVtKxJwHdem7Ag
	IXVXPASktlpoQNEfJSd79iWj+fFv47hx8VOtZEkzVgTH34zYcIbFxAAfErGR0Y5qfgBBrXKl4t2
	ivfpmQKyiCXXLvG4cYg8A+aisKMxnxA3HYAGhlOY60uZ2RyjJwpNKgF8Umqgi07DSV53fr+2lxW
	pV1GU7ycP9VJ5Avo/UmNlF7Q3imW7hgmFuXsHy/LIZg2+c4swxeRQj9KMiFGYVkmRfk/tiTXGdS
	nBKVU0KMd8fGE4zIJQqqwZxuXeBKdoX5rZY/CFUZu7aJRCoupWMczChf8+at/Hq9FLneBDMqSj7
	4NEA=
X-Received: by 2002:a05:620a:4390:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d4438a5772mr187163385a.0.1751035865327;
        Fri, 27 Jun 2025 07:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNBrqmMSfnZF56yQ8HHV8zsPd591TqWYeI7+RBqNhUzZBbf8gF6QKBgxQqjSPo5Eech9fVsg==
X-Received: by 2002:a05:620a:4390:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d4438a5772mr187150585a.0.1751035861886;
        Fri, 27 Jun 2025 07:51:01 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c011desm137341766b.101.2025.06.27.07.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:51:01 -0700 (PDT)
Message-ID: <25ddb70a-7442-4d63-9eff-d4c3ac509bbb@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 16:50:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sa8775p: remove aux clock from
 pcie phy
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250625090048.624399-1-quic_ziyuzhan@quicinc.com>
 <20250625090048.624399-4-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625090048.624399-4-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMSBTYWx0ZWRfX7wxn6PqJFrKz
 ZJQvoK4Pe8KstY6a/KQPe2CMwSevPqs5ORp3fKhONrM3GR1VRxrmnZeb8k88W6FTUkHeTLk8jal
 hHAIEFpq5Jw3zX9O2az2IXr3vnEZEbEjUi61QDursJY1JhrWPr57UHmISp48Inoq6j86EQm86ZU
 75dUTS5yBI4/5k5A/JMAyytjlaOfo56xRGArE9qLrtHYm0Eihigg7M94yBAG0mWUHMIfokJKGgJ
 ED35KAYB0MFBEzZd2R/Mcdbyv096ValDXe4kasuOxW3mA/vf8BX7znrKMgWiYbbQhxaVH5tjgO+
 Mvo/lGr8VuQYWAL9tAyZwqbZEk17zKm47OsOgX1s9saM46wmPei16a64c1df2MoJ2YAWdeZIvKp
 kPdoqmXlfEWJeW0iamFdY7fH8TXBnrLCtixU6hRbz5brMcgmxYgrTK+I1XkZQZ2X8EYXqQ0h
X-Proofpoint-ORIG-GUID: YHEqVcHqy3IHDf79bJ5ZLQ3fWy10k4md
X-Proofpoint-GUID: YHEqVcHqy3IHDf79bJ5ZLQ3fWy10k4md
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685eafda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=flLoF9dUt9D-64fZ2z0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270121

On 6/25/25 11:00 AM, Ziyue Zhang wrote:
> gcc_aux_clk is used in PCIe RC and it is not required in pcie phy, in
> pcie phy it should be gcc_phy_aux_clk, so remove gcc_aux_clk and
> replace it with gcc_phy_aux_clk.

GCC_PCIE_n_PHY_AUX_CLK is a downstream of the PHY's output..
are you sure the PHY should be **consuming** it too?

Konrad
