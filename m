Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E644B24EF6B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749197423; cv=none; b=em4UPVvsqljir2J2pDMJ7NHYOX68aIoFjw9I1sQO8bhfixuqLtI4h3o3hYHLCR4pUlnDITuGbNUY29/5fObU9V8w0zpn/sfyOto3Lf8nHcRy0bO5lsJ+NlJyxpCZUt+ZvfOQVLZiRGM7PPeCqg/70IwBM8NO/e2AE6ml9X3F3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749197423; c=relaxed/simple;
	bh=ed3iYZxj/bkADTvi6/RBiRyo65J4DexkSFcC7X5WWUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egPhZfK6WRpdGzrnNPPNOE5rL0MCeqlPJJ24zo/sTEv3HMETMJVKro3NIzF26I2B9sKgZSO0idOerSRCQQVXYj5aOrx4mpmB5v0s4sFzfpG/kOgiPAgmAYWOKKC0WY79n3gcxJFPkWNrEzfrrVrGkIUkY5v5zcTuSX0r8sHWsxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i0V+QLvs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i0V+QLvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749197419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BzXpsCbWTh+qneVA6YXegvWNr4iNkf7BFp5c7exIwT4=;
	b=i0V+QLvs5+BqgSyYcZBSzgej3GbZqIXAkGK16MQ+Cvr7k4DejRaNbRIkGlDzT944mzE9pV
	JTc8A/1/oL9aCoX7scVYCB/vixeK3e+c7AJG0x7j93j4ydUL2U26z/6+CZwn+BBvdqMnqO
	PDCieRA/He02swA8viU9YY/A9WKZ4eM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-NDhvKzTLN26eBKF66uKDmQ-1; Fri, 06 Jun 2025 04:10:17 -0400
X-MC-Unique: NDhvKzTLN26eBKF66uKDmQ-1
X-Mimecast-MFC-AGG-ID: NDhvKzTLN26eBKF66uKDmQ_1749197417
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-440667e7f92so13158865e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 01:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749197416; x=1749802216;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BzXpsCbWTh+qneVA6YXegvWNr4iNkf7BFp5c7exIwT4=;
        b=MFYWbPF5r8c3JkWV1kBEbld9y/GadJ/vKFQ1slM/DNgWvFfiZDF5sPsVG0kMFk1sJD
         g/9e0Rvmpjcrwm7HvkWUHtT0fHieXAc0VCFBM8nKIDS9gwtZRo5kXAwzLilQ2J0seypy
         R4fzeYghZjJbAhJfdXN/dTpoVkn+BwiO7b2+0+pcFPo5GtY/fUURAp6mnu05sqPJCMLj
         E3jy2sxEVpv73yWKjHvLEMrcvwZld1Gei0LzcsPutQdbEdc+CUTO/nZ/3bXFluWnsCxo
         tMyLVCVbuv1HLKLcxzN5xIxCy6QPgcDhwMrd11VUhk81+4uWwuOyGUNmehDkWzyu3xWt
         L0jw==
X-Gm-Message-State: AOJu0YxBEETRqcJbPc1kJTM7bY2wWbDQRnVoYggpdOnPDMOdpBA/FJN/
	qGF8hWjDy7LtB3oUKcJKZdauyVNB1l3OxWIQTWBcyewm56PqENdGJfpqUTYyib8UrXLVQbkLpQH
	QzI+gGQpoJSJ+D7zs6NzdMO64UB0GYObYZhfI56HC7gJ03qFBVOWNmSqbto0GcBK7LQ==
X-Gm-Gg: ASbGncsMZDEyR+iqpzHItEWQR4X6R/RSEavsmB4zozlx0zK+yH3Siy4viGiPwe2sROh
	DzAnY6FCyAOCJDv4jjuTzp5uqghydBYy1ATy4KlUDvNU4E1ZReFXFhXFal+1Oosy62Yxpf4zmkY
	i54WBSvcbc++Hkrsox9sS5ImrUkOU9hvOmDrYLcoqjOJlv0d1vDOx2EtVzl79tWAq/OFwH9SUKM
	0qUrxjqrNw1ANvyaH2Gg053dt6dEjK/cDa6CYqlwvuFUqo/MCh7DBTQRo80TWiFUT0Li28m3eA/
	Eq3VOG/8HCwjC1InQ8dm0MamTiH7MjViLgafdqZjueHIHM4P2ERRaPdADmegU3wR3/kINFafzBL
	eEN2PMBoCgaIYGOqc4vVfRczge/vekWA=
X-Received: by 2002:a05:600c:1d28:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-4520138d52bmr25198455e9.14.1749197416547;
        Fri, 06 Jun 2025 01:10:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXbfYBLlw30TpWI/nhX0/Y2Jzw1L0SQ56LKVYxzmq/2rdedHcG1P8PLiB9HUWJPioPjwQacA==
X-Received: by 2002:a05:600c:1d28:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-4520138d52bmr25198195e9.14.1749197416152;
        Fri, 06 Jun 2025 01:10:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c7761sm12688405e9.32.2025.06.06.01.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 01:10:15 -0700 (PDT)
Message-ID: <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
Date: Fri, 6 Jun 2025 10:10:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aEFC_12om2UHFGbu@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 09:10, Michal Hocko wrote:
> On Wed 04-06-25 16:05:44, David Hildenbrand wrote:
>> Especially once we hit one of the assertions in
>> sanity_check_pinned_pages(), observing follow-up assertions failing
>> in other code can give good clues about what went wrong, so use
>> VM_WARN_ON_ONCE instead.
>>
>> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
>> well. Add one comment for the pfn_valid() check.
>>
>> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
>>
>> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
>> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
>> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
>> happen", but more reasonable to check for during early testing.
> 
> The patch itself makes sense and I think it is good time to revisit old
> discussion [1] and finally drop VM_BUG_ON altogether and replace it by
> VM_WARN_ON which could be still a useful debugging aid.

Yes. I think we should check all cases if they are really relevant (and 
are clear), and also handle BUG_ON on the way.

... essentially what I did in this patch :)

Thanks!

-- 
Cheers,

David / dhildenb

