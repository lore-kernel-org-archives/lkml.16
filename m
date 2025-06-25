Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61A4175A5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856542; cv=none; b=mxG0my5+w0x92ItQNvMswNsJks8en0IAZSUJNDdlz+zzC8QvHhuQmvZctmGRNHw72TaM/5hNxyeP+VwNt9y5oFEYBgbS+RUC7AmnQpFIabfjvGZZOhQqzb2zeltiuMSi2JL0akdKf2YUQxgpiv+9fKXPa7Clqoo8RfPQ4M4qY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856542; c=relaxed/simple;
	bh=IHOuR1bJkKduNBpEzttsUZf5IQwjfpEkNWMymlMTXxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZvufojlOEUDxQkXJI9I6FEwN/ySHkxQE/hoWsAj4YupGst0KZctEaZCWrDOt0oMzk2sYN30Hsvujm0WGKJJS0Rjy3AHgr8puAplBFAQDbrp9OUtSl3k2yhhiXlcuCWAO5YxxpO56XZfA9WlWA68ECEG4reEUVFB1rvUrQZhGzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QiXGDU51; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QiXGDU51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750856536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CWa9vLHjivGtX23R7pWprB8Tx5F1xP2O2QxWoGtKsMg=;
	b=QiXGDU51HZzEEj1KNTZTe82eyagXoARz6GHGCAdKnFwcgubpP2SSMhuMVuJGBgjKcQZCwB
	dEqVyAd2udhLoAs3zvjXYV2jr9631FE1zVnTWozTDegn0md7/OZ3ZMS4yaCvObgaHG2ovy
	KLTK1xcNi+7z3jquy9F5/rKs9nO1clw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-YHyJe2V7OAmMzcJyCNeqgQ-1; Wed, 25 Jun 2025 09:02:14 -0400
X-MC-Unique: YHyJe2V7OAmMzcJyCNeqgQ-1
X-Mimecast-MFC-AGG-ID: YHyJe2V7OAmMzcJyCNeqgQ_1750856530
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d5600a54so12254225e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856529; x=1751461329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CWa9vLHjivGtX23R7pWprB8Tx5F1xP2O2QxWoGtKsMg=;
        b=iVLY+yfs+w4vx8s1cD/DilPBGzU9bEQM7BK5SLbFv/SYwGpCWz6dF4fY66iqdYJLt9
         mEMSWvPkojnJj5AZsVOFb29Rf3+OdCE6cgpyyZU5300I+Om4A5voo0LrSNYHjQ2dVtHt
         beBHfQoW7ljm4FRhHvAL1rDNAD7V3tJARxJoUej0/8BxMboFz/8opV9ULs7Tlnur7y3A
         e6r7W9xw7f/4nd/velhhgHTxUGTS3cFnwGsRVsUcIMYl6h3E8P1Q8ezUqfh+3ZPsVRAz
         0IcSfx//LV0kSDbuzrOrB8xJDrSkQ0SyUuXKEjP2U+wRxZnNO+ETzhVH6AUz21g72x0e
         mP4A==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8e4I3YW7cdDimWoN3zcLgSYO7Do8Wm7RdD1kWNS9ycFYnw2XXf3FQ8oQQwEydYu7+L5UBwdvoPn0IO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9PcCNiIB3y2NbfIRDL+9tWgD1gwS6ZkU+ggsc5bCN21lY4UJz
	YjlctFRsGoCsrLop2bD48OV5oo7AP2h1Ov9+XX4fe6V5t74nIPNikWQE61JCwtQME58MvYBfzqM
	ds+FT5XJA+lGHlomPQzdmbX2XIjkdZ/GH1FNlSNnK0ZlkJEN+m7t3aF0bo7+wjYcQvQ==
X-Gm-Gg: ASbGncvL/CR6ljrYk58jsxQFgO6867ykdyfyHLT8Mg/TleJiHhZc2gbDwn1wWwnUBS8
	z9Fs4IzWsR8qfonGucWt5QgMFPj97XkctcqsQmHJTQxIRTI1SL91TOjMGv3xDYEmRPm+IZeDghh
	083xCVQ6kq0oUmtTA1g3HEOI0o79gfw6yWwO8tWhGMhptYa/xhDh92srjNLSng4DLquN9a79vTw
	2HVGsIpokCSwE+XOR/gX/AqSLfLUj/7/MunxV/LA1eFeR9f3pVPGV59x31yJBBrja3d8BP5TYco
	6POkx2gcb0myXYKSuJTkSr0ti+fHO0mbDzajCGYj8eh96I4YdyOMyqwclBf4nJplkcged74z18w
	qLTW11FK+0I8MwJoM9JjuDBErNDlvY6kDd0Ag1LeC0df7
X-Received: by 2002:a05:600c:c111:b0:453:d3d:d9fd with SMTP id 5b1f17b1804b1-45381af1eb9mr24755185e9.12.1750856528001;
        Wed, 25 Jun 2025 06:02:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKiZA5X744huDWj+mGMDZbU1CSFk/eikCS0GwKNdrXtigtMtmCMaoW8coZuQI5rH2zraR2qQ==
X-Received: by 2002:a05:600c:c111:b0:453:d3d:d9fd with SMTP id 5b1f17b1804b1-45381af1eb9mr24753265e9.12.1750856525887;
        Wed, 25 Jun 2025 06:02:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c3c7csm19445455e9.36.2025.06.25.06.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:02:04 -0700 (PDT)
