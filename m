Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F528DB5C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146880; cv=none; b=oWhlXpQqwZkWM4qJg/GP4gVses5a4Vp//WCGAia6Luyui6ARpyPm+Fz83htPeKaHiqZWUFq61wsjKAn7Lz9UyHOCePkK6D8dITNKSLlCZnWh6+6WSy6Dp1C31wYap2anB0P1lqQB4zWi+rW/2yzPRgq8xMw1t7jJKChbcBsYppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146880; c=relaxed/simple;
	bh=+TEQDKi+SEwS/PMMgRx4OZXx/o8QNCAuFNOP+drvTVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyF5Xto+hA8UszOKsfHHrj8p/+XFryLTlzly1HAXhS/k0BE++dOFPAejTvIGe0onYQORU/mFHLR1QQx1nD66Rx4inNwqFzpEH5hTE70vYZHAlQEXVaAG/GVHJKLDADdLKizTQMUgjWuDOutXfUzyGUw0pQ7aHPR3bPzGiizj5xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FzNVGQz8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FzNVGQz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750146874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ktge954MPbzaWmp5iHOmPfmIe8eROLXd6XeMQ+DHaQI=;
	b=FzNVGQz8d/3MYeEN1r5A0r62bP7D09zpHb4X/I2lO5J/AmGvR8lUXoXee5AAB6YNdU0sJb
	XseDvYFq+G45LyzhsKwS1ULXwe45Ss7mkh7Jx1IuTLj6z23bOfGngy1/QhdQJZHfTdts7h
	1tsgVtMkXbm5RIrqbPUT9mW/3ltCWRM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-C6spy-QwNlyTE_aeGI2gUA-1; Tue, 17 Jun 2025 03:54:33 -0400
X-MC-Unique: C6spy-QwNlyTE_aeGI2gUA-1
X-Mimecast-MFC-AGG-ID: C6spy-QwNlyTE_aeGI2gUA_1750146872
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d1fso30469255e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146872; x=1750751672;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ktge954MPbzaWmp5iHOmPfmIe8eROLXd6XeMQ+DHaQI=;
        b=fOtPj6DZzT+0GLRG5/esuO2LSYhaiEeZDYnV4GSZJiOBII9/efmsoCNYOSEByVGBer
         gQCkmKYRjp9tIfXLnrgCpdRVpVmr4nbACKj57IZUTOHCtPG3Iz/IuSjTiAMRWkuj/lvM
         w/jfom1t+8dMYCx+b+yCL6ewmG5KIAhrh9IQGq6tgp2SgqvzafcasGlBPaPfsBcZKXTT
         GssO49vxbtszKW8yhSBlZd/PTMwuCt/TG9RrcgohOtXcnB4JtrbtCi7td+iYk+AcXHZJ
         WlAKwrDL2OrZ8j1XwOlWiHFp4XgOy4M99ynxexdUB5QyOQKTHbT5YHluxtzQsDDrxV5s
         NggQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbBzQiImIEhiADuGZOQVB8F7zmjEJz7oLeL4u/PvkSzlFkhmVpMAVgDvcXmkqNnpCZK9P2sID/0i54/+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV8f8k01h9VzffbkF2Cz5vJFvCP6up5jAzOe8u0QDPNZ+ucA9r
	LbM83ILjQvHFdT/mQIHw7Tt4OFx6ro9rJDh4pXqT6JrzSL8qSEgwWIEPjH2yl0j+L67FSRPGMBR
	zrPiSDeVOh+o4YzkRPAOsjJYaDaV8euo9P1/Kn9JWsaUY+Yq+clqgo3x5hsVqw4YbbXRlE3TwMw
	==
X-Gm-Gg: ASbGnct/CBac6CHUWw3jGQ4kGyQQa6qIOTWTA/Wxrx7ELNA/c1doPaHN3EmexpoINuX
	G3eYB9vWqr6D0JpJFKAoC4My5HQzVOkNBiHVenlxrEL6WrzkNzOKIrm3fTWPf57pmNd+GEIHDAw
	/rZ42L6XeUFJKdhBCK+l4+3NbTKdiz3R5obhk80Kn986z1uYlJOfNzldPAxudKenGdZyhHIU5Y4
	HE0Sdn7xGKeamd37mm92N7FQvmM5ebEuA4BbSagdQCs+N6RytyFnW+pPbquT1oZeplxdWipbqFM
	E7ZhgoAh4kHveQaSog4qhgYxmr7TvbnSNRAC3Vr6/h66OQcmbHo/BPM6Nx9B0dmMvs1EtD1nbld
	pzpQ+uD/fiPgDWmrSlctjrvPXAO2DQWROUFd5wTudFxqno8s=
X-Received: by 2002:a05:600c:a00c:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-4533fc72ca5mr106832725e9.0.1750146871798;
        Tue, 17 Jun 2025 00:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUcqQWPf7LM6cm3kf+uv13qxdjFKgN4rS0XgA5hjJFbgBmHJrv3oPD7MFgGchjgMpwLB0QtQ==
X-Received: by 2002:a05:600c:a00c:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-4533fc72ca5mr106832475e9.0.1750146871343;
        Tue, 17 Jun 2025 00:54:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b7741bsm13345683f8f.98.2025.06.17.00.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:54:30 -0700 (PDT)
Message-ID: <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
Date: Tue, 17 Jun 2025 09:54:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
To: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org
Cc: 21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, lorenzo.stoakes@oracle.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Lance Yang <lance.yang@linux.dev>
References: <20250617020544.57305-1-lance.yang@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250617020544.57305-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 04:05, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
> 
> The prev pointer was uninitialized, which could lead to undefined behavior
> where its address is taken and passed to the visit() callback without being
> assigned a value.

So, we are passing the pointer value to visit(), which is not undefined 
behavior.

The issue would be if anybody takes a look at the value stored at that 
pointer. Because, already passing an uninitialized value to a 
(non-inlined) function is undefined behavior according to C.

In madvise_update_vma()->vma_modify_flags_name() we do exactly that, 
correct?

	vma = vma_modify_flags_name(&vmi, *prev, ...

We should use Fixes: then.


Acked-by: David Hildenbrand <david@redhat.com>

> 
> Initializing it to NULL makes the code safer and prevents potential bugs
> if a future callback function attempts to read from it.
> 
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
>   mm/madvise.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 267d8e4adf31..c87325000303 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>   				   struct vm_area_struct **prev, unsigned long start,
>   				   unsigned long end, void *arg))
>   {
> +	struct vm_area_struct *prev = NULL;
>   	struct vm_area_struct *vma;
> -	struct vm_area_struct *prev;
> -	unsigned long tmp;
>   	int unmapped_error = 0;
> +	unsigned long tmp;
>   	int error;
>   
>   	/*


-- 
Cheers,

David / dhildenb

