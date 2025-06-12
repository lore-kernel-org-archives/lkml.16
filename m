Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09DD24886A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737376; cv=none; b=NbBiGbd1LUvyFDGUNWeBiDKeIBOJabvk1xxgsczm7XZdAPDUfkyIubP/pKXBETPtwoHTPpis2hTCE6zoMgxEQJKbxGT/ZEALmjW2irn8g7STEl14zyvIGD7UyrvJFZ/eYgyDMsc/v5TEIzF7bukSCfbqlb+tp2HjsuI/AATXagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737376; c=relaxed/simple;
	bh=lDJGBO71hzMP8aKb9jifNapwG+u45JFlayalLaFm9jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8Pg1drKRoUAw8tsRm5yWAzt6wxJQ5UuT4zSI7J05G5T5II+sACSu1h9YJYweBzaFXAERLcVuWXLbVPW8JBMhe6focdR5gVtQFKernOlNF3/Zfvu8Y5Xemy2a4NEbA4lG5HJEqU9B0BlWUFH4hAiHtFUjHr3AqnXV1JZeBQ9FFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CadPWSR7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CadPWSR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749737372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wKY2N+Aph6hgz3wojEfPo7Lx0+YJQZfbnorz9nqpVt0=;
	b=CadPWSR7Zvfoi9xEryoOt8/FQ91qKmJzqtbhFbjagHf2SIHAgk4DcHpCnZbOQiVzKd9cuQ
	Ci0LIqW16Zz8QpX/9tl7G4geDfU08nwTrWX2M9kfz/uIpPgMWE+KF0H70cuVhwHsnQ4LZK
	HG7yPif8PxiO1UOvEWB2a2ZSUGu60LQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-zmOG1tkIMoSU5uGLFsRByQ-1; Thu, 12 Jun 2025 10:09:31 -0400
X-MC-Unique: zmOG1tkIMoSU5uGLFsRByQ-1
X-Mimecast-MFC-AGG-ID: zmOG1tkIMoSU5uGLFsRByQ_1749737370
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso4883695e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737370; x=1750342170;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wKY2N+Aph6hgz3wojEfPo7Lx0+YJQZfbnorz9nqpVt0=;
        b=dGBmltE6Q5ZdNlqVq6vSNhD3PhSqAf5Qjy0T/tlgoYqHHDrxvbnRBGfQ9nr5tIjY0t
         RGa8rJvcZ0NhFatE6Dn7gzDCm2hd7wNLYa+XyNcVG1SwhhtuhEPYP+L8nN5h/1+YfMN9
         Ikcj4D9e8T4TkrRlQA6Uhb8NrhS+ko/l0R5pBwiAf9gcAbrTmcPgJOyUYyZuZikAxsKy
         K8nJj5Vdb1oyiE8NntnmekXTBxkfFzu1DObEvN6kotTV+7Ywc9CsYFi8bIoJRobGQCBL
         g4COl4bXcBCKpYCnUjfZcD4LQJ6b+d0Y7PT6+UzVkE3xkuSqQf2P6yQM0H6XQne9+txg
         fiEA==
X-Forwarded-Encrypted: i=1; AJvYcCWMORTAJux5DuSqJ+CvgKuu72+NBTc/5eI3Z7RWr0pVzkqcwF4f3vHSOl1jWUQjHtgKg/DFs8hiJ2G+Qug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBMEy1YcqCte5c1+bFbrohmdbXIpTfN4WG0IAbMVOdiwne7mM/
	o6aLdZNgAJ9sxWmuhQlcJ+PTnvgLreFQ2HCb4DBbCi24iCXmaUkMOwpJwvAmLzMtBITq63Ef/A0
	OJricoaX5Bftwwf+mqss/TCf42YL/0hysGD1JovHUnuRMQ1Fpj/mTCV9PNzLtBBZvTA==
X-Gm-Gg: ASbGncswPDyDTY/ZuywVQs/djoFrsVXDlMGDTT8hzGsYNoGbp5o1ZOlFBQu6NC91UqT
	p5UFittGReqX26y6l4L2Xs3BGrBfwSC8uZEzVmFW+w0W9otDGLsje+e0p2vpgvWn0fhhi3ZPep2
	y1pHrTf17XwMmUu1mtl1CC+I5YY7FeL70oSrFSwTHHoml4NocRn71NAWo1zqSaf2HFzvGAiwPwL
	nknYMXH0ixjNkyNRU1qZLW7aoedUBwGXNIxYHY0ChFewDprNJjK8d6YEkT2BKYWaW7QvqP/Hy5u
	wNiTdzTzLDBWU5J0k66nj1M5vJSw1uXzWwUdmU/8DEZwwaCMYFesFU9jdvo0l9q5ZJ0udeCY9tF
	sHP68lZVHPAmOvgsCy3kGmFeWtf6X/GzQhW84rONj0mu+A6J4FA==
X-Received: by 2002:a05:600c:3484:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4532c2b3123mr41419205e9.14.1749737370102;
        Thu, 12 Jun 2025 07:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHchrfYeanSfVSJ93acTE37YI2P3J+4sMmKHrSV1QGqukCFLqYv8slPnv7J8m7aLWBflSDeIQ==
