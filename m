Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7341CF5C6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 19:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644726; cv=none; b=j/82DWxPIAtxY/iqU2LG9jHQiQAC4+SlaVIYmOUCcgfrV8pr7z/bajgMmkIChkVEz2werzEcNV3RT/VqRhlw5xOOepU0p6tM6PLVb1bjZ4MtVWnAoLiQyxDT/C9iGwHfxXsKHltuQVMwaHfxbTuXGciXqgsjKlRqOvXDS6orfgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644726; c=relaxed/simple;
	bh=ArXRECZePX9nR53th53onl2ZCJR2NcBY5XJZ5S+hN8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7LnNIZP0NazDdwcIcZCNaGJq5JGZK1VoOod0xFAXgJGI5MgnE11s+0hJrNJXDwvHFnExVCJFVhz282zlVwiCK2RCCZTnrj2SRL4lqsYh4+0xn1qZD/IZ0qi45pEbLecNTsAX4h/RqV6OCwDDHin/O4cFc4D2vFMvKRiJ5qMW9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNgXu4BQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNgXu4BQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547AP3sq017072
	for <linux-kernel@vger.kernel.org>; Wed, 7 May 2025 19:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SHDmPRfAeDjssx8L+cu2l7LCPnVp2BGSEPoSn2MUB8=; b=iNgXu4BQN8U92D6D
	Lxf9aOjh+Vb2zIhmTz2xMpMRID9F5WtGLTuDNmZ0fWZjsLoOVBpVJJGGA3AyVm8N
	i5S6rbAo6tcwUIBENLofOj26VB0thosM8mqr1BtAZQ/bG6wW4mvKa3jkjkiD2FHN
	dCcI5OA3/Z+D0ToO88pqAq/lWKPC/Tqs43y06TrgeaHC2XRwkTGasAQAW79t8qbO
	DBRZRY5h/xL0PtidAbmVSy8GepBaUYkjv3tdj66Xo/hTuA9/oCsf8Tj6VInE81k6
	I8WSpylLhlVdpshdngSxHx45/y8XddFVgDKGXTNrLzRLWO8czpUMB6GXh2FH7+ot
	4bDrGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u46wfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 19:05:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7789335f7so1700485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 12:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644723; x=1747249523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SHDmPRfAeDjssx8L+cu2l7LCPnVp2BGSEPoSn2MUB8=;
        b=Z90pR0E0MQXrju07N6cXMLPEe0KsnLHLFnHM1KPkH9fUu0PyL1mWms70SvCY9harZ0
         CejoaqSPJJPzexUT5rHGeP1aVgT61trJlxGjP1Kedtxt3IKxv8fvf+uuyoXylRiE4n2Z
         E0Bnvk4kV8YC6YigD6pLecnYMXVjOtpAvkst/slCJAnVoMZd0oCZyVP98iEbZGMmbQDQ
         7xEbkRN48CpMiQbmMY7RKBe3/jA4q1L+49MTUlg0/JT9Y2eCAcLUOev8GIKVTmjVqY8o
         zvg9xsGjuioNNhNapgjmylYWGm0FzhtWMmqEleRDOdpQJjRD7J7HevUK35lP+mKkvJK4
         BMDg==
X-Forwarded-Encrypted: i=1; AJvYcCVcCtGThn9I3dzAb5A1v0FHtZlvAz6S28AB0GPKCfq3yLvAr1e+/HO6rMfqIbTWCs8hAtUvAPn4rOgdAq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTchBg+XxsSOcL4w4WHqDpGdeUjtBB76DC3q3n1eqPgNF+aczR
	Z7cEcXhRD0I8jGlHEevrYlovesInYOo9d/QqFQv37lty8/5BwR0uyyHxCMS4ukSRGAm+Z3HurP4
	OmDE4yQ+BsJAVt2XhOPIYeghaq2eRaOW5Wr4UOs01r1ykErC5Dz07UucXGqKEc0E=
