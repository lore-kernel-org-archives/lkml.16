Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F255277808
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697452; cv=none; b=AmIXaVf68eG6VyNx/r3Phe/DAQABpeZHowpHyH+5g1IVEESc2nRNqOEwKv6E/IQzIWr+ZWBojG8vQXdjflSwKrZmY3y1ZCV8NwKrbIBi2tUgAqzXokaKjr6c+ISqMRekuJDEUrp09s4q2HoD8pCHLGxBoMiSSMKOA1zgM33q1sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697452; c=relaxed/simple;
	bh=z9w5Jff+RJsOxoWNaAhQgJzKEZk6yp/f2YCK8XptQHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G41EzvHM5Dl+ifIMidUlprduuQfw/JfQYKhDeaiEqDcZCgh27kgHe3D6+33w+bVpFx3Q7tBDwGLuWkbCX21+4jjhRn3UZVeNJN6JVUT2+crDjJQFWEgi5pdCLt9OQGM/Z2m1j7EoJOjXdp0K15vr6nxS8f9QsqzVVCfkS0+nMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NSbMngih; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NSbMngih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750697449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ed4niKBqAAFAJdMUfcKk9bgf0mMY+ZjxjhYnZ9rFgsM=;
	b=NSbMngihVV0032IlfmuJTr6u3hKCa73CKZp84iGjwhdZ19sFR04jjroYexe2xindEnj5Hn
	LG10QIgyRqko03H38OMORhjPiPiQ/qiOFyKO/JE+ISh844KOhzvwkCatMjcRQLY9qbbpNL
	vA7wXWabCUJRy1JolRpn50kDBuR/AzE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-hk3Q6vaFMsONZCJfM99AIw-1; Mon, 23 Jun 2025 12:50:46 -0400
X-MC-Unique: hk3Q6vaFMsONZCJfM99AIw-1
X-Mimecast-MFC-AGG-ID: hk3Q6vaFMsONZCJfM99AIw_1750697445
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a5058f9ef4so1671299f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697445; x=1751302245;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ed4niKBqAAFAJdMUfcKk9bgf0mMY+ZjxjhYnZ9rFgsM=;
        b=oYv0n74CZBnL5m7gmOAbStjXeBWhcjDqISRyOUNgJgHSvZU+xCK04ZPsmMszeKLgXD
         VpMJd/rnECLbLPAAIdGOp71BVLHqlc078yLgubLvS/B4c5AcjJh4jtot0d7oko8cM+bm
         jTndAFs3Fpc8Qy1iM9uV0L7KX3Jx7m6ZvvupSYG/FJypgFU4ZBZjhLL/dUdiez/2CKRk
         uws2Limq3GSg8yNzaOX6zo3pr0sNhXM/6lSA20PW4ZJVpRGZuHsK6Fw2sVaIAjZFGDpI
         0xGRLUELJiuD7UoNtxA6O3nLDA20P+zGwqwt8DPAwiJrPgT5qKWBWZxM+8Y3oa5FrEgG
         uxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtxyHq66VK99XWzTLmIWCAbRUnQLl4Gk2MuTFz9f4kftiN+RlgOm4OUHMJ3dh2W8tWGx4ezvDbSvXc5/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTA9BYrmpvNpXPlBQxDOnHKlCvsWFt30LyjrMfRi7fdGLEuwbL
	vhEo5kjsaoH+Wt8RuJWYDiw3wOmsMJvyIcVxFo9M86rfP28tD0cTRC6uMulEJ1J9RrV/4SX14YI
	rBSHocK8T0+I7xnn1H54onAtHkGC/O7tnEQtWCmHEM918pPYQqfYJZn5FMfgMR9mjTQ==
X-Gm-Gg: ASbGncvLkxHgS0ZB+ocAd11aYS1ZZ26SzdF/V2aex317nXlNEWq2Qo+7UvDzZvSNNDp
	q7pSR9u2FUn/aCmLMEFfLrBrIrwZHrYmLB4gT+xrG+SeVaCtuo9z1SxqCWmSHZoIKazulfMRArj
	BzDT/fxMn14VO4trvXEkV34CIo+kAk9PO4SyDuTYUXa86LM3EH6RFgjvJVFMsgkdW7+kmzsSSkD
	7WVy92OMkpRQR4UbBRyUmNtBygkfamugEIDuDyStAqVkLnkFJsmHqUqsXTIQ0MIl2nr4MjMuC88
	0f9JBee+y0H/lDWE5yy6J9BLu/vO+uQW5E9nni+z/6VlmvUFO3hFFyycu340I/2TPLA2Y2OUjRA
	ry7N+BRnuHP4ynILD7l8aBQCuZDRhz7rop7mn/e+TGsJsG73BJQ==
X-Received: by 2002:a05:6000:3c7:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3a6d12da112mr10882039f8f.29.1750697445058;
        Mon, 23 Jun 2025 09:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOCWW7LmmKMRm1yEnHNd2WBIZ/Ne3pJxWlGyzN5KG6za4FEbOjWtLWcsmJ/nBd/OTszxhfTg==
X-Received: by 2002:a05:6000:3c7:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3a6d12da112mr10882005f8f.29.1750697444635;
        Mon, 23 Jun 2025 09:50:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453624554cfsm83316645e9.0.2025.06.23.09.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:50:44 -0700 (PDT)
