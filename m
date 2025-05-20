Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E72417F2
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754542; cv=none; b=rJlGXQhxqusghLjRSfnoHB3T3lHIoeeuduwanUoVfJvdQYTviZMj+YyvPjTtjUHNpNz5CP9QxeSgpb+gwRUq/A8gQxcp/wx726JaoxkZhh1iJneh+KsIH7RUHqkryF5LIs+PTdX6GeBKPsoymvSJioWIKeCFlZWyp7ji7fdJ3T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754542; c=relaxed/simple;
	bh=gD7ijCVibbuC8nWCv1gk7Cf9nObrnGN5wWXmriPSx48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzgfdmLsQdwI6CwrnHYWh4Vt7hQukUKm/wAZ9QEjD1/EeCHI4W7G36Glr6gkTprot1U3aHsoY4K/l+ZFc2RvmXBa5yHLtWW4jN8a14TGntnXx1/ONSSOUdlEw8YH2NyQUEOaK4uuF9m9d9YpoYGmF4LVRbFF/E/GdwkU6RQiK7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lltD1vnB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lltD1vnB"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-601dd3dfc1fso5194534a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747754538; x=1748359338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HPbVSjkW25BVpwZCUxpIFG7xTA4bYrqjMIINpvofoFc=;
        b=lltD1vnB0QQWXUQa8OAkgwJwLsFFa/0j5+sOBOfGRPElq4EKQGezCuPn8Ynb8FR31O
         Y3+xd9+CfYu/dlfAcVar+efwi2iJL0AT5pFEsoQyUfiEpAW5o7hF7Qoz8w3MdxeLEBkT
         wy8TDXLxhwO/Fqq/GjsYay17XXiX51uRtLYPvdAPOroLsVFp8iRI2uNXyQHU7kuLPi9m
         GwBR5IuhyiDoG5EnBaU1FM8/CuZFExSoC9azFk2NiwqJEr6wCaphGVWHs+X/Iv5RD+NN
         nZbU4zmn20+jlqCFTdkxhnQY0gH5drdKdeGrzDkascN0pIUBMmvUx+7p1soJMQZh6R1F
         X7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754538; x=1748359338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPbVSjkW25BVpwZCUxpIFG7xTA4bYrqjMIINpvofoFc=;
        b=vd6elK215o4eSmnjdax+lugYYhGnFzOZTz4S93LbITlA0tVruncQIOD0E74fgkKyx7
         Xi+0Z2VBTkNtm6pKVMwQcbuJydHtrTSj9xT7vm8UhCm7PMZdSKCGVgEHjVrBizR8AAYt
         Uovp9D36VOcQT1sXRQjZ6K8L1bbbv7MF3dpA2+ekGrN/dL8ww6RMxx2RuxZOSbP/j5rz
         gzvR6YFw8SkGghN4OIrScaR6R0cBt8ERPiavrOuFX6rsNEky8uFFFdeOzMnOCy8WefCy
         GQg8WShVkTchS63p7Dn2XZ3Y1HjazxoFfYwz4HvF1nPyQJlUZJWSeTBFEj17Zqy0EWN2
         S6lw==
X-Forwarded-Encrypted: i=1; AJvYcCXycyFTaGBEIWsNOU9QoxLy8gWBhY9HzieoX66UmB5esG52nrlfUTYLdpTD37tfn2GpwoCAPml/DC16c08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Who5mmTAaNYIOntDfSEaFke47bF9Go3j/OzxtmWmP3HvBJ5B
	q62LGY4cSow54++4IYKZQLju0MMGu6PqsUxsf5WaGcNOn6IBUDrx9gGN
X-Gm-Gg: ASbGncs2fBBfGEGgv8S/G1+9JpN1d29gnzjy7jBGaE+bgaLrqa+0JRfrK7go82cSK02
	2Jk2LcIZJ+8/3EdRYoChlqhu6lNg0qXxwD32g6USmyb7d73i6ELYW7W431XwNWqLGOIDnmYVUot
	qjV6puU6J/FBmdKDql4SlvyHWtYOam11Z21Cu792zvB95HTFuyxkkRuVvkNN5zXYQOm5WgK9NWr
	M6NgLku6BT29yQCj5Y49+GT5utBv7NYnnPoCVj2FiO3rvbM+8dgrw8Nr73uWhQU6ZVQP2P64YHL
	sa8zEfZWueOSmTXzaGexMoZ+x3/xJbzq27lZWDGMx4EzKjW4BxvSuvKK6p882IkhK/lP0xm9yMG
	Hmymqjz5KUPu8qxejTEFYJZoi
