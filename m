Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3A822D7B8
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395371; cv=none; b=ujPIdkIj4etX6XhWZXXu+aaDdYINpdI3hkREXD04SgeNXyCTLl3ANtAIb7JAM+a1AIODNkIu6zTKGypmThWuHn4afZEj6QxlE0KeLI1wi5IMy9Y9ccxd9tv8labze2HEqR5P2a3hJjyKUYWEe/TvbGudoc7hETWVuCGJv+/h2vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395371; c=relaxed/simple;
	bh=Pho62C/5lJua1nwXyUcJyCUfxlBpe9IZvFMcPghSZks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxQgbwrlN/cK8d4xHbIIbS8CQM0PbnuLiKmojiqIfYhyhmouR+RWufU0y4VwnwDbtKAbQkig1GCD/M0plasgbM71Sh2qft+dTXMWQjBkXGadQlFChGMT15G7sFKUGn7woSPQ2k5/atV3C/OwPUb4QC03eZThkCwktFAI3fUAgcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WezWspeU; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WezWspeU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LIAVMXH4svSzSC/MKS256EsGPDy7x67BLuUzvVdOq7o=; b=WezWspeUDnrBexJag2ObCx4wOG
	4HddBNA5ILpO5EnUFDY94aOxtU6RHirgdqwEqLSbDOWHtxWUUfsHUwHau5IA3NRE0P3Gzth9iZ2pe
	flePg4671Uk0mnR/Y3tWZZoa/Q+K+qapZIedTHPufpmTgZ6314pcH8RAEfYgvIRcHlGMBHgBchlX/
	yqMe9UdpJrZ+bFoVjhSMyEaTVRZpjZEDvmyto6Apwl7A366G8ywcw0a47KcaqOyOQAclysKiH2jhj
	pKEszIZMJn917dyss8rhxb6Wd6JKzWhX7mxtlUNtkohzUTzPYGLTykYoz6hrzxVMk8ucpid8FFSfh
	YLsvP9XQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uFtGF-00949i-5M; Fri, 16 May 2025 13:35:53 +0200
Message-ID: <24173faf-c2f0-4d08-93db-587891dc8b5d@igalia.com>
Date: Fri, 16 May 2025 12:35:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from blocking
 too long
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-4-phasta@kernel.org>
 <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com> <aCcLMhS5kyD60PEX@pollux>
 <e152d20b-c62e-47d9-a891-7910d1d24c6a@igalia.com> <aCcZSA79X9Nk2mzh@pollux>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aCcZSA79X9Nk2mzh@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 16/05/2025 11:54, Danilo Krummrich wrote:
> On Fri, May 16, 2025 at 11:19:50AM +0100, Tvrtko Ursulin wrote:
>>
>> On 16/05/2025 10:53, Danilo Krummrich wrote:
>>> On Fri, May 16, 2025 at 10:33:30AM +0100, Tvrtko Ursulin wrote:
>>>> On 24/04/2025 10:55, Philipp Stanner wrote:
>>>>> +	 * @kill_fence_context: kill the fence context belonging to this scheduler
>>>>
>>>> Which fence context would that be? ;)
>>>
>>> There's one one per ring and a scheduler instance represents a single ring. So,
>>> what should be specified here?
>>
>> I was pointing out the fact not all drivers are 1:1 sched:entity.
> 
> I'm well aware, but how is that relevant? Entities don't have an associated
> fence context, but a GPU Ring (either hardware or software) has, which a
> scheduler instance represents.

Aha! Well.. how it is relevant and do entities not have an associated 
fence context? Well, entity->fence_context.. that was my first 
association this whole time. Never it crossed my mind this is talking 
about the hardware fence context. Proof in the pudding naming should be 
improved.

But I also don't think there is a requirement for fences returned from 
->run_job() to have a single context. Which again makes it not the best 
naming.

>> Thought it would be obvious from the ";)".
> 
> I should read from ";)" that you refer to a 1:N-sched:entity relationship (which
> doesn't seem to be related)?
> 
>>>> Also, "fence context" would be a new terminology in gpu_scheduler.h API
>>>> level. You could call it ->sched_fini() or similar to signify at which point
>>>> in the API it gets called and then the fact it takes sched as parameter
>>>> would be natural.
>>>
>>> The driver should tear down the fence context in this callback, not the while
>>> scheduler. ->sched_fini() would hence be misleading.
>>
>> Not the while what? Not while drm_sched_fini()?
> 
> *whole
> 
>> Could call it sched_kill()
>> or anything. My point is that we dont' have "fence context" in the API but
>> entities so adding a new term sounds sub-optimal.
> 
> In the callback the driver should neither tear down an entity, nor the whole
> scheduler, hence we shouldn't call it like that. sched_kill() is therefore
> misleading as well.

  ->sched_exit()? ->sched_stop()? ->sched_cleanup()?

> It should be named after what it actually does (or should do). Feel free to
> propose a different name that conforms with that.
> 
>>>> We also probably want some commentary on the topic of indefinite (or very
>>>> long at least) blocking a thread exit / SIGINT/TERM/KILL time.
>>>
>>> You mean in case the driver does implement the callback, but does *not* properly
>>> tear down the fence context? So, you ask for describing potential consequences
>>> of drivers having bugs in the implementation of the callback? Or something else?
>>
>> I was proposing the kerneldoc for the vfunc should document the callback
>> must not block, or if blocking is unavoidable, either document a guideline
>> on how long is acceptable. Maybe even enforce a limit in the scheduler core
>> itself.
> 
> Killing the fence context shouldn't block.

Cool. And maybe convert the wait_event to wait_event_timeout with a 
warning to be robust.

Mind you, I still think a solution which does not add new state 
machinery should be preferred.

Regards,

Tvrtko

