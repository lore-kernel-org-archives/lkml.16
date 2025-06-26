Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9953219A9E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925842; cv=none; b=X3YEHvWGLdP2+3OYJaICVXGt14U4pmM234pMEscdwG9XOiOX+Q7ugwJY1zX1G+NZfqCrNOqkHsxt8VGg7E8T0i5cS2psgH5/IiTR4oadW66Qb9w3C8tWwkC+UWLOVPJzohgvShFGRrrhylSiPYQQpzhk1He2EYoLuKSE8Fiq74I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925842; c=relaxed/simple;
	bh=Sb2ndTBSp5Tvs/0SuD3ITGu4yetsVEfMhT0gu3r1d48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYzbTAhM87I/wnIuKducBe2VcTxQ+rZTm/VxSNFGyGF2OANFtl0+ldExNnDajnIaAP5oGK4qTYS+Z8bKlwXV4yUMqli4+5E/sFOO3Q+0DdfvhLaNxXeTHIGd7zoS2gcB8c4lsjhudO9YH0aq0JjHe9c2VNZBpBKtREt9b2YQF2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CzeI+Ehf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CzeI+Ehf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750925839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=55+jYEaEhNtGFPfW/0vKnlZGNZZvZBUpEkOyrpcO9hQ=;
	b=CzeI+Ehfu2L0phIGakBMbV+qqwWxTlbzhA9FCKDYgDalc6WeglmJ9lSdO5PHqvZ1SFq1Nl
	CbcdA0yItrZT+R1ql0+fbo2xPzCCxF74C6HHbHvbu01OLoiDbzhWN8bHhcE7aPRKBTFSp+
	6WCFy2ohtIhpdUko/ozr2RegnNsfvfU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-qq-dNclFPZa20koJOKw2-g-1; Thu, 26 Jun 2025 04:17:16 -0400
X-MC-Unique: qq-dNclFPZa20koJOKw2-g-1
X-Mimecast-MFC-AGG-ID: qq-dNclFPZa20koJOKw2-g_1750925836
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so267707f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925836; x=1751530636;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=55+jYEaEhNtGFPfW/0vKnlZGNZZvZBUpEkOyrpcO9hQ=;
        b=BdxcWQwddDpcZpj30b6FWr8DE7rL9CqxUd8OefTPd7ePkEP4kJX+1SqHmyARAn34Wy
         AxIVa0YsNqXF/Kw+pF/uxUweDnzVi48303zoxJdR3vJ8rA96PFWxuXJujKYHxdqtRhZN
         tnvmkZ/9lVlUXX1ErhwNsZFwhWTuD4KLqjvHOjUwdMI8IKWQyo2TFwHACtZR3LpSAu2j
         OKhacRxeS4IHlPinmPFXp6lw/lpGihYvgNBqkfil3gs17an6guV5ft9z0Y455osIn+1K
         AY0fRHIGPRAquEiC3YcOZ3bw2LYlU0yOKD631Of7ig8Ihoh+7jZWV2NganogJOcOXWCZ
         JMKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMOO7PFKa/wVh8QReWvYDxKs3B/j8gstTwA9bdxfK8PTPN+mXXLFPfHmU6BibCBDt8NKEah9ZKIafQ0Ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwMJ0XoT21hUbkg+VNJdl8HREmwPfjtdZPa4yuijmwG+x71I0W
	z4ZpZuapvgNkyaVIY6aS9frgyOx1gHfY1I3lMGR+/L84q+PPBfzimUFJ5XU+LfpBuLHObFYRFg+
	Mm6gfA8fZBOYOIujGTeFPeWukUtnYpQA5bXGJCfGQOSDJs3WCdmelM99i0SdZj0/0Pw==
X-Gm-Gg: ASbGncuPDwyyLot+31ZJvfYPEx6USmAr/hpkSiB3Zqx+Q733NeHqTcKVkSM3VE3KrKk
	NjnmoXDuk7EfFB8+KQK5BVnrin2divANSvplE3+cDGY6Aolz3j8J6n/bcAJpozKtr/cDRnWT3wg
	fEl2L2NFa6Ox0YmoB3ZZr/Yy4p+688A8mn1KTwwIEv9oMpizFJDFyFTzuPmHM0FmKILy739AXVN
	eGcazR3UDBdjSn2t4yyR1J0iluUI/Awj3HQV97Yzqt2bwgv8Ke+sXvVm5ZvY9FQDliMT4Bw84IW
	mJzsI8bfxb/TROnEtA+NhYEfUNuRpC0Lg5IrC01N9e/QtcUVJF8hZ0oUf2uLB3E0c6nqcS1kcAc
	t+E7jLuD1OdYuTNhLzM5Jj0BQ4lBE39QB27SrzSSI5VZFGvACKA==
X-Received: by 2002:a05:6000:1885:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6ed664553mr4593026f8f.36.1750925835694;
        Thu, 26 Jun 2025 01:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhcXZypQm7XHMVnXTuYK23gyUnWaEv0Gc3DtKcA7Ooe9VhmSlfjk+Trd4HOr6R6kONFyi0fg==
X-Received: by 2002:a05:6000:1885:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6ed664553mr4593002f8f.36.1750925835318;
        Thu, 26 Jun 2025 01:17:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:2f00:8afc:23fe:3813:776c? (p200300d82f3c2f008afc23fe3813776c.dip0.t-ipconnect.de. [2003:d8:2f3c:2f00:8afc:23fe:3813:776c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a6716sm11886905e9.11.2025.06.26.01.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:17:14 -0700 (PDT)
Message-ID: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com>
Date: Thu, 26 Jun 2025 10:17:13 +0200
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
 <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
 <CAGsJ_4woYd_TmZU94nedH=x_+HTwLxz94ih1jFmxoj4CxuhqzQ@mail.gmail.com>
 <42343413-7089-404e-8ce0-dd0025dca04c@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <42343413-7089-404e-8ce0-dd0025dca04c@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26.06.25 03:17, Lance Yang wrote:
> 
> 
> On 2025/6/26 05:03, Barry Song wrote:
>> On Thu, Jun 26, 2025 at 12:25 AM David Hildenbrand <david@redhat.com> wrote:
>>>
>>> On 25.06.25 14:20, Lance Yang wrote:
>> [...]
>>>> Hmm... I have a question about the reference counting here ...
>>>>
>>>>                 if (vma->vm_flags & VM_LOCKED)
>>>>                         mlock_drain_local();
>>>>                 folio_put(folio);
>>>>                 /* We have already batched the entire folio */
>>>>
>>>> Does anyone else still hold a reference to this folio after folio_put()?
>>>
>>> The caller of the unmap operation should better hold a reference :)
>>>
>>> Also, I am not sure why we don't perform a
>>>
>>> folio_put_refs(folio, nr_pages);
>>
>> Because we've already called folio_ref_sub(folio, nr_pages - 1);
>> Looking back, it’s kind of ugly, huh.
>>
>> discard:
>>                   if (unlikely(folio_test_hugetlb(folio))) {
>>                           hugetlb_remove_rmap(folio);
>>                   } else {
>>                           folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
>>                           folio_ref_sub(folio, nr_pages - 1);
>>                   }
>>
>> I assume Lance will send a patch? If so, remember to remove this
>> when switching to folio_put_refs(folio, nr_pages);
> 
> Ah, got it. Thanks for pointing that out!

Obviously I was hinting that the split refcount update can be merged 
into a single refcount update :)

-- 
Cheers,

David / dhildenb

