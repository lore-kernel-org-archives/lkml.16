Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6C922B5B6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845564; cv=none; b=ovfeD1Zxpx+rcPx78RkUXSyRrdc+XCafQH3umaq3+xWUIqz9+FiQbIjUeT2RkzLpSN/2yuBHrebgvRoaR6efEolgOFown5o1qDkTIjpoJuBwMyLVF7T/ul1Nf6ovuVpWS6rzY4ZtGbby8ALyUmsr4XN4dn6cwVOCr81rYsiSg00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845564; c=relaxed/simple;
	bh=0M4WZKNXP36rMMwiX7JWO7BzczpuDdKLLF/qwa71FgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbTlhMtmpmGlFyGaPXwfkwu5DbVc2vXNXWbin3XtVSuMUQzQ11F9owOOIqk4QF0FJKukhiNoxd81EzvGn47tbgPH/AsqziV5fgHIzBfBY7T9TVqpyTuVl9bRahCED7JU2R5TZ3GUSUb3fuMq7r7DgHTr/YnVTM2bABh3tMFUT+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaILjkK2; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaILjkK2"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6015f8d4b7dso3380672a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747845561; x=1748450361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9XUQMmFPFVwOnw9S24Sb/VRpMQ5eRCJ/ySSLp6G3oM=;
        b=QaILjkK2J+KowEy9maaTeX/ZcDxEH3t6e9GjhXms1JOK1w66WotsCLPCf4DwLWYyZD
         5+J9nycLQoIT+YKa4ti4nFYXFpOSGNaxKOhaxTtyPCG5r73PYu5LNW7fH+EZJ9Nxpo3J
         LUtHBnDbGnOgyV0t3htq5iydFGq281lzLYyxjAlNi6yHUM5dc8kpilS2+9Dixz4c338t
         P8bsBlJnd2vM4fA2TcbOKu4rZPqZuzDZsVbYGRfc3u5K2c5Y+IZw81+4zm/4Z1LvJLAH
         3QBHpHuRa16ImvfXPqxFcfM71zKcm0jTUR+5/jNEaLNK0ZeJ2Y3h668jwz1ejgE0/nJv
         KXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747845561; x=1748450361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9XUQMmFPFVwOnw9S24Sb/VRpMQ5eRCJ/ySSLp6G3oM=;
        b=Gg3be+vCHP+mNtgqQQvH/g6y1/n9pD+9cBNM3mHq8XExP6liKhGXZr5bFAqgN/s5CV
         H/8E/yLWgrBbOyVgP6d7UBSEXWfYHvXcyMkUMeSSKIFOg+2S9bOceZBGLbQenT59vJRS
         kSXv9MsmbfrDW9muHZN186BsfDv1e+ojTQvvnoMfRD33olIfweUsD095JbKc0JfRi7oL
         ANw85UUT7OT1Tq+qZi+qzU+AjK6WARAoP1135RQkkTyaybHLXbZEQ5Yg7kPWvXt69yFC
         SjSUvFSXkFkgdTyemU5N8pR4ku28N/O9/M3UJXw14zupiL+SCRrf3fj9iXQmWbpOZGDt
         2J+A==
X-Forwarded-Encrypted: i=1; AJvYcCUdCEIgNy38yYQ8CkN4auEwoDeAvIZTaWcVbrEu4V0TJtoNysxr1KHRl3Iuc5kt84ZHzMQnXNOampi6cP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzCkf3qs/VxqW/NTW8/QWlchWlXiiI/7xlfNrl4KOzJ0t8nBI
	NIAcLciPoaWc6MwX2Ww+2AZddIQLL3NgDA4jQNJJg4cNuvVEaBkZyHDf
X-Gm-Gg: ASbGncuBQ6nk3PV+Jaip3eZj16xhigghggSfJfKPbz8YI3p39wMcAilYHtf+Ab7b9dQ
	kYwZEDDuAFYmn8XJIkCs3kdFs6DlAIbEsTIWP8mvDZOJiEWuysfy9EFC7D2v8zpOhm2bn8gbw3U
	EmMGinQBGWfQlAeZT1tdRvRwlPFy1nSW64O/FawpzWzbcGJXUtaEsoWUS6VR5CiQSsZ7y9pXSIo
	lGQPr/yMhNWesHSyXBGmOATSi7VryXLyBz/rl5zTo/2ZWeFRlNxKbd8oMfJjeh2cHtxz5/50qa6
	NM7RmruxepCnnNxBNpCFdVUjzld1YnkF9yMwavQLCp7D0RPRSd+DmOwJxzqlTla3Npc35jBxAiB
	X9JfiTLzcD9UDdziHgaDpQVRa83OAIglqQ+U/pA==
