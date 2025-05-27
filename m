Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298C1E3DF2
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336412; cv=none; b=ZH2q2IIcMouQRD0i9EiMAJwU+pMMH93wy6Zyfp+NkuHeSYXxtdnH7JLedgeP9CHvGpiMKA0IJc6NHFE4grWQ16CFOt2irCfmbEHDfA5Ji92D3/NoO2F+lTe3zNDmfQe7gsANz+w2MnbMA/pUDv7czqoW+sJrPiiRaDv5WkuttNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336412; c=relaxed/simple;
	bh=SpB8reM0sc2OPQrlO8hGN0J+cVR/DvnEsjBcrRu3otY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs1I0nHfuzR1My1Szcv3/3PefCNKfHo9AL4NrGNN9jR2LDLGAEfJkrjR25R5JooipsYC3CymkVVrfhqMbCOF5PVtJKFLvNiozdkI4pQYN0Snr0YX1FwmNnf2G5FPK4VJN0Xfa3CnvuMGjjxWJchAzvehwTCQyvmBdqqSTzWcAdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KULTF5Mi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KULTF5Mi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748336409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GXTsXwwwC5Fd6SpkUtTR8cAGZzYMKvi4G91wol1yAfw=;
	b=KULTF5MiS6ZSVavx6V69p4/BhHTd4RXL/dide5N5xK/BVB6GRLRRn5+JdUVlQd3l/Sn9sv
	KT1adQTYY6P76otmAS/4BaB+B/W4QVFkxf3Rf0CptRBs2c1ZqOhuh+DnYZTBCvBBDCz+3a
	hvRAPYtc8cblnyhZLDzBfO/SGVZ6IWg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-KRSC9U8jMs6obs18nwIDDg-1; Tue, 27 May 2025 05:00:06 -0400
X-MC-Unique: KRSC9U8jMs6obs18nwIDDg-1
X-Mimecast-MFC-AGG-ID: KRSC9U8jMs6obs18nwIDDg_1748336406
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so23303875e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748336406; x=1748941206;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GXTsXwwwC5Fd6SpkUtTR8cAGZzYMKvi4G91wol1yAfw=;
        b=gTNwjXUzkNqOhW7dpNJnq8f+V8uo5A8o4jdmA+6UMG7tG9nNdDSmk3Yi0XaKAWcuCu
         l0FaVui2L72eao3+SxbnNVe40Ho918rOwojKPtK3PQqIGyemXUPHsN/liud33u80NDGC
         E4Q9Tvv/bcJ0Qq+o/1yaM3YuTdwLyZbBzg1JFvhaNMhS5UN7NiLHN4WjWRGlhRSPfFmy
         fa2e2exl3qGegVtxYZxuksUy7wRDYaH1InIyk3NS15pDBJRmtjCXNY2z6fipV8AY/fpe
         wEiZduEZUg7WwCNFuT2JwovO8mtFaPSsTxIN+mQ4dQnf3pIvnBgKtmTDnNyZODX+uli3
         GiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwi7hUNJZoS93wCZN0E8l/gUe08afCMv3nWdnFHjPvB7M6LxDDvSrrRPfhgTEvsX5RL7VL6UFdQE4T2vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHPAJMSdMcsZwjTKJsXPgw6q7STfyKJ+JcHwN1Y6JKU2McCG7Z
	upE4ejk+uQhU3u3mjzPAZMA3rOdjBtNuzG89OthRX8f0b/06r1rQm1hKyPk7F1GfnPFPNGadLel
	VUdpc5aFSE/eQ9n6YlcArPb64AoORWp7z0cCINXVy6pXvRDl8TSdzveq0k87WmlOoFEgF7zlqjl
	so
X-Gm-Gg: ASbGncuyKtkj3sDfPhOpVKMoywOx4AtJPNrMobFBZGiUrmqE6E/5jhvMcP+7xpLmpat
	Uh5YcypAjJSyI7oqdudSNVMRjxhe/23DKooZJt9lfhosJr4ft7tbuXyG+x20Mz0x698TM9gbQHQ
	GpX8bIxYzvB0gtQYYXJKIvCEojtTE7B7cy/1pxmcjjnidm8NkrUs2oZEM2Ti13zXiIsVauYefCY
	ajyHnYiQPsaR156KxbLBHBWSapE0KjGVlh71JV4C4LuJfSCyflZmshMH0qbT+2QTGcwLL2+Ub1d
	mbVkzitYkRcuulBiWegxcKa+YNJ2C0Ms0ycN/1i1Co16
