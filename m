Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42496237176
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745580215; cv=none; b=R1Y+wk5E9XKBM9nlah0BFsISyuW9aCBYsK1ZlYDSgXAQ6ZXHrySGCjOYpYammK9NByUSiyZgfjrheYe/CFgOqZmAKr62XD4ew/eZodJj7KeNHOJ+D/VBx3quhEEohdrtGSn0Pq0X9F8ZbFURJyJhLIJukv9WVap3qxjMTQCyobg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745580215; c=relaxed/simple;
	bh=89j2PyF0I1ScHkB+o/COTjUFv6UU6Wqj8/XnfZAV+tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5DMvrBQXnVbcVkG2u7jUruqwhuVZztevT2Gh+s48U6xdM2Zhe5xfg0KNIb+C1waAt/iyVH/BIXq5LGuiV1GCor7pbhrbG9AHNqgV8qAe4P0RoayDbwppIU9QVk/VmslW6xmkF6nn9RaqYhGtCSE95VF9wJWWa1lBWamW1I2+OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IthWpnbq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IthWpnbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745580210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hzsKRwrG/rIypg45Snudvv0/Z6CEe70oxE9vZVX6wgg=;
	b=IthWpnbqrdsg4H3kHrlXM2URJZZOqNtvGlQeQnH/St7KZSuWrw/sZg0iUE2w7uON28M2H8
	OiLvYWBxPRkgYK8p+SsVuItauUr/LohaUWDrc+vwP9aosGDowUWomLZfD3+k5vMeSrKlW4
	htqC5NVkp3MzkonME0n2vd/FQc4iuK8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-8W4dQGAmOIGVUeq3sa9SFg-1; Fri, 25 Apr 2025 07:23:29 -0400
X-MC-Unique: 8W4dQGAmOIGVUeq3sa9SFg-1
X-Mimecast-MFC-AGG-ID: 8W4dQGAmOIGVUeq3sa9SFg_1745580208
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39126c3469fso712145f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580208; x=1746185008;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hzsKRwrG/rIypg45Snudvv0/Z6CEe70oxE9vZVX6wgg=;
        b=i4U+m9v+J5peQLL7bzFIipi+2SdDr9NJ3xLFgSVuXWzidDw3vfkY1oDQgv0G5xGG1D
         fZ8lgN+CtobLa/jFmfPsj8aRHguzW3h2PlWHVX0ep1Sf0hg4KrqAlC4bZ7JqQx4ooSq+
         1KnZQdUXw0XAZVlGVrB/HM1wcgWZxpOTgfv98BGl15opabJR7BMXcY/2oLaE85Lc2rQD
         ufF0VDH8O4ZkxS7s8VNAhcBUKw+z2J2mKBaNXB+n68idmu+wSbHST0q3q1qac0bemJ/G
         HPL+idGLuWWMqDFaSBOrG5Crb1xW/OMSf1XWNbTyxu4FQjjekgJFf6YQ6+QMexqFpc8F
         GPJw==
X-Forwarded-Encrypted: i=1; AJvYcCUEMs6ewx3cGe0BIBFhEPWKhSDaJLRwGNAG5KrHj2z3xrDV81TcRLqC9b5h7dC6GmyxqiYFJtJaSfxrv1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7qEa+1CvIc33ZP8lbJJt72r0OkLXFcrwlT6cNedcx63aHC8f
	0SBjycJgBSCDcH08iJemz08nXjDf0FtBxQ5HHgdl/8VUH4mhkrb4CGZLIYWHWi9BYYZKwuM84mK
	7BO5e3a99lUH7q8LaXAKzUjDE9jyCIIlvURsey0ewRivJB7kVrDFkL2YMjdA7JA==
