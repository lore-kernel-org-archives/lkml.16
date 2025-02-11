Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D341FBCB6
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273994; cv=none; b=NilRZiqv3leZdmTdN5vPDfWm9Y5+hlwtaOQO7XJz2U01OVZOpkf35kRvuSs4M4EKgwMJeYrsrhL5CmhiEmmN3ISUC+LUR9MUEUOrzLqv+Wgs/4MnSjkRbgXRplezufMGknympEelSi6QkvpjP+8pixiHeegobLR7c5LyYPOjtK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273994; c=relaxed/simple;
	bh=u8kvB0LHj0/t/fK1vP34/F04S+ECwcmONfBwqRMHm0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K50r5Lzg+mc8erdm4JNPC+2ZySWHH2M1F2fhvrwkrwoAqk79XX9Cf4YIabPQHnCkn+hgC8ObFKE+Qs82cuxpugZ001T09ydpmyxpnFH7/54nngxQugRN+xTd+6e5XiLaSSFSCndZINoPdcW13V63ePqveQQAPYAcR2iv6K+LPkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=ChVnk6B/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="ChVnk6B/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43956e3863eso416775e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1739273991; x=1739878791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbXAmkyJUSenujIvggapj12PtgrkKePskohN36zhqz8=;
        b=ChVnk6B/v6gzgcuzZGNNYcPkLNotHCfbWzyNhJ0w/Z7uxWXSkB1slvw+XS6dmNYiIx
         prLUBu7BSmYkdkRr2jgyhgrtvUTKOaUn6F0dTqzT6WhvNVsstHTZFhN/Rcy5AtcQsjAO
         2PjT/+HQ+5jzYDLv9XJa9eYmEudqlK+Hq0+TdxMDFTZIxiRt4w0cxZHwfgDm4JzfuorC
         i9QBd4s/0n1381gOD36Oubs0vSJVlJDEnhdu7UDaTeW9Xob2kdZZTe56dqqXCi9c4XpV
         8p8f7fDn0FOe5UihHvTQDeM79mdGi40t6Ds0K0792m6IiN+61z2n4IdCexHcvMTuD+wW
         VIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273991; x=1739878791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbXAmkyJUSenujIvggapj12PtgrkKePskohN36zhqz8=;
        b=t7+4Hgz7kDaabUGBxlG2cI2VYTP86Yhx9gdOhs2Kcb0UGV0+FU5wONpz2xc/MLoygU
         UfkA/+XlWNCPPbxYcUiTZ782S2iF+ai/ceBHCCGw7iw15ZaV5bd6ORBVJPX9auu27l1C
         ytgKtQnrE0izniJbTjkV+OuS6yirjoi0ht2GAokXiI16a5+xLDl0aPoyHVGLLleim55V
         WuJj+rfpxJuvD494N2ypVmGMN2yVjTtvkjn3ES1YaXr7JP53+NATTU6iwZESjI56qe1E
         eUjDswdCTNd/YLG/e7iGmsof5Vg0SyU+1xpnAEPlfNDxq4Qn5b/MzSss3giMPW6hgDOn
         J/0A==
X-Forwarded-Encrypted: i=1; AJvYcCVnwIoAOwGCIX7lP2mmXcPvCjam7FFvd4+/qUwmnpSreIM+njg3IjY4J+bDsernW/wbVb6z6azFW3+XL/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YykPrtIX+uspEas1hZ933uIsPQcDsSvr5rO4v4o83rBANojyKdp
	xXBzwX71hxo0o2BmsS0pDaY6/bcmRpXdJAuI3ITw1g4qh1IzAW4po18Bf2xrJ6Sm41mAbQrfx4K
	Z
X-Gm-Gg: ASbGncsoYUzsJPxLCobF+/RurG0B0ntsDdM1BUx7U6GCDz6Siz8mz98rMuwUerQupFk
	cPEk5ko5B4ad9z8oEef4FVU0pRLDT/ENzsQ6ioAjvXV6pC6gY/obY5baiXIEu6k/4ep78ObaaJ8
	YNSxF5pLYJBhzxGRYHIQUAM1EhI1OMrIN4NzLZn2Ka5D1ewsM3EeYwriLMgrxiEWcKrEPUei6B0
	kMenLv4hLIcw9ThJoaKRlTcSAxPJrgyz8Mr2mArm58NnXmNFfWhkqcqtk/L7+OrxBniP/lpjh3l
	4UDsbyMGhoAxKdg0aASXln+JobgQryU=
