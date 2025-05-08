Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D727AC43
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720282; cv=none; b=Zavhw4RmTxeOjfBzQmasHqZHkM9W4rbUBY2qYOi8O8l4tJyhT6ndl9S7fZFOmdPlwn4/XWhIwIpISDCHA/VMsDcKZKw83Hrthe1xbHxjRq0uLfWR1iUdDeBUxIkf60f3vrbG5Ao918jftNwniWLDmoax60KDP3UVYrOT5rZK97A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720282; c=relaxed/simple;
	bh=n95ctjnl7uL95H3gv5tvslMNDvekJAc0nb9x0/pTPzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrAp1A9JbUEgsE57i2ArBQAyRLD6e9GZjjmnDWSVI6K2lMeFmgecoLXpA0YqQ0j1o5lTa7H9gA6iBDb1BiCvL8uAjmtCHyU9+PvpYjDnHXcettQvDno2P5+2RLGXxErq3fgWqIL6Hig4Mqkmg+UpV9GkKxZYax5Rm8OZjJHcr3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVr/W2MB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVr/W2MB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fbfa0a7d2cso1908664a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746720279; x=1747325079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NfzdIk19HfLe8jO397hSvRiahTxGsvjTzWdnQRt7+4=;
        b=VVr/W2MBIfi514DvjQHP8esxhudIIoS0K5RffXpxb9qHvg6JWzW2EFyq0/g23WH07p
         q7l2cX8zSi+hj+TTcFJw6u8t/rBfgcWu2yQm7t0fcZJ89ODSgbdlpGJSX1tz8Ju1F4ZJ
         6jCKrkfg1mtmsIVRvj/49bWzy4TdS0yKAYbzenv1KORI6X4I8dQFIlo2huS6MCYU4dHV
         FaZ9kJeT41ItrYhEzOjADR3bPTmhxRD9JiOgGCL9u7sSD5YKo8RC7cwEe2iuLBo8wxoG
         Kb+OQI3A0wZnAb+fs4ZYL3GoF47DJmTwJgxZGSbv7oQlHrByk9attNqelmuhWV/SGxHf
         2aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720279; x=1747325079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NfzdIk19HfLe8jO397hSvRiahTxGsvjTzWdnQRt7+4=;
        b=vfys81TMQ5gtzWthKRe0hAj7JT0k0nvsSK4OaDz5zBkfIe2gRmFPtldSJZ+YOhCC0r
         fWt6NtfuOO3Ai5E3KRvucF1UwrFLdK46z6rTBOGSJdFX03nIeucLBYYYcaDbhoIVbkfT
         tc7EIY4hQwHxhiTn5S65EJF/79gb9xOa7bOb5uJh9gNYQmODzQJCCZgU71CPENMS8LQZ
         owIC3gB+1VSrWlTxX1M/Etir7Fp6fX6RWrUcZN6oxDn9PBkCsfkchxshx9dXUQ3Vz/3Y
         cjaJR/ukRVR7caiTksx9nDXNzL1y0jBxkcxHxwsMTCWRInErz1fVprznQ2c1LqXVbBfx
         yFTA==
X-Forwarded-Encrypted: i=1; AJvYcCUGuTdMBEj2vPpYeAeUkaf8iYo4L/g/xkmSfCVChG849jXbwgOHmmEddkF2BTC/nwCtg7eHZttSEZ2+LuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwJs79Jr4Ljta3qXv/0/0iZoNiXjm60QDTNmgcBp5S2jvlLu0K
	fS5BFqbkYMOHSvFK0olFOOAN/Bjp8rd47hpOE5V/IPKW10cjY3Jh
X-Gm-Gg: ASbGnctSV67mkaloicT1ZW6p1nRS5tAIm+efnKdR7Wj1N9VxHCYuRSx7Z1c2IOa8z4d
	AUOI3GafHtaCUksyUdzCCrF/DoyiN3WBCxEXfW8qK/9Dn3NI9WycqvEtsAEm3sRho+bTG5vCLZI
	t15vMDLtr0NNQ1ieSEJnRvRJMDyyg4I4lS9pJbtX06JD8Beel3ZKTKjm9EuFLgbW/9TNLriUoUQ
	XdfAuBMcUjAylIr2dJ1kDRIQa/SARoPxganJpivvNu707fCFf00S3JCNRTMC8OZ5qCIXKIxqRkN
	N6UZORm86H8Kr2L9vmFOURCPhcH5uBXSd/a4UxN5SanAwG9FKF5eLkb0xBtpNNNPJQZCyjXD2hn
	MVLskaxulYfPvzg==
