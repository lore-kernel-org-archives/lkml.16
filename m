Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A54D2701CD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393114; cv=none; b=LqrJqaKk7Hef1dSEt0nszHWNMz2WJJUWXpc30pC2VsB2AMzXtf3qdZox+5CjcyAMHlKCDTXEATTf8ADqxVnprTi7Yt2eBqi4UZnHCK825Rl3gy6zvkNmCa+9UW7hKtXPZeRAXJjLvePDwi0xnOoaOEHyAFvmCam+qFBhOipF/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393114; c=relaxed/simple;
	bh=RrqWGfEWBfj0kL39Bmaz1ymh8H/j/R3TDFS/i+5rma0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sGznCQWHb6d4jnz/eiuUrAlTbY/troxOhlZzV69fCBETe7v1l248SLtvjdLZWc6YIhDMtEERU9vRgfFyE5gR2QlGUHGbWfkg0+QOc+49ri2rDTb8UfvYHAgSI5aHP/6D8jxy2Y27BUJXmiN7Q3ymxmyhCURmapy3lpFj9nw8IZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Org+shMj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Org+shMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745393111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H9oblxL5TFk3MzBoB5qC6ZXg151NO2zDTMpCh9STN7A=;
	b=Org+shMj+G2cOo4W6bDyv5zhh2wdTzatX95n7qUmSUwDy/mUjGYvD2KUkjjvBNTa1qplxz
	J+GDhi6lWQchFEGLWHIvWLMWZZo3vg/MiNXlqC8z5BQCg0IM9aZQgsuKTWFvGEIe6GTbIY
	QAmG+swRSOGdoUDcN+M2AG93puC7ctc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-stszeJvBOoqiumq3Gb4TrQ-1; Wed, 23 Apr 2025 03:25:09 -0400
X-MC-Unique: stszeJvBOoqiumq3Gb4TrQ-1
X-Mimecast-MFC-AGG-ID: stszeJvBOoqiumq3Gb4TrQ_1745393108
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so3535624f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393108; x=1745997908;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H9oblxL5TFk3MzBoB5qC6ZXg151NO2zDTMpCh9STN7A=;
        b=wtLama2YEGsnbDf6zfdkycSQ99VyD1dRkyI5iA1Vz0gqVlq2LRHRrOPo6t8LDwPTrz
         hrcV6YN5eArpJOwexR93UXGyRe1VOzjDXNfHldJt14bTRr4pBwY2Ou1LOSCeaWCoOuFY
         giPL+Zh+AlQcINDn6F6hZBhPS6FY/486ccHNCI6zsyTjI5TVU1ErYOd9qi14atQ7Kr3y
         qbkQx4bj7R1j1Foc4z/C9LqTpnXxdgXmfyWcaUjJxtjd2m8oSEj4gUIYz+MvzESoYQKn
         ui/zVNzP6tdjRU6q0YTOlq3HTFcv6bAFQHSBoQHrTaSZGe/BOBHmYLhQ5a3jOMzDJoh2
         RkTA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ4vEcPy/NFNuTOw6C2CH6unP6Oczc5RDY5SZ7sl97VQEcJIhG+8CrBnzskjlYWghrjH1c7gX3B5nYJP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPsRzRfEFcVuBf02EX/mr0YGGIa7CXNvfgRVINHJHTI9qszhXS
	STyFR2+qv8ljRRSU66GefMKAWH9PDzWJ3U3KhK60C47ht18EGz8MZc49beC3ZJ7UqpydvTeVPwT
	Ah5Fu/6hD9dh+wYUgJU0gaBcWZPTLS2FcTkDELaoCn4icqp8B0ES0JH5XtRDZHA==
