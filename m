Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF3272E46
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778942; cv=none; b=ARTgreVAp7kv2xjOGe+TjWbkYjp6BbY1naCt0Eyz2S/EaCOVeUDZeJo7aSvDuKCT483YZikCGBiC4Bs+wjqBOIq8Kz6v1TYkMUx581U+jWU1kNu/XS/9LN4hLBgQ1Jo1R/8pqDfD9M01DvNX4Qe2x6xEf48nEOIyOQqNd7rqjHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778942; c=relaxed/simple;
	bh=1SeUvDPQ9AvKdvNgDnVQHnsGWVwf+mpmx62m39lyudM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOPihB07SER6lslsnAcaRyp3xJ5QxqiXxhAQF4kfL9xkBo/VK03ZKEk3igKsdh2+oWEYCiuRYkSaJ5LlRdGDHO755FEgx5/Sr2g4iAVF199Gy2k7QYimWwn4ASPO+xNJZAybDYJxxj7hqjf4ZRsUXy0xqGt2Zmpo3ak/80khh5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B4KcnF42; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B4KcnF42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746778939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=urSJHDeJh4o2u8qtJI9UoWmLZ2bklT7itdktKGdHXTc=;
	b=B4KcnF42M5vDVLaeVaKATy0bt4mSZG3atQ1EH+IRBChUmH0sJ4LXsnVujGyqXqwGLWQyWQ
	60HOsvsl3ai676jSBKlkZQ3s++OS24C+DqO0YJOGRLST4NANFg8Nv7I7VjzeQabRFCcEkR
	bpJzkMGBXIkCMiZIS+A7Uscqs4Hbv/o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-TnZY4j5fMWekxFmCOVQDvA-1; Fri, 09 May 2025 04:22:17 -0400
X-MC-Unique: TnZY4j5fMWekxFmCOVQDvA-1
X-Mimecast-MFC-AGG-ID: TnZY4j5fMWekxFmCOVQDvA_1746778937
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso1279121f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778936; x=1747383736;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=urSJHDeJh4o2u8qtJI9UoWmLZ2bklT7itdktKGdHXTc=;
        b=Ly3e6d7Y+IZT2hxusS8iTNK3zf/wLw4R8HdWfM9b8gee3VBkA76wD8/xLDWXWfpqRW
         anwUBrk9Kt1FZEOYJT9pNZUcSm9Mfugx0evCUi2krXaNfmjpTjkRxvPUeKCUv6jEPfXU
         Rde/f6Ys8stdcw3WLD3uAeA0Uwbbk7s00kyAKuOpMvjhpyQO8nQHP0GYapocqTC5yw6N
         pkynWJBRh8CQ6XvfuvAOGBLodnOw4ueAGemgyVHuwnUc7yUSt8VqaHNmVaRsXkugy0X3
         vkE06l3EW/UzXfjDxLA2Y0eJ5v4HKbyBtr3NNyx3wRQnKVA5jLt/FM9fxb02uJiptRj+
         gTdA==
X-Forwarded-Encrypted: i=1; AJvYcCUidifPjx47kR8fm0TRTsk85+CVGRIKr2Q9+rI3JJOC1OExw5U3XglipWTlO4WgUsoVb/qbsFjqqgaRi2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YydpYUqGlWnYLt1kp1zof5n+3wJ1z7NwClNTDFgi8fOnBIKpfKr
	Ym6LGofJs6cROtWqWzRi/noW9g1MfmLDgMDOlnjoDoEig09tnql8FO279jhNbvAyjiLjpvm7QCc
	pyz2XyHQYEA6LYdrFlYSbaApFGrVUNt1FqfySFU6U4XbgWwo3vJrs0yzT170XZQ==
X-Gm-Gg: ASbGncsC2qprXOvKYD4eco2j4WOjbsQxYLzRVRtTZqt13OIXD6i5zBwqFI5HTQrPMWN
	a56WrRSsC7zL0N43wJHL8Qv2uoiUAr2yOmtgW/uHClXUXhTug88XzJBmp+PpnHZF9x8/1euOP76
	45tMVQFDezUoHhj3n0D2lqYXIZRPLlk7YBlwbXv7ca0TjbrXVSFiV9kfY7enORi+/5jwSDtH6/C
	S7qc7tXLRQ+tuAcGb+ykL6WcbOI3EnC271AaYTqor6J3tiakHPckHCZ41Mh6FhO7HO8Pob3BWur
	pXiliUcIw+8wHHyWnMIZZbE9/da78i4d2J+XXpxR+y7yLLniSDm36kG8yY4LqyEBKeq9fNcLYeA
	X0qms6VhTspSkuRtirZ/9NWBvXCqpy2upBlnBptw=
X-Received: by 2002:a05:6000:144b:b0:3a0:92d9:dae with SMTP id ffacd0b85a97d-3a0b98fce76mr4865929f8f.5.1746778936604;
        Fri, 09 May 2025 01:22:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUIQwxze7D6HHqiCRIyhdRZJA3oAzwWyoI1hcOAosHbDs/ZbvCGeLsQKG98fEgH72pSF1tFw==
X-Received: by 2002:a05:6000:144b:b0:3a0:92d9:dae with SMTP id ffacd0b85a97d-3a0b98fce76mr4865902f8f.5.1746778936228;
        Fri, 09 May 2025 01:22:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec98dsm2472437f8f.25.2025.05.09.01.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:22:15 -0700 (PDT)
Message-ID: <3840b612-bdad-4732-ace1-8416fe9012ae@redhat.com>
Date: Fri, 9 May 2025 10:22:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: clean up redundant code
To: Barry Song <21cnbao@gmail.com>, Feng Lee <379943137@qq.com>
Cc: akpm@linux-foundation.org, mingo@kernel.org, jgg@ziepe.ca,
 jhubbard@nvidia.com, peterx@redhat.com, maobibo@loongson.cn,
 trivial@kernel.org, linux-kernel@vger.kernel.org, lance.yang@linux.dev,
 anshuman.khandual@arm.com
References: <tencent_0B227ECF6D12D91A3070FE8D41568AD10206@qq.com>
 <CAGsJ_4yLyXefpjycf05MYEnUis1UkEmH+kKVeKDnCsZzgGNUMw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4yLyXefpjycf05MYEnUis1UkEmH+kKVeKDnCsZzgGNUMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.05.25 04:44, Barry Song wrote:
> On Fri, May 9, 2025 at 1:54 PM Feng Lee <379943137@qq.com> wrote:
>>
>> Remove pgd_offset_gate() completely and simply make the single
>> caller use pgd_offset()
> 
>   "."
> 
>>
>> It appears that the gate area resides in the kernel-mapped segment
>> exclusively on IA64. Therefore, removing pgd_offset_k is safe since
>> IA64 is now obsolete.
>>
>> Signed-off-by: Feng Lee <379943137@qq.com>
>>
> 
> Better to rename the subject to be more specific, e.g.  "mm: remove
> obsolete  pgd_offset_gate()" or similar. Otherwise,

With that

Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Cheers,

David / dhildenb

