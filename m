Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476A9219319
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793874; cv=none; b=Is0+bwF8IkyifxKxLM7QDlDmEp9IT8zv8LpSNll0aH9IB2RFjmqwoLL5oj1Kebujm+YK0DJRTKioomqv0ZaEYLGZcfvh1Kznwwk9y2X1BhHWFY7c4QhY5iWj8WxR4JVxGGBN0tWelqS+Va+fKhJZwU+8jAJkhxIO9rVqp9R7igA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793874; c=relaxed/simple;
	bh=SxUSYOGEJ5GdaQB0YHzZ7AoHXc/rXS8j6Kh6v5G3at0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riS6mtJhafY4/Y7L9K6SiL4Mfa7+ygjAGgp2yKiMSklwpJPyMb0s6H9PUFgSt1u+QPR5YOzeW7BANNSdU/9Ht6BsYvUuosThl1271PvItj8C3PdmjxpJRdy/SJ9VL2ws3y7HRduouaSFA1TzKPL4zw1XzAabRSZK+UMs6tMcebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZjXYxWo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZjXYxWo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493502t031336
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhVhwGpfX7hQ4jGypsbkijEs/qh48tDmIOIDjVbBg1I=; b=kZjXYxWoB1YUebRG
	f6ccXE5+Sl/v7vPq99CnhIpu+kqFGVnlF+8TfqDZvKsW4xdvINzbC2J9SJZDFCgI
	Uq52JtYhgCoQ/2k58qAjNFrG8XdSYt1PBbprQ9nAUnzuD+6XT3xbOaNevnRxkD5Y
	ZLh5gj+o8YLwoYlvgaTgL/Kj4gB6ZzxyHyq/3ayjGQKAGZEXGiWIgem9IH63QY1T
	/t8JmeqD3fbZFM/DhiI0pSgGjLOFQg7S3bqZbcH+sLS7C67U4zolRQ/Xvyevc1y8
	X9g62UfAmSqC2AwXvhZHJ9BC78JDSK+lopbCCJmK8fFHdYKKi+0orce2K00g58pZ
	EHwiIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgmkux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:31:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47983a580dbso4246041cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793871; x=1747398671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhVhwGpfX7hQ4jGypsbkijEs/qh48tDmIOIDjVbBg1I=;
        b=ukj8LEprG18Y7+ZsR2X8lr1Qlg/LTKofYbZqhrD+WTacZGNcH75yLQpb6gcYoK/+Qb
         7g90PSXEBAjxMaqecqbezGS4naM3d6cbgdhU2RyMoMVgbQkaE6RnNblrUoVhmQYbZy+D
         OHQzzoLNfQfg5+CWR6p32OGHRAdpRHcz0/doCaorCBLaU+tUvWiayJKDIE6f34TP71GZ
         tvqNc1yDwiO33n731wa4LszNGONXYEAr93YnE6CvVg45EVVHgDEOW8fvmN+nxWCtPxfc
         J/LpVvD3Ic2lg0ExjDZh/5OvK5V6rLR4qFw2cuOMqE1f9OCn+Q2Shqg4ykVFeUgrL3SP
         YyMA==
X-Forwarded-Encrypted: i=1; AJvYcCVjcVyHYicHWhCY8UfM9EET97qlvRzXMkaMRgI35+gE2zpwPTIylAyCervy9z0Tg96EZjtgnaSaUaIS0FQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAQQT8/fXq59JM9pip6mk2Tu5YY2daN9kqk4FZ3Rmm5nWecXFc
	8iF8eFjxK7kKdNtaVULQnSg4/UnNWaZfYs/DjJhDYmk6rYdFWVGN53MmAzvTibq+TbTDBbBo/R7
	dYbBdOnYZFY6dkPFuXIwu0JyVdQOKWFH+XdLnTuX6KJxX7QQTw0oBpS+482huuLQ=
X-Gm-Gg: ASbGncsaQH4K92RJqqRkmfMzwybVfJVgz4vgrGsOY0gD9NIqXefDJVuBsTmuVUsOE+a
	d1YLC+DK/lax6KsPIKN6DzWYRQwTCDHQu5kezhz57pvlUVz/vWXvfeuhoWzXojPvXx3dXnU2A31
	tzttpUCAljG9f/+Yt/KeOp31n6nptDvoNm6KqWl667Kjp3yoEReJm9lBkGCwezHihK/2faQhiup
	lD66Xgzf1L2KkVXKSAH4nkwEpjHXNfzn7TLL6taKCW7XFdO90L6JdlTh4sUdN32I0XUESVmNwF5
	XZr8ddA5rSeRymUNn5BgjEu2+NQz/rRCcT/tjIN//tnSX1ketUzvhAw6c9t9MfhZ/58=
X-Received: by 2002:a05:620a:4710:b0:7c0:b018:5941 with SMTP id af79cd13be357-7cd01109256mr174580585a.7.1746793870974;
        Fri, 09 May 2025 05:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhgwqc5dmv1BuLfl2iNwP5xWwVZa7nyp8TxQ+UzvepLaRqf3krtNvF2xEsEPUvN4R2vKmFTQ==
X-Received: by 2002:a05:620a:4710:b0:7c0:b018:5941 with SMTP id af79cd13be357-7cd01109256mr174577685a.7.1746793870580;
        Fri, 09 May 2025 05:31:10 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70d55bsm1302110a12.65.2025.05.09.05.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:31:10 -0700 (PDT)
Message-ID: <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:31:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681df58f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dGexCodceDVc4I0WR1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMCBTYWx0ZWRfX3BgiXWxruHAN
 Y57xFZTagmeX3k/5EBRj9aUGaLktGww6R4JTleFsvTM3UrzVm/A4HkvmOftn33DQVV4vC+t/YxL
 MWTTOHq8eBsShFCb/Vixv8n14iznRDDnJso6xgGOcedKR7F5jGqt7P0qspD8h4cGTr0pD+joCrL
 jx3QwqlWCpVqW8N4KVGHhTnJ2AplQHtED/H6pp2CtDNqcBU3OQwhhgbjYr5P6ZVNndenkZsxuXt
 eY7kCFL9/GrE9sXngSGylfL9HNWLw7s2D8O19z3SwXQKrB2OZqElLcwVLNxnsSsmXO5l3mwmkRo
 igVvmBhQQTnqEpQJ6l5YmlvUMlsTDnqHDEKptVeddoKF/ltHBskmkrgfxY21nZOtK6oqJWnZphj
 vpGnEBpIKEapXuzQEYLCKdT7U2q63KSOLEVId+zcM7oh21V0zfdDzz89P/HK2MWM627mSryo
X-Proofpoint-GUID: Xgvvxp20lS3lDIVYe7mKo7xBmom2SKmA
X-Proofpoint-ORIG-GUID: Xgvvxp20lS3lDIVYe7mKo7xBmom2SKmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090120

On 5/8/25 8:41 PM, Rob Clark wrote:
> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Start the great despaghettification by getting a pointer to the common
>> UBWC configuration, which houses e.g. UBWC versions that we need to
>> make decisions.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>  }
>>
>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  {
>> +       /* Inherit the common config and make some necessary fixups */
>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
> 
> This does look a bit funny given the devm_kzalloc() below.. I guess
> just so that the ptr is never NULL?

Yeah, would you prefer this is changed?

Konrad