X-Gm-Gg: ASbGnctrId+JKZ72E7TaLNErdmqO1eimCtkREucabZCc096byPRjT3FYH1u9D6XX6G0
	nnpXkHkZDkNWuEV85sWvReIyThZTq/4mqbWmw9RsFpSHs+kfqNTR15YZWwUPCU6x6g0iDWh2OrJ
	P41sPNCf3n93ZQNUNYjoX2nqWxSmYA7SRpiSBsCt6NZ+EcKezvzldbbwqZJ/PTe2wg6BmzLMgu6
	1oj+dvHocOo0cPk5k/PTxdFSNZLsWOQaNJwQ6mLKRNYphAYHU8swN+AlTMrPmkWa9Xz5hbxv9ET
	GhezIks2g6FhAkIJRE9BTzv6aaNdsxqKwtPgEIM4H91ziZ8DCYb7/teq/VTAUhDu4s98a0cyiB7
	rwWzWyr1gRB/WjdeSyJ70S/L+Pxb5PT50dfDlkRQ=
X-Received: by 2002:a05:6000:4012:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-39efba385acmr15017847f8f.9.1745393107714;
        Wed, 23 Apr 2025 00:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG74s8pPqbYZHsSrh21SVIY8YNHPjcZYCwN0STxCwH4JIuShxilAUosxVBeO42YGvriqyfMHg==
X-Received: by 2002:a05:6000:4012:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-39efba385acmr15017821f8f.9.1745393107332;
        Wed, 23 Apr 2025 00:25:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:2c00:d977:12ba:dad2:a87f? (p200300cbc7402c00d97712badad2a87f.dip0.t-ipconnect.de. [2003:cb:c740:2c00:d977:12ba:dad2:a87f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49313asm17747612f8f.75.2025.04.23.00.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 00:25:06 -0700 (PDT)
Message-ID: <8f24de4d-5088-498a-968d-9e8bb85201ac@redhat.com>
Date: Wed, 23 Apr 2025 09:25:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] mm: add folio_migration_expected_refs() as inline
 function
From: David Hildenbrand <david@redhat.com>
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
 <b84b6c31-578f-4abe-9b06-6e7cf4882eb3@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b84b6c31-578f-4abe-9b06-6e7cf4882eb3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.04.25 09:22, David Hildenbrand wrote:
> On 23.04.25 02:36, Matthew Wilcox wrote:
>> On Tue, Apr 22, 2025 at 04:41:11PM -0700, Andrew Morton wrote:
>>>> +/**
>>>> + * folio_migrate_expected_refs - Count expected references for an unmapped folio.
>>>
>>> "folio_migration_expected_refs"
>>
>> Please run make W=1 fs/jfs/ in order to run kernel-doc on this file.
>> It'll flag this kind of error.
>>
>>> It's concerning that one particular filesystem needs this - one
>>> suspects that it is doing something wrong, or that the present API
>>> offerings were misdesigned.  It would be helpful if the changelogs were
>>> to explain what is special about JFS.
>>
>> It doesn't surprise me at all.  Almost no filesystem implements its own
>> migrate_folio operation.  Without going into too much detail, almost
>> all filesystems can use filemap_migrate_folio(), buffer_migrate_folio()
>> or buffer_migrate_folio_norefs().  So this is not an indication that
>> jfs is doing anything wrong (except maybe it's misdesigned in that the
>> per-folio metadata caches the address of the folio, but changing that
>> seems very much too much work to ask someone to do).
>>
>> What I do wonder is whether we want to have such a specialised
>> function existing.  We have can_split_folio() in huge_memory.c
>> which is somewhat more comprehensive and doesn't require the folio to be
>> unmapped first.
> 
> I was debating with myself whether we should do the usual "refs from
> ->private, refs from page table mappings" .. dance, and look up the
> mapping from the folio instead of passing it in.
> 
> I concluded that for this (migration) purpose the function is good
> enough as it is: if abused in wrong context (e.g., still ->private,
> still page table mappings), it would not fake that there are no
> unexpected references.

Sorry, I forgot that we still care about the reference from ->private 
here. We expect the folio to be unmapped.

-- 
Cheers,

David / dhildenb

