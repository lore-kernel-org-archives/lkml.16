Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E6245020
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744912253; cv=none; b=Nsf5J+EFhcJ8k6L/797OdOj2Jtt5pcX6M7BVo5mXnVeM0XKlkGWRbqOC5Swudq8/SFefIPZqi4k8JBozHYFSuAR8sLd3UwnaLYUIJ/UWyTh9VCmDrhnls6gTT2UaqxZg+wzBnNKaEoYWDFlgj6LIFGmAPogRfx/+R1CZkGVfqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744912253; c=relaxed/simple;
	bh=xU+Ub2pz1MmrAYtgcSogtgx+Zh+dkjYo4CLqOFQ1YFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FqiDPConXlhB/l5IGz51fK8ofaY+9IAJBlK7VjhK54FzryCFE3VSCOt7ZqW/e4uubD3CZYkX6z5VPvCZfthdn7NNHrv7n96G9ySLnMZH6pn6pE2YVZ1UjmmLrQx9sg18BDg+MGCwsd3jdcPUkzyAFKFr0ZmNoBMZn1KzrNyYC9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKlIunNz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKlIunNz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so8374945e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744912250; x=1745517050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wY6w8TH9Q+VdzLtPkQXB54SVYMjTjltbub+aLf76WgY=;
        b=SKlIunNzD+3y1MXBdkouWBhxsxnZcLRT4dOnnKuaGzPwi7/zcrjKFM4EozxrfdcH+W
         j4jnxtoHa5BttVemCBqjEVX+DmKgIJqnFxpQaR4fEWYaiuRFD/GMlXtKrwHOr/HooXOz
         HG+FLAZh/Dy6tUeUcJ2GsAS1MzJM2oE8G+4b8XnfvFz9/9VL2hl/c7mV7JQn3a3Oh0VQ
         u4FKa2IfniILPVIXYoWrdGaqMbc+dYSP3ITBLGeNrlep79OG4gF6XtuaaCi+Wl2BuCr/
         +uApF8gPyz8IHjXVd+h4vw5IePY27f7lIWoWyQXGAy8kuJ5ZDL08FH7RFD9AdY0A/3L6
         8b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744912250; x=1745517050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wY6w8TH9Q+VdzLtPkQXB54SVYMjTjltbub+aLf76WgY=;
        b=D21m17ZZovL82/q5Ozb7dy2DzyjkoQdF0jUYrprM+Rkwv0qg18RmTD5z4l5A1MY+50
         9gjOF590n9gr+I06rbsgzHWWVF5F+MynyWJXxe117+uAKt18zI//Nb80YgRHPrULe3di
         Idelr+wERbpxdTLiA2z+3FSjcnjbhMPk+BaUwSpA/rWqzyBvZ+ViOzNqWgXWZEvkDlP/
         tL5UDJmr8nJrxMUDUcbwl/TSAozhRZKnYZcyUTtBHxSaUeBEawmZCdUIWA5HVYHt9+nm
         PtQ2bmPBZ2VmXZ2mBs4LIA4bJWd0sYIbU+qRdEiBQh1gjx6iL6MJ2lMdDxtKYVD2Qps2
         45qg==
X-Forwarded-Encrypted: i=1; AJvYcCVioDFd6BuV8tmRAOBg4ozMsc4yE+RJ12up/cmo18T2QuqoL1lz/mIEHhBsmvEDul+6BRqd+ScyTOh6pMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwg0xhKnAAS+Aboi/8tYLH239rg9k4AKryh0VHJgWnvmyKus0J
	RUIWPlFB1jEfZTyAbjzgEXsTx9dQOZJSrdMvPBQvpOeSreeKVQttr3KjuImU
X-Gm-Gg: ASbGnctUTZMatrp2O0J6Z3ZlZnzoT6vGFm0y7xdtcRa8MPOMlumQtY9L0hId6a4Gb/i
	/8cu4UWQ8NNXK4JfGPfNcoztqM8fi10KcJxlT0a9tdRoyIdfBJPoGzbJlFwQXCcFnJQ4hyK5JxG
	uG+XCwTjw81uME/kSBec6vYfTOYPc9CeWWtq5NZ3RUf3CuydmEiKiyitYkJ5hr30jRCKmYKF/2p
	hd1N2YL8sQ0SeQBij/LKvOSF9+w2B6/Nd6f77mOkq+np6JhXQ/x8wDbbNpAqmmT+XIG0BUc3ejl
	H2v0QYbADQbmpmd8ojgIeyhhDp9OqLdi09M3zq7ldaARR/Yq7w4O/Ou3CiXcE4WzODwKVXodM3a
	AXVpsTMunfUYGJXK+R7LC/sYVsOC1DVSZkQ==