Message-ID: <0126fa5f-b5aa-4a17-80d6-d428105e45c7@redhat.com>
Date: Mon, 23 Jun 2025 18:50:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mm: Introduce vm_uffd_ops API
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Nikita Kalyazin <kalyazin@amazon.com>, Hugh Dickins <hughd@google.com>,
 Oscar Salvador <osalvador@suse.de>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Andrea Arcangeli <aarcange@redhat.com>,
 Ujwal Kundur <ujwal.kundur@gmail.com>, Suren Baghdasaryan
 <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, James Houghton <jthoughton@google.com>,
 Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Axel Rasmussen <axelrasmussen@google.com>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <20250620190342.1780170-2-peterx@redhat.com>
 <1e6fcebf-f74e-46ad-912b-d7df13527aea@redhat.com> <aFld0LpB429q9oCT@x1.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFld0LpB429q9oCT@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.06.25 15:59, Peter Xu wrote:
> On Mon, Jun 23, 2025 at 10:25:33AM +0200, David Hildenbrand wrote:
>> On 20.06.25 21:03, Peter Xu wrote:
>>
>> Hi Peter,
> 
> Hey David,
> 
>>
>>> Introduce a generic userfaultfd API for vm_operations_struct, so that one
>>> vma, especially when as a module, can support userfaults without modifying
>>
>> The sentence is confusing ("vma ... as a module").
>>
>> Did you mean something like ".. so that a vma that is backed by a
>> special-purpose in-memory filesystem like shmem or hugetlb can support
>> userfaultfd without modifying the uffd core; this is required when the
>> in-memory filesystem is built as a module."
> 
> I wanted to avoid mentioning of "in-memory file systems" here.

I thought one of the challenges of supporting guest_memfd on anything 
that is not a special in-memory file system is also related to how the 
pagecache handles readahead.

So ...

> 
> How about an updated commit like this?
> 
>    Currently, most of the userfaultfd features are implemented directly in the
>    core mm.  It will invoke VMA specific functions whenever necessary.  So far
>    it is fine because it almost only interacts with shmem and hugetlbfs.
> 
>    This patch introduces a generic userfaultfd API for vm_operations_struct,
>    so that any type of file (including kernel modules that can be compiled
>    separately from the kernel core) can support userfaults without modifying
>    the core files.

.... is it really "any file" ? I doubt it, but you likely have a better 
idea on how it all could just work with "any file".

> 
>    After this API applied, if a module wants to support userfaultfd, the
>    module should only need to touch its own file and properly define
>    vm_uffd_ops, instead of changing anything in core mm.
> 
>    ...

Talking about files and modules is still confusing I'm afraid. It's 
really a special-purpose file (really, not any ordinary files on 
ordinary filesystems), no?

> 
>>
>>> the core files.  More importantly, when the module can be compiled out of
>>> the kernel.
>>>
>>> So, instead of having core mm referencing modules that may not ever exist,
>>> we need to have modules opt-in on core mm hooks instead.
>>>
>>> After this API applied, if a module wants to support userfaultfd, the
>>> module should only need to touch its own file and properly define
>>> vm_uffd_ops, instead of changing anything in core mm.
>>
>> Talking about modules that much is a bit confusing. I think this is more
>> about cleanly supporting in-memory filesystems, without the need to
>> special-case each and every one of them; can be viewed a cleanup independent
>> of the module requirement from guest_memfd.
> 
> Yes.  But if we don't need to support kernel modules actually we don't need
> this.. IMHO it's so far really about cleanly support kernel modules, which
> can even be out-of-tree (though that's not my purpose of the change..).
> 
> Please help check if above updated commit message would be better.

I agree that another special-purpose file (like implemented by 
guest_memfd) would need that. But if we could get rid of 
"hugetlb"/"shmem" special-casing in userfaultfd, it would be a rasonable 
independent cleanup.

But I can spot in patch #3 now:

"Hugetlbfs still has its own hard-coded handler in userfaultfd, due to 
limitations similar to vm_operations_struct.fault(). TODO: generalize it 
to use the API function."

I would have hoped that we clean that up in one go instead.

> 
>>
>>>
>>> Note that such API will not work for anonymous. Core mm will process
>>> anonymous memory separately for userfault operations like before.
>>>
>>> This patch only introduces the API alone so that we can start to move
>>> existing users over but without breaking them.
>>>
>>> Currently the uffd_copy() API is almost designed to be the simplistic with
>>> minimum mm changes to move over to the API.
>>>
>>
>> Is there a way to move part of the actual implementation (how this is all
>> wired up) from patch #4 into this patch, to then only remove the old
>> shmem/hugetlb hooks (that are effectively unused) in patch #4?
> 
> Not much I really removed on the hooks, but I was trying to reuse almost
> existing functions.  Here hugetlb is almost untouched on hooks, then I
> reused the shmem existing function for uffd_copy() rather than removing it
> (I did need to remove the definition in the shmem header though becuse it's
> not needed to be exported).
> 
> The major thing got removed in patch 4 was some random checks over uffd ops
> and vma flags.  I intentionally made them all in patch 4 to make review
> possible.  Otherwise it can be slightly awkward to reason what got removed
> without knowing what is protecting those checks.

Agreed. It's a shame the new API is not a proper replacement for hugetlb 
special casing just yet ...

-- 
Cheers,

David / dhildenb

