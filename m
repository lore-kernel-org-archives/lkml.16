Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A841D86F7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360937; cv=none; b=mMYU1MgNu3LPueasTgxGhpKZSjhD/O/ql3xjaah58vMPffjwYE9/1fOdpxZ72WVnx3UwprGQSH1PN+DFUQpT++U+t5wm2eFvRnd6Qor5OSmErwtnDwB6Sj6Gj89U+Fraoxv1or3GMo6VA88Ck6SvDImbF+gnZglSu3oqIE9gv80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360937; c=relaxed/simple;
	bh=hsjw8CvosU39kPfptjifWmjokxdWEsxJk9thclC48Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4xORsLmKzklnk7/V0c8LYKOy/0oXqoTt2IP1Cuv4zZVt49s/VdueH0rkdh7yNTagyASEkdnt1olRjGEXCYOrEHPuzP+Kx06i8zoY9Au6VvyD1btjbC6DOe1V5NbwkGMTqhNTBrvqyE3989ZPOhrwRWkTb9R+/GShoq2niNSzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MQUJoczC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MQUJoczC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744360933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nsd/GI7qGHKDw38J6JY/Ya1k4eY2FJvQWpXeWn6YnI4=;
	b=MQUJoczCFNdWDO3+wjcz5NVCh+E5EahwYruY8gRu1mSKNSorGvwMdrcxEGewiI86X0oMdM
	Oqsb6p7vXi1GP7ZlOLAazGaw10LPe7+8DdFqSFsKxcfZeRwMGucxO/YbkMgkVJUvgpbegg
	HnhqYwc/Re/pZgagqVbQedBJ48+BL4g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-p5k4OR_8MeO5brCb8I-SxA-1; Fri, 11 Apr 2025 04:42:12 -0400
X-MC-Unique: p5k4OR_8MeO5brCb8I-SxA-1
X-Mimecast-MFC-AGG-ID: p5k4OR_8MeO5brCb8I-SxA_1744360931
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39141ffa913so980331f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360931; x=1744965731;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nsd/GI7qGHKDw38J6JY/Ya1k4eY2FJvQWpXeWn6YnI4=;
        b=sYabDg9cYqwkhRRB4vojpdiLySO33oEgx0mgqN/IGddzIEnKlRxPNn8TEvsRaSz1oX
         mT8mHF7dPfCO5TUBLY0HnTX2TauLG6HD8yxWZC3FUOYwO14aO03MpTrz4QQmJXP0IIvs
         yWGzUYq1NROqwuhKQY+09VeK3Spq6TPIRyzgMS33wARIZP4NuabT7ZNA5fZXZAIpZsiI
         Kym4Wb41q6kmKN+FwdM3kzmbwGnvp7VM8GPU1a0QCUBHoPjIXCHrNScnF9E9iFo4kiCy
         9qoJn77ss19Lt3ukbHqUy69uLkMLDPp/SQMTDWgnHKJw8RUwOa+7liSEM5ahYmkSTQJb
         RmMg==
X-Forwarded-Encrypted: i=1; AJvYcCXFlovo9Dx1tEpUgsoQZ1cQoLKWIcUpKFo4pxSTk4p93mW8N++o3LSCMjNRVDF1s9k5nmKTkcBb55XftJs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8v1LbJwgsac1EqOXffPPg2svEyKEw2eR6cvRlbFKu7ffqZ6EN
	2mVxKfB6UA8Bn9y8K0w82eh85L1ZrkEwMP3gPiiM0uSz+9BjaV8ksO5dhwmn6lIe/SH4JmR3vb8
	LN487W6w/tsU7jqtaS9PafbkIXch7Bv0Iq+VQlG/M72iMun/J/IUda3hcNySUrDtIW197AbzH
X-Gm-Gg: ASbGncsU8P1OG2+xgoHqwL7PCu8g33ETXKQr2lCAKMIMvmAmNkNP35xvaWOvfD566MD
	jCenWQj9wYJodU8Q2vk9uU/w095WuQsJWIPDM1aULwPhBFqjE5BSXuDom29UEgOcRxpj+UjdufC
	9nV8Nvn4PLvY6aY0aVS784blv88uEcbqpoMOhqTrYbXu/OkEPhMZcpecLMyL5Q+yEDtIUfhL9VQ
	egeuhONzqs9QWuC3BRAL6v1RkdH3bZVO+m4Dc2+/OSaxjNhB8+MsvdQZzoR1BpJMJMxx65IE1gH
	g3H+hvsGQAX3tw4N7n9OdpbOta4J8Px1mp8lZYYsnnkBcVcH6UtwzB6NY0CASLK2uQM2X0Ey85c
	HDcfP369RBHeAN5POyBAXwJyKQpYHY2BfOj3d
X-Received: by 2002:a05:6000:1882:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-39eaaed222emr1356010f8f.42.1744360930924;
        Fri, 11 Apr 2025 01:42:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzBVLgDZ9U6f4Xo/beU79Ga2MmZf+NddpuhiXZ1N+UpgsZYVm/TlqWFRUbH9GWiiLHu0eItQ==
