Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34F02566D3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914945; cv=none; b=utTOQRSKShEjw4rOoFBRknOKaHaDjr+8lQQ0VrsgThlkZzwSnoz55SOhYe8Bg8bGhy+ktc0JMLc4B6vnznR/D30j2FgugF9ibnCl8xRUJ8eQ7zKwqZnfm+WJYI89I+huM4gaM/AYS00qStPjOqwcFk9Xsn5IuJUb2ONST6wFDaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914945; c=relaxed/simple;
	bh=ylRvGdqR1iuYdIlK/B1moIu88b+roLnO7HtPz1zB85Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JoildTDvFywnMXYxdBDzAGBkqAugop/oynDHBeuKWA0NKTXryMLwLlbYx+g5ivTkNVchjyTU8OgL0SmLGrBNi9yHmS/FCsFTP4dZsNbWTwXQS9VGgxqvb4Cl15uYySo3Ub3QQmx7lXrF1E9kP3AH2ozoa0BA0QGIG4ex7ZfdXP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzFnfkVw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzFnfkVw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so1176451f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744914941; x=1745519741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDWy0FSBv295dE0TZfCJ23cymB+rWP6UWZ/2MeAOnfE=;
        b=UzFnfkVwW2BX1VauQpVO1+7+yVu03K9X3gBQdUHY3wqJDk1O7/BT9f+/I22Sdl98bb
         LTsfbM6QbkvAiz6cDbJqrp5rXaVjavXKdVPdRVVz4SWSB1GVYZyCKsvSwhgkV0Ecl1lG
         z2165SxQIT1kyMN/M68H2HZD8DWeQHTT+f+mUFwm51DCotLwsuB5sqkiMwndCV6fJP4P
         9QW0sIm9AUd2IH9PIUmEPeHH10SfXjszoHVVTHxBoeG9KRZLIUwWAu4BeIjPHtGDbEky
         nxOx+F46r5fYN5ge4PLLZuFnmIvAeeD0cqFIuXpfB080bqs7oi9wIJGsthK+AwajG4/o
         DDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744914941; x=1745519741;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDWy0FSBv295dE0TZfCJ23cymB+rWP6UWZ/2MeAOnfE=;
        b=eX6G3dDuM3kYy6oXGGdeKdb3jVkN0Ypqn/xfsCPfIMCcurCfkJGWpHuh77K50DXUqE
         KtF7X9HVNPWRsSoArXmtT9UYl3AKOhgnoEdUochGr7OAj8T6xi6Qp0qQDY5WmZfDGYkS
         6sy/Z38EXoIIYxPPJsELbk/7i8V08tKXty6mX5ObfkTHQ1K+LT16u9XbsNd9fMJnm6Wh
         XuBHR5LLobSld8Gwf0HJBcV4nxPuwFwiJkOClTtwHSrDpcPJn3nFByY14vB5j+chBUMD
         jPe/ZHhhs1/zYO6fHFFhWvh64Cttzlk3yE1arnjGPHD7dSaGaTBiptxz1iJF80gkRpxv
         yDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUoVXnlE9/wI9C0Majkjf1Iv6Kut6OxRexUJXhKjG7F5Jthph1zyuqb9Fn1OT/8iGMEXz3xL/I1jzs87c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWlKqZv0CfWk2epZlIfjJFFshQXV6r1XStKvfkS9i1nCXUHebf
	2Q+On4sKTAgdF190WftMjlURxN265zPQr6wRT9uidxZHZcSWFyYy
X-Gm-Gg: ASbGnctiVcC6vsjJiiN26/NSzGhXnj0bDfBcAdEPRHw3o4yRVvwbbsa1UZc2JJA75Fr
	zMP8s0Z7cNZmbtfhM6vA8663EtO+SSbic74SiP1rrtRCE4nx0yt0lAideZWw5kYMUEWpb905KzQ
	+dxzRKEBy3wDa04S7JW5oAC7XTegbjn/k4x9yFdszQsWcw4MhnQfFzwnoZS7J/C1b+nWwcmYX6R
	yBmeWhIjiKo7RQASSwlhWikmEHv+1C5NhEgIiWtZPavawhdRVLdyxGNpaWK47E1Thqb4lehmXGb
	Utdl5YiRHMvx86t7e3MlX2jXfL15bRViYM06v3sc2KdU7Fx1z/8tvfblnRoyh76Xn+xePKfaMjK
	x5M4W65ZROq2NQjQNRawVb4NKPOXvmQbJJw==
X-Google-Smtp-Source: AGHT+IH5dwT9AbAtaTlj5uxeVfdRvRULPw9LQYqbZFneLGifWjlBTCmEa1W+LiPp8Bep12yajdYiYg==
X-Received: by 2002:a5d:584b:0:b0:394:ef93:9afc with SMTP id ffacd0b85a97d-39efba4610emr23622f8f.18.1744914940958;
        Thu, 17 Apr 2025 11:35:40 -0700 (PDT)
