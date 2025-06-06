Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE9C287507
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210702; cv=none; b=ZSUo1EKKXT5bBO+J9Q7bfas3TBErvXU35k+B/hfHDUlW2v+82kn+9CwaiMKDq+LQZoqhktZNpUo+BEopxngXzNbsvxRsp4gN9lkLB+QDTubov/MzRUWbuhjUfAGmUSdq55abtAWI0XUGcw1pVXGW3DPQ4y6mRZdOP7hgfsBMSUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210702; c=relaxed/simple;
	bh=d+1peOpzhF896/8kkhDB2QAnaqXIePKAVigDiqRx/AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Txund6JXwmDc3AYU8Nc1z4/MZK5uzZwBfNkdLpUJDGJE6k0V0eQauCeh32IhHOy+5ok1fS8/10PIpRrUKd1sWYycT0UUkn1DMsNaOj3PamScb7+vydkHaOsaBb44sC5uNLha5keOAor7rtbRukZ43y9Bo3MI8UohLW5YLPrF9P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NJfmA3EW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NJfmA3EW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749210700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YuDqZfBW806rEHMVFjcdFO+ADelk/lfDf5CqIzU3/HY=;
	b=NJfmA3EW0YNU9UoURU/FXYGPxA4GQVDfpWaAa6u72RyAuHuJW1kVAMVa5j8SAAmvJ1PiEo
	/RW7o7BpuCJxIJQueOghSpQWkKLe1YbUUw2IEpA3/m94uOG43P1+9HleRZWGehxyLj7nbs
	LY6dgdz+8Ma1ga87vxsr7nJKHgB2LDw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-RtdFvd2BNkqaPlpE0QRteg-1; Fri, 06 Jun 2025 07:51:39 -0400
X-MC-Unique: RtdFvd2BNkqaPlpE0QRteg-1
X-Mimecast-MFC-AGG-ID: RtdFvd2BNkqaPlpE0QRteg_1749210698
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-441c122fa56so10173585e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210698; x=1749815498;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YuDqZfBW806rEHMVFjcdFO+ADelk/lfDf5CqIzU3/HY=;
        b=gxC9D9WE/XbMRIwY0nOL3fPMTnNwhyHu78hpMT7O6S5jE4kP15ZkJNJBDDIapx2LSF
         vsaYrEiPiLqKyP8Rx0z1YELOUPszV9rQzStFC/m0QLMC/qWbznfDElKWGKRGcKJEuHES
         N0uW5fHqSPNWANw2uWWplabbMR3m1L73o2usH3opSDrRAOpW4Ug5VmKQaQsX0Lrpl8wa
         Dp/RUUQXBQvJjSo6uGDU3obn03hlxni7eSab0J5EJCXE/mYCkCs5qoiSr8wL/CEuKo/E
         O9el2oDRgfJNRZP2Bo5NtUgMy+bnYAF2Md2RdecX6H3m3XhKjWQuU9W3XVmqgxPJ9i4y
         YvlA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Xk0gNlRtBU3mWceHVUOAUqREuVvwebHW+Cq0iav5M0BCuveYxi+i0phWlykzEuQq00PMuVc5tEzZdEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHK+hm7LYFPvGV3Af5KfQq7yHpUEGNmsgMod/IsndWw5fz5eUH
	w5ZWuBRJHNbnjheHHCQPyu2NQOuGLZrP3h9c9sHu/KGvDroS3mRh6sHSSyCWAdcAaYt9aa6+2kW
	sbEJPxozvQim4jUw8YUdJEsmiMOt9Qvh56arJG1BecKsT/KB37thPTwDNNk9qjuTPyA==
X-Gm-Gg: ASbGncssnb95luWUcVstpheWTQ66K6VH9OkBP8krsmtjHo/X72npf5Q3W9oLgorEYTs
	VcgPcrZQ0HFvHtBnWLmkubs2uoM6HWcyjj8xDe6fYZvMwunIspDQymJIDWVcODKqUnujm7hpdfv
	9VWdSSpc7G9l/ZrSOC2qNjwQnsNAqBTUp8VVfJVYGnUihK21ZSt9LWDie12WtxHoJ2/pq8tiPUt
	PP0592D/1VquY8IBU3IxfFGpfVzOVGX2i7cShS903ATR0F9yMeDMtb5NBgXVEz7EZLksmnJwA9o
	aY9niaIVXdF2UcxkGrgem9gqZ4e75FcyyZDeXP5QesIJIVYf1UwINHORT+9eurLYpb5pdAo430n
	IB4Y3c7KmaEw9Rs83nkULON1Wrr+cwds=
X-Received: by 2002:a05:600c:1e09:b0:442:e9eb:cb9e with SMTP id 5b1f17b1804b1-452013d1ac1mr31336575e9.26.1749210697803;
        Fri, 06 Jun 2025 04:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTutIf5S/5ExePoSx/Td85W93qsFuXMvMZErKLOVTEWcRei1bg1QE+/+NPv+XEexChA/X33g==
X-Received: by 2002:a05:600c:1e09:b0:442:e9eb:cb9e with SMTP id 5b1f17b1804b1-452013d1ac1mr31336315e9.26.1749210697345;
        Fri, 06 Jun 2025 04:51:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm30797975e9.2.2025.06.06.04.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:51:36 -0700 (PDT)
Message-ID: <3051c206-9a1c-47b9-a5c4-18010abf070a@redhat.com>
Date: Fri, 6 Jun 2025 13:51:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] drivers,hmat: Use node-notifier instead of
 memory-notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250605142305.244465-1-osalvador@suse.de>
 <20250605142305.244465-8-osalvador@suse.de>
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
In-Reply-To: <20250605142305.244465-8-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 16:22, Oscar Salvador wrote:
> hmat driver is only concerned when a numa node changes its memory state,
> specifically when a numa node with memory comes into play for the first
> time, because it will register the memory_targets belonging to that numa
> node.
> So stop using the memory notifier and use the new numa node notifer
> instead.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   drivers/acpi/numa/hmat.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/numa/hmat.c b/drivers/acpi/numa/hmat.c
> index 9d9052258e92..fe626e969fdc 100644
> --- a/drivers/acpi/numa/hmat.c
> +++ b/drivers/acpi/numa/hmat.c
> @@ -962,10 +962,10 @@ static int hmat_callback(struct notifier_block *self,
>   			 unsigned long action, void *arg)
>   {
>   	struct memory_target *target;
> -	struct memory_notify *mnb = arg;
> -	int pxm, nid = mnb->status_change_nid;
> +	struct node_notify *nb = arg;
> +	int pxm, nid = nb->nid;
>   
> -	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
> +	if (nid == NUMA_NO_NODE || action != NODE_ADDED_FIRST_MEMORY)

Same comment :)

-- 
Cheers,

David / dhildenb

