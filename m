Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3CA280CC8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328375; cv=none; b=MhX3/ZqVxHIOMnJZW8mkgKdLBnXCmS4RWO9MKLK4eIJkr0CkO/WVA1152tQvybR1SSHi9Zw8RFCXQ1oyGciMu/NSjIqZo1M3U5FKs0+Jb2VewagsA81PX0eLbnAwMjoPceC68v6EJgfWPxeMznFMBkQrEZpR5OK/lx3WnH3HySw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328375; c=relaxed/simple;
	bh=F2R3BFN3tJVseAjeffqmXtgWQxchPkXLPd425AO7/j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYekflVMGK3XzNLIcVnisWxcYV6vYrvX+Kv2GWisXOlbvDq2EoT5rynx96PL4S9W4FbeuFE0tr3zqTA6iL2AwCs5HY1y6ZJMDYs7XWhFaRlEaE+iCPkn/69KT5qdyr6UYqepy0TJ9SCrRzgRyrkeBGjVbou8PfyUifzP2Y4LP68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=K9vw1Xs7; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="K9vw1Xs7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qqc36waS2eM9KRFhP4odJMZbCYBITaK1zvGamxcN6gA=; b=K9vw1Xs7HVg4ZHOb6RnI7LDG93
	pP93G64VQjUiQuhOz3hteOlbfaB6uaGynw8R4vSQiq6BrhuGJQoIWBh2gDC+lgy1hoJM2QXE9y8Mo
	nzQO2N+pxG+mn91rbKZDlvDAVxRfjzpHYeHsp1SMvyUCnAYFEnCnK4BPrmBsvw17LCmPTycm6JO7a
	e462UcrMIc1wRM7vSfhr0+YqAF78SFLDya21SzHeZsJ5nHRJms9iKFC6hFygqw4LF3Gz5tDrepG02
	Q5qreWmoyuq0oiM/q3wG1q6QJAtV3IwVuI5e6BTjGGIzQn+V5/VnPolN5m0nsGIDS7OgKgTtI4+Cw
	/2+HaCXg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u7DdJ-006SEy-4Z; Tue, 22 Apr 2025 15:25:53 +0200
Message-ID: <3afc0582-6e25-45f7-8f9d-90545ae68258@igalia.com>
Date: Tue, 22 Apr 2025 14:25:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com> <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <649c7fe3469c39496db89de6951d9f2b61c36576.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <649c7fe3469c39496db89de6951d9f2b61c36576.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22/04/2025 13:00, Philipp Stanner wrote:
> On Tue, 2025-04-22 at 13:13 +0200, Danilo Krummrich wrote:
>> On Tue, Apr 22, 2025 at 11:39:11AM +0100, Tvrtko Ursulin wrote:
>>> Question I raised is if there are other drivers which manage to
>>> clean up
>>> everything correctly (like the mock scheduler does), but trigger
>>> that
>>> warning. Maybe there are not and maybe mock scheduler is the only
>>> false
>>> positive.
> 
> For clarification:
> 
> I messed up the comment from the cover letter.
> 
> What I did was run the *old* unit tests (v5 IIRC) from Tvrtko that
> still had the memory leaks. Those then trigger the warning print, as is
> expected, since they don't provide fence_context_kill().
> 
> The current unit tests are fine memory-leak-wise.
> 
> IOW, both with Nouveau and the unit tests, everything behaves as
> expected, without issues.

Hmm how? Pending list can be non-empty so it should be possible to hit 
that warn.

Regards,

Tvrtko

>> So far the scheduler simply does not give any guideline on how to
>> address the
>> problem, hence every driver simply does something (or nothing,
>> effectively
>> ignoring the problem). This is what we want to fix.
>>
>> The mock scheduler keeps it's own list of pending jobs and on tear
>> down stops
>> the scheduler's workqueues, traverses it's own list and eventually
>> frees the
>> pending jobs without updating the scheduler's internal pending list.
>>
>> So yes, it does avoid memory leaks, but it also leaves the schedulers
>> internal
>> structures with an invalid state, i.e. the pending list of the
>> scheduler has
>> pointers to already freed memory.
>>
>> What if the drm_sched_fini() starts touching the pending list? Then
>> you'd end up
>> with UAF bugs with this implementation. We cannot invalidate the
>> schedulers
>> internal structures and yet call scheduler functions - e.g.
>> drm_sched_fini() -
>> subsequently.
>>
>> Hence, the current implementation of the mock scheduler is
>> fundamentally flawed.
>> And so would be *every* driver that still has entries within the
>> scheduler's
>> pending list.
>>
>> This is not a false positive, it already caught a real bug -- in the
>> mock
>> scheduler.
>>
>> - Danilo
> 

