Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ABA28643A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090393; cv=none; b=ZrM2gm5pnUghlFVfzmWWrynM44vFfXzYwoJGP9osfLnDFmxUv88cCurcvJm0OuMt4kXDxsIVOrBJEiRFW0hAogscTEgDbzMgSOykZfTHi48IBM85moOtqdHXFEqrHmTYHFXLKTtWezxAxlu7brdMtmsEmqIlTF+y9SDp0+ZNGyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090393; c=relaxed/simple;
	bh=icgihF6nqtEDWpqBFjMsCBE+D1QltRYJ0wvWtBMnRgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tlwy8fqO+Gz9TA+2EqznW50SaC3hf7SVWw779xTo3Xj2cnmFMT/qUSyjdkd2AYtp0TbcKjYAJ3zIen8ztZsbjgN1atRBTVoWkskymAqXnj5/zJcavnsDdPQeqRh3H9wYlXudoGb1yiDzjAvINJlMVug6nK5m75FvRjrodCy0taI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HJO4lriB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HJO4lriB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750090390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C/ZrxZaPZVNPwZIrMln0mxQuZIriBwZ6wz5MhRzlmy4=;
	b=HJO4lriBXGM24jNwyKRThqUidrv2VGyI3ECkHHzcvEyWaVdsT61xD3GOz5stOaHTDKBz5o
	90+LUIzFJsLRK6tdB7mE4slTTGwGo9HMrFr0NOTDpt31FyeQ5PM98AyIp7cWd8j9trV1zN
	/Q2nCaqCXYHmjmAHg4YPhia39uIXygg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-ELnGsHaSMCe8faFwGsxuUw-1; Mon, 16 Jun 2025 12:13:08 -0400
X-MC-Unique: ELnGsHaSMCe8faFwGsxuUw-1
X-Mimecast-MFC-AGG-ID: ELnGsHaSMCe8faFwGsxuUw_1750090388
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a578958000so651408f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090387; x=1750695187;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C/ZrxZaPZVNPwZIrMln0mxQuZIriBwZ6wz5MhRzlmy4=;
        b=aSGi40nmkzXm8aR9EfBttczAuiGRoQ7bsccEtve7GWmU8uRe427LuavytIYboaLbIn
         jUBLn2Q0mOndn0LPoKpDEyhV5cDACEjLkLa2dNGRB5RYOacM9Mfgfu7gBxxhxTS1Ivj0
         x0H60w+XdGmaK4JTeNE3Yed/3yRYnDqbvjaGv/TaW+mlafXkB2JBJRkwqYG0XX0L7773
         lFOeuieVGnrN4KWpl0RKuapmPOaEv0ATrYXFdylXpbo9KtqbuYxcY+ce39P8HwDY4WzA
         ZMyDRP34T3QGmbSRxwy6cqYCWg2BuZcg79nHSXTXEP5GyTWkGnXL+lVbUy9klf9/0FkX
         x8AA==
X-Forwarded-Encrypted: i=1; AJvYcCVh2kaePfzinZSyC6FcLLo3EoIzFMc6SZLjIKvNmUeb5TFd/fBvc0WF5cM2o3aTlq0GCdTyvjJ1ZScm5T8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02dnExgsL2sJcqE3yIKU/hifQIVTe3Jo4bVpOUZS9Gv1agd1n
	aiAfu3Y1sFQ+uwTMCwP0qrKjmZNFRhIiBayHF91a60O7S78P/JC21SYatJ0WFh/c/cWyLRZV9vB
	fTmf41MfwdvZYbGZDTFOS1JRSzquD9d2UiFssRFaad6pwZxt7VfCGq5SkLFxfFTDTdA==
