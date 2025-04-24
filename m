Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBC821CC70
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526488; cv=none; b=nPgjDW2EUPI/CREv6om4egkZMZVAOEAXza30Fo7zEhAipzl855noeMHpLBFkOOjyuPrlQKKRmzoa2ajieIn5hEYeC/hotRH5ziqqHCPMs2EGeREckb3VJi0gAwUxL2dF+Z5jlavt6COpMr/0xm/Iil+6/FMpEw1+QE8mVHeN/Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526488; c=relaxed/simple;
	bh=mMRMW3iPpRsq3fCbsmaWtl8N04EKnIU29dk5hftRZHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUh61+isQgIKOlaeRG66cJBK2zIklwgrOF42kdSo6pMNvcRL4G3RtIJI1LeBmPpzsNQ7PvhSK1pOzB78BSok3RrHrF84N4VejyB0p6x0+vUrX9QEtlfoewZHWz08U6AF/ctJsQBpzhXfeN/IjcVWrhHMieDC0lUVLLHcuulCfBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eNvWQlgP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eNvWQlgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745526486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0I76ScLuFbxpVSe9NxtOhJ62w7Akb6V23z2B2mhRN3w=;
	b=eNvWQlgP5PPRddvJqfRuWgg4yWh2jAoCMdYABEhuMGdh1dGhzvngVwy+ODwmB9WE/qp1hL
	uVhpALHHDxLSXmeWH2bshGF4lVPRECVnJc2SxXuJrDsQ9vd60APP4zq8ud1pHgr0Hn5yDr
	CF+CJGa+9RfC+psC58sWF0Wn9J98MIU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-h4H190FdOr6rfDS6NV9Dxg-1; Thu, 24 Apr 2025 16:28:04 -0400
X-MC-Unique: h4H190FdOr6rfDS6NV9Dxg-1
X-Mimecast-MFC-AGG-ID: h4H190FdOr6rfDS6NV9Dxg_1745526483
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ea256f039so10826745e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526483; x=1746131283;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0I76ScLuFbxpVSe9NxtOhJ62w7Akb6V23z2B2mhRN3w=;
        b=A2DQE4o2wKBatGmQiDSL+PAHusmjHXv0Z0KaQ3fejrqXLe6YlDu0Hy69NVEc3zoXXt
         9qqVVJfTb7qfQI/0mLCpDICGUrW1kwCrwm5iFwUvM9Gock8ZF5jrXfP3nOoVTfgkONtp
         rYkQSnDWPEnN1c0KDV0Kh73WN+pGJMOs8rNNigLXLEcIF3mlyeWvEh1UNg7BBA5EsK7W
         jbxiMjRSiyJ1IG264R++1exDfJlOr31ow8S1V26rz9iOakuhNFK6UKmvXuXCdcz5UjXB
         pfRjWgB9422/aSTsSFhbxFOzY8ix7jjP997DgwggujLulHSPFwamUvUWBXi6rjEx7Vmp
         ZmQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXExlqIBVHQfC/ok1MJ+K8Nreadn2KfOC+HnthZYDAyDNf4k1oN4IGxJ2pOVYB1IkAXzb3mnhKnPgLiBX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzQTSRtMG6EwjjAxzeacbGlWLjvBrlfqt/Yf2QWFowztIEQuBp
	Q/tTYbT7rJBUXn1a3aiTNjkJVZuES2e/T3lq3FLif69+hcwpwnIlDyBM10kGwju9CaSMtKSABiy
	17fi9jr2a/+0XVNuZKUpP9rpaq2Iw92AfgSHiT37P1DbhlawNlGGLlsSt/Hdxgg==
X-Gm-Gg: ASbGncsgOecv9ukov55NDesqDG9gp3WAWZ++OPDHp05xvZ54np5aFMTY4hJpYUjarAw
	/CNee4TUn5xCJUEsREKFDLDdCHQnO3E6YtAOuIm+PCi3ZXBT6tFJLCPmw6w9NtRcw8fR/elnhHI
	5qiWviJGAxe3IXGwdiJzy+wOFCYsAMBV0mtiNFM94oNfq+YOxVT6ccF9K3WBKCawvA6zxjilS7u
	pxni/EcpGgf1nc48DCyR4BALN45od1cl+50X7fhXYzgkQjuWMp789FAkZqyQqiABg02+H/GS0Kq
	CGDy4wGdvweNYPWQsA7YN09Yq9CZVjx9XUIRgdOC3i1XzY4AiN6SYJEZbDKeQqCWKq2r25dMNvI
	VgWudQXlbYud5s4OmUikX4cVZDkFQ+I5Ghw10
X-Received: by 2002:a05:600c:1e87:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-440a3184442mr7949305e9.24.1745526483209;
        Thu, 24 Apr 2025 13:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8jORysgQz4LtaBZ5IZXbkcAwl3p4WEZtkcqmjKPbZxwCC9/oXK2ggW5BZtX9YR0iGNOGJog==
X-Received: by 2002:a05:600c:1e87:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-440a3184442mr7949255e9.24.1745526482871;
        Thu, 24 Apr 2025 13:28:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm32523805e9.27.2025.04.24.13.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:28:02 -0700 (PDT)
Message-ID: <b3a951fe-577b-46de-a7c0-8e3a33a77913@redhat.com>
Date: Thu, 24 Apr 2025 22:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] mm/rmap: inline
 folio_test_large_maybe_mapped_shared() into callers
To: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org
Cc: mingzhe.yang@ly.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lance Yang <lance.yang@linux.dev>
References: <20250424155606.57488-1-lance.yang@linux.dev>
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
In-Reply-To: <20250424155606.57488-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.04.25 17:56, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
> 
> To prevent the function from being used when CONFIG_MM_ID is disabled, we
> intend to inline it into its few callers, which also would help maintain
> the expected code placement.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---

Yeah, this way it's harder to abuse ... having the test functions is a 
leftover from when I had set/clear functions during development and 
experimented with using a pageflag (which involves atomics even on tail 
pages unfortunately).

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

