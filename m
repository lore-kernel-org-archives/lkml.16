Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E322E06E8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147375; cv=none; b=h1IA0JkIGDnISnu8TA4TvjHWfTF/pqvvSNlxVXY5gkJ93emPtk3HsyIaqMA2E0YQtW6bGvcdQ5T8XkhNOoNL5hv9X20w5eh0QlpJUJuDgmXiZDtX4aNMbOULNGsopU+E2H/GXWOkcUn/EgUcGmagMSkuNpFX42llONNNZbeEHd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147375; c=relaxed/simple;
	bh=1+KbtzG6qtWkPsYFErIXAlygfvsb6b5YnjkXBfBUtRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THd/d2s8N8bJQbzxlK8A3wBwyxa6YB5pknwGFVr28sst146IjFfAH8xsVrp8Q2ori7BeKBGCVU5YqbP0AA9vaKm8+kXIkdyov89KJL/NrJHPEWE52zZpkaWQBBBApx4uxwiD/yswOa3Cq25ZBSlQzAT0jMlii2zyUvpYs7fvhKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N36uEQOU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N36uEQOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750147372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AOf6xzSA4kUe5am2Ot1h5AlYg72L6/69lnueB5vJdTI=;
	b=N36uEQOU+vJiK4+EUYQfvHSxB1BoyISjuqJfYqjjPQ6SgIlY37JmKzuvco/2bLvtQJg7nH
	Ac5D0snyeLUSvlVNm8eZbzZasXPGZGkOMDrptMQdhs79T8k4rBKYERNAXorUBEUNiKMKht
	+KNZmEOkfExdWz8waEsjWTGDhAcWSUA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-5tVfFpUvNOiSjze9rf7R4g-1; Tue, 17 Jun 2025 04:02:48 -0400
X-MC-Unique: 5tVfFpUvNOiSjze9rf7R4g-1
X-Mimecast-MFC-AGG-ID: 5tVfFpUvNOiSjze9rf7R4g_1750147367
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450787c8626so39984805e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750147367; x=1750752167;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AOf6xzSA4kUe5am2Ot1h5AlYg72L6/69lnueB5vJdTI=;
        b=WShRfbh/HMIFMcN7tAkpVB58XeJ5P6jrmyKSCiXPGr3QyUQ2nfv4OJdaaW20Fd4qtf
         sbEQ8Czc9WeJI2LOtwT/gqs8v16u9IANVUpC/E9/JNNJDLJpNcCHRbdx3+DJMcbWXd/y
         2rQBYEhh4pr7P2PN3jK1WeJyCQUyFwFRdnmWB4NBjRBKBp+XFIfF2SEwyqqhtsL1dd6s
         gPCHXWLA+Ibtt5g6FM44AXjNn1uV1AFRhBSlekK/kO2yn3q1BueUo8uLBhpUYrE6CEQ3
         pbKkm8unCmeAlxFDMAfcYhA/XH5fkIFvbrgNZNwD93VNRyuPmKniQuJDiH1iUR5A8FkF
         MMlw==
X-Forwarded-Encrypted: i=1; AJvYcCV9FTgdpoDJXl8lf/zoQ6PHf28Wkgk5ccmEPw8aiBdve21oVyCP99NdE7t0Na8SvV4qZ9lT0vhosqXZp8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6m6TloifpLakU52GvB58y4nO/hwHjmt+6sshbtTbD+Gi2Kqc
	+JYqU/Q3Jwia9sfuYsQV3xtNTeP2nyDE9azMuoSh4OVjnH/r5oUBYzgbcptR4keLG1SQ56FihzU
	fBDBMvZgfuIPmkhiEaXz0aLdBhS/LcgyhRw5nc/IDA8nmuksNc1OpD5lDj9ItWXIDzg==
