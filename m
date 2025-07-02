Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2C247DE1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460353; cv=none; b=gMm/dRTcGyU7HbSpAbp3ybyGdQ5kQ9vgFNoFdl4ERxZEly3WZ5mlO3skLnNkqPBWdXLdv6WU0F4cgKET25ZQUL4OXGxafPOPfhSQBcJt4NkZ6zib3uAKG7pSKYOEXxxT90r5HqFdCwF9gMAQ6OHQQF+X1PEfUOvFaNFzVpL0oAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460353; c=relaxed/simple;
	bh=L6hhUirJkO/7sMRAQX56jA6n5wv/jVQ37SKFMn2Twmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEKJ4SmEjnbpg0kW3EAGNINlvi6tPsIxLvHoMX1w+D33aOjG46UV08uFjFsiRYIaLTGARWKNa/YekEkrtpdx5LK57jQJhTOUJGYkWR3tQZ13uGa5mpFkylzgJn/dii1Hca1EeQ2tHzU3jlSB8+KbFC2SCEm1lgDlQGMl0di9M2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/5x6WQx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/5x6WQx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626Kveu032399
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 12:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aPyaghMl71l2+WzfUFrAleiaGBW4YqofoCOldr6ncM=; b=X/5x6WQxi9fGjLKr
	rheR6uxLJBHs7sCO/OqCjPbI3v0159zQ59jiEx2Qc7IbQiRAGxaVHL0f981YgjQI
	7/vIXPtP0KlBPab7cdrQHK2+O9VmDiyjnNNNNsgVmw8n8ThUcie7QmffSJMRH7i9
	T1pnTkMvWCYnjc+s/QjUbIlnsY2jRBcvlbc9VXR+2mFdCGhg4N8aS9ORaHfZytdY
	EBgwc1t1uTQ/qmk/kgtIeaqDJ+XatGLU2Tc6mpy6XUXk7n/ksouzXz7TZ6fdycUu
	bRUGaiDbIiWNWLRJIit9T/a66HJgcWUMOMGZybp2ZVLzCtnbORFgHWkQf2klhfD4
	z4OiUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kcrun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 12:45:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso218851585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460349; x=1752065149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/aPyaghMl71l2+WzfUFrAleiaGBW4YqofoCOldr6ncM=;
        b=BQqiaa6aFuaPERKrtsUfRyeGEN5VYeHP0kHjj6WETPTXHNO86LD8PF32NFpAQCgRQX
         W07VlDHS8H5yrpjW2uX8bHLcm+026afo6H3+puR0Gj1raQhMeAlYcIvczBjWBBb7MvqM
         vbhMa9I1BmFn8R4qg30lxeYsfiUuRcuA+H1GWD2u2u/MBYFKq54aJmz/UbT+OHWme65f
         17xGUvZn6lxWxvFHr6IybBeyt22nxg33BVKGImqu1/NQz+yEudu/i31AVy98TWAUEjDE
         RyU6DgVAlt+Qk2oWuG4g0cE8Mmddjx9nklFFwgMb2PttQqvt77Iw59jaVqkN4GrVw40x
         hwnA==
X-Forwarded-Encrypted: i=1; AJvYcCVRDERB2eklJlEvo2j+sswOmG1PCx1yemd9Qcs0VCeocu6Lz/6ltv2KGGV1Qaa/EEKNoX4aJjYeLX2eNSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSTg1iRnRi84D09zI+dG0eEVg4AoR4DJuPKwO33BTpagmPmfCZ
	uNQwzh4C0hsFAP1D6IFnU3BAegS3ZoZB4ECBvwHiK4xZFq5RQBf2I/SyWtzu74Nnu0/M38QSfG3
	V2sX9Z96QZAgopZAWNzklRls69dBs5loq+xSUEIjWWXGnaqV0qFvJPjogn4YHXEmuPpw=
