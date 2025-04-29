Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B0021325A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938344; cv=none; b=rny3+yHLI+1lZcJ4j28robQxFTWQ+NSvW/cVlg380+X5Glytgt+9XVGRUgGzA2aEMLLDGzaqE97Lv0sqFCwo07LHI7kAuDkHEltDXzAtXUY8PdrqR6Ud9CC8lf46y9dNs1D/evjmm29K7MKVSuuEk4giblz4EXIF4ub0T7bT1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938344; c=relaxed/simple;
	bh=OpM87YfriGcf1VS0gitgANL8zRL4GYfHhUTngxd3Smc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GCstm+GYx+z6RNx3IVuyy+TaddwEpj89Ubge24Bk8NQ7cXT9u0x4HcOy9fX4tysQqytBEFbsy9/kZhGGadh6tY1tHrlarcziPOs3Nht46HzswiYJvB/rIKINvDKvGXEyz7KtC4xp1EHSGmDHic0hPMj8yJypgW9rU+Qfv+Xev9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BlFo7grg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BlFo7grg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745938341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FPXFneTqSSB5zuiDtZbajOXUg4v3b14pcP0NzGs1q3k=;
	b=BlFo7grgKClfG4iFnmRv5yvjgTfmcob1QsrggqOon3/1Uk9C5rIb3TyRrejgXBZ1l7jn/Z
	DCJVJ1ECRpdLJOceC5aEuLb/TnlreeHQj9lAR+6AxS9oJuKR0/lb3SZ8RKDqGbdrGO0Tpx
	Ag39mQCSu0iR7P7cG+9gFDlVQTttGcg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-1m7UKrdxM9W_iF7cldmpdQ-1; Tue, 29 Apr 2025 10:52:20 -0400
X-MC-Unique: 1m7UKrdxM9W_iF7cldmpdQ-1
X-Mimecast-MFC-AGG-ID: 1m7UKrdxM9W_iF7cldmpdQ_1745938339
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a08a1c0fc5so548399f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938339; x=1746543139;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FPXFneTqSSB5zuiDtZbajOXUg4v3b14pcP0NzGs1q3k=;
        b=Vyig/TsWiC6egELj1ujV0OCdvZDxnP4g3GNjK8Aa9RQSNHzUh63hTfO0R9Je/XqDnd
         ZqMREhO0Bo1HAxXwQR08TDjc5yAh7Ctpm8TnUbe2v5a4bCc8TkSPqdy4U5YmQD/dofiH
         UeIQBld9CD8MdTI8DXUhqPKV9ZiNKeY6Fmc+4N8NIPZngKTWhHzN+sLbMdUYobGrs9Dp
         xYU1Ps0YHf8QpWqyeM25l03mqGAfEvhi4X4DUPmwv+L+ma8Mm/XeHPTMGeMC434Ht6XZ
         wQGW3R0XKy1nBfKGQpOFIrxTmVMo2vjbkhhGhGGE/A8AeiXTFGZsheWw4uLGqzKP+PX1
         pXaw==
X-Gm-Message-State: AOJu0YyWoQY/0J8y43uw4FXJ6R9QMxaAeOU16OfPoQLXnhoCaj/P/w60
	UEZVDxKHsimdo+DXr9Rw1N5KWHWpPIVma3RvaVu8p1k+jtbefUbNMKElLSX7G4AxBLljUIIMw/d
	7iTOBuFtrDC5WctYM9wAWp3MwcI2D6EIy3t1TAdLzca2xWyU2gGPPjdEpaN6HdR4w/ie8ezlO0E
	I=
X-Gm-Gg: ASbGnctIEbixCzdaX/k1C0bHX2DPUap07+DUsnbakSFyVmZBXBtC+9asUrjN+pCiD60
	E4migQTulO3HRCoYIubUkwRdJR2M4ePR3mh8LEQ+MNZE19RscuBxe/hKqInu/wdxvuY0MxmxJMv
	1VwYMLo/9oSJwhp+aU9v5qDypMa7ENPE6r11TqJC4jCHuldV/gaMsPU0EtL/Who0eH4yWLTOBJu
	3vjpfuzyD0lEr3zaJTTTOWUoAGbFth5GNpHdY5TQEy5S4wnexOaQoCyDmilJ9lUMlgzM69Pz9tr
	+NcWSzVhRNp8/K8Ckl8eFbBiGZD2TbGAsIiElklz6Io7fgDRWOlsiXVi/Pbahh65lWE+2Z4nxn4
	OWDG+sQlDLwtSou97iK2OpedmWyBQibHGn2vJr50=
