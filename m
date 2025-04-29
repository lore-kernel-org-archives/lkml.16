Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A4C188A0E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918154; cv=none; b=f7147UMM5gkv6efaczIH1J4ZxYxJjNGqwiMjhE6vj6obDvtgCzjRxbRBeSk7Fb87f7QT7cVp1YPpEHp9tD2d8KFFpIhtQP318RSHcMg3sr9xQaLBK5x2IPOv0XkWlHrgJjQrzf+UMdJHEit677PfkhuNWRbnH9E8FjkRcL7jeNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918154; c=relaxed/simple;
	bh=CFwZSRVl87ARqhVIfx0NdiuN7cVQpjM6W++8udN5b2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGjGTeKND9AXcfY8dOCU7VUch8jg+G2+mSVrNV0DLc7/nbtq53zXsc7OsRJ5wkH3gipRMX1/TMrLhmHXRb2nK0QnJ8/IV2Tnvl47hZWPkl3C7smZIPR6oqrEmFsYpJFmQFP5Sa/D2Qo9nHl4jMEUkHiEZg2Z8uyWJjivnOFO3TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IpJ9fyum; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IpJ9fyum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZcwgSF8VPBQ4GrzqeTBGO0gBdExjzBeKM9YAxqzWWgs=;
	b=IpJ9fyumyvCK2kK4Du250q88eKL8Auy3aXdS640xZoFiUUC1hcPtwj1u+GV2UFKsn2wzD8
	DFYUfio2dJL+oJF7Py6STz6ip6gKvxgVCE+rTp/xnN7G6yq6gOdoFihXyOQreaBBo2+Xdx
	T/F3GPxpL3P8eBjL1Fa9oT8kabHU4qU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-ixsxt5YfPKSycwGhKiEu4Q-1; Tue, 29 Apr 2025 05:15:48 -0400
X-MC-Unique: ixsxt5YfPKSycwGhKiEu4Q-1
X-Mimecast-MFC-AGG-ID: ixsxt5YfPKSycwGhKiEu4Q_1745918148
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso33350045e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918147; x=1746522947;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZcwgSF8VPBQ4GrzqeTBGO0gBdExjzBeKM9YAxqzWWgs=;
        b=LC3kznd7MCtXzaBbjnCvulPnh9CXSn8b3qOf4cCyGk8nKC7KNl1QbH1JmAcERrNqIK
         li/V4Y7bnCEbIjh0czYJ3Fo30JkoGWd7wpbY8eVRhosuC9OSBjWjryR4ybusFOWITO/M
         MFxSKqadQkAoO91Awbgdw4sefv2LOSHAVfq8ZWx5MlEB7eTaqsvE/LK/srWTF8fvvnMv
         XN8Xil6p1ft9QNIv8/iPIQkz2EooFa4Ei/apNJhmirluD8DO8jaFr7pGSOA3Hx9k3sen
         lEdKZHtUhrYc3r2srpBCZOVsydfUMuXJefyN1d23byR3hmUyp+EL9+fY3M5T3lu4mD46
         A5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVUJ5qVill/NPTR6arnpbX38BbUWnBZAo6rNFWJjveX+550gHnKuwPBtxKuQjD3oPrpRxQHFYKX9hKy0P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsT1vCq79S6yXgyV7SI7keCxsB0IZ3AN24+kQGrw+vN7YjzqiM
	r0GKZiVYsqynvMgeUr4asHSuuqcjm5x7enBu9xK2cUcJl5oCAcpTisT+TjeUWai1vEWoaXmtRji
	V7c3Do41w9sNCQ7U36/d3BsRvsZ/SEYGmcBMNJDYnwJyunEsvCvg8+Ws7aI/Zrg==
X-Gm-Gg: ASbGnct76pRq05MB+NaPG5ygXtRPc3mJ6Tvj6BkNea/yq/z8h7W79/2nhKo1J/hnGoT
	0vm8V85RBCdWvotaMmVyZCZVrhQuO64Ka2kLdsDUAyEnFlKhmdiABc8ES593o2T3kkIoDZioOQr
	yfQRe1aFm1GDc7H2CRuSL7lnVUizDMWIHsyfrySvHE9b5DTn7OQlb4XwBxcER6mhc6JBV4x+Mu/
	jqt/+d8G0YpvB6HmiS+efJulYy01tJ/SrMaSQA2ryzVxe/LaR6gDAO6pTtOcHF1COo7aNpbulgW
	evQckEOGAo0mwSjHmigeE49+dTt0H8bdP+dZluJIEkuuDpjen4CMdJfWPzPAW1O/y7ArEopZ5+f
	EjfDz0DjlBipLhEnGXC+Q9RZDNaTWs+tTAUjfjDQ=
X-Received: by 2002:a05:600c:1e27:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-441ac8eb188mr20551665e9.12.1745918147556;
        Tue, 29 Apr 2025 02:15:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELhiEp0lABCNLnJeW2eLuvjciUB25c0973dnzFKV0LJPmcTWuy7SPqkifmdzuBt3v5z/C/6A==
X-Received: by 2002:a05:600c:1e27:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-441ac8eb188mr20550535e9.12.1745918145671;
        Tue, 29 Apr 2025 02:15:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba34sm187785875e9.5.2025.04.29.02.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:15:44 -0700 (PDT)
Message-ID: <bbd0e5fb-ad47-4531-adde-c2c2ee2cef61@redhat.com>
Date: Tue, 29 Apr 2025 11:15:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
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
In-Reply-To: <20250429052336.18912-7-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.04.25 07:23, Dev Jain wrote:
> In preparation for patch 7, we need to properly batch around
> can_change_pte_writable(). We batch around pte_needs_soft_dirty_wp() by
> the corresponding fpb flag, we batch around the page-anon exclusive check
> using folio_maybe_mapped_shared(); modify_prot_start_ptes() collects the
> dirty and access bits across the batch, therefore batching across
> pte_dirty(): this is correct since the dirty bit on the PTE really
> is just an indication that the folio got written to, so even if
> the PTE is not actually dirty (but one of the PTEs in the batch is),
> the wp-fault optimization can be made.

If you want to add a batched version of can_change_pte_writable(), do it 
right away instead of just adding parameters to functions.

Then, add a simple

#define can_change_pte_writable(...) can_change_ptes_writable(..., 1);

So you don't have to touch all callers and don't have to update the 
function name in comments.

-- 
Cheers,

David / dhildenb

