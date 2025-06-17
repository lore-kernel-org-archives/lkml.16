Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24772288C06
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148947; cv=none; b=bc7EKZir37tf4JxH5IncAIDuk8QNYpdM5sZjqxNS9h4/mDAMzzmigesEdx8lAlErp/QXobAJe7rznAIMrvFMV4avTHIVkumaxe0jmYGriVbzhtIYkzDr69OIolNVl+kaHFc/P2cmN3a0KvEDPa9JTqORkV1wAp9HxWcjV3EHPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148947; c=relaxed/simple;
	bh=S9T4Fl8Mxko+7ilkCwMaV1WEYOMz3POW6bFI93uy6cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9G5A6t6bYeLOR0bxs5ajLKoiorytAil7OwYNRJpZv1hUdG1++ExfSk1GLFJG7IPphXYYFAeP3C7EDKUETFRfUtZFlp/Q5QcbY6rklj2I9/wv4EVfNe0l0muZ0bb023g4FIIr9s7MDBiCZ+lob16EVOZZHUquOcTDcMl4nuB6Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ObUHVqP5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ObUHVqP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750148943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XfTBrcor9yj+xddvsbUR33KIHWd9bivec0vaK9kFL9A=;
	b=ObUHVqP5A6t8kHBoYUaWJDwmQ6UNNacjzSWSAg/99EVzfP9eK3zKFCxlKkzEHFZncG4t/A
	75ffXTsX0T8iRs8s3PBPaIxyffjr7wxLj3LMa5zgWZdVy1fF3G1uTcG4SkfPKuvfhjy2Fp
	BujhOrybZ+WlpOG/hGZCOQ1na43Ov2c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-9Xh932vuN7uSsjk2_tPsJA-1; Tue, 17 Jun 2025 04:29:01 -0400
X-MC-Unique: 9Xh932vuN7uSsjk2_tPsJA-1
X-Mimecast-MFC-AGG-ID: 9Xh932vuN7uSsjk2_tPsJA_1750148940
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450787c8626so40255695e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148940; x=1750753740;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XfTBrcor9yj+xddvsbUR33KIHWd9bivec0vaK9kFL9A=;
        b=ZIGANk7HOJmJxYa/4MBtlwTlN75DInX5T3XFMeqSpW7MhyYa2qPYnsAsdTiuezUbmd
         0cPW7C+zmENC95zVM3wUekUWhZDZMR3yZKX+3FsB/AGQiSncpwNaY4bhVvS5dTiixIco
         0UzYILrCY782rF18R1CCUTQk8rT+PvCWTqH12jADaGKwHXNeKNxktWySFYZ0ZKvPXxM0
         oiHfcbCV6e3o1WyFyY6AEL+MpjjZ7tGoIXl8TRh7OvIPQ4xmCQEyvr/woOufB9jmOXSo
         ghBaMstakv5MukG8PZmeFqbMD+cyfWN0Rp//7EekJQ1EyXnLEZ5RSGNDjHcUjBca47Xm
         Dp7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx4TSTKVTzC28JtxAnubf3fnkiaB1MBlZvVtFbK9naXEFTqoRpnR9+0BpS/OCST1wEzR0hIcFKZrQmOVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyToSgwnco8V5eFLq6DR+RasdvgGnR5azGA4ATkXkuo7RRO55tv
	nzs0Y4drZ1TrTqsjPGjp2etHAvgzLKqNG5gsh52kOOn0JbDFiUsNzPfWfsLvtRHIncddA6UOcsd
	yVaJptdqjMUehZLCaTZ3GToYCt9X1xI4Ml0DQK0A5K9pnAmvrrwBoPnez+qycinlSsA==
X-Gm-Gg: ASbGnctpi0XczdzUyzE3wfiy5AA40ZALkYrBMZct2Oa7LMNhw6qXY7WPg0UBrqguD1v
	KhedBE0IPFmQOM8c+huSr0Xb5VgtMoakvRl0NDCfKlhQFb8xF5c5TjFECWv0dUflh8ACfyEeCzS
	q0bbHh2ThklLBCa2yeHEDdKastWAoJpoUqlrrcYnAIut5prOjpYy/dDfufokrlQUTvKmaRLzjrn
	Xv3EplrcnyXOtY7kwnmjmBqug45fd3FDZBsVM2RP1ZmT6cvYVqfFeWBpgSr4sOeRdlDMPh9whhq
	YNjpWpUdxzsOMzyl+ryRdFK/1ujEFrjNQLu++6MmqkUvjvbjYI2m4kz9JZBa1GQBNojbAb1KIpF
	+xOJhS8ACUbtPABCcX/6Z8HLv264cujyKP5w09JkJfFimQpI=
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr93714055e9.11.1750148939943;
        Tue, 17 Jun 2025 01:28:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUiT4vm+Cm6SnYhqDElf4n/5KANIZuYMkf107CVbGD0DpbhArdrL7Z//g2qe3wYOdhkREvqg==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr93713815e9.11.1750148939575;
        Tue, 17 Jun 2025 01:28:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c2d2sm173294185e9.1.2025.06.17.01.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:28:59 -0700 (PDT)
Message-ID: <f0a867eb-c66d-476d-8391-f8a4e9968c75@redhat.com>
Date: Tue, 17 Jun 2025 10:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
 21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lance Yang <lance.yang@linux.dev>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
 <e61a7aea-a87a-441f-809c-10acdfb82df4@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e61a7aea-a87a-441f-809c-10acdfb82df4@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 10:21, Lorenzo Stoakes wrote:
> On Tue, Jun 17, 2025 at 09:54:29AM +0200, David Hildenbrand wrote:
>> On 17.06.25 04:05, Lance Yang wrote:
>>> From: Lance Yang <lance.yang@linux.dev>
>>>
>>> The prev pointer was uninitialized, which could lead to undefined behavior
>>> where its address is taken and passed to the visit() callback without being
>>> assigned a value.
>>
>> So, we are passing the pointer value to visit(), which is not undefined
>> behavior.
>>
>> The issue would be if anybody takes a look at the value stored at that
>> pointer. Because, already passing an uninitialized value to a (non-inlined)
>> function is undefined behavior according to C.
>>
>> In madvise_update_vma()->vma_modify_flags_name() we do exactly that,
>> correct?
> 
> Err the parameter there is struct vm_area_struct **prev...
> 
> We deref to the prev ptr which is unassigned yes but the pointer to the pointer isn't...
> 

struct vm_area_struct *prev;

is uninitialized.

We pass &prev -> prevp, which now points at something uninitialized.

Doing "*prevp =" is fine, because we will initialize.

Doing "= *prep" is not fine, because the value was not initialized.

>>
>> 	vma = vma_modify_flags_name(&vmi, *prev, ...
>>
>> We should use Fixes: then.
> 
> So no we shouldn't...
> 
>>
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
> 
> Sure? :)

Unless I am missing something important, yes :)

-- 
Cheers,

David / dhildenb

