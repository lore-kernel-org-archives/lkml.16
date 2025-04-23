Received: from 190-102-104-130.static.hvvc.us (190-102-104-130.static.hvvc.us [190.102.104.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5A1A3161
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=190.102.104.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416651; cv=none; b=RnXGBvDCMi9//kAqxQZ/E0XePKxcadbjDUgn9gI4wz/QcvPtaDRwT+AR+U6yJ2eKS50wI/ADQi9RemBYb6hc0y+OR8Awr8uQt4YwVuC+4DellTueKl2/7PAvPxAyktJdUjAzMLEFl83O3MyOOxu2XQsHt+dULUf/iLpjJkRC/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416651; c=relaxed/simple;
	bh=hXi467e5lK9y8o8T9Dbl+dFVYltnzBAE6NeASwbtAU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFaZnr+GH6jYzpUvk516XFuDWfgTtqSc62RqVY2d+wJXstVaPBYozSpoDcF2bESLr0HDJYkTGOwDHsH8uQTVRsh3hLcSB9+Bjc+KUB+vj9g5g4m3rxsQkX4lL5T6kFoMiBHWWKhrMQP1DNOPn8b/dAuMI9zHaoFNuf4sd9GN2Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=phoronix.com; spf=pass smtp.mailfrom=phoronix.com; arc=none smtp.client-ip=190.102.104.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=phoronix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phoronix.com
Received: from c-24-15-38-32.hsd1.in.comcast.net ([24.15.38.32]:5249 helo=[192.168.1.194])
	by milan.phoronix.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <Michael@phoronix.com>)
	id 1u7abR-0000000F7nL-2hOf;
	Wed, 23 Apr 2025 09:57:27 -0400
Message-ID: <173297ef-d806-4c5f-bc88-90b5bad03671@phoronix.com>
Date: Wed, 23 Apr 2025 08:57:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.15-rc3
To: Vlastimil Babka <vbabka@suse.cz>, Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Airlie <airlied@gmail.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Sebastian Sewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
 <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
 <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
 <mhewqdlvb5ahqordw2nuebq7yvsxo7xvdas4vl6gehmbmypcil@v3fn7nzllglj>
 <896a67ec-9f48-4137-9d34-4bb16861e284@phoronix.com>
 <27d55aab-c2d8-4edf-bab5-91a04b8383c5@suse.cz>
Content-Language: en-CA
From: Michael Larabel <Michael@phoronix.com>
In-Reply-To: <27d55aab-c2d8-4edf-bab5-91a04b8383c5@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - milan.phoronix.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - phoronix.com
X-Get-Message-Sender-Via: milan.phoronix.com: authenticated_id: michael@phoronix.com
X-Authenticated-Sender: milan.phoronix.com: michael@phoronix.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 


On 4/23/25 3:42 AM, Vlastimil Babka wrote:
> On 4/23/25 02:54, Michael Larabel wrote:
>> On 4/22/25 7:12 PM, Shakeel Butt wrote:
>>> Ccing Michael
>>>
>>> On Tue, Apr 22, 2025 at 04:37:59PM -0700, Alexei Starovoitov wrote:
>>>> On Tue, Apr 22, 2025 at 4:01 PM Dave Airlie <airlied@gmail.com> wrote:
>>>>>> Alexei Starovoitov (2):
>>>>>>         locking/local_lock, mm: replace localtry_ helpers with
>>>>>> local_trylock_t type
>>>>> This seems to have upset some phoronix nginx workload
>>>>> https://www.phoronix.com/review/linux-615-nginx-regression/2
>>>> 3x regression? wow.
>>>> Thanks for heads up.
>>>> I'm staring at the patch and don't see it.
>>>> Adding more experts.
>>> Hi Michael,
>>>
>>> Can you please share a bit more on your nginx workload and how can we
>>> reproduce locally? In the mean time, I can try netperf locally to
>>> reproduce.
>>>
>>> I do have some followup optimizations [1, 2] which hopefully are aimed
>>> for next release but we can try those as well.
>>>
>>> [1] https://lkml.kernel.org/r/20250416180229.2902751-1-shakeel.butt@linux.dev
>>> [2] https://lkml.kernel.org/r/20250410025752.92159-1-shakeel.butt@linux.dev
>>>
>>> thanks,
>>> Shakeel
>> The Nginx test case is a fairly stock Nginx build measuring HTTPS
>> throughput for serving some static web page with Wrk used as the
>> stressor, all on the same host for stressing just the local host. All of
>> the assets and execution scripts used for that Nginx test in raw form
>> are here -
>> https://openbenchmarking.org/innhold/c7b555063f5732b4f1bb08444e258984d1dbb94b
>> Let me know if any problems reproducing, etc.
>>
>> Thanks, I can try out those patches tomorrow. At the moment on that same
>> server currently running through some of the other workloads I also
>> found regressed on Linux 6.15 GIt to see if attributed to same commit or
>> not.
> Hi, please try the following patch. I also realized I left you out of my previous
> replies leading to it, due to replying to an earlier mail of the thread:
> https://lore.kernel.org/all/0981c1fe-05d2-4bab-a0a4-6dc5666d98d7@suse.cz/
>
> Thanks,
> Vlastimil


Thanks, Vlastimil. I tested your later patch @ 
https://lore.kernel.org/all/d1c0f057-63c8-4be5-9638-d1a67d9b9e15@suse.cz/#t

I can confirm that latest Git + that patch does indeed correct the 
regression affecting Nginx. All the Nginx runs I have carried out this 
morning are back aligned with the 6.14 and the results prior to the 
bisected commit.

Currently repeating tests for other regressed workloads to confirm there 
but at least for the Nginx case is resolved by that patch.

Michael


>
> ----8<----
> From: Vlastimil Babka <vbabka@suse.cz>
> Date: Wed, 23 Apr 2025 10:21:29 +0200
> Subject: [PATCH] locking/local_lock: fix _Generic() matching of
>   local_trylock_t
>
> Michael Larabel reported [1] a nginx performance regression in v6.15-rc3 and
> bisected it to commit 51339d99c013 ("locking/local_lock, mm: replace
> localtry_ helpers with local_trylock_t type")
>
> The problem is the _Generic() usage with a default association that
> masks the fact that "local_trylock_t *" association is not being
> selected as expected. Replacing the default with the only other expected
> type "local_lock_t *" reveals the underlying problem:
>
> ./include/linux/local_lock_internal.h:174:26: error: ‘_Generic’ selector of
> type ‘__seg_gs local_lock_t *’ is not compatible with any association
>
> The local_locki's are part of __percpu structures and thus the __percpu
> attribute is needed to associate the type properly. Add the attribute
> and keep the default replaced to turn any further mismatches into
> compile errors.
>
> The failure to recognize local_try_lock_t in __local_lock_release()
> means that a local_trylock[_irqsave]() operation will set tl->acquired
> to 1 (there's no _Generic() part in the trylock code), but then
> local_unlock[_irqrestore]() will not set tl->acquired back to 0, so
> further trylock operations will always fail on the same cpu+lock, while
> non-trylock operations continue to work - a lockdep_assert() is also
> not being executed in the _Generic() part of local_lock() code.
>
> This means consume_stock() and refill_stock() operations will fail
> deterministically, resulting in taking the slow paths and worse
> performance.
>
> Fixes: 51339d99c013 ("locking/local_lock, mm: replace localtry_ helpers with local_trylock_t type")
> Reported-by: Michael Larabel <Michael@phoronix.com>
> Closes: https://www.phoronix.com/review/linux-615-nginx-regression/2 [1]
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   include/linux/local_lock_internal.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
> index bf2bf40d7b18..8d5ac16a9b17 100644
> --- a/include/linux/local_lock_internal.h
> +++ b/include/linux/local_lock_internal.h
> @@ -102,11 +102,11 @@ do {								\
>   		l = (local_lock_t *)this_cpu_ptr(lock);			\
>   		tl = (local_trylock_t *)l;				\
>   		_Generic((lock),					\
> -			local_trylock_t *: ({				\
> +			__percpu local_trylock_t *: ({			\
>   				lockdep_assert(tl->acquired == 0);	\
>   				WRITE_ONCE(tl->acquired, 1);		\
>   			}),						\
> -			default:(void)0);				\
> +			__percpu local_lock_t *: (void)0);		\
>   		local_lock_acquire(l);					\
>   	} while (0)
>   
> @@ -171,11 +171,11 @@ do {								\
>   		tl = (local_trylock_t *)l;				\
>   		local_lock_release(l);					\
>   		_Generic((lock),					\
> -			local_trylock_t *: ({				\
> +			__percpu local_trylock_t *: ({			\
>   				lockdep_assert(tl->acquired == 1);	\
>   				WRITE_ONCE(tl->acquired, 0);		\
>   			}),						\
> -			default:(void)0);				\
> +			__percpu local_lock_t *: (void)0);		\
>   	} while (0)
>   
>   #define __local_unlock(lock)					\
