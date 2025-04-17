Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1D239586
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889270; cv=none; b=c6TFMuLqXKVeiFinBF11Uwc+jxxXAUdLX/yeTCYYPnKmSPVWJeXuXbht6jX9dxakOnCX3Eoa7jRO+/Fj/Kl9IeV56dAtkJiSb2qMs5/pOvgBqj/AHCIy4mW2q7phQDMpSwFWK0N2ohcn30L+2i3FdG2cqK8Brj/IUJ+qXZQooWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889270; c=relaxed/simple;
	bh=1u1es34ZEsnn78fuTN+H7GucVaaez2L/ecju3pZniiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kE6T6/O2KETFMKKJCypZ4ftg6ToMq0bsf5MIyLyD0MAHtfN0M0MRGsrh/4gBozhJmF5oLjSlKTvde97M+uRxJH4ge4haWQK/RNg4H0NHl5edFZVRj30vw4Isbozn6lWBOJjs+SoU2jn/lOK68kRRO1DhRKNYI9fU5GmcQhMKpqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=K47WesQY; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="K47WesQY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=m/7PFydCEc2cZqSSU1AuQ2J36xZLv3+FkoNbKaaeGj4=; b=K47WesQYhwNtLulRh8JWWEZpT3
	p543PrdOuRmvUtpC5s4B/QylNakqkKZFYzenYDKgzg7UfwspTCXs6+3lZUEqw8gfr4t+g1eD4bQm+
	tmiskSzxz//9oj1DZfIlBpgmWLCwU+7GGtx6MxUfsarejvkYq4aKdhYN3q1alix4r3DD6TZReDc/h
	NFkyfdwKvrKy4m/hVqA1RiFJ0xncu+b8I9x2PJD7j5+einpRpvmwpDh5BiAyjZh9jLRZhPY7UUlZJ
	0JE9JAuuiS1aLQNhg3YvtFSB9rJLgpMcqnPiJP9q1M3U3nwlpKs+4MNERjpWJbG8niAVAhD29OMHE
	R1HNyBaw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u5NP0-000mgU-4r; Thu, 17 Apr 2025 13:27:30 +0200
Message-ID: <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>
Date: Thu, 17 Apr 2025 12:27:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17/04/2025 08:45, Philipp Stanner wrote:
> On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
>> drm_sched_fini() can leak jobs under certain circumstances.
>>
>> Warn if that happens.
>>
>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
> 
> I hear a lot of amazed silence for this series ^_^
> 
> If there's no major pushback, my intention is to pull this in once the
> blocking Nouveau-bug has been fixed (by pulling my patch).

It was on my todo list to read it but failed to get to it due various 
reasons.

I only managed to skim over it it and am not quite convinced. But 
because I did not have time to think about it very much my feedback at 
this point is not very deep.

On the high level I understand for nouveau the series is "net zero", 
right? No leaks before, no leaks after. What about other drivers? Which 
ones have known leaks which could be addressed by them implementing this 
new callback?

Presumably you would document the callback should only be implemented by 
drivers which are 100% sure the clean up can always reliably done? 
Otherwise unkillable process on stuck hardware or drivers with not good 
enough reset support can still happen. (Which would be worse than a leak 
on shutdown.)

Have you thought about any observable effects from the userspace point 
of view? For example something if which now works, such as submitting a 
job which writes to a shared buffer and then exiting could stop working 
after the callback is implemented? I don't see it, because it would be 
unreliable even today (timing dependent whether job is in the queue or 
scheduled at exit time) so just thinking out loud.

Also, since the cover letter mentions job reference counting was one 
idea that was discarded another related problem is about the lifetimes. 
I think it would be good to discuss potentially reference counting 
"everything" because for instance today I can crash the kernel trivially 
with the xe driver*. Probably other drivers too.

Problem exactly is that jobs can outlive the entities and the scheduler, 
while some userspace may have a dma fence reference to the job via sync 
file. This new callback would not solve it for xe, but if everything 
required was reference counted it would.

Back to the series.

On the design level it feels like it adds too much state machine and 
makes things hard to follow/maintain. It would be nice to find a 
solutiuon where we end up with less state machine and not more.

On the low level there are some patch ordering and naming, spelling and 
other small improvements to be made.

But as said at the start, I would need to set aside more time to provide 
better comments and/or ideas.

*)
https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2

> In the mean time, let me review my own stuff:
> 
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 6b72278c4b72..ae3152beca14 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
>> *sched)
>>   	sched->ready = false;
>>   	kfree(sched->sched_rq);
>>   	sched->sched_rq = NULL;
>> +
>> +	if (!list_empty(&sched->pending_list))
>> +		dev_err(sched->dev, "%s: Tearing down scheduler
>> while jobs are pending!\n",
>> +			__func__);

It isn't fair to add this error since it would out of the blue start 
firing for everyone expect nouveau, no? Regardless if there is a leak or 
not.

> 
> The "%s" here will be removed since dev_err() alreday prints the
> function name.

It does? But anyway, function name is redundant and irrelevant and 
should not be logged IMO. I would rather prefer we replaced sched->dev 
with sched->drm so could use drm loggers for clarity throughout.

> I find this dev_err() print more useful than the stack a WARN_ON prints
> (telling you about invalid_asm_exec_op or stuff like that).
> 
> Plus, I guess the places where drivers call drm_sched_fini() are very
> well defined and known, so a callstack wouldn't really be useful in the
> first place.

Agreed.

Regards,

Tvrtko

> 
> P.
> 
>>   }
>>   EXPORT_SYMBOL(drm_sched_fini);
>>   
> 

