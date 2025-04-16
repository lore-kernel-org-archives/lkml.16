Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857B01FE44A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765274; cv=none; b=ZB5i5SEhptrLyXlC8tNI6E7RyLWNkfkydfNgOxDc2W22Kb/ccFDH+3rjuH60xgvX/pAEBildAK2QO5DAL8oyy6K5lW9kBApWwlVQ8pCwFyo6Dus9584ua3IYxZg5YC/79lR3JjTpSpg+EfVFNcq+PKbgnUoxtETGuD5Yyr4hdls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765274; c=relaxed/simple;
	bh=gS7ifDsB8Jro6vakx+IDGzGzwI10TKVr3CmhnIKB6gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcRBKW3E2t04MjzUK4rwlK9sh7rMo/WR4+YPbyOul5sLFdS7Di3OzXLJgMvYMlSvSxfDEsCOi4TVGjamQm8c9ZtiIWt7taNN3pcMHp/7bE4qjrcFlFU3GToCLW7DbdEQ28XNANUbXJp34tAv1hb6rNKaZ0CImwQyktrleZSvmKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eq5sJEg8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eq5sJEg8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FILGx0012563
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nj/rTloHnxQSrvDgVjeBoV7XS1AGsT5Fe0oxAW/yXzs=; b=Eq5sJEg84oZ+NF70
	6++dM/sTv9aCJlugsei/i6nHXv7CiZL+ZQl5ngAVFwmazDxPBdt/sn/R+Hqelf8l
	u9TT+kq3wg0izYn6iFmSnBeAlwCYcpVsjH1uxLaYW+wXTdzNfTu8B1bGnDnGCyJS
	1iFo6e7EAV7Qwtqu+Evuv8Ypjk+bDbYBKgHIV0jN4LC/PxM1Qa23EI53x95s6G3k
	80pRipiAWcW2rLq1WgSLmSM/Ng0I3olq+PpwlNkWCTg9JvAInRKP8bPz3m8QU04E
	MA7stB/QNRGktJZR/n7aMLNE4CGlUHcYqGkMRJnB8wWK/GJOh1Um7fPZJx1XKXLE
	ct5hYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqa25g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:01:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af2f03fcc95so6211504a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765269; x=1745370069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nj/rTloHnxQSrvDgVjeBoV7XS1AGsT5Fe0oxAW/yXzs=;
        b=Hi1pQQD+9RA79+5n7JSVzP5qpowz3OFU/OFsajdm0b8BYx+k3X59uwwvkErOs8oLfT
         my7Md2iJVWix5Dh7qGfSOXSYeacqY6wBJYe0V2/X8cJAXjhazVlsaWwUU4otZAOvy34m
         Qdds4g6kr9x/U7yccFw7fH5bbmuaOzAvdNNETaqE/1t1ikssjgiI0jJp9GqMhSYS4NW1
         +OI3TNriNZDV/auJ6o8I9DZWKM6ea7am6bel77r3wakAMVGREpQ66S9qBwF6KDOK91AL
         3JpDiN5A3tzVcWcVNlVxKd6TxIPvX6y/u0b5DmiUTJ+735VZ8Dcw/9BTerIfXy25mvAG
         ITMg==
X-Forwarded-Encrypted: i=1; AJvYcCUG4gcK30kjKpaA1nmGJS317avYZatlIuJ9O44ONH6BX6N4vY6+S6G0gvis/sTJT+eCij1Oe8Y1tskMImI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP3hJZDRJpm88Bt8a2JGSS1gbWiLfY72gsUs5S871ewN+8X2nM
	E/mHa94If4KqVRpqyFWvPLo/I0dksZycgjtmcYjLnsbdEtSrWixuZojzxDuVMmffReAuuWHGLAJ
	xpcmyIdgxZoko5HQ2BbdTWwO6gRR3N4yV8t/YzDziJ4A4qU4paQ81V7pKXSwAEnc=
