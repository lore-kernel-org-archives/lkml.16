Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B526288C8C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783059; cv=none; b=cF8D0x5k9E8mMRszfoQCaENafLLg4MJXDJTBNH/wcO0rEaagY95HX+93mLWUb+D161pLhyNCwjNKdhm/hRB7UirDLlyPp+8ha7Iz0kjtuNEfRHpcF1I1GUH62yBWgCsW/v5Ta7I6YDmLP3cn8PenZxnH/9d5H5/TsynEXaIVlVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783059; c=relaxed/simple;
	bh=+Sk0k1BVeNlv2PIjgUyRQYRkj9/oczau68YH3ulpCPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBbE3wIndgozJqlZshm+KhCmR6vPznky4AUW9ClnFoxPcCDkEJfyPw1YFgW0XeOX7g81MtAyC5Oi25iFGRVj2TV6dh2MfKrmp3Z0YzW56kK4tGqJ5v1DWaaaQnLfSY7cTCyBW+wbAlqY1gGZfzJrQdhrcaK/nf64n1Lo+QjhucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XfdsPMfn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XfdsPMfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746783052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fJTe7zx49p8XhhSnwqeof7XTnYdwUd1CTPxhRVyNyY4=;
	b=XfdsPMfnERH5kY6EwjuHoh4PQiy6dAJd3HZvCtNRfO4vozCyRxVakbgzuaXdxNFPqbqFqQ
	7tJYAPNyM3qfp+bLvdcdUqIWRKkX6oYNKUreMpalK8bEcjPUMZb9Vc+d0TFANeztgwfaOz
	YOnlb3gBzLGSvVZBML7DYDmtGr1gPmw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-7EOFEbbgOEG8WPm4ftDUzw-1; Fri, 09 May 2025 05:30:50 -0400
X-MC-Unique: 7EOFEbbgOEG8WPm4ftDUzw-1
X-Mimecast-MFC-AGG-ID: 7EOFEbbgOEG8WPm4ftDUzw_1746783049
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a0b7cd223fso982520f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783049; x=1747387849;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fJTe7zx49p8XhhSnwqeof7XTnYdwUd1CTPxhRVyNyY4=;
        b=kCs+0utO4tkJ4hb3OFKyJSJx21WklnNZ8pcb55l2qABhoZy0qZReaD5/UNhgT6CEwx
         3fLW3rIgeLoL7GT9Xr2w+ydZlhMqV2DdMwEvPmT5Ydk/uc4npEHlChAkc+U5hFZQS5A6
         Y71KBy43S0DTyQpUOy6522keOhb03W5eGUXCTd2cDOncAXkf6v0YWis8UuSv/u0QF685
         HMm5Z4tvJXjorc/QHDKyKAxpfIT6UB7Pu4256bP0RXVswfetHcqwAsDFQXA1N0TqY1gn
         hpCIVSxm01wlZZ9CafHvrsgzuv/MoYxev8iss2OLtAlaEnu6+tsR1I7cPpimXgKYEA8a
         /bVg==
X-Forwarded-Encrypted: i=1; AJvYcCV3WKAb8bwYKqR52oWOokrTN/GtIRTi/4z7uv2BGyKG++9EGybNh25hZ2NGOApnVL1Pl7R5XxfpgC37mSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEb3zZ8Hp5vY/Jxr9Y/NMQuB7umquG2biXCHxMHrcqpW6hc3iF
	3wDyHKeGwW+6AzFy2C28bkCZO9DNKfQRo/VZV3RcaxlgKL3UgKHoDus42T38u8eQd+BRnwe4Ae4
	rc3r/CKAzvW3G532KjS3sJv1wE+esbv/M8ErPfPDOd6iiD5Xha2HSJ9F2gKSKlKwLtB0Z0Q==
