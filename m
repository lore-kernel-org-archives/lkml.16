Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8A6273813
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065771; cv=none; b=U0xIsw7yvVTOnEzQKs+mda8rKU6qHxOjbeHjj5VTv2fMdFRBsnVwsHbqjxxSZzBUlei8CBhcU6F7tgHcJj9Jz13FZSwjjxV3A5wz91flXJGtKz9g1CEheGMHwYlxE+YG/AkdpTr8/En8hJbihDTxmP68vIWpy9Q2jOkIwojHdVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065771; c=relaxed/simple;
	bh=YuUmC8+91Y1YC/MNS/o4nSYQYgzXWQWdbl2xiX2LYVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APYOgBjF/57nCaOwpVhcTX+dJSHbKlvjqMSFxfGawz7lcfmFLWjXzQC9vt9gVdeLYH/v6rv9y0Zwrm8w582J0is1sc0NZegqVQDx4+qtv0PShGPbmDyrEw9xLmeqdIDwuOg9zi4ssHd26VrwTGSjsN9suG8O1TgIuTt3f1DM8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HDEQwkoz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HDEQwkoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750065768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UBp58qTRV+cYxQwSpwgzVisxa2vKGUXxS+M1OQFGddU=;
	b=HDEQwkozWCmRQhnwlWQn9kTUohGNjYGMOdYH3iOI7puVrtdogBt1TAMhCZx8MULO5A2DJx
	53rbeeYgE9DDviyqbDFsFvGyQlbmGAhBXAb1GJ2K0Q0G23L7fZtTO+640M2fin0augDHc/
	ZtTDU6lW6500pUzTNwg29y9mAmAj2l0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-EENrWepbO82ZgY7MhSc34g-1; Mon, 16 Jun 2025 05:22:46 -0400
X-MC-Unique: EENrWepbO82ZgY7MhSc34g-1
X-Mimecast-MFC-AGG-ID: EENrWepbO82ZgY7MhSc34g_1750065765
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f3796779so2886249f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065765; x=1750670565;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UBp58qTRV+cYxQwSpwgzVisxa2vKGUXxS+M1OQFGddU=;
        b=nUP6y6RDUe8WXZDzAmfF/2NiDQDT9rbPCVh0sCnay7EBb/249GSQOEHqbwGuVQ5t8+
         mCcI8jt6eeq23/qmu200DR9BXWucvCEXndiEbFVMezjQ3Z8YSgIPeQ1ZwjbCnwYRqcMK
         03HhOQVsVSaJAy2/3p5Ot3BkTu35YDo6QbsWc21+LZcqfbuK+cKo51WFEf4K0o5vazKM
         xzhsaiF1tOiRX9BUbekGZieWVFVUGnDW3RYG+RwRY3XhclJWkloPa2HjMyaudjEE8h5+
         Gy9xCmIHitolazJXKYImw782ctXWKMviTu927W8Q0SGb8bs/PDPXaX2MQ7mFuYoZxzzh
         JCjw==
X-Forwarded-Encrypted: i=1; AJvYcCU1nFmmjnDqR4YfDYs+4JDjK7u88UIYAuK4n7N5Tq0T27ikCWmsuHlocfVoNUedT5zwMQJTjMn1ilridKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE4E3MOGJb8MtW+KNPpO8zC4Qlel03/FO90RbVhJ5+bt3rvJDZ
	Zvvi9kPiF5Yv06m/gu6K+M8IoyS1rBSHkvfC0WbLigAUK964xcdC5NtMtzkWptqF/FRNffmDHCN
	e4gmhdvaQN6lF4sQ0fEgEblFZAktmlEolLTVOKKya6BhIC8gZgA0G5TqnBbgrnsmLZw==