X-Gm-Gg: ASbGncviEbwEfTYQohvb0HCLvZYG6GgIfoZTKDFUL7432ckAuaRP64xVKODrhsfrzkJ
	RqizGZicir5JyAe0EtDiH6ECK5pb5FSh7skQKD2P1zqNmICZkwRwvNKbvndkpKV+dIlY/+5RSRC
	r6zLXaG+SNlsnOAYA5OaUO3vH3nhtKzEeEZwz234SDlr9wBqhUvPoaTWUr6UQTpbSoPt8STa2iS
	dBGrjLg5CvXXQm6nFJenalVGoPXy1BTInYsRmgdY45z2ZdE4zRo2EYg9/v7DVh4/tlefZOW/4TI
	Cv3QjS8kQH+fXtDN9tmHpPOWanfSiPV+4In0KslgslC3WAi8Rsqgb10CHPnKlj4uT47DIq/ER/W
	nYf6omW3rcL6k9gkxvqwNa6CsLY9U6qWpwQf/otOGXs86bNU=
X-Received: by 2002:a5d:64ca:0:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a5723a352dmr9392038f8f.20.1750090387584;
        Mon, 16 Jun 2025 09:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLTGh3YT8u9DxTJL0pbpY5buLKzRYbIG3/oyV4xEIsnWDco5W5TIdegHqyAXMbHJ4AR4gvMw==
X-Received: by 2002:a5d:64ca:0:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a5723a352dmr9392006f8f.20.1750090387113;
        Mon, 16 Jun 2025 09:13:07 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e244392sm148792785e9.22.2025.06.16.09.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:13:06 -0700 (PDT)
Message-ID: <d7c54bbf-ed99-43c7-99a7-a9be70071b4a@redhat.com>
Date: Mon, 16 Jun 2025 18:13:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com, pfalcato@suse.de,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-3-dev.jain@arm.com>
 <43d9cb6e-1b8f-47b9-8c19-58fc7c74a71e@redhat.com>
 <bc25dd02-6ace-45e6-9d3b-50f9c06aef98@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bc25dd02-6ace-45e6-9d3b-50f9c06aef98@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

[...]

>>>    			}
>>> -			set_pte_at(mm, new_addr, new_ptep, pte);
>>> +			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>>
>>
>> What I dislike is that some paths work on a single PTE, and we implicitly have to know
>> that they don't apply for !pte_present.
> 
> I hate any kind of implicit knowledge like this.
> 
>>
>> Like
>> 	if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> 
> I also despise [with words I cannot use on-list] how uffd is implemented.
> 
> It's _nothing but_ ad-hoc stuff like this spawned all around the place.
> 
> It's hateful.
> 
>>
>> Will not get batched yet. And that is hidden inside the pte_marker_uffd_wp check ...
>>
>> Should we properly separate both paths (present vs. !present), and while at it, do
>> some more cleanups? I'm thinking of the following on top (only compile-tested)
> 
> I'd like to see that, but I think maybe better as a follow up series?

I'd do the split as a cleanup patch upfront.

Then add the batching for the pte_present() case.

