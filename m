Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB03199943
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535997; cv=none; b=UcYWpbOEt93w1Eu86ExO6VQreiW+zAm1Gq6D4FP32/KCuFvi842WCVMmre1bztnkdyVFwucrnZGRW6AWQvQ6tJ1M87af6tUmSHqPBz3mLE/+HRDcIQKlc7ZCtF6bgBElG9mgIVFtBUy9wFRb8B95I6pa8OmCwRTlyqDuTRD03So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535997; c=relaxed/simple;
	bh=3lGz9duZtHmQVpC/Ue3GVYTjYpLnGAww6+/ZQs3QHgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvQbg7R02Scoh1SfcMkh/Fxy2K11xHdY9VsIoIxv+1EmQUMwPKdB/QCi8B4UI6Dy5o4/zFPR7HTk84XKjWDrRX1g94slvoeXoTx+argfYhc2SUSacbyKC6C8gSziSpP5UTbZ22cojdsGKOfQh2GCX7OwWUb1BnW9JI5bTBj2j+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jn+Phpm6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jn+Phpm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743535994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T2XCqHFpcPu5+OGqNfRSa1SjI5kZckg9XQ9+DxlseuE=;
	b=Jn+Phpm6ENbDNjOWEmc2mrpi5r64K//+vh2o6XN8qQlhczSEMH6+H1ECmhHIER6R68AJsb
	UIUefYYBB7td6/bD+ZpsP8xb11UJ4o8bjz7L5QGs+gR0nCiVT9sRmVf/sUG+kdAdjSmMl/
	8EW8xvwif3/OOW2qB1EubPrI4/wdj1s=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-mZN_pn76NzOl3MIxUxU-6A-1; Tue, 01 Apr 2025 15:33:13 -0400
X-MC-Unique: mZN_pn76NzOl3MIxUxU-6A-1
X-Mimecast-MFC-AGG-ID: mZN_pn76NzOl3MIxUxU-6A_1743535991
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5499b98c870so3009923e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 12:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535991; x=1744140791;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T2XCqHFpcPu5+OGqNfRSa1SjI5kZckg9XQ9+DxlseuE=;
        b=K9ZsXXRdUwLtk4z0Yvpn36S5dlSbBwYdvrMYxzj1hkQcYobVETJ8CWFy6B8EJu4R2U
         puP4pLZoIklbUmsi2/Q+F2XEBW/DPZ8gIo+DJDc4e9KCK6GIMl5/2ughIQ017kl88Oay
         tqvf3/4cLuIoa9JT8AZ/GcwelVLWKB0qTsTlK8OEtHq/jVtIxYkHLgZ0f6ZGkwtc095G
         asJtvluRgRNk9bJGtdTk/cCevNd2BeFbnOTrDyy/sH6ufU9/9LgcKm05ER2PKub2sEJU
         qqtcu/ZV4Gn7MsUnBSAzywZD5f7AWbCN9EiBFNR/dLj9OwmnL0N7UvhRH4T5jBxrle4O
         nh1A==
X-Forwarded-Encrypted: i=1; AJvYcCXTvbJz/0MIBA94fC5CFewMaTsTfJt4V8AjbIE/GYSvO4AikxE9vhp8/mT6lD1S474K4AaqpDCnGeHvjxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb882Sa66RQODTEhdsItO7F2mGnTOE7ZDXhBB5vjE2xcYNRWkl
	61g74spMwM/4UmihAcTdY19bm40HCfnlV+MGo6bqRnGXp6rv3ymv2PLg9JQj8ZpSKbEMuGWd/cc
	XKeut8OlfblPmYJMUHFl5M2PL96R0f38IxRSQkBuL5jSYu7oN8l0xg619xWPUiA==
X-Gm-Gg: ASbGnct6zZm+r2+fVKFTustMUi95kY4O4pimaT9C51kJq5s1spBiU+I5Tvf0epDQ11M
	XCybXNxvHSlrRWpBFJ9dcMBgVvSfJcRo30ItKHl8wxPu0cdIbHQyTgludV995FyPn96zcgI8I4Q
	ymRJCWl3fAGlL9ctQGHrU+f5WwY+AlXHP6oTlLP5M8nZw4PEitUy6sMh4PETynTD4c3nQBxvid0
	EAn7zJYcEbEG+7MXJ4i+i80CQ8FDvXfOgsmxQii3x2uFoQ9xXQN6bURV9By3w2vP13PCiwqKc60
	ZM1Fw2pfmxEgSa1nanl+z/gA6M2v5ANDevZOFgC1eXCUpvDgpm+JXcd6ow9bwWEd2exJw7Jemga
	GXERDNqgO6wYgV2PLMFNR17ZHszdrQGPqo8IBoQF6
X-Received: by 2002:a05:6512:b08:b0:549:8924:2212 with SMTP id 2adb3069b0e04-54b10dc7dd2mr5324203e87.17.1743535991243;
        Tue, 01 Apr 2025 12:33:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU6efTkTe6f5Vzm320mPjR9afsIU4zYlpAkYKjtRV4gM3/RDxKFBOX4ESFkge8XB9qKECJlg==
X-Received: by 2002:a05:6512:b08:b0:549:8924:2212 with SMTP id 2adb3069b0e04-54b10dc7dd2mr5324191e87.17.1743535990764;
        Tue, 01 Apr 2025 12:33:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bafd6sm1446554e87.6.2025.04.01.12.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 12:33:09 -0700 (PDT)