Received: from ?IPV6:2a02:6b67:d752:5f00:c46:86ac:45ea:7590? ([2a02:6b67:d752:5f00:c46:86ac:45ea:7590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406abbe298sm293295e9.3.2025.04.17.11.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 11:35:40 -0700 (PDT)
Message-ID: <33632210-6de3-445b-8f9c-d0fbcf3deab2@gmail.com>
Date: Thu, 17 Apr 2025 19:35:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
From: Usama Arif <usamaarif642@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250416180653.3438158-1-usamaarif642@gmail.com>
 <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com>
 <72pac6pkjebt6xo7engiuuu7r3zr7fu6fh6bj77f22m7gslxgr@3gjawofplas2>
 <CAJuCfpHcUfXb8RaGCExLc5U2HK3xcA0CjY1diM=S6DDqNFFykg@mail.gmail.com>
 <ogiahgnqihzg6nfew6oifgzjvetiwo25utp6jwskrhw4axdevp@rwqbgeraivym>
 <CAJuCfpE3JgJVB3+-ZZPU3kFDjPSJyo4WFtwmtMUnXJ6q0E09dA@mail.gmail.com>
 <25ac1d9c-c7e4-4dcf-b297-254fa51c6f2a@gmail.com>
Content-Language: en-US
In-Reply-To: <25ac1d9c-c7e4-4dcf-b297-254fa51c6f2a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 17/04/2025 18:50, Usama Arif wrote:
> 
> 
> On 17/04/2025 17:00, Suren Baghdasaryan wrote:
>> On Thu, Apr 17, 2025 at 8:47 AM Shakeel Butt <shakeel.butt@linux.dev> wrote:
>>>
>>> On Wed, Apr 16, 2025 at 05:11:11PM -0700, Suren Baghdasaryan wrote:
>>>> On Wed, Apr 16, 2025 at 2:41 PM Shakeel Butt <shakeel.butt@linux.dev> wrote:
>>>>>
>>>>> On Wed, Apr 16, 2025 at 02:08:31PM -0700, Suren Baghdasaryan wrote:
>>>>>> On Wed, Apr 16, 2025 at 11:06 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>>>>>
>>>>>>> With this Kconfig option enabled, the kernel stores allocation tag references
>>>>>>> in the page flags by default.
>>>>>>>
>>>>>>> There are 2 reasons to introduce this:
>>>>>>> - As mentioned in [1], compressed tags dont have system memory overhead
>>>>>>> and much lower performance overhead. It would be preferrable to have this as
>>>>>>> the default option, and to be able to switch it at compile time. Another
>>>>>>> option is to just declare the static key as true by default?
>>>>>>> - As compressed option is the best one, it doesn't make sense to have to
>>>>>>> change both defconfig and command line options to enable memory
>>>>>>> allocation profiling. Changing commandline across a large number of services
>>>>>>> can result in signifcant work, which shouldn't be needed if the kernel
>>>>>>> defconfig needs to be changed anyways.
>>>>>>
>>>>>> The reason tag compression is not the default option is because it
>>>>>> works only if there are enough free bits in the page flags to store a
>>>>>> tag index. If you configure it to use page flags and your build does
>>>>>> not have enough free bits, the profiling will be disabled (see
>>>>>> alloc_tag_sec_init()).
>>>>>
>>>>> Is it possible to fail the build in that case i.e. check the page flags
>>>>> availability at build time?
>>>>
>>>> The difficulty is finding out the number of allocation tags in the
>>>> kernel before it gets built. Maybe there is a way to add an additional
>>>> post-build stage to run that check.
>>>
>>> Yeah that would be good to have.
>>>
>>>> But even then making this option
>>>> default and causing build failures does not seem like a good idea to
>>>> me but maybe I'm being too cautious?
>>>
>>> Oh my question was orthogonal to the patch. Basically some users may
>>> want build time guarantee for this and they can enable such
>>> build-failing opt-in config/check.
>>
>> Yes, that would require the post-build step to check the number of
>> tags vs the number of available page flag bits. I'll add it to my TODO
>> list but it won't be at the top, sorry :) Volunteers to help with that
>> would be highly appreciated.
> 
> Hi Suren,
> 
> A question orthogonal to the patch, the defconfig entry is defined as below:
> 
> config MEM_ALLOC_PROFILING
> 	bool "Enable memory allocation profiling"
> 	default n
> 	depends on MMU
> 	depends on PROC_FS
> 	depends on !DEBUG_FORCE_WEAK_PER_CPU
> 	select CODE_TAGGING
> 	select PAGE_EXTENSION
> 	select SLAB_OBJ_EXT
> 
> i.e. we select PAGE_EXTENSION even if we use compressed profiling and use page flags
> instead of page extension. Which means the 0.2% (8 bytes per struct page) memory overhead
> will still exist even when we dont need it?
> 
> Should we have some defconfig option (happy with any other way) that only allows compressed
> profiling (otherwise nothing), so that we don't have the dependency on page extension
> and thus not have the overhead if we only plan to use compressed profiling?
> 
> Thanks


Johannes pointed out the .need function of page_alloc_tagging_ops, i.e. need_page_alloc_tagging,
so page extensions wouldn't be enabled and hopefully there is no memory overhead when
mem_profiling_compressed is true. Let me know if my understanding is wrong.
And sorry for the noise!
