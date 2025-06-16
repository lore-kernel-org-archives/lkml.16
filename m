Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C1621507F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106489; cv=none; b=ooyHxq4gTqfeOqnpILeTyMRj592Erky25soXVQ+b5HNJWdh2IJMrGwmFW6qN0/PSsKhJenjRNK4BDttt4Qcyjbsb35MRZKyED4m3hc1EoE/vohxLGLMA/eBb8ta6WrpYKF43kQCaIIeACrOvMy9E1n6ApkFBcBhxXndAWapAcc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106489; c=relaxed/simple;
	bh=5oElTD5U3rE7nbKw9umq4qcybGG/DXNyJ4w1MHt15Bc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GrXDNqI8RbG+dWzCc3HH+2LTc6wwy7VsuD7QEKGRyf9Wt/yxb5Z3345iAPHOjM8HSh7nVRBe4tjHFCq/pFZokO9KRJ1YCfquzs+hKcqFSY3SDwsqBoldIWOSqUjMXdROtbjAIOfyu72NaIf4NrR+orDKLCXCkPfbZUZ5ZVNw2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RbY8eS3x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RbY8eS3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750106485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RIpEn4K/Z6CLwZ8eprVlfBAwlpVu+vMVL7hf6ZNcFbU=;
	b=RbY8eS3xAuG37ncfh/k2G633RdQhVJ8VJyssICk4B9Am3l3umRih8TGY4SQzWMaEF5VBfS
	5wTxmp1jPnKtWMdYClx+ZQVMj6DH7zIV0TM2V4pMfNxXAW5PXUmeiUxRiXrq2uIMlfOElv
	jxxcFSOYVfo5FJ/Msjoc3fN9on6hg1s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-YnHBbzhnPRu7laZs_cml_Q-1; Mon, 16 Jun 2025 16:41:24 -0400
X-MC-Unique: YnHBbzhnPRu7laZs_cml_Q-1
X-Mimecast-MFC-AGG-ID: YnHBbzhnPRu7laZs_cml_Q_1750106483
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso30447985e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750106483; x=1750711283;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RIpEn4K/Z6CLwZ8eprVlfBAwlpVu+vMVL7hf6ZNcFbU=;
        b=DMfNTpkH8YFDUYWeb++wRX1b9vxvpKtQC4aPLA+qK8HV/hvNgAW2jS+ttNz1oE7auo
         +OE6tKAynUsfBec1P3Gjt0TbG6wdk8Zkr9C33rJ2Bfeic2SF0GrkU/mPMxLPj/Hjr4Ej
         NDSNsb3O4Di/Jwu31sdQgoknzCgFyLrQtZdlhtDDFqDLcZzWNflpiUmTV/YEPvUc/Gmc
         W6oU5XjzXLMAfmDOYdVq9LlflVe/lOjRvag+PRpPWg5HEW3xLJJgGKT8j1cPf5zgG46w
         T0dOJ/EmINFWT+K7WoULlCLiYBZisiYPpLxdUdk2tCbmiew4bhdUQAjd2Y7MSqeengQ3
         PHQg==
X-Forwarded-Encrypted: i=1; AJvYcCUNrIDAvBlP80RkQCgrNcRqC9UUNAM9eD9w2YXGBi1FQrlZvF9b+43OMqn0X4tAOEl1eYYfXhVEgvAEALs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTVANHAUryetoUPBTTSQIq3Smt+3OmsDxnClmiaeqokF6K+iay
	stXhURvli0MuNgTVpMr8VjAddQHHWJhnAu513Kl5X8AgYOBg8TePSDYlFDG6hJZ2EBUveZZP4Js
	fylcxO7X2/652sFiXx1GYG+L9hjVotozVqUECBAmMJNGOEHvR8n5Rw0h8UxH5gQTBOA==
X-Gm-Gg: ASbGncv3a3RMt/mU7Ef8XY8KJ8j4hfc6Sa0/lBbzv95YXDJxmSXpmiKLvvtEXuxSoiV
	/7i8fr26UYZ4Kr8pFWc+SNmYqxGVQwgRkUhe6JQNK7H6yWru6xhT1nIZG6I+EorR9EyW/j5FOcQ
	gRHPeqmD6MHSDbrndNYiIHTaqNaRYE3+c/Paqxe7DeQcyPrqU5a78jgnZquMHSbZR/aCeNOALQ9
	icbqXEp1EjKYlJ5g1SZpvnqhhdGvyRMVCjCz0yqwYfBAY8MJIiA8bDLK72j7hyUq2kgcOJZI4og
	FIfgof4ZERQAT2EJTeZuUlDNDp0sIuFKhqGBTh8KUDJOW53CAHYpv4GOyrGgDErg+//dey/DRqS
	UoRuGGuKwlPm/ZOgfQU8JbOaa5WfgilDk6M5+iGE+ZBjwpzb+VQ==
X-Received: by 2002:a05:6000:144e:b0:3a4:f975:30f7 with SMTP id ffacd0b85a97d-3a572e58f6fmr8580537f8f.56.1750106483119;
        Mon, 16 Jun 2025 13:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvhcuPpXrh1LprfnUOptJmK+Un1xl1g+AJPJ4d4R+AhH9xKvJHfeWYS3ng4/zx5HHs9+UYKw==
