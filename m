Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1B11B4248
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853354; cv=none; b=hrV0DF63XVS2vPCMeQPhSvSjGJGfpNhyuZVi65ORU9n2GvTRxVOYfVi0aqQJ2NlbdC59BE1pOZrSrpqYgd3dwleJNPIquVzfXpKONIHAW526/YFkHHj3ky21vEbHbhjGg7unVmvfAZGH5mer3YNcahjAawnMo/5OqHoi6pOMeZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853354; c=relaxed/simple;
	bh=nUwiQG+N6KT17n0amkcjD+CGUUJalvVpiZv42pwB1mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jo0R2dFSNe9RF/9AhBmv+1gxoqELCWyMUOYDjWLGNEmR0JiPYJqveah9T61u3ZfZyVTOTvCrqxu4kYvbpk6e6JR8suBjRgZcQQLOwoLe1GHh5Yh6+mWOZs4D65zWXWuU4PmAPuGrj0KWEQ6hbAima6J0Yqvfc2OrqVt+B6C3XoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a78IoAxD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a78IoAxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750853351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hXz4L9AjmUQwaNKAx39lxTXVJAFR2RsUPQZWFFE3k78=;
	b=a78IoAxDmWirQ1y8IhrSyGyJYtwwrcAtK4qBNbMAg6+QS8FCGxMpkjFhjDe4UkVyntL+qR
	Tl0N+cdzdBArI1xC8pglFFuait3QQQUmtoIUYLOPVmQyZ79wV1Y2nTyGRiEnXSub3Iub6E
	YcWysfYrByKA8LCSaVQ6VxstIXegdCk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-yWs0nsqwPvyysDIJpcuEqA-1; Wed, 25 Jun 2025 08:09:10 -0400
X-MC-Unique: yWs0nsqwPvyysDIJpcuEqA-1
X-Mimecast-MFC-AGG-ID: yWs0nsqwPvyysDIJpcuEqA_1750853349
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6da94a532so2482696f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750853349; x=1751458149;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hXz4L9AjmUQwaNKAx39lxTXVJAFR2RsUPQZWFFE3k78=;
        b=gVfwmIf1NbuxKH161rmNOQmCX/L+Euok30+PdptpYMmlAT5Kf3qBq/5qPI+SSMJoB4
         FI0YEBFXZ2awI4Ab+Rh+KDVTcMrKtVNzp+vEcSEmng5zgKdMfpVBxYcaPLM+fXAoSSH3
         Bu+ZAxOFLt1pjCGLo4/AHYSYKZa+8CY/X3J5uq8e794mjIc6DEGdzhn4Z88oyfe4uce0
         Hm4/8xSnTXOZeFfHCVVIA+jIxf67O7p9Z7ClpAL8Y95VL4vG4A/U+XZyWAMw6Ow/6nHO
         Mz5cvxesNHkAhZup1SqaECUV/TPDcPjZAiZUNpSCKP2DjoE1MspXi32Hy5JbAF0k1su+
         ZUfw==
X-Forwarded-Encrypted: i=1; AJvYcCX4ZZvFn+ZHlZsl4rcLc1VTJf7B87M3xNgeLE1eL3LkSj3ZmBG0zeicOXbNQB3KXZ8fPTq4HAau8qu8xn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmzHjtHkiJtQvlqZjWrt4Fl5q6Nhp7a9ly+4KNxLjOARTbjk7
	EDcdwAUIaN8ITGaTMXf7neA6mZg7FXjICPsQ6BLmpNfeVjZNdqWOVNX2D8iIkrm32emz8z6xZPS
	GSHLpbeBxiwWBIip0maezkwPnKE96dIzwx+RHS/9yKeKg++G+mOXl7zyQ8636VtE+yg==
X-Gm-Gg: ASbGncvT4cXuhF9ANoJn3Ou9DiBWv5pVyKwiomrMs9MWt8d9c2/4bPHdCfIGRYB3it8
	yGqxhKd94KmqpmNjhpjx7bSeIitW40NJ18lUg0BSt8Tvx3+/1vMbP/h3iyNtOKr8Nzzbky3pEw7
	2W9hhfkFmwY6Qpqg75cb4awfUWh1Cck5OohT9a9I7VnF1o7lTNryBqGdj383FHTXnKH4phWHMQp
	Hfw27nIlFod8b3Rz1c+moer3w6opGABcXhOpDurdtoUfQtrUzAGZkQayj5Bl4Gg6je9VL4zeLVs
	U6osxpcsqemr8oy+KDiSnjFvO16lnisGBtugb+UxGJKfhvw2jBXRU1UKkNaLAAM9q+qaZEaVji/
	6dt3AZtT36EshvIgcL/dKHzf2/Xq/Z9g8waSK3Q3Gkz2g
