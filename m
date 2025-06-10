Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E9617A305
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749516623; cv=none; b=h2AIUOMWrtqKAfpDcB2xjrUZhtGzDhEj/+nuePBJl+C3qkaZHLAsjoDTcLc1lmt02NibThvWbOeiBEq7+DsinBax5S1FpZH0bp6tb3vn2L+pJFfAcQ8QM5YtiYNJFq1MEX57wTCjAS732X6Bpg2xh3ETBCevvcNyupmF7g3hkhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749516623; c=relaxed/simple;
	bh=HIdLaLetSjMiNZXLjyjzzCQ7kpiz0PwCy+njD9OJ9JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdVlknPLDxdglrfqcYyN14rutjbhv167/h0JHKUmwGv89wK7/a0cDRtylNX/oR/YZ/gcaZrl9lKvv8ZfKGO5e0zLgGLmX4xP47wqmRIQYXXVTw4yGc2X5nY+XMvjWRcTpDGLqsHb2NcMDJqWPdJvjEESrnf73lV0gMKyzUjEjdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=nVmirtF5; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="nVmirtF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1749516309;
	bh=eh0MKFXwRSKJeN6xSCf1HbT1d8FUKtrqXJ+Dp8MAsIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nVmirtF53NxdN4kuVWOnBRC5rp1pqVl7vqt0oxN1c+AcDugoB42F0iO9lLbrfuG5O
	 o8TcdZsrMQY3dyQEFZwEgYTxVAUa+3y58Hmiall3svpP9H7c9sIlneGSfh1es1BduF
	 w2ZGcroLnWPmLL4jSZoUBn/ahb8KaBy0NtaDcDng=
Received: from [192.168.3.19] ([218.4.27.159])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id B4787495; Tue, 10 Jun 2025 08:45:07 +0800
X-QQ-mid: xmsmtpt1749516307twxekh8mx
Message-ID: <tencent_1EB006F3EADC43F9710EC002C328BC474B09@qq.com>
X-QQ-XMAILINFO: MStTOrhA1CLVe8QmYEvkvgVwbij+zYPHXHa/ukbjGk7o/rxjTDwq8lMuHcxyEC
	 ZbPs0GxvKyk5ETXRRnvIKReAnq9O0vHbhyzxBlK/K/LAt1a3skGrvaEo5c31smC9oEevs3jNbLDq
	 lm1ERe1RSzUOBQXs9Fa/d5J/t+BlT4uVb4YbTd2NLQXppUSQYGQgxLLqIpEBsNdoQJauWVblw2ze
	 wLk/m+1euA6o363+TWfPQtrVABlYRCjckiGpIN7MsjDblVpxXoKxVGuLo/k+ogd8WxnzcAwpzct4
	 WboutieCsggDtEISQI8KzA18Gbq/EQ1HacOcFZqcfVDw55xMxNb5xMbB3KxyYZVvzwYrQxqitHkq
	 jyMBqaJbDAVdgqba9GHFOLZUwNdR4ohutnDBsyDmGl1pq2e8vcdtOlp9eJcwQfXcAE2m/HR32v+Z
	 Rz7vEIM+de/FAU60U1EwinndkwEp9iYRQwja5el7eKijAm66f/KLRBdbgvbh7UncJelyHYQRFroV
	 /dOPLnu4BF96cOH2vDILkVEB8DUoXHQ4aDCJ8EP2TUOluqQkwC9l1CS5hdJwEM/2gDrKI6Km3HlC
	 kQRYILYYBRaLE7BpzkmSTTfEfx0umnWkPQq5TxhRR7WlfXtDocNO4W9TuhMrDrDZppnqSjnHs+ph
	 DYQqcQ9zzDgHtetsf46gvwxx21pzgCPIumrAu9RMGeauj+phFxAwYnrxq42Hs7/nxTuZEzWK8/hm
	 fcyaXv7u4/YuuKkPZZrWkDtqpdSH4k0QGuD+HQWpucoHE3DU4bD/nwKXV31aQpM924egN6N0cfXz
	 bAzzBiXXUt/TU/0xtWOKQDAhilgNJ+KTyIZ1qvHtSP3g9qsBJyn111uyz8nEBM12faS3GLiHfard
	 pTdeaR1JNHyJWyZwBIIVus8fZh96QAcqT8234GHp4bQfCwirEcK1DRnQQaDbODN0qulrhMd22tI2
	 +zWNIReNWt9LFE0Po5mkhZq9RFV79G2o2TUjeeYozucxriZWNif4Tnd9ayQDVQeZcgAg3727hpLF
	 N/PL6Gg2bvvO8cCUFFfTfjrCoyR3hiPM93dXA5k3wY59J/cK/qCq6zXgH4xyU=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-OQ-MSGID: <f8f78ac6-4fdb-4f75-ba8b-e146ddf58bad@foxmail.com>
Date: Tue, 10 Jun 2025 08:45:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: register HMM dev memory to DMA-able range
 first
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <tencent_03FB073FD3015AE02485DD6839D6571EBC06@qq.com>
 <560baf50-1bc5-473c-9889-59f7d625ddd9@amd.com>
Content-Language: en-US
From: francisco_flynn <francisco_flynn@foxmail.com>
In-Reply-To: <560baf50-1bc5-473c-9889-59f7d625ddd9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/25 20:46, Felix Kuehling wrote:
> On 2025-06-09 5:36, francisco_flynn wrote:
>> HMM device memory is allocated at the top of
>> iomem_resource, when iomem_resource is larger than
>> GPU device's dma mask, after devm_memremap_pages,
>> max_pfn will also be update and exceed device's
>> dma mask, when there are multiple card on system
>> need to be init, ttm_device_init would be called
>> with use_dma32=true, and this is not necessary at
>> all. let's request dev memory region at DMA-able
>> range first.
> That doesn't make sense to me. The addresses allocated here are not DMA addresses. They cannot be accessed by the GPU via DMA. They are purely fictional addresses for the purposes of creating struct pages for device-private memory. There should be no need to limit them by the GPU's DMA mask.


yes, this address is used by CPU to access VRAM. The patch is intended 
to cope with a special case, after checking the latest kernel code, i 
found this problem has been solved by this commit,

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=7170130e4c72ce0caa0cb42a1627c635cc262821

thanks for you reply.

Best regards,
flynn


> Regards,
>    Felix
>
>
>> Signed-off-by: francisco_flynn <francisco_flynn@foxmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> index 79251f22b702..3856b9fd2a70 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -1020,6 +1020,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>>   	struct amdgpu_kfd_dev *kfddev = &adev->kfd;
>>   	struct dev_pagemap *pgmap;
>>   	struct resource *res = NULL;
>> +	struct resource temp_res = iomem_resource;
>>   	unsigned long size;
>>   	void *r;
>>   
>> @@ -1042,7 +1043,10 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>>   		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
>>   		pgmap->type = MEMORY_DEVICE_COHERENT;
>>   	} else {
>> -		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>> +		temp_res.end = dma_get_mask(adev->dev);
>> +		res = devm_request_free_mem_region(adev->dev, &temp_res, size);
>> +		if (IS_ERR(res))
>> +			res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>>   		if (IS_ERR(res))
>>   			return PTR_ERR(res);
>>   		pgmap->range.start = res->start;

