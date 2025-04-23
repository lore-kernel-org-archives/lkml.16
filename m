Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6B61F03D6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392950; cv=none; b=RQjVCbPjHKUcILMCJz/kmE0z+OBaOCjdgoqEUzF+/TfxIou3s5FxfeudBW8bz4kzjNj+gtgoKSqK3j3N3TIFd6TdXSI+XTroMB/hJxeWTFQDlHkFvrdZiOic36Gb1tGMON0vmITjvI6NWQY1eSyHAnZUaaf0pRKm4h8qfB48m7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392950; c=relaxed/simple;
	bh=Nzyk9PrS1JvwAvt8WE1RnHnOeeCD9vg1goldIrxwCmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Um5Og4c+Kgph990P7Pe66F4O7Yhy49BUS1EpA0IsOf+E2qz+g3dPb5m8emofaf7UaHYg1W+nIQ9uq20SPiFogDSA8dsMpYDWwTbjNHV5s+352/RRIFq+IZyr18dn+w2J7wAGmotsgTv2d+QWyr301xMbj6Qx0r+yOyKHwDGOWOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvZrgZ2J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvZrgZ2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745392947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EBuSEig5jIqMR64muBvbm2+Uy3ppV9YN4GVnlvKWBjg=;
	b=UvZrgZ2JE4pLfwft7bakjEcMM5jSwqSfKMupImaa2AwAA18QbDv8map8FFSZCHNl5Y2EhX
	ydl/lK8Z/sQgPqzTTsqfrmeOP74zIC+sbkeDReDlvOF0F7U3RJEA+6UKaIGAA7CnXWpQLs
	hY1vWOAX6gDMMo6VHMQFziCX0QmaqSM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-jllIlDvFPHCUOHZ2QuS7yQ-1; Wed, 23 Apr 2025 03:22:24 -0400
X-MC-Unique: jllIlDvFPHCUOHZ2QuS7yQ-1
X-Mimecast-MFC-AGG-ID: jllIlDvFPHCUOHZ2QuS7yQ_1745392943
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so2049274f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392943; x=1745997743;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EBuSEig5jIqMR64muBvbm2+Uy3ppV9YN4GVnlvKWBjg=;
        b=isP6CdlDUPkWLb/AsFux/e9vaLOEp9pI9HZNmSvqEF8VcyH0HGvpiQX3HjKBJRmokT
         343CRk6hrdksaar+t8hFuw+P5qq5RTSjrLuO4tK/NuhloUgNaNqkk3ij7R3KJS7zRX2d
         ok1UTCt6Chsv2cHAwipcWnPn79iXijsK0XmSZNxG9HgMKw+WRDO7/oN89SSn7Yh0KXi8
         72WIgK0UrQ/MbY5jOWYcFjjxyQB8oHrt47pco5SnD0JDpK1YuXAOAbof6BiXEXoM/372
         rmlKchFHs0cESWC6RibqpcLHRc5vsr/60lj/fJJrDVU4pSctpm9Rjo2DYQNBPyWbc8E7
         CY/A==
X-Forwarded-Encrypted: i=1; AJvYcCVyYkGeSyI79Xw7hxQt/mw92lF2N79s1V5u5UuoOS6rxYzILIszGmpwwfp5fNKfcVqJdMhLs4mHaPjWDrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypeojfefAeGitDWtdoZubgPeK3WeGiRxDNpceiZOKmAd/VLYZQ
	Ta9JiCCzDV2HVnxjNXWU4aHJvkaJEczSZTx/E9oe/ngcQgorogRqOjytoEOmXa+ILRrL3w9UCbA
	mIZzv4DXt9jZ7XdisdI2P3GL0iefmO0EyNgzk1LZZf9/K3dpUUaqjTt6GLlR8IQ==
