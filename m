Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A6223323
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828360; cv=none; b=C9xaHDU6AYL9oCvnfhl4EzYYuCJhZ9T3z7lYIsu/2mRq69x+IHEj5wPsf8ltnvZLt1eZ8z4qlMxvBV1sW0kOjXi711a5wRET54/nK/69dQJv+HZ1uyL8qzthopln+UmuiLcrynfGQZgomgsCG+iKloM+wPtKbatTE5bgcPAX9yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828360; c=relaxed/simple;
	bh=OK7Ey0BtUgWW06lWGTLWuND0IOi3KmXEKO+Sis0kdmM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rkRhsH7JXuPzs/Cq55W3RJ/v21p96wrAbHCg0A/W1NTkD/lvR4lUrxBnhk8TXM6gCZJr/W486LNaG8bC+hwuKgDsVeu3JW0ck7q9vanhJ2NO98XFsuY4fMcG4YegQTUrL3rX5/0PGSNuKv0Se5s/7DPpj+zij145Qv7yk0ym6ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KbDpN3R2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KbDpN3R2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744828356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kr323rRxdGFQw1WKQ9MW3DvmEsbp5Of61M1I1hHN3QI=;
	b=KbDpN3R2t/Z50rognJfDsnl+dIepv2+mCPHOrq03iwfncOVJwNKNeIgXBCHhY8y7zm5ZhG
	45XhCs1XVrpeWIUthyMPGTgIrVSCBUPEJ6AfXS+Uk8EqlRM9VIyxPev5KH3Vl0S75edSsi
	CBC96YTx5ERd3gMSPNBCkygnRHTYJV4=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-Hkl8dzlTP220rYtmg4qxew-1; Wed, 16 Apr 2025 14:32:35 -0400
X-MC-Unique: Hkl8dzlTP220rYtmg4qxew-1
X-Mimecast-MFC-AGG-ID: Hkl8dzlTP220rYtmg4qxew_1744828354
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d81820d5b3so9686655ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744828354; x=1745433154;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kr323rRxdGFQw1WKQ9MW3DvmEsbp5Of61M1I1hHN3QI=;
        b=NGh3ckIS+KSyCaiwJE0AOspzfvTobEF9gDxeWCkHkCERvizGa2dXLFPFBZa1FP+cky
         PiaksDiaMTTFtUjzHYF4ZlZlpZwstgRoQiFkbO3Wz3NJKkFZLw9RtfFV7mc0Epm5zAOT
         Q74KPuDzlkFM1gh5RhlvvPgdCq3gSB8+MH9qiCjb2MR8dBe0MablmtdOscQt7jX6C6BC
         YDLpdVpUole3wmhHHqIjHMl16oN0aPNi/f/dgtVMM8TnrewVT8hVLuygGTHfC5e13FRY
         38Y9LSnJyAE0MZmAWpAIXthw2ZZ6F0pd/kuOPa0hROpOixrvhygJ79Ef/Y/VJQYJ6jf7
         sLFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoL2Hw1K208AXkG4FirePoOqs693/mmokLhC20DVkZ7NLirf1uJiizRyJXnrRxK2bMpp4MztGp5VvfAMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16hzH0F98z9JGywPoAQPxkECprlY3ZRIhk5DyH8ZeIEajTx/G
	dDTvMyUksxFaSt0PNf1BYQYCYYfCTwrr/KX4nZIaCaD7RemSSi4v9xRrtHX0UuX9gqqk7d71x9J
	oLTziRUMHMqNXTm6rnn2Tzihe0kKDNtRAHbnMz9r84myFquRNhdivE7OYz7KP5Q==
X-Gm-Gg: ASbGnctKqUKoNP5EhAhMraa3WlLC0mq4fEnXOwArgopS/4WOoDkYsfa7GBWWfF723Sg
	PrtVl+V2gDBuRxlGp8cIcU2vtmXGMatrGn0DFJAo3oJJuhOsPW1nBYYc/vw+tr19i+E5+DNtcUm
	TSW51yjSO2M6cSZQF/6XfR0AtqxZOEtALX4zb/paG9rP5mATA4CwNhns6DYAuqW6Yt8FtLTcdet
	2gONSpIPYWWiEZGKo3MCULSwWf8/S3lYrruNwnSev/Ks6wMNqzy1UpR007v403jj7tmwKlNp49x
	+tkiDxStZ92qJgCLvcZoi+KryJR2WmKpFKA55DO/xBiF6teXGXOU/qKdKg==
X-Received: by 2002:a05:6e02:12c1:b0:3d0:239a:c46a with SMTP id e9e14a558f8ab-3d815b0a02amr29297075ab.9.1744828354545;
        Wed, 16 Apr 2025 11:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7UgFUryELyGYt+PcajPg95c5+km8NAhtDH/hDSoVhhN906AZjpwVw2Zy63FslCAWW+/bhsA==
X-Received: by 2002:a05:6e02:12c1:b0:3d0:239a:c46a with SMTP id e9e14a558f8ab-3d815b0a02amr29296885ab.9.1744828354204;
        Wed, 16 Apr 2025 11:32:34 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d80b6b0392sm9732595ab.63.2025.04.16.11.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 11:32:33 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8dafdb1b-e404-4862-836a-0bdf7e6efd23@redhat.com>
Date: Wed, 16 Apr 2025 14:32:32 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cgroup/cpuset-v1: Add missing support for
 cpuset_v2_mode
