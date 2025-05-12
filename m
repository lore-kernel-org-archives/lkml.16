Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA629292C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051552; cv=none; b=ow1xo9f60NIxYWM8frEBk4jpWUOkbWefvZpbyCWFAONldl8ZxHNKVhFuXX13z5cw60rR7q+bnPtvKpFGVFsnysWx7o30GIeGo459RKHij1/mCZRlEe36tPEB2/F/GyunAjlFj9K+hnnCqO8kR+mEEIfzJcAVQYrM/VJTQ3qFefg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051552; c=relaxed/simple;
	bh=7dbu82ejJ+k5pWlX8fg5pJ+AOfvHzyYIV9fHhxpAldc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwWTnvX6tV8BfV7FQJbGf1y9ILG+QYCUoY3GUCdNhN5YZd077zo2cyf8tLsxm6yl5EfEeXEPdhO8cmmqldcbfPTPyhBE4Cq/o58wZWhhVWLaJ+t2ls5x1xfdZKX9kYQywmdugphaZtONnne/KSJqIavNmZD9sLlfTD1X7arMYnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gs3PV9Hd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gs3PV9Hd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747051549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wdJlzktGGrJqFesVqic51nFN+xlPwzqlSYZMp8S0TxI=;
	b=gs3PV9HdfUEH/WxJRReWKNevdsQxZpDxRcxxA3wvi063o3GtVmp1en9tI4WEtJPcQTh599
	BawGcd3IPTcVNsjuP1wLDWTmCrk70g2lEcbddVujwLtER68Iy11Y6kZ75LxUVAgR5mh7vf
	wX6uqRz4g+6ahy8RVGgKxE3GIeHGlP0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-A75BA0A7PAiOujQc6fCJmg-1; Mon, 12 May 2025 08:05:48 -0400
X-MC-Unique: A75BA0A7PAiOujQc6fCJmg-1
X-Mimecast-MFC-AGG-ID: A75BA0A7PAiOujQc6fCJmg_1747051547
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so21564085e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051547; x=1747656347;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wdJlzktGGrJqFesVqic51nFN+xlPwzqlSYZMp8S0TxI=;
        b=f9F4KEkxAxODP5eYjIA4gF6Mo7qC9WsxvjEjS+/D6zR6J27Vzluvxki2jeHPIDu5dP
         heP4FVGkJCXtVCKHI7g9mioZD3LdemIVgcxmeQBkDDZFxSKyMUCwQT+Sc46RXwLFcHSa
         h9Bxj0UybVn7UqJoM30qfz3PQoleGmz4ar3cSDI85VxrgcFdjJCD23B3lafTVrQf8qhx
         Snmv/2wAj4RjvF64QvYq8CMNVjoNZqY1vnQ6J37MUOH0v/PIRn6JY+qrY2nwevJ5BmB5
         Ue5OH0dyreO0HEpybeMl7GzBzY0fYI5h/vP9kmk7uIRw2NcAnHmwC/oQVlNNEIN8V/RT
         MvDw==
X-Forwarded-Encrypted: i=1; AJvYcCXcsdkor7YNennGwTIRXERt2UA8kmiESrnjrcMLGjc4wvwe+joIeNNFxw3Rh4OguD1R8wSOBow18Bd6J+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOxsK9ZMnj4IWnkQhYr81Nyfdczxx4JpnJ5YhEk8kQyBiSWmIc
	46qjWiXKmLRmzHDAleXDZpYIHVsmXJIHGXf8ukh1r/fEbY1bJku4yXSA1MGPYcGm8C0NXAfU7aY
	PGlsY8fY4LekVGxg/V40MbEtUwJrQEUnji3e0EyjlHd76rNxYBfvSsYegH7b4HQ==
