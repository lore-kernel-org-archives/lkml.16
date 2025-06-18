Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295442E54AA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252441; cv=none; b=BEjN7UVZd6kd8OkcAj1GtMPa1CyuTppKAOliEnr4INCQtJQfgS5BmBTrvB62SpfuDusygjaGuFt8Px1gGoIDe+63zqvWv3oB0zu9gY4cCsSI4XhwBrND+8u9cKyWQKfGlnMIOKuJO1aPu5DU+Pd5Fgy4RByEnzjTvobJ3cvTMu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252441; c=relaxed/simple;
	bh=IabZINxrW1gHaLOPWpilxAwlHMTonNVvVgAu8E8ZG0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkC4Fpw+WK6O6tVh6OYEKHEshABvfIevPKiG/5OUz9lHVsD/5xgN47tNeJsLYrCu6mayhDh+fJZVyD0Gvb/xk8JQ0lzbIB44nKBCv+/pCCk49XwplHWEFSwWgttjV7cV51xR05GDG6qy/KBzmyvcNAPwMBsJutgOVR9fZkmkxZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WzEHYYTn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WzEHYYTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750252437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ef97kz76Yw9Jt5ZZFpKUT1V1+HqkUXj4ehQiBa13hww=;
	b=WzEHYYTnHKwXZvZtp5/FSEzs181zl9wncN1GmAlo7mYxiXhnkbtCnhDH+3kwMGx73AJ8Lf
	0ZK/82oH1Yo1OTU1cfP/FpUj6JR5Bc2WjR5hi1YZgUJeD+s4PIAZcxRJRABUN7jA8OYKT0
	uenjEViWsMuI5FdwSeh9jGR8/YhE7xo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-kB0oBgraMDaMkMDxLCrfcA-1; Wed, 18 Jun 2025 09:13:56 -0400
X-MC-Unique: kB0oBgraMDaMkMDxLCrfcA-1
X-Mimecast-MFC-AGG-ID: kB0oBgraMDaMkMDxLCrfcA_1750252435
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso2810435f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252435; x=1750857235;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ef97kz76Yw9Jt5ZZFpKUT1V1+HqkUXj4ehQiBa13hww=;
        b=Vu4XLwovb1pvLaByg8iE2OZn4O0J1bP2cMyP20rqEXNx6JV4ShBUWdP+pYMEzMsJo3
         ZR7++1U82LIr0PHMAW70hBX/DoHR19dGF2CyY+p1/JWbhxyqLP7OqY/uQaLcpToQcWu3
         U3YMlcrrIlFyDU50ba8dEiA+AyoV3RIBCCx6AJm56p5O47236rED25vVTOEgaphuEaQB
         9OuY0DI355PUUFA0M6HvvDdnJUwb8tqoF3kNkcd8Suj5+t03yuVmRVlNrzL3A+Sl0m4R
         2qNE7mnmxbxRUs1J00yQj0V8bR0TGeZMmMPKjdn8cdKlaGRhwvQ4gAdD7BMI5SYxtnwa
         Pa4w==
X-Forwarded-Encrypted: i=1; AJvYcCXPs/cpJYve7V9o2kn0mjJKDJrnRy3YsMV6z5LF/Gc8htMRgmjihPVWicj+qxHSODr5qFG7hWfcnM1sRdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YykGM/IrchjkzWEhMkJxfWGlb91VwR2bdrIerLVTgpD5IDasvsC
	wCsl50+wv2jd65XJWp2ABwKZFrw+o5DmKcIFCE9RDzQVSsryw+mQZ9Gib1gmfe4kDpph30gERVp
	wPptGAFIVK/HugiRGUkUDkB2NjZ+3/K2JHmuRbviA3MyC3+rJLb3bW/jwgqiUMGXfeA==
X-Gm-Gg: ASbGncvRyG5bIGIcNWCweGVURwZ/imZDBgs7Qb8nb6qPTKTCcEyMhNuuMobL0cOvNwa
	zFHpoCatnNMwAOhxccgSFR3nsBk9tUODBvhLyPNs2nGwp7GMeWNXfrI+ItfXGvRio/vfliWdVPB
	F6M6ti1ggL4w+WjSHoMRr8RC9JvKRNo5+0Y49W93No1wmd4h9i6piDmVBqJGJuvoDxVw3+tMIZr
	VEF5jGtitAIq/XZ4MAw2dsPNmZ1lzjPSKGXAArHfYaULwCXiaQ9DL2mlBqNBYjgTILSoNFo6eQq
	jG+Vx+9kIdI35S9o+XspkfOkGagh+Fsl0EsjXp2PIbLT0G5oYbuOxUHUHw8j6MGYF4EgnSIdMPx
	t6pezw1ukjYKN01xSKsafx0wAhWAP1x+hFziGeKC9o5pchNo=
X-Received: by 2002:a5d:5c84:0:b0:3a4:f7db:6ff7 with SMTP id ffacd0b85a97d-3a572e58792mr15395022f8f.52.1750252435427;
        Wed, 18 Jun 2025 06:13:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyPOqWC+fIYY0jjSKYxhMePrlWdjpx8vPXshA1FnDDeRFHER8ChNGxHVBBmp44RK9t8q39ug==
X-Received: by 2002:a5d:5c84:0:b0:3a4:f7db:6ff7 with SMTP id ffacd0b85a97d-3a572e58792mr15394981f8f.52.1750252434857;
        Wed, 18 Jun 2025 06:13:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b79f45sm16872576f8f.101.2025.06.18.06.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:13:54 -0700 (PDT)