Message-ID: <6a754628-d9d8-43e1-a6d9-fa45a5f23971@redhat.com>
Date: Wed, 25 Jun 2025 15:02:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
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
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
 <f1ee8679-88b4-4712-b2ed-c3eec179b430@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f1ee8679-88b4-4712-b2ed-c3eec179b430@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.06.25 14:58, Lance Yang wrote:
> 
> 
> On 2025/6/25 20:09, David Hildenbrand wrote:
>> On 25.06.25 13:42, Barry Song wrote:
>>> On Wed, Jun 25, 2025 at 11:27 PM David Hildenbrand <david@redhat.com>
>>> wrote:
>>>>
>>>> On 25.06.25 13:15, Barry Song wrote:
>>>>> On Wed, Jun 25, 2025 at 11:01 PM David Hildenbrand
>>>>> <david@redhat.com> wrote:
>>>>>>
>>>>>> On 25.06.25 12:57, Barry Song wrote:
>>>>>>>>>
>>>>>>>>> Note that I don't quite understand why we have to batch the
>>>>>>>>> whole thing
>>>>>>>>> or fallback to
>>>>>>>>> individual pages. Why can't we perform other batches that span
>>>>>>>>> only some
>>>>>>>>> PTEs? What's special
>>>>>>>>> about 1 PTE vs. 2 PTEs vs. all PTEs?
>>>>>>>>
>>>>>>>> That's a good point about the "all-or-nothing" batching logic ;)
>>>>>>>>
>>>>>>>> It seems the "all-or-nothing" approach is specific to the
>>>>>>>> lazyfree use
>>>>>>>> case, which needs to unmap the entire folio for reclamation. If
>>>>>>>> that's
>>>>>>>> not possible, it falls back to the single-page slow path.
>>>>>>>
>>>>>>> Other cases advance the PTE themselves, while try_to_unmap_one()
>>>>>>> relies
>>>>>>> on page_vma_mapped_walk() to advance the PTE. Unless we want to
>>>>>>> manually
>>>>>>> modify pvmw.pte and pvmw.address outside of
>>>>>>> page_vma_mapped_walk(), which
>>>>>>> to me seems like a violation of layers. :-)
>>>>>>
>>>>>> Please explain to me why the following is not clearer and better:
>>>>>
>>>>> This part is much clearer, but that doesn’t necessarily improve the
>>>>> overall
>>>>> picture. The main challenge is how to exit the iteration of
>>>>> while (page_vma_mapped_walk(&pvmw)).
>>>>
>>>> Okay, I get what you mean now.
>>>>
>>>>>
>>>>> Right now, we have it laid out quite straightforwardly:
>>>>>                    /* We have already batched the entire folio */
>>>>>                    if (nr_pages > 1)
>>>>>                            goto walk_done;
>>>>
>>>>
>>>> Given that the comment is completely confusing whens seeing the
>>>> check ... :)
>>>>
>>>> /*
>>>>     * If we are sure that we batched the entire folio and cleared all
>>>> PTEs,
>>>>     * we can just optimize and stop right here.
>>>>     */
>>>> if (nr_pages == folio_nr_pages(folio))
>>>>           goto walk_done;
>>>>
>>>> would make the comment match.
>>>
>>> Yes, that clarifies it.
>>>
>>>>
>>>>>
>>>>> with any nr between 1 and folio_nr_pages(), we have to consider two
>>>>> issues:
>>>>> 1. How to skip PTE checks inside page_vma_mapped_walk for entries that
>>>>> were already handled in the previous batch;
>>>>
>>>> They are cleared if we reach that point. So the pte_none() checks will
>>>> simply skip them?
>>>>
>>>>> 2. How to break the iteration when this batch has arrived at the end.
>>>>
>>>> page_vma_mapped_walk() should be doing that?
>>>
>>> It seems you might have missed the part in my reply that says:
>>> "Of course, we could avoid both, but that would mean performing
>>> unnecessary
>>> checks inside page_vma_mapped_walk()."
>>   > > That’s true for both. But I’m wondering why we’re still doing the
>> check,
>>> even when we’re fairly sure they’ve already been cleared or we’ve reached
>>> the end :-)
>>
>> :)
>>
>>>
>>> Somehow, I feel we could combine your cleanup code—which handles a batch
>>> size of "nr" between 1 and nr_pages—with the
>>> "if (nr_pages == folio_nr_pages(folio)) goto walk_done" check.
>>
>> Yeah, that's what I was suggesting. It would have to be part of the
>> cleanup I think.
>>
>> I'm still wondering if there is a case where
>>
>> if (nr_pages == folio_nr_pages(folio))
>>       goto walk_done;
>>
>> would be wrong when dealing with small folios.
> 
> We can make the check more explicit to avoid any future trouble ;)
> 
> if (nr_pages > 1 && nr_pages == folio_nr_pages(folio))
>       goto walk_done;
> 
> It should be safe for small folios.

I mean, we are walking a single VMA, and a small folio should never be 
mapped multiple times into the same VMA. (ignoring KSM, but KSM is 
handled differently either way)

So we should be good, just wanted to raise it.

-- 
Cheers,

David / dhildenb