X-Google-Smtp-Source: AGHT+IEgr/OnJitlNpydFjBq8iOodjDyoGzn1tLRB8UtO51V9HBJ5RVLpBY/NThJN2PTbhe1WtDuQg==
X-Received: by 2002:a05:6402:42c1:b0:5f8:9607:3147 with SMTP id 4fb4d7f45d1cf-6008a39e975mr17900489a12.6.1747845560657;
        Wed, 21 May 2025 09:39:20 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:8d0:f08c:4e6a:b32f? ([2620:10d:c092:600::8a7e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d50364dsm9100909a12.32.2025.05.21.09.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 09:39:20 -0700 (PDT)
Message-ID: <3d0a1483-3491-4c10-b19b-42bf0dace79e@gmail.com>
Date: Wed, 21 May 2025 17:39:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: slub: do not warn when allocating slab obj extensions
 fails
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, vlad.wing@gmail.com, linux-mm@kvack.org,
 kent.overstreet@linux.dev, cl@gentwo.org, rientjes@google.com,
 vbabka@suse.cz, roman.gushchin@linux.dev, harry.yoo@oracle.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250521142521.3033264-1-usamaarif642@gmail.com>
 <CAJuCfpGtb9j1y93bksErU4NfjPX6tGrP6qvMrazx3+M7dJWtxQ@mail.gmail.com>
 <da5a2a97-060d-441d-b66d-9a0dd6bb7a7a@gmail.com>
 <CAJuCfpG1ffe6Q4QUMEV5gHVX3Wy8qmNiexufeO__Xx8CcayqHA@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAJuCfpG1ffe6Q4QUMEV5gHVX3Wy8qmNiexufeO__Xx8CcayqHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 21/05/2025 17:29, Suren Baghdasaryan wrote:
> On Wed, May 21, 2025 at 9:21 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>>
>>
>> On 21/05/2025 17:02, Suren Baghdasaryan wrote:
>>> On Wed, May 21, 2025 at 7:25 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>>>
>>>> In memory bound systems, a large number of warnings for failing this
>>>> allocation repeatedly may mask any real issues in the system
>>>> during memory pressure being reported in dmesg. Failing this
>>>> allocation is not indicative of a bug, so remove the warning.
>>>>
>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
>>>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
>>>> ---
>>>> v1 -> v2:
>>>> - remove the warning completely. We will have a way in the
>>>>   future to indicate that the mem alloc profile is inaccurate.
>>>> ---
>>>>  mm/slub.c | 4 +---
>>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/mm/slub.c b/mm/slub.c
>>>> index dc9e729e1d26..06ab9a558b73 100644
>>>> --- a/mm/slub.c
>>>> +++ b/mm/slub.c
>>>> @@ -2102,9 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
>>>>
>>>>         slab = virt_to_slab(p);
>>>>         if (!slab_obj_exts(slab) &&
>>>> -           WARN(alloc_slab_obj_exts(slab, s, flags, false),
>>>> -                "%s, %s: Failed to create slab extension vector!\n",
>>>> -                __func__, s->name))
>>>> +           alloc_slab_obj_exts(slab, s, flags, false))
>>>
>>> I thought we agreed to having pr_warn_once() here. Did I miss something?
>>>
>>
>> I had [1] yesterday but I saw Johannes's mail [2] in and Harry mentioned in [3] that
>> failing to allocate the extension vector can happen during normal operations. So I
>> thought maybe there are more votes for removing it.
>>
>> I am ok with either pr_warn_once or removing it completely.
> 
> I feel like we should have at least some indication that something
> went wrong here.
> 
>>
>> I guess the question is, is it considered OK to fail here?
> 
> Well, it's not ok but not catastrophic either, so warning seems
> appropriate to me.
> 
Ok, I will wait a couple of days incase someone has any objections and send
https://lore.kernel.org/all/64b19c8f-e02e-490b-b987-9a996f36be21@gmail.com/
as v3.

Thanks!

>>
>> [1] https://lore.kernel.org/all/64b19c8f-e02e-490b-b987-9a996f36be21@gmail.com/
>> [2] https://lore.kernel.org/all/20250520171814.GC773385@cmpxchg.org/
>> [3] https://lore.kernel.org/all/20250520171814.GC773385@cmpxchg.org/