X-Gm-Gg: ASbGncuwhcDD6RxtsLkctImHf6RdAdCoKJD1QMPDtsPJKAniRGkPM0x0roL7hTjOLzj
	Ilb1/8wQgqphibsRv42ovPi5Ryx6mn7L5iuSGI8DFCQwFIxrHh7DfcS9y8G6DTrtqOE0PetYJmH
	7mdNQ4Rf/OvZPOo39uyeelkJAusee2ahuV9ooI2/bP53jY7lcQDmMOKh1s0IbF4886Cvd1VFypS
	cvInKYxxMnup+wqDOvq1mBKiDwfCkqOn1+4VL1c4+jgUDhg/7Yh1s/osuyC9noOG42A8r45qDqh
	Ghivq0dO+OqG/t5oi03OKGcHO0+tz8v358lke2tuJh1wWPszTbVPcLWv+6ch5FRaQBFJUW5XG2c
	67PBzxmSNut6CN/rd1BVZO/PloFVzn5OG+ydpHw0=
X-Received: by 2002:a05:6000:2a1:b0:3a0:b733:f262 with SMTP id ffacd0b85a97d-3a1f64ab58bmr10472091f8f.51.1747051547093;
        Mon, 12 May 2025 05:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFASPPotExaPDA1hbZyCJdrcf7Y8GXHdAS7ODG1uszxEfWE0IHpAxbF5G0Tk+V/yx8Uk0/lbA==
X-Received: by 2002:a05:6000:2a1:b0:3a0:b733:f262 with SMTP id ffacd0b85a97d-3a1f64ab58bmr10472042f8f.51.1747051546618;
        Mon, 12 May 2025 05:05:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0? (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de100sm12085800f8f.2.2025.05.12.05.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:05:46 -0700 (PDT)
Message-ID: <836f2574-cb60-44c5-865c-7f13a90779ec@redhat.com>
Date: Mon, 12 May 2025 14:05:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
 <001dfd4f-27f2-407f-bd1c-21928a754342@redhat.com>
 <e37d5e61-54e7-4425-837f-25a13f5a68b5@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e37d5e61-54e7-4425-837f-25a13f5a68b5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>>    static inline void arch_leave_lazy_mmu_mode(void)
>>>    {
>>> +    if (in_interrupt())
>>> +        return;
>>> +
>>>        arch_flush_lazy_mmu_mode();
>>>        clear_thread_flag(TIF_LAZY_MMU);
>>>    }
>>
>> I guess in all cases we could optimize out the in_interrupt() check on !debug
>> configs.
> 
> I think that assumes we can easily and accurately identify all configs that
> cause this? We've identified 2 but I'm not confident that it's a full list.

Agreed. I was wondering if we could convert the ones to use different 
pte helpers, whereby these helpers would not be available without 
CONFIG_WHATEVER. Then, make these features select CONFIG_WHATEVER.

VM_WARN_ON_* would be used to catch any violations / wrong use of pte 
helpers.

> Also, KFENCE isn't really a debug config (despite me calling it that in the
> commit log) - it's supposed to be something that can be enabled in production
> builds.

Agreed. Even Fedora has it.

> 
>>
>> Hm, maybe there is an elegant way to catch all of these "problematic" users?
> 
> I'm all ears if you have any suggestions? :)
> 
> 
> It actaully looks like x86/XEN tries to solves this problem in a similar way:

Heh, yes. Good old xen ...

> 
> enum xen_lazy_mode xen_get_lazy_mode(void)
> {
> 	if (in_interrupt())
> 		return XEN_LAZY_NONE;
> 
> 	return this_cpu_read(xen_lazy_mode);
> }
> 
> Although I'm not convinced it's fully robust. It also has:
> 
> static inline void enter_lazy(enum xen_lazy_mode mode)
> {
> 	BUG_ON(this_cpu_read(xen_lazy_mode) != XEN_LAZY_NONE);
> 
> 	this_cpu_write(xen_lazy_mode, mode);
> }
> 
> which is called as part of its arch_enter_lazy_mmu_mode() implementation. If a
> task was already in lazy mmu mode when an interrupt comes in and causes the
> nested arch_enter_lazy_mmu_mode() that we saw in this bug report, surely that
> BUG_ON() should trigger?

Hm, good point. But that code is old, so probably something seems to be 
preventing that?


In any case, just a thought on the in_interrupt() check, I think this 
commit is good enough as is.

-- 
Cheers,

David / dhildenb

