Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E461DFCB
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751119265; cv=none; b=n8A3KFNUK2gLy7eqS0q2OSVVS6MerkiiDtlThF02WR4PpGt2GMj9E80YtL0o/2om3T/CTJ7T3vUdZa8Culb33hgjB/fKZkKhyi12abr0pPq23QdTiKGB/zlSEU5qgcNgvfqgWvs5ec+n+t15AkiDMPKHtnXO7OYeh/lwamkP9mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751119265; c=relaxed/simple;
	bh=zsnb5IT4Nu73W2mBBV0UdtW39RJlWO97Dl+DazBOnfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cnxa7ib1wsaygKTpw71FRpyDDiDKqPSj/8EqzfJDoobx277tM+WG+ssHfQCAvT/FKyKsMWgsLC3M9LPFD/NtsyhIG6Lya2LgzSPJCVnSIknvgtrNVpSi/JoCAIgRpnJutvbkGgtCeMjvO1UNE8inXDH8stThCGCoofUm642+YZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMMjvxsB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMMjvxsB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SCq2LE025790
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3JT6wnm3HmMSxPGvGdApEvmBmbOzlzJHc7HEBGLfKs=; b=dMMjvxsBPlLz7znF
	TyRro5S4OTjqx6mNav2awMV4rKk8IizEeJX5jI/W85puq+JPB/2vYVw+f5jCaYkJ
	Bn5KtLfE0OHjQqkiKuN6Ht73GvcydlfDxGVZSZYLbnPooHjHCAPi4bVrB0PXnm3P
	8zdwPX5SrEpo0+Cq5SUltCZQpwFa1xfqMeqpVPaj2k/+A7Utz+4uh6DiidfFKMh9
	8kYAK+k5wQ5X+eWVcBRRNIw60QLruk00nuzKgh50oBG4f4x90A5opYRd5wub88lv
	zkEku+rFxDtASDJW8nKrSo8E3BJ2x5toUzvN1JpsmdzWxKX3oP2vDmJyoROjXbcf
	XhG3rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801rrg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:00:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5b3aac5bfso8896361cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751119256; x=1751724056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3JT6wnm3HmMSxPGvGdApEvmBmbOzlzJHc7HEBGLfKs=;
        b=rkVPgHt65ExY6VITgqiX8ErebPqXo1KgC71Nlm5pyylu/DGE/oaXBTSTGzM0H/aCf1
         lrvnMhehb+v6RlZZsTn/F1MBw/Z4PYp7wIzU1f0mhbY5s3FWUNIxlJbfifrcFU8zwJOA
         +PPXbpCRqXDd/sBxwGpR4R7IOr4WCNY6HpbOzr+qEfWANVhgnnbXpeEr0L7K9kOuEO8p
         0iMCk7Zg8OUCp+safvsHuyt3igpRHfa0FrvAofjrQI9MFj2n+9Emfa2PUmCY6/yCtfWf
         32aSYbUMio3Qpyn934Zy/qj/vmC0XMTKqzA0kkMGSVw0LsJgr5y6Te/8a//3ZHpqM3Yg
         gJuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8PhxjGOHtV1vMM1dl2i2Ztg5+FZZ7uw61TSqLYpfkZw8vT4G9tjkF+ejxTyggUShu7P+R4DkwuB6vloE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWhiOKGBtEhA8xBv5q90DfIPOKISOeR//gvxNcRYpBDKX7Vg37
	NBhQR0mva+nzFxAvCqO+Y6oz0nOIQ6Z11UH3Dh0vL+epJRghELxd6e5qnTUOe2p+0PifPCZmz7V
	427XHTxT8OHvj1ZTnNs+kQqxkmUisnD2p8SwZWyGYrSLeRTSN/qEq4/WPFaNUn5WS650=
