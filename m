Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3966024338F
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.152.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760437; cv=none; b=rY4IWyyPkfM5M+S4HZ1w+r7JUZWpQ+7VOKDWjmNQNXG2LbfwIfHv3Rv2KWJ4nqJpecTwYr+o6Dksw8/tkUAFsQMVwcCsZDfXjjYPycF9lYGIvzH4GdwTAS4B2MEZwU+gtq6bx0vJMg4SrLUlA1Ztc9dCwYh9eEMmILR/d/9rRHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760437; c=relaxed/simple;
	bh=xcDcxfy2ihH9lRNz6yAykV3gFlUPQ6q9xcUWXZPxDK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=giOsydAXh+tkrV+1ZtEwVcB3rCpohIVkESZWeHD1xtRW075dxat4YRN5kR6hTp88J7ksmkI8TlLyeoKxXpl579ohvHJOTMwTC6pNTD7+08wQAX+WRM6f8im6VbOqQRuJfWCPuIArmORuZ1AQoZSXvoc1uwu0CC/UCfpE+9gxrt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net; spf=pass smtp.mailfrom=damsy.net; dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b=CwyNXFeY; dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b=DPADTAzj; arc=none smtp.client-ip=51.159.152.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damsy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b="CwyNXFeY";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="DPADTAzj"
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1747760214; bh=bK6d56SoduXJWmbkEZP5dQH
	CvkZGM1JG60/cVI5W0u8=; b=CwyNXFeYu5J3ksYIGHzAAy83eosq3C9+2BDOECr4ZHYLAakawj
	q+e4Wsk4Boyl7aJOxmGbXUDW0ZtMcBFvPn6nw8v4MNzbLXQUR+96AipUpun63wgTK8dQPedOfei
	m9puOObjCjipXYp0Wn5fNcvfb4gUrn7mmg+7ARzTv5rGuHc/pYm9oWl2KBIRTaL471arAsSLSbi
	50ubja47xPBBaCZ8dfVl1/umZ3LK5cZZyW12MvJgynBbP4jfXDf0uwJ1q5A//5w0e9vSWHTbS7E
	NVNU+PphMsV0l5AXeMQfOEJAePp/sCHs9fteZI1OTBrlRNFmn7ANdWmSvxOgyurRD4Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1747760214; bh=bK6d56SoduXJWmbkEZP5dQH
	CvkZGM1JG60/cVI5W0u8=; b=DPADTAzjt9Kr+1Yk7wKthqzjmt53FiLLwRNYc3XTY8u6DyqL/V
	zod8DVyUvNx7fHiumgIDVeb85KBD5aTTnsAg==;
Message-ID: <c9794bcf-6e00-4900-ba1e-cc8b223bfbb9@damsy.net>
Date: Tue, 20 May 2025 18:56:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/10] drm/sched: add device name to the
 drm_sched_process_job event
To: Danilo Krummrich <dakr@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-4-pierre-eric.pelloux-prayer@amd.com>
 <aCtPbUaah-bmcEMk@pollux>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <aCtPbUaah-bmcEMk@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/05/2025 à 17:34, Danilo Krummrich a écrit :
> On Thu, Apr 24, 2025 at 10:38:15AM +0200, Pierre-Eric Pelloux-Prayer wrote:
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index f56e77e7f6d0..713df3516a17 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   			     __field(uint64_t, id)
>>   			     __field(u32, job_count)
>>   			     __field(int, hw_job_count)
>> +			     __string(dev, dev_name(sched_job->sched->dev))
> 
> Using the sched_job->sched pointer here and in other trace events implies that
> the trace event must not be called before the sched_job->sched has been set,
> i.e. in drm_sched_job_arm().
> 
> Please document this for the corresponding trace events.

This is not a new requirement as sched and s_fence were already used by the trace events.

Still it's a good idea to document this, so I'll update the comment added in the documentation patch.

Thanks,
Pierre-Eric
