Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2F42E7161
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166548; cv=none; b=JfKynfb3HvMACSjbsREPDB0OMtkuLCfeW1G/Mn3STrww6S02rGAja6ZWl/jrWzlsHqxCJTPIQV5IzrfB2Fm34Q/2xSQpPMIVC7NASHnElZlGQGDEYTQmfp/Br2pEJhIKe70p7LR3gQn9k48TgNDjNI/Ynu8X+6U487CrpjivlOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166548; c=relaxed/simple;
	bh=Fhx8QhTabRuUUWFQRH+WJIzph/BMxmYMg7nJNx1FXZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQqHhmXMaGJ34uSbUychaR477KtDvf2gLG5T80IgRa8sZCUW0Po27CTnPR86fLDBGE+M6B0Y1zw/6Js0GdzZK2TAgRVtPg+Qgtu7WVgC+q1jrxqOjAcFcWi9IFjuo+evseVyZrxK8n8sQlq9CelRo0ADtrgL7S1PZq+uK70OAJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=HPYIc/z0; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="HPYIc/z0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L22KdzWdcCGWDxLpvivnPPHE6oi/1Lj0cZZMedRZ4Ok=; b=HPYIc/z0LD1RIpHARxa33P3SZ+
	r4ke309UOb2j2A/QwsyYpEel8qO7Hw/FtkP1dtFEC8b1beToN0M/lHzijieDRs8aeXNd8LCrGw9bQ
	MfntLdWC5Zm2qXQy5Wvyj9M0r0omrbd1m/GqwhM4YdQd1xmdrQwM8QO/WW1HvPviuvvUiJhLdXam4
	ikMpCwfZPXBi9WfZ7yRLoM0Fw9/duVyAy8/4WSAumuayJjiQVqf6eejwGX+2/OZz7hT1tDTp4aj1u
	vCkh/FcKPWYF6wcZD0AxZWuhN96Vo8qjV/52OvmTf/UYJ9vQ8Wa7+V2PmUo6piFvp6TvdWBfZ4Gnx
	KIWVxI5Q==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uRWGQ-004bal-Ux; Tue, 17 Jun 2025 15:22:11 +0200
Message-ID: <63b4fb79-8132-4c05-bcac-3238366899d9@igalia.com>
Date: Tue, 17 Jun 2025 10:22:04 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] drm/amdgpu: Make use of drm_wedge_task_info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
 <20250617124949.2151549-7-andrealmeid@igalia.com>
 <5db1dda6-0cd7-4fc7-9a22-8ed57b12ada1@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <5db1dda6-0cd7-4fc7-9a22-8ed57b12ada1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 17/06/2025 10:07, Christian König escreveu:
> On 6/17/25 14:49, André Almeida wrote:
>> To notify userspace about which task (if any) made the device get in a
>> wedge state, make use of drm_wedge_task_info parameter, filling it with
>> the task PID and name.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Do you have commit right for drm-misc-next?
> 

Thanks for the reviews!

I do have access, but if you don't mind, can you push this one?

> Regards,
> Christian.
> 
>> ---
>> v8:
>>   - Drop check before calling amdgpu_vm_put_task_info()
>>   - Drop local variable `info`
>> v7:
>>   - Remove struct cast, now we can use `info = &ti->task`
>>   - Fix struct lifetime, move amdgpu_vm_put_task_info() after
>>     drm_dev_wedged_event() call
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 +++++++++++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  7 +++++--
>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 8a0f36f33f13..a59f194e3360 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -6363,8 +6363,17 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>   
>>   	atomic_set(&adev->reset_domain->reset_res, r);
>>   
>> -	if (!r)
>> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>> +	if (!r) {
>> +		struct amdgpu_task_info *ti = NULL;
>> +
>> +		if (job)
>> +			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
>> +
>> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE,
>> +				     ti ? &ti->task : NULL);
>> +
>> +		amdgpu_vm_put_task_info(ti);
>> +	}
>>   
>>   	return r;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index 0c1381b527fe..1e24590ae144 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>>   {
>>   	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>>   	struct amdgpu_job *job = to_amdgpu_job(s_job);
>> +	struct drm_wedge_task_info *info = NULL;
>>   	struct amdgpu_task_info *ti;
>>   	struct amdgpu_device *adev = ring->adev;
>>   	int idx;
>> @@ -125,7 +126,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>>   	ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>>   	if (ti) {
>>   		amdgpu_vm_print_task_info(adev, ti);
>> -		amdgpu_vm_put_task_info(ti);
>> +		info = &ti->task;
>>   	}
>>   
>>   	/* attempt a per ring reset */
>> @@ -164,13 +165,15 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>>   			if (amdgpu_ring_sched_ready(ring))
>>   				drm_sched_start(&ring->sched, 0);
>>   			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
>> -			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>> +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
>>   			goto exit;
>>   		}
>>   		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
>>   	}
>>   	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
>>   
>> +	amdgpu_vm_put_task_info(ti);
>> +
>>   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
>>   		struct amdgpu_reset_context reset_context;
>>   		memset(&reset_context, 0, sizeof(reset_context));
> 

