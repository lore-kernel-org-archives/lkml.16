Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832011EEA59
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732382; cv=none; b=VwkEO42pgspcUq3SOIlbaSsJk4LeVK6mze2wd7EnKWBTv/LMjcMQt+m4NxlMGAvM9c/oDwip+6FAUcsKtelVLkUDx8I6DM0QDV8HPOc+N6qnuW/6/Yl9+F/cpFmrPizUKrx9axt4vRZFEhL+S7K+obCw20E3aktQHgWJ1GsDwN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732382; c=relaxed/simple;
	bh=1s5VUpfsnLrgZQzcnItw9zwtWIcSEbXxWfNt96WJWRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3/d0JlanoUNFZhqv/Q7821gLjTHUA+fCFr1+cw96kje2PLGiXEb39oODQ9AHVrBNl/80bG4dGXjFE0s+8FTtkuyAjL0VewoKX1yKZwreTbXetgwnHYcsxiZAiSM7bEj9IyS0Wtb3kvC4rJM2O+lCwvSorjp4VJQuPia0DEdp9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=caRmoM1X; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="caRmoM1X"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so47048075e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744732378; x=1745337178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JLTNvpaptplrjpn5KAL5k+FFz54c8FMnV1vnh7J1TI=;
        b=caRmoM1XbBPpexImhybaQTxNStkQnwIHa4lpr6DMrjtQUBTEBE2EoWlAnioQG5KUrX
         t4LZC2JdvmhEGS2oGWtS9iZQ5Jxg7j1w91nz6+xd5ovYOyOIbXPLJW74UdiH0CfPJyv1
         PLUOrHlRo9dY7oWWzeQwjNbSXLEh7TiXhb22BXlWWIZzPR8L1aVHdY0reTty6DnyrBCj
         vWfSfq8YfrSliGd0sfvy2U+yH/yNHRVy/SdeZ/8vfaNKhjImSWRFQ5izEtLBUBkByR9L
         JIkr7V7AS7Ig/lzZ4Yyo9vKIVBPkmcmp+H0j1pj4wNd0t7dalDwzjIiYzbN+UikJAgBA
         SNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732378; x=1745337178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JLTNvpaptplrjpn5KAL5k+FFz54c8FMnV1vnh7J1TI=;
        b=f83w0NR61Skx0TN8XhnOhJSu4oLm+Aqlt8kzylfXXG7/RjqJCWgVWlL0GBeEE/sIIn
         4RoFjxj3xFmKVdQbQHZzD6PvAzsEVUGnHp/joBoBXN8ek0oJI5Mr50rd6Tc4B9svs241
         nSdnEVUUJZ8Vno+b0EXYeU0zVcPR0bzOBEy3eF4kfXUuGRVKr+O8bnrRceEpcdcOmA2F
         +wqGtpZVoLOseDn2XZhWMOrf3t0Rocu/2kMY8+5xg6bfdIcmV4uMzWxOLQR3IIQm99p/
         GMJbhs+4DABfNozTSqFz2ydYKlGEBwLNo6dFcGioCl3IEUvclqWhB09xiLuLwvpp+pfp
         VsLw==
X-Forwarded-Encrypted: i=1; AJvYcCV/t9V8hOhk2SGDOOBm3XqUR6Rsyu8ck5N7S3VtU979khInEV10xxCs5ErSLoncg4oTHBc5jxY397dK+uA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDzRakJXzhoWuoq18uyP84lzyDDGgjKA1sjc3AdN2cAY710zpg
	iOxhFvdG1LQvC3/1EI/WFY/79Rq+qU7xa0zdqX9pFjCdYJT5VSbSd9YrY58mTtY=
X-Gm-Gg: ASbGncuI6TJ8cTuNv2JHj6uoy76oWh0LOITquHIixkAaeFZxV1EAspC8TuxNMLGe1rA
	r7KV2CyNlFriZa++V6sUkaX0D4h5xHmGuCqeeNyiXmw49CFx+I0+56sjizjtwNmerF9y4zejzor
	uy8MSIkiTsZhzIZIpk+Ch5ZMA+/VFQyg5+x7T5JnITIrfKkOMxYHm5mVYItg1KfgVBeAyeSTZsC
	6N2xCeC15hzHiillbRVNQtnk1KxyIVuxzfTdzMrPvVidJUbl12v7W5aXEyOceucsKIRjpVKP5PL
	CiPV2MvfU7c3rrpYKGodF1u8DvQKeIwuj2OjYjlovO8=
X-Google-Smtp-Source: AGHT+IEW4aMzZl2rGLN44yAGHE5w9xSC1sSpotrF9GYoahU/09L/4ARMu3yhHo2dTSnx9WvVaGY6jw==
X-Received: by 2002:a05:600c:5107:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43f3a93379dmr138039845e9.6.1744732377761;
        Tue, 15 Apr 2025 08:52:57 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f204c500bsm222451965e9.0.2025.04.15.08.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 08:52:57 -0700 (PDT)
