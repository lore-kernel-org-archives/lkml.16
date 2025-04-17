Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E42F21C193
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880696; cv=none; b=nDwqoff6quQyZLBvPaVoyRhnFSJ65RP1HmKpa3p2BorEXIyh11XZ3d9cEfhnRD0hhyyfW9bQbgYLoZxI+X0BFsX/eI/rRMeggcDLbwuAgiPMfZ2hvTQy1QRnez3umZwn+pdl2t9U2El0ZeA1beqFXKF/FgwzWDYllDnLsNYMiUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880696; c=relaxed/simple;
	bh=hPjmWijAg+ZdHxltkxWKtXm6Z4/0w2N9/cTY2VwOIUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u18X63faABz3Qv65p5YMaCtsOzJ/jhw28+E2JHUXzeULG0xy3nWI3kzzfxkS4mBx1svPHjE3L7kC49MaLjf7SXdze0xVW00QkTP/cjXoXT9p7BOTW2FPnpb218WuSario6LYE5yjIPAqHtCdzrs2chlyN/FysHwMI1+ggMPRgVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XE6iSFEv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XE6iSFEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744880692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5gPAqCNXou+TLtqvw0JAgVw2yADByQdo/aIu3/nMiN8=;
	b=XE6iSFEvSyJli0xpUqWDVbltDQm28fNu6Wjuc4HSEJn9eiZL8BvPe++ZWGHFPxWGoyZ9dc
	Jatc1uTdxGLgiiYImJyX5ypaN77DmAeRaKeqoTb0MENLxPHxRZyK6x0APIZ5lK5+CCxsuU
	2jXtPNZA72cJEwhGvoJyTuxMQILCW+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-QA2A2CrPNOuMm3XXVGUTpQ-1; Thu, 17 Apr 2025 05:04:51 -0400
X-MC-Unique: QA2A2CrPNOuMm3XXVGUTpQ-1
X-Mimecast-MFC-AGG-ID: QA2A2CrPNOuMm3XXVGUTpQ_1744880690
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d22c304adso6425015e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880690; x=1745485490;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5gPAqCNXou+TLtqvw0JAgVw2yADByQdo/aIu3/nMiN8=;
        b=TM35vE1zgcS8HIZs0cEc35OpJBwAgbzmZrtMOw9RHUfoYepEaGgBW3AKTIPKy9MQv8
         tJ3c4krD95SFb2+s5zQ5MzdbPx/2882ox+fbqZuaoisdFI9evLVOW5xidnc//kMMuT0p
         E5MBlWIqQqFeoCnVkT2lkw0pfETAMEsLFOG4KP0UlHKqjtyiOmwNHllvNz1iGUSg0dJG
         /w4GJ5vl+Z5m1NiFvH6+3uCEFSPrgtKQmElKsQ2VLIRSMHLRP5WvhfswUijvK6nGSzFL
         BXr/APgImny6vedqRvixIastzjfLLgyfjSDebAJ/fvI9PpA+p3IRVitKtqTeYoQXzojg
         ti5A==
X-Forwarded-Encrypted: i=1; AJvYcCVeAhVbdr/pJ+KiLeKtACbFI/krCKGu1Xcd788HT6u+Z96ewoDaJUy6qseR0p7/O9T8HxNL+2yRN9Sn+pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGCqz62pyJgv2C6wf2KrXKjYSfS+KfachbyUhzjcT6A4wK6sxi
	zWIx9qK3DTDP8FCPB8yPWLaKzOmILBxG9HfAW5ZK/DSKxGOUGGo2GiVnzneUJRTynPnkguBgnLg
	x8EWyPCoFDc13LtJTxy96EtHHPhf/NkTzYMoQxibtz6lV97ptk4IXilgb7vR70A==
X-Gm-Gg: ASbGncvpxD+2gteYd1qOLIuMATD4P+9UN+WbjEMDVf32m/civ3PGum4S26Ag23S3QWC
	NPHzwRUmr52y95onq5RdNUQ8jS8OQoq0xqRy5aY8DG0F6n/vvu760CFYJgDJyVSNpckYMiBbZ4B
	8HRiej1IB2hSfjSwoRuFl2YkfVLPerJKnTvrKvPaGcHfdJrQU63CbvZagrXfaR0iyzltpKsiIGe
	bzNeXfjYakLtct7cqwN/jqwXkNxQdNiiwRo6GBLYNOp2panIvhI23MMzjETr+OemsVtWBbCqtYc
	+WEIQEHamR2PH/RbSBc0jVIdqmvU4hu8Ty6ymifk/pzAMo9j0Em2NGc2ESBd3XuQDYI3hINP5aL
	MYRohhy6RapAWU1PJIuYCLkD7QxM/zKc1jr6W9xI=
