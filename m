Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE79E1FF1C9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020425; cv=none; b=hpaLU8Lk0supdUIwERnNK2/hnt4S0bZXUUCUO8hZWAkjeCaSfiKhnLu964kxQNY8ARXT6afxnBYDGNXeRy4IfW0LD1Rb82+eCXWEka3vzR01zbmnJqm4Z+ESQLCkc+GH01etT3mKmSDe9d7Az9iAY6KxBKA+eGzHSu1mJjLdNps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020425; c=relaxed/simple;
	bh=ldQjJ7UNLxo/lWytezcOzNcPcncGo2138Gtpk78cBTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l081PHX1Mb/Ha637UgLTVZtmpYxl7kB/7y+aeCyqaHMentvwWChc/ZeqblCbajpgfEeQ8mBmpSYpPn3SeqNzM1mX611hAzy8v8pJ60S0AzPAVtlquJR1r06Ez0XxM0QzBtf928MeEcWOOlBiBFV9BEEivMZAEKJq5ye1MH4fUt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RK+lAKyS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RK+lAKyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745020421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+h/Vp0gMyIMKcL+uPWAU540HesIREHi5pomWL/DZBmY=;
	b=RK+lAKySjnvRKAswnewzHdHaUZwXOZnqRIi+EqJLG5ucoEWsJZ1NtaZ6D40CVh79F6vqMT
	z8+NDsoyey3q2CiZwOqMJNEWnD5bZ9O4vnAwfW3hSqkyjFqZtCyIRQrWgn/1NPC+Ar8Bh6
	YJwwKODHc7tggkBnitwurKuLIJ0ISTA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-xvs_W2l6NVG3mlnO-S36nw-1; Fri, 18 Apr 2025 19:53:40 -0400
X-MC-Unique: xvs_W2l6NVG3mlnO-S36nw-1
X-Mimecast-MFC-AGG-ID: xvs_W2l6NVG3mlnO-S36nw_1745020419
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242ade807fso36528705ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745020419; x=1745625219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+h/Vp0gMyIMKcL+uPWAU540HesIREHi5pomWL/DZBmY=;
        b=eosE8iDIN+6BLq83Jt3Ks4Azf+NrkOojbk/8oTpAhgQoKbFPnTN0y6JI4Az+YzKvSq
         Vq97kN5sSBQoqUhJvkPfRJcjjxsLm5kdRhdCfBguCWBEY+OPCZpROkF98uiB2ZEpS139
         +PTmM6LgDov3q3qWMe0XuVYNCUwTgNNqlr/RTuz31dbyeXdVNuEHVB4+OPesCYy4M6Gh
         NedGrxLctueQ+x0c+8kEyp7fhnXwiJcf2zymG5qZtZ4HZ5UghVLMdO+l6YUtG264u6yG
         RFhnxueqXP/vakHmiiCkQblmUtG4iyvLYGZzrW45CogOkTuP+jdXYWWr6qr0/iCR9Qt0
         SnEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3VZy+P7FhsC+1JfH66gz+tS4Ef5W0d1fvQV96hlz4y0EVSR8juUzKh9YOdJ2V/BLczNsXKJvr3AZ59b8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx97S6PCrPjukI+qL1lu8ocBg8wDonHfwnuJ+3KK7K8LtDS9G4K
	o4S5ABplETWHWG0ca9F7IVgU2PQYzXXlMyuvJ6ESDXHNuvzvWz33GOuDweumk1AcJ25A/S4UQbh
	VKMpuc23TPBa4w0AuaZFGHbLL6GWhduBZO3JH4tG/H+ovJcwkTVsGlMB++9gBAA==
X-Gm-Gg: ASbGncvvKTTlr6Af7wY37m/Et0t+9r34rbQTWoxq6SynWteHv8aIv0qEZeTZGVcfwlv
	ws11moFi1DMgU4iw96NAdXRcBjFrTFH8wKtypcQ7r/U4whRmAbbuqinPSfPJfTcKnnrUjwOiSeN
	Gj98VNmvwNZQm8+db2UTBRWNdllLque+EHkFQWLcbutcjF+ZWdvmsQ43E+7mPWCBpJ1hi+UXGus
	Pak629ofledayQXubGD/4kLaM0nLlS90rac/KHg5FgpjDUCYUt8U2AD0MxT6b5YrjW89y6KTL33
	blqBaspaAx0i
X-Received: by 2002:a17:902:d58b:b0:223:6254:b4ba with SMTP id d9443c01a7336-22c53581279mr58727295ad.13.1745020418956;
        Fri, 18 Apr 2025 16:53:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyrip1Pzd8BkTMwT9ZS60iZqs7EzZWLS+zXlCELfu4PB6UgO81P4DA6EMlM4UyTwwkyBVHwA==
X-Received: by 2002:a17:902:d58b:b0:223:6254:b4ba with SMTP id d9443c01a7336-22c53581279mr58727125ad.13.1745020418641;
        Fri, 18 Apr 2025 16:53:38 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed0f85sm22505245ad.178.2025.04.18.16.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 16:53:37 -0700 (PDT)
