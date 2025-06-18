Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C41C289837
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241910; cv=none; b=uZiAFmGB4WZnQzg1rQ+0vdXiyanBtpgTcBW2W9j5ZxTKkoJpGIaXchPfip15YXwaywGmiVKA5HwCJRwY568KUCymokdDVRjzPm7HBFME7StL+nkDtFqxtMcWLXW1jm90YrxbDHSMePcC1wfI1l7zpEI3BqLTEQRkH73RuSsC8Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241910; c=relaxed/simple;
	bh=y3obSHiaS/mtm9fWkKPp+6t0FX+yF8OGeYGh2q9HQpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0fYwP4+M1velLZSZFTUvuaBR27s7PCa5rhlP4y4PfVQwDFs6SAnZcdyQE/aFP8o1ftLVYIGl0Gn2t08097991L/dhoTQEfoTofmgiQ0GqquJNhllJWVxjnvKidDZ1w9SK2QHvu+ngKnjXQkuogkj4yTuYskENt7jkoCAYcHC/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RcePDtKd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RcePDtKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750241907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xE9hcE8VWWU+fZcKkGZrNh9Vbm1NLv7ru7W76wyemew=;
	b=RcePDtKdvC2FfMWH3yfXCmoBPfOmWyuga0MxE5tXZoxUmIQ8aFbAh8APu7g1aa8yxfYfym
	ldpqGjKaN9cbesdYehPqODBAvb1axFLn+wxTJTcjaioaYB2ZoFiCXgmWDxVhHg1Qq2k+iK
	990zT9rracnkE/JkIebXILYTcvqSDvU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-B6WLUPWOMcuxyWw8nszDGA-1; Wed, 18 Jun 2025 06:18:25 -0400
X-MC-Unique: B6WLUPWOMcuxyWw8nszDGA-1
X-Mimecast-MFC-AGG-ID: B6WLUPWOMcuxyWw8nszDGA_1750241904
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so33445695e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750241904; x=1750846704;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xE9hcE8VWWU+fZcKkGZrNh9Vbm1NLv7ru7W76wyemew=;
        b=FbeoMO9omPLxSVnNJvAz/hgZMBr982vJNB6IQhOrYbXbHVlS7ORqDgVe9rR7xIESL/
         S9UlHlDDLy57vhRz0z4sLT0wa//ydsyGDFTGUmUiFp0Zt9wSlP+xEC5Bd0Eh1Vgzf62A
         qwlEl8Alnawn66OCZtWKvEM2hon4LcwRSq9UdvI0KoaNktWKULq/T/00k2vaxtKyZhOX
         cI0fAUtFXupuBfomgN+/tZci9RcBCBlbYBrZzPCngZ1bGEvjDaaAWyjBGRI4ObrFUYYX
         sqxDr3LVOVWCk2OEeaJ53zslp23+eYQsQ8KSF37evHfECfZZ0XTKa2C5tuYOenPkZmn7
         P4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzyK/CVCNtVyzrcyvxT+sD0clUdXDWev3S8lVvycTNLiSwV6beXAkoXmJ53UJBIhTlaSUdAEhjtndabhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCFiSRL9kbdwDX3SjiSidnvEMnNFXKEhxwrT5VvLSlWAGBipq
	+M4+i41L5UMGdIMi5YyzgI89C7hqMn/DkVkoqR/Xs5T0AdZmAuXfgPxrNhKyF4k5aHVltxIRqFZ
	ypQaj7pq5OMNdGQH/lkVQo4cpeF6q0DbgcoM3S3QgK64znPRSqC/PWR6k05JDSmu1SQ==
X-Gm-Gg: ASbGnctMsl09nWyCAo+yYCUL/90939BaAB9ZPVsIiIIn18i94D13v/j+ufMGnzEdBUX
	5J5POwtitwrnLgsvIEfTCifS8/RI/9pzTiwTJzAYMWvZP5ii/RZ5w2ELzAIUnL2jBeCuTtUPu1/
	p52F7MEy0TzycK/jpSQBYtjblDzgFOQcHl+sCDH/IFjs7vM6VSz/ahzUArOsPpk2gwsjWqTX/1A
	RfoBJfJAKbYEGkjEcyv/y/ACq58jhjFJs1G9GEgOCq3qvnqw7S/OGlR34Z3VpkKv1cfM6gljhNr
	nz44eXM9qL+Efvo3VWxWunxN88ZwDuDa7dokBDgx1STVS6D/+qDjB+3Zuda64GNS0hM6mQZ71AB
	5WN1Dh48QgFGsQqraAjz+Dtm+8/bOL8ZeWbC7T02xYKFu/qs=