X-Gm-Gg: ASbGncu/OQUtYjabsMSJ3rWP5dYPEj4VK6nkcjOmj/hQk4hx/r6jW+04QVmpvf00N68
	9GlHfEJS+5OrxmkYIEW/8zrWCvufbQtH0L4/YAHXTaR96jRrxYG/fAiQLZfM2GAsuwmAWBbAyWv
	oe6XymRB13WtILZ4QV+TKIxQeOlvAZxz1uckOl5A11FmnU6yCOK96f/O6Ddab930ThudltmqSQj
	f+EuLOYXMH+I4urzYKIcHAuldyhfEdJMkYGwjJUi/IzKhzWiixKjEjnmfMR4swKA4NNxss+Agib
	61YhYCyPSyXk9GLaKEZKxlsMcI2Y2AZ1EpSp2Sjl9c6yEewzdzEsnAHcQ7HvQyLMZ7OkxYTJMCL
	TRIKdc5yCF1/mEDyCQkk/zqgg+AQ+sInw7SQ7
X-Received: by 2002:a05:6000:2287:b0:391:4873:7940 with SMTP id ffacd0b85a97d-3a074f84b97mr1466622f8f.54.1745580208306;
        Fri, 25 Apr 2025 04:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQPolowd9porKr0oqiTm7SO2g5ywoJdxS3gT5heiRXc2AnsEe5Q08RjWrwqWPLYO2PuE+PAA==
X-Received: by 2002:a05:6000:2287:b0:391:4873:7940 with SMTP id ffacd0b85a97d-3a074f84b97mr1466598f8f.54.1745580207932;
        Fri, 25 Apr 2025 04:23:27 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:6900:6c56:80f8:c14:6d2a? (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d479sm2116638f8f.92.2025.04.25.04.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 04:23:27 -0700 (PDT)
Message-ID: <96738f27-25bc-4d9e-9c4e-709e840563eb@redhat.com>
Date: Fri, 25 Apr 2025 13:23:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm/huge_memory: Adjust try_to_migrate_one() and
 split_huge_pmd_locked()
To: Zi Yan <ziy@nvidia.com>, Gavin Guo <gavinguo@igalia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, gshan@redhat.com,
 willy@infradead.org, linmiaohe@huawei.com, hughd@google.com,
 revest@google.com, kernel-dev@igalia.com, linux-kernel@vger.kernel.org
References: <20250425103859.825879-1-gavinguo@igalia.com>
 <20250425103859.825879-2-gavinguo@igalia.com>
 <40B90370-92E1-4E12-979D-7220887CB780@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <40B90370-92E1-4E12-979D-7220887CB780@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.04.25 13:10, Zi Yan wrote:
> On 25 Apr 2025, at 6:38, Gavin Guo wrote:
> 
>> The split_huge_pmd_locked function currently performs redundant checks
>> for migration entries and folio validation that are already handled by
>> the page_vma_mapped_walk mechanism in try_to_migrate_one.
>>
>> Specifically, page_vma_mapped_walk already ensures that:
>> - The folio is properly mapped in the given VMA area
>> - pmd_trans_huge, pmd_devmap, and migration entry validation are
>> performed
>>
>> To leverage page_vma_mapped_walk's work, moving TTU_SPLIT_HUGE_PMD
>> handling to the while loop checking and removing these duplicate checks
>> from split_huge_pmd_locked.
>>
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@redhat.com/
>> Link: https://lore.kernel.org/all/91599a3c-e69e-4d79-bac5-5013c96203d7@redhat.com/
>> Signed-off-by: Gavin Guo <gavinguo@igalia.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> ---

> 
> I wonder if we need a WARN here to make sure when THP migration support is not
> present all PMDs are split in try_to_migrate_one().

Can you elaborate on the condition you have in mind?

If we have TTU_SPLIT_HUGE_PMD set, we'll never reach that point.

Without CONFIG_ARCH_ENABLE_THP_MIGRATION, we should be running into the
	VM_BUG_ON_FOLIO(!pvmw.pte, folio);

right?

-- 
Cheers,

David / dhildenb

