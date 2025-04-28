Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9DA2101BD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874043; cv=none; b=MBjSnwJwXksYrDAaK5o00nAB/wtYiruTLZw4YU8k+NHJt4Dq6S+SIWLU5NB3la9g6gdV8Gl0tx9uylPN8JKdhb57dCE2uGwEg5/8Btff0hF3No3el23TxcYytjaEy/AJY0IZeFQTco1NTd9bF+p99FEFqMOXCRGwxUmAYeY3kzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874043; c=relaxed/simple;
	bh=nP70b5Hz75QhWTfs6WAoBXMfOFgX4IqM3KOmAe9dKis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5IX6PWn1XuggUPcPEWgFPMtfGPSL5TZnfpgrlOqFbX8AKXEH2Y2gjW+L1grMRyfbTODtedR/MMSPQn+hP0tl8wYbq4wjWcAnwXPQsLD8zrnkYd2chNbs+dgQFLaHe9dUc78hm5P6RI6Q1LGC3G1MlgvtT/JBKLhPSNAxIcMt0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hWBWCW4Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hWBWCW4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745874040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4qpbiWgV7Ddx9E73Lc8qtn1XePoQZ6PsaZzcraR3qsY=;
	b=hWBWCW4YPA5ln5rvnCyKQG7X8zd7WBYs46he7/XeU1CgSzsbEzG9nNXQvZEqb3ohlK3HyO
	NvVG/RdjHn2enq9dopsgRyQPAD/Qc/4eis87+5pkmSBr2dQm9cIhVF6htMmQp4cVrjqzI7
	4o4Z37AypSWRSwOcrYNeA+Wi1Ep+DAk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-6Ky7roNXPfChBtVyELZxqQ-1; Mon, 28 Apr 2025 17:00:39 -0400
X-MC-Unique: 6Ky7roNXPfChBtVyELZxqQ-1
X-Mimecast-MFC-AGG-ID: 6Ky7roNXPfChBtVyELZxqQ_1745874038
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so21056155e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874038; x=1746478838;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4qpbiWgV7Ddx9E73Lc8qtn1XePoQZ6PsaZzcraR3qsY=;
        b=h+H6+2NjQMa4mP/5y7u/z3N2qW+mxnCE5LfikVR/nLbpS5GjluXcFxFwHQ3MVLJn/x
         LxAZ1tY4WA16mcBhctQzciCKHkQ1vSHR9DIahSgacOgcLK+e/7QSa9mLkaUpRRpKghaA
         THW9AV+jKLB7eCHszeWZiYBcSwlxqAEUy7SHhHcR2knVHgV1djBkEl5zbkbPsxz/jH0V
         NzeA/RNj4CUwt1Rakltn5PcENBkYP6wuW5JIEuHk4jeW5Rt++LK56xMRh7HUTG+hYSeI
         amLrYwU0yXB+jo3KZzeEjsHX0USEbrsMgG8tHKisUo6Sx9QoSveo1AbXq1BObD4QT4oA
         aE3w==
X-Forwarded-Encrypted: i=1; AJvYcCX+iYtfXvGbUtZx0/8UCNg0St4ESModuhRrX1NQGM219mgX1tV8liv+OxkUPIytMmAxQAmcKgdo3qK406E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu6hb6kr8sTnM/tRtRZRbo29f9z7sI7ewbX6xvfDsiCnT9gyv0
	LNi3YuEbtDF9ct/CguCsSifpkPo1Id6w+zykaUL5anGAx3vPcIOodblosWvrgDKtcu2GU9FefW/
	ZzSzKOfZsaSOvzVqMkQrqwBExRX0oXySeK0YcakhW8JtRADaJVBQ4HrXFNqhoCg==
X-Gm-Gg: ASbGncvfr2nssSRIgKBY1dJOrVLfL/K+itUWGZFKf2Q0/+1OJ6/UR/BeIT/PoBJkw6V
	A5b+XljiiOGD906ywd8kP5USUIknr6xLP5VeVnkh3aXJbs1eMfVLgjwduRxYUN2N+CrQuv3BH5g
	avsC0F4OmkYaTOpAFyy67fjQaVJza+sNq3fAqEnCq7LGMvLnEArlWcBfMsfy3RsktPR+3DECrFe
	52Kr1GlCjrCNTHCfrVvm6wSmJ5DAFCthoXIhFeDBlvY12kqnzIOUvbi7d/5CoU7tGM3Tx0bGMbb
	abKzQ05bSSYag9x0c4si4qQPId8HuXnu7MXDfhe+Cf/Tq2itsRltBDi8DMBsawlFbNvPIU8VHfr
	lNfpjw9UCy5ptUT88KSjN3nJDn6WhwtH/alXMZU4=
