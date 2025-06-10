Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81699246BA4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561962; cv=none; b=QgtUqqB4nhjLbryPOb23GjWkaWONa5f3yDQikjzWXnt2n7wk1fJH4IiG7ZryUcPQvDiqXQCsHC6m4QkxTEZB0jxNu7NepTdOQyYef6I4oeYj1KE2PRBK0w2BknpaUkoW22JAryyKxQz8VtTEt4avF00djN3PqPKLqTTmOY+Uhn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561962; c=relaxed/simple;
	bh=kNGCnJwjUdhpQBnEBRRVd7RrezuhZQDrhUK7yDr4vgU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sxo393+JZS8u9IMXtjpOuU7hWSzPn8L6gRwPDNSDTHc7+UL7hbD/4tPh1OYjEzUzfnjqqOUZ2DUA/t3mqlHsB8I2NH+1pt/gRB2T3oGLyOtNbnndK8Duln61a1QSFO2azVWLrRX90sCfjd4imG8gyw9R70E3/8jS2Ql7olpzmyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GWCs/xAg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GWCs/xAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UOUtyIivh13PUqsEgCb8n92bCG7VplbjadncEisJiSE=;
	b=GWCs/xAgWF/r+9LKvB1ND5S+wk9gKsDEo9qy3QKhkoamC7S7ayzoJLqSYD+p+lu7eQ1wfH
	W1PCrMH5mCDjT34l5ABNZPejGbyI6+L984nH+vaInOSoS3w/9dYmnYe3KCey49eWAPqFeK
	pUvbhTl/YOf8Ool3gymKBAZ6HE/5myM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-Cx8F3pviOxqLa1QD8ZMvSQ-1; Tue, 10 Jun 2025 09:25:58 -0400
X-MC-Unique: Cx8F3pviOxqLa1QD8ZMvSQ-1
X-Mimecast-MFC-AGG-ID: Cx8F3pviOxqLa1QD8ZMvSQ_1749561957
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so3605675f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561957; x=1750166757;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UOUtyIivh13PUqsEgCb8n92bCG7VplbjadncEisJiSE=;
        b=FyjjUgl0DlK7beMyje8RlcQx/uXfYmolYkOKaBWR17nzOkeCGeORf+fvIC/zyeVtMF
         5sYD7hi/4477Z2h+9Qt5dCPzt9Bc4yi2DUBIhmVxARkyh3QxJUjWVRPeNgxPUD2csAAb
         4CRa1g1hGMGR8q6pQQ5/NArw+yD5c66ea4YQgdZ0IWpjmCkhNqrKFENIQ6KMYeiwHWWe
         Zg6PTtgxEbb9wqv00j3/rwrxx1cPsPbDm2Tc8sZxH+PxG2b/QJd9JuZzy1Mf++TAXV0D
         EX5gGcgsgaX2Dbc0OFrw3tQp6lijthF0+ivx7Y2mBbeMAluhR/LcmGjrqP3c+i7hjcW/
         6K4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW39E41R+HR8jzR5a10bCPnTmnubriwWIhyZFLF+OmW9pPGfOQOatapXz+uKqGZ2Qtm+lny1EY97G4Kzpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKyK52YSzIPqYbcyrxEKKHpYE1ixUGGWuZf70hfLKINmb5uCk
	zfTcp/eL/9FYJ0AXAmDN+zVjuEHzyg8osCn/SsIAHjwviyXnwbQiGuCZi9zbLRZOREfRq29Nxhx
	JiJIIB9iDw5SrC5cQFwkTkfS8qm2r/Lnje8klRr5tS+XthYsv+7HB+GgG37S/u1/9KA==
X-Gm-Gg: ASbGncvSCgkrsSelAZZyb+nRO1369qmh9zMPW+By7jYTQewZLKC+p7uJ968r9xd4q6w
	lDK+uokWFB5QPWq3sZIxo4KP154PR4gS/T4FwdkKdue8cUmTbp6ptIFiDQJJoR3PHx5gQ65kxI6
	8YWbEYE2hB+I9ePF117rDpovZqtZ282TFUd7jJm/SDy2Iu/1ztBEZg8L54e+RwIuSJpFhjNOvBC
	t42zMxRF8yMWoKtlpvEV28FlxMwihjTVqWhyDK4U3VSs8BI2WoFk+qd7a3lPvlP8KpK9PaltJc1
	TnErVpl3psoaE3LpjaWAxLnZf2E7YbleOSJQqjmafQ6TwHQcUP/Xymw=
X-Received: by 2002:a05:6000:288c:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3a531ab5272mr15309107f8f.21.1749561957099;
        Tue, 10 Jun 2025 06:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/7kPqZZ/+Y3az8v7akKRzwFHXYkHgzSWQ8MYzhrEcJkdseIufvqvlRRJq+UmTakgX+RwCpQ==
X-Received: by 2002:a05:6000:288c:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3a531ab5272mr15309070f8f.21.1749561956651;
        Tue, 10 Jun 2025 06:25:56 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323bee86sm12051355f8f.43.2025.06.10.06.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:25:56 -0700 (PDT)
Message-ID: <f889be0a-b96e-482d-be0b-57c9d81b824d@redhat.com>
Date: Tue, 10 Jun 2025 15:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
From: David Hildenbrand <david@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
 <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.06.25 15:24, David Hildenbrand wrote:
> On 10.06.25 14:07, Lorenzo Stoakes wrote:
>> OK so I think the best solution here is to just update check_ops_valid(), which
>> was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
>> enforce the install pte thing).
>>
>> Let's do something like:
>>
>> #define OPS_MAY_INSTALL_PTE	(1<<0)
>> #define OPS_MAY_AVOID_LOCK	(1<<1)
>>
>> and update check_ops_valid() to take a flags or maybe 'capabilities' field.
>>
>> Then check based on this e.g.:
>>
>> if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
>> 	return false;
>>
>> if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
>> 	return false;
>>
> 
> Hm. I mean, we really only want to allow this lockless check for
> walk_kernel_page_table_range(), right?
> 
> Having a walk_kernel_page_table_range_lockeless() might (or might not)
> be better, to really only special-case this specific path.

Note that I am also not quite happy bout that function name, but I think 
we should add a proper interface that documents clearly when it is even 
okay to call that function ...

-- 
Cheers,

David / dhildenb