X-Received: by 2002:a05:6000:b4e:b0:39e:cc5e:147 with SMTP id ffacd0b85a97d-3a0894a1aa8mr3382386f8f.55.1745938338771;
        Tue, 29 Apr 2025 07:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFknDt7idMQFn49+Vd3SM9PGLfuRRnsX394KMwyFKL9XgO5i1+VoMX9a1FE1wpCoHhmRxPebg==
X-Received: by 2002:a05:6000:b4e:b0:39e:cc5e:147 with SMTP id ffacd0b85a97d-3a0894a1aa8mr3382368f8f.55.1745938338407;
        Tue, 29 Apr 2025 07:52:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8da58sm14299217f8f.15.2025.04.29.07.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:52:18 -0700 (PDT)
Message-ID: <ef317615-3e26-4641-8141-4d3913ced47f@redhat.com>
Date: Tue, 29 Apr 2025 16:52:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm: Fix folio_pte_batch() overcount with zero PTEs
To: =?UTF-8?Q?Petr_Van=C4=9Bk?= <arkamar@atlas.cz>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org,
 stable@vger.kernel.org
References: <20250429142237.22138-1-arkamar@atlas.cz>
 <20250429142237.22138-2-arkamar@atlas.cz>
 <d53fd549-887f-4220-b0d1-ebc336eecb9f@redhat.com>
 <2025429144547-aBDmGzJBQc9RMBj--arkamar@atlas.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <2025429144547-aBDmGzJBQc9RMBj--arkamar@atlas.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.04.25 16:45, Petr Vaněk wrote:
> On Tue, Apr 29, 2025 at 04:29:30PM +0200, David Hildenbrand wrote:
>> On 29.04.25 16:22, Petr Vaněk wrote:
>>> folio_pte_batch() could overcount the number of contiguous PTEs when
>>> pte_advance_pfn() returns a zero-valued PTE and the following PTE in
>>> memory also happens to be zero. The loop doesn't break in such a case
>>> because pte_same() returns true, and the batch size is advanced by one
>>> more than it should be.
>>>
>>> To fix this, bail out early if a non-present PTE is encountered,
>>> preventing the invalid comparison.
>>>
>>> This issue started to appear after commit 10ebac4f95e7 ("mm/memory:
>>> optimize unmap/zap with PTE-mapped THP") and was discovered via git
>>> bisect.
>>>
>>> Fixes: 10ebac4f95e7 ("mm/memory: optimize unmap/zap with PTE-mapped THP")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Petr Vaněk <arkamar@atlas.cz>
>>> ---
>>>    mm/internal.h | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/mm/internal.h b/mm/internal.h
>>> index e9695baa5922..c181fe2bac9d 100644
>>> --- a/mm/internal.h
>>> +++ b/mm/internal.h
>>> @@ -279,6 +279,8 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>>>    			dirty = !!pte_dirty(pte);
>>>    		pte = __pte_batch_clear_ignored(pte, flags);
>>>    
>>> +		if (!pte_present(pte))
>>> +			break;
>>>    		if (!pte_same(pte, expected_pte))
>>>    			break;
>>
>> How could pte_same() suddenly match on a present and non-present PTE.
> 
> In the problematic case pte.pte == 0 and expected_pte.pte == 0 as well.
> pte_same() returns a.pte == b.pte -> 0 == 0. Both are non-present PTEs.

Observe that folio_pte_batch() was called *with a present pte*.

do_zap_pte_range()
	if (pte_present(ptent))
		zap_present_ptes()
			folio_pte_batch()

How can we end up with an expected_pte that is !present, if it is based 
on the provided pte that *is present* and we only used pte_advance_pfn() 
to advance the pfn?

-- 
Cheers,

David / dhildenb

