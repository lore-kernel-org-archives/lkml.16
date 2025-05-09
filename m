Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDD018DB01
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810047; cv=none; b=uZs1aB7bHXje0SIB2k4pinHwad2ViMhcl49+9oYuP62PfMtS1YOekdFBeeCJiZaTm0gQTtv08ma5EIQxbPkyQS0/L5OFs9G+d3euJUWYSYLIPM1m6YFHtYp1IJ6IVy22cSnvBYwTBQXppaIUIJWAFF4+vRR7Wm/vBAaduVVM9RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810047; c=relaxed/simple;
	bh=cOz0ydPeVV9Iq39xgSPb8X7nqzHTwH5x1vS4FU4qOjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4jhItztGFzLr0hix8w5ChJusKgrwGcIE7jcjNycIjx0S3J5SuWOveikL9RiKkbwPTCjqtZCe4GD1DYBNzBctipBrTO6kgedky0a4CuSRtztkXvC76SRtY3Ya7VV+CJm4T+Y9D6sFbUzmCeULlQv38QVtcFWThDxE0n9p4kXAPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XY/8Tn/a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XY/8Tn/a"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549B51jf014112
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 17:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZCclbDtuXk9uHIUI669lCG2hQrQh9WYUvwIrH+clp8=; b=XY/8Tn/aYV3Ofq9X
	WU3p+L4S1yA/xRIs9s4IGEGI1zc2TqjVJklhJVqHWjz90ZD0pMoaMJ/AuMpSlHC1
	t7fiLaM/ROGzxy1Kub/YFNvAQu8hNrBsP0rWud4eTvd98K/zllLMeuG1tb8c/jz+
	5f0zJOUBlSgp4AnKtK0JefzmrFZqmqd64dBEu0Lo1gHLOWiLgxClV3ZteRS7zlMm
	qedj9JXW2FFrfcq4OIM9N17NT3N6YQJXf/qAxeycLGTfcYbwP9KvBxk6yH9Xk6fc
	cF758Lbgyohafe3vhgaYCEaUuPSAtpbA+YdVOH0syJ6p97ZBoGojP0CuNBMFQ48y
	wJ1QoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4nbye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 17:00:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54be4b03aso51050585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 10:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746810043; x=1747414843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZCclbDtuXk9uHIUI669lCG2hQrQh9WYUvwIrH+clp8=;
        b=nMs/IEity0VNUZJGufz3TCOFTqZO5YKIi9qQ4KrUZOxswWSJMH8m/X/Q7Dg4vuyY+c
         0HobWQH/Y6t5Tz+MDsgHrRBUDh0fkM1NUsDGixJ/TIE5Gcr3QlKPJXCSpU8snF1EXE8d
         uT0cA9BNhtGFT0iIKhc9jYNeaCLMxyMibP98FM9PUU6VqRvSBNzEti2m1lbY5cMogLXV
         8P03qyF9+b6jueR1UoVcM0TeRYhj02v33xrTwrxVhhdoUghW0xU4Mj0Yz8KFJwoYFwSf
         Vridsad67tGqPGQDm6ahP4/3TujYs96PbA+CjcUjSnU2AAbgZrlXQBd4QrYxmTC0SH4A
         QwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF6SQX9/Py3Dc8F3WN+t0UceXI56pr2YckdBwA87iVG+lHPTHCXBYXNEzSf8Yz/EycnO1W5MdhqHMlBwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+1hRtVFGHxX+XRfmrUDs3JNnewMxkH41ufCoCGcSDSQ+2QaHo
	+aNh+DeRGA+PYKSCw3Lx+dVZ6MzV7ttEAlR4YKa+xObjIqD+NTm1GmeV75C6LSuDI8peg8yJfk4
	p0yhFYOyhevO1iF3XD0XEAClathMfqkytsdm6SZOvks3M7wc3bgpj402CS7ahuU8jMzzzhGk=