X-Google-Smtp-Source: AGHT+IHLN+yYME7DS+0cirQlXVdwmlw/zhTFQRUFhBY7O4cmjucGQDGtj/TXxFDZXTkcJTkX91TH1A==
X-Received: by 2002:a17:907:c201:b0:ace:3643:1959 with SMTP id a640c23a62f3a-ad218ea8227mr22607266b.7.1746720278239;
        Thu, 08 May 2025 09:04:38 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:14f7:eab6:23d5:4cab? ([2620:10d:c092:500::7:80fe])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192cf5casm6729666b.2.2025.05.08.09.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 09:04:37 -0700 (PDT)
Message-ID: <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
Date: Thu, 8 May 2025 17:04:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 david@redhat.com, linux-mm@kvack.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, riel@surriel.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com>
 <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
 <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/05/2025 06:41, Yafang Shao wrote:
> On Thu, May 8, 2025 at 12:09 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>>
>>
>> On 07/05/2025 16:57, Zi Yan wrote:
>>> On 7 May 2025, at 11:12, Usama Arif wrote:
>>>
>>>> On 07/05/2025 15:57, Zi Yan wrote:
>>>>> +Yafang, who is also looking at changing THP config at cgroup/container level.
> 
> Thanks
> 
>>>>>
>>>>> On 7 May 2025, at 10:00, Usama Arif wrote:
>>>>>
>>>>>> Allowing override of global THP policy per process allows workloads
>>>>>> that have shown to benefit from hugepages to do so, without regressing
>>>>>> workloads that wouldn't benefit. This will allow such types of
>>>>>> workloads to be run/stacked on the same machine.
>>>>>>
>>>>>> It also helps in rolling out hugepages in hyperscaler configurations
>>>>>> for workloads that benefit from them, where a single THP policy is
>>>>>> likely to be used across the entire fleet, and prctl will help override it.
>>>>>>
>>>>>> An advantage of doing it via prctl vs creating a cgroup specific
>>>>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) is
>>>>>> that this will work even when there are no cgroups present, and my
>>>>>> understanding is there is a strong preference of cgroups controls being
>>>>>> hierarchical which usually means them having a numerical value.
>>>>>
>>>>> Hi Usama,
>>>>>
>>>>> Do you mind giving an example on how to change THP policy for a set of
>>>>> processes running in a container (under a cgroup)?
>>>>
>>>> Hi Zi,
>>>>
>>>> In our case, we create the processes in the cgroup via systemd. The way we will enable THP=always
>>>> for processes in a cgroup is in the same way we enable KSM for the cgroup.
>>>> The change in systemd would be very similar to the line in [1], where we would set prctl PR_SET_THP_ALWAYS
>>>> in exec-invoke.
>>>> This is at the start of the process, but you would already know at the start of the process
>>>> whether you want THP=always for it or not.
>>>>
>>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
>>>
>>> You also need to add a new systemd.directives, e.g., MemoryTHP, to
>>> pass the THP enablement or disablement info from a systemd config file.
>>> And if you find those processes do not benefit from using THPs,
>>> you can just change the new "MemoryTHP" config and restart the processes.
>>>
>>> Am I getting it? Thanks.
>>>
>>
>> Yes, thats right. They would exactly the same as what we (Meta) do
>> for KSM. So have MemoryTHP similar to MemroryKSM [1] and if MemoryTHP is set,
>> the ExecContext->memory_thp would be set similar to memory_ksm [2], and when
>> that is set, the prctl will be called at exec_invoke of the process [3].
>>
>> The systemd changes should be quite simple to do.
>>
>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/man/systemd.exec.xml#L1978
>> [2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/dbus-execute.c#L2151
>> [3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> 
> This solution carries a risk: since prctl() does not require any
> capabilities, the task itself could call it and override your memory
> policy. While we could enforce CAP_SYS_RESOURCE to restrict this, that
> capability is typically enabled by default in containers, leaving them
> still vulnerable.
> 
> This approach might work for Kubernetes/container environments, but it
> would require substantial code changes to implement securely.
> 

You can already change the memory policy with prctl, for e.g. PR_SET_THP_DISABLE
already exists and the someone could use this to slow the process down. So the
approach this patch takes shouldn't be anymore of a security fix then what is already
exposed by the kernel. I think as you mentioned, if prctl is an issue CAP_SYS_RESOURCE
should be used to restrict this. 

In terms of security vulnerability of prctl, I feel like there are a lot of others
that can be a much much bigger issue? I just had a look and you can change the
seccomp, reset PAC keys(!) even speculation control(!!), so I dont think the security
argument would be valid.


