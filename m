Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4D215160
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693023; cv=none; b=WFeaSwIPEkEwgQvPCnqFNvlEB6D8a1cocW09/kquOyZ5OrHJHUvHYPEOYe2TtdUW6+2j/ZcBpP8Rqv3DmeMFwzrqc77kMjmv+boYrtRSDKrU3a7CDj+7csBZsIF3gcge1LMfpiB6XkcHAwLq3ucpGbeK4B7J0z0hOX6VpX29MZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693023; c=relaxed/simple;
	bh=in6Xftw6EKPo/jRQnio8/s1iBPrQsUKAwRitlVo38tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tt/UrY9hG9erBphBLhylTSdVKIOmKiTACOULd7bkRAjG6EWQYFWjGyrNbpTKo1hnNiDVuUUpS13htLRFL10zuAy7IlnJX8eel+RyyA+YpaNQbU4+aU1WDqdxjFkDQRLQ1681fPl4/DqOPIzsjxy5vr8BT4y3nlRzVFfULlq/7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d0KjAlMM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d0KjAlMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746693019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S3YJj1plrTRSl+mrN0Cfy53gKkAtD6eDXaFNCZ9ZGYo=;
	b=d0KjAlMMAfxdIFaoxW6NuzLcGF5U5ZtJgosUjPmiFaDKA7LCCWZXUS+sdTyCUdM6WaEmsV
	iC1MY1++WFJsmfnm73bHj95CRXn8OTIe5W6htbcP3quJwNOMFfEopPkyX91xplDQKopAAL
	zE/DhG5WAfJDf8IrOH2McaCWceQ3ySI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-IIgR56_eOIipgz9qXb3M8Q-1; Thu, 08 May 2025 04:30:18 -0400
X-MC-Unique: IIgR56_eOIipgz9qXb3M8Q-1
X-Mimecast-MFC-AGG-ID: IIgR56_eOIipgz9qXb3M8Q_1746693017
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0db717b55so104582f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693017; x=1747297817;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S3YJj1plrTRSl+mrN0Cfy53gKkAtD6eDXaFNCZ9ZGYo=;
        b=Hl/+4Ag4rPEWj5LmCcuSgDaL5g9kXci3tliMyFgEgnC5Bbc/GtSeHVaMB1jc9h7Pjt
         1ARVyDr61laam0NTYshRuTZ65Ufe7cEuP8ZrVvZN34Bd/hCb7lVd1Vwj8y0tOmfHKzGX
         VGJvHgA8mo7y+0tMOqzzlXzK+QIIuM/enUqJUa1JWbDsAAkL7UgRMRP+hstN7qiOQVkJ
         G8SNHOazVgl299byiRwlXFTN+bJbR+pgfAQfCjE4gWC/ag+S4sGSxkC52Xk+C6/rJdAV
         lMUUCJi7IYsiz0GnVScxlBK+cQldMJd6NxwPDGVTizSBktYyQvvmzM2+YILmz+TeEopd
         QeFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPu7GTQZG4I95aZQbbQDLbgyoa3WR3H72frRgD9A/ncvLDhfjFlG2zAUwC7Aq+nswLPQgSjOQ+nCT2tpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz25qsWTQi/tTNRyLa0N33LwsOo/VaDVBBKFeV6Q/3HzawIX580
	S3mdwsjpwKHpmKWkS82XHEtagIvVqJRMY0jXcEh3vbRSUTiuvWCMFd4mjgzH6dMd6h1KFSCB0QG
	lMPfjfiimp1GJlnF72i8rlt/waKzOxjUuFyupqMSFB2jXgxYmvFJPJJ+uKJrE+g==
X-Gm-Gg: ASbGnculZn7XAldJHqU1Jn6zl8tFSEmJk/YNx8nImHJL2nXqfdDbuqYOcq8xOul91Kg
	oSvqMtdSM1YM9X5GkobdNk+JXjDTbECYbvgs995u6ksGrLA7FAr3sqn1YmP0L/K8xQgf2GiyGAH
	RVS1LRFl/TXI9bAVMdsYLwVFhMoEtBi1wyYiL2KfhnfG1nDw22Cxm+RzfwrEGl9hXYqGwB5k57B
	bQ3wayDE7WA+PMXHxFfqV8iQe0TXFh32VZVOE8hb7DP85/KFLAbx0X4nIi0QCzFmgQNsiG1lbNs
	LsNo8T0PkkBtsDhxkLIjZU+8KcP4h9NzLIgv3nTRl2xWWLPAQPd6eucoajJaEjI3M0lf0//NBLH
	iAogct89b5Pb3YxEA92CLyYBb0M7BKkT0Auw2FQs=
X-Received: by 2002:a5d:588a:0:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-3a0ba0b5d2amr1612262f8f.29.1746693016878;
        Thu, 08 May 2025 01:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPEfSGLX3TwEoxNfZJbO9Ox4TNvEJL0HvMxUzohlgBpzLEJFqOj02p/IWIhsaaDiRsZfMIbQ==
X-Received: by 2002:a5d:588a:0:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-3a0ba0b5d2amr1612241f8f.29.1746693016527;
        Thu, 08 May 2025 01:30:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b3331cb0sm6212182f8f.65.2025.05.08.01.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 01:30:16 -0700 (PDT)
Message-ID: <9ada79ec-f2b4-42bc-84f9-3f7b461ad829@redhat.com>
Date: Thu, 8 May 2025 10:30:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Xavier Xia <xavier_qy@163.com>, 21cnbao@gmail.com, ryan.roberts@arm.com,
 dev.jain@arm.com, ioworker0@gmail.com
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 will@kernel.org, willy@infradead.org, ziy@nvidia.com
References: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
 <20250508070353.2370826-1-xavier_qy@163.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250508070353.2370826-1-xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 09:03, Xavier Xia wrote:
> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.
> 
> In order to verify the optimization performance, a test function has been
> designed. The function's execution time and instruction statistics have
> been traced using perf, and the following are the operation results on a
> certain Qualcomm mobile phone chip:

For the future, please don't post vN+1 as reply to vN.

-- 
Cheers,

David / dhildenb

