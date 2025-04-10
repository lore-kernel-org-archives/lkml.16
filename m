Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF682853FA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295140; cv=none; b=I7tJopAK8WtM4lnbgPkKY0jsMhfzLVXaOguAWjVST78kShxVU99/YE3XIJJJl65FYtAGDGkP16VnSJhK9kYUF/tikBTui0Gzi2358vwZMtedRfAivKaHt5T/R9bssw6OAr8hg2vaTPEYsWKB6oNn0zXAvzjnDDfGVlSsAxF/b4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295140; c=relaxed/simple;
	bh=4h9tU805wj3R8FneoXYig9e+djy+AujO/9PXKzlYEEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIAWDDe1RMHWgBg/zd20dJZiMqy8DOy/grbs1bVX2RIPUvPz5VQ6pKT7Rx5bG3fF2KyJv2bCw2CuYi/8bkG3yOggXbvNqKcwYmGJyUF0C0BYYPac1+mCbUVl3UkkUh95jRT03GXauOsK8sHpQT+BUoR1sPehxDzilw6FcWK+uAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GJj/rgSZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GJj/rgSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744295137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BMrjy997UYcHZDYooOjGBR0Dt0ACA7tjnhzWRMpx2xg=;
	b=GJj/rgSZgYnZQU23kFlpq289DwP37KsaRFEDRL0bEVPN3PjK5RC0ctgdNymI6PeZ+b+8Ga
	jQFtt6I99nIZaC1txJOr5KrMJKVTsdjVc5qT1xBiI+yhLnqvJzq8p6iBDWEAHZsEIrml57
	mDj5W+/xPAmiD5GPiq143OPIYdTjlw0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-VF7qzpGdMnG6ek6QchbyQQ-1; Thu, 10 Apr 2025 10:25:33 -0400
X-MC-Unique: VF7qzpGdMnG6ek6QchbyQQ-1
X-Mimecast-MFC-AGG-ID: VF7qzpGdMnG6ek6QchbyQQ_1744295132
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3913f97d115so497868f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744295132; x=1744899932;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BMrjy997UYcHZDYooOjGBR0Dt0ACA7tjnhzWRMpx2xg=;
        b=K04qAShmYS3Rrtuhd0+W9DGtG1XDtXgbN7sq6qa54DzkJ/nCGv1khhSk0VGwxTS3f9
         Su+fu8GEBViiJK9u0+jwzKLreeJJiDIs/0FT45YbRCF5Eof3a9dPiBJuwrdFJjIeU40Y
         mdxUvVvjDzLL85kqN0GslEaYeU5c67Zef38fd80xxrBRBtP81ch6OgC1RamPZy5busSD
         jBSZt3MflTz2VSsUtb1ckVRHCBtd2d5UdZZlF8Cq9BTw6/1RwzvvneZ91lqz4G0yxw/3
         ERQA/uABPLjwDi9fXZhL+RPmG4U12iBV09jwcYnimYyBJzUiKpyHI/kZJKI2Q7U2rC9/
         pUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQfkh3+ZeaInRRSUlN5Zj6cTJgkQ9vihdNeXZBz/9bexI/6XJ5kjRW0/W4t3QRvtcjcz3SCc2jNT8zYCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMTVdQhbgSJz8aOSutRLVZoAGj1v3sh2TiTMMAinLh68c8dq3g
	fC/TNIfn+ei2wzOhPhZFkROP4gfJKinJZqg9H8JLA/a9A8ZVueIDtuDhn+1pbmshypVUbkc5/cD
	V2bm8GJ+VcAKITUDEMsbQbSvHIVnaaPoPiUShdBFTH8gk3FPuCy/Hs1AD4vgP9w==
X-Gm-Gg: ASbGncswChSMMaKej8dCH/R1aBSaqcoQg1m2DiHqblDTF60yn5hMvMfpTzyfpds/XDC
	rn2GJaQSmZB6ND9bbjq0fiDN5x7LDPIUuJAWiytukFz8g46jTMTFXUWZ1BKwCFFQpcewHMpms8V
	zw3hclpSrb3KBO7mYvbUpNilt0XzNBG3vj/vjhBPfdI2gzV3gdPtSWhc4hRaruCf7NP3+3glaFw
	DmZvklO+PCoe4BV5yokTQbfNFUUDa1qakFnwoIPRpOlWIqegiVsMQq7W86fgEGRAPiIiMtPesvp
	MqdvrdbkyOj1fXNO4fcW8MTOkjCUYVD92gr0wMGNkqHv2bNF6kuXHbl14FNZiSbFmErrjQWoXSD
	Q8GIGn3qFR5aUeTY4hX2a4ScBWTAb8byIbXC6Flc=
X-Received: by 2002:a05:6000:1848:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39d8f63167cmr2488627f8f.25.1744295132194;
        Thu, 10 Apr 2025 07:25:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0CvtW2kplfKezrMMDyCqg0uuf1px8QPk8bcC3dUWLQqwusn6Gcy4gO9Ddno87m430p6fqLA==
X-Received: by 2002:a05:6000:1848:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39d8f63167cmr2488604f8f.25.1744295131848;
        Thu, 10 Apr 2025 07:25:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:5900:d106:4706:528a:7cd5? (p200300cbc71a5900d1064706528a7cd5.dip0.t-ipconnect.de. [2003:cb:c71a:5900:d106:4706:528a:7cd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4862357f8f.40.2025.04.10.07.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:25:31 -0700 (PDT)
Message-ID: <a950dd20-d7eb-429b-b638-2df68208918d@redhat.com>
Date: Thu, 10 Apr 2025 16:25:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
To: Oscar Salvador <osalvador@suse.de>
Cc: Gavin Shan <gshan@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, adityag@linux.ibm.com, donettom@linux.ibm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 akpm@linux-foundation.org, shan.gavin@gmail.com
References: <20250410125110.1232329-1-gshan@redhat.com>
 <9deb3725-8991-43d1-8c3d-56523fabff28@redhat.com>
 <Z_fNx7hTOR8St0SM@localhost.localdomain>
 <Z_fR6c4o1V57ZAXR@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z_fR6c4o1V57ZAXR@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.04.25 16:12, Oscar Salvador wrote:
> On Thu, Apr 10, 2025 at 03:55:19PM +0200, Oscar Salvador wrote:
>> All in all, I think we are better, and the code is slightly simpler?
> 
> One thing to notice is that maybe we could further improve and leap 'nr'
> by the number of sections_per_block, so in those scenarios where
> a memory-block spans multiple sections this could be faster?

Essentially, when we created a block we could always start with the next 
section that starts after the block.

-- 
Cheers,

David / dhildenb