Message-ID: <ff024919-a58e-419c-a03d-73da6505caf8@redhat.com>
Date: Tue, 1 Apr 2025 21:33:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1742478846.git.lorenzo.stoakes@oracle.com>
 <d10037699391c42a4943f578c2a0bca890640f30.1742478846.git.lorenzo.stoakes@oracle.com>
 <CAG48ez3CiRTUv4Qwy_UQzQuEDtUoPVVXnuPyiWoAhWVqkF3VTA@mail.gmail.com>
 <182bf1ce-1b67-4243-854b-4d0c26aae563@redhat.com>
 <2bdf7ac4-b359-420f-94fe-466ae98c4a49@lucifer.local>
 <335b3432-af06-420f-b575-7a1d92148f6b@redhat.com>
 <f718ccd0-7b67-4c82-87e7-720d905c3595@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f718ccd0-7b67-4c82-87e7-720d905c3595@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.03.25 16:50, Lorenzo Stoakes wrote:
> On Sun, Mar 23, 2025 at 01:49:07PM +0100, David Hildenbrand wrote:
>>>>
>>>> c)  In -next, there is now be the option to use folio lock +
>>>> folio_maybe_mapped_shared() == false. But it doesn't tell you into how many
>>>> VMAs a large folio is mapped into.
>>>>
>>>> In the following case:
>>>>
>>>> [       folio     ]
>>>> [ VMA#1 ] [ VMA#2 ]
>>>>
>>>> c) would not tell you if you are fine modifying the folio when moving VMA#2.
>>>
>>> Right, I feel like prior checks made should assert this is not the case,
>>> however?  But mapcount check should be a last ditch assurance?
>>
>> Something nice might be hiding in c) that might be able to handle a single
>> folio being covered by multiple vmas.
>>
>> I was thinking about the following:
>>
>> [       folio0     ]
>> [       VMA#0      ]
>>
>> Then we do a partial (old-school) mremap()
>>
>> [ folio0 ]               [ folio0 ]
>> [ VMA#1  ]               [ VMA#2  ]
>>
>> To then extend VMA#1 and fault in pages
>>
>> [ folio0 ][ folio1 ]         [ folio0 ]
>> [      VMA#1       ]         [ VMA#2  ]
>>
>> If that is possible (did not try!, maybe something prevents us from
>> extending VMA#1) mremap(MREMAP_RELOCATE_ANON) of VMA#1  / VMA#2 cannot work.
>>
>> We'd have to detect that scenario (partial mremap). You might be doing that
>> with the anon-vma magic, something different might be: Assume we flag large
>> folios if they were partially mremapped in any process.
> 
> Do we have spare folio flags? :)) I always lose track of the situation with this
> and Matthew's levels of tolerance for it :P

For large folios yes (currently stored in page[1].flags)!

> 
>>
>> Then (with folio lock only)
>>
>> 1) folio_maybe_mapped_shared() == false: mapped into single process
>> 2) folio_maybe_partially_mremaped() == false: not scattered in virtual
>>     address space
>>
>> It would be sufficient to check if the folio fully falls into the memap()
>> range to decide if we can adjust the folio index etc.
>>
>> We *might* be able to use that in the COW-reuse path for large folios to
>> perform a folio_move_anon_rmap(), which we currently only perform for small
>> folios / PMD-mapped folios (single mapping). Not sure yet if actually
>> multiple VMAs are involved.
> 
> Interesting... this is the wp_can_reuse_anon_folio() stuff? I'll have a look
> into that!

Yes. For small folios / PMD-mapped THPs it's easy. I readded it in

Author: David Hildenbrand <david@redhat.com>
Date:   Mon May 9 18:20:43 2022 -0700

     mm/rmap: use page_move_anon_rmap() when reusing a mapped PageAnon() page exclusively
     

We'd need something along the for PTE-mapped large folios like (todo):

diff --git a/mm/memory.c b/mm/memory.c
index a838c8c44bfdc..df18fcfe29aab 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3793,6 +3793,15 @@ static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
         exclusive = true;
  unlock:
         folio_unlock_large_mapcount(folio);
+
+       if (exclusive && (folio->mapping == vma->anon_vma | PAGE_MAPPING_ANON) &&
+           todo_check_folio_in_vma(folio, vma) &&
+           folio_trylock(folio)) {
+               folio_move_anon_rmap(folio, vma);
+               folio_unlock(folio);
+       }
+out:
         return exclusive;
  }

Whereby a "partially mremapped" indication could come in handy.

Note that I never learned how important that optimization actually is in practice, so
I didn't care too much for now for PTE-mapped large folios.

> 
> I'm concerned about partial cases moreso though, e.g.:
> 
>       mremap this
>      <----------->
> [       folio0     ]
> [       VMA#0      ]

Right, there is no easy way to not split I think. We should just try to split and if it fails, too bad.

> 
> I mean, I'm leaning more towards just breaking up the folio, especialy if we
> consider a case like a biiig range:
> 
>                         mremap this
>      <--------------------------------------------------->
> [ folio0 ][ folio1 ][ folio2 ][ folio3 ][ folio4 ][ folio5 ] (say order-9 each)
> [                           VMA#0                          ]
> 
> Then at this point, refusing to do the whole thing seems maybe a bad idea, at
> which point splitting the folios for folio0, 5 might be sensible.
> 
> I guess a user is saying 'please, I really care about merging' so might well be
> willing to tolerate losing some of the huge page benefits, at least at the edges
> here.

Yes. In uffdio_move we simply split all PTE-mapped large folios, because this way the
folio_move_anon_rmap() is way easier to handle (and we could always try optimizing it later
if really required). Once we have khugeapged with mthp support in place, it might just fix
it up for us later.

-- 
Cheers,

David / dhildenb

