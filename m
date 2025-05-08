Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35821D3E2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701110; cv=none; b=sAVWa24TXxRk9PL/B2/U7xgGrbeyQwmIMhYP2rUsm/DV3gttrnnJStHXaNEccrdTo/0HyUvqpZjmDs8uhieeHjoH4sIdNhkXnzh+POTLaE1XvJXSfQLpUND3aUS4tI2aaCbBZnAv8Rvn9T4B8/LU+Cq2TJONZl3DolrDDjjN0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701110; c=relaxed/simple;
	bh=FY5aqFfKL11NuTG7B4uPZeY355YRDdgJOPBn8ClLl+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHxMEKcR6iwCXkWiiI0hit2pHASzwPAlODYTZknMHIMX6cp4DIZJeKeL6m7GLBqavgdqgDlbn+7wKg93IoJXSpjfrsJxObP/nkZUAa3nZgPXFU+1YGmwU93LOJN8WUd4NqcPPxVZ4Zd1C8qqYi8AZ6IMx9YE3drgez9CeC+14b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ie4OlSMy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ie4OlSMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746701107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=144CCdZ3QqhhoE6LNmKSPB/eWeg7K2Itr6u/8FJkLpE=;
	b=ie4OlSMyXkSdFQwX1A96F/1K0D3n/ifTXqfMLqpgGGVbN6hch5Qe1euIacfsa7flmIcy5D
	BY4vPQhnvCVdMFwy55NHUQZ2a7hQeJE717nPYu7wr6mOXo5YakPsaBduK5IBi1ajwy8egW
	5CieiGf47DcCCUXxdsgXSwLdkNC5t5o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-0js9ndmFNbqVZO2HS5cvBA-1; Thu, 08 May 2025 06:45:04 -0400
X-MC-Unique: 0js9ndmFNbqVZO2HS5cvBA-1
X-Mimecast-MFC-AGG-ID: 0js9ndmFNbqVZO2HS5cvBA_1746701103
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ea256f039so6549265e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746701103; x=1747305903;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=144CCdZ3QqhhoE6LNmKSPB/eWeg7K2Itr6u/8FJkLpE=;
        b=Z75FgPycUXqZTQEOyUvL3PyCu4cdq98Ve2p34fG7GI80+2wpB4/i7qnJNcPWteS4Ag
         wkTmS3HfiRTBB07y/6BUOhz1MvbLwsqlExIRO59gl3IL9a4iezka7LCO4gTC9gknmX9t
         J16yrMa13JOAW8aToAOp+g+xoHuTjmwKqc40/bhbeLVI7NY4zb16iu59wEi8Tpw9/XpJ
         2tMaRC8aGGLEX3U6G+svY+qNG3IpVdZSNpmq0NdU0/04rQOkk65JzGND36Kr4q3DTv9d
         d+tfYTXgRcmTCO7lcvEe6D+mWSWk0uTP1WHZ+ey+5Z+twoWemYRMVC+oB3C5CoDgtEFQ
         pxlg==
X-Forwarded-Encrypted: i=1; AJvYcCXzS8k235bphJaEMaDYDtWXlyp7qF33zY5/ABvMA8MAyaA3NMZC214sC5ZLrMejuYGwRDYqF4Q0w7LEL3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtOx/jdESQuF4zVzUptCc5ZD9IKZaarjpad0FZtBkxexPnj4vC
	lZgK0BZgfwN42SkoQcxoFxZ+yBRKPgzsfAR+sFBTBcVUFQ0rBTMkHWbAvf4ESJio9YnhcQ6UF56
	SRkwIPJixWz+MstaB9MLGi0ksd+jNhTxNGmo0/vglgK5eYWBnAVJnIr4tDFi+mg==
X-Gm-Gg: ASbGnct0UAJw1vzVfzej1Rb2DI5DTHwsgvd+CCUqpvDbmFnnaAOpMur2CYlZ3NePO7k
	ofI4KYP7U56A/fLoNnm2gNC8IsLTth0LdN1kzlgoUWq9u0XnavGmY0sGOn3ebXjbFLJJq2BpWhj
	RaDEvxKgxxWEx7MkU2zcktwMMBoNu2yEIvY2eH1i29ADI6q7YbOTgEd/mdaqyaemNdzo6ZInhF3
	Uy4Dn7O57EZFVm0KQgj7pS4UccGVm9ezaK9bACYg6bvl7K82enBjFZ9e358zpg45uBxmqdqYB55
	W9L2McXaW4TBaD4gup7AN2dOtcsvtvtTo4Ii0i3RAlFFAVluF2dwoOSbssBet7ZFO/nFIAzg+2a
	XyBII5IucxPphr0AF0cYh6jT7ShOzj7ugvFIy4/E=
X-Received: by 2002:a05:600c:6099:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-442d02eb737mr25234875e9.8.1746701103460;
        Thu, 08 May 2025 03:45:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJipFDeuAP66y53PUXj/YtGNe0kDSmVFggpMyReSgfoxt7A5u5wr1a0OocAi2q7Qu34MSpWg==
X-Received: by 2002:a05:600c:6099:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-442d02eb737mr25234635e9.8.1746701103059;
        Thu, 08 May 2025 03:45:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d14e6d74sm23825945e9.21.2025.05.08.03.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 03:45:02 -0700 (PDT)
Message-ID: <a5cde237-0dcf-4e85-b763-7a38e9f9c563@redhat.com>
Date: Thu, 8 May 2025 12:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Memory hotplug locking issue: Useless (?) zone span seqlock
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Pavel Tatashin
 <pasha.tatashin@soleen.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
References: <b3acfb1e-2d7a-42ef-9705-bf0b20a0d152@efficios.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b3acfb1e-2d7a-42ef-9705-bf0b20a0d152@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.03.25 21:22, Mathieu Desnoyers wrote:
> I'm currently perfecting my understanding of the mm code and reviewing
> pieces of it as I go, and stumbled on this:
> 
> commit 27cacaad16c5 ("mm,memory_hotplug: drop unneeded locking")
> 
> This commit removes all users of zone_span_writelock(), thus making
> the inline useless, but leaves the now useless
> zone_span_seqbegin()/zone_span_seqretry() in place within
> page_outside_zone_boundaries().
> 
> So I'm confused. What's going on ?
> 
> And if this commit got things very wrong when removing the
> seqlock, I wonder if there are cases where its partial
> pgdat_resize_lock() removal can be an issue as well.

I stumbled over that myself recently as well. I think I mentioned in the 
past that we should just store

start_pfn + end_pfn

instead of

start_pfn + nr_pages


Then, concurrent resizing could happen (and we could atomically read 
start_pfn / end_pfn).

Right now, when adjusting start_pfn, we always also have to adjust 
nr_pages. A concurrent reader calculating end_pfn manually could see 
some crappy result.

Having that said, I am not aware of issues in that area, but it all 
looks like only a partial cleanup to me.

-- 
Cheers,

David / dhildenb

