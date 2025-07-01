Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2104B19006B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376942; cv=none; b=ldWVUoMiv+OdUcuimn02eSkdFcnDr9oEEh0/S218hcSMQH0RsKOTgjMIyJ+XOYCTJqyP82L7Fq9CS2XW11/qzeq35ksIMnaf2G9IrYkRFxnMa213GWvAAS9MzF4qjYF4CFlX2I4oarFNyK51xEnGVxSLlkdKQ9TSZ21SuVZ5y7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376942; c=relaxed/simple;
	bh=iZArxKsuXBaijssF2mYEPj+lzybmEwh3Rlj6Kzz+e4M=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=a8l38zS4XTAOKAbuGQvkj8VcOn9fdjjd+qifTox/doONmQfODGCJ8TkZh4q2Z+zZ9KMdgtL9IpYlNzw2Os7lmTL1EZcs4KTWAX0Sa9m2gOukSVgijqTzv64tMUfaRC2uEo4nPIYMXxKh8Mj0GVzx79g2G+KwInxxZ1baPVRvFZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bWkSJ0W1Wz14Lpq;
	Tue,  1 Jul 2025 21:30:56 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E498140257;
	Tue,  1 Jul 2025 21:35:36 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 21:35:35 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 21:35:35 +0800
Subject: Re: [PATCH v2 2/3] coresight: tmc: refactor the tmc-etr mode setting
 to avoid race conditions
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-3-hejunhao3@huawei.com>
 <20250620134515.00004d58@huawei.com>
CC: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yangyicong@huawei.com>, <prime.zeng@hisilicon.com>
From: hejunhao <hejunhao3@huawei.com>
Message-ID: <794765ed-fbdf-411d-1f3d-abf2422ae250@huawei.com>
Date: Tue, 1 Jul 2025 21:35:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250620134515.00004d58@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn500004.china.huawei.com (7.202.194.145)