X-Google-Smtp-Source: AGHT+IHlxcuU533wS50aO9sNDeHF1Y0ewIXNlIG+Y+/2gL5BK7DU5aw6IdMtcxcaj/K8Z+zQtpfdPQ==
X-Received: by 2002:a05:600c:1e0d:b0:439:4827:73d with SMTP id 5b1f17b1804b1-439482709dcmr53965525e9.18.1739273990689;
        Tue, 11 Feb 2025 03:39:50 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da964e2sm176708835e9.4.2025.02.11.03.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 03:39:50 -0800 (PST)
Message-ID: <7ee0205a-6522-465b-8795-3d7b867e2d97@ursulin.net>
Date: Tue, 11 Feb 2025 11:39:49 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in
 fdinfo path
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
 <2ec2a848-90f4-49bc-aaaf-8eb256f271db@ursulin.net>
 <ddnsckbpr2fcxby4i2o5xyrt3pdhornzbrvlbivuvzlyhgg66q@ejhkiz33sewn>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <ddnsckbpr2fcxby4i2o5xyrt3pdhornzbrvlbivuvzlyhgg66q@ejhkiz33sewn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/02/2025 16:08, Adrián Larumbe wrote:
> Hi Tvrtko,

Thanks!

> [18153.770244] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:562
> [18153.771059] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 203412, name: cat
> [18153.771757] preempt_count: 1, expected: 0
> [18153.772164] RCU nest depth: 0, expected: 0
> [18153.772538] INFO: lockdep is turned off.
> [18153.772898] CPU: 4 UID: 0 PID: 203412 Comm: cat Tainted: G        W          6.14.0-rc1-panthor-next-rk3588-fdinfo+ #1
> [18153.772906] Tainted: [W]=WARN
> [18153.772908] Hardware name: Radxa ROCK 5B (DT)
> [18153.772911] Call trace:
> [18153.772913]  show_stack+0x24/0x38 (C)
> [18153.772927]  dump_stack_lvl+0x3c/0x98
> [18153.772935]  dump_stack+0x18/0x24
> [18153.772941]  __might_resched+0x298/0x2b0
> [18153.772948]  __might_sleep+0x6c/0xb0
> [18153.772953]  __mutex_lock_common+0x7c/0x1950
> [18153.772962]  mutex_lock_nested+0x38/0x50
> [18153.772969]  panthor_fdinfo_gather_group_samples+0x80/0x138 [panthor]
> [18153.773042]  panthor_show_fdinfo+0x80/0x228 [panthor]
> [18153.773109]  drm_show_fdinfo+0x1a4/0x1e0 [drm]
> [18153.773397]  seq_show+0x274/0x358
> [18153.773404]  seq_read_iter+0x1d4/0x630

There is a mutex_lock literally in seq_read_iter.

So colour me confused. What created the atomic context between then and 
Panthor code?! I just don't see it.

Regards,

Tvrtko