X-Received: by 2002:a05:6000:144e:b0:3a4:f975:30f7 with SMTP id ffacd0b85a97d-3a572e58f6fmr8580517f8f.56.1750106482671;
        Mon, 16 Jun 2025 13:41:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5? (p200300d82f3ae300c6604ff55bfbf5c5.dip0.t-ipconnect.de. [2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a72cd3sm12056443f8f.32.2025.06.16.13.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 13:41:22 -0700 (PDT)
Message-ID: <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
Date: Mon, 16 Jun 2025 22:41:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
From: David Hildenbrand <david@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
 Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 22:24, David Hildenbrand wrote:
> Hi Lorenzo,
> 
> as discussed offline, there is a lot going on an this is rather ... a
> lot of code+complexity for something that is more a corner cases. :)
> 
> Corner-case as in: only select user space will benefit from this, which
> is really a shame.
> 
> After your presentation at LSF/MM, I thought about this further, and I
> was wondering whether:
> 
> (a) We cannot make this semi-automatic, avoiding flags.
> 
> (b) We cannot simplify further by limiting it to the common+easy cases
> first.
> 
> I think you already to some degree did b) as part of this non-RFC, which
> is great.
> 
> 
> So before digging into the details, let's discuss the high level problem
> briefly.
> 
> I think there are three parts to it:
> 
> (1) Detecting whether it is safe to adjust the folio->index (small
>       folios)
> 
> (2) Performance implications of doing so
> 
> (3) Detecting whether it is safe to adjust the folio->index (large PTE-
>       mapped  folios)
> 
> 
> Regarding (1), if we simply track whether a folio was ever used for
> COW-sharing, it would be very easy: and not only for present folios, but
> for any anon folios that are referenced by swap/migration entries.
> Skimming over patch #1, I think you apply a similar logic, which is good.
> 
> Regarding (2), it would apply when we mremap() anon VMAs and they happen
> to reside next to other anon VMAs. Which workloads are we concerned
> about harming by implementing this optimization? I recall that the most
> common use case for mremap() is actually for file mappings, but I might
> be wrong. In any case, we could just have a different way to enable this
> optimization than for each and every mremap() invocation in a process.
> 
> Regarding (3), if we were to split large folios that cross VMA
> boundaries during mremap(), it would be simpler.
> 
> How is it handled in this series if we large folio crosses VMA
> boundaries? (a) try splitting or (b) fail (not transparent to the user :( ).
> 
> 
>> This also creates a difference in behaviour, often surprising to users,
>> between mappings which are faulted and those which are not - as for the
>> latter we adjust vma->vm_pgoff upon mremap() to aid mergeability.
>>
>> This is problematic firstly because this proliferates kernel allocations
>> that are pure memory pressure - unreclaimable and unmovable -
>> i.e. vm_area_struct, anon_vma, anon_vma_chain objects that need not exist.
>   > > Secondly, mremap() exhibits an implicit uAPI in that it does not permit
>> remaps which span multiple VMAs (though it does permit remaps that
>> constitute a part of a single VMA).
> 
> If I mremap() to create a hole and mremap() it back, I would assume to
> automatically get the hole closed again, without special flags. Well, we
> both know this is not the case :)
> 
>   > > This means that a user must concern themselves with whether merges
> succeed
>> or not should they wish to use mremap() in such a way which causes multiple
>> mremap() calls to be performed upon mappings.
> 
> Right.
> 
>>
>> This series provides users with an option to accept the overhead of
>> actually updating the VMA and underlying folios via the
>> MREMAP_RELOCATE_ANON flag.
> 
> Okay. I wish we could avoid this flag ...
> 
>>
>> If MREMAP_RELOCATE_ANON is specified, but an ordinary merge would result in
>> the mremap() succeeding, then no attempt is made at relocation of folios as
>> this is not required.
> 
> Makes sense. This is the existing behavior then.
> 
>>
>> Even if no merge is possible upon moving of the region, vma->vm_pgoff and
>> folio->index fields are appropriately updated in order that subsequent
>> mremap() or mprotect() calls will succeed in merging.
> 
> By looking at the surrounding VMAs or simply by trying to always keep
> the folio->index to correspond to the address in the VMA? (just if
> mremap() never happened, I assume?)
> 
>>
>> This flag falls back to the ordinary means of mremap() should the operation
>> not be feasible. It also transparently undoes the operation, carefully
>> holding rmap locks such that no racing rmap operation encounters incorrect
>> or missing VMAs.
> 
> I absolutely dislike this undo operation, really. :(
> 
> I hope we can find a way to just detect early whether this optimization
> would work.
> 
> Which are the exact error cases you can run into for un-doing?
> 
> I assume:
> 
> (a) cow-shared anon folio (can detect early)
> 
> (b) large folios crossing VMAs (TBD)
> 
> (c) KSM folios? Probably we could move them, I *think* we would have to
> update the ksm_rmap_item. Alternatively, we could indicate if a VMA had
> any KSM folios and give up early in the first version.

Looking at patch #1, I can see that we treat KSM folios as "success".

I would have thought we would have to update the corresponding 
"ksm_rmap_item" ... somehow, to keep the rmap working.

I know that Wei Yang (already on cc) is working on selftests, which I am 
yet to review, but he doesn't cover mremap() yet.


Looking at rmap_walk_ksm(), I am left a bit confused.

We walk all entries in the stable tree (ksm_rmap_item), looking in the 
anon_vma interval tree for the entry that corresponds to 
ksm_rmap_item->address.

	addr = rmap_item->address & PAGE_MASK;

	if (addr < vma->vm_start || addr >= vma->vm_end)
		continue;

So I would assume, already when we mremap() ... we are *already* 
breaking KSM rmap walkers? :) Or there is somewhere some magic that I am 
missing.

A KSM mremap test case for rmap would be nice ;)

-- 
Cheers,

David / dhildenb

