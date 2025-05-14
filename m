Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFD92AF10
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250178; cv=none; b=TzpNoV3v97+Stv3I9bg+GAAzM7NgSwYwtqVtVBnW4z2qvidDxwFAeaZ1Xxu2D2MC4J3CZ7YIhNPwMYonQhAIbPvILp2zKh6kXyiU32s4ii1QurWYk7U1Y3jJiAooozBlXF4tufqbWaC8vz/V9ksrQX9PMKEjD4gNgocqccEJGO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250178; c=relaxed/simple;
	bh=sWxwoINTiUROD4lu7fI1DNevVivaJ7bCBhxrqTdtQKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYNUhLSByCJbbAi2+5AJyApTMQMbMUgijoGaqeQxSn+cuJ3u/e14uKxqIvkZXf+rpP1GCg/NpMxE78ADUWhjm2qK+FInKWSooiqbgX9ez5aa2ya73dheO3Qz415R3KFh6cmnysMRPtah54NhN5ev8I9owZt5KjwyCjCjGsuDX14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lns3HHti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lns3HHti"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJ79lZ013144
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=minyAMejHL/JFJSA+xnqXanR
	0wPcS9nRnV+dThvhjwE=; b=Lns3HHtiVUtP/NGibWUj+J6urosA2DXc5wZXE29E
	WVsS8lufGfsD95s6JIg7kr4Q88QfY0i71mZO3BE2c8SLk8JHX4ey2BYJiIPPhbww
	t845x1xlxtpI102dL1j05C+927cduWGj/S4HLVV2KfsEQYEia0QCVYr5emZSBT9B
	BenrRNn0ROazfBZiHajZCUmPm7o7XCOk4eWkwpdllVtDginRxEd0EXVtyrkuWJ0o
	nhRkmuGlT9iym4iq5rggruV+YEknguQC1A5wQrawfcXMvF4XfX3NnYelfZtLCW7L
	XooLD23kpBlhYX4HdWtM496ctZGJA2jvjn1L5R2LILLY9g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmkv1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:16:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f6899cccbdso3811566d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250174; x=1747854974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=minyAMejHL/JFJSA+xnqXanR0wPcS9nRnV+dThvhjwE=;
        b=o2305fqTgKXzMvjuITaJOukoYyhfxT4LTKTsWNsv0wDjayufgFhUth7Oqks8UoeBW+
         Lg9mYDy1h/3gJmntknyBgx0ENM/2nT6Qqzyw706i6Q3pEZ9ika5A/7m345glMEmzMnXQ
         /lg5OdXXGUmFV9+Y5W5QoFh5Yh8RitCvUgB8NGYJAGlDC1pCVoZCWDzHoehL3cy1LRxN
         kQ58VSuPjmWvXGzmUqNIEPlCngCKF13ki3n6UrIDusYTGPQ4akWfxqhTsaKbw6xNCUxJ
         ajd2osdqoAq/qZ5Wr37L1b4Z+iOxyoV7G83bSQfyIlVcTE/H3rbyPMwisU8k1Hbo9Mxt
         i8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCX1iVk3nO5OSYPBCyWWe0RdFdrwQkuUgSL/JzsFx7LTjC/Ct6t08atMgOh5h+c5GaOXkbqoaBh5/H7Xm4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGwLuMYAKsXdT0q+HWpmVeWv4GU/DE+BDqwPZkRWdOD7/4um7r
	o2h2GgyrMHI/XIk+hnbWsE13+7qyHyG+MyakjbWelA81vtX8EauMaODDNSV5VUUvQb3V+TXjYBY
	+Iw4WQ62DkKF4YkpAHmUYMGXe8xYHXVNf3uwopXvStxATqAxAm+Cnuqc/hrBvo9k=
X-Gm-Gg: ASbGncvS38+PltIr1pMebfoQ11MRf8dPuAv5C1bTeSSPIJRVUEcu0VK/JffiCT1oZ/U
	HnFqScmKNd7kW4OahtzP7WdtvlRbJNDzf3I30Upak7ujtcgEmeC60aIyZLWIIqEwyjbKupi73Gt
	IQ/6Y1u0hv0mdfkeG0ZZyOS2aBTI3lb+LDKyWyvEfzkvLeZhnCAemivq2/vCFeHzPC/piTuZLAa
	7OjJJgWXGMDsDBVFC6eSHqu/krQ8u6wubShDblY09yKT+g4OR3PvdOWGZIxbLQhP646y5sXD1+J
	AqYStG+4TRXJqhVNBoU4F+OBsHtB3+rMuTARKdm6eG/kxfmC4fM712AYBisPpn72WJ7OwCN0xl0
	=
X-Received: by 2002:a05:6214:5014:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f896ed0844mr92862866d6.36.1747250172417;
        Wed, 14 May 2025 12:16:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi4OASQm4gJGGxeccfV1ldsNxSDl4KQOG6jMf/3jYLWvcUhPLkhO6KcplkBwZ0Dv0kasxkIQ==
X-Received: by 2002:a05:6214:5014:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f896ed0844mr92857286d6.36.1747250167947;
        Wed, 14 May 2025 12:16:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64beae2sm2343713e87.161.2025.05.14.12.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:16:07 -0700 (PDT)
Date: Wed, 14 May 2025 22:16:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 05/15] drm/msm/a6xx: Resolve the meaning of AMSBC
Message-ID: <bkcbfzkgypyghmugpg2lopxyp2wfsogrclaqxfwrflcceimj3l@lhv3dv6mfrw6>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-5-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-5-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX02Fnbc9iLPLK
 3whC2Fl8gvP8TuRDudTFvDBzg5CRZkMOYOMaylLtCGaPo2ze68jt4L9fMdlj7bKdJLu+yeI9MnQ
 dlqgbiyqqeyY3j9M8ILYiWa28sK4xea5SSL8J73q4ZormGGysFTKsGVZywJIXKX+U/BlgeouOoN
 ce9O2qTzvfgxUbTwmnDu7NfXqyVr/i9qrRrV5xC/VWZ4s58cZ10Wcrt//k51P09/iHpWhN7v0RL
 qj6iqZxmRkSAHzU1ngHeVwjfpUh4x9aHPIOQw1pGFdOhHU82TrayRgKw5FchjcqIyOCM25+qzWT
 Mk0TjMidi3aoLv3d1eyfWgU4QiTBvUrx4ZPKAYBzbD2Zeuo/4NhCHPYZM2Ga8LPh+bzW6EuOUs7
 pkZBKf0x1chQIhMRdwvBRwNsdx6Q7+yJvrTYtipyKJGPdHDcqC8ZNv85IIWjS7ypzj8bbZxp
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6824ebff cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UiqBTq1rjkrdqcEHUKQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: POiBZaivwFCiX0y-vS7NaiYbTI8i5wpt
X-Proofpoint-ORIG-GUID: POiBZaivwFCiX0y-vS7NaiYbTI8i5wpt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=769 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140175

On Wed, May 14, 2025 at 05:10:25PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
> as a separate field.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