To: "T.J. Mercier" <tjmercier@google.com>, Waiman Long <llong@redhat.com>
Cc: Kamalesh Babulal <kamalesh.babulal@oracle.com>, Tejun Heo
 <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250415235308.424643-1-tjmercier@google.com>
 <46892bf4-006b-4be1-b7ce-d03eb38602b3@oracle.com>
 <CABdmKX2zmQT=ZvRAHOjfxg9hgJ_9iCpQj_SDytHVG2UobdsfMw@mail.gmail.com>
 <146ecd0e-7c4c-4c8c-a11f-029fafb1f2e3@redhat.com>
 <CABdmKX2Basoq0Sk6qemcP3Mne6-nJPNN0Mz9WYjvdKWNagoaZg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CABdmKX2Basoq0Sk6qemcP3Mne6-nJPNN0Mz9WYjvdKWNagoaZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/16/25 2:27 PM, T.J. Mercier wrote:
> On Wed, Apr 16, 2025 at 11:05 AM Waiman Long <llong@redhat.com> wrote:
>> On 4/16/25 1:55 PM, T.J. Mercier wrote:
>>> On Wed, Apr 16, 2025 at 2:19 AM Kamalesh Babulal
>>> <kamalesh.babulal@oracle.com> wrote:
>>>> Hi,
>>>>
>>>> On 4/16/25 5:23 AM, T.J. Mercier wrote:
>>>>> Android has mounted the v1 cpuset controller using filesystem type
>>>>> "cpuset" (not "cgroup") since 2015 [1], and depends on the resulting
>>>>> behavior where the controller name is not added as a prefix for cgroupfs
>>>>> files. [2]
>>>>>
>>>>> Later, a problem was discovered where cpu hotplug onlining did not
>>>>> affect the cpuset/cpus files, which Android carried an out-of-tree patch
>>>>> to address for a while. An attempt was made to upstream this patch, but
>>>>> the recommendation was to use the "cpuset_v2_mode" mount option
>>>>> instead. [3]
>>>>>
>>>>> An effort was made to do so, but this fails with "cgroup: Unknown
>>>>> parameter 'cpuset_v2_mode'" because commit e1cba4b85daa ("cgroup: Add
>>>>> mount flag to enable cpuset to use v2 behavior in v1 cgroup") did not
>>>>> update the special cased cpuset_mount(), and only the cgroup (v1)
>>>>> filesystem type was updated.
>>>>>
>>>>> Add parameter parsing to the cpuset filesystem type so that
>>>>> cpuset_v2_mode works like the cgroup filesystem type:
>>>>>
>>>>> $ mkdir /dev/cpuset
>>>>> $ mount -t cpuset -ocpuset_v2_mode none /dev/cpuset
>>>>> $ mount|grep cpuset
>>>>> none on /dev/cpuset type cgroup (rw,relatime,cpuset,noprefix,cpuset_v2_mode,release_agent=/sbin/cpuset_release_agent)
>>>>>
>>>>> [1] https://cs.android.com/android/_/android/platform/system/core/+/b769c8d24fd7be96f8968aa4c80b669525b930d3
>>>>> [2] https://cs.android.com/android/platform/superproject/main/+/main:system/core/libprocessgroup/setup/cgroup_map_write.cpp;drc=2dac5d89a0f024a2d0cc46a80ba4ee13472f1681;l=192
>>>>> [3] https://lore.kernel.org/lkml/f795f8be-a184-408a-0b5a-553d26061385@redhat.com/T/
>>>>>
>>>>> Fixes: e1cba4b85daa ("cgroup: Add mount flag to enable cpuset to use v2 behavior in v1 cgroup")
>>>>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
>>>> The patch looks good to me, please feel free to add
>>>>
>>>> Reviewed-by: Kamalesh Babulal <kamalesh.babulal@oracle.com>
>>>>
>>>> One nit below:
>>>>
>>>>> ---
>>>>>    kernel/cgroup/cgroup.c | 29 +++++++++++++++++++++++++++++
>>>>>    1 file changed, 29 insertions(+)
>>>>>
>>>>> diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
>>>>> index 27f08aa17b56..cf30ff2e7d60 100644
>>>>> --- a/kernel/cgroup/cgroup.c
>>>>> +++ b/kernel/cgroup/cgroup.c
>>>>> @@ -2353,9 +2353,37 @@ static struct file_system_type cgroup2_fs_type = {
>>>>>    };
>>>>>
>>>>>    #ifdef CONFIG_CPUSETS_V1
>>>>> +enum cpuset_param {
>>>>> +     Opt_cpuset_v2_mode,
>>>>> +};
>>>>> +
>>>>> +const struct fs_parameter_spec cpuset_fs_parameters[] = {
>>>>> +     fsparam_flag  ("cpuset_v2_mode", Opt_cpuset_v2_mode),
>>>>> +     {}
>>>>> +};
>>>> A minor optimization you may want to convert the cpuset_fs_parameters into
>>>> a static const.
>>> Thanks, I copied from cgroup1_fs_parameters since that's where
>>> cpuset_v2_mode lives, which doesn't have the static currently
>>> (cgroup2_fs_parameters does). Let me update cpuset_fs_parameters in
>>> v3, and add a second patch for cgroup1_fs_parameters.
>> Besides not exposing the structure outside the current file or maybe a
>> tiny bit of linker speedup, is there other performance benefit by adding
>> "static"?
>>
>> Regards,
>> Longman
>>
> I thought it might decrease the text size a tiny bit, but it doesn't
> because the symbol isn't exported and I guess the compiler knows to
> just inline.
>
Since the structure already have a "const" modifier, I doubt there is 
any further optimization that the compiler can do whether the symbol is 
visible externally or not. Anyway, I am not objecting to v3 with static 
modifier added.

Cheers,
Longman

