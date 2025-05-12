Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB526219A93
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060079; cv=none; b=N40XT2QB9mgyOcXyohrxZ5Jf7h54z6bqTsjYVApArdxgwyAihfYHxQtlUc4v5Pq2ZQhsiCTKcEk1iNinUB7K18iXjl9S6dWbEg8xHCvpyQ7ZQvtvKISw8Ct6DhVcP4pGEYKB8QrLI8eqI37oip5HHvG2IycF0r8Gjhw0bPQJrgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060079; c=relaxed/simple;
	bh=jdbV1On26NeAP38ugnOUPacBBxHEqM8aaxwgln/51Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbCNewahssAgebdptkGkFBzImMlUXFj+E0jRCAEX6pFwWlukYFX485F0N5i5SY661Mk8Cip9OeI432j07zJnf9h4HwWO7VcUXmRXWL/KpCCNi5EhPtoeqgRvSQu/ZGMOywpfpsQiGt7FR/5IOQ2E9cGJl5nlmiAjc7jfNDOnUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=XJUJ/dyd; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="XJUJ/dyd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ShlYCAlpUj0EG4BFFQGzIlfptjTPq6gwYXAUM0H4Ork=; b=XJUJ/dydz3VlhW90lBogldLNUj
	8ADonzlkFcuGd4guYD5B54jwooOTJAoaD7v9jw6aelUwd1q0UyptqECq4s28nQjxVzlFvsazZTm8Y
	7wqAaW7zyqc+Y4GBHZ1g+3gDCYdDIDO4Ub0oqD75vdodIvwFCOfDGale5vuOj+WvkRrN2rH0WYJ7P
	Hv4c5Hmd9duMC+T4b+863YtmsYd8iT7cqzZQLz3nPYIZXPLqRG2BX2oLAx/cnp8cIekdbDjXwbljr
	pg2OlCQurfrhuwynRN/DCd1PmzUTaSDWyuYISEK9/viI6c7PjCkFBAcU/HUApSApeMSIY9MizQ6La
	3ATQvYcg==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uEU2w-0077TL-6e; Mon, 12 May 2025 16:27:43 +0200
Message-ID: <86103c8d-0cdf-4fc8-aa79-5a03b299d26e@igalia.com>
Date: Mon, 12 May 2025 11:27:40 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: drm_auth: Convert mutex usage to guard(mutex)
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Kees Cook <keescook@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250509142627.639419-1-andrealmeid@igalia.com>
 <7133e9b4-c05a-4901-940e-de3e70bbbb1e@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <7133e9b4-c05a-4901-940e-de3e70bbbb1e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

Thanks for the feedback.

Em 12/05/2025 03:52, Thomas Zimmermann escreveu:
> Hi
> 
> Am 09.05.25 um 16:26 schrieb André Almeida:
>> Replace open-coded mutex handling with cleanup.h guard(mutex). This
>> simplifies the code and removes the "goto unlock" pattern.
>>
>> Tested with igt tests core_auth and core_setmaster.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> but with questions below
> 
>> ---
>>
>> For more information about guard(mutex):
>> https://www.kernel.org/doc/html/latest/core-api/cleanup.html
> 
> This page lists issues with guards, so conversion from manual locking 
> should be decided on a case-by-case base IMHO.
> 

Sure, agreed. The places that I have converted to guard(mutex) here 
looks like a good fit for this conversion, where the scope of the mutex 
is well defined inside a function without conditional locking.

>> ---
>>   drivers/gpu/drm/drm_auth.c | 64 ++++++++++++++------------------------
>>   1 file changed, 23 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 22aa015df387..d6bf605b4b90 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -95,7 +95,7 @@ int drm_getmagic(struct drm_device *dev, void *data, 
>> struct drm_file *file_priv)
>>       struct drm_auth *auth = data;
>>       int ret = 0;
>> -    mutex_lock(&dev->master_mutex);
>> +    guard(mutex)(&dev->master_mutex);
> 
> These guard statements are hidden variable declarations. Shouldn't they 
> rather go to the function top with the other declarations? This would 
> also help to prevent the problem listed in cleanup.html to some extend.
> 

The guard statements should go exactly where the lock should be taken, 
as it not only declares anonymous variables but also really takes the 
lock. The lock is then release when the mutex goes out of scope. File 
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c has some usage of 
guard(mutex) as well, where Mario did a similar cleanup:

f123fda19752 drm/amd/display: Use scoped guards for handle_hpd_irq_helper()
aca9ec9b050c drm/amd/display: Use scoped guard for 
amdgpu_dm_update_connector_after_detect()
f24a74d59e14 drm/amd/display: Use scoped guard for dm_resume()


> Best regards
> Thomas
> 