Message-ID: <77036114-8723-4af9-a068-1d535f4e2e81@linaro.org>
Date: Tue, 15 Apr 2025 16:52:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:perf/core] [perf] da916e96e2:
 BUG:KASAN:null-ptr-deref_in_put_event
To: Peter Zijlstra <peterz@infradead.org>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
 Ravi Bangoria <ravi.bangoria@amd.com>, linux-perf-users@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Frederic Weisbecker <fweisbec@gmail.com>
References: <202504131701.941039cd-lkp@intel.com>
 <20250414190138.GB13096@noisy.programming.kicks-ass.net>
 <Z/3krxHJLaWJTj4R@xsang-OptiPlex-9020>
 <5bc5f54b-ce6a-4834-86d4-5014d44c7217@linaro.org>
 <20250415100840.GM5600@noisy.programming.kicks-ass.net>
 <20250415131446.GN5600@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250415131446.GN5600@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/04/2025 2:14 pm, Peter Zijlstra wrote:
> On Tue, Apr 15, 2025 at 12:08:40PM +0200, Peter Zijlstra wrote:
>> On Tue, Apr 15, 2025 at 10:14:05AM +0100, James Clark wrote:
>>> On 15/04/2025 5:46 am, Oliver Sang wrote:
>>
>>>> yes, below patch fixes the issues we observed for da916e96e2. thanks
>>>>
>>>> Tested-by: kernel test robot <oliver.sang@intel.com>
>>>>
>>>
>>> Also fixes the same issues we were seeing:
>>>
>>> Tested-by: James Clark <james.clark@linaro.org>
>>
>> Excellent, thank you both! Now I gotta go write me a Changelog :-)
> 
> Hmm, so while writing Changelog, I noticed something else was off. The
> case where event->parent was set to EVENT_TOMBSTONE now didn't have a
> put_event(parent) anymore. So that needs to be put back in as well.
> 
> Frederic, afaict this should still be okay, since if we're detached,
> then nothing will try and access event->parent in the free path.
> 
> Also, nothing in perf_pending_task() will try and access either
> event->parent or event->pmu.
> 
> ---
> Subject: perf: Fix event->parent life-time issue
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Tue Apr 15 12:12:52 CEST 2025
> 
> Due to an oversight in merging da916e96e2de ("perf: Make
> perf_pmu_unregister() useable") on top of 56799bc03565 ("perf: Fix
> hang while freeing sigtrap event"), it is now possible to hit
> put_event(EVENT_TOMBSTONE), which makes the computer sad.
> 
> This also means that for the event->parent == EVENT_TOMBSTONE, the
> put_event() matching inherit_event() has gone missing.
> 
> Previously this was done in perf_event_release_kernel() after calling
> perf_remove_from_context(), but with it delegated to put_event(), this
> case is now entirely missed, leading to leaks.
> 
> Fixes: da916e96e2de ("perf: Make perf_pmu_unregister() useable")
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>   kernel/events/core.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -2343,6 +2343,7 @@ static void perf_child_detach(struct per
>   	 * not being a child event. See for example unaccount_event().
>   	 */
>   	event->parent = EVENT_TOMBSTONE;
> +	put_event(parent_event);
>   }
>   
>   static bool is_orphaned_event(struct perf_event *event)
> @@ -5688,7 +5689,7 @@ static void put_event(struct perf_event
>   	_free_event(event);
>   
>   	/* Matches the refcount bump in inherit_event() */
> -	if (parent)
> +	if (parent && parent != EVENT_TOMBSTONE)
>   		put_event(parent);
>   }
>   

Hi Peter,

Unrelated to the pointer deref issue, I'm also seeing perf stat not 
working due to this commit. And that's both with and without this fixup:

  -> perf stat -- true

  Performance counter stats for 'true':

      <not counted> msec task-clock 

      <not counted>      context-switches 

      <not counted>      cpu-migrations 

      <not counted>      page-faults 

      <not counted>      armv8_cortex_a53/instructions/ 

      <not counted>      armv8_cortex_a57/instructions/ 

      <not counted>      armv8_cortex_a53/cycles/ 

      <not counted>      armv8_cortex_a57/cycles/ 

      <not counted>      armv8_cortex_a53/branches/ 

      <not counted>      armv8_cortex_a53/branch-misses/ 

      <not counted>      armv8_cortex_a57/branch-misses/ 


        0.074139992 seconds time elapsed

        0.000000000 seconds user
        0.054797000 seconds sys

Didn't look into it more other than bisecting it to this commit, but I 
can dig more unless the issue is obvious. This is on Arm big.LITTLE, 
although I didn't test it elsewhere so I'm not sure if that's relevant 
or not.

Thanks
James

