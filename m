Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B678211460
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960357; cv=none; b=ei4csbtcnIiuQZvYgsQadqK5JROot8tQrENrcMaBn5xepQ987h5FKsE+hAndwlHlXMZW3xiMMll34H47wWwttZWS8LI92UCxTIbNyBrJoDlJPD0scEKCtsAWjMNP+4IoIN1plOsASVbgOgj1pe3fzkHwcxA3Dk5IjkCNUVROZLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960357; c=relaxed/simple;
	bh=/BmQ+ri8sub/9HlJweY9D4MEKcncImMVqu7QDF+BZCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=db0Glqy4ldMk7uAXJoH2HmUlNPAH8HxENTg+c4hpivD8mhhlwuvTXQPvq3w2WFZRyEuMwkS1l4WE0X4QkFkeSwqRJLLljYxoPb7WLMzx2gr2gJvDTov6kyRnZjswsTXiANX1hiR7835PA+VeXhflNNvoVO5Gq2+MKEUlw9M/3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifdn8eeg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifdn8eeg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I23xs3001231
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F4GPwa3rOttTjk9BhltNeomN5VRSP0W6yj5JFw3g3/w=; b=ifdn8eeg1HQnWbe+
	mitXYyUEkdIuSXtSuZl/qlf26yYNAMrJVzUk1LmkCTAK3G87160vT8zdJJ68bxgS
	fTfEOQ1aW13v1Ge8nwhWcJcxAsuwgNvntR6Bz5ppSQfIxcwL6ZQTuhkTwOWY2dqb
	3Qh/njb9HVwgobuy/ZLYKw3Xqi5SSuQvfAfxsEpTpy/143xM9/2I0V3jUkgqaZ+A
	/3mtmkxXv+7lyuGal4UZMOMsXFtSgSXx93Y1MwB8lO0ssXeCts61iFnvW90Tq3p4
	p8vFxJP3AC0gkCE1fgMTlMfp0+x4+tfseIqekSEXpQXqwdiSj643O2gq9a2ru5fb
	JNEtZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjhhkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:12:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22c31b55ac6so25450535ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744960353; x=1745565153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4GPwa3rOttTjk9BhltNeomN5VRSP0W6yj5JFw3g3/w=;
        b=rW7Vx9Lej2aZ8Qr2d6gTaK85Zwwom950L46dh8/AEywhxfmSiGRGDdQIxO+bvEiWGU
         eVRt3qMxiUC3Jd1J27JgDc1KPZlMBeBtBznc6rxNoRUUaXt/LqODPt+eIExhP++dcblp
         Z2rkAqccRgHbucMsLm2l7ihWIGkKDbsdNj5l2dEZVdZrogS5re5qEjC2Xkd/QH6PxZkg
         xyTwrmNil3+QFXjqqRGXdkhARhNPcIwaNTvoNv8GTU62JhBrdvo+fJXU5XsFUl1/3Gtb
         zyhG3LVwpDssOwyfn8R1I84K0+rUXtF4i5ZRa2I3Z4/QKXQH9aaX4KK+yd7iFnT+SPhb
         BnPA==
X-Forwarded-Encrypted: i=1; AJvYcCVNHHN+hCeVe8Jqj2+gB8UMLikMBwJWRHsa0BRXfJCl4EYAzpBhT93LrQzJWK4xSLbF97/ZbxpsIC51dlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZND9w0sE7o4TMqEZ/mjwH6mLwgXiTdUhDVucBGGJK1HCA6HX7
	CCMVjXtKA1gvqnmHhumfX8E1FiG7M9KeafiJwuM6KjBRdHaQ3z4eO9OkYx7x2MjSvPIW03/0pKY
	7laNrWuyeDseiNI/0CZOtboycMwFV5hjATaQksIlRpV1bG5c9pm0WBCkmwCJJKaQ=
X-Gm-Gg: ASbGncs+ZwLpMlRLMrR9A1sZLrdG1RYVJcom63BLLe4T/aUkKfEQu8pciV1QXOTsu7x
	WTgkFEMOfJ8r8VsaAVSfEwihJ6n3UsHfPJBVg8Asl2CCbrxNEoxDk8A+q6iWsSnu3Phax4T1dtw
	pBgQs7kGDSbhStqGe51vhU12k/J3/lUq5bpfSspEbf/0gciqeyI6cnoB9CiVY9v7le9PBFuI/mB
	HD7E/HxaJ7+WKx7MAr2V4MO///q3ip0KM++WZeX72UflssebI41KTwl6yKopWFrVfNw7WDSOhTn
	ln42W+nN4cLDVUlocu3/aEbLurayKsI35NLt9GkF9pGPO44AXp0jLvLeohz3WRPTex75DKS2
