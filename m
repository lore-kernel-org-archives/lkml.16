Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BFF285CA4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167743; cv=none; b=dID1zeH/d2SigN/obPFTfm2trN/WHAsJnqqqDWipRJQ/wq75gFLTq/Fj8J6SMmwzChxad2NS+37gSvZymNOWofoS8C7mvYsIEcfUWdYDgYbYAYtqbFdnWI52ZxILMDgaMDf/YQYGJS2nTRs7dOg3rdPO68rVu1C5WPQlTSY74pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167743; c=relaxed/simple;
	bh=/Y0beOkufa3CPisrsUBUp1MF/R2HvTuEKCJrzWKHPhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCrVUDildWPkReeHkisgg2AflbquNgGOIKT4NhQNZTFXfyZR7X7dfJqsoVLFjbJFzYboT1d/0TNAGpo0tFdlA7Wsy2RfFy9ekj7vsDOxOSID/gXEZjVoWfMdONKd8NdcrZIu/j339NXZ/p1lPnlksBC5faNYRsVquqUpy/RSG1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aY8atCwa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aY8atCwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750167737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IBz/4Fc+xxNxYVYuCY2En4vi6g85xQUlsh+ieL2TrQQ=;
	b=aY8atCwaQ9GPhb5B+6A1uJaXyQ2juWpSf45hcXYewWVFI4ztJ+9L60SoCfd4DZFfYbuh6d
	0JrGUayO1lNt6/OASL0IALhPpzpobaAqy9kQbivv7d8MiHsndJUi9Fdqykcov9eVoBcPoF
	eLhDdjXD98p7+3o+WIfTDv9R+nuzHNQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-B5yL_7k-OcKelOIJGqfPBA-1; Tue, 17 Jun 2025 09:42:13 -0400
X-MC-Unique: B5yL_7k-OcKelOIJGqfPBA-1
X-Mimecast-MFC-AGG-ID: B5yL_7k-OcKelOIJGqfPBA_1750167731
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso2772310f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167731; x=1750772531;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IBz/4Fc+xxNxYVYuCY2En4vi6g85xQUlsh+ieL2TrQQ=;
        b=I40u+RKD0huo7z4FrFrIg06PSfYSpURNiOD5Apx6Lub7ZlfIVNP5uCuHlTE1Eh5cge
         c7Mj7JJ0S5ePgPl0y3VP2vqKUCrjVMbf64jFoYN+zlBwnFpqCy7jg4BPJg0pf2qtciB2
         JShtixxSEpSKRA9OZpT0TnTXZ8qGX77tVZ0NBr127JpqOr/wYDjGPSMQ+QTZ6ZkshXXj
         7PwaQ/PqFQH2lsakNzwPglg5sa4Fpx4x23bgUCU3sKw55gFIqv5OHuKPANOSWV8NdBsj
         fr95oVBQeubOSH8c5rYaeWB92iOEec+B7NxesFVRwjdppemxPFDybBRolv3Hz6xUlj6K
         tZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAxPiyCRMg6dJLk6sEV86EYu580iKWHjGRf97FwlX4kMBg9eP7FellIyFs4+8v+38XeZLpGBMHbkSZPdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMaA5/egXjltP3XlBqg+PPAGWEY4HEPnPCsbW9bNve6kg5DKu9
	AnlrgqnQhZx9Mas9k/oqYdkfPX+7SrYeZ7G2rNDAqx+5FwOV1w1FDXz6ksMqGP35EGutuMRudeB
	LM7Cqa7ixKzk88QQR40NqovPD9jGNX73eqB31x474njiIGbNzQH5A4zElPe4BxSg40w==
X-Gm-Gg: ASbGncueTTiuLMmwNo2m0KeSzUa+q0kzNeEGwKwz7Jz+hegCaVdCnZnqFWwQu/TkYDK
	ZPJsjEIlp/WMA6+bL+6HqqfePd2SuK669ixHILxLcIma2zze6oChv6YuY3f2W58x7M8SaeQWNrW
	D1OwPCUsUjgaYO3ikGcDdz/sr7w+P56Y3rdM2AyJoScsbhgl5agKs57TLBChYIVJYvV3a6gVD01
	ZFXNMIckD83OTvmBrxWEeGTkL2hkdp4v/19UE5ppop9EOKqFSCdjh5FTJ8VI4OcOr4bVZia9JwA
	iXLcjGK8JvQIvnt6zZA57p8XftlNkugrvvCue0gB23zVlNbrf0PYjeOtAVL84Z/t4JhdUycYm71
	2lP3mo/1B6GFSjgrYfac1e3KRGAssVrlr0aASJrd7LrLN4Fc=