X-Google-Smtp-Source: AGHT+IFx+EV6MaaXa09YxGdxb0I1bxWeMUdH/lPcryr996yGdvxOdd7NFB53GcnVDqF0YV0bnQ0+Zg==
X-Received: by 2002:a05:600c:5012:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-4405d5fd33bmr78066495e9.2.1744912249911;
        Thu, 17 Apr 2025 10:50:49 -0700 (PDT)
Received: from ?IPV6:2a02:6b67:d752:5f00:c46:86ac:45ea:7590? ([2a02:6b67:d752:5f00:c46:86ac:45ea:7590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c7eeesm64545105e9.1.2025.04.17.10.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:50:49 -0700 (PDT)
Message-ID: <25ac1d9c-c7e4-4dcf-b297-254fa51c6f2a@gmail.com>
Date: Thu, 17 Apr 2025 18:50:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
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
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAJuCfpE3JgJVB3+-ZZPU3kFDjPSJyo4WFtwmtMUnXJ6q0E09dA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 17/04/2025 17:00, Suren Baghdasaryan wrote:
> On Thu, Apr 17, 2025 at 8:47 AM Shakeel Butt <shakeel.butt@linux.dev> wrote:
>>
>> On Wed, Apr 16, 2025 at 05:11:11PM -0700, Suren Baghdasaryan wrote:
>>> On Wed, Apr 16, 2025 at 2:41 PM Shakeel Butt <shakeel.butt@linux.dev> wrote:
>>>>
>>>> On Wed, Apr 16, 2025 at 02:08:31PM -0700, Suren Baghdasaryan wrote:
>>>>> On Wed, Apr 16, 2025 at 11:06 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>>>>
>>>>>> With this Kconfig option enabled, the kernel stores allocation tag references
>>>>>> in the page flags by default.
>>>>>>
>>>>>> There are 2 reasons to introduce this:
>>>>>> - As mentioned in [1], compressed tags dont have system memory overhead
>>>>>> and much lower performance overhead. It would be preferrable to have this as
>>>>>> the default option, and to be able to switch it at compile time. Another
>>>>>> option is to just declare the static key as true by default?
>>>>>> - As compressed option is the best one, it doesn't make sense to have to
>>>>>> change both defconfig and command line options to enable memory
>>>>>> allocation profiling. Changing commandline across a large number of services
>>>>>> can result in signifcant work, which shouldn't be needed if the kernel
>>>>>> defconfig needs to be changed anyways.
>>>>>
>>>>> The reason tag compression is not the default option is because it
>>>>> works only if there are enough free bits in the page flags to store a
>>>>> tag index. If you configure it to use page flags and your build does
>>>>> not have enough free bits, the profiling will be disabled (see
>>>>> alloc_tag_sec_init()).
>>>>
>>>> Is it possible to fail the build in that case i.e. check the page flags
>>>> availability at build time?
>>>
>>> The difficulty is finding out the number of allocation tags in the
>>> kernel before it gets built. Maybe there is a way to add an additional
>>> post-build stage to run that check.
>>
>> Yeah that would be good to have.
>>
>>> But even then making this option
>>> default and causing build failures does not seem like a good idea to
>>> me but maybe I'm being too cautious?
>>
>> Oh my question was orthogonal to the patch. Basically some users may
>> want build time guarantee for this and they can enable such
>> build-failing opt-in config/check.
> 
> Yes, that would require the post-build step to check the number of
> tags vs the number of available page flag bits. I'll add it to my TODO
> list but it won't be at the top, sorry :) Volunteers to help with that
> would be highly appreciated.

Hi Suren,

A question orthogonal to the patch, the defconfig entry is defined as below:

config MEM_ALLOC_PROFILING
	bool "Enable memory allocation profiling"
	default n
	depends on MMU
	depends on PROC_FS
	depends on !DEBUG_FORCE_WEAK_PER_CPU
	select CODE_TAGGING
	select PAGE_EXTENSION
	select SLAB_OBJ_EXT

i.e. we select PAGE_EXTENSION even if we use compressed profiling and use page flags
instead of page extension. Which means the 0.2% (8 bytes per struct page) memory overhead
will still exist even when we dont need it?

Should we have some defconfig option (happy with any other way) that only allows compressed
profiling (otherwise nothing), so that we don't have the dependency on page extension
and thus not have the overhead if we only plan to use compressed profiling?

Thanks