X-Received: by 2002:a05:600c:3484:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4532c2b3123mr41418385e9.14.1749737369465;
        Thu, 12 Jun 2025 07:09:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:1e00:1e1e:7a32:e798:6457? (p200300d82f2c1e001e1e7a32e7986457.dip0.t-ipconnect.de. [2003:d8:2f2c:1e00:1e1e:7a32:e798:6457])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce6bsm2085920f8f.49.2025.06.12.07.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:09:28 -0700 (PDT)
Message-ID: <ee646bca-e77d-4452-82f8-0bdb4b241f9c@redhat.com>
Date: Thu, 12 Jun 2025 16:09:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
 <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
 <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



>> @@ -265,6 +265,42 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>                                           unsigned long tva_flags,
>>                                           unsigned long orders);
>> +/* Strictly mask requested anonymous orders according to sysfs settings. */
>> +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>> +       unsigned long tva_flags, unsigned long orders)
>> +{
>> +       const unsigned long always = READ_ONCE(huge_anon_orders_always);
>> +       const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>> +       const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>> +       const unsigned long never = ~(always | madvise | inherit);
>> +
>> +       /* Disallow orders that are set to NEVER directly ... */
>> +       orders &= ~never;
>> +
>> +       /* ... or through inheritance (global == NEVER). */
>> +       if (!hugepage_global_enabled())
>> +               orders &= ~inherit;
>> +
>> +       /*
>> +        * Otherwise, we only enforce sysfs settings if asked. In addition,
>> +        * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>> +        * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
>> +        * set.
>> +        */
>> +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
>> +               return orders;
> 
> This implicitly does a & mask as per suggested previous version, which I think
> is correct but worth pointing out.

Yes.

> 
>> +
>> +       if (!(vm_flags & VM_HUGEPAGE)) {
> 
> Don't love this sort of mega negation here. I read this as _does_ have huge
> page...

Well, it's very common to do that, but not objecting to something that 
is clearer ;)

I assume you spotted the

if (!(tva_flags & TVA_ENFORCE_SYSFS))

:P

if (vm_flags & VM_HUGEPAGE)
	return orders;


Would have been easier.

> 
>> +               /* Disallow orders that are set to MADVISE directly ... */
>> +               orders &= ~madvise;
>> +
>> +               /* ... or through inheritance (global == MADVISE). */
>> +               if (!hugepage_global_always())
>> +                       orders &= ~inherit;
> 
> I hate this implicit 'not hugepage global always so this means either never or
> madvise and since we cleared orders for never this means madvise' mental
> gymnastics required here.
> 
> Yeah I feel this is a bridge too far, we're getting into double negation and I
> think that's more confusiong.


Same here ... I think we should just have hugepage_global_madvise(). :)

> 
> 
>> +       }
> 
> I propose a compromise as I rather like your 'exclude never' negation bit.
> 
> So:
> 
> /* Strictly mask requested anonymous orders according to sysfs settings. */
> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>                  unsigned long tva_flags, unsigned long orders)
> {
>          const unsigned long always = READ_ONCE(huge_anon_orders_always);
>          const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>          const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> 	const unsigned long never = ~(always | madvise | inherit);
>          const bool inherit_enabled = hugepage_global_enabled();

Can we just have hugepage_global_never/disabled() to use instead?

> 
> 	/* Disallow orders that are set to NEVER directly ... */
> 	orders &= ~never;
> 
> 	/* ... or through inheritance (global == NEVER). */
> 	if (!inherit_enabled)
 > 		orders &= ~inherit;>
> 	/*
> 	 * Otherwise, we only enforce sysfs settings if asked. In addition,
> 	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> 	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> 	 * set.
> 	 */
> 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> 		return orders;
> 
> 	if (hugepage_global_always())
> 		return orders & (always | inherit);
> 
> 	/* We already excluded never inherit above. */
> 	if (vm_flags & VM_HUGEPAGE)
> 		return orders & (always | madvise | inherit);
> 
> 	return orders & always;
> }
> 
> What do you think?

With the fixup, it would work for me. No magical "mask" variables :D

 > >
>> +       return orders;
>> +}
>> +
>>   /**
>>    * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
>>    * @vma:  the vm area to check
>> @@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>>                                         unsigned long orders)
>>   {
>>          /* Optimization to check if required orders are enabled early. */
>> -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>> -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
>> -
>> -               if (vm_flags & VM_HUGEPAGE)
>> -                       mask |= READ_ONCE(huge_anon_orders_madvise);
>> -               if (hugepage_global_always() ||
>> -                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
>> -                       mask |= READ_ONCE(huge_anon_orders_inherit);
>> -
>> -               orders &= mask;
>> +       if (vma_is_anonymous(vma)) {
>> +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
>>                  if (!orders)
>>                          return 0;
> 
> I pointed out to Baolin that __thp_vma_allowable_orders() handles the orders ==
> 0 case almost immediately so there's no need to do this, it just makes the code
> noisier.

The reason we added it in the first place was to not do the (expensive) 
function call.


-- 
Cheers,

David / dhildenb

