Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A56523B601
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149962; cv=none; b=UkSK4Y/MNYBwdzDYdR9hWNwdfeHgZcwAPkMp7MOiMxj8fhapDGWdb2jZ2eI4JpgHjnC6GwNFrqL8pc+tRbUJSkvVE4Rh8n6XvCvxSIrhXI1LXSMG5yjmiGc350QFB/CjnashMNal4wPn0EEtZLpmAbMbjagYkKyZ/ElTEe8Xr28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149962; c=relaxed/simple;
	bh=TwSaDn+0W4AImANQRDLY0c6bdvo37vEi+5iHq9X47Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVQlHStXVBVzfiyzxviguoo34NDeOYapAb1iTl6STFGNC8UlQIZfvRfC2DnavrWqB7TAXjaXSJgNudnFBD91SqCkaNtq+wP1SC8FdofWGv2HssZunY3Ui/dWb6QaQge9Mxce/+ViBjS1kWSVCfrwpyqyGWPHMS7TzajGJrY8ztU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aBWcnHUx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBWcnHUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750149958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+G3ospLMA2XYWkGUmnXr3TzBKv9Sa5X1cCVCRNuoDN0=;
	b=aBWcnHUxjcmgn8i1p4GK7Okt1CSjFVS1ZnidvTYn4E6vosxBFtE/WnTNfKbgbuMNVzDzdq
	gJFi0uHa/BQ7nVS10nMJApz6Mqk9a6Sy8V9wEGH+XvhAKWmVbc28AqiG8fl2+7M04+yc9B
	CJ4zVPdQm4gCtrJwmmb3U34uBXW6x1U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-61giyGEKMYqdOCa7CaMySw-1; Tue, 17 Jun 2025 04:45:57 -0400
X-MC-Unique: 61giyGEKMYqdOCa7CaMySw-1
X-Mimecast-MFC-AGG-ID: 61giyGEKMYqdOCa7CaMySw_1750149956
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d290d542so33006995e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750149956; x=1750754756;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+G3ospLMA2XYWkGUmnXr3TzBKv9Sa5X1cCVCRNuoDN0=;
        b=VnBsTMppBmowxGDj72nAbH9KPcxl0OH0Q5BNpWtENnQTo9dZlGRhZASdhDpn9vJbYB
         aouG6HSh/RQlnnRqskZi72OeaGsSmPRTigm5LJI6EUIk4lamsLiKoH17EVXKWPmFqaJE
         8JdPEOMrEjwHilbI6PwnO8ATimR/UOrik/uBwYQCqrIftBS/joCRbAv/qcmZlQjAVIoe
         N3Z77BWRspoJ+h9HwJvF97cQbrZiB1LVcUBLMdk0olTI8+KkT1WkQJQFmbydWUDNJBmq
         txsNaNUdNODb5Ngmkk4I19Np2OiIWA7pTpBXlgz2is1dLQEAiqwRxb1VUyMX7NDzNx96
         kXtw==
X-Forwarded-Encrypted: i=1; AJvYcCXwXOutZ6t5QVOi4jkxrVVBuEqjTt2eCPiVYw2feM+fPOIj0ZBq9o2K2LzefSFdVwZZ62EtyrFyEepMRKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdOlyw8oQMqGA7l0ywsbWYr9hD77f17atMUa3MtzL3t0/olAWo
	DOASv5tZEsVQNZhVF1act7Awb85tlkT9Ab7y5XcCGuJxlp1ihXXudgFRuvjRwWj3YU9KI8oFeDa
	o1kSOMN3qVPs3OcADV0rwlURyIuoYSNJy3Z0E5GmRO+e+SXhShpHSWLpsyfbFom/Bzg==
X-Gm-Gg: ASbGncteAypO5sPdet4LupI9wTZVw4qddOlQGNmyiWgiLErCfUXOnt5iwuEgqsPNntZ
	YpyrceCgpjEzQdlJetlQelhCNQDkO8XoUbhxGGwk8zWo9JFd92Yx9nnpGg+uxItA08wJNVL6z7h
	PJTwZt2CqFZlM2we0GNKhVNiIr5S7UtSdG/OnfQsIBPByCkznyA9dm+JOaBFUMEBvrApDXvpEOa
	QDsi2kWLiSNNGNuwqym4WQWbIBNAEz3FjP39lIRtoRyN073+bH3wiOaa51x+mbggVYmDPZipf3n
	RAiu+aAqMej/9wdtInHwScEGRWnn/YMOwoFEjiLTzAM42qsEmG2/f3a6Hlz8iPCgM0pF6HqCB67
	GOxSGOULsGn6BV62LwCWLXo5K2gXkARAdBB355B2IlDbZPDY=
