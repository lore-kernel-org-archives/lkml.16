Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BE71714C6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749064588; cv=none; b=I5IkDqN49UPe0mG9W+abX0U8oy/uUe6WwILr3kSjTHtbWZ0QBidOaXTycYpv2fdREu9Uot2BhGJX0OyUJQNbIbszA6vWH4VyfbdSSy6BMEgdKOAJ1kccMtXY5iYBrz59b76g9gegLBQb+aNBY9KzQlVXqwWlzTGiUOghXUxYeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749064588; c=relaxed/simple;
	bh=HuSPiJOYuRKWDSEZKBcJ+jpflJtdPO0ng3mXpOvfLR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iV/Q2OAiYAwUBdPc2WrxhvpP3HGAnWu5pTnNz2UfUeXqPUtUJSzeZu2zNQdQbbqYgOWx8PbXQmHAgX5EjmYVs65UgxBEFwD1WgwDbZyJzjg+AV9WJCvdJLHwuMvzfCmYh8RfNEh2OlnRHf0hUvYa7UytvRkQbyFRjNHjkRiKqug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OpbRUXBB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OpbRUXBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749064584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rfu56wuubM001B/pgaMkp5G9PWTbiIJhIqTlXiTrxqU=;
	b=OpbRUXBBXMHIV7mSJ6xnuFCVkTUTT9l1rNVyQOt8zVz/MBdd3Ev4HmkzuhrncbmyFr/Oar
	bdxCrV970rfbDJi4E6qhYuGsCm4BRBz7q8jy8LDDPEvsMN18g81ZsXg4lDTbxPZIYkwjqt
	peuXd97n7XsHFrZKQ/6jFY5zn81+FHM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-2wh-bb-UNT2pW0_t04S4DQ-1; Wed, 04 Jun 2025 15:16:20 -0400
X-MC-Unique: 2wh-bb-UNT2pW0_t04S4DQ-1
X-Mimecast-MFC-AGG-ID: 2wh-bb-UNT2pW0_t04S4DQ_1749064578
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so185082f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 12:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749064578; x=1749669378;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfu56wuubM001B/pgaMkp5G9PWTbiIJhIqTlXiTrxqU=;
        b=rr+TR/bPDxl5qhbLkNtTGsN/fbJ911TYqdd0IenOQpMaxH/k6mc8Nn/ug1TQNrN9f0
         wx2S4Z340hbY3H6Uzgn+RNzUYzNFGsVGLH/SOARdwLcBuqSwAcIjybqZutTorXxjQY67
         wswat40XFcO002QGzXSY31xToa3/ejbgGRUONagLMGBbhGpETi/VToPJlJ1HAf8x1UN3
         Fad3mGrK7SE5lb1veZaJF71t7ZNPROM7haiP1tJU+Bmjkj32SZQY+PDjZm0colzUjnxI
         +l3YZBGHQF6ZI4Ukuemc8UBqEEYE+OaiDUMuPMY/Zd1b7VFSaCI+ItCa0rBHkeAxH0Mg
         XsJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7BywUnbhCdczK2hiyAylTBamiQ8xipkcyXzpBs2FQTSyeOpETsC0rpJOdOgqO+KN3+iGv4y5PHRJvA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY/TnTQgFTaJQhqF+uMnstV+MRWrLfhvddn+6aECx6ww2D3hVs
	F+qK8cDCQDcWxS4rnHbaQysvDbK8sXZO1ECzy8+EXfUryJmp1urZh6sepYixCaQDQtQISyT26Zh
	xP+w7Z6YQnv7rheGwXgvzVDV0bHVR3ASoGfXLCg7NE3f4ecqemShu8RKjma49FF9HEw==
X-Gm-Gg: ASbGncuOotW263PbW76EBtbrIANyBVU0h4TfVgF/ux+9VeTsgRlVXMMg83ofewWbI81
	uwf63M1mZ0EyeWYoIgYpy5DbSM1q8RlJgnKCdWxO1wv5d78TVBiB08Xtt5H1QgKwn6IBsTe7BCs
	Ey1AR7CBcJZxdIwzo95BQPXiNObNprgPWatUKUQS749WvmGjD2Nibs235fmK+UEoobkZcrZ4r9I
	R92hEjzucvhXwYXSxjAFX2GdT4IQaimGnxZxCUP8dTP8da07nVWRA45GeJHYyqgFgLm9Sd5YtD7
	pmOxh61lLGTgO2vF5BgGUfrXuC7G6dUmKyyT1ljpDg==
X-Received: by 2002:a5d:64ee:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a51d97c83amr3564757f8f.52.1749064577911;
        Wed, 04 Jun 2025 12:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsBr85DF/VWKVoy5wsZ3LFl+OisFHUCnMjMgzy50eu/xYDiBdrKcfoup3zde3lnswnlMQSxQ==
X-Received: by 2002:a5d:64ee:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a51d97c83amr3564743f8f.52.1749064577527;
        Wed, 04 Jun 2025 12:16:17 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f831.dip0.t-ipconnect.de. [79.224.248.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a522322534sm2200127f8f.70.2025.06.04.12.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 12:16:17 -0700 (PDT)
Message-ID: <23316621-0338-476f-b255-9ac4dff15d8b@redhat.com>
Date: Wed, 4 Jun 2025 21:16:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <ipscls57c234tnkiivnkssiehkxygsgqja3z772qmvnjaatg3h@77pcu5lra6eo>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ipscls57c234tnkiivnkssiehkxygsgqja3z772qmvnjaatg3h@77pcu5lra6eo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 21:12, Liam R. Howlett wrote:
> * David Hildenbrand <david@redhat.com> [250604 10:06]:
>> Especially once we hit one of the assertions in
>> sanity_check_pinned_pages(), observing follow-up assertions failing
>> in other code can give good clues about what went wrong, so use
>> VM_WARN_ON_ONCE instead.
>>
>> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
>> well. Add one comment for the pfn_valid() check.
>>
>> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
>>
>> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
>> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
>> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
>> happen", but more reasonable to check for during early testing.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: John Hubbard <jhubbard@nvidia.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> seems okay, besides the one nit.
> 
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

[...]

>>   
>>   	ret = handle_mm_fault(vma, address, fault_flags, NULL);
>> @@ -1760,10 +1760,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>>   		}
>>   
>>   		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
>> -		if (!*locked) {
>> -			BUG_ON(ret < 0);
>> -			BUG_ON(ret >= nr_pages);
>> -		}
>> +		VM_WARN_ON_ONCE(!*locked && (ret < 0 || ret >= nr_pages));
> 
> nit, we are losing accuracy on the value of ret here.  I doubt it makes
> much of a difference though.

Yeah I doubt this will matter.

Thanks!

-- 
Cheers,

David / dhildenb