X-Received: by 2002:a05:600c:540e:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-4533ca40f80mr143369975e9.2.1750241904205;
        Wed, 18 Jun 2025 03:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaJO1klicgtCzDe/YgKgiUBgihGIy6m9Iow/yTELtSUG89fig6gOZ3ZBpPSkhgjw8jytxMtA==
X-Received: by 2002:a05:600c:540e:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-4533ca40f80mr143369605e9.2.1750241903810;
        Wed, 18 Jun 2025 03:18:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c229sm201693605e9.6.2025.06.18.03.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 03:18:23 -0700 (PDT)
Message-ID: <deb5ecd0-d57b-4a04-85b7-e6d11207aa8f@redhat.com>
Date: Wed, 18 Jun 2025 12:18:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
To: Barry Song <21cnbao@gmail.com>, Lance Yang <lance.yang@linux.dev>
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4xVH6DT_8t=oDvHCJ-iDwrpms6FhMn9UdKWMwDRv+hunA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.06.25 11:52, Barry Song wrote:
> On Wed, Jun 18, 2025 at 10:25 AM Lance Yang <lance.yang@linux.dev> wrote:
>>
>> Hi all,
>>
>> Crazy, the per-VMA lock for madvise is an absolute game-changer ;)
>>
>> On 2025/6/17 21:38, Lorenzo Stoakes wrote:
>> [...]
>>>
>>> On Sun, Jun 08, 2025 at 10:01:50AM +1200, Barry Song wrote:
>>>> From: Barry Song <v-songbaohua@oppo.com>
>>>>
>>>> Certain madvise operations, especially MADV_DONTNEED, occur far more
>>>> frequently than other madvise options, particularly in native and Java
>>>> heaps for dynamic memory management.
>>>>
>>>> Currently, the mmap_lock is always held during these operations, even when
>>>> unnecessary. This causes lock contention and can lead to severe priority
>>>> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
>>>> hold the lock and block higher-priority threads.
>>>>
>>>> This patch enables the use of per-VMA locks when the advised range lies
>>>> entirely within a single VMA, avoiding the need for full VMA traversal. In
>>>> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
>>>>
>>>> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
>>>> benefits from this per-VMA lock optimization. After extended runtime,
>>>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
>>>> only 1,231 fell back to mmap_lock.
>>>>
>>>> To simplify handling, the implementation falls back to the standard
>>>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
>>>> userfaultfd_remove().
>>>>
>>>> Many thanks to Lorenzo's work[1] on:
>>>> "Refactor the madvise() code to retain state about the locking mode
>>>> utilised for traversing VMAs.
>>>>
>>>> Then use this mechanism to permit VMA locking to be done later in the
>>>> madvise() logic and also to allow altering of the locking mode to permit
>>>> falling back to an mmap read lock if required."
>>>>
>>>> One important point, as pointed out by Jann[2], is that
>>>> untagged_addr_remote() requires holding mmap_lock. This is because
>>>> address tagging on x86 and RISC-V is quite complex.
>>>>
>>>> Until untagged_addr_remote() becomes atomic—which seems unlikely in
>>>> the near future—we cannot support per-VMA locks for remote processes.
>>>> So for now, only local processes are supported.
>>
>> Just to put some numbers on it, I ran a micro-benchmark with 100
>> parallel threads, where each thread calls madvise() on its own 1GiB
>> chunk of 64KiB mTHP-backed memory. The performance gain is huge:
>>
>> 1) MADV_DONTNEED saw its average time drop from 0.0508s to 0.0270s (~47%
>> faster)
>> 2) MADV_FREE     saw its average time drop from 0.3078s to 0.1095s (~64%
>> faster)
> 
> Thanks for the report, Lance. I assume your micro-benchmark includes some
> explicit or implicit operations that may require mmap_write_lock().
> As  mmap_read_lock() only waits for writers and does not block other
> mmap_read_lock() calls.

The number rather indicate that one test was run with (m)THPs enabled 
and the other not? Just a thought. The locking overhead from my 
experience is not that significant.

-- 
Cheers,

David / dhildenb