X-Gm-Gg: ASbGncvmPoMYYK0bcu8ECh3jMmcZujBfm96v4DUD2yRbH5c5/wWXKW2kLf1jrof2cWd
	oxNZ5j9DDoqizohOOgCvf8VZGmPOu0FNZsEmvGKby6magHHwDqVcxndtaTj7i3+sMymN2FqQhGn
	BarxGKQo5zgY+78lzhiRCGo9lwjNdHq3LjrRldgIU2+nwoCbd8PQGcss88mMkb5hbLKtSqZRzOP
	ToI8P0xXK+PqTehNUMeoYJzCQa+ZSfz8N7jBEqo5x2qf1G+jynfcPXg4LIQYJtt+AJ0wr8HzUet
	FfMXxLD0Gab3ottRj6E2ABBFpN9XcoBbMCHHcyFJ7nKV4HSuq8cO1QwVMKVbgtN/kmY=
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd01284a67mr256688385a.10.1746810043215;
        Fri, 09 May 2025 10:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsdbLUhxiiEOyjW3uhYLvePup2YHDZuESeQh4lqLxFOX19Wsqo/GBeavRtbTUa5Ayco/hoSg==
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd01284a67mr256684485a.10.1746810042578;
        Fri, 09 May 2025 10:00:42 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8b8asm177791466b.5.2025.05.09.10.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 10:00:42 -0700 (PDT)
Message-ID: <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
Date: Fri, 9 May 2025 19:00:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
 <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
 <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _Pvr2kETOpc77hxSNjGi_E3VYfXKVgXG
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681e34bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Z4pxUwbP9fZFGfhsnTMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE2OCBTYWx0ZWRfX8Zgv4i8BkeVV
 Vu/l7hKbdM4y8jprF4sVXioLpGZjq6n/3pC6DiU6DxanOyKdInO8CYGXvyzn20Zs6u0LdR0Tl4R
 jgaGUFU9m9Fk0chfRVesWZzIwxcUmXHueJVkKWxhnz/RM5DdSp6tyYn2wCmByQsU1AP2LlGbH/e
 hEHxn+UyaD7Kz4RZqPc8mv+Y4D4uDn8ljooMSUjWG/I4ixqKk1M5bDpoBuC+Y27Yx2c51UNSFMZ
 ACLYU0i8bwIpmhj4wyYJwGFm1JaHYizO+oiQTDsbGR4y3iNrxSUBa2BCm7sOrDJXXP+q15By9xi
 3LKUtNyqqpamyxDjgjpVXRGBqan203yYa8Qc1HqzcFSZtK2+vC1w16aTGk0jg8urlqTo+Jlvrdv
 shsNKmyNd9sKFT8fi8gLaKi29O21LoJ5Y1HJirFWqA+Q1RalQR7ZEK9xc30IdtUyV9EuRN6d
X-Proofpoint-ORIG-GUID: _Pvr2kETOpc77hxSNjGi_E3VYfXKVgXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090168

On 5/9/25 3:52 PM, Rob Clark wrote:
> On Fri, May 9, 2025 at 5:31 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/8/25 8:41 PM, Rob Clark wrote:
>>> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Start the great despaghettification by getting a pointer to the common
>>>> UBWC configuration, which houses e.g. UBWC versions that we need to
>>>> make decisions.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>>>  }
>>>>
>>>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>  {
>>>> +       /* Inherit the common config and make some necessary fixups */
>>>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
>>>
>>> This does look a bit funny given the devm_kzalloc() below.. I guess
>>> just so that the ptr is never NULL?
>>
>> Yeah, would you prefer this is changed?
> 
> I think having an all zeros ubwc cfg isn't really going to work
> anyways, so probably drop the kzalloc().  Or if there is a case that
> I'm not thinking of offhand where it makes sense to have an all 0's
> cfg, then add a comment to avoid future head scratching, since
> otherwise it looks like a bug to be fixed.

So my own lack of comments bit me.

Without the allocation this will fall apart badly..
I added this hunk:

---------------------
/* Inherit the common config and make some necessary fixups */
common_cfg = if (IS_ERR(common_cfg))
	return ERR_PTR(-EINVAL);

*adreno_gpu->ubwc_config = *common_cfg;
---------------------

to get the common data but take away the const qualifier.. because
we still override some HBB values and we can't yet fully trust the
common config, as the smem getter is not yet plumbed up.

I can add a commit discarding all the HBB overrides (matching or not)
or we can keep the zeroalloc around for some time (i'd rather keep
the function returning const so that when things are ready nobody gets
to poke at the source of *truth*)

Konrad
