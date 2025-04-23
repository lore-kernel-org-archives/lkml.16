Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F4225C834
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436618; cv=none; b=H23DS1euYVge9KaBNsqiZ0LdkQhJr4f/inRF2Z84/hbgK33NTYn6og6P9AFqk93jkraZ4pHcywkZx9AF1EgUoh6YDnzo7CSz2l2IBEp5pelYwucQ4Duws9mweF0ceTlq2dEpwLBi3ZDUvO565vw9e8yXPjEcMaXwx2lEg/34s6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436618; c=relaxed/simple;
	bh=qLZ0yqG8HA8eGX3eUIoRTJAgV4m68M8gj8cPG7Hqjao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qx6CJ+93RLetjHWLrmsPk2y9K1RW7SnFOk1Pjk0xGY9za+AgLcuNZOeZYfmWf/iYSlcOtEqHGR93J48mGu1aS6u3FsPeUt6otPCZaKoJg1RJSlQbNCF/Qoxkp9c8OcdJ/Q6YSUD3CCBzxo5itLRs4UsyBAf19BioT5xjANsIPGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fkfC7fxW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fkfC7fxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745436614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PItQ7KszmU2zVpKOnuHtjt42DwYSHkk8jr7NtA39BJo=;
	b=fkfC7fxW5YTd00Ob0AWNa6zFHW3661ofhhFKdbxYpRkS6VSZ9fWYgFIlJsUXarfY6RFJUc
	YZN4LVhayV0wwXthUgpxLBwf4hF/P4WCEYg83rg1YP94tNZbnJr0mWf7mY7YD7n5hAVHeM
	03S95MzHOK12fa5ylr07t5+4SFhmKj0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-SbynTf8kMmiVPr2j9wgtBg-1; Wed, 23 Apr 2025 15:30:12 -0400
X-MC-Unique: SbynTf8kMmiVPr2j9wgtBg-1
X-Mimecast-MFC-AGG-ID: SbynTf8kMmiVPr2j9wgtBg_1745436611
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cec217977so992165e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745436611; x=1746041411;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PItQ7KszmU2zVpKOnuHtjt42DwYSHkk8jr7NtA39BJo=;
        b=O324966XYxmWeuD5TA005lus5s/vl+kfK+VeZbVHrdpgbVLQxpAi7Yg0a6CW0/FquX
         qOaVAnTuoEySA36y6z4nGwghGj50ZZKp7jVcGRTZEtaGEwGF8Q8o3iqD9zh2LCu+0YJi
         QQ07OtGIUSH8LprWWDNbCmTE9we7jcIKW91HOGh+n69pIqV0Q78pFGHpo6VmOHf0Msa0
         9Fwj8hGTm+trFD1zbGaukyr3VF/HvbbChYhtgapnA2XDLjbyGsztOJX6z/1e7zT4iNlE
         T1b34paJJ1gvkoUhxoJF8lR0HDoXroIg2kT9pZTAlqJFWHYM9aiEiFiQRSciuCfm62Ef
         iFPQ==
X-Gm-Message-State: AOJu0YzERJirq2peyp5jO0RT5MgxPBdZzB39snNaJOpyhbNymhdXu99t
	hCu9j4HlholjR9PTF17J0Vn8siKSCgNF+i8WobKRmJftNPbNW2hlTP/7hrrPDLZdAKUwj8byHta
	R3OYjBs0+q7b/pPgpMI737C21ZDFE6n+N0ObfkBvye+1m5PnRt3yfIX7DKVaU8g==
X-Gm-Gg: ASbGnctAXq0D1IdLgPJotO9UsozGOg9I8w4CcELjj+O1T0/0yhNEkS/BtFOfr9YIQRv
	oH0C0X8k634ELTDpUxaEx58BnDSkPvPPRJqg6SIe8stMALNV5FsBI7ZYyL/RWxnhPIjH+sGgVOq
	+8FaWMnQS/oJVFvCjnM09ADQU5OQXPMZ5n2MRG5OigxDJQlkBu+HK+T27Y52o7T9gx+HJhgZG7c
	SaFM/Hry3l8SMpSt+07+ctjXQ6sI80AiuvjBLENfTCOJc73H0ttBo3eeCqexGlBZFhgR7E474CO
	hGfrZmyeb34YWMxrU27kDLv5Ai4lZehRJVnloXw/n8wnWdhaaMVGqvpO+hDoM9JL/nYx9p0WcXb
	sPk7zdfLYA5pkA5zXUtsMzuHZb2RRfXyeR3cKI+E=