X-Received: by 2002:a5d:64ad:0:b0:390:f0ff:2c10 with SMTP id ffacd0b85a97d-39eea303ed9mr1651914f8f.19.1744880689790;
        Thu, 17 Apr 2025 02:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWPiEInfv5kSKvYgd4hoQQaYhKow9Gb2/Ut+h1uxRoG1S2ovHYT9qz/dZhPBpeN6N/CHBXxg==
X-Received: by 2002:a5d:64ad:0:b0:390:f0ff:2c10 with SMTP id ffacd0b85a97d-39eea303ed9mr1651886f8f.19.1744880689362;
        Thu, 17 Apr 2025 02:04:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440609c94fesm28491535e9.40.2025.04.17.02.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:04:48 -0700 (PDT)
Message-ID: <05a7d51e-f065-445a-af0e-481f3461a76e@redhat.com>
Date: Thu, 17 Apr 2025 11:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
To: Hugh Dickins <hughd@google.com>
Cc: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, willy@infradead.org, ziy@nvidia.com,
 linmiaohe@huawei.com, revest@google.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250414072737.1698513-1-gavinguo@igalia.com>
 <27d13454-280f-4966-b694-d7e58d991547@redhat.com>
 <6787d0ea-a1b9-08cf-1f48-e361058eec20@google.com>
 <83f17b85-c9fa-43a0-bec1-22c8565b67ad@redhat.com>
 <98d1d195-7821-4627-b518-83103ade56c0@redhat.com>
 <7d0ef7b5-043b-beca-72a9-6ae98b0d55fb@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7d0ef7b5-043b-beca-72a9-6ae98b0d55fb@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.04.25 10:55, Hugh Dickins wrote:
> On Thu, 17 Apr 2025, David Hildenbrand wrote:
>> On 17.04.25 09:18, David Hildenbrand wrote:
>>> On 17.04.25 07:36, Hugh Dickins wrote:
>>>> On Wed, 16 Apr 2025, David Hildenbrand wrote:
>>>>>
>>>>> Why not something like
>>>>>
>>>>> struct folio *entry_folio;
>>>>>
>>>>> if (folio) {	
>>>>>   if (is_pmd_migration_entry(*pmd))
>>>>>   	entry_folio = pfn_swap_entry_folio(pmd_to_swp_entry(*pmd)));
>>>>>   else
>>>>>    entry_folio = pmd_folio(*pmd));
>>>>>
>>>>>   if (folio != entry_folio)
>>>>> 		return;
>>>>> }
>>>>
>>>> My own preference is to not add unnecessary code:
>>>> if folio and pmd_migration entry, we're not interested in entry_folio.
>>>> But yes it could be written in lots of other ways.
>>>
>>> While I don't disagree about "not adding unnecessary code" in general,
>>> in this particular case just looking the folio up properly might be the
>>> better alternative to reasoning about locking rules with conditional
>>> input parameters :)
>>>
>>
>> FWIW, I was wondering if we can rework that code, letting the caller to the
>> checking and getting rid of the folio parameter. Something like this
>> (incomplete, just to
>> discuss if we could move the TTU_SPLIT_HUGE_PMD handling).
> 
> Yes, I too dislike the folio parameter used for a single case, and agree
> it's better for the caller who chose pmd to check that *pmd fits the folio.
> 
> I haven't checked your code below, but it looks like a much better way
> to proceed, using the page_vma_mapped_walk() to get pmd lock and check;
> and cutting out two or more layers of split_huge_pmd obscurity.
> 
> Way to go.  However... what we want right now is a fix that can easily
> go to stable: the rearrangements here in 6.15-rc mean, I think, that
> whatever goes into the current tree will have to be placed differently
> for stable, no seamless backports; but Gavin's patch (reworked if you
> insist) can be adapted to stable (differently for different releases)
> more more easily than the future direction you're proposing here.

I'm fine with going with the current patch and looking into cleaning it 
up properly (if possible).

So for this patch

Acked-by: David Hildenbrand <david@redhat.com>

@Gavin, can you look into cleaning that up?

> 
> (Hmm, that may be another reason for preferring the reasoning by
> folio lock: forgive me if I'm misremembering, but didn't those
> page migration swapops get renamed, some time around 5.11?)

I remember that we did something to PTE handling stuff in the context of 
PTE markers. But things keep changing all of the time .. :)

-- 
Cheers,

David / dhildenb

