Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69332C2580
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929332; cv=none; b=TmGRSj2u0Mo97NTp7YwFYTEPWBmYhH73HLAIsN8YHIpKiLLHfVySItpMA8O9hLl4RjLrQeGNNCgxoAmUn34/HMmmrfqJb59TBIAAE/4RDGFi+6l9OxSnVoE6xav3WDd9dfNqK1EcP8bRY/jIV9FiQbCeBQRrdAXc7DdeJn+rr+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929332; c=relaxed/simple;
	bh=VHMQOAapMPuhnJpM3dKwPYuNnsy0TZskQ9fzRnL4G4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QZQmiRuF3lNnk5BjkYhHt0CrLUpOed+We7YHxjxk78eVKltMcmI8J9xma3Y3aTzSR4I5cefLoYH3HLjrLQq8NRAakaRT6FsiKiVADtnd4dnj08l0mN1BdoU6w+44Za4auu/uj9WMI/puWPrhYCZQ3UIoozgvHlEIMJOV6/v/3uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RGuMoAl0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RGuMoAl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745929329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hu0T3YBPYeglvNoFV7uLeHvf/p7IaZ74RGzxo9in5d0=;
	b=RGuMoAl0s0UIoyGtqXav+VNEodQlBil0Lw77kNgXJO0HL1Wj+WZ3Im1+BhHfxbWGbEvXDZ
	2hUiUvQqj/QyUUV+7PH0apmYWVkf2pbLQqed9l5dBZHXSJeK3X8gMmU7rVPxUmPaWGWFv/
	DbX2IpwFCbuQ4Bly7kBZ4ybl7FfQlcQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-kXd-u-aDMKOB5InLBt0dSg-1; Tue, 29 Apr 2025 08:22:05 -0400
X-MC-Unique: kXd-u-aDMKOB5InLBt0dSg-1
X-Mimecast-MFC-AGG-ID: kXd-u-aDMKOB5InLBt0dSg_1745929324
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912a0439afso1752554f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929322; x=1746534122;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hu0T3YBPYeglvNoFV7uLeHvf/p7IaZ74RGzxo9in5d0=;
        b=BBMHH1ZARfPnQqcugqpqRRRHyn7Cz7D/HdBH15MmEU3CdV8fRZebBmEymm63KDMrdD
         AiR5hmZ03ipwWZjSdZun2H040T91alBlpjyJnfR+K3pkFRdwEQaHmg+nYWLahVnUqQBK
         8vwQfJqcGz6Q9EdmKebHyovWOiB4O+0lg+svJwbrpkT8CKD7QjS49B+l47l7nxNYyVX8
         S7Jg9aRBrHCFaNn+ZthsQIskKYTLLrlaLhOkXc1GumaLT7PS62fevT8s8JGFPv6HXvNu
         kmxbwza6g8IRPplUZ7a5XZipb0zDSYHf4y61EsyYDtuauFqYRXIpNYYrEaovhvQ02brW
         qU1A==
X-Forwarded-Encrypted: i=1; AJvYcCXMm+I/5pCcLeF6lh2TxpILj4pUkSDQNnjzfKKVOC0jPwKwyvqrlAosJlcjLzoFtudrLnls86EN4lDBR5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiCWz7DK1GOhW6XbZquLOJGnl435HJTBZczO3BkiLCSUU6jQCz
	zfzZi0ftk3PtL7rqp/j7BS8QzKMh1IzqggQOS4PH8BplreWcR9wtsH09beSKTRsdigSc6+pBnjp
	nBCmHboLEIBu4NKKayRmSH/PvGPPnSrmfXJvgqT+ShrI5eFvpVE7CjwysqUUQFg==