X-Received: by 2002:a17:902:d4cd:b0:224:910:23f0 with SMTP id d9443c01a7336-22c53642323mr24544055ad.49.1744960353058;
        Fri, 18 Apr 2025 00:12:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK3BDrDi2+yGoZkhPK1RtGGnjlU2PeSWcXGdwchHAFw25hNGVJt7YK9kn7mNxItQvr5s+TCA==
X-Received: by 2002:a17:902:d4cd:b0:224:910:23f0 with SMTP id d9443c01a7336-22c53642323mr24543745ad.49.1744960352534;
        Fri, 18 Apr 2025 00:12:32 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf3ebcsm11150885ad.83.2025.04.18.00.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 00:12:31 -0700 (PDT)
Message-ID: <49992acc-076d-429d-ac07-092d2fffbcb8@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 15:12:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] coresight: tmc: refactor the tmc-etr mode setting
To: Junhao He <hejunhao3@huawei.com>, suzuki.poulose@arm.com,
        james.clark@arm.com, anshuman.khandual@arm.com, mike.leach@linaro.org,
        leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linuxarm@huawei.com,
        jonathan.cameron@huawei.com, yangyicong@huawei.com
References: <20250418055820.3689408-1-hejunhao3@huawei.com>
 <20250418055820.3689408-4-hejunhao3@huawei.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250418055820.3689408-4-hejunhao3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6801fb62 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=BTeA3XvPAAAA:8 a=AXOI0KVg4ztHe0c8KJwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=tafbbOV3vt1XuEhzTjGK:22
X-Proofpoint-GUID: 1UY9BrAQK7nZJ_nTX4y-vEVKVA78LBkZ
X-Proofpoint-ORIG-GUID: 1UY9BrAQK7nZJ_nTX4y-vEVKVA78LBkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180051



On 4/18/2025 1:58 PM, Junhao He wrote:
> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
> in tmc_etr_enable_hw() is triggered sometimes:
> 
>   WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>   [..snip..]
>   Call trace:
>    tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>    coresight_enable_path+0x1c8/0x218 [coresight]
>    coresight_enable_sysfs+0xa4/0x228 [coresight]
>    enable_source_store+0x58/0xa8 [coresight]
>    dev_attr_store+0x20/0x40
>    sysfs_kf_write+0x4c/0x68
>    kernfs_fop_write_iter+0x120/0x1b8
>    vfs_write+0x2c8/0x388
>    ksys_write+0x74/0x108
>    __arm64_sys_write+0x24/0x38
>    el0_svc_common.constprop.0+0x64/0x148
>    do_el0_svc+0x24/0x38
>    el0_svc+0x3c/0x130
>    el0t_64_sync_handler+0xc8/0xd0
>    el0t_64_sync+0x1ac/0x1b0
>   ---[ end trace 0000000000000000 ]---
> 
> Since the sysfs buffer allocation and the hardware enablement is not
> in the same critical region, it's possible to race with the perf
> 
> mode:
>    [sysfs mode]                   [perf mode]
>    tmc_etr_get_sysfs_buffer()
>      spin_lock(&drvdata->spinlock)
>      [sysfs buffer allocation]
>      spin_unlock(&drvdata->spinlock)
>                                   spin_lock(&drvdata->spinlock)
>                                   tmc_etr_enable_hw()
>                                     drvdata->etr_buf = etr_perf->etr_buf
>                                   spin_unlock(&drvdata->spinlock)
>   spin_lock(&drvdata->spinlock)
>   tmc_etr_enable_hw()
>     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
>                                  the perf side
>    spin_unlock(&drvdata->spinlock)
> 
> To resolve this, configure the tmc-etr mode before invoking
> `enable_perf()` or sysfs interfaces. Prior to mode configuration,
> explicitly check if the tmc-etr sink is already enabled in a
> different mode to prevent race conditions between mode transitions.
> Furthermore, enforce spinlock protection around the critical
> sections to serialize concurrent accesses from sysfs and perf
> subsystems.

Is any issue observed during this race condition?