X-Gm-Gg: ASbGncsgZjhzRyPSexgybvMkuyAeb3evBqkgxH1kuY6qgIRT++44hbRo4uzQdqTm2+v
	tgkLb4SK950brnO94NW+GwlQvxvhQ5+ywTfWFILv5Pu2jiJ6JYOb80Ykts9/ty3ALBgO6GSqyaC
	e7aka2uJdHxcwe94Pss+MAqPXzMGI/WdCQ5p2Bw4fLLqz6vyDAYtMTmvOAtZ1Lsz7zpPbLlGLsd
	3M+ZJksLfV6RSCZrQHfF1fLnP6ikWqjE+VCWNVJNjGwIg437KoJqX7vum0kAQS/0VXlGIvLhQNV
	6xjlhKHbWeBb8W0Ttq0gCfMpOleilmxPFxjiAiIGJgxBoBWQlTuwPxo8OLXuP5EUVnFeAMpX
X-Received: by 2002:a05:6a20:7343:b0:1f5:8eec:e516 with SMTP id adf61e73a8af0-203ae069c09mr1649033637.32.1744765269558;
        Tue, 15 Apr 2025 18:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk09CwkXT7w7wlLQOSiJeGUhYgI24m8nRcTkG97Bnl/2JmuGeHu4jiXxXu7muiyS3UtQjv0Q==
X-Received: by 2002:a05:6a20:7343:b0:1f5:8eec:e516 with SMTP id adf61e73a8af0-203ae069c09mr1648999637.32.1744765269185;
        Tue, 15 Apr 2025 18:01:09 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd219d98bsm9494017b3a.11.2025.04.15.18.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:01:08 -0700 (PDT)
Message-ID: <3f5cc8ff-9770-44f0-ad46-046488fbb328@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 09:01:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Yabin Cui <yabinc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250415184649.356683-1-yabinc@google.com>
 <20250415184649.356683-2-yabinc@google.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250415184649.356683-2-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tt-saNcgdPKN5ueKOCKBpJBPSEtSHXcL
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67ff0156 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=hItIS0sIXTpyHXqPC_IA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: tt-saNcgdPKN5ueKOCKBpJBPSEtSHXcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160006



On 4/16/2025 2:46 AM, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
> 
> To address these race conditions, this patch introduces the
> following changes:
> 
> 1. The enable and disable operations for the CATU device are not
>     reentrant. Therefore, a spinlock is added to ensure that only
>     one CPU can enable or disable a given CATU device at any point
>     in time.
> 
> 2. A reference counter is used to manage the enable/disable state
>     of the CATU device. The device is enabled when the first CPU
>     requires it and is only disabled when the last CPU finishes
>     using it. This ensures the device remains active as long as at
>     least one CPU needs it.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>

Hi Yabin,

You missed the reviewed-by tag. James gave his tag in V3.

As well as another patchset.

Thanks,
Jie

> ---
>   drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
>   drivers/hwtracing/coresight/coresight-catu.h |  1 +
>   2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..3909b562b077 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       void *data)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_enable_hw(catu_drvdata, mode, data);
> -	CS_LOCK(catu_drvdata->base);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> +	if (csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_enable_hw(catu_drvdata, mode, data);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	if (!rc)
> +		csdev->refcnt++;
>   	return rc;
>   }
>   
> @@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>   
>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_disable_hw(catu_drvdata);
> -	CS_LOCK(catu_drvdata->base);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> +	if (--csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_disable_hw(catu_drvdata);
> +		CS_LOCK(catu_drvdata->base);
> +	}
>   	return rc;
>   }
>   
> @@ -550,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>   	dev->platform_data = pdata;
>   
>   	drvdata->base = base;
> +	raw_spin_lock_init(&drvdata->spinlock);
>   	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
>   	catu_desc.pdata = pdata;
>   	catu_desc.dev = dev;
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 141feac1c14b..755776cd19c5 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -65,6 +65,7 @@ struct catu_drvdata {
>   	void __iomem *base;
>   	struct coresight_device *csdev;
>   	int irq;
> +	raw_spinlock_t spinlock;
>   };
>   
>   #define CATU_REG32(name, offset)					\