X-Gm-Gg: ASbGncuIQb0OOFPpytl8uqPGRx6dkRVOC5tLlkFSsNPKNv+bkJmwPAH7IWM1ORX8Dkm
	tShEDTeuBYv+4M5gC4DojS/ZDesu5wtaeoQsQTqtQ/lcpNjTiwI85555L4XD750nCpDjV4JZnHE
	wt932JTsy5KjxBcP7RzVtQZXeccE8Bzgj11P8PcuDmkqZXhvGNsHfkaxRbCXVyWf4fys+t7MlD8
	2uLT5ToIES10ZLnp8tuxxm/5lzl5oXGWNgWyAvzz5Xe0Q1+O+R56ytCXwgDQ/ZXM2QGeRgCv0dH
	frgrGZIEgov1tua0Laz7wG9ttkfxkvdKP0pBCOfBJEaOqMPyzd2ZRGUp/ZuPGyA2NjIRhnkJKcp
	vk5Tz50vA611epSmEqp8z87kPqb7+pppsIrrPBHiYTxKTzSI=
X-Received: by 2002:a05:600c:3585:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-453449eb6c3mr80479595e9.6.1750147367362;
        Tue, 17 Jun 2025 01:02:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZkUcDjppFvF6UekM3sVM0geBU8FX5I52LeqJH4OJZr9H+BAb4ebBGrUeMeZxWhMacxLbsFQ==
X-Received: by 2002:a05:600c:3585:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-453449eb6c3mr80478975e9.6.1750147366828;
        Tue, 17 Jun 2025 01:02:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a547d2sm13495403f8f.19.2025.06.17.01.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:02:46 -0700 (PDT)
Message-ID: <044b01ff-2801-4f5b-ac3d-bc9fbd910aa0@redhat.com>
Date: Tue, 17 Jun 2025 10:02:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-3-dev.jain@arm.com>
 <43d9cb6e-1b8f-47b9-8c19-58fc7c74a71e@redhat.com>
 <fe823cc1-e4d4-450f-889f-57339a4dd967@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fe823cc1-e4d4-450f-889f-57339a4dd967@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>> -               pte = get_and_clear_full_ptes(mm, old_addr, old_ptep,
>> nr_ptes, 0);
>> -               pte = move_pte(pte, old_addr, new_addr);
>> -               pte = move_soft_dirty_pte(pte);
>> -
>> -               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
>> -                       pte_clear(mm, new_addr, new_ptep);
>> -               else {
>> -                       if (need_clear_uffd_wp) {
>> -                               if (pte_present(pte))
>> -                                       pte = pte_clear_uffd_wp(pte);
>> -                               else if (is_swap_pte(pte))
>> +
>> +                       pte = get_and_clear_full_ptes(mm, old_addr,
>> old_ptep,
>> +                                                     nr_ptes, 0);
>> +                       /*
>> +                        * Moving present PTEs requires special care
>> on some
>> +                        * archs.
>> +                        */
>> +                       pte = move_pte(pte, old_addr, new_addr);
>> +                       /* make userspace aware that this pte moved. */
>> +                       pte = pte_mksoft_dirty(pte);
>> +                       if (need_clear_uffd_wp)
>> +                               pte = pte_clear_uffd_wp(pte);
>> +                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>> +               } else if (need_clear_uffd_wp &&
>> pte_marker_uffd_wp(pte)) {
>> +                       pte_clear(mm, old_addr, old_ptep);
>> +               } else {
>> +                       pte_clear(mm, old_addr, old_ptep);
> 
> Should pte_clear be included here? It is currently being done only for
> the case
> 
> need_clear_uffd_wp && pte_marker_uffd_wp().

We always cleared the old pte (using get_and_clear_*, which is not 
required if we already know that it is !present).

The case you mean was what I describe here:

>>
>>
>>
>> Note that I don't know why we had the existing
>>
>> -               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
>> -                       pte_clear(mm, new_addr, new_ptep);
>>
>>
>> I thought we would always expect that the destination pte is already
>> pte_none() ?

So clearing the destination PTE can be dropped if we didn't move in the 
first place.

-- 
Cheers,

David / dhildenb

