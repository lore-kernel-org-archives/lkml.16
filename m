Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97091202987
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840834; cv=none; b=FZcfHAp9q7L2BiwwnpqXZTUldjzZ9uV6rvXwVvbUlXhvBe1yVl3B5464TLeSjuhnPJ6ZaKhScRnqkQgCsZWqg7jN7DEJAYy8XgB/LBH0xuYkAc3pwHFBKCzmWlQfCa9cGBVYq5h/ROV+PzEgEAos9BHMljPyYcak6Mae+tbSqQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840834; c=relaxed/simple;
	bh=5L5MUFavT1thMB1tpt29DJ1nOr8uO3Rlkn4Co5FGgAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exF/dJqA28pqkBbzV8yGlNlrtkOE0+QbJ5T3Cl/rz//Ugp2YHvZsRnNHbKyYQ4TneEKaOlz4cJW+PC5R67XVHOmJT1hLaCHqDT69TX4FOdREIwMeYJ9Gex2ddmdaygjaPeSA+ihPBWnZRTpmqkbHZPNXYgFphyAboE+cF8h/Ags=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5PnxLp6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5PnxLp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750840830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1GBhPYm37wvmLi6jS+3dbtOSdMwC0yaFOC4KWxoS5RA=;
	b=N5PnxLp6PNqnh6yEcFh2utRrr0pHxqJFMa+z6NXpj1J6zOCinHKonKH1bIAlVacGHddyUd
	/p/lV1C/Qx8ianLAHJmIJlUTiUPkz6HkG6FyJZJQAw8xdsqdtwAl6LjIzfb9DLKUHZRdj4
	87ovz23ZguleZ0Zhak88I90GpL48mnU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-U9QLeoWhO3ig7VUho3eJ0g-1; Wed, 25 Jun 2025 04:40:29 -0400
X-MC-Unique: U9QLeoWhO3ig7VUho3eJ0g-1
X-Mimecast-MFC-AGG-ID: U9QLeoWhO3ig7VUho3eJ0g_1750840827
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so27581445e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750840827; x=1751445627;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1GBhPYm37wvmLi6jS+3dbtOSdMwC0yaFOC4KWxoS5RA=;
        b=sUlT6dE21G/BcT8zRXtIOxf2LZYnHv9t7R3GaKmPPpH1hSSrBl2VTw31E4BxhDQi6v
         Ahrm/zwY4IV8/HgwARdVx9c2PygWUPfH7E6wsbmAsomtR4NnCnFQopABiNIXE/VBmnFu
         xxKnyXUP9qRuMUeJ0VzG372ddrQwccU0BiTN5s66lbibrs2mzfT0fUSqBXbG2sPrzXbf
         /JJ5B2ZZ+vJMKplJDE27/AwvydzJmOPMAfIC2Opsun+psiNdEmahDvsEjafOzL6Fqvkk
         glWlzDI9JJvM9/Y1Ku/b0cOMAGG5REhOpjHWThckNpDxCblBjZTZ8wp8NTnEtHaWVHOE
         T1ig==
X-Forwarded-Encrypted: i=1; AJvYcCUAt+2qf6+XDz9YE83GSZ4jpwBqyg+EQY/1uvT3X0hxQKzPTL10Bn3s2cO/isBOr1vgRJbNIrV4BCEz2yY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPVB61vUeMnnFjqUjg/l3CuLCzEk0wkJsRfM2vnNQ2Gpbdi9eY
	M4SKkomvEdKDzTcDDfLBlbPv+DhB0j+ZckzMsqc+mlgt2KfWRnOfoKUIeJxrYxS9pIpNOETTcFi
	I2GG5FC61R7J9xzos0gN5B68Kc2WwI+hFfuh85p+mCiNShMH4CQIVz8UIvI3HhdH4lA==
X-Gm-Gg: ASbGnctJtUmwh+1kqKV8iTf84lwiJQRFxlbTjgrRRXeLk6nK4+awZM6Xalf2PBonuB3
	CpDXflS0w0qV8Y2vxmInJiJKVrUD39/1QjBJdX8A7mTxiHL0NHTzpaWgvESrmZl2xdtjhDVuuUo
	tRY3hmgNwdMzi1u6qxGJYtqFUoCK02/L5IqFVyFjoX+hrEYHLhf6egkn6eGRACS/+5M3nPYYN2e
	Byq6vrGN/w4AYOzv4AacDRaCRdYNP6sXNbc4jDOEb8QSjZBHdT/bWF7nkEdIghf+u/2brhJG3+I
	sALTVbNziUWbdXEJbsvfHUVeO9/IK14U/7l82AIYguRjBwOwE++mxdoKoGOp6BeTqnWDLTQ46hD
	+Gt2o6NEXNbfKwjoHlvoZHt/ocNHoNWlV296vPGM6/jvh
