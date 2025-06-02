Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCC214A7C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748867188; cv=none; b=uGg5ms3SaS3peSNKi15jGUpYVrtkhsIR4JT3xjzKo1LO0tdTWX0zwPUwUuQiqwNjTT/fv+u44UV2jsDoLPR/7G3ymJ5/+Lti4utEXoeVAbrncTLM3uEw+mWmDrvofXuDQ2kPvhdPCcnONzF1FN+pM8zWFdSDUsFqGaaJ6CDaeZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748867188; c=relaxed/simple;
	bh=KmcEV+YC4wjkwupnz/aL0Lj8VjwoViL20lNM35pKRvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qo1yIJIZ3zJw6C5HXJZsMNMpd/LWV2AbNUgRAD1qb+spuFlS1Kr7qYRHYH7VlH+tbpgYP0+JnUe7hET028z2dbmUFpmamtBirZ7loEQ5K1wfLC4cpd4V0SSXwTd8+GYFgQ7YizeJXWbYWZKIV2qXyOBy/oUMhFnOxiXpvmaQh6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R7DyzlCc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R7DyzlCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748867185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=murmMMX5h7qj5SslZFh+7lBZ+d1kCAp76FkWnJBtyAE=;
	b=R7DyzlCcLV9k7SFk4g/49EeXPoq4pLnEtO/60L5L1cB4fMRDX6SdAD+/nKkIPrly1k1ZY5
	7Uco0ZIJ68LGl2ZCsd4Hmj8hkn16gVIWp+Ll24mwaLzQygfdDotLAHZA7Z6N0zP+sXYVig
	sPSNg1Uw24ZQm8JcDqPnB97YnnbNpts=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-iQXUkPdGMJabH5IPlqLbQw-1; Mon, 02 Jun 2025 08:26:24 -0400
X-MC-Unique: iQXUkPdGMJabH5IPlqLbQw-1
X-Mimecast-MFC-AGG-ID: iQXUkPdGMJabH5IPlqLbQw_1748867183
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4fea70656so692815f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 05:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748867183; x=1749471983;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=murmMMX5h7qj5SslZFh+7lBZ+d1kCAp76FkWnJBtyAE=;
        b=MAJGAAdueH1xVfHjbxybVXeAmsZkqiMA1s0eg2kpPf3tukwqCRzDAofnQxVnx+r71x
         JwsX+hlcnrbRc3eWItl7p6EM/hPUWSAkzdUpVg5D5SXckKnWaJiatg/c1vSrC9oDFqpr
         93O1YDdTnq1zp51C2yTwwk/Sr45M6uJnQ/XQgEAzBNfuFBzaOGgpiYdspY2I1MWSB7Ca
         hvU3VT6jLQSO+VDoPJbJ0wgXAQHLKB1qpBa386m3TdqS/qpKeN9qU5lz3Ge+QPcCO7+F
         QeuUpxjvAMWIpiZcUWSillxE37vO7EOQja63VUGt3ZVrf7pzAFlSZooii3ED6s5SjVv/
         ogjA==
X-Forwarded-Encrypted: i=1; AJvYcCWLVKkk6SzNVL+HGvDRaxKqu57mGTNtAxRKU8Htw/gvF1H6Ihe7QGQw2/ls/wIqpn5H2me55Se1w0x6reA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS3CLFNC0Y2FDYKkRgOdFhEoXdMtUVBK3cdW5NVy2Tih7hWdra
	5VruGQ8UPV440S5OYcqtEn02MQgC+cWyfDfmOqH2OxcwvCppM6cvepO3fkUSMN0vPRf9DghUKZ8
	H2ZBW2kyxcxHQtN4i2kg9vNKsA2uKbsbZW+p9X0FdGUV7QpxaW1YQZvm1BvNBYOqF/w==
X-Gm-Gg: ASbGncvkiONL5waq+cxyTY3rE67zyWfMlDTbfwsC6d5/pAgMa04V0qLKr7LU5MuF6HG
	Nt6Bi2OaV/2uKWTwX1TeV9u55nXIPi5DglN05bu3S+t2itK2Phkqh09cpia0bcjv5v9Rpqdgaof
	pFQPUggHk6Aq8nNhTh/LoX55YE+dIz2Y4Gq0njEuDsreoajxVo1H+rl4ZvaIyHPgcYg6yCuH+4i
	tgHW+KUVGphN4un/rn5HzMbiBtQHIfrxP6Bh0337GgThKdkXtsGEaEWR0rUCwJ3Lh+SKmg7GqNE
	x9saxW4AsxHxwN+JqGrFfDOb7k5CSYq2xMzD0DTk/pryG2d2mnmF5vgGRwgWjLGXvGHR2VZHmOT
	TK4htf1iQbHn9S6XFbd0UbsOAKX2xEeIt5AY7HIc=
X-Received: by 2002:a5d:5f8b:0:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3a4f89ddd6fmr10574188f8f.33.1748867183247;
        Mon, 02 Jun 2025 05:26:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnaWANB9zbp0ilBADD04kHr3ms2pu7nAWaU9IC6TaCnKgeYHJWpaEq5+LUjY+ufTDAVKKdWQ==
X-Received: by 2002:a5d:5f8b:0:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3a4f89ddd6fmr10574165f8f.33.1748867182869;
        Mon, 02 Jun 2025 05:26:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7e5sm14699842f8f.28.2025.06.02.05.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 05:26:22 -0700 (PDT)
Message-ID: <6dd3af08-b3be-4a68-af3d-1fc1b79f4279@redhat.com>
Date: Mon, 2 Jun 2025 14:26:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: Fix uprobe pte be overwritten when expanding
 vma
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org, oleg@redhat.com,
 peterz@infradead.org, akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, pulehui@huawei.com
References: <20250529155650.4017699-1-pulehui@huaweicloud.com>
 <20250529155650.4017699-2-pulehui@huaweicloud.com>
 <962c6be7-e37a-4990-8952-bf8b17f6467d@redhat.com>
 <009fe1d5-9d98-45f1-89f0-04e2ee8f0ade@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <009fe1d5-9d98-45f1-89f0-04e2ee8f0ade@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.06.25 13:55, Lorenzo Stoakes wrote:
> On Fri, May 30, 2025 at 08:51:14PM +0200, David Hildenbrand wrote:
>>>    	if (vp->remove) {
>>> @@ -1823,6 +1829,14 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
>>>    		faulted_in_anon_vma = false;
>>>    	}
>>> +	/*
>>> +	 * If the VMA we are copying might contain a uprobe PTE, ensure
>>> +	 * that we do not establish one upon merge. Otherwise, when mremap()
>>> +	 * moves page tables, it will orphan the newly created PTE.
>>> +	 */
>>> +	if (vma->vm_file)
>>> +		vmg.skip_vma_uprobe = true;
>>> +
>>
>> Assuming we extend the VMA on the way (not merge), would we handle that
>> properly?
>>
>> Or is that not possible on this code path or already broken either way?
> 
> I'm not sure in what context you mean expand, vma_merge_new_range() calls
> vma_expand() so we call an expand a merge here, and this flag will be
> obeyed.

Essentially, an mremap() that grows an existing mapping while moving it.

Assume we have

[ VMA 0 ] [ VMA X]

And want to grow VMA 0 by 1 page.

We cannot grow in-place, so we'll have to copy VMA 0 to another VMA, and 
while at it, expand it by 1 page.

expand_vma()->move_vma()->copy_vma_and_data()->copy_vma()


But maybe I'm getting lost in the code. (e.g., expand_vma() vs. 
vma_expand() ... confusing :) )

-- 
Cheers,

David / dhildenb

