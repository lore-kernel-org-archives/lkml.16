Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537771FFC59
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390818; cv=none; b=oirGwRlynOU1bk7nQru/TPaioeAFouvEz58lF3wc+fYUTczFEU3jpkKQJD+FNM2ODs6tnPgZCfjON3quVxg6A/S7oHVwu7xwRok6whrc26svhl1jP1Nk7hMnHwQyZjXXhWp/DOn+YoRzsywpD2VO/Bk3YPhVfHux0BEswScGsyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390818; c=relaxed/simple;
	bh=b2Sr/MsRkE5BM1U/RRwsfyZytzDMbcdUEiOUbJtShAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwLX+ktbzRlwzx1KxftpJnNTpdSvesJQ73+D6ENhZzN20krAs8tzw8/aOjgXavgVA8U87dBNlojNEk1xXBIlRGfcufPxlLBDs5YQVRGADik8IaAI2UFd3TlA/YQ7eH/V9zhTbNqwm58T2MFU7VTcSqd5qhMKhDJkoEUFAHslhgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=sNDE4mXN; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="sNDE4mXN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=33LuOT6Rs2ct5V7e47Ggg4e4lle/qv4GOK0Jy+JLNwY=; b=sNDE4mXNb34yqHpGtSOGcd2ULX
	F9UZNajD15nRSf4+OjQAwpFnsbclblsRBBZD+aHrJIJL8rZgrKQ5ypKWLWVfipWoIujIIPV3svJB/
	wH9QDmZEiqZxkBa9m7PHAbpgfiPhJA1zjC7D2dQjdddJNHJ/9bQE5XQgNfVsYooOfkcO4dxZ3Yqe/
	u4HuNwJJTJVYFOPRXyd2UX1LLbCXZ8fZOtbFyEy45I5kvv2g3m0N0bAJk5zTuO+k997UD19QkCh1s
	jzuUTQZCE2PWtpw0WuLEiXvzbYG8rroPiTzVTT3yuYtXQ5DoPyrspbJytaz79LfCbveKNeHb3kgBt
	ETe3wRPA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uFs4f-0092Pg-3K; Fri, 16 May 2025 12:19:51 +0200
Message-ID: <e152d20b-c62e-47d9-a891-7910d1d24c6a@igalia.com>
Date: Fri, 16 May 2025 11:19:50 +0100
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
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aCcLMhS5kyD60PEX@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 16/05/2025 10:53, Danilo Krummrich wrote:
> On Fri, May 16, 2025 at 10:33:30AM +0100, Tvrtko Ursulin wrote:
>> On 24/04/2025 10:55, Philipp Stanner wrote:
>>> +	 * @kill_fence_context: kill the fence context belonging to this scheduler
>>
>> Which fence context would that be? ;)
> 
> There's one one per ring and a scheduler instance represents a single ring. So,
> what should be specified here?

I was pointing out the fact not all drivers are 1:1 sched:entity. So 
plural at least. Thought it would be obvious from the ";)".

>> Also, "fence context" would be a new terminology in gpu_scheduler.h API
>> level. You could call it ->sched_fini() or similar to signify at which point
>> in the API it gets called and then the fact it takes sched as parameter
>> would be natural.
> 
> The driver should tear down the fence context in this callback, not the while
> scheduler. ->sched_fini() would hence be misleading.

Not the while what? Not while drm_sched_fini()? Could call it 
sched_kill() or anything. My point is that we dont' have "fence context" 
in the API but entities so adding a new term sounds sub-optimal.

>> We also probably want some commentary on the topic of indefinite (or very
>> long at least) blocking a thread exit / SIGINT/TERM/KILL time.
> 
> You mean in case the driver does implement the callback, but does *not* properly
> tear down the fence context? So, you ask for describing potential consequences
> of drivers having bugs in the implementation of the callback? Or something else?

I was proposing the kerneldoc for the vfunc should document the callback 
must not block, or if blocking is unavoidable, either document a 
guideline on how long is acceptable. Maybe even enforce a limit in the 
scheduler core itself.

Regards,

Tvrtko