X-Gm-Gg: ASbGncu65nZfNRP/dvsvgXzeBVFR3JxBVpa18wmabxvCZiBCUl1uUXCdFovRQPzHlUP
	89k+zssjhD57q1hZv1DeMbXENp5pq9dAvSS9C1pGy99tICOQF51nqLmTynyOhbT4OZ6/6Q1hJfJ
	nsQPuWIc2fRInz1+yfLlm9RsVRr8onqOOvOmjtY//mMxa53DmjnXUHUuxWRMbtABu2aSeNgxIhG
	q09yCFjx3di2zxzAlRQRoos62dJgMKo2DeArC0MVz7xPDUa/KegdC5cf947enXif/QTJQPNOktv
	ILO7GKoMiTlK3qQTBOkblJmb1qdRoO73Bwt+XVx/w5P58Wtw4ocCve7sKRaxoLZOGO8=
X-Received: by 2002:a05:620a:318f:b0:7c5:6fee:246f with SMTP id af79cd13be357-7caf73734camr275201985a.1.1746644722758;
        Wed, 07 May 2025 12:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi8oUmL4ldGmEKyWAOMA5TwxCGWZERQSSET3xMoBXXRc5YWp0bJOTj+IEY5QkdrpAQaT3HLg==
X-Received: by 2002:a05:620a:318f:b0:7c5:6fee:246f with SMTP id af79cd13be357-7caf73734camr275200185a.1.1746644722249;
        Wed, 07 May 2025 12:05:22 -0700 (PDT)
Received: from [192.168.65.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147329sm949542466b.1.2025.05.07.12.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 12:05:21 -0700 (PDT)
Message-ID: <e307c4aa-1dae-4d48-ae79-36923372c8e0@oss.qualcomm.com>
Date: Wed, 7 May 2025 21:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Remove MODULE_FIRMWARE()'s
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250507154723.275987-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507154723.275987-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681baef3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=O4ZBKxZU-tJ0OIaaHa0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: p-AY8m3yoqdvgtuCVC-aEfQKQ6K7d0Lq
X-Proofpoint-ORIG-GUID: p-AY8m3yoqdvgtuCVC-aEfQKQ6K7d0Lq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE3MyBTYWx0ZWRfXwleZ6jInz3EB
 xjPFVzIqQfpappmPZ23uF8ItadQ5mq4w+y3Ycs5tkT9EVudqpN7tCadxSosKbdsdpRsRiAMv0QD
 PsZGXkDuECexjzflh9AhWcbzSR1v7mTCN0iJEhfZMmbPGXFGh2pyQsXByEAvBlDkzgk/FcJmnGh
 2x2wxit106LjYi8rRCfusiGzA5OA4LzQlukfAW3hiE9SGjV/d3iTNwZkHptbwdSZ/5zXIFjE9lN
 p7JDNpSPNpBArd2M1qlaEMHNFzn+W1UhP8gLeQ628Jc4OOdQgWXZNy+ogADUGTS4SaphqQ0v4E3
 gyi7TZQF9CBZ++tXPuoodNrXtf8Zk1fQkUv1YkTDeaoEqEyae+fvOeYH9q8IPi6NCNB3zJz6n1t
 v2zyrTbs6CUCAvo/543l0eXtFNxQ8M3okMNomDN/04yf+SQqJq0vfEQDn4zmhMXNs9rkQvy/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_06,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=844
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070173

On 5/7/25 5:47 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The driver handles the case where gpu fw is not in the initrd.  OTOH it
> doesn't always handle the case where _some_ fw is in the initrd, but
> others are not.  In particular the zap fw tends to be signed with an OEM
> specific key, so the paths/names differ across devices with the same
> SoC/GPU, so we cannot sanely list them with MODULE_FIRMWARE().
> 
> So MODULE_FIRMWARE() just ends up causing problems without actually
> solving anything.  Remove them!
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

it's probably the best decision to avoid all the mess..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
