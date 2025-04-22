Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DAE190472
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312462; cv=none; b=RSjXVrnxUh6kDWAmhmi2AqZwrH/NBM4k73SVy+IGSvHbl61U/BZH6RFaaeq8m6RKpehn1LYPZpCs+QKKoLaBcStjwW8fzzpHlo8HW7TgOtY2QKKZv9PsgS2cNgzVuhFCDcbTQ5Rmjhjjo1UxvBmkUEA07vQnustXAVJv86yk+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312462; c=relaxed/simple;
	bh=iDdKMfbRJ409wLZh71y4yPa9Am7X3xalGJl1xtAQ7L4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCc3t/i922ttrOHNy+62a+SUZ4+Yz5cytqoPCXTBN5C+mIWdfkf6nXUZ4aUfccqY5dBkUR991WdHSD8pjIyMBC3jicK1p7cpeEw5Vu8fZn64bOyd+JgX1XnT87oq4FW4Bn2fTbnsICsFjSep/R9atvKbsBuZkON2A8SAYbDz86Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ULFNkev9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ULFNkev9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745312459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PeC8CoS72COYtWeIJb6KnHGY+h/RmMzZnwToU8D/UBI=;
	b=ULFNkev9uA7VFnOo5VN399Dpem0sjOqX9fdzmobToFYA7vmEen9+vDPajoWeTsloNt4Llp
	zz1AMKNjp/7S9iq9V73TeHqIOCBlVBR5TIoDzczN6caqQsuNtYEBgd0+NkxEbYoNlr72xe
	3eO+dKhsAVBZgstPAAZX3ziDuPn//Fc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-PokFJ9RtPhG2u8t3iFQAdg-1; Tue, 22 Apr 2025 05:00:53 -0400
X-MC-Unique: PokFJ9RtPhG2u8t3iFQAdg-1
X-Mimecast-MFC-AGG-ID: PokFJ9RtPhG2u8t3iFQAdg_1745312452
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so2186267f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312452; x=1745917252;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PeC8CoS72COYtWeIJb6KnHGY+h/RmMzZnwToU8D/UBI=;
        b=K6cEGr7gCIkVi91ItSxsKJdJ5F5UeJuatJX+3c0Hi58FldWBzySk/zhmB9YMMvETEv
         0I6pJpEmjuittJVJOSNYIZG2MMrjfOoXgwfdPJbhubzqtyFlvyW2r3r8lRW1iJ/rA1US
         Xi/XnQOx+mMBK/DaaxrhAgvNFMYEqTfAMR6Qxlb11mCt9teMd9efKhhSYcxiEgo5i3eL
         Ro/WOoXHYM7bH3U4uosVvNolYRybEjrcGkeKuscdwWKso3YNSs62/sPzbV+NBx64oI3h
         f8KMz99t9dR6frZIPlTGrNYI+iwDcNYMgyazPaZc4MlSpj9eQrjLG3eUwAz2hLosV70t
         YL5g==
X-Forwarded-Encrypted: i=1; AJvYcCUdU/5ZpThanVZ0ZqTkP4hYyHINEmcN+WluQM3kO2rT4mzqjm0yhc3ce0RfvXHMVuK8amsH7eiNIxSA/Gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTn59KAp+v8sDPvqMsqJRY827hf8KQaE1PVv0jJHw4NDfoDo02
	84NeqIlhGluAoIVcGDaV0vlyBGIY6jc3aeL2pB4xMHtcMgMDGy6nntjzitK30Bwc5kUpud8Um1F
	za5XFDsk2Iyya37HX8nxJxvuQNg3O72QN6ng3esexw65sFoUnoQHUyUW4TS9zzQ==
X-Gm-Gg: ASbGnctYqrZkpyT+EPM9qqy3vRwM2aSTiCxmaZ74EQWi7ALJFsuBf6z0vZbNj0oFF+x
	MODlsdRBObhqH1yOj891QGXUtLq4ZaUVaC0mUfi7AQ1rjsukEQlBV1Jh3+Sb6j5UWoXcyVrnoSt
	wP0eDfA0uEpQ5CkdD2pPPLF5ZQRQdASRi/ZjWdZijgzdlY/5FXUVa1bddXWFRF9MynD7AqElg4b
	bCwQAJYUaPIqnFse6VpYrZb2mdFKsuUn+78zwFJDfATYdLq+Rm6s/Lgt3AnLcAAxt4qy1/jscfD
	2rzzta0ha4IX7HamVzrP0hRc6tE5Q+THdHjIWSKC2U01GIEZCSvvs1maMYT6+O8KwdP0bhzbIJO
	A8yezKamPuBJ/59C+tnt8pezgFPbyhF800f4e
X-Received: by 2002:a5d:584b:0:b0:394:ef93:9afc with SMTP id ffacd0b85a97d-39efba4610emr10341244f8f.18.1745312451887;
        Tue, 22 Apr 2025 02:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB9+04DDmg62/UadGEweF39yPC0h3QHPDKpufaBrVoV0pf3PXmlVUQRRp2IV+QGXxeigl/cQ==
X-Received: by 2002:a5d:584b:0:b0:394:ef93:9afc with SMTP id ffacd0b85a97d-39efba4610emr10341214f8f.18.1745312451510;
        Tue, 22 Apr 2025 02:00:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf20sm14251519f8f.48.2025.04.22.02.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 02:00:51 -0700 (PDT)
Message-ID: <bd6e4a54-369b-4b79-bc4b-10a583a1c3de@redhat.com>
Date: Tue, 22 Apr 2025 11:00:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mm/hugetlb: Convert use of struct page to folio in
 __unmap_hugepage_range()
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
 <20250418170834.248318-5-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250418170834.248318-5-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.04.25 18:57, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> In __unmap_hugepage_range(), the "page" pointer always points to the
> first page of a huge page, which guarantees there is a folio associating
> with it.  Convert the "page" pointer to use folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---
> This is a new patch added to the series based on the discussion here:
> https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m2b9cc1743e1907e52658815b297b9d249474f387
> ---
>   mm/hugetlb.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 7d280ab23784..8177a3fe47d7 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5840,7 +5840,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   	pte_t *ptep;
>   	pte_t pte;
>   	spinlock_t *ptl;
> -	struct page *page;
> +	struct folio *folio;
>   	struct hstate *h = hstate_vma(vma);
>   	unsigned long sz = huge_page_size(h);
>   	bool adjust_reservation = false;
> @@ -5904,14 +5904,14 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   			continue;
>   		}
>   
> -		page = pte_page(pte);
> +		folio = page_folio(pte_page(pte));
>   		/*
>   		 * If a reference page is supplied, it is because a specific
>   		 * page is being unmapped, not a range. Ensure the page we
>   		 * are about to unmap is the actual page of interest.
>   		 */
>   		if (ref_folio) {
> -			if (page != folio_page(ref_folio, 0)) {
> +			if (folio != ref_folio) {
>   				spin_unlock(ptl);
>   				continue;
>   			}

What about something like (keeping in mind that I suggest renaming 
"ref_folio" -> "folio" in previous patches)


const bool folio_provided = !!folio;

...

if (folio_provided) {
	if (folio != page_folio(pte_page(pte))) {
		spin_unlock(ptl);
		continue;
	}
	...
} else {
	folio = page_folio(pte_page(pte);
}

...

if (folio_supplied)
	break;
...

-- 
Cheers,

David / dhildenb