> [18153.773411]  seq_read+0x148/0x1a0
> [18153.773416]  vfs_read+0x114/0x3e0
> [18153.773423]  ksys_read+0x90/0x110
> [18153.773429]  __arm64_sys_read+0x50/0x70
> [18153.773435]  invoke_syscall+0x60/0x178
> [18153.773442]  el0_svc_common+0x104/0x148
> [18153.773447]  do_el0_svc+0x3c/0x58
> [18153.773453]  el0_svc+0x50/0xa8
> [18153.773459]  el0t_64_sync_handler+0x78/0x108
> [18153.773465]  el0t_64_sync+0x198/0x1a0
> 
> 
> On 10.02.2025 15:52, Tvrtko Ursulin wrote:
>> On 10/02/2025 12:41, Adrián Larumbe wrote:
>>> Panthor's fdinfo handler is routed through the /proc file system, which
>>> executes in an atomic context. That means we cannot use mutexes because
>>> they might sleep.
>>
>> Have the debug splat at hand? I am thinking it is not because of fdinfo reads,
>> which are allowed to sleep, but has to be something else.
>>
>> Regards,
>>
>> Tvrtko
>>
>>> This bug was uncovered by enabling some of the kernel's mutex-debugging
>>> features:
>>>
>>> CONFIG_DEBUG_RT_MUTEXES=y
>>> CONFIG_DEBUG_MUTEXES=y
>>>
>>> Replace Panthor's group fdinfo data mutex with a guarded spinlock.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
>>> ---
>>>    drivers/gpu/drm/panthor/panthor_sched.c | 26 ++++++++++++-------------
>>>    1 file changed, 12 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>>> index 0b93bf83a9b2..7a267d1efeb6 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>> @@ -9,6 +9,7 @@
>>>    #include <drm/panthor_drm.h>
>>>    #include <linux/build_bug.h>
>>> +#include <linux/cleanup.h>
>>>    #include <linux/clk.h>
>>>    #include <linux/delay.h>
>>>    #include <linux/dma-mapping.h>
>>> @@ -631,10 +632,10 @@ struct panthor_group {
>>>    		struct panthor_gpu_usage data;
>>>    		/**
>>> -		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
>>> -		 * and job post-completion processing function
>>> +		 * @fdinfo.lock: Spinlock to govern concurrent access from drm file's fdinfo
>>> +		 * callback and job post-completion processing function
>>>    		 */
>>> -		struct mutex lock;
>>> +		spinlock_t lock;
>>>    		/** @fdinfo.kbo_sizes: Aggregate size of private kernel BO's held by the group. */
>>>    		size_t kbo_sizes;
>>> @@ -910,8 +911,6 @@ static void group_release_work(struct work_struct *work)
>>>    						   release_work);
>>>    	u32 i;
>>> -	mutex_destroy(&group->fdinfo.lock);
>>> -
>>>    	for (i = 0; i < group->queue_count; i++)
>>>    		group_free_queue(group, group->queues[i]);
>>> @@ -2861,12 +2860,12 @@ static void update_fdinfo_stats(struct panthor_job *job)
>>>    	struct panthor_job_profiling_data *slots = queue->profiling.slots->kmap;
>>>    	struct panthor_job_profiling_data *data = &slots[job->profiling.slot];
>>> -	mutex_lock(&group->fdinfo.lock);
>>> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
>>> -		fdinfo->cycles += data->cycles.after - data->cycles.before;
>>> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
>>> -		fdinfo->time += data->time.after - data->time.before;
>>> -	mutex_unlock(&group->fdinfo.lock);
>>> +	scoped_guard(spinlock, &group->fdinfo.lock) {
>>> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
>>> +			fdinfo->cycles += data->cycles.after - data->cycles.before;
>>> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
>>> +			fdinfo->time += data->time.after - data->time.before;
>>> +	}
>>>    }
>>>    void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>>> @@ -2880,12 +2879,11 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>>>    	xa_lock(&gpool->xa);
>>>    	xa_for_each(&gpool->xa, i, group) {
>>> -		mutex_lock(&group->fdinfo.lock);
>>> +		guard(spinlock)(&group->fdinfo.lock);
>>>    		pfile->stats.cycles += group->fdinfo.data.cycles;
>>>    		pfile->stats.time += group->fdinfo.data.time;
>>>    		group->fdinfo.data.cycles = 0;
>>>    		group->fdinfo.data.time = 0;
>>> -		mutex_unlock(&group->fdinfo.lock);
>>>    	}
>>>    	xa_unlock(&gpool->xa);
>>>    }
>>> @@ -3531,7 +3529,7 @@ int panthor_group_create(struct panthor_file *pfile,
>>>    	mutex_unlock(&sched->reset.lock);
>>>    	add_group_kbo_sizes(group->ptdev, group);
>>> -	mutex_init(&group->fdinfo.lock);
>>> +	spin_lock_init(&group->fdinfo.lock);
>>>    	return gid;
>>>
>>> base-commit: 2eca617f12586abff62038db1c14cb3aa60a15aa
>>> prerequisite-patch-id: 7e787ce5973b5fc7e9f69f26aa4d7e5ec03d5caa
>>> prerequisite-patch-id: 03a619b8c741444b28435850e23d9ec463171c13
>>> prerequisite-patch-id: 290e1053f8bf4a8b80fb037a87cae7e096b5aa96
>>> prerequisite-patch-id: bc49bb8c29905650fb4788acc528bb44013c0240
>>> prerequisite-patch-id: 46cab4c980824c03e5164afc43085fec23e1cba5

