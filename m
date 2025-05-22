Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE6B22332B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898019; cv=none; b=UA3eOHybxI/dliyY8TQlkrrOlvytgROx5CAOSHHk/CrZ445yNKFQThL9jHur4PFHqA83cHXh1BC0lxDy2Fm4JwkK2hVJglzrHP3dSnefrT8AhWaECWL+Z2XnlVZFa6KhIG8Vz3hXuWS0NauzvBBxbWj4Lpl4mBs6jSaYDy17FmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898019; c=relaxed/simple;
	bh=NgbAkLjOLniLVBciTYaON6PyG7+Za587bel8skjFgx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/yvt0T30O94hDjAlcFgZtl+sh+oPneYy+Tu3uD83Hn+GNs5XzinZt57VBqf9ZAz62luAEvXtQ6OCEf+PFIXyvK4OCrbIUSfPsXMaPS39WzzWw/KfHk/I7WK+8TsFO7IBSFN4xIhYZ2EMJrZpCqakqan3exHoVVbxYzpv5z2tFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vpo27buS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vpo27buS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747898017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c/yjwGI2a2obF5aH7KgHqxt9Q6f14DUOKdnR/08WKlo=;
	b=Vpo27buS5iZOT3KwYQGN/o2HUw8T8geMJariQaF+33/MlqquH/zpgo0Xmjy8mbm19pMG7u
	awSyoO3D+FtYC27q+TsAW8PKCp8DqGYdV8G2aqLWoPzUIS+7CBRcc0D3Y+u1GINE4vBCjG
	VaM7aVWpvc2fU6+EG3j4+KNYACaC8u0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-CYndxAs6Nt2CvS7U1fDP-A-1; Thu, 22 May 2025 03:13:35 -0400
X-MC-Unique: CYndxAs6Nt2CvS7U1fDP-A-1
X-Mimecast-MFC-AGG-ID: CYndxAs6Nt2CvS7U1fDP-A_1747898014
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso39144075e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898014; x=1748502814;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c/yjwGI2a2obF5aH7KgHqxt9Q6f14DUOKdnR/08WKlo=;
        b=bDk6Wq4GQi31FOGAnAiSh3LfB07IZ/LqKZYX0kJX0aqqbnmMTZIbmKbazTrepBIn+V
         avGP3QOSCOSPYLh2TL5iae4IJ/Oe/7vMLiXCchqaQYX/xJQRiYZZEv63opi2JWud3s6T
         YugPQm1i/X1m6bP+vb4qVutIaNgBg08ZhsnsE+j7kd2DMJouS0LLzujDH3ixgsVYuqR0
         Ih2HT+M2QkW2+nIKHnpPJ7plqJ6x0bTO8I6G7y837DqHKNrxFRg+31FLDgeO+ZPnr3pt
         Oj0hu1IE3jR87TjC5H+s0YH/F8fvzSOJ6zosNInfSzRgPjA7AZi/XSF5Bpb2yxbiCpVA
         tPTA==
X-Forwarded-Encrypted: i=1; AJvYcCU6zegnomKnplGkyTHF6K2MLk1G6YWnWvpwUIMjH+t8yKY7paVErsfbxW/tlzrG3pisvWc4Hpt6x11K4+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfWClOgJU6o6AdA8qoNjLxlqYXTAkT0XLDdnA4LPnzXQRFCHbe
	TjE14DSuBgve83oJGXdGbLQ4kUHT90H2wraIs9T+vbkTGlDUDr3toYRcRz90H3doXujoTjM7Z5U
	lFAFq6xyYNLkBa/RCJk5wecMAGG+0UgRy/yFaRMKy6aQMzMZgSLOtJHxo9sAIUKYIcA==
X-Gm-Gg: ASbGncvkgeby/LSbJ4ovxOH1h3G9tIPCw1OXwAhIHiN1ilgf1lc9/3YGg1NVHeJR+Hu
	ihv8R8YJb83gC2rRV32T65ITesbavmTinZMZPloPZqdtqk+T16E/Ccs1cFDM00yUyCisXUmnjrj
	T29iqsa+gxsiJZaVEwl+7tulaRlrX56R2C4pFcJmYIkky8k0dyrk72SARA6L1X5OHzeszAWgDpW
	LR3Ied/HttPyzw0h0x7A1HFO4xrg7FLM/vV1Z+GomuE18c5KMZJYQ1HTvExuNCIkXSV4ZRKFfu4
	tT3AnDo7kymiXk7wgQm2q84qr2y6VCuDr8vgiJaGZY8IlhkT7RhuDHP1mNRgg+BZ6WbZAe8+aIw
	ZG+Tyt/8OGhgbscogL9jZYbbUiVBDtpw6PqBW5ec=
X-Received: by 2002:a05:600c:378a:b0:448:d54a:ca23 with SMTP id 5b1f17b1804b1-448d55a0cf5mr55597305e9.8.1747898014470;
        Thu, 22 May 2025 00:13:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa4arjjfLbb285aTKhuL/fPOw8u/ztbPIT+MDOfwcqrrb1yg7TXlkPnB+soxThpbjQGgid5g==
X-Received: by 2002:a05:600c:378a:b0:448:d54a:ca23 with SMTP id 5b1f17b1804b1-448d55a0cf5mr55596925e9.8.1747898014134;
        Thu, 22 May 2025 00:13:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44ab793a7d5sm5103285e9.1.2025.05.22.00.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:13:33 -0700 (PDT)
Message-ID: <25c0c700-656c-4a8a-8ef1-5093581cf25c@redhat.com>
Date: Thu, 22 May 2025 09:13:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-2-dev.jain@arm.com>
 <912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com>
 <76afb4f3-79b5-4126-b408-614bb6202526@arm.com>
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
In-Reply-To: <76afb4f3-79b5-4126-b408-614bb6202526@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> ... likely with a better function name,
> 
> 
> I want to be able to reuse the folio from vm_normal_folio(), and we also
> need
> 
> nr_ptes to know how much to skip, so if there is no objection in passing
> int *nr_ptes,
> 
> or struct folio **foliop to this new function, then I'll carry on with
> your suggestion :)

Can you quickly prototype what you have in mind and paste it here? Will 
make it easier :)

-- 
Cheers,

David / dhildenb

