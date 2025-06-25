Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B99202987
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836902; cv=none; b=XMrhXCzYF3sedqZQiGUA9p5Pg0+SGBqHuRFhc0URF5PR7UIv4ecDJgUcBdGmfpaamnOXB9NXyRRLmBV4Rq8tJKWqPmjr69mMkbaXiUVtvFMjBq4dxW/6ZzI49Hqx/zFRxtoCSCS3rtZE8OMOSDuiLhM2lZXQzkS8fNz1PzB2kTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836902; c=relaxed/simple;
	bh=yaCMwg1iL7Eggle9ZPBsnpKe6GZKe276eIApPvgv2BA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oK762RNPP9+0MZ2o7+qcpwqQjJUnkSgbUM6vq6B5sr/P5kgI2QhfAS0Nhq3E0dRya74+FUup59JuhqfpePnYo61JPb9sfXOwF2DXo5xlhot7NEvE7Ek23ogC4eHzYLupQDeWKeuYNYE2D0Khw8IVh357R7zkrWlsFRo01nDJeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zgj7AGZV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zgj7AGZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750836897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=f9JWJaXqe/mzvWtWTkmax9Q+vie4v0vnBThpwbTMo7w=;
	b=Zgj7AGZVJ7Zxerli7i/833bMcujYFw91vYMa8VBFw+nD7M7/loZSJJECnNda9QlOHiLfh8
	hRgkVeu9/OM+MAKFGzcpIwJcmTXA8znFly+jVoqPWOrSc3pVVNzZQ+ndnC9bAUh618m3Qh
	iLd1npFDfhMYDtFZKIBc7LvTvm0L0wY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-EJguKSL5MnyKxvcP_LQE8w-1; Wed, 25 Jun 2025 03:34:54 -0400
X-MC-Unique: EJguKSL5MnyKxvcP_LQE8w-1
X-Mimecast-MFC-AGG-ID: EJguKSL5MnyKxvcP_LQE8w_1750836893
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so487436f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836893; x=1751441693;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f9JWJaXqe/mzvWtWTkmax9Q+vie4v0vnBThpwbTMo7w=;
        b=NBr4gdeCgZ8d2WIFMo+f6Px5tHMKZnJFaCyW4OfW6zrz/tldH2zykhbq2gUkazIRd/
         r/DSlCEaeYjrns86WLILVczFphszfqs0k8USthVAtOU/wb6EZ7eOOW7huHmvQEL+OWW3
         w2lQHYVyOO6rrJ/mrkpka2rBtxWESbV03/s8al2SjE097wCpoS49sW8bWVqF8OfyuOh2
         ImGANmwUDao8kTMyZf8p56JKx5roRaHJN48dhO3IcZDwOtyyQSFOnKo7Vuca6Db6bITx
         mIIMbENYz6eJrObrj5YOHRZPJ7M5vngMXq4HiRx6GEr/27aJh+azQACs97Wxe+bmhb4U
         CDPA==
X-Forwarded-Encrypted: i=1; AJvYcCW62+d9PLAKobRSqlRS/CTLrV9PnRTqHTJAm9r61L8NXSkV1XuQRq8VeOplNDjF/ddlujXAokE2Yk1rK9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy72QKfEH2RDegveN2w9V36ev6iP57HTFKzWoXg0J9Z9bAmTDYG
	NSSQ6pZ03uIPXdJtRlufgX7KrN89AW0bBGIRYLO5xDix10uapRDvMbceXveIOAUFcGuAMvl4Yki
	zD9jtQTIQIHUuU410LtjVB5QDdJ9MFZQBXf5LoijYjA7gZYNkM4Vda1JZdWIQGsemOA==