> 
> On the other hand, this does improve this quite a bit. Could also be another
> patch in the series.
> 
>>
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 18b215521adae..b88abf02b34e0 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -155,21 +155,6 @@ static void drop_rmap_locks(struct vm_area_struct *vma)
>>                  i_mmap_unlock_write(vma->vm_file->f_mapping);
>>   }
>> -static pte_t move_soft_dirty_pte(pte_t pte)
>> -{
>> -       /*
>> -        * Set soft dirty bit so we can notice
>> -        * in userspace the ptes were moved.
>> -        */
>> -#ifdef CONFIG_MEM_SOFT_DIRTY
>> -       if (pte_present(pte))
>> -               pte = pte_mksoft_dirty(pte);
>> -       else if (is_swap_pte(pte))
>> -               pte = pte_swp_mksoft_dirty(pte);
>> -#endif
>> -       return pte;
>> -}
>> -
>>   static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>>                  pte_t *ptep, pte_t pte, int max_nr)
>>   {
>> @@ -260,7 +245,6 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>                  VM_WARN_ON_ONCE(!pte_none(*new_ptep));
>>                  nr_ptes = 1;
>> -               max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>>                  old_pte = ptep_get(old_ptep);
>>                  if (pte_none(old_pte))
>>                          continue;
>> @@ -277,24 +261,34 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>                   * flushed.
>>                   */
>>                  if (pte_present(old_pte)) {
>> +                       max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>>                          nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
>>                                                           old_pte, max_nr_ptes);
>>                          force_flush = true;
>> -               }
>> -               pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
>> -               pte = move_pte(pte, old_addr, new_addr);
>> -               pte = move_soft_dirty_pte(pte);
>> -
>> -               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
>> -                       pte_clear(mm, new_addr, new_ptep);
>> -               else {
>> -                       if (need_clear_uffd_wp) {
>> -                               if (pte_present(pte))
>> -                                       pte = pte_clear_uffd_wp(pte);
>> -                               else if (is_swap_pte(pte))
>> +
>> +                       pte = get_and_clear_full_ptes(mm, old_addr, old_ptep,
>> +                                                     nr_ptes, 0);
>> +                       /*
>> +                        * Moving present PTEs requires special care on some
>> +                        * archs.
>> +                        */
>> +                       pte = move_pte(pte, old_addr, new_addr);
> 
> I guess we're good with only doing this in pte_present() case because the only
> arch that implements this, sparc, does a present check anyway.

Yes, we could then remove the call from pte_present(), see below.

> 
>> +                       /* make userspace aware that this pte moved. */
>> +                       pte = pte_mksoft_dirty(pte);
>> +                       if (need_clear_uffd_wp)
>> +                               pte = pte_clear_uffd_wp(pte);
>> +                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>> +               } else if (need_clear_uffd_wp && pte_marker_uffd_wp(pte)) {
>> +                       pte_clear(mm, old_addr, old_ptep);
> 
> Same comment as below re: pte_clear().
> 
> I see you've dropped pte_clear(mm, new_addr, new_ptep) which I guess is
> purposefully?
> 
> I do think that it is pointless yes.

Yeah, that's what I raised below.

> 
>> +               } else {
>> +                       pte_clear(mm, old_addr, old_ptep);
> 
> I guess this is intended to replace ptep_get_and_clear_full_ptes() above in the
> single PTE case... no?  Is this sufficient?
> 
> In the original code we'd always do ptep_get_and_clear().
> 
> I think the key difference is page_table_check_pte_clear().
> 
> I notice, hilariously, that there is a ptep_clear() that _does_ call this. What
> a mess.

ptep_get_and_clear() is only relevant when something is present and 
could change concurrently (especially A/D bits managed by HW).

We already obtained the pte, it's not present, and now just want to 
clear it.

> 
> 
>> +                       if (is_swap_pte(pte)) {
>> +                               if (need_clear_uffd_wp)
>>                                          pte = pte_swp_clear_uffd_wp(pte);
>> +                               /* make userspace aware that this pte moved. */
>> +                               pte = pte_swp_mksoft_dirty(pte);
>>                          }
>> -                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>> +                       set_pte_at(mm, new_addr, new_ptep, pte);
>>                  }
>>          }
>>
>>
>> Note that I don't know why we had the existing
>>
>> -               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
>> -                       pte_clear(mm, new_addr, new_ptep);
>>
>>
>> I thought we would always expect that the destination pte is already pte_none() ?
> 
> I think this is because we already did the move_pte() call in the original code
> before checking this:

Oh, maybe that's why.

> 
> 		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
> 		pte = move_pte(pte, old_addr, new_addr);
> 		pte = move_soft_dirty_pte(pte);
> 
> 		if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> 			pte_clear(mm, new_addr, new_ptep);
> 
> But maybe it's because there was a presumption move_pte() would like you know,
> move a PTE entry? Which it doesn't, it - only on SPARC - does a hook to flush
> the dcache.

I wish we could remove move_pte() completely. Or just notify about the 
move of a present pte ... because it doesn't ever modify the pte val.

So renaming it to "arch_notify_move_pte()" or sth. like that that is a 
void function might even be better.

... I think we could go one step further if we already have the folio: 
we could call it arch_notify_move_folio_pte(), and simplify the sparc 
implementation ...

Anyhow, the move_pte() cleanup can be done separately. Splitting the 
present from !present case here should probably be done as a cleanup 
upfront.

-- 
Cheers,

David / dhildenb