X-Gm-Gg: ASbGncvYTM9WAuYB3WtZ+/FOmYOSaZ82yHGDXTM61/E6brpJK0g7X9MCdYN+RKdENZX
	X2WJkAitXZd4n2jrqzX9sbPynkNwtZ3KB6okbWJ5lJwVjIDkJ+dqBMbBZf5QGV3Q8J/eZBiHdqm
	JfrrpOEaRu6RWAO+eiHOAwid9nxvT+EkEqdmtnXbE+Lwh2mUDex2yjqT6Zf1wwuQpVDW3eRBZsM
	Z9D0plGRkUSyj6cjgaactiBskgqL7w1eICwmkVlggB0XvT+1gFk0BGaMUmbidnCHMGxuZYL9uWX
	0SpJMrh17/mgFv+YLPgCZjpkMhuXVUP0Zz/jfid/IYDwqBrJZ+lS6QxzH9NR0LQhMag/Tj3OiT2
	Stwyk7Y22kAyqVRbz2bOdWpitk/r3oF1bMKAh92I=
X-Received: by 2002:a05:6000:2483:b0:39c:1257:cc26 with SMTP id ffacd0b85a97d-3a1f64c19fdmr2308304f8f.57.1746783049367;
        Fri, 09 May 2025 02:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqDDx3sCyY4RXYfNzz6lgOUetMX7HgJt/IhtPkcX/drggF/w3IlcrNtcW3uC+gC1ZD9uRlcQ==
X-Received: by 2002:a05:6000:2483:b0:39c:1257:cc26 with SMTP id ffacd0b85a97d-3a1f64c19fdmr2308259f8f.57.1746783048896;
        Fri, 09 May 2025 02:30:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2af7sm2712615f8f.52.2025.05.09.02.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 02:30:48 -0700 (PDT)
Message-ID: <41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com>
Date: Fri, 9 May 2025 11:30:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Yafang Shao <laoar.shao@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: Usama Arif <usamaarif642@gmail.com>, Zi Yan <ziy@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 shakeel.butt@linux.dev, riel@surriel.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com>
 <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
 <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
 <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
 <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
 <20250509051328.GF323143@cmpxchg.org>
 <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.05.25 11:24, Yafang Shao wrote:
