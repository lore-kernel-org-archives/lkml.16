Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F922F772
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393674; cv=none; b=GaRzEz6yIGcyz/jBIq87ggdBQpeyPdY9tn2uEM49CDsBAEljGFe3tkL6i5csDDeCRArdMI1TIT/M/DoOxn8F7Rt8Sf4wiEEryOnUnQZfVnPSu9rAfJE0Ka3V8oj2VjnAlcKGDSwO8A1vc2vNYq/P9yiN+lA0AHZM5ecVFXgyGyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393674; c=relaxed/simple;
	bh=/gs94o42ywdUTHaMMH4saGRdPDxD0hFVrj6JTivrxkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YK8MobuADEXuR7Y0aRq+CLheCjcbpa9XdrMGwvOCVRiO3OEAsOWLSwg3nnWerJF1XTDOI0+BzEywU2VK3vdbCaNuPMeBQFKRXCc5ro706LJj7GG9PMk81rga2hp2y/Fy/01yo1+bJA8RJ4ZP+PRTr1cqQsYG0uygcOADN25IhVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=LVC/6MEC; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="LVC/6MEC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a0MdbxJn9tcqHZJ9SvBEI+x5AV7StRpHo6WCC1hnej4=; b=LVC/6MECYUZAD0g+buo9JPR1mV
	5+UCSylrVwr5+60klkD4vmG8oWIgA5iD5Q1r+uHXXcr+C/BG2LHbliLSiRM3meLLTIiNfFCZh1cQF
	VutiadzsMLn0lLOM8Vw/V1o+Ic3T/7myjvK1W7I21WSCAN0LLgRoEnoXZFsY2QQKgV0cTwrBGUo8t
	yStoq4kCxKLqLyHIPYH4sQ38hPBEjQPwjNEFs60mgP6rsAqLuHAKG4L6WOSrYcvIR93KLbWS4zOcB
	6U3brEQv5z9+tSfJw/XjlsJuDVgC5vgeEQgpwJhK8fHy16qALvSB0r7CeJNrpWkoiRJdKSGV/LLwX
	iDD54beA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u7UcT-006nyr-Nq; Wed, 23 Apr 2025 09:34:09 +0200
Message-ID: <88f892f9-e99a-4813-830f-b3d30496ba3c@igalia.com>
Date: Wed, 23 Apr 2025 08:34:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
To: Danilo Krummrich <dakr@kernel.org>, phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
 <aAeiwZ2j2PhEwhVh@cassiopeiae>
 <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
 <aAetRm3Sbp9vzamg@cassiopeiae>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aAetRm3Sbp9vzamg@cassiopeiae>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 22/04/2025 15:52, Danilo Krummrich wrote:
> On Tue, Apr 22, 2025 at 04:16:48PM +0200, Philipp Stanner wrote:
>> On Tue, 2025-04-22 at 16:08 +0200, Danilo Krummrich wrote:
>>> On Tue, Apr 22, 2025 at 02:39:21PM +0100, Tvrtko Ursulin wrote:
>>
>>>> Sorry I don't see the argument for the claim it is relying on the
>>>> internals
>>>> with the re-positioned drm_sched_fini call. In that case it is
>>>> fully
>>>> compliant with:
>>>>
>>>> /**
>>>>   * drm_sched_fini - Destroy a gpu scheduler
>>>>   *
>>>>   * @sched: scheduler instance
>>>>   *
>>>>   * Tears down and cleans up the scheduler.
>>>>   *
>>>>   * This stops submission of new jobs to the hardware through
>>>>   * drm_sched_backend_ops.run_job(). Consequently,
>>>> drm_sched_backend_ops.free_job()
>>>>   * will not be called for all jobs still in
>>>> drm_gpu_scheduler.pending_list.
>>>>   * There is no solution for this currently. Thus, it is up to the
>>>> driver to
>>>> make
>>>>   * sure that:
>>>>   *
>>>>   *  a) drm_sched_fini() is only called after for all submitted jobs
>>>>   *     drm_sched_backend_ops.free_job() has been called or that
>>>>   *  b) the jobs for which drm_sched_backend_ops.free_job() has not
>>>> been
>>>> called
>>>>   *
>>>>   * FIXME: Take care of the above problem and prevent this function
>>>> from
>>>> leaking
>>>>   * the jobs in drm_gpu_scheduler.pending_list under any
>>>> circumstances.
>>>>
>>>> ^^^ recommended solution b).
>>>
>>> This has been introduced recently with commit baf4afc58314
>>> ("drm/sched: Improve
>>> teardown documentation") and I do not agree with this. The scheduler
>>> should
>>> *not* make any promises about implementation details to enable
>>> drivers to abuse
>>> their knowledge about component internals.
>>>
>>> This makes the problem *worse* as it encourages drivers to rely on
>>> implementation details, making maintainability of the scheduler even
>>> worse.
>>>
>>> For instance, what if I change the scheduler implementation, such
>>> that for every
>>> entry in the pending_list the scheduler allocates another internal
>>> object for
>>> ${something}? Then drivers would already fall apart leaking those
>>> internal
>>> objects.
>>>
>>> Now, obviously that's pretty unlikely, but I assume you get the idea.
>>>
>>> The b) paragraph in drm_sched_fini() should be removed for the given
>>> reasons.
>>>
>>> AFAICS, since the introduction of this commit, driver implementations
>>> haven't
>>> changed in this regard, hence we should be good.
>>>
>>> So, for me this doesn't change the fact that every driver
>>> implementation that
>>> just stops the scheduler at an arbitrary point of time and tries to
>>> clean things
>>> up manually relying on knowledge about component internals is broken.
>>
>> To elaborate on that, this documentation has been written so that we at
>> least have *some* documentation about the problem, instead of just
>> letting new drivers run into the knife.
>>
>> The commit explicitly introduced the FIXME, marking those two hacky
>> workarounds as undesirable.
>>
>> But back then we couldn't fix the problem quickly, so it was either
>> document the issue at least a bit, or leave it completely undocumented.
> 
> Agreed, but b) really sounds like an invitation (or even justification) for
> doing the wrong thing, let's removed it.

IMO it is better to leave it. Regardless of whether it was added because 
some driver is actually operating like that, it does describe a 
_currently_ workable option to avoid memory leaks. Once a better method 
is there, ie. FIXME is addressed, then it can be removed or replaced.

Regards,

Tvrtko