X-Gm-Gg: ASbGncu+SHeML4r/8tVBwJlgyq66vswxgyxvqdvrXDg9ubfI1ykug37vfr8H5bF3mL5
	flHg4ABbU6mrQVScZyjbLmTIDj/BGoVQzQfMt7HinlnloQwkxsfTYJqiibkei5jU3izSgEkEgkY
	2QooGJpBxNY07wLndG8EJAO7oAb+USztyeXXmswhh0QB0AGqDDQA/Vfxoq+Mwq5neEIVfvm1gOV
	wOpEiprtxWVsXTBoxnU5dB1ixGPK8EKVZ3ZMlCjaO+ygL/Af6hFhdwAzVr+HmXMqZTPV6m3GeOD
	f/COnQxXU/cegKJjCNrxPBuUDSqwOWGi10ok5azqIzJNdckUfX8ehvjTaS+LPEIOvBKsbTo/Ms1
	4VtAv+ULAJH4KFwB6uzggbwKL+8VWuci57x9F9Ahf2kUedRI=
X-Received: by 2002:a05:6000:1888:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3a572e99690mr7512754f8f.52.1750065765253;
        Mon, 16 Jun 2025 02:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVgWvb1lvlhTo/Z1qWtDSjFvFI6TANhcAEBmOLtt7hjJLoV4KTqnzo7eEfQlPPBx3hv/xN6Q==
X-Received: by 2002:a05:6000:1888:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3a572e99690mr7512723f8f.52.1750065764846;
        Mon, 16 Jun 2025 02:22:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087a9sm10713185f8f.55.2025.06.16.02.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 02:22:44 -0700 (PDT)
Message-ID: <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
Date: Mon, 16 Jun 2025 11:22:43 +0200
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
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-3-osalvador@suse.de>
 <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
 <aEw0dxfc5n8v1-Mp@localhost.localdomain>
 <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
 <aEychl8ZkJDG1-5K@localhost.localdomain>
 <aE075ld-fOyMipcJ@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aE075ld-fOyMipcJ@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.06.25 11:07, Oscar Salvador wrote:
> On Fri, Jun 13, 2025 at 11:47:50PM +0200, Oscar Salvador wrote:
>> Maybe it's because it's Friday, but I'm confused as to why
>> do_pte_missing()->do_fault()->do_cow_fault() holds the lock while do_wp_page() doesn't
>> although it might the file's page we have to copy.
> 
> Scratch that, I see my confusion.
> The first time we map the file privately, the folio must remain stable.
> But if we already mapped it privately before (R/O), and we write fault on it,
> we don't need to be stable (e.g: uptodated).
> 
> But I think my comment on hugetlb_no_page() still holds, because
> 
> hugetlb_fault->hugetlb_no_page->hugetlb_wp
> 
> would be similar to do_pte_missing->do_cow, and in do_cow we hold both
> the reference and the lock.

Well, there is an important difference:

hugetlb_fault->hugetlb_no_page->hugetlb_wp

already *mapped* the pagecache page into the page table.

See
	if (anon_rmap)
		hugetlb_add_new_anon_rmap(folio, vma, vmf->address);
	else
		hugetlb_add_file_rmap(folio);

So at that point it would be "stable" unless I am missing something?

So once we are in hugetlb_wp(), that path much rather corresponds to 
do_wp_page()->wp_page_copy.

> Were we might not need the lock is in hugetlb_fault->hugetlb_wp, which
> would be similar to do_wp_page()->wp_page_copy.

Exactly.

> Of course we will need to take it if it is an anonymous folio because we need
> to check the re-use case.

Yes.

> 
> So, it gets complicated because hugetlb_no_page() needs to call
> hugetlb_wp() with the lock held in case it is a pagecache folio,

Per above discussion: why? After we mapped the pagecache folio, we can 
unlock the folio I think.

and
> and the same time hugetlb_wp() needs to take the lock if it us an anonymous
> one for the re-use case.

I think it hugetlb_wp() really only needs the lock for the anon folio.

-- 
Cheers,

David / dhildenb

