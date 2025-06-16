Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292691F8676
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084269; cv=none; b=nnlzk83OxoBr1y7f/de3EycbUEF8z8mRnBrIEuq1mR4E34ZMGLgUltECdR+uLXYP2T5xgSMKAXmUc0eWq4v1ZwARhoO8mBJpN7lZ4qswU5I+U9zWu5BTt0EHGjQqjq8K4KhXuMwKRM8z+E3airlzMhI4pPZLiJLTS5vz0COt+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084269; c=relaxed/simple;
	bh=WY7TMC0YD5SLaqCBW6qQAvqETF7LdjtfZJS61Ye2nOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttsC+7Equ/ocYo6gbHtHyBneGOEBOMVI/FW4SVWuqvYEHVxSHx76WzSOT+DwqD8QLgPv4oM73thrFYZnZ4GG6PUlMZtwNIUoDsUrUBt0A6FySX0ajwZLvwB1860AMJaSBXaWuCLlRMA4LpLrsinrOZ3xUXK13w8nSDl4VZUHhtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M2CFf3IT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M2CFf3IT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750084267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3yx/GlXI4gE/cHH11+XdNmVkS6ZqwwbEDl6FH6aGzNc=;
	b=M2CFf3IT/Sxu0scXPCgPAgADyAL6EzEJaAqv9/NwHNo26M0TlSCAeRSqu5z/3Me4Z5k/Cx
	2m7CZV3O1WyajLHwPhFjX8nM1NJtnw8OXirWVgEVgHjIXovOL4/6NzVex9kbsfyWMEDS1s
	Cuvn+RAV2yWONgdIifdqT7S+SMXzxPM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-BTyf4i5lP2Cw7Q5Y_FMfcg-1; Mon, 16 Jun 2025 10:31:05 -0400
X-MC-Unique: BTyf4i5lP2Cw7Q5Y_FMfcg-1
X-Mimecast-MFC-AGG-ID: BTyf4i5lP2Cw7Q5Y_FMfcg_1750084264
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a579058758so651780f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084264; x=1750689064;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3yx/GlXI4gE/cHH11+XdNmVkS6ZqwwbEDl6FH6aGzNc=;
        b=oWyf38Stn9V8NhMQzKIKd7dmQstxiuZQxkPCFI/6wteDFnkbFH0uBFiIgAeB4m1qsp
         D+so186lbfOBSnij3iPLEV/PpZPGSOjiburd5q1dLFVdil62458rlkPwVKX1ZSC+jS8b
         mKnWt30exrQ0SXM/pmBDJy2ZNsX5b0ywgrIdGLjm6PMwSOGxn0jQIUCe4miQDjSlIz5N
         kMksQDaEMzQd7zaHZW8KfQK7QJa0XOq1/wttJ4Osj1UGzQlbBc48lfJRQF0E0Kex+ifh
         XLuoCLTdsC4NzKlEB4ZD0jV0vM4amCE/kmq2mrRxocFBJHiaHHAo/Az95ETgeg+kw0yy
         ebQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqF48hgv+lFrdMgiUueXSXmg+qfAMxcdnk/tM+fdRFkRJ5ueOrbi2ztu9DjOkfdf4q75mQM0DUf8vtVp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5CBsQjUsxYcSJHwfg0FeFW3vwFFckeHgWe4/Cd2qDq597LtE7
	ZdKFnKtGcyzJPHuX2dhmGXPDCGpn8LeA8yDy8JBOylhR55b9vgnzcqNPkn/ib70JCJl7URYRhy6
	FV7NHdIaqyexl072dFBRzrp6UOj9V/mugrDFwweU5ufSV6kzf+9I/8haJ+9SU71Xqcw==
X-Gm-Gg: ASbGncsrBq2RoF2yUH4YsIUWNg15s+5gcbf5/CmPnxlEBwks7o0+gnAsWxX7WN5H3C7
	sYPJ4WBMGiiUC0xLIbEmnper2WO9s5H81vd3UotR+VPjIpTVnWfchsqSZ2RmZz955n+VZf8g8vF
	YHnDeDVOSNpwrPGA8PCu19Uvc6m5rbV514kcTiIh0IHaWY8m60P8h63iJSQ2zlezfMimklZzZIE
	w9XbC/+PAZC1KClFtEEOvPze4vYX9B0Dm3NQ2m4JXHO3o6OBBqkyL9Lgim1KMDo4jkHlAVXtrzU
	J4HvNFC0akU/DdLNjuDKRUIOyIHu31L63HKUqxMQV98E4rTDoqak7HCrNSvyPpKCFTd7nMqHdPI
	b7pI55Fs001mt159dFIyTvjUSMuj2QITF3WzWLiSKq302ztg=
X-Received: by 2002:a05:6000:2385:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a572e8e0e4mr9137968f8f.46.1750084264126;
        Mon, 16 Jun 2025 07:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmDD1V2O1gmVqK1FNmzOHzBPWo+7H3PAjsCtD2upIkFpndQBwdRtwbtCpw/ctuX2/yAltmnQ==
X-Received: by 2002:a05:6000:2385:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a572e8e0e4mr9137899f8f.46.1750084263448;
        Mon, 16 Jun 2025 07:31:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm11122212f8f.45.2025.06.16.07.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:31:03 -0700 (PDT)
Message-ID: <b975179e-ae53-4752-9521-4dedaa21f31d@redhat.com>
Date: Mon, 16 Jun 2025 16:31:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/11] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250616135158.450136-1-osalvador@suse.de>
 <20250616135158.450136-4-osalvador@suse.de>
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
In-Reply-To: <20250616135158.450136-4-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 15:51, Oscar Salvador wrote:
> There are at least six consumers of hotplug_memory_notifier that what they
> really are interested in is whether any numa node changed its state, e.g: going
> from having memory to not having memory and vice versa.
> 
> Implement a specific notifier for numa nodes when their state gets changed,
> which will later be used by those consumers that are only interested
> in numa node state changes.
> 
> Add documentation as well.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Thanks Oscar!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