X-Received: by 2002:a05:6000:4815:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a6ed64e5ddmr2082403f8f.49.1750853348875;
        Wed, 25 Jun 2025 05:09:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Lr46v9Q28gB+WmOXi6ZuJCE56NnF+cZrNGYOXSV4lsNJpeXOrIPDeZxjqvKUmorwq1CGfA==
X-Received: by 2002:a05:6000:4815:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a6ed64e5ddmr2082376f8f.49.1750853348346;
        Wed, 25 Jun 2025 05:09:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm18992765e9.40.2025.06.25.05.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:09:06 -0700 (PDT)
Message-ID: <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
Date: Wed, 25 Jun 2025 14:09:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
 <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
 <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.06.25 13:42, Barry Song wrote:
> On Wed, Jun 25, 2025 at 11:27 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 25.06.25 13:15, Barry Song wrote:
>>> On Wed, Jun 25, 2025 at 11:01 PM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 25.06.25 12:57, Barry Song wrote:
>>>>>>>
>>>>>>> Note that I don't quite understand why we have to batch the whole thing
>>>>>>> or fallback to
>>>>>>> individual pages. Why can't we perform other batches that span only some
>>>>>>> PTEs? What's special
>>>>>>> about 1 PTE vs. 2 PTEs vs. all PTEs?
>>>>>>
>>>>>> That's a good point about the "all-or-nothing" batching logic ;)
>>>>>>
>>>>>> It seems the "all-or-nothing" approach is specific to the lazyfree use
>>>>>> case, which needs to unmap the entire folio for reclamation. If that's
>>>>>> not possible, it falls back to the single-page slow path.
>>>>>
>>>>> Other cases advance the PTE themselves, while try_to_unmap_one() relies
>>>>> on page_vma_mapped_walk() to advance the PTE. Unless we want to manually
>>>>> modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), which
>>>>> to me seems like a violation of layers. :-)
>>>>
>>>> Please explain to me why the following is not clearer and better:
>>>
>>> This part is much clearer, but that doesn’t necessarily improve the overall
>>> picture. The main challenge is how to exit the iteration of
>>> while (page_vma_mapped_walk(&pvmw)).
>>
>> Okay, I get what you mean now.
>>
>>>
>>> Right now, we have it laid out quite straightforwardly:
>>>                   /* We have already batched the entire folio */
>>>                   if (nr_pages > 1)
>>>                           goto walk_done;
>>
>>
>> Given that the comment is completely confusing whens seeing the check ... :)
>>
>> /*
>>    * If we are sure that we batched the entire folio and cleared all PTEs,
>>    * we can just optimize and stop right here.
>>    */
>> if (nr_pages == folio_nr_pages(folio))
>>          goto walk_done;
>>
>> would make the comment match.
> 
> Yes, that clarifies it.
> 
>>
>>>
>>> with any nr between 1 and folio_nr_pages(), we have to consider two issues:
>>> 1. How to skip PTE checks inside page_vma_mapped_walk for entries that
>>> were already handled in the previous batch;
>>
>> They are cleared if we reach that point. So the pte_none() checks will
>> simply skip them?
>>
>>> 2. How to break the iteration when this batch has arrived at the end.
>>
>> page_vma_mapped_walk() should be doing that?
> 
> It seems you might have missed the part in my reply that says:
> "Of course, we could avoid both, but that would mean performing unnecessary
> checks inside page_vma_mapped_walk()."
 > > That’s true for both. But I’m wondering why we’re still doing the 
check,
> even when we’re fairly sure they’ve already been cleared or we’ve reached
> the end :-)

:)

> 
> Somehow, I feel we could combine your cleanup code—which handles a batch
> size of "nr" between 1 and nr_pages—with the
> "if (nr_pages == folio_nr_pages(folio)) goto walk_done" check.

Yeah, that's what I was suggesting. It would have to be part of the 
cleanup I think.

I'm still wondering if there is a case where

if (nr_pages == folio_nr_pages(folio))
	goto walk_done;

would be wrong when dealing with small folios.

> In practice, this would let us skip almost all unnecessary checks,
> except for a few rare corner cases.
> 
> For those corner cases where "nr" truly falls between 1 and nr_pages,
> we can just leave them as-is—performing the redundant check inside
> page_vma_mapped_walk().

I mean, batching mapcount+refcount updates etc. is always a win. If we 
end up doing some unnecessary pte_none() checks, that might be 
suboptimal but mostly noise in contrast to the other stuff we will 
optimize out :)

Agreed that if we can easily avoid these pte_none() checks, we should do 
that. Optimizing that for "nr_pages == folio_nr_pages(folio)" makes sense.

-- 
Cheers,

David / dhildenb