X-Received: by 2002:a05:600c:3c88:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-441acb49b68mr4870485e9.12.1745874038219;
        Mon, 28 Apr 2025 14:00:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHveJOInwar/Y+jsD+HxnSOjloLz17LYldmDlnM90SnF+EBsjArgVS/Bo4W3m297pglFJJwHg==
X-Received: by 2002:a05:600c:3c88:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-441acb49b68mr4870285e9.12.1745874037832;
        Mon, 28 Apr 2025 14:00:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b9c4sm170991415e9.3.2025.04.28.14.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:00:37 -0700 (PDT)
Message-ID: <6fb7b4b6-3b2c-4f7c-9c84-a72cdac6f854@redhat.com>
Date: Mon, 28 Apr 2025 23:00:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SNP guest crash in memblock with unaccepted memory
To: Tom Lendacky <thomas.lendacky@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mel Gorman <mgorman@techsingularity.net>,
 "Kalra, Ashish" <ashish.kalra@amd.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>
References: <f12f5bd0-135b-91fd-9703-7df98500f9c5@amd.com>
 <b037ffeb-bfeb-41a6-b200-d8c57076370f@redhat.com>
 <64c04e6c-43b1-996b-f83d-5fb1751debaa@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <64c04e6c-43b1-996b-f83d-5fb1751debaa@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28.04.25 20:10, Tom Lendacky wrote:
> On 4/28/25 09:04, David Hildenbrand wrote:
>> On 27.04.25 17:01, Tom Lendacky wrote:
>>> Hi Kirill,
>>>
>>> Every now and then I experience an SNP guest boot failure for accessing
>>> memory that hasn't been accepted. I managed to get a back trace:
>>>
>>>     RIP: 0010:memcpy_orig+0x68/0x130
>>>     Code: ...
>>>     RSP: 0000:ffffffff9cc03ce8 EFLAGS: 00010006
>>>     RAX: ff11001ff83e5000 RBX: 0000000000000000 RCX: fffffffffffff000
>>>     RDX: 0000000000000bc0 RSI: ffffffff9dba8860 RDI: ff11001ff83e5c00
>>>     RBP: 0000000000002000 R08: 0000000000000000 R09: 0000000000002000
>>>     R10: 000000207fffe000 R11: 0000040000000000 R12: ffffffff9d06ef78
>>>     R13: ff11001ff83e5000 R14: ffffffff9dba7c60 R15: 0000000000000c00
>>>     memblock_double_array+0xff/0x310
>>>     memblock_add_range+0x1fb/0x2f0
>>>     memblock_reserve+0x4f/0xa0
>>>     memblock_alloc_range_nid+0xac/0x130
>>>     memblock_alloc_internal+0x53/0xc0
>>>     memblock_alloc_try_nid+0x3d/0xa0
>>>     swiotlb_init_remap+0x149/0x2f0
>>>     mem_init+0xb/0xb0
>>>     mm_core_init+0x8f/0x350
>>>     start_kernel+0x17e/0x5d0
>>>     x86_64_start_reservations+0x14/0x30
>>>     x86_64_start_kernel+0x92/0xa0
>>>     secondary_startup_64_no_verify+0x194/0x19b
>>>
>>> I don't know a lot about memblock, but it appears that it needs to
>>> allocate more memory for it's regions array and returns a range of memory
>>> that hasn't been accepted. When the memcpy() runs, the SNP guest gets a
>>> #VC 0x404 because of this.
>>>
>>> Do you think it is as simple as calling accept_memory() on the memory
>>> range returned from memblock_find_in_range() in memblock_double_array()?
>>
>> (not Kirill, but replying :) )
>>
>> Yeah, we seem to be effectively allocating memory from memblock ("from
>> ourselves") without considering that memory must be accepted first.
>>
>> accept_memory() on the new memory (in case of !slab) should be the right
>> thing to do.
> 
> Thanks, David. Let me add a call in for accept_memory in the !slab case
> and see if that resolves it. May take a bit to repro, but should find
> out eventually.
> 
> I'll submit a patch once I verify.

BTW, I was wondering if we could use memblock_alloc_range_nid() in 
memblock_double_array(); maybe not that easy, just a thought.

-- 
Cheers,

David / dhildenb

