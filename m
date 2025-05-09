Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414481482F5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794274; cv=none; b=svYbpPa5/gM31Gt7QvBo1YKhuHNn7b5jnVtIj1NU3yDigoTQV5EgaVTDaVvlNN3+PmE+AspIx3HjQT/57BTCoCpxK4/1pO7FCvlJ4z//vjTXq6wvrHAO6wyqnP0foQxZHRUc3/URrK2+HEDBGC5KpT7/jGA2hYSSS99Xo1k2AFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794274; c=relaxed/simple;
	bh=q8WYlRRYDmoGB/cSFOz/QAzeVTddtH/svGSUExvDNsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gzaiH7MMyxHUL9SDhzQBbVN5yYm7cGSlC0krT9JaKYG02JDNZBOlTW7KohwIbwm+e8FliXRQUnjGpj6La79JP7zLlv5jdiv9Y/FZLDJm0IOjLDURifM23U0m/Le3sUXzOQItfzoDIJzUcktyvW3NWqEeX5AzRLonstGAVNkF7Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhRNtL3o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhRNtL3o"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497URuB020438
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YwvPt4t2OCvE2vssyY5oxLacKQywQ7VxFJ+NInkStNc=; b=YhRNtL3oZAzp5W3F
	V3D+oiMMj8Pde3XmMUhdSm/s7MFF6zNsmrAc53Zik9Z0M+8bUI1X/6vu6juDC42r
	9sQI6Nfv/zrFzaT+iNcTWkHBEJSO1S5wTtqE/5IViUs4f2uCFGFO+tDje756za/g
	p9XWTPwwvAhsgIDVvMIa2rhJyv+qjUzHUgaHjjiEwAi4UBscS2TEZ7LTGOEn9Rvq
	MPX4pJBFQ24Jm1pL5VAqc3HScS6xUEYwUeIJ1bzTa/gYJ/YkrANbx3EIFu6AWQA0
	33QAMN12pTWmXhk+dLiEoEMfC8O5YJ0/yHjCK/+eEuoVHOBLwXgTDuYB3GjdXWBG
	NAIuig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj43q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:37:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476783cbdb8so5358261cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794271; x=1747399071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YwvPt4t2OCvE2vssyY5oxLacKQywQ7VxFJ+NInkStNc=;
        b=W++eTh5w0vjdjmcsh5npXpQjzJb80q5cmR7Xwa2sg5E62hIvogFZaC1P4cdciRvVFF
         eKDdo8kr/RfRsZJUm26Uka1eCo4oagy4+1kSm61dTQ6zmqjTebubv/iiMgmjE8Y1xeE3
         /Ri9R7cg5m1p9fXipUQxQrvuBygVOCqPuNrBKAVkhlk/YNaSNNvXsu89Nzu0pRrqAaqu
         eXAUW3k3fDGC1SEq+Vr6iwXI/SBFQ6IgIoS6kt6JB4zFYJ/q3bBVSqI/3qbxQId07vPD
         EsJRdkj9/eSTPGYOrwg4bcq6PMomkQ0dGGd3X10n5N9H4D3ggSaosC0+06fknzd8ifua
         HGLg==
X-Forwarded-Encrypted: i=1; AJvYcCUUIVgfBmuMiPBRWLgGGC/GfE2wCZJaB26fpiNI1EDqFf1X2abApOj959CMrnw9FIaqP0KHZ8i/3U0ZAdg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+AmiULyWexOg3GXNxbukljUz0fz/nVIQfUuBkrXMYxAs1NF77
	KQC/cRfMxDJtqyiCXn2ua8qSQhHa2GmvrsQZJBsfZb8qk8SfVCIi68F38YiaAekyb49MI4lqNWF
	Z6aQwh5gRTRLL/JT0/TREg+iT46eBTpxwCHlGVWkCkFtEJ7Hir0O3j6UpSSKbazY=
X-Gm-Gg: ASbGncvj0Y2bdGpTW32HQ63oLf2IkTROd56Rr1gcWGNxTX0XSiJz/spuxVZ6F1p1AaH
	cGLw2o7GPGVAh95tcbLNNOGjfd/qhms8xXqnI5WZY1BnNjWQtaAzPHiCgPO42GibWNyLzHNqPRq
	qoDrEDJi3wjZwza4uHc0WufOoij6O2CTkZnyT7FortKXO+/dnTDI5E2/6d9ff00zZT64IeKVrOD
	Yo8eN8fNOSGK9xt/qB3+1EygmCjJ99YIE9L2AjNnnvRJV0a8nb//oaChYPf6r30fVTQhbt/CXX4
	619XGgn7zeEcjKoHcLfNfZs+t2TjQ6bqOXRCYDa60lVoIsLmbCR82l9e9nlSTbZV2U8=
X-Received: by 2002:a05:622a:11d3:b0:471:fef5:ee85 with SMTP id d75a77b69052e-4945280295cmr14540251cf.15.1746794270878;
        Fri, 09 May 2025 05:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERHUVO6nQzP3GMy6DlR9CXLC5BNc67GbK1LwQUmC7YI0zwpgmz8DNyH5I+IjBhgY5B1ZLVmg==
X-Received: by 2002:a05:622a:11d3:b0:471:fef5:ee85 with SMTP id d75a77b69052e-4945280295cmr14540001cf.15.1746794270552;
        Fri, 09 May 2025 05:37:50 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2198532d7sm143701966b.170.2025.05.09.05.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:37:49 -0700 (PDT)
Message-ID: <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:37:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681df720 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hjmfpjirZ_eXqKrHEEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfXwJkPz+1tmH5j
 jwkFfFP/vtEE4DJPwsFUt5zQ/uoLJWB0ERwunuOVtqw7luZ28/G1/hOwiIrvqeS1yVy7GhoVgKr
 jWQEW+3O+lSFUb/Ftug2RSp4slGuVvpC7drPcbAqwSHUtE1CfTn1Hs6yAVFTTa5FvlJFIiyAkCf
 3AB7mSU2bhWLfuLJmU5evp1dsjYMqjvdZ+RQCkn6u2/u1cX9TjgXzf9lZixoOLSYARqjda2dLlT
 AgLez+p//vFUyCeFpvzmtLQ3yMwKrxQuMxtXJvWu+05OYXG3v2RqK8B+kysHPppIQLLK+JhPNdF
 ZYK+gICxyqxb98LJHdcOdCQm4qkXtwVvGM2sztxgsaek4cVBEiCbJKdjScJXp4tSZy0bOI1JhES
 5mVXO90iqkhE/5Pje5jm2YincRf1nTmS0B0fH5gRgaeIcUct5J+GBWhEi94ZYshF7zotmYQA
X-Proofpoint-GUID: bHTgMtBYXdGC0NJQJSA_FW5n_NdM51Ow
X-Proofpoint-ORIG-GUID: bHTgMtBYXdGC0NJQJSA_FW5n_NdM51Ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=902 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090123

On 5/8/25 8:25 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> This bit is set iff the UBWC version is 1.0. That notably does not
>> include QCM2290's "no UBWC".
> 
> While this is technically true, AFAIK the only difference between UBWC
> 1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
> is why I originally wrote it this way. There's a bit of redundancy
> between the UBWC version and ubwc_swizzle bit 0.

It turns out to be a hardware matter

Konrad