X-Gm-Gg: ASbGncvCBqJ6s8aunQeYfuzpsMtTzI0dwm3jbB1pA3jIyIiJQjI0stbDO83em2G4rbd
	ujD880W4mCWVsSc4yTBW6khPpVD6tA8mJ+UYzB25nBPg5qDvPEEn+216Pam89rCPdju+jyCuTEY
	1sKQae4xpytodS4YPaq/HauIoYZgecbmTGJZjbv3oJW8zs72t9/ivXm5TmWyNw7tbA881B51wvF
	dhl5c0OEOAIGwHhB6rHbzcDCJA3ObpXTPTqav7jTxcdFD1jwSfUeFGS6ksLhiB44XK/i94uZcel
	LEv3WZrD9Lwaw6X8KzWisWbCDNfdVezoLMbLnX7i4R9vUU2cfyZeC7S8OmUpLeYcnKNBnsCAekQ
	YhEQdTP2+ggbD9H4QtLYAeOtPDJG5b+qo8UjX8gc=
X-Received: by 2002:a05:6000:2403:b0:39c:1f04:a646 with SMTP id ffacd0b85a97d-39efba45f64mr14384414f8f.13.1745392943468;
        Wed, 23 Apr 2025 00:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfuffIV3TY+UzXqaQPu8SArla1wmKpBhdro1DmTQpmv7CTh3OUFOqEwNH2EmpXzKZL4H+UUA==
X-Received: by 2002:a05:6000:2403:b0:39c:1f04:a646 with SMTP id ffacd0b85a97d-39efba45f64mr14384397f8f.13.1745392943118;
        Wed, 23 Apr 2025 00:22:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:2c00:d977:12ba:dad2:a87f? (p200300cbc7402c00d97712badad2a87f.dip0.t-ipconnect.de. [2003:cb:c740:2c00:d977:12ba:dad2:a87f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493255sm17918781f8f.69.2025.04.23.00.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 00:22:22 -0700 (PDT)
Message-ID: <b84b6c31-578f-4abe-9b06-6e7cf4882eb3@redhat.com>
Date: Wed, 23 Apr 2025 09:22:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] mm: add folio_migration_expected_refs() as inline
 function
To: Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Shivank Garg <shivankg@amd.com>, shaggy@kernel.org,
 wangkefeng.wang@huawei.com, jane.chu@oracle.com, ziy@nvidia.com,
 donettom@linux.ibm.com, apopple@nvidia.com,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
References: <20250422114000.15003-1-shivankg@amd.com>
 <20250422114000.15003-2-shivankg@amd.com>
 <20250422164111.f5d3f0756ad94d012180ece5@linux-foundation.org>
 <aAg1-hZ0a-44WW6b@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aAg1-hZ0a-44WW6b@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.04.25 02:36, Matthew Wilcox wrote:
> On Tue, Apr 22, 2025 at 04:41:11PM -0700, Andrew Morton wrote:
>>> +/**
>>> + * folio_migrate_expected_refs - Count expected references for an unmapped folio.
>>
>> "folio_migration_expected_refs"
> 
> Please run make W=1 fs/jfs/ in order to run kernel-doc on this file.
> It'll flag this kind of error.
> 
>> It's concerning that one particular filesystem needs this - one
>> suspects that it is doing something wrong, or that the present API
>> offerings were misdesigned.  It would be helpful if the changelogs were
>> to explain what is special about JFS.
> 
> It doesn't surprise me at all.  Almost no filesystem implements its own
> migrate_folio operation.  Without going into too much detail, almost
> all filesystems can use filemap_migrate_folio(), buffer_migrate_folio()
> or buffer_migrate_folio_norefs().  So this is not an indication that
> jfs is doing anything wrong (except maybe it's misdesigned in that the
> per-folio metadata caches the address of the folio, but changing that
> seems very much too much work to ask someone to do).
> 
> What I do wonder is whether we want to have such a specialised
> function existing.  We have can_split_folio() in huge_memory.c
> which is somewhat more comprehensive and doesn't require the folio to be
> unmapped first.

I was debating with myself whether we should do the usual "refs from 
->private, refs from page table mappings" .. dance, and look up the 
mapping from the folio instead of passing it in.

I concluded that for this (migration) purpose the function is good 
enough as it is: if abused in wrong context (e.g., still ->private, 
still page table mappings), it would not fake that there are no 
unexpected references.

Because references from ->private and page tables would be unexpected at 
this point.

So I'm fine with this.

A more generic function might be helpful, but in general it is more 
prone to races (e.g., page table mappings concurrently going away), so 
it gets trickier to document that properly.

-- 
Cheers,

David / dhildenb