X-Received: by 2002:a05:6000:2913:b0:3a5:2949:6c31 with SMTP id ffacd0b85a97d-3a5723aed54mr10046989f8f.42.1750149956418;
        Tue, 17 Jun 2025 01:45:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5px/HdTcWLj11j/Dsf89T5YM5LlH/EwwnLUOgFBU0kgmDhtM72pP3A1pVNhVi646yxjX1dw==
X-Received: by 2002:a05:6000:2913:b0:3a5:2949:6c31 with SMTP id ffacd0b85a97d-3a5723aed54mr10046959f8f.42.1750149955980;
        Tue, 17 Jun 2025 01:45:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2324c6sm166046645e9.12.2025.06.17.01.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:45:55 -0700 (PDT)
Message-ID: <68d8c7ad-aea0-4556-be63-9b67d70e4386@redhat.com>
Date: Tue, 17 Jun 2025 10:45:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Pedro Falcato <pfalcato@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Jakub Matena <matenajakub@gmail.com>, Wei Yang <richard.weiyang@gmail.com>,
 Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
 <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 10:34, Pedro Falcato wrote:
> On Mon, Jun 16, 2025 at 10:41:20PM +0200, David Hildenbrand wrote:
>> On 16.06.25 22:24, David Hildenbrand wrote:
>>> Hi Lorenzo,
>>>
>>> as discussed offline, there is a lot going on an this is rather ... a
>>> lot of code+complexity for something that is more a corner cases. :)
>>>
>>> Corner-case as in: only select user space will benefit from this, which
>>> is really a shame.
>>>
>>> After your presentation at LSF/MM, I thought about this further, and I
>>> was wondering whether:
>>>
>>> (a) We cannot make this semi-automatic, avoiding flags.
>>>
>>> (b) We cannot simplify further by limiting it to the common+easy cases
>>> first.
>>>
>>> I think you already to some degree did b) as part of this non-RFC, which
>>> is great.
>>>
>>>
>>> So before digging into the details, let's discuss the high level problem
>>> briefly.
>>>
>>> I think there are three parts to it:
>>>
>>> (1) Detecting whether it is safe to adjust the folio->index (small
>>>        folios)
>>>
>>> (2) Performance implications of doing so
>>>
>>> (3) Detecting whether it is safe to adjust the folio->index (large PTE-
>>>        mapped  folios)
>>>
>>>
>>> Regarding (1), if we simply track whether a folio was ever used for
>>> COW-sharing, it would be very easy: and not only for present folios, but
>>> for any anon folios that are referenced by swap/migration entries.
>>> Skimming over patch #1, I think you apply a similar logic, which is good.
>>>
>>> Regarding (2), it would apply when we mremap() anon VMAs and they happen
>>> to reside next to other anon VMAs. Which workloads are we concerned
>>> about harming by implementing this optimization? I recall that the most
>>> common use case for mremap() is actually for file mappings, but I might
> 
> realloc() for mmapped allocations commonly calls mremap(), FYI (at least for
> glibc, and musl; can't bother to look at the rest).

Good point. Only for larger areas, I assume, where glibc would already 
fallback to expensive mmap()+munmap() instead of using the optimized 
sparse area.

> 
>>> be wrong. In any case, we could just have a different way to enable this
>>> optimization than for each and every mremap() invocation in a process.
> 
> /me thinks of prctl

I didn't want to spell that out :P I don't think this would have to be 
configurable per process ...

> 
> :P
> 
> 
> FWIW, with regards to the whole feature: While I do understand it's purpose (
> relocating anon might be too much for most workloads, but great for some), I'm
> uncomfortable with the amount of internals we're exposing here. Who's to say
> this is how mm rmap looks in 20 years? And we're stuck maintaining the userspace
> ABI until then.

Yes.

> 
> Personally, I would prefer if we just had a flag 'MREMAP_HARDER' that would
> vaguely be documented as "mremap but harder, even if have to do a little more
> work". Then we could move things around without promising RELOCATE_ANON makes
> conceptual sense, and userspace wouldn't have to think through the implications
> of such a flag by reading Lorenzo's great book.

Even such a flag is just weird.

Next time we do MREMAP_EVEN_HARDER

mremap() is already an expensive operation ... so I think we need a 
pretty convincing case to make this configurable by the user at all for 
each individual mremap() invocation.

-- 
Cheers,

David / dhildenb