X-Gm-Gg: ASbGncuvsichLCFiHfdLP2KrzBKeAOeVhRNYXWDv9gxeQN7tony1sQ31BxQnSyAiz8w
	NUqji4niwwCUR1wx2CAhPIYvSwd7CM4o5EuSnMqenR8N/gy1VPVSV3qoVwwE4A55959z7j4YdLy
	HjGSlS6Gr523D3vR8NtpIxH9IiPo/l8Gaw888CAJNnmQOWk9rJBCnAsMvkSwQ6tyK3jzig6ecA6
	v2MAZ60yS6HRe6E0KfHf8cB4gNGtlig4V2ndbERxjtIZ/c3xmhX4M+N4zhaua6V2nQm0E29qFX5
	CaNbRpLI9CF5TNumO7ANv/qKkhqK7SX5Zn8lImKg3R44THvkBq+CgfmVmWZCSNBYgvOJzjZ0e2O
	gPrw=
X-Received: by 2002:a05:620a:2729:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d44c24928dmr146912885a.8.1751119255355;
        Sat, 28 Jun 2025 07:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdQ1yZeX8lDjDdM01e59r5DUWZcp4ZcpJ6o87OE6ncVesod8eJLazoWlAAUYkOLQCQ3gI54A==
X-Received: by 2002:a05:620a:2729:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d44c24928dmr146909385a.8.1751119254533;
        Sat, 28 Jun 2025 07:00:54 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0427bsm312587266b.84.2025.06.28.07.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 07:00:53 -0700 (PDT)
Message-ID: <19507b60-ef03-4fac-96dc-f8700f74c0e1@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 16:00:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
 <b7mv4u2parcyzrm67yufuor3cwx265kaoae23rksbbuu4aaayl@7a6xxfmganof>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b7mv4u2parcyzrm67yufuor3cwx265kaoae23rksbbuu4aaayl@7a6xxfmganof>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nMFvXu2Qh0V7xho1wOM-fFBogCxt_P_V
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=685ff598 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=QAmXqGSAIpqigZKsxncA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nMFvXu2Qh0V7xho1wOM-fFBogCxt_P_V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDExNyBTYWx0ZWRfX5yxWSjPI9/Lk
 RqNkA7a/CdyHXvyNjmwCRg09nNzg+Qjq35N8R9CSjk4vR0VyH0lG+NVJt71LzleQex44wxsDuHc
 EvntqFak6h3BXIqhrNjIfgV5Q3YRTYCUImNUByVRTVFH64PQDNd/JNTygSOf7eSMEM3zBWDF4gD
 EJ6bxIacmD8BzJPyXvsceajpQv7tt5Bd1fmKUQN4LZ8zwsdLohjJeUbNKwGC6fI1A38YvHgWuqv
 B7ZqregnwHqkZRaD+gIztbfeQlvyuWULumxioHC4Lenl5JPhxUChyXNDL1/rh7DUdSRyzT84DAG
 N3sFvcmtrSiiLZrDL3kfIhdkdjNDtOoFG7YmkrNBiLLoKJYb4K3x9GlbBwjtqXfmiCycOSkdhb7
 Ujwcm9kMSyrVBP90lQwHCMZNJy7f7j5+wx46gYjIrErJWf4mYWNPbKB4Nh1Y99EaVhBqQ0lz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280117

On 6/28/25 7:44 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 27, 2025 at 06:21:31PM +0530, Komal Bajaj wrote:
>> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
>> as read-only for HLOS, enforcing access restrictions that prohibit
>> direct memory-mapped writes via writel().
>>
>> Attempts to write to this region from HLOS can result in silent failures
>> or memory access violations, particularly when toggling EUD (Embedded
>> USB Debugger) state. To ensure secure register access, modify the driver
>> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
>> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
>> protected memory regions, enabling reliable control over EUD state.
>>
>> SC7280, the only user of EUD is also affected, indicating that this could
>> never have worked on a properly fused device.
> 
> Most likely SC7280 Chrome platforms were fused differently or used a
> different configuration of the TZ.

They were not fused for production, as I understand

> The question is whether there can be other platforms (e.g. SC7180 Chrome
> or SDM845 Cheeza prototypes) which should use direct register access
> instead of going through the SCM.

TF-A currently needs an update to the SCM MMIO R/W address whitelist,
but in any case, a write from !TZ is not going to be accepted by the
hardware

Konrad