On 2025/6/20 20:45, Jonathan Cameron wrote:
> On Fri, 20 Jun 2025 15:54:11 +0800
> Junhao He <hejunhao3@huawei.com> wrote:
>
>> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
>> in tmc_etr_enable_hw() is triggered sometimes:
>>
>>   WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>>   [..snip..]
>>   Call trace:
>>    tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>>    tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>>    coresight_enable_path+0x1c8/0x218 [coresight]
>>    coresight_enable_sysfs+0xa4/0x228 [coresight]
>>    enable_source_store+0x58/0xa8 [coresight]
>>    dev_attr_store+0x20/0x40
>>    sysfs_kf_write+0x4c/0x68
>>    kernfs_fop_write_iter+0x120/0x1b8
>>    vfs_write+0x2c8/0x388
>>    ksys_write+0x74/0x108
>>    __arm64_sys_write+0x24/0x38
>>    el0_svc_common.constprop.0+0x64/0x148
>>    do_el0_svc+0x24/0x38
>>    el0_svc+0x3c/0x130
>>    el0t_64_sync_handler+0xc8/0xd0
>>    el0t_64_sync+0x1ac/0x1b0
>>   ---[ end trace 0000000000000000 ]---
>>
>> Since the sysfs buffer allocation and the hardware enablement is not
>> in the same critical region, it's possible to race with the perf
>>
>> mode:
>>    [sysfs mode]                   [perf mode]
>>    tmc_etr_get_sysfs_buffer()
>>      spin_lock(&drvdata->spinlock)
>>      [sysfs buffer allocation]
>>      spin_unlock(&drvdata->spinlock)
>>                                   spin_lock(&drvdata->spinlock)
>>                                   tmc_etr_enable_hw()
>>                                     drvdata->etr_buf = etr_perf->etr_buf
>>                                   spin_unlock(&drvdata->spinlock)
>>   spin_lock(&drvdata->spinlock)
>>   tmc_etr_enable_hw()
>>     WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
>>                                  the perf side
>>    spin_unlock(&drvdata->spinlock)
>>
>> A race condition is introduced here, perf always prioritizes execution, and
>> warnings can lead to concerns about potential hidden bugs, such as getting
>> out of sync.
>>
>> To fix this, configure the tmc-etr mode before invoking enable_etr_perf()
>> or enable_etr_sysfs(), explicitly check if the tmc-etr sink is already
>> enabled in a different mode, and simplily the setup and checks for "mode".
>> To prevent race conditions between mode transitions.
>>
>> Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation function for ETR")
>> Reported-by: Yicong Yang <yangyicong@hisilicon.com>
>> Closes: https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-2-yangyicong@huawei.com/
>> Signed-off-by: Junhao He <hejunhao3@huawei.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 73 +++++++++++--------
>>   1 file changed, 43 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index b07fcdb3fe1a..252a57a8e94e 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1263,11 +1263,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>   		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>   	}
>>   
>> -	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
>> -		ret = -EBUSY;
>> -		goto out;
>> -	}
>> -
>>   	/*
>>   	 * If we don't have a buffer or it doesn't match the requested size,
>>   	 * use the buffer allocated above. Otherwise reuse the existing buffer.
>> @@ -1278,7 +1273,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>   		drvdata->sysfs_buf = new_buf;
>>   	}
>>   
>> -out:
>>   	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>   
>>   	/* Free memory outside the spinlock if need be */
>> @@ -1289,7 +1283,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>   
>>   static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>>   {
>> -	int ret = 0;
>> +	int ret;
>>   	unsigned long flags;
>>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>   	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
>> @@ -1299,23 +1293,10 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>>   
>>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>   
>> -	/*
>> -	 * In sysFS mode we can have multiple writers per sink.  Since this
>> -	 * sink is already enabled no memory is needed and the HW need not be
>> -	 * touched, even if the buffer size has changed.
>> -	 */
>> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
>> -		csdev->refcnt++;
>> -		goto out;
>> -	}
>> -
>>   	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
>> -	if (!ret) {
>> -		coresight_set_mode(csdev, CS_MODE_SYSFS);
>> +	if (!ret)
>>   		csdev->refcnt++;
>> -	}
>>   
>> -out:
>>   	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>   
>>   	if (!ret)
>> @@ -1735,11 +1716,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>>   	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>>   
>>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> -	 /* Don't use this sink if it is already claimed by sysFS */
>> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
>> -		rc = -EBUSY;
>> -		goto unlock_out;
>> -	}
>>   
>>   	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
>>   		rc = -EINVAL;
>> @@ -1768,7 +1744,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>>   	if (!rc) {
>>   		/* Associate with monitored process. */
>>   		drvdata->pid = pid;
>> -		coresight_set_mode(csdev, CS_MODE_PERF);
>>   		drvdata->perf_buf = etr_perf->etr_buf;
>>   		csdev->refcnt++;
>>   	}
>> @@ -1781,14 +1756,52 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
>>   			       enum cs_mode mode, void *data)
>>   {
>> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +	enum cs_mode old_mode;
>> +	int rc = -EINVAL;
>> +
>> +	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
>> +		old_mode = coresight_get_mode(csdev);
>> +		if (old_mode != CS_MODE_DISABLED && old_mode != mode)
>> +			return -EBUSY;
>> +
>> +		if (drvdata->reading)
>> +			return -EBUSY;
>> +
>> +		/* In sysFS mode we can have multiple writers per sink. */
>> +		if (old_mode == CS_MODE_SYSFS) {
> This seems odd.  You are incrementing the reference count when potentially changing
> away from CS_MODE_SYSFS?
> Is this meant to only occur if old_mode == mode && old_mode == CS_MODE_SYSFS?
Yes, old_mode == CS_MODE_SYSFS means tmc_etr is occupied by sysfs, and
old_mode == mode, so can add reference counting directly.
When tmc_etr is idle its mode is CS_MODE_DISABLED.

> In the code prior to this patch this bit only ran in tmc_enable_etr_sink_sysfs()
> which was only called based on the mode being configured (mode here I think) being
> sysfs.  That no longer looks to be the case.

before the patch, first check (mode == CS_MODE_SYSFS), then check 
(coresight_get_mode(csdev) == CS_MODE_SYSFS),
and finally csdev->refcnt++. This is the same as the current functionality.

> Maybe I'm missing something as the flows around this are complex.
>
>
>> +			csdev->refcnt++;
>> +			return 0;
>> +		}
>> +
>> +		/*
>> +		 * minor note: In sysFS mode, the task1 get locked first, it setup
>> +		 * etr mode to SYSFS. Then task2 get locked，it will directly return
>> +		 * success even when the tmc-etr is not enabled at this moment.
>> +		 * Ultimately, task1 will still successfully enable tmc-etr.
>> +		 * This is a transient state and does not cause an anomaly.
>> +		 */
>> +		coresight_set_mode(csdev, mode);
>> +	}
>> +
>>   	switch (mode) {
>>   	case CS_MODE_SYSFS:
>> -		return tmc_enable_etr_sink_sysfs(csdev);
>> +		rc = tmc_enable_etr_sink_sysfs(csdev);
>> +		break;
>>   	case CS_MODE_PERF:
>> -		return tmc_enable_etr_sink_perf(csdev, data);
>> +		rc = tmc_enable_etr_sink_perf(csdev, data);
>> +		break;
>>   	default:
>> -		return -EINVAL;
>> +		rc = -EINVAL;
>>   	}
>> +
>> +	if (rc && old_mode != mode) {
>> +		scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
> Might be a local style matching thing but if not the scope is tight anyway
> so could use the unscoped version.
>
> 		guard(spinlock_irqsave)(&drvdata->spinlock);
> 		coresight_set_mode(csdev, old_mode);

Sure, Will fix in next version.

>> +			coresight_set_mode(csdev, old_mode);
>> +		}
>> +	}
>> +
>> +	return rc;
>>   }
>>   
>>   static int tmc_disable_etr_sink(struct coresight_device *csdev)
> .
>