X-Received: by 2002:a05:600c:1d0a:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-45381aafedbmr19623965e9.5.1750840826769;
        Wed, 25 Jun 2025 01:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsAcNjfLqJSJmC7ITvrekx9xCPzRXJwCgbTdWo6F8k+yVvTmk1lePpzDiqyAGDowT09bQ0hA==
X-Received: by 2002:a05:600c:1d0a:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-45381aafedbmr19623705e9.5.1750840826336;
        Wed, 25 Jun 2025 01:40:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235600csm12773795e9.20.2025.06.25.01.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 01:40:24 -0700 (PDT)
Message-ID: <a027fe94-e6c2-46d0-8768-6acd8e801cc3@redhat.com>
Date: Wed, 25 Jun 2025 10:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com>
 <db757c1f-8666-4a73-ab57-cce83059e95d@lucifer.local>
 <8691d74b-67ee-4e26-81ac-f6bf1725361e@redhat.com>
 <3b6db0c3-aef3-4a21-a154-6aafd639dbc7@lucifer.local>
 <6bda0de6-1ade-40c9-aa52-16bc02d98bee@redhat.com>
 <28051538-d3ea-4064-aef3-89f6dd98b119@redhat.com>
 <f36e64f2-f3d1-407e-862f-ceccc89ac9a8@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f36e64f2-f3d1-407e-862f-ceccc89ac9a8@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 10:22, Lorenzo Stoakes wrote:
> On Wed, Jun 25, 2025 at 10:16:46AM +0200, David Hildenbrand wrote:
>> On 25.06.25 09:49, David Hildenbrand wrote:
>>> I think the whole use case of using MADV_COLLAPSE to completely control
>>> THP allocation in a system is otherwise pretty hard to achieve, if there
>>> is no other way to tame THP allocation through page faults+khugepaged.
>>
>> Just want to add: for an app itself, it's doable in "madvise" mode perfectly
>> fine.
>>
>> If your app does a MADV_HUGEPAGE, it can get a THP during page-fault +
>> khugepaged.
>>
>> If your app does not do a MADV_HUGEPAGE, it can get a THP through
>> MADV_COLLAPSE.
>>
>> So the "madvise" mode actually works.
> 
> Right, but for me MADV_COLLAPSE is more about 'I want THPs _now_ (if available),
> not when khugepaged decides to give me some'.
> 
> So we have multiple semantics at work here, unfortunately.
> 
>>
>> The problem appears as soon as we want to control other processes that might
>> be setting MADV_HUGEPAGE, and we actually want to control the behavior using
>> process_madvise(MADV_COLLAPSE), to say "well, the MADV_HUGEPAGE" should be
>> ignored.
> 
> This is a _very_ specialist use.
> 
> I'd argue for a 'manual' mode to be added to sysfs to cover this case, with
> 'never' having the 'actually means never' semantics.
> 
> You might argue that could confuse things, but it'd retain the 'de facto'
> understanding nearly everybody has about what thees flags mean, but give
> whatever user is out there that needs this the ability to continue doing what
> they want.
> 
> And we get into philosophy about not 'breaking' userland, not sure we have a
> TLB/page fault/folio allocation efficiency contract with userland :)
> 
> No program will break with this patch applied. Just potentially get performance
> degradation in a very, very specialist case.
> 
>>
>> Then, you configure "never" system-wide and use
>> process_madvise(MADV_COLLAPSE) to drive it all manually.
>>
>> Curious to learn if there is such a user out there.
> 
> Oh me too :)

I just looked at the original use cases [1], such a use case is not 
mentioned.

But it did add process_madvise(MADV_COLLAPSE) in 
876b4a1896646cc85ec6b1fc1c9270928b7e0831 where we document

"
     This is useful for the development of userspace agents that seek to
     optimize THP utilization system-wide by using userspace signals to
     prioritize what memory is most deserving of being THP-backed.
"

The "prioritize" might indicate that this is used in combination with 
"madvise", not with "never"/


So yeah, it all boils down to

(1) If there is no such use case, "never can mean never". Because there
     is nothing to break, really.

(2) If there is such a use case, we might be breaking it.

[1] 
https://lore.kernel.org/linux-mm/20220706235936.2197195-1-zokeefe@google.com/

-- 
Cheers,

David / dhildenb