X-Gm-Gg: ASbGnct/ZbTe0Z0mb0aOha7IGgvU+lrWZau6RYQXb0iOtGcO5Gw+WZUW21TOhXJ22xZ
	UiIm0i8H66inIwoQM2dypMqkEFUC0H+Olyh1wv0R2nABsPRcfVcawpIuNivVRZncrwvMpiyoh+m
	MLCInljobc+HhA0SD16Z5NQovxVIkRBCrPV3DZCVjwmgh+J+n3CtzPgUtvCbjUoPEWF8D2biuZ8
	vp3e0wV0PCtS174HFFIzPpcZg/zZQocG6B5eiV4CKv7ULA70bclTjlOfdPH5V+PSG1VsfrRMrbF
	1ret3U+v1uPM8WeiQ/SvL2fYdItT5aZtgmzN3xb1jA0GMKWpDoIFwHgKgSHg5Ccv0Xqh77pNe/p
	AFm57VQnA92g3s81nRchqiQeAM2od3kWloo2d1HLTwcc5
X-Received: by 2002:a5d:6f04:0:b0:3a5:52b2:fa65 with SMTP id ffacd0b85a97d-3a6ed618eeemr1368000f8f.5.1750836893026;
        Wed, 25 Jun 2025 00:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWq9GTffc3FP0XcHKicmiSih8rODvVlPPlK3Pn7m6ROmtE6VqVdBM2z1yvr5bS5ZvH8JCsuw==
X-Received: by 2002:a5d:6f04:0:b0:3a5:52b2:fa65 with SMTP id ffacd0b85a97d-3a6ed618eeemr1367974f8f.5.1750836892652;
        Wed, 25 Jun 2025 00:34:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823551dbsm11138045e9.17.2025.06.25.00.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 00:34:52 -0700 (PDT)
Message-ID: <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
Date: Wed, 25 Jun 2025 09:34:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Hugh Dickins <hughd@google.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> We would all prefer a less messy world of THP tunables.  I certainly
>> find plenty to dislike there too; and wish that a less assertive name
>> than "never" had been chosen originally for the default off position.
>>
>> But please don't break the accepted and documented behaviour of
>> MADV_COLLAPSE now.
> 
> Again see above, I absolutely disagree this is documented _clearly_. And
> that's the underlying issue here.
 > > I feel like if you polled 100 system administrators (assuming they knew
> about THP) as to how you globally disable THP, probably all 100 would say
> you do it via:
> 
> # echo never > /sys/kernel/mm/transparent_hugepage/enabled
> 

Yes. One big problem is that the documentation was not updated.

Changing the meaning of "entirely disabled" to "entirely disabled 
automatically (page faults, khugepaged)"

> So shouldn't 'never break userspace' be based on practical reality rather
> than a theorised interpretation of documents that sadly are not clear
> enough?

I think the problem is that there might indeed be more users out there 
relying on "never+MADV_COLLPASE" to now place THPs than 
"never+MADV_COLLPASE" to no place THPs.

What is the harm when not placing THPs? Performance degradation for some 
apps?

What is the harm when placing THPs although disabled? Making the life 
for David for debugging customer issues harder :P

> 
>>
>> If you want to exclude all possibility of THPs, then please use the
>> prctl(PR_SET_THP_DISABLE); or shmem_enabled=deny (I think it was me
>> who insisted that be respected by MADV_COLLAPSE back then).
> 
> While it's useful to have this, prctl() is where APIs go to die. It's a
> hidden wasteland that nobody knows about, it may as well not exist.
> 
> We have a whole sysctl directory for configuring this stuff. It's sort of
> crazy to have that then to have a special prctl() hidden away also...

prctl(PR_SET_THP_DISABLE) is today not really a reasonable way for an 
admin to disable THPs system wide I'm afraid.

> 
>>
>> Add a "deny" option to /sys/kernel/mm/transparent_hugepage/enabled
>> if you like.  (But in these days of filesystem large folios, adding
>> new protections against them seems a few years late.)
> 
> Based on a reasonable interpretation of 'never' I would say we retain this
> series as-is, and 'deny' could be what 'never' was intended to be before.

At least for shmem_enabled never means "unless overwritten per mount 
through huge=" and "deny" means "force off for all mounts". So "deny" is 
"harder"

Inverting the semantics here might be causing even more problems.

-- 
Cheers,

David / dhildenb