The etr_buf is checked before assign it to sysfs_buf or perf_buf.
In my understanding, the warning raised to indicate the etr already 
enabled with sysfs mode or perf mode, so terminate current enable 
session, right?

Thanks,
Jie

> 
> Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation function for ETR")
> Reported-by: Yicong Yang <yangyicong@hisilicon.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-2-yangyicong@huawei.com/
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> ---
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 77 +++++++++++--------
>   1 file changed, 47 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index a48bb85d0e7f..3d94d64cacaa 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1190,11 +1190,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		spin_lock_irqsave(&drvdata->spinlock, flags);
>   	}
>   
> -	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
> -		ret = -EBUSY;
> -		goto out;
> -	}
> -
>   	/*
>   	 * If we don't have a buffer or it doesn't match the requested size,
>   	 * use the buffer allocated above. Otherwise reuse the existing buffer.
> @@ -1205,7 +1200,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		drvdata->sysfs_buf = new_buf;
>   	}
>   
> -out:
>   	spin_unlock_irqrestore(&drvdata->spinlock, flags);
>   
>   	/* Free memory outside the spinlock if need be */
> @@ -1216,7 +1210,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   
>   static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   {
> -	int ret = 0;
> +	int ret;
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
> @@ -1226,23 +1220,10 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
>   
> -	/*
> -	 * In sysFS mode we can have multiple writers per sink.  Since this
> -	 * sink is already enabled no memory is needed and the HW need not be
> -	 * touched, even if the buffer size has changed.
> -	 */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		csdev->refcnt++;
> -		goto out;
> -	}
> -
>   	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
> -	if (!ret) {
> -		coresight_set_mode(csdev, CS_MODE_SYSFS);
> +	if (!ret)
>   		csdev->refcnt++;
> -	}
>   
> -out:
>   	spin_unlock_irqrestore(&drvdata->spinlock, flags);
>   
>   	if (!ret)
> @@ -1652,11 +1633,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> -	 /* Don't use this sink if it is already claimed by sysFS */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		rc = -EBUSY;
> -		goto unlock_out;
> -	}
>   
>   	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
>   		rc = -EINVAL;
> @@ -1685,7 +1661,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	if (!rc) {
>   		/* Associate with monitored process. */
>   		drvdata->pid = pid;
> -		coresight_set_mode(csdev, CS_MODE_PERF);
>   		drvdata->perf_buf = etr_perf->etr_buf;
>   		csdev->refcnt++;
>   	}
> @@ -1698,14 +1673,56 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
>   			       enum cs_mode mode, void *data)
>   {
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	enum cs_mode old_mode;
> +	int rc;
> +
> +	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
> +		old_mode = coresight_get_mode(csdev);
> +		if (old_mode != CS_MODE_DISABLED && old_mode != mode)
> +			return -EBUSY;
> +
> +		if (drvdata->reading)
> +			return -EBUSY;
> +
> +		/*
> +		 * In sysFS mode we can have multiple writers per sink. Since this
> +		 * sink is already enabled no memory is needed and the HW need not be
> +		 * touched, even if the buffer size has changed.
> +		 */
> +		if (old_mode == CS_MODE_SYSFS) {
> +			csdev->refcnt++;
> +			return 0;
> +		}
> +
> +		/*
> +		 * minor note:
> +		 * When sysfs-task1 get locked, it setup the mode first. Then
> +		 * sysfs-task2 gets locked，it will directly return success even
> +		 * when the tmc-etr is not enabled at this moment. Ultimately,
> +		 * sysfs-task1 will still successfully enable tmc-etr.
> +		 * This is a transient state and does not cause an anomaly.
> +		 */
> +		coresight_set_mode(csdev, mode);
> +	}
> +
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
> -		return tmc_enable_etr_sink_sysfs(csdev);
> +		rc = tmc_enable_etr_sink_sysfs(csdev);
> +		break;
>   	case CS_MODE_PERF:
> -		return tmc_enable_etr_sink_perf(csdev, data);
> +		rc = tmc_enable_etr_sink_perf(csdev, data);
> +		break;
>   	default:
> -		return -EINVAL;
> +		rc = -EINVAL;
>   	}
> +
> +	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
> +		if (rc && old_mode != mode)
> +			coresight_set_mode(csdev, old_mode);
> +	}
> +
> +	return rc;
>   }
>   
>   static int tmc_disable_etr_sink(struct coresight_device *csdev)