X-Gm-Gg: ASbGncuST2icVfSRSPzQka2iegJEVcfFaaip3JKy4AwQICHszgC0JfUA9zkrn+4WC2X
	+nQaJfWqTde1gvP1EJLYdtwxRUo57RPznXdcrgiSBK0DQ2CsCa4z3cvyEcoEgsi3X0SyX6xHYvi
	E1zgqMs/ewoTRVvm30Gwipvz0FnBC79EqWE2gO5MrVlaGtMRxD5Z55A+D/HNqJEJibPoDtZC/y6
	tpypzZ0y0ttG1RIiBYbKpyi0jwvI878DzXrHa3HQ5N8DbSUy4cDt9TfrmnQle10Y8rVv+Z6HOrO
	b4f3J8bYlOpMZyedLat5uA9KXG8VZD1Nm1QkaV5goCD2HZfFbgd99uHCYENXCzkUjSPtl1CziF+
	a2yPNUYyZrGH8tdfF2BHRPM2x5C5ZcyipWi1z5f4=
X-Received: by 2002:a05:6000:1ace:b0:3a0:880f:1a87 with SMTP id ffacd0b85a97d-3a08ad7da15mr2171470f8f.51.1745929322496;
        Tue, 29 Apr 2025 05:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhAWUDNvU6wR5dToGt3Tw2/yFm5KjNYTdLqDXuXRRDZf9Rh68gGKUKiH3JzrsUo/LsrkIA5g==
X-Received: by 2002:a05:6000:1ace:b0:3a0:880f:1a87 with SMTP id ffacd0b85a97d-3a08ad7da15mr2171448f8f.51.1745929322113;
        Tue, 29 Apr 2025 05:22:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2386sm191282065e9.14.2025.04.29.05.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 05:22:01 -0700 (PDT)
Message-ID: <116d8920-6154-4ed1-946a-887cfe084fe9@redhat.com>
Date: Tue, 29 Apr 2025 14:22:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] filemap: do not use folio_contains for swap cache
 folios
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>,
 Chris Li <chrisl@kernel.org>, Yosry Ahmed <yosryahmed@google.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
References: <20250429114949.41124-1-ryncsn@gmail.com>
 <20250429114949.41124-5-ryncsn@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250429114949.41124-5-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.04.25 13:49, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Currently, none of the folio_contains callers should encounter swap
> cache folios.
> 
> For fs/ callers, swap cache folios are never part of their workflow.
> 
> For filemap and truncate, folio_contains is only used for sanity
> checks to verify the folio index matches the expected
> lookup / invalidation target.
> 
> The swap cache does not utilize filemap or truncate helpers in ways
> that would trigger these checks, as it mostly implements its own
> cache management.
> 
> Shmem won't trigger these sanity checks either unless thing went
> wrong, as it would directly trigger a BUG because swap cache index are
> unrelated and almost never matches shmem index. Shmem have to handle
> mixed values of folios, shadows, and swap entries, so it has its own
> way of handling the mapping.
> 
> While some filemap helpers works for swap cache space, the swap cache
> is different from the page cache in many ways. So this particular helper
> will unlikely to work in a helpful way for swap cache folios.
> 
> So make it explicit here that folio_contains should not be used for
> swap cache folios. This helps to avoid misuse, make swap cache less
> exposed and remove the folio_index usage here.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   include/linux/pagemap.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index af25fb640463..1dc3416a9c0d 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -935,14 +935,14 @@ static inline struct page *folio_file_page(struct folio *folio, pgoff_t index)
>    * @folio: The folio.
>    * @index: The page index within the file.
>    *
> - * Context: The caller should have the page locked in order to prevent
> - * (eg) shmem from moving the page between the page cache and swap cache
> - * and changing its index in the middle of the operation.
> + * Context: The caller should have the folio locked and ensure
> + * (e.g.) shmem did not move this folio to swap cache.

The "(e.g.)" looks weird. Maybe "ensure that e.g., shmem ..."

"to the"

>    * Return: true or false.
>    */
>   static inline bool folio_contains(struct folio *folio, pgoff_t index)
>   {
> -	return index - folio_index(folio) < folio_nr_pages(folio);
> +	VM_BUG_ON_FOLIO(folio_test_swapcache(folio), folio);

Likely you want VM_WARN_ON_ONCE_FOLIO() here.

> +	return index - folio->index < folio_nr_pages(folio);
>   }
>   
>   unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

