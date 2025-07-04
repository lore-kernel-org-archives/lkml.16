Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0505023BCEF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751626069; cv=none; b=YaZ9ixXxZM/eYyeuUX22k4UgOVj+AslYs8LsPN+5w29ZZzeAJH8vhGYS8jnQx+qTMhSuRLHjc8aqQ3RTAvJfeKZsfap/BpHM4nno9lTTo8JhPzGmo6INMlVyGCRzcMgtQeEaRAwlKRUfwG8vpbhCYX6lRxc2D5fwkFxEhpD5Xuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751626069; c=relaxed/simple;
	bh=mzu6Wmm62rVF5nnjdtW1MNhBpKVp/Bqb660HJ019R+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAi6Subf3QSiQyC6S5xW+Luv3KjxeAsdsmNlziJTdpEb1Xjh78rpbgfbo9TGa7cXn4lZ88Pw6G7In58+uOBr09tLUUuIYzADPZA57Ijjsldnn+ynsOX78w/ZX9xsHB/apyoVdrIzxZJUhi34Is2SPBDNxDjjCD12Z3SEDL1jO5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+Nh+la4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+Nh+la4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751626065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NbBTX47sprmj0OAw3S0gRnqSnD4+tVQp0Jtdn+qiIWk=;
	b=I+Nh+la4YRvxGS67MTOnmyCOjg1fyrzVJqh70WAMInTVx/yxAI3idRXBwba0OoG/dBfhyY
	6fX8NhOWoP8g2bfxlu52KIcSPjeM0EeG7rCKrT5khS/FhF+yvQo4OgsG3NgM8kUdLgDWlw
	rHzDSmixmpycaloHQhTFzDfFsO8QskM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-04M9UYIJOXWIC3izD0-G7g-1; Fri, 04 Jul 2025 06:47:44 -0400
X-MC-Unique: 04M9UYIJOXWIC3izD0-G7g-1
X-Mimecast-MFC-AGG-ID: 04M9UYIJOXWIC3izD0-G7g_1751626063
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so404271f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751626063; x=1752230863;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NbBTX47sprmj0OAw3S0gRnqSnD4+tVQp0Jtdn+qiIWk=;
        b=lzF5+rKt/IbV/nih8tQVL+iV5+1sRFUw4ubKqSvKz27HKpoGdrB+mKBakk008xwGsH
         3+tsMr1nmD2sfEiBYvtscGGjuQzd8MhPxlOvUS2Hu12LrPA9i4ZI7W/wTgg0M0milFbF
         RkoMrlBvwa6CL9N2ZPEcCnFyhtJAUcDFPZHpfYz1zpeVFI1Pov2d8zIOIHITXt4ZnktD
         CID842WagX65rTDlQy4dEKbWLxSwBIaaOtgJO1m4VhyUFCrYlXS4WTT+oCSDk2jwz+2d
         I1nEUqzNbCEwCfAhydJc+k4YJIRnR3dK7QKjlX4SwaP5Ojp63UcOjFhvS9PA59+HkXVo
         t1+g==
X-Forwarded-Encrypted: i=1; AJvYcCUSfmk7+4rK6UoRRC+C74CQ8gaGP06HLDOcgNg6j2BDKp63ElmsL9k43MHO7pxEJSab+fLbHLrSLSqsLrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkwK/jy2tKeWccF0FO8A7CvsOf90koIOfSULjhfHdbg7LKBOnn
	ipgajMfhnEQnougQRx3XxssuDDBbbnWMvH015PqaPii2ZOeBG/mRssYkl4FwfYEz2eIlHpgOdkH
	CJ4rtcGK5IMV+Fav+bW4ZqIE08zilThOi3tEUDIPxnNV6Svumc8vbcxAnarulW1iGbw==
X-Gm-Gg: ASbGncsv2plnnvXQZlNggym3VwBVgdFmzCUGuqEBAEEX2ym+RRwa5FpmePzkaWivViu
	qUYpA+MrL6fJJ2UN1pAHXIohdV1iAQepj2bNTB0T7If+xBXTlRgwCWV/A9gyD9pJZNYXLhzzMW6
	GAS4KEUKBE/FD2tBFdZXH6f+aEgC0DvxQC1+t/9HpVgqMmJ31E/PFF10nF+sf72bi5Imjk+8uX/
	h2V+/vr7GKEetUsvPdosoxGTTx2gNyzUzN/bTE0x27qU4YKwPxR2AgxJbSlnEe8g7ziVCD64k0M
	/cyUmCvnICDVvr09zp4ONyeWrlbsDGNjekjGbUfpdVILFRKRBQG5U35OOq8E+qXyM2Yy4eIcMjz
	is6LFTfqGqdOQSAKRDfy6UbqDhXSr4scR3R1UMTgOrZ1+jIM=
X-Received: by 2002:a5d:584f:0:b0:3a6:c923:bc5f with SMTP id ffacd0b85a97d-3b4964d3e2dmr1791752f8f.17.1751626063376;
        Fri, 04 Jul 2025 03:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1eRtDWCmnQZufgGKFJBF0C5DB/sXEz5JhYT2w3bUdD5huS/XMXg3IW+tbUhVpWl/SHkFtSg==
X-Received: by 2002:a5d:584f:0:b0:3a6:c923:bc5f with SMTP id ffacd0b85a97d-3b4964d3e2dmr1791730f8f.17.1751626062935;
        Fri, 04 Jul 2025 03:47:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bead7csm51497585e9.39.2025.07.04.03.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:47:42 -0700 (PDT)
Message-ID: <f1499e6f-99bd-46c3-8dd6-770b8321e071@redhat.com>
Date: Fri, 4 Jul 2025 12:47:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] mm,hugetlb: drop unlikelys from hugetlb_fault
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630144212.156938-1-osalvador@suse.de>
 <20250630144212.156938-6-osalvador@suse.de>
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
In-Reply-To: <20250630144212.156938-6-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 16:42, Oscar Salvador wrote:
> The unlikely predates an era where we were checking for
> hwpoisoned/migration entries prior to checking whether the pte was
> present.
> 
> Currently, we check for the pte to be a migration/hwpoison entry after we
> have checked that is not present, so it must be either one or the other.
> 
> Link: https://lkml.kernel.org/r/20250627102904.107202-6-osalvador@suse.de
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Gavin Guo <gavinguo@igalia.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