> On Fri, May 9, 2025 at 1:13 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
>>
>> On Fri, May 09, 2025 at 10:15:08AM +0800, Yafang Shao wrote:
>>> On Fri, May 9, 2025 at 12:04 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On 08/05/2025 06:41, Yafang Shao wrote:
>>>>> On Thu, May 8, 2025 at 12:09 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 07/05/2025 16:57, Zi Yan wrote:
>>>>>>> On 7 May 2025, at 11:12, Usama Arif wrote:
>>>>>>>
>>>>>>>> On 07/05/2025 15:57, Zi Yan wrote:
>>>>>>>>> +Yafang, who is also looking at changing THP config at cgroup/container level.
>>>>>
>>>>> Thanks
>>>>>
>>>>>>>>>
>>>>>>>>> On 7 May 2025, at 10:00, Usama Arif wrote:
>>>>>>>>>
>>>>>>>>>> Allowing override of global THP policy per process allows workloads
>>>>>>>>>> that have shown to benefit from hugepages to do so, without regressing
>>>>>>>>>> workloads that wouldn't benefit. This will allow such types of
>>>>>>>>>> workloads to be run/stacked on the same machine.
>>>>>>>>>>
>>>>>>>>>> It also helps in rolling out hugepages in hyperscaler configurations
>>>>>>>>>> for workloads that benefit from them, where a single THP policy is
>>>>>>>>>> likely to be used across the entire fleet, and prctl will help override it.
>>>>>>>>>>
>>>>>>>>>> An advantage of doing it via prctl vs creating a cgroup specific
>>>>>>>>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) is
>>>>>>>>>> that this will work even when there are no cgroups present, and my
>>>>>>>>>> understanding is there is a strong preference of cgroups controls being
>>>>>>>>>> hierarchical which usually means them having a numerical value.
>>>>>>>>>
>>>>>>>>> Hi Usama,
>>>>>>>>>
>>>>>>>>> Do you mind giving an example on how to change THP policy for a set of
>>>>>>>>> processes running in a container (under a cgroup)?
>>>>>>>>
>>>>>>>> Hi Zi,
>>>>>>>>
>>>>>>>> In our case, we create the processes in the cgroup via systemd. The way we will enable THP=always
>>>>>>>> for processes in a cgroup is in the same way we enable KSM for the cgroup.
>>>>>>>> The change in systemd would be very similar to the line in [1], where we would set prctl PR_SET_THP_ALWAYS
>>>>>>>> in exec-invoke.
>>>>>>>> This is at the start of the process, but you would already know at the start of the process
>>>>>>>> whether you want THP=always for it or not.
>>>>>>>>
>>>>>>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
>>>>>>>
>>>>>>> You also need to add a new systemd.directives, e.g., MemoryTHP, to
>>>>>>> pass the THP enablement or disablement info from a systemd config file.
>>>>>>> And if you find those processes do not benefit from using THPs,
>>>>>>> you can just change the new "MemoryTHP" config and restart the processes.
>>>>>>>
>>>>>>> Am I getting it? Thanks.
>>>>>>>
>>>>>>
>>>>>> Yes, thats right. They would exactly the same as what we (Meta) do
>>>>>> for KSM. So have MemoryTHP similar to MemroryKSM [1] and if MemoryTHP is set,
>>>>>> the ExecContext->memory_thp would be set similar to memory_ksm [2], and when
>>>>>> that is set, the prctl will be called at exec_invoke of the process [3].
>>>>>>
>>>>>> The systemd changes should be quite simple to do.
>>>>>>
>>>>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/man/systemd.exec.xml#L1978
>>>>>> [2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/dbus-execute.c#L2151
>>>>>> [3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
>>>>>
>>>>> This solution carries a risk: since prctl() does not require any
>>>>> capabilities, the task itself could call it and override your memory
>>>>> policy. While we could enforce CAP_SYS_RESOURCE to restrict this, that
>>>>> capability is typically enabled by default in containers, leaving them
>>>>> still vulnerable.
>>>>>
>>>>> This approach might work for Kubernetes/container environments, but it
>>>>> would require substantial code changes to implement securely.
>>>>>
>>>>
>>>> You can already change the memory policy with prctl, for e.g. PR_SET_THP_DISABLE
>>>> already exists and the someone could use this to slow the process down. So the
>>>> approach this patch takes shouldn't be anymore of a security fix then what is already
>>>> exposed by the kernel. I think as you mentioned, if prctl is an issue CAP_SYS_RESOURCE
>>>> should be used to restrict this.
>>>
>>> I believe we should at least require CAP_SYS_RESOURCE to enable THP,
>>> since it overrides global system settings. Alternatively,
>>> CAP_SYS_ADMIN might be even more appropriate, though I'm not entirely
>>> certain.
>>
>> Hm, could you verbalize a concrete security concern?
>>
>> I've never really looked at the global settings as a hard policy, more
>> as picking a default for the workloads in the system. It's usually
>> `madvise' or `always', and MADV_HUGEPAGE and MADV_NOHUGEPAGE have long
>> existed to give applications the ability to refine the global choice.
>>
>> The prctl should probably respect `never' for consistency, but beyond
>> that I don't really see the concern, or how this would allow something
>> that isn't already possible.
> 
> I would interpret the always, madvise, and never options as follows:
> - always
>    The sysadmin strongly recommends using THP. If a user does not
> want to use it, they must explicitly disable it.
> - madvise
>   The sysadmin gently encourages the use of THP, but it is only
> enabled when explicitly requested by the application.
> - never
>    The sysadmin discourages the use of THP, and "its use is only permitted
> with explicit approval" .

"never" so far means "no thps, no exceptions". We've had serious THP 
issues in the past, where our workaround until we sorted out the issue 
for affected customers was to force-disable THPs on that system during boot.

-- 
Cheers,

David / dhildenb