X-Received: by 2002:a05:6000:2582:b0:3a4:eda1:f64f with SMTP id ffacd0b85a97d-3a5723a3b64mr9254884f8f.30.1750167731261;
        Tue, 17 Jun 2025 06:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5D6MGsYdZnB4twmZZsAXJsOylrFYx8+OdI153lho27uAmDXRM/hBZLCJzpTbzu57HtDye8Q==
X-Received: by 2002:a05:6000:2582:b0:3a4:eda1:f64f with SMTP id ffacd0b85a97d-3a5723a3b64mr9254862f8f.30.1750167730888;
        Tue, 17 Jun 2025 06:42:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531fe8526bsm145099285e9.0.2025.06.17.06.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:42:10 -0700 (PDT)
Message-ID: <dac7aa4c-136d-4a01-9601-7bc0314a98a2@redhat.com>
Date: Tue, 17 Jun 2025 15:42:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, James Houghton <jthoughton@google.com>,
 Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <aEychl8ZkJDG1-5K@localhost.localdomain>
 <aE075ld-fOyMipcJ@localhost.localdomain>
 <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
 <aFAlupvoJ_w7jCIU@localhost.localdomain>
 <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
 <aFE9YTNcCHAGBtKi@localhost.localdomain>
 <11a1d0f7-ef4e-4836-9bde-d7651eebcd03@redhat.com>
 <aFFZtD4zN_qINo9P@localhost.localdomain>
 <3eb8e1e2-5887-47ed-addc-3be664dd7053@redhat.com>
 <aFFbIXLHdYbM3ooa@localhost.localdomain>
 <aFFknpsmfb-Sh7xT@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFFknpsmfb-Sh7xT@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 14:50, Oscar Salvador wrote:
> On Tue, Jun 17, 2025 at 02:10:09PM +0200, Oscar Salvador wrote:
>> On Tue, Jun 17, 2025 at 02:08:16PM +0200, David Hildenbrand wrote:
>>> folio lock is a sleeping lock, PTL is a spinlock. :)
>>
>> Lol yes, overlooked that totally.
>> And I also saw the comment from mm/rmap.c about lockin order.
> 
> So, we could do something like this:
> 
>          if (folio_test_anon(old_folio)) {
>                  spin_unlock(vmf->ptl);
>                  folio_lock(old_folio);
>                  spin_lock(vmf->ptl);
>                  vmf->pte = hugetlb_walk(vma, vmf->address, huge_page_size(h));
>                  if (unlikely(!vmf->pte ||
>                      !pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), pte))) {
>                          spin_unlock(vmf->ptl);
>                          folio_unlock(old_folio);
>                          goto out_take_lock;
>                  }
> 
>                  if (folio_mapcount(old_folio == 1)) {
>                          if (!PageAnonExclusive(&old_folio->page)) {
>                                  folio_move_anon_rmap(old_folio, vma);
>                                  SetPageAnonExclusive(&old_folio->page);
>                          }
>                          if (likely(!unshare))
>                                  set_huge_ptep_maybe_writable(vma, vmf->address,
>                                                               vmf->pte);
> 
>                          spin_unlock(vmf->ptl);
>                          folio_unlock(old_folio);
>                          goto out_take_lock;
>                  }
>                  VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
>                                 PageAnonExclusive(&old_folio->page), &old_folio->page);
>                  spin_unlock(vmf->ptl);
>                  folio_unlock(old_folio);
>                  spin_lock(vmf->ptl);
>                  vmf->pte = hugetlb_walk(vma, vmf->address, huge_page_size(h));
>                  if (unlikely(!vmf->pte ||
>                     !pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), pte)))
>                          return 0;
>          }
> 
> Hopefully we can do some refactor here, because I quite dislike the
> unlock-lock-retake-unlock-blah cycle.

Yes. As an alternative, keep locking it in the caller and only unlock in 
the !anon case?

-- 
Cheers,

David / dhildenb

