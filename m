Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD75146D65
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566217; cv=none; b=VFZUFUvJpMgPuQSnb6wOjx4nrODAAZA13/a6kmT2JG4LdsnEiQbhJXuTE9MQDxxL8TGdqWxkO2mZw4b383qVDcPMo3XauUp1PlgrPTpd7vjIEY+p9rMLxvhDOa1Qg5CDizCnh85BYG/Lg1jCLDC54j3cvHWSBNzPRTcgKScXZLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566217; c=relaxed/simple;
	bh=z8bTv4mLDuRDlO+FaPlTDYKUXMESgx/vu0DK4Il2gU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQTHzui5+HJrWDApdUnni3wbRRh10s1OX41aCgZBAS6Dlx96GlRXQHNSFmvuJFODOZOBsiK4eHkdQNx23sA/SrHFNcevdxRLCad65EPjPZccfxj/RPiu66Qgt4QxbGj7fvTrdnTDOcOoTJ+QVTHRYXREqPeJsIEVaPq92uRMHaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn4SUFjE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn4SUFjE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8W5js006266
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=; b=mn4SUFjE8MRlZ8ke
	th4z4VSdiSRULhatOTzsxH3y97c1zG7QDfIUZKTm/6V7IOw8NTJXEcce9bnlNkqa
	dCLMgWGT83cZ+cqcYHmJ1t0AOAJp+mIkzzFgGlxhI847Sosgzv6wmT3F56XbzxDq
	c2p2JWle1/byMaVeY9OiCTu06028CUH6HFQ+pJdZxVYxs7U4hnb9HtReEdkxIQvJ
	ENBqgx+f9YrdpNbPDQnELhIYRDkrzTeHi5MwIOiHy9tpTmTXvzOGgWQUSyyS6acy
	88+43FAPKs6bOFi2QEzWcinAkUqHruexI4hoD8Eo/hdnPfd8c3UxCNHFY/AjFLIe
	Rf/1+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxt1p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:36:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso95859085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566204; x=1750171004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=;
        b=nI0mvrMDXvDy2EzgC+N5B5Gc0lxhx//DcrKl/Oo9qiLkdEX+a2Nxvvh/CXNXvUtgBB
         8KnrB2Z4faLyFi/cWrQraKe2Py6oN7j0sPpLOYs6QtNNpSPUzU+WBSrG4ELq+rglUzht
         XGcpt6XeB/gJwpGF9UfD02YKCw6jmRFrTubHgIJiOKLWIMZU9rdHNsEZwojR9Hdv5yat
         jv12DvfWixJY/Tun7AHAl17h1RGM4N7kfjlR2q5+3aDGc1J04s9ACQdfBgQYrTcb2k7X
         Z0HFzwNtrDIGkZ1AuDSonuNHnCwwlFJypMdrdO9nE7cddVyntOJ4ztB1jIrLC3my036O
         cGrA==
X-Forwarded-Encrypted: i=1; AJvYcCVX8rtBTODfUSMkXw7fG2o6Tt4yujZ2TDQ3eaZYzdVFTx+xqB1K//ZpqXbiQAqYSDwwSKCfWK2b1/4XjWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YymIiHbGda7BTBJJLTJQYXBhbpAXDrqz8J42QtoEOAA7fuWtAUV
	lAjlRVIEahnXX9C1foyAKs9ucTw+G7Lc7mtUdjzPv5cP1wLFkrRc7Mf8UctPbOnGqwxruNHkFVL
	0g2Cbx7hhPpAIsMu+qj++WYGOBTKmQCCJZUxPe3+Yc/hGzGV2Fcu0WrV2egrrNpW/Fhg=
X-Gm-Gg: ASbGnctTheFNi5PXoyhgtlIq8rRBfkaN3nIJIXVdGj1JVAITTwvuEX+WCkAdWdfwC32
	7qTavQeBMX3zPVZLb8W/fIHI55E47G3OhO3tKRv0Q9iN//ktCCaO9BA4LgS3KOoR26IrdRtFnjT
	MAUJsXgWL7GZT1hD3cKSpk0QDfgu+bmXZsDaEPHdvVBP9tfFgczdMwpbn8qkQuNpzPSU49Jso+n
	aZUvP1gdGXF6IMOIa8byA0aSWp9Y3YGDZGXI+cwYM1BgcQGkkJM70BRW5lgvSj7g1Ups49eV96N
	KRs+pmwNQCEIXewMrVu6/EYWRgzvRKhQsqz6XzxsHY9YmDk02TAMzoIFZQlE5fOoP5b5JNNclXk
	p
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d33ddf703amr932427885a.8.1749566203901;
        Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBbQ7SHFJAIcnH7aGz2wAofoXXYsrztV5V109VXWdIgAcLNVnSvMvyMhOqmTXg8HcgDxWrxA==
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d33ddf703amr932424885a.8.1749566203410;
        Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7542c8sm734986766b.21.2025.06.10.07.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:36:42 -0700 (PDT)
Message-ID: <33fe6caa-6720-4af2-a0d8-44b75b6792da@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:36:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FGHcLAQRGXxeAcChX_azdBt_tuUcR0rW
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684842fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KtEEE0qNWcsMKkko6jcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: FGHcLAQRGXxeAcChX_azdBt_tuUcR0rW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfX+Wi+fKh3oJX+
 n8QXydCNNnZVw+mKM8OsgYRB0BI0XonarRPMvv/cZvWoKVNb4+BGW5L8FHs3LFg+3TseYqE0RUS
 L18wJDw4BRIP8jfuNf0Sdcq7xM3qZeEZob4LEOUWI/j26WwhR3JvlbfuOU9OARncOagcs78sfhf
 7i5S1wzy52A5Vo7ZggGgXesRSxOm4qjL5VGEUtyYEbkKiOxi6xGL7gSGuobecOYUzw0Thbs2a3l
 YPYEieB524Y/6ofTuhk4c6mUCgQr0zRpLT2yulzx3HVSW3paig7GuuH7mZwzIpn3bMevfROggrT
 4LfCD81YItVWUm4xktmN4HurGtmFWczbtasP/35kmj8Bfycs3LJTds55PFCnbuueIChdFLieiNQ
 f+fN8tEgE+SFEA033/NYXKdaTewvVmfYBqjvu4MMfrZh6UfPfxAHNdCxhTexHn3uK6j//eXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=933 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100116

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Matches what I had running, I don't know the source for fuses but
I trust you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