X-Received: by 2002:a05:6000:1882:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-39eaaed222emr1355978f8f.42.1744360930491;
        Fri, 11 Apr 2025 01:42:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c726:6800:7ddf:5fc:2ee5:f08a? (p200300cbc72668007ddf05fc2ee5f08a.dip0.t-ipconnect.de. [2003:cb:c726:6800:7ddf:5fc:2ee5:f08a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979663sm1359590f8f.51.2025.04.11.01.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:42:10 -0700 (PDT)
Message-ID: <6b532646-041f-4077-b09f-ff6d43aa4a81@redhat.com>
Date: Fri, 11 Apr 2025 10:42:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <21cnbao@gmail.com>, Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com>
 <5c52b67a-8e7e-4dd7-9127-96944715d883@linux.alibaba.com>
 <CAGsJ_4yPxoF5P87WdXbXVb8BqovVvxhKg40YVddkEQmFjFsRYw@mail.gmail.com>
 <1E123113-7A0B-4D3A-AC7A-01767D7BF2D8@nvidia.com>
 <CAGsJ_4zMthcj0dtCX1OKQ1_A01OdF=P1n9FGLpGsbkTRwWoqVA@mail.gmail.com>
 <247fca57-8280-41a6-85b0-03a32ea08210@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <247fca57-8280-41a6-85b0-03a32ea08210@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.04.25 03:20, Baolin Wang wrote:
> 
> 
> On 2025/4/11 05:56, Barry Song wrote:
>> On Fri, Apr 11, 2025 at 3:13 AM Zi Yan <ziy@nvidia.com> wrote:
>>>
>>> On 10 Apr 2025, at 6:29, Barry Song wrote:
>>>
>>>> On Thu, Apr 10, 2025 at 9:05 PM Baolin Wang
>>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 2025/4/10 16:14, Barry Song wrote:
>>>>>> On Wed, Apr 9, 2025 at 1:16 AM Baolin Wang
>>>>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>>>>
>>>>>>> When investigating performance issues during file folio unmap, I noticed some
>>>>>>> behavioral differences in handling non-PMD-sized folios and PMD-sized folios.
>>>>>>> For non-PMD-sized file folios, it will call folio_mark_accessed() to mark the
>>>>>>> folio as having seen activity, but this is not done for PMD-sized folios.
>>>>>>>
>>>>>>> This might not cause obvious issues, but a potential problem could be that,
>>>>>>> it might lead to more frequent refaults of PMD-sized file folios under memory
>>>>>>> pressure. Therefore, I am unsure whether the folio_mark_accessed() should be
>>>>>>> added for PMD-sized file folios?
>>>>>>>
>>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>>> ---
>>>>>>>     mm/huge_memory.c | 4 ++++
>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>
>>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
>>>>>>> --- a/mm/huge_memory.c
>>>>>>> +++ b/mm/huge_memory.c
>>>>>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>>>>>>                                    zap_deposited_table(tlb->mm, pmd);
>>>>>>>                            add_mm_counter(tlb->mm, mm_counter_file(folio),
>>>>>>>                                           -HPAGE_PMD_NR);
>>>>>>> +
>>>>>>> +                       if (flush_needed && pmd_young(orig_pmd) &&
>>>>>>> +                           likely(vma_has_recency(vma)))
>>>>>>> +                               folio_mark_accessed(folio);
>>>>>>
>>>>>> Acked-by: Barry Song <baohua@kernel.org>
>>>>>
>>>>> Thanks.
>>>>>
>>>>>> I also came across an interesting observation: on a memory-limited system,
>>>>>> demoting unmapped file folios in the LRU—specifically when their mapcount
>>>>>> drops from 1 to 0—can actually improve performance.
>>>>>
>>>>> These file folios are used only once? Can folio_set_dropbehind() be used
>>>>> to optimize it, which can avoid the LRU activity movement in
>>>>> folio_mark_accessed()?
>>>>
>>>> For instance, when a process, such as a game, just exits, it can be expected
>>>> that it won't be used again in the near future. As a result, demoting
>>>> its previously
>>>> unmapped file pages can improve performance.
>>>
>>> Is it possible to mark the dying VMAs either VM_SEQ_READ or VM_RAND_READ
>>> so that folio_mark_accessed() will be skipped? Or a new vm_flag?
>>> Will it work?
>>
>> Actually took a more aggressive approach and observed good performance
>> improvements on phones. After zap_pte_range() called remove_rmap(),
>> the following logic was added:
>>
>> if (file_folio && !folio_mapped())
>>       deactivate_file_folio();
>>
>> This helps file folios from exiting processes get reclaimed more quickly
>> during the MGLRU's min generation scan while the folios are probably
>> in max gen.
>>
>> I'm not entirely sure if this is universally applicable or worth submitting as
>> a patch.
> 
> IMHO, I'm afraid this is not universally applicable. Although these file
> folios have been unmapped, it's not certain that they won't be accessed
> again. These file folios might be remapped and accessed again soon, or
> accessed through read()/write() operations using a file descriptor.
> 
> I agree with Zi's suggestion. Using some kind of madvise() hint to mark
> these file folios as those that won't be accessed after being unmapped,
> seems can work?

Is that similar to MADV_COLD before unmap?

-- 
Cheers,

David / dhildenb

