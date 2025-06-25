Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4281189B80
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839414; cv=none; b=lsr3kG/UYv2gvQWg2fwHm5rZkvonYK+rbN6hgcM5xg9lkB5F9nAL/UXlTWHYbAOBDnp7qhVIF2/B1mq65PeNqIolVk988iL6Xiv71zvmurSMhE2oo8kaezZwSpKGsow8SCxZ4W6Gx92Ta5VXzzvo1hsDuEwxiJDPX38BSMXFu3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839414; c=relaxed/simple;
	bh=iXAYxdhi5FPboaps8W3MKIF6LsIIi5hPMbUATp+Kk+M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=il1pCGlMyHFyboSZu3KQGw/fbaOEYYW6ZG6JWFiBIy06b5JLaNV2HRiXWt9kCdtAQtDZ6NwbtfsfoM4fckV7LNvy0Jkts8AwZSq0RHhFVO4pNe5z4MpsPurWM9jUg8BFroL7W161l/CCI0ZVw/5WkqR+C9Jz2x8a4R0ydobljf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UdCVfYfd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UdCVfYfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750839411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=V7y19TSXqGTF715U3i+MdqTph0YeahkZF8nYQC5KlYs=;
	b=UdCVfYfdSqyk2gaqBbhYW++9XaINWDSgRGRNmBXiFcTcgMrozWU3eATcImO45INTKIre8P
	RXfKNr/zspk51sAPCZbyP9maFtn1t+FGUkSE1E7LbCyj1O2wi4Oumjyk04PU7Dct2dC//i
	v1HoBMxGsDANZAAjCQ9+7uXheTAnT5Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-Og5fQ6CrMLG7fiz7Br1QQA-1; Wed, 25 Jun 2025 04:16:50 -0400
X-MC-Unique: Og5fQ6CrMLG7fiz7Br1QQA-1
X-Mimecast-MFC-AGG-ID: Og5fQ6CrMLG7fiz7Br1QQA_1750839409
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4532ff43376so50520555e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839409; x=1751444209;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V7y19TSXqGTF715U3i+MdqTph0YeahkZF8nYQC5KlYs=;
        b=JTCFiWsjjc8j1DUNbr/OrXCm0IrZwIbixjEE0jLaCBYt6zOsj/IlwhZk6414V0sVvF
         6Ia/eE/NRCfnBiSD1Uugv4qEeh6Zwvrtc+ozp1lRzmBiiS2kJs4OB+M2ajb2hdzWIpyV
         Uo62DSHTov2xbXLe45KqQyc+pl97CwZCe8m0q9WonY3ze0whb0H4K9HYLNKSj1IxCBM7
         N5HwCYrA7O6dthj0CXvJTWnAlo/GTekeODFxlF9GForZgpQ0NXUfEbaJylNULdSxChTF
         vKH1xwdpJoeunnmVlvDxqueEnDMs7UCPIlGMsu2Nu7cTlzc+0VJejrYBwODXCHLdpesC
         ADuw==
X-Forwarded-Encrypted: i=1; AJvYcCWWdwOJHA70p35oi/kZ0pMq+K3qtwk/2BAfSFFcdBVEN91vZ6VZIozr79/6+YI3iPR8tcY3Tv6z3kfrUm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3NHEL6Km79Tvty5iCeWUPldcsSoGYl8Hgz+CGDSpjChIn9y0+
	Q+VsFCmULUR848OpfWNB97HSHrzK5lcWc/gWa2qS+1T+EcnJRccE2hxkX6CjjZhI79rYaej+sG6
	bLT2KhnIFtTADZbJSm03c8IpJg5DuhFrollkwg990sv2Rqn7PyYrB1i4wAo8SXamm4Q==
X-Gm-Gg: ASbGncvPf0VnVxj7uGUS6bv0X9bLo5+Wos6D97LF97p2G0Aig5unQqseQNggRgpbodq
	Jfw/rpfkBgjtHbdcda0Rkh4y6ucd5H/sr+YwEQUkwg6h75rDpB/Hu2rZQFLbhLOnG0CgUMct8YB
	mLIQg/DJDNxud4RJrz5GT6fdOjYosWnvQhXGlK1L7kBuDN8aPDnM5IRkQ9WXrRztVKZHAZYxNif
	bsr1bUKopr2wP7uZDmDoRkEUQ8nygrGJ9pcl8PVVA7ZqXZJv217IgaA38Wey3WIS2c6fRfrFVeG
	R49mN4/pRWqyU4VWA2nLKuS3v8M+glU1TkGHXGBoyKIwNppnp83ccWzccUVBllvGrtb59uRVne8
	4uzi75vcFX45iPTDQXVCCd+Misleh6jZMxbPTqU7US15p
X-Received: by 2002:a05:600c:3e8e:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-45381ae5231mr16010805e9.25.1750839408762;
        Wed, 25 Jun 2025 01:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY8xqAm7ncwJ1YA26BCLIEHr6jANg+TtIlEWXRSESDp7emT1XxO89naD7S8qJjC2pLNaDebQ==
X-Received: by 2002:a05:600c:3e8e:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-45381ae5231mr16010445e9.25.1750839408222;
        Wed, 25 Jun 2025 01:16:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2a4csm3959490f8f.65.2025.06.25.01.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 01:16:47 -0700 (PDT)
Message-ID: <28051538-d3ea-4064-aef3-89f6dd98b119@redhat.com>
Date: Wed, 25 Jun 2025 10:16:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
From: David Hildenbrand <david@redhat.com>
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
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6bda0de6-1ade-40c9-aa52-16bc02d98bee@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 09:49, David Hildenbrand wrote:
> On 25.06.25 09:42, Lorenzo Stoakes wrote:
>> On Wed, Jun 25, 2025 at 09:36:53AM +0200, David Hildenbrand wrote:
>>> On 25.06.25 09:30, Lorenzo Stoakes wrote:
>>>> I _guarantee_ you that's what nearly everybody except a handful of people will
>>>> expect.
>>>
>>> I know, See my other mail, the problem is rather if there is no somebody
>>> relying on never+MADV_COLLAPSE from doing the MADV_COLLAPSE-documented
>>> thing.
>>>
>>> It's a mess.
>>
>> Well now we have an almost philosophical debate - we have different sets of
>> users, 99% of whom believe the uAPI is X, and 1% of whom believe it is Y.
>>
>> Now what is the uAPI? What is 'breaking userspace'? :)
> 
> Yeah, that's why I mentioned that I think we broke "something" when we
> changed the semantics. But that breakage probably only affects real
> corner cases (debugging, customer workarounds).
> 
> I think the whole use case of using MADV_COLLAPSE to completely control
> THP allocation in a system is otherwise pretty hard to achieve, if there
> is no other way to tame THP allocation through page faults+khugepaged.

Just want to add: for an app itself, it's doable in "madvise" mode 
perfectly fine.

If your app does a MADV_HUGEPAGE, it can get a THP during page-fault + 
khugepaged.

If your app does not do a MADV_HUGEPAGE, it can get a THP through 
MADV_COLLAPSE.

So the "madvise" mode actually works.



The problem appears as soon as we want to control other processes that 
might be setting MADV_HUGEPAGE, and we actually want to control the 
behavior using process_madvise(MADV_COLLAPSE), to say "well, the 
MADV_HUGEPAGE" should be ignored.

Then, you configure "never" system-wide and use 
process_madvise(MADV_COLLAPSE) to drive it all manually.

Curious to learn if there is such a user out there.

-- 
Cheers,

David / dhildenb

