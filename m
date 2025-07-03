Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A802FD892
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568786; cv=none; b=CcCoycduIRp1cAFfGPbUUIdjOJe2FDDY6lu/bdNIxmjFfh/LwQZWkVpmSnj8zhBnaaSNumIoF36dKWWh6fwO2JVfN6LI9ojj4TJN5ElzZ3aoI5S43NO+8EJXsDOmRWxBhEgOVzO31O1isA2oRKEf59f1iSHyN4XRrEC1m/+KQUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568786; c=relaxed/simple;
	bh=G15DQy/BDtdKSwUfl45yI21xNFN+y/NBnJ/0ZJZoalw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZWbbKJtvOO8vLH7WYZ3gjrR9yNKGs0SxDyCNWGb1hG6mo41pwcPBWHTTWu5ClG2fOsjmR3SXCG7NA40kXPH2bFs+TaRTJTRyt9HzpPEP/R+W/fUfyqt1opsY5TDLKopAo+YU9Gk/mtxldFge4m/NhdCIiF4zeZrYAw6gyt1uc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q/MPn4ZB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q/MPn4ZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751568783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UQFG5MIaFwRZAWTQLa6aA71YVsgcQ46O+CEYjW8Cdj0=;
	b=Q/MPn4ZB0tJfrVF/6fOqAd9lYdBS1IHdUsm06zogweEEgMYR9oSnqebKVvRLivPemDfryF
	XkP1HgqYHo+d/f6cwUScagJuis8dg6LdarzC/MdUgJ47v6Cdb3twMjscFNJWo2RiIvqCmI
	a2o0D+SlOcLr/X2FL3Vjs5rrQ71kQ2g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-6ViX_0SAPpauG-S9NodsYQ-1; Thu, 03 Jul 2025 14:53:02 -0400
X-MC-Unique: 6ViX_0SAPpauG-S9NodsYQ-1
X-Mimecast-MFC-AGG-ID: 6ViX_0SAPpauG-S9NodsYQ_1751568781
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a58939191eso46219f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 11:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751568781; x=1752173581;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UQFG5MIaFwRZAWTQLa6aA71YVsgcQ46O+CEYjW8Cdj0=;
        b=YofTLPtnPO4c/RX2+ySzzdfjq8PxnAZ3a0cjL4OJmZpt/hhwnOMAkR8H5u8pISJE4k
         JQd0FHDQuyLi0MWE26ucXsmm4jFc5KUMlZYZTzzM1UC1ZHN+85wvMZ2O88mIhW7IjvkK
         HemKkQ295Vffv+bVORsiXKYBg19Elx/AAav5981xmSd2IZ3Khg1PAyfWi6yUkaNaCc80
         NbHtha4AFAOnHEiaMhSDv6dPUHt5rFusGxIOgpIUQ+PUXCvqPsHLo7/k6TPc3YVN8k4y
         hXNxNKK66dBhaomBnZ3Gfu+/xFwihreeUbpulA8Ueq+KmJPRKRXtg28St+JK9E+YxIrX
         6PaA==
X-Forwarded-Encrypted: i=1; AJvYcCVC69plRbgGUlvCPqm/1Rzmui7wiAJKoxUuYK0Au0ZT/7neCX3zH+jil6a6TYunN+LEz4YHwSCS+femLKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7kUfO6+QjbKtpqQWD7bizPxQTBAnMUL5ZelJ+Kgqg8xVRBc/a
	Rtg2ztCr4FOgE9cXEt1shVY+Vz7o6Jt3Je5PzM4aK1OqigKIsE3cv5mtl2eBFx2OBie0m40zIVI
	MPz8umoEov3HMK3fDwcq+DQLGdWiaOdb20PD2io9gL1rTdGMrfhvg0nKdRs82WA/rrSHC6WqMMw
	==
X-Gm-Gg: ASbGncu8EbfECv/sfx09IyuO2eFJSUlMQG+QLuHYINrGpvKPGz/Og+7S3AaovjV+s/n
	2oMtgW+701Y2F8kEllinNuideyF61X7rjN15POujgPC6pPEmqlXfAQyAEvC6HxtrzDxZBFjEG0I
	/UE57xmBvP98iYiCinqHMPie9m0oTQ5c0R0ieq8cqxDtQbh4Zu63S9ts5OdNR6Lgy3u93EewBQ5
	tGLOmH2eq270FFve7QzMG/I2akdG/G4n6aQTxepJHTdNcajl5v0jfNg+a52zE13iC8Xn1KA1VGh
	3a3chJgZ/5ThOwOFNDgqjOCxtVMO9A1V3sV+RR59qdslOfIZnOEmkJmUTdjnW8kEf+j2ktayeCn
	8IvhfQt13Q1aFqQ3hYoQxBf6N11LVUfC5rLCx3YI7iWAMnAkBGw==
X-Received: by 2002:a05:6000:440c:b0:3a5:3b56:974e with SMTP id ffacd0b85a97d-3b32bae0ab0mr2281807f8f.6.1751568780855;
        Thu, 03 Jul 2025 11:53:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC4kuZoJnTTQ8GzNjW4/Ni/tUzuIYJ3R5heK52xsq/73GJotrEymQXLDWyMbFRJetWfQMZLQ==
X-Received: by 2002:a05:6000:440c:b0:3a5:3b56:974e with SMTP id ffacd0b85a97d-3b32bae0ab0mr2281800f8f.6.1751568780440;
        Thu, 03 Jul 2025 11:53:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:e700:2bf6:1031:382d:5a85? (p200300d82f1be7002bf61031382d5a85.dip0.t-ipconnect.de. [2003:d8:2f1b:e700:2bf6:1031:382d:5a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd42sm473211f8f.5.2025.07.03.11.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 11:53:00 -0700 (PDT)
Message-ID: <cfc1c95f-3e3c-4856-b831-bffaa6457c03@redhat.com>
Date: Thu, 3 Jul 2025 20:52:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] cma: move memory allocation to a helper function
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Oscar Salvador <osalvador@suse.de>, Pratyush Yadav <ptyadav@amazon.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250703184711.3485940-1-rppt@kernel.org>
 <20250703184711.3485940-4-rppt@kernel.org>
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
In-Reply-To: <20250703184711.3485940-4-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.07.25 20:47, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> __cma_declare_contiguous_nid() tries to allocate memory in several ways:
> * on systems with 64 bit physical address and enough memory it first
>    attempts to allocate memory just above 4GiB
> * if that fails, on systems with HIGHMEM the next attempt is from high
>    memory
> * and at last, if none of the previous attempts succeeded, or was even
>    tried because of incompatible configuration, the memory is allocated
>    anywhere within specified limits.
> 
> Move all the allocation logic to a helper function to make these steps more
> obvious.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

LGTM, thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