X-Google-Smtp-Source: AGHT+IFdBfhKTh3IRRTS1OzB+cE6Mi8ncamxWy1oCDWmqBxMDDzmmGVwOxOSP1OH37hHGmVHIGBoHw==
X-Received: by 2002:a05:6402:3550:b0:5fd:10fe:9e86 with SMTP id 4fb4d7f45d1cf-60119cdd453mr16201818a12.28.1747754538066;
        Tue, 20 May 2025 08:22:18 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1c0a:f3ac:4087:51c8? ([2620:10d:c092:500::7:66a9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac327d5sm7334255a12.63.2025.05.20.08.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:22:17 -0700 (PDT)
Message-ID: <64b19c8f-e02e-490b-b987-9a996f36be21@gmail.com>
Date: Tue, 20 May 2025 16:22:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: slub: only warn once when allocating slab obj
 extensions fails
To: Shakeel Butt <shakeel.butt@linux.dev>, surenb@google.com,
 Harry Yoo <harry.yoo@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org,
 vlad.wing@gmail.com, linux-mm@kvack.org, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, vbabka@suse.cz,
 cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <20250520122547.1317050-2-usamaarif642@gmail.com> <aCyEyxHEXQ7DU9I1@harry>
 <cf17cfde-cd1a-4217-a09a-1aa86347f830@gmail.com>
 <h7mwe4tr4r233zewdqaoehmmoktaljslgcxvr2qybon2vnxhrz@pbwpt253olkd>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <h7mwe4tr4r233zewdqaoehmmoktaljslgcxvr2qybon2vnxhrz@pbwpt253olkd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/05/2025 15:18, Shakeel Butt wrote:
> On Tue, May 20, 2025 at 02:42:09PM +0100, Usama Arif wrote:
>>
>>
>> On 20/05/2025 14:34, Harry Yoo wrote:
>>> On Tue, May 20, 2025 at 01:25:47PM +0100, Usama Arif wrote:
>>>> In memory bound systems, a large number of warnings for failing this
>>>> allocation repeatedly may mask any real issues in the system
>>>> during memory pressure being reported in dmesg. Change this to
>>>> WARN_ONCE.
>>>>
>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
>>>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
>>>> ---
>>>
>>> Hi,
>>>
>>> Please Cc SLAB ALLOCATOR folks in MAINTAINERS on patches that touch
>>> slab code ;)
>>>
>>
>> Thanks for adding them to CC! I was just thinking of this as a memory
>> allocation profiling issue and added the maintainers for it,
>> but should have added slab maintainers as well.
>>
>>
>>>>  mm/slub.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/mm/slub.c b/mm/slub.c
>>>> index bf43c403ead2..97cb3d9e8d00 100644
>>>> --- a/mm/slub.c
>>>> +++ b/mm/slub.c
>>>> @@ -2102,7 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
>>>>  
>>>>  	slab = virt_to_slab(p);
>>>>  	if (!slab_obj_exts(slab) &&
>>>> -	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
>>>> +	    WARN_ONCE(alloc_slab_obj_exts(slab, s, flags, false),
>>>>  		 "%s, %s: Failed to create slab extension vector!\n",
>>>>  		 __func__, s->name))
>>>
>>> I think this should be pr_warn_once()?
>>> I'm not sure why this was WARN() in the first place.
>>>
>>
>> Isn't WARN_ONCE the same as pr_warn_once but with needing the condition
>> of the first arg to be true? We only want to warn if alloc_slab_obj_exts
>> returns non-zero. So WARN_ONCE should be ok?
>>
> 
> The difference is the impact on panic_on_warn users which are mostly
> testing bots. This warning is not actionable, so I agree with Harry to
> covert this to pr_warn_once().
> 

Sounds good! Will change it to below for the next revision.
Will wait for the kvmalloc conversation to conclude before sending
the next revision.

diff --git a/mm/slub.c b/mm/slub.c
index 08804d2f2ead..ab0b7ee87159 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2101,11 +2101,13 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
                return NULL;
 
        slab = virt_to_slab(p);
-       if (!slab_obj_exts(slab) &&
-           WARN(alloc_slab_obj_exts(slab, s, flags, false),
-                "%s, %s: Failed to create slab extension vector!\n",
-                __func__, s->name))
-               return NULL;
+       if (!slab_obj_exts(slab)) {
+               if(alloc_slab_obj_exts(slab, s, flags, false))
+                       pr_warn_once("%s, %s: Failed to create slab extension vector!\n",
+                               __func__, s->name);
+               else
+                       return NULL;
+       }
 
        return slab_obj_exts(slab) + obj_to_index(s, slab, p);
 }