X-Received: by 2002:a05:600c:4ecc:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4406ac0aec8mr152970705e9.22.1745436611254;
        Wed, 23 Apr 2025 12:30:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1mjW2K2VIHahK7ukBTM9rHWQgXcITpHuf/BlpRGgBPX3GHnGPhT1uWjmZk3Og2lSYCJjoPg==
X-Received: by 2002:a05:600c:4ecc:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4406ac0aec8mr152970485e9.22.1745436610824;
        Wed, 23 Apr 2025 12:30:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:2c00:d977:12ba:dad2:a87f? (p200300cbc7402c00d97712badad2a87f.dip0.t-ipconnect.de. [2003:cb:c740:2c00:d977:12ba:dad2:a87f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931acsm19941044f8f.72.2025.04.23.12.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 12:30:10 -0700 (PDT)
Message-ID: <d3f71458-8c0d-44c9-9a03-868efceee93f@redhat.com>
Date: Wed, 23 Apr 2025 21:30:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250422144942.2871395-1-david@redhat.com>
 <45b26168-93c9-4170-b7e1-4b51078a04f6@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <45b26168-93c9-4170-b7e1-4b51078a04f6@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.04.25 16:41, Lorenzo Stoakes wrote:
> +cc Liam for the vma things, and because he adores PAT stuff ;)
> 
> On Tue, Apr 22, 2025 at 04:49:42PM +0200, David Hildenbrand wrote:
>> Not intuitive, but vm_area_dup() located in kernel/fork.c is not only
>> used for duplicating VMAs during fork(), but also for duplicating VMAs
>> when splitting VMAs or when mremap()'ing them.
> 
> Ugh this sucks, I really want to move a bunch of this stuff out of the fork
> code. we have some really nasty overlap there.
> 
> This definitely needs to be separate out. Perhaps I can take a look at
> that...

Yes, it should likely live in ... vma.c ? :)

> 
>>
>> VM_PFNMAP mappings can at least get ordinarily mremap()'ed (no change in
>> size) and apparently also shrunk during mremap(), which implies
>> duplicating the VMA in __split_vma() first.
> 
> Yes, it appears we only disallow VM_PFNMAP on a remap if it is MREMAP_FIXED
> (implies MREMAP_MAYMOVE) to a new specific address _and_ we _increase_ the
> size of the VMA.
> 
> (as determined by vrm_implies_new_addr(), with resize_is_valid() explicitly
> disallowing MREMAP_DONTUNMAP).
> 
> Makes sense as VM_PFNMAP implies we map non-vm_normal_folio() stuff, which
> can't be faulted in, and thus we can't have unfaulted backing for it, but
> we can shrink safely.
> 
>>
>> In case of ordinary mremap() (no change in size), we first duplicate the
>> VMA in copy_vma_and_data()->copy_vma() to then call untrack_pfn_clear() on
>> the old VMA: we effectively move the VM_PAT reservation. So the
>> untrack_pfn_clear() call on the new VMA duplicating is wrong in that
>> context.
>>
> 
> OK so we do:
> 
> copy_vma_and_data()
> -> copy_vma()
> -> vm_area_dup()
> -> untrack_pfn_clear(new vma)
> 
> And:
> 
> copy_vma_and_data()
> -> untrack_pfn_clear(old vma)
> 
> So we end up with... neither tracked. Fun.
> 
> Agreed this is incorrect.
> 
>> Splitting of VMAs seems problematic, because we don't duplicate/adjust the
>> reservation when splitting the VMA. Instead, in memtype_erase() -- called
>> during zapping/munmap -- we shrink a reservation in case only the end
>> address matches: Assume we split a VMA into A and B, both would share a
>> reservation until B is unmapped.
> 
> Glorious. I really oppose us making radical changes to splitting logic to
> suit this one x86-specific feature.
> 
> Seems to me the change should be within PAT...