Message-ID: <e66af83a-f628-4c5b-8d48-aa6a5d4b4948@redhat.com>
Date: Sat, 19 Apr 2025 09:53:32 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/huge_memory: fix dereferencing invalid pmd
 migration entry
To: David Hildenbrand <david@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
 linux-mm@kvack.org, akpm@linux-foundation.org
Cc: willy@infradead.org, ziy@nvidia.com, linmiaohe@huawei.com,
 hughd@google.com, revest@google.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250418085802.2973519-1-gavinguo@igalia.com>
 <b1312600-1855-406c-9249-c7426f3a7324@redhat.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <b1312600-1855-406c-9249-c7426f3a7324@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Gavin,

On 4/18/25 8:42 PM, David Hildenbrand wrote:
> On 18.04.25 10:58, Gavin Guo wrote:
>> When migrating a THP, concurrent access to the PMD migration entry
>> during a deferred split scan can lead to a invalid address access, as
>> illustrated below. To prevent this page fault, it is necessary to check
>> the PMD migration entry and return early. In this context, there is no
>> need to use pmd_to_swp_entry and pfn_swap_entry_to_page to verify the
>> equality of the target folio. Since the PMD migration entry is locked,
>> it cannot be served as the target.
>>
>> Mailing list discussion and explanation from Hugh Dickins:
>> "An anon_vma lookup points to a location which may contain the folio of
>> interest, but might instead contain another folio: and weeding out those
>> other folios is precisely what the "folio != pmd_folio((*pmd)" check
>> (and the "risk of replacing the wrong folio" comment a few lines above
>> it) is for."
>>
>> BUG: unable to handle page fault for address: ffffea60001db008
>> CPU: 0 UID: 0 PID: 2199114 Comm: tee Not tainted 6.14.0+ #4 NONE
>> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>> RIP: 0010:split_huge_pmd_locked+0x3b5/0x2b60
>> Call Trace:
>> <TASK>
>> try_to_migrate_one+0x28c/0x3730
>> rmap_walk_anon+0x4f6/0x770
>> unmap_folio+0x196/0x1f0
>> split_huge_page_to_list_to_order+0x9f6/0x1560
>> deferred_split_scan+0xac5/0x12a0
>> shrinker_debugfs_scan_write+0x376/0x470
>> full_proxy_write+0x15c/0x220
>> vfs_write+0x2fc/0xcb0
>> ksys_write+0x146/0x250
>> do_syscall_64+0x6a/0x120
>> entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>
>> The bug is found by syzkaller on an internal kernel, then confirmed on
>> upstream.
>>
>> Fixes: 84c3fc4e9c56 ("mm: thp: check pmd migration entry in common path")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Gavin Guo <gavinguo@igalia.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Acked-by: Hugh Dickins <hughd@google.com>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Link: https://lore.kernel.org/all/20250414072737.1698513-1-gavinguo@igalia.com/
>> ---
>> V1 -> V2: Add explanation from Hugh and correct the wording from page
>> fault to invalid address access.
>>
>>   mm/huge_memory.c | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>

Reviewed-by: Gavin Shan <gshan@redhat.com>

>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 2a47682d1ab7..0cb9547dcff2 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3075,6 +3075,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>   void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>>                  pmd_t *pmd, bool freeze, struct folio *folio)
>>   {
>> +    bool pmd_migration = is_pmd_migration_entry(*pmd);
>> +
>>       VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
>>       VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
>>       VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
>> @@ -3085,10 +3087,18 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>>        * require a folio to check the PMD against. Otherwise, there
>>        * is a risk of replacing the wrong folio.
>>        */
>> -    if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
>> -        is_pmd_migration_entry(*pmd)) {
>> -        if (folio && folio != pmd_folio(*pmd))
>> -            return;
>> +    if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) || pmd_migration) {
>> +        if (folio) {
>> +            /*
>> +             * Do not apply pmd_folio() to a migration entry; and
>> +             * folio lock guarantees that it must be of the wrong
>> +             * folio anyway.
>> +             */
>> +            if (pmd_migration)
>> +                return;
>> +            if (folio != pmd_folio(*pmd))
>> +                return;
> 
> Nit: just re-reading, I would have simply done
> 
> if (pmd_migration || folio != pmd_folio(*pmd)
>      return;
> 
> Anyway, this will hopefully get cleaned up soon either way, so I don't particularly mind. :)
> 

If v3 is needed to fix Zi's comments (commit log improvement), it can be improved
slightly based on David's suggestion, to avoid another nested if statement. Otherwise,
it's fine since it needs to be cleaned up soon.

	/*
	 * Do not apply pmd_folio() to a migration entry, and folio lock
	 * guarantees that it must be of the wrong folio anyway.
	 */
	if (folio && (pmd_migration || folio != pmd_filio(*pmd))
		return;

Thanks,
Gavin