Message-ID: <b00e97d4-304f-4ede-b6e3-6efaecbeb11e@redhat.com>
Date: Wed, 18 Jun 2025 15:13:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
To: Lance Yang <lance.yang@linux.dev>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra
 <lokeshgidra@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Lance Yang <ioworker0@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Li <zi.li@linux.dev>
References: <20250607220150.2980-1-21cnbao@gmail.com>
 <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
 <f2a43ae1-6347-47e2-bcc4-845dc7e7ed87@linux.dev>
 <CAGsJ_4xVH6DT_8t=oDvHCJ-iDwrpms6FhMn9UdKWMwDRv+hunA@mail.gmail.com>
 <deb5ecd0-d57b-4a04-85b7-e6d11207aa8f@redhat.com>
 <ec77f310-6ded-4f7b-a15b-07855b0bbafb@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ec77f310-6ded-4f7b-a15b-07855b0bbafb@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.06.25 15:05, Lance Yang wrote:
> 
> 
> On 2025/6/18 18:18, David Hildenbrand wrote:
>> On 18.06.25 11:52, Barry Song wrote:
>>> On Wed, Jun 18, 2025 at 10:25 AM Lance Yang <lance.yang@linux.dev> wrote:
>>>>
>>>> Hi all,
>>>>
>>>> Crazy, the per-VMA lock for madvise is an absolute game-changer ;)
>>>>
>>>> On 2025/6/17 21:38, Lorenzo Stoakes wrote:
>>>> [...]
>>>>>
>>>>> On Sun, Jun 08, 2025 at 10:01:50AM +1200, Barry Song wrote:
>>>>>> From: Barry Song <v-songbaohua@oppo.com>
>>>>>>
>>>>>> Certain madvise operations, especially MADV_DONTNEED, occur far more
>>>>>> frequently than other madvise options, particularly in native and Java
>>>>>> heaps for dynamic memory management.
>>>>>>
>>>>>> Currently, the mmap_lock is always held during these operations,
>>>>>> even when
>>>>>> unnecessary. This causes lock contention and can lead to severe
>>>>>> priority
>>>>>> inversion, where low-priority threads—such as Android's
>>>>>> HeapTaskDaemon—
>>>>>> hold the lock and block higher-priority threads.
>>>>>>
>>>>>> This patch enables the use of per-VMA locks when the advised range
>>>>>> lies
>>>>>> entirely within a single VMA, avoiding the need for full VMA
>>>>>> traversal. In
>>>>>> practice, userspace heaps rarely issue MADV_DONTNEED across
>>>>>> multiple VMAs.
>>>>>>
>>>>>> Tangquan’s testing shows that over 99.5% of memory reclaimed by
>>>>>> Android
>>>>>> benefits from this per-VMA lock optimization. After extended runtime,
>>>>>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
>>>>>> only 1,231 fell back to mmap_lock.
>>>>>>
>>>>>> To simplify handling, the implementation falls back to the standard
>>>>>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the
>>>>>> complexity of
>>>>>> userfaultfd_remove().
>>>>>>
>>>>>> Many thanks to Lorenzo's work[1] on:
>>>>>> "Refactor the madvise() code to retain state about the locking mode
>>>>>> utilised for traversing VMAs.
>>>>>>
>>>>>> Then use this mechanism to permit VMA locking to be done later in the
>>>>>> madvise() logic and also to allow altering of the locking mode to
>>>>>> permit
>>>>>> falling back to an mmap read lock if required."
>>>>>>
>>>>>> One important point, as pointed out by Jann[2], is that
>>>>>> untagged_addr_remote() requires holding mmap_lock. This is because
>>>>>> address tagging on x86 and RISC-V is quite complex.
>>>>>>
>>>>>> Until untagged_addr_remote() becomes atomic—which seems unlikely in
>>>>>> the near future—we cannot support per-VMA locks for remote processes.
>>>>>> So for now, only local processes are supported.
>>>>
>>>> Just to put some numbers on it, I ran a micro-benchmark with 100
>>>> parallel threads, where each thread calls madvise() on its own 1GiB
> 
> Correction: it uses 256MiB chunks per thread, not 1GiB ...
> 
>>>> chunk of 64KiB mTHP-backed memory. The performance gain is huge:
>>>>
>>>> 1) MADV_DONTNEED saw its average time drop from 0.0508s to 0.0270s (~47%
>>>> faster)
>>>> 2) MADV_FREE     saw its average time drop from 0.3078s to 0.1095s (~64%
>>>> faster)
>>>
>>> Thanks for the report, Lance. I assume your micro-benchmark includes some
>>> explicit or implicit operations that may require mmap_write_lock().
>>> As  mmap_read_lock() only waits for writers and does not block other
>>> mmap_read_lock() calls.
>>
>> The number rather indicate that one test was run with (m)THPs enabled
>> and the other not? Just a thought. The locking overhead from my
>> experience is not that significant.
>>
> 
> Both tests were run with 64KiB mTHP enabled on an Intel(R) Xeon(R)
> Silver 4314 CPU. The micro-benchmark code is following:

Ah, I missed the "100 threads" above. Yeah, there should be plenty of 
locking contention with all the mprotect() in there.

-- 
Cheers,

David / dhildenb