X-Received: by 2002:a05:600c:6286:b0:442:d9f2:c74e with SMTP id 5b1f17b1804b1-44c932f9428mr100371415e9.23.1748336405619;
        Tue, 27 May 2025 02:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGARQ2Bno0QUbxu9dhzCoswDZzm0640a4L6rO+rC2ch1A7P8det11zghRkpyptb9zOMZ4ZLCg==
X-Received: by 2002:a05:600c:6286:b0:442:d9f2:c74e with SMTP id 5b1f17b1804b1-44c932f9428mr100370965e9.23.1748336405177;
        Tue, 27 May 2025 02:00:05 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7d9bde0sm262173905e9.40.2025.05.27.02.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 02:00:04 -0700 (PDT)
Message-ID: <bcc5cbb6-4ce6-4c01-8b5b-f6e01b306b2d@redhat.com>
Date: Tue, 27 May 2025 11:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]userfaultfd_move fails to move a folio when swap-in occurs
 concurrently with swap-out
To: Barry Song <21cnbao@gmail.com>
Cc: aarcange@redhat.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 peterx@redhat.com, ryncsn@gmail.com, surenb@google.com
References: <CAGsJ_4zOhNBe9b1m1LYaJbFur3TdLma+2EXbc=BhAToDeLfvAg@mail.gmail.com>
 <20250527083722.27309-1-21cnbao@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250527083722.27309-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.05.25 10:37, Barry Song wrote:
> On Tue, May 27, 2025 at 4:17 PM Barry Song <21cnbao@gmail.com> wrote:
>>
>> On Tue, May 27, 2025 at 12:39 AM David Hildenbrand <david@redhat.com> wrote:
>>>
>>> On 23.05.25 01:23, Barry Song wrote:
>>>> Hi All,
>>>
>>> Hi!
>>>
>>>>
>>>> I'm encountering another bug that can be easily reproduced using the small
>>>> program below[1], which performs swap-out and swap-in in parallel.
>>>>
>>>> The issue occurs when a folio is being swapped out while it is accessed
>>>> concurrently. In this case, do_swap_page() handles the access. However,
>>>> because the folio is under writeback, do_swap_page() completely removes
>>>> its exclusive attribute.
>>>>
>>>> do_swap_page:
>>>>                  } else if (exclusive && folio_test_writeback(folio) &&
>>>>                             data_race(si->flags & SWP_STABLE_WRITES)) {
>>>>                           ...
>>>>                           exclusive = false;
>>>>
>>>> As a result, userfaultfd_move() will return -EBUSY, even though the
>>>> folio is not shared and is in fact exclusively owned.
>>>>
>>>>                           folio = vm_normal_folio(src_vma, src_addr,
>>>> orig_src_pte);
>>>>                           if (!folio || !PageAnonExclusive(&folio->page)) {
>>>>                                   spin_unlock(src_ptl);
>>>> +                               pr_err("%s %d folio:%lx exclusive:%d
>>>> swapcache:%d\n",
>>>> +                                       __func__, __LINE__, folio,
>>>> PageAnonExclusive(&folio->page),
>>>> +                                       folio_test_swapcache(folio));
>>>>                                   err = -EBUSY;
>>>>                                   goto out;
>>>>                           }
>>>>
>>>> I understand that shared folios should not be moved. However, in this
>>>> case, the folio is not shared, yet its exclusive flag is not set.
>>>>
>>>> Therefore, I believe PageAnonExclusive is not a reliable indicator of
>>>> whether a folio is truly exclusive to a process.
>>>
>>> It is. The flag *not* being set is not a reliable indicator whether it
>>> is really shared. ;)
>>>
>>> The reason why we have this PAE workaround (dropping the flag) in place
>>> is because the page must not be written to (SWP_STABLE_WRITES). CoW
>>> reuse is not possible.
>>>
>>> uffd moving that page -- and in that same process setting it writable,
>>> see move_present_pte()->pte_mkwrite() -- would be very bad.
>>
>> An alternative approach is to make the folio writable only when we are
>> reasonably certain it is exclusive; otherwise, it remains read-only. If the
>> destination is later written to and the folio has become exclusive, it can
>> be reused directly. If not, a copy-on-write will occur on the destination
>> address, transparently to userspace. This avoids Lokesh’s userspace-based
>> strategy, which requires forcing a write to the source address.
> 
> Conceptually, I mean something like this:
> 
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index bc473ad21202..70eaabf4f1a3 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1047,7 +1047,8 @@ static int move_present_pte(struct mm_struct *mm,
>   	}
>   	if (folio_test_large(src_folio) ||
>   	    folio_maybe_dma_pinned(src_folio) ||
> -	    !PageAnonExclusive(&src_folio->page)) {
> +	    (!PageAnonExclusive(&src_folio->page) &&
> +	    folio_mapcount(src_folio) != 1)) {
>   		err = -EBUSY;
>   		goto out;
>   	}
> @@ -1070,7 +1071,8 @@ static int move_present_pte(struct mm_struct *mm,
>   #endif
>   	if (pte_dirty(orig_src_pte))
>   		orig_dst_pte = pte_mkdirty(orig_dst_pte);
> -	orig_dst_pte = pte_mkwrite(orig_dst_pte, dst_vma);
> +	if (PageAnonExclusive(&src_folio->page))
> +		orig_dst_pte = pte_mkwrite(orig_dst_pte, dst_vma);
>   
>   	set_pte_at(mm, dst_addr, dst_pte, orig_dst_pte);
>   out:
> @@ -1268,7 +1270,8 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
>   			}
>   
>   			folio = vm_normal_folio(src_vma, src_addr, orig_src_pte);
> -			if (!folio || !PageAnonExclusive(&folio->page)) {
> +			if (!folio || (!PageAnonExclusive(&folio->page) &&
> +					folio_mapcount(folio) != 1)) {
>   				spin_unlock(src_ptl);
>   				err = -EBUSY;
>   				goto out;
> 
> I'm not trying to push this approach—unless Lokesh clearly sees that it
> could reduce userspace noise. I'm mainly just curious how we might make
> the fixup transparent to userspace. :-)

And that reveals the exact problem: it's all *very* complicated. :)

... and dangerous when we use the mapcount without having a complete 
understanding how it all works.


What we would have to do for a small folio is

1) Take the folio lock

2) Make sure there is only this present page table mapping:
	folio_mapcount(folio) != 1

	of better

	!folio_maybe_mapped_shared(folio);

3) Make sure that there are no swap references

	If in the swapcache, check the actual swapcount

3) Make sure it is not a KSM folio


THPs are way, way, way more complicated to get right that way. Likely, 
the scenario described above cannot happen with a PMD-mapped THP for now 
at least (we don't have PMD swap entries).


Of course, we'd then also have to handle the case when we have a swap 
pte where the marker is not set (e.g., because of swapout after the 
described swapin where we dropped the marker).


What could be easier is triggering a FAULT_FLAG_UNSHARE fault. It's 
arguably less optimal in case the core will decide to swapin / CoW, but 
it leaves the magic to get all this right to the core -- and mimics the 
approach Lokesh uses.

But then, maybe letting userspace just do a uffdio_copy would be even 
faster (only a single TLB shootdown?).


I am also skeptical of calling this a BUG here. It's described to behave 
exactly like that [1]:

        EBUSY
               The pages in the source virtual memory range are either
               pinned or not exclusive to the process. The kernel might
               only perform lightweight checks for detecting whether the
               pages are exclusive. To make the operation more likely to
               succeed, KSM should be disabled, fork() should be avoided
               or MADV_DONTFORK should be configured for the source
	      virtual memory area before fork().

Note the "lightweight" and "more likely to succeed".


[1] https://lore.kernel.org/lkml/20231206103702.3873743-3-surenb@google.com/

-- 
Cheers,

David / dhildenb