Yeah ...

> 
>>
>> So when unmapping B, the reservation would be updated to cover only A. When
>> unmapping A, we would properly remove the now-shrunk reservation. That
>> scenario describes the mremap() shrinking (old_size > new_size), where
>> we split + unmap B, and the untrack_pfn_clear() on the new VMA when
>> is wrong.
>>
>> What if we manage to split a VM_PFNMAP VMA into A and B and unmap A
>> first? It would be broken because we would never free the reservation.
>> Likely, there are ways to trigger such a VMA split outside of mremap().
> 
> This must have been a problem that already existed, and this is really
> quite plausible in reality, which makes me wonder, again, how much PAT is
> actually used in the wild.

Probably people use it all the time, but we only fix stuff that we hit 
in practice.

Fun. :)

> 
> I may be mistaken of course (happy to be corrected) and it's used very
> heavily and somehow this scenario doesn't occur.
> 
> We should definitely add a test for this anyway :) even if 'skip' for now
> while we figure out how to fix it (_without egregiously impacting split
> code_).
> 
> This can't happen in mremap() in any case as we are unmapping which happens
> to split then always remove the latter VMA.
> 
> OK so to get back into the split logic, this is:
> 
> shrink_vma() (in mm/mremap.c)
> -> do_vmi_munmap()
> -> do_vmi_align_munmap()
> -> vms_gather_munmap_vmas()
> -> __split_vma()
> (later called from do_vmi_align_munmap())
> -> vms_complete_munmap_vmas()
> -> vms_clear_ptes()
> -> unmap_vmas()
> -> unmap_single_vma()
> -> untrack_pfn()
> -> free_pfn_range()
> -> memtype_free()
> -> memtype_erase()
> 
> As simple as that! ;)

My head started spinning when I followed that callchain :D

> 
> Makes sense.
> 
>>
>> Affecting other VMA duplication was not intended, vm_area_dup() being
>> used outside of kernel/fork.c was an oversight. So let's fix that for;
>> how to handle VMA splits better should be investigated separately.
> 
> To reiterate, I think this should be handled within PAT itself, rather than
> result in changes to VMA code, unless it results in us adding sensible
> hooks there.

Yes. I wish we could remove it; I'm afraid we can;t

[...]

> Anyway, having gone through your excellent descriptions (albeit, feeling
> the same pain as you did :P), and looking at the logic, I agree this patch
> is correct, so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks!

> 
>> ---
>>
>> This VM_PAT code really wants me to scream at my computer. So far it didn't
>> succeed, but I am close. Well, at least now I understand how it interacts
>> with VMA splitting ...
> 
> Well, I'm also quite scared of it, and indeed also relate ;) How heavily
> used is PAT? We do seem to constantly run into problems with getting it to
> behave itself wrt VMA code.
> 
> We recently had to remove some quite egregious hooks in VMA code which was
> a pain, is there a better way of doing this?
> 
> I really do hate this 'randomly call a function in various spots and do
> something specific for feature X' pattern that we use for hugetlb, uffd,
> this, and other stuff.

I hate it.

Probably the right way of attaching such metadata to a VMA would be 
remembering it alongside the VMA in a very simple way.

For example, when we perform a reservation we would allocate a 
refcounted object and assign it to the VMA (pointer, xarray, whatever).

Duplicating the VMA would increase the refcount. Freeing a VMA would 
decrease the refcount.

Once the refcount goes to zero, we undo the reservation and free the object.

We would not adjust a reservation on partial VMA unmap (split + unmap A 
or B), but I strongly assume that would just be fine as long as we undo 
the reservation once the refcount goes to 0.

There is one complication: this nasty memremap.c that abuses it for !vma 
handling. But that could be split out and handled differently.

> 
> We need to use (carefully constrained!) generic hooks for this kind of
> thing.
> 
> At least tell me the mremap() refactor I did made this less horrible? ;)


haha, absolutely :P


-- 
Cheers,

David / dhildenb

