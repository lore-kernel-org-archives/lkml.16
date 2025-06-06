Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94970286429
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205652; cv=none; b=qt7+45TrqFLCaICZ91vPf0LXpMfEV4Q+2ySujhBEC87pHC/mz9rFi32FYALjIMxI406osiKwScIjIB6YL6Nmdb5AKd+JH285/xVJ9m/SDrLzgGyMkLKozHsPhCtGvZ0qXVThl/1yv37NwyMfnyi5eMr24XOzsZ/xHh2H38ylZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205652; c=relaxed/simple;
	bh=c0gmJhz6Vo5J5fS8JVlxk3484ukkLDXwOpoG2XbOVHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=STe8NBbYysZsIvUjFZHBtJHl2SAWFX/OSltsG/vCj7eK80TpdvFG5R1I0mnzufGQHt5kZKaPz7hMSIYRUXFedA5Y44ib6FdYSDUTcEw5g6nCQeBAwBbicBVGS5cRvdihsaWZX3Q2Hke0pv8uNxgh4xaBRmMTjjrW5taerGveR7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFPQkX3c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFPQkX3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749205649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B2FoVaJKHKmklTyZk1cv0vTh0MbuFjlj3z+B0k4EatA=;
	b=hFPQkX3cTzW0cQBkv266xz0If5p0dPIX7ejyKoYqEJ7Y0fIawveBOnk9bnMldnPuADJnGs
	iulxsIgl6XDv/5TNl0Y8hTXFF9LDE+dqXsd+H6l4QpnvAV2GU0EhAnRHbLfSZFjOKQnMUj
	pFc0n9niaXAO7CUPDX2UUpG6rqdoMFo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-1qah_E5QMFSi9VcbT8TZLQ-1; Fri, 06 Jun 2025 06:27:28 -0400
X-MC-Unique: 1qah_E5QMFSi9VcbT8TZLQ-1
X-Mimecast-MFC-AGG-ID: 1qah_E5QMFSi9VcbT8TZLQ_1749205647
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450db029f2aso9725535e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 03:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205647; x=1749810447;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B2FoVaJKHKmklTyZk1cv0vTh0MbuFjlj3z+B0k4EatA=;
        b=GgcagfzxLv39hcJqg2y/EYQx3Lm9eEMgLIdQFNuG0ZQoH+9uRUAuGsBTlwOuUmVVYR
         rL//JaK/6VXjFPZiShQJAfjyN160Eycn5uIWLNmDL9TRsBuTzXBRepJzNOf7uDbdg1sm
         qOkG/jiUfHGrn4l5CKLEzMRIDnADG7/9XX+fW3A1qgpni1chYg+RjP44IQT9ghAg4sXQ
         RRfZH7/UOWfbrljz+ydrCanNPEY9y8xYf1L+lEiKWTFZY8o8VQJjTYsvooYAz6zcFShd
         isMNg5D2jWCwdjcJ/KnXsIqz5N0k6jP5M7j1gXCKdlMQMdqaHICrztHUbY5l+Z9UWmIl
         6r4w==
X-Gm-Message-State: AOJu0YzFtQP7xy+OLg/aE8OB/8w2guzc4SeymWT0rmi+tFCnYz1RqUuE
	JXUriwwGj7EJODydIdoqqBgZtnIZVHQfhaW7sGAckvpC/r23Ytv4W3dum/ivUCzZ+n4XKVNCYBW
	emHsKkmmcqpnuvxfEeUaWEwA+g+nfq3PXAa03lqy7ExPGMskTE48SHdTfeM6uMAPT7Q==
X-Gm-Gg: ASbGnct4tnumN8mQXqXV/DqD7yXpQPytrxE1sRtcbiy7QMuTO1Sor6fMOHkpK4Tm6N7
	TiYfH+w7PCkcJxIipJuAay17Pt0NjTLLg1NFMkSzJIqDoaEMSAd0dco1rpPsE/xPOckI40rGpLf
	M6ZuIfNg6zgkZcgHYXOuDxGmaeggS0yCjAabYtw5rh7hwpaFzr+V5pzKvEk+9zFtDYNhF3s1zSC
	WNTiwSRnOGMs7fDwjg/wtFaoAowsphnFFwBkBjB9hPKFXTQxLZZxtuoM3uRGX6btiylCxVfGPkr
	Dh2C0dwMkrVRXyphXnP/JxS9IuczfVBB3l20a89WPMa4IDZuy7wZ19AauMo70uF5JNOpNoWTfLb
	pGgIoIyx7NFb7VdqiVhJW9L4S2wb9XAs=
X-Received: by 2002:a05:600c:c163:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-452fa7ed515mr10712215e9.23.1749205646954;
        Fri, 06 Jun 2025 03:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEmbcYjLTgLVCUtyFzzP95tBUCDltp5qdbSNrDM3KqC5dmjOdzJWRJz8svdB+Fvl+EBl5V/w==
X-Received: by 2002:a05:600c:c163:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-452fa7ed515mr10711905e9.23.1749205646496;
        Fri, 06 Jun 2025 03:27:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm16346055e9.25.2025.06.06.03.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:27:26 -0700 (PDT)
Message-ID: <03fa1946-e02f-4bd5-96bd-e8a2f77c0807@redhat.com>
Date: Fri, 6 Jun 2025 12:27:25 +0200
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
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aEK_R93gihEn-xW6@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 12:13, Michal Hocko wrote:
> On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
>> On 06.06.25 10:31, Michal Hocko wrote:
> [...]
>>> Turning them into VM_WARN_ON
>>> should be reasonably safe as they are not enabled in production
>>> environment anyway so we cannot really rely on those. Having them in
>>> WARN form would be still useful for debugging and those that really need
>>> a crash dump while debugging can achieve the same result.
>>
>> One question is if we should be VM_WARN_ON vs. VM_WARN_ON_ONCE ...
> 
> *WARN_ONCE ha a very limited use from code paths which are generally
> shared by many callers. You just see one and then nothing. Some time ago
> we have discussed an option to have _ONCE per call trace but I haven't
> see any follow up.

While true, getting a flood of the same events is absolutely not helpful 
in my experience.

Usually one cares about a single instance of any events, even if 
triggered by various code paths.

Sure, there are some other cases ... which brings me back of my original 
point of doing it stepwise.

> 
> Anyway starting without _ONCE seems like safer option because we are not
> losing potentially useful debugging information. Afterall this is
> debugging only thing. But no strong position on my side.

Yeah.

> 
>> VM_BUG_ON is essentially a "once" thing so far, but then, we don't continue
>> ... so probably most should be _ONCE.
>>
>>>
>>> So while I agree that many of them could be dropped or made more clear
>>> those could be dealt with after a mass move. An advantage of this would
>>> be that we can drop VM_BUG_ON* and stop new instances from being added.
>>
>> As a first step we could probably just #define them to go to the
>> VM_WARN_ON_* variants and see what happens.
> 
> You meand VM_BUG_ON expand to VM_WARN_ON by default?

That's one approach with little churn, that still allows us easily to go 
through them and re-evaluate them later as we actually remove them.

-- 
Cheers,

David / dhildenb