X-Gm-Gg: ASbGncv3pUUbZMUp0jR3v5rqqwlqHQ8WAJc5WBiLugva/O5gLQxkXXUbCk2Oel4Cj5Q
	fPfFnuup9A/9z0893/fy8jYCDLJSq8GkwQlWfZLTCrs/MKeGF6K0yvsb+3bUgJ89pzsic0zi2XW
	B4PKJzniw3hrhV3PY7vNZBeAlSBBXzBHVKSzFpIcxVEofNJZBitU1eAu6u6/XtgbUG8ZaWsbuos
	f8FLMEstd4ac0PIZyUWni5yLPsztp9+NOFxfe2rboxMw79S468375sISAuhZYO5ovcqyiIVkkIA
	0YxBqEkRCgk4sQtSqVxveR+17jc9GElz0yyFbZ8jXtLntJP7twSOK0+a3KacuJSwCi9wuEuTh+y
	MX9c=
X-Received: by 2002:a05:620a:3954:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d5c471292emr162613985a.3.1751460349413;
        Wed, 02 Jul 2025 05:45:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGenMXUQ0DABCm6z4G1Os0/aj+Iw9lPISHCubjt8QuuBByfXmzEI7utX9xCWSS65elyzu6UuA==
X-Received: by 2002:a05:620a:3954:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d5c471292emr162611685a.3.1751460348937;
        Wed, 02 Jul 2025 05:45:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bfafsm1081492366b.130.2025.07.02.05.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:45:48 -0700 (PDT)
Message-ID: <13046a5b-f66e-42f6-90e3-17f7adb709b4@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 14:45:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: iris: register and configure non-pixel node
 as platform device
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-2-51e18c0ffbce@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-video_cb-v3-2-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686529fe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Fpb8j_qVfG1HvjMpLOEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEwNCBTYWx0ZWRfX9uifZqT0FtV7
 w4GPHik1k/AftJ9I1qq+s0QL3bCLj0s1tB0BPEQd0prjXPvVoAVJTvZWP3jHzeG+3k5Yy2Fs3CU
 fNtEQzmOh1Kl8LhbG2gxVk/EUJ4ClHD9zsxSnqozuXKt9fCa0aE7oYXLItSnpbvvNxjifJA9Msf
 +WYlQaU//xEDxUyBduB/HSckp+bPnRkyehKCORQF3+wka4rSdwAb5w/4KTSfIMuIyQgoPeXRqyn
 veBC+9G8tbNR6aMNsvk8NlDUfO78hSHGANX4PNBdJsNwLQxYCWM1yDgAkD8itJVkEiVQ7X3vL8r
 S41tKkFSmGESLMd8AjNevvWegzJk76q0RG0WZAeUXX3tEdVfsJat3/mH5A+2gcl/HJwsKrJ3LJv
 vyiuPZSrXnvhSfi2UNcHnqCu9xJQnYlrSRoxCsX0CbDETTPIpWRzfKD46aHmYZjIRxp49MDe
X-Proofpoint-ORIG-GUID: TPzcOfMiLzwuDxa-EmZJ39nN5lIsqqGu
X-Proofpoint-GUID: TPzcOfMiLzwuDxa-EmZJ39nN5lIsqqGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020104

On 6/27/25 5:48 PM, Vikash Garodia wrote:
> Register "non_pixel" child node as a platform device, and configure its
> DMA via of_dma_configure(). This ensures proper IOMMU attachment and DMA
> setup for the "non_pixel" device.
> All non pixel memory, i.e bitstream buffers, HFI queues and internal
> buffers related to bitstream processing, would be managed by non_pixel
> device.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---

[...]

> +	memset(&info, 0, sizeof(info));
> +	info.fwnode = &np_node->fwnode;
> +	info.parent = core->dev;
> +	info.name = np_node->name;
> +	info.dma_mask = DMA_BIT_MASK(32);

I'm not 1000% sure, but I fear that with the current description:

iris_resv: reservation-iris {
	iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>,
	                  <&iris_non_pixel 0x0 0xe0000000 0x0 0x20000000>;
};

this only works by luck, and once we introduce a platform that needs >32b
address space access, a change here will break the existing platforms, as
the higher parts are not forbidden.

We can work around it like the Tegra folks by filling out the upper size
dword, but I think it only further makes the iommu-addresses binding look
silly..

I'll submit a patch to (in my view) improve it soon

Konrad

