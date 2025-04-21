Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E514D8D1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220009; cv=none; b=SWCEPKyYM3EBtSWHAdly9oDOXPJ6yUy0qI67GH0eDaehfEPzI8bia8WvMk0GZ3W/0tz2uS8NCn6SIBU6t9cGKNZuAZd2uudxzMT5o9e3eTRSlRVuONoNek3A4HHEc1knQHKK1KRG/h6VZjNLAurOiQ6BcbzKGnfHDrA36L16DOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220009; c=relaxed/simple;
	bh=ICkV05Pc5E2m+DevuUWOj5eX/6YUssTtiLbkIZDzj4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyXDtaujUB6s+MvU5Q/7+6Yu2mag7/L47ieLNDMac9au/cbXl293A9vU7Gb+XEHDVDCl8a2jFJlZYyKaoRQnQY9l8HUSKorR6IRZNcjULdH0n+AnNJWv9h8kbLNt6+8bIz91QcIEDPDVyQypdwrOIytgFwoHVXoAm5gbOOMa84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbYAWIvn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbYAWIvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745220006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BVm/35slZ//afajKPGTr6wSA/8XwvAGcEMaTfmHHVFA=;
	b=UbYAWIvnuAGuP71gwtUB8MW8HKgODJlgqxqvxzIvUM7T4XH/Y0i5R8TXuOmIbkEu8MnI92
	c09oDgzxRV3z5eIXAH1YfuerYPyxiU5T7uMnbzNLggKJ/UtBHXiGUnfKti0K1YnMlbZDQN
	ymDmqWMfKc6ZDg8KlUmgCjvBWxdmUhQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-1UFylFnKPrWAPsLvfnNjtw-1; Mon, 21 Apr 2025 03:20:04 -0400
X-MC-Unique: 1UFylFnKPrWAPsLvfnNjtw-1
X-Mimecast-MFC-AGG-ID: 1UFylFnKPrWAPsLvfnNjtw_1745220003
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912a0439afso1101789f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 00:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745220003; x=1745824803;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BVm/35slZ//afajKPGTr6wSA/8XwvAGcEMaTfmHHVFA=;
        b=YlrAiou2kMlxBehd6jnlkMH8DEvMYuuFNyTYBTsrdITWAtB/SP2/FJczf0uOA8VHiw
         2RSmrRLyB/V5G/zUTSCBs5Wvg/y6qQI0Dvs0A9KTfXgYVi3h2HlyXhQNaSGJmjMZ/ndy
         xc0eqHc/v+Q0uaqjcZ7L4x469yP6hNbgD1ADOKhmMbP5x8E6l/Qi+8e8fzTHB0CxerF6
         aRG0CKWO3C34u7Mtbep8Fk1B5zP9/3iF1cf20rLzl23LYanjr9psC2WLlEFUZl2JEGMZ
         RPrgAmVbnoTxoFHXiA9vD56PJO2NQWcVNZroa+xFRF1aiNY7XfwPE5GaONnpITy0JE3X
         qbsQ==
X-Gm-Message-State: AOJu0YzP4Z0Z0a6NkTVa8nL149XVoiKVSOiI4P4vN1d2LjXqhrSAUQgL
	ofkYkNBfKQgrgWHlB2aXiyAf/TCq/jGOAp8GqiTv291SetPfpbVFg4LSDIC6gdErePhMKPipNlT
	q1WEHLcIQAvMY3Ht22QiM7/KCkt38XmauMVc6QpqXtHlqNC9a1jB6zuCAibmMqg==
X-Gm-Gg: ASbGncvZuGLRBlKOH7dGnzgo9bcs9zSmiNamLQ41d3oKgyZFSd/kMdOBhPuXIP/c31M
	8GKspHVZ9w02/xJ+HC0C92hOVjkCV4OgIMBWIYagAGPdIMIpiGPtnp9yFma55nSLuKbrlnI7FY6
	KXYBgEaDxD2UG2aaC6JcKYRMYov8H21Dk4EqmG0xHusVQiB5JbWxWnWvJNpPIFnCG+Z4ZQmPEjN
	iP3VSvErRvSvrR4cQ+X4hHI0mgKzk6fXIskmYmLAa/dmdaTikcQy6uJoFdhIWmfUjz1B3REIxV/
	NqL38vKy1MuXsAiFBWjEcWyCHuXtuUS5WYc3GI58sp4aIaCNCEoCP9mhdUZ14yeV3B0M3jlllnU
	r3zIFtSIrHuBaDnbslYXi2cDLegPfoR4F3OzB5+4=
X-Received: by 2002:a05:6000:40cd:b0:39a:d32c:fb5e with SMTP id ffacd0b85a97d-39efba3cbe4mr8305380f8f.21.1745220003121;
        Mon, 21 Apr 2025 00:20:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB0GLaOn+aTgyeiw7B3/d2SBPmHHapdEtSzBIqu8UdMb8jCHsdrC55UgFoLrXMrUsa6f7fDw==
X-Received: by 2002:a05:6000:40cd:b0:39a:d32c:fb5e with SMTP id ffacd0b85a97d-39efba3cbe4mr8305361f8f.21.1745220002697;
        Mon, 21 Apr 2025 00:20:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4c8fsm10763640f8f.89.2025.04.21.00.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 00:20:02 -0700 (PDT)
Message-ID: <f345f393-9715-4d4a-ad1f-19a30dc3d7ef@redhat.com>
Date: Mon, 21 Apr 2025 09:20:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/rmap: rename page__anon_vma to anon_vma for
 consistency
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org,
 nao.horiguchi@gmail.com, linmiaohe@huawei.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, harry.yoo@oracle.com,
 riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
References: <20250421015823.32009-1-ye.liu@linux.dev>
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
In-Reply-To: <20250421015823.32009-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.04.25 03:58, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Renamed local variable page__anon_vma in page_address_in_vma() to
> anon_vma. The previous naming convention of using double underscores
> (__) is unnecessary and inconsistent with typical kernel style, which uses
> single underscores to denote local variables. Also updated comments to
> reflect the new variable name.
> 
> Functionality unchanged.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> 
> Changes in v3:
> - Rename variable from page_anon_vma to anon_vma.
> ---

Agreed to Lorenzo's comments ... tearing up patch sets is tricky :)

Patch content LGTM

Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Cheers,

David / dhildenb

