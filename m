Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE781CA9C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744974243; cv=none; b=oDJcaa8oeZAUSN0SZcG9U52VDt5fOO9NrmCEhvUQ2PMSVvdpWXCv5sLeyEEBhJSOfRMQU5sSVZttwFdOymOuhE0TwzyAd0OlAGS+fHpR0tVsiitZzuEEys4d/A6nLZB8FP4g0pVX2KwUE9WjrDbn/ac79KBGGVP0zJZIRkKs9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744974243; c=relaxed/simple;
	bh=FudLo6SOH6FwFGaQToUFcJeKycDDjhEjOnLGYZ21uwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p29rwaL03BRiZwtWfD64nxvPrmCFul1Gd9iArxlNGujFg4f0QBGrWIqD4COopANacI7AbRG4LsjpDScOIqlAVGSPgV1fHn3pK99GoSgN3OdmSwIDkhlrffiDNiZ5nQz9dJMWN+UpR1IokFzWD7f7k1uNvMQgDpDbXSLNdAMkvY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R85k/HNp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R85k/HNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744974240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BSKJxdvcT8fd+sebpc/NqWYRsM2+G+dmHdHO+Nos4yY=;
	b=R85k/HNpZa0EWOidk2HN+DPJrkGjJwL999RnjX4BqXpqWFkBLbUfP+0kh+DoF0iLNiAWvS
	oTKK+qqBs6jUi/yhj6I0jwKbHjJkv2XcrPwDHbCrZPxTjrT1EOirg/YtyHW4CNlrKes+tv
	NQyUwcR2tvHrtYgoKvE8u1wKVOgsLPQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-af8_ul0QMv2EHH65V-urhg-1; Fri, 18 Apr 2025 07:03:59 -0400
X-MC-Unique: af8_ul0QMv2EHH65V-urhg-1
X-Mimecast-MFC-AGG-ID: af8_ul0QMv2EHH65V-urhg_1744974238
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-391492acb59so896272f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744974238; x=1745579038;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BSKJxdvcT8fd+sebpc/NqWYRsM2+G+dmHdHO+Nos4yY=;
        b=Upf9jQecW2GGfTUnRevzmXAh0l3eZ/leAWVOrhKb7oYlPokPG9jABlZ/76H65a/9c9
         rMt3fCfDoH2hWlTVZyJLfsjdduyqZYVzCbwGtK5ycmxH6YfyBtevlRMD3ZVm3je4SUlS
         CSPbTkCT2JQIgrlx+4NnETRYbtCas1ozMOKS6k5hSwEyIr9EXOnTm614bxRjRNMoD8Ww
         DHT6u1Q3f0lMBy1/jQD0iMGgk8t7SB99vx+KFkX+p3AfpQHU1WRbCigNySRsd2k4JKMD
         DU22kSO5l7fEKxYWxhSHFV1Mft/5+pi/8EqcL2XeLDqT8sStRV/igpuU9EIU9tpeyEZ5
         Ktsg==
X-Forwarded-Encrypted: i=1; AJvYcCXOQhRC6R0/penJ1mBsP+OU4rWwDWToOFY7Ts7Vk4o3IhHJlTJOxsqlS231AQGvIPBztF8OYwt+sJXvwUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGj2wvJk8jAaeUfs4diHIPBhZyTGt8pqNQHnj/A6NnD5iF8v5y
	X98GgC0nZFNRfMexBranv29rZu6jF49AfORpN7Pl5NBEry6rGihSholFk2N3tYmOfkMghvamqy9
	8zPMFe7fiJ8G+mkxg2y0j5KlxFMRgH/tx6rlzvgLmAuyeybGaohXiaFr3NKqlKw==
X-Gm-Gg: ASbGncvN6/ccsi3qIAP7wtU4g7p5TbPBcH+sk17Famtp+Nr39+Rh7ijdhx2CMJXhiEs
	pqMVGug06smQQTkVyH5gxiCfW+YIqzQ2jvwNINzUq6uLmMwhVn+u8rmG3VmKWs/nLykTwzdcu67
	wFmPhkZrmFOBTNjU+F8T6pLAk1LyIs5eyOJmrf86SilrNWQQo+PQMIbPvZuD4AGU9L20HI4WrLs
	TCaEL1JF6PTgh/B5O4778xPGWIHG7bkm6em/7s/ffw54YsIgbj3wPA1REST3gN8ws5I5hjQClCr
	0XlO61KanEdcFxsQwEJNs7QcRRwMIQ/+BXC2gjouKBh2SZxjJmNE4B0P2gk3mvv5qBA5d0cl3D0
	Ox57OHhXhA6OVDxP2XFMG/rOmdgYxS9+cWnucVaA=
X-Received: by 2002:a5d:588b:0:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-39efbaf6f36mr1867065f8f.53.1744974238031;
        Fri, 18 Apr 2025 04:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf+9fG1+uo3296S8Tejk3Ae8H2rZna2mhJWG/YNeraujHkurBGArdhJRRyDSspQsoPkVobeA==
X-Received: by 2002:a5d:588b:0:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-39efbaf6f36mr1867041f8f.53.1744974237581;
        Fri, 18 Apr 2025 04:03:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70e:6700:cada:5396:a4f8:1434? (p200300cbc70e6700cada5396a4f81434.dip0.t-ipconnect.de. [2003:cb:c70e:6700:cada:5396:a4f8:1434])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332c1sm2399160f8f.27.2025.04.18.04.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 04:03:57 -0700 (PDT)
Message-ID: <30e37873-77d2-453d-8f73-cbf02e95a153@redhat.com>
Date: Fri, 18 Apr 2025 13:03:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm: add zblock allocator
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Nhat Pham <nphamcs@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Igor Belousov <igor.b@beldev.am>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
 <20250416120912.GC741145@cmpxchg.org>
 <1ed925bd-897e-44b6-ad20-7d61c8c57aa8@redhat.com>
 <4CECDD1E-5227-4719-B826-F6AFC77D4D75@konsulko.se>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4CECDD1E-5227-4719-B826-F6AFC77D4D75@konsulko.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.04.25 12:56, Vitaly Wool wrote:
> 
> 
>> On Apr 18, 2025, at 12:52 PM, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 16.04.25 14:09, Johannes Weiner wrote:
>>> On Sat, Apr 12, 2025 at 05:42:07PM +0200, Vitaly Wool wrote:
>>>> zblock is a special purpose allocator for storing compressed pages.
>>>> It stores integer number of same size objects per its block. These
>>>> blocks consist of several physical pages (2**n, i. e. 1/2/4/8).
>>>>
>>>> With zblock, it is possible to densely arrange objects of various sizes
>>>> resulting in low internal fragmentation. Also this allocator tries to
>>>> fill incomplete blocks instead of adding new ones, in many cases
>>>> providing a compression ratio comparable to zmalloc's.
>>>>
>>>> zblock is also in most cases superior to zsmalloc with regard to
>>>> average performance and worst execution times, thus allowing for better
>>>> response time and real-time characteristics of the whole system.
>>> Is there a reason not to use this allocation scheme in zsmalloc then?
>>> I'm curious what others think, but I'm still not convinced a second
>>> allocator makes sense. It's maintenance overhead, a permanent struggle
>>> to match feature parity, and it fragments development and testing base.
>>> Not long ago several slab allocators were removed for those
>>> reasons. Likewise, we just deleted zbud and z3fold because they didn't
>>> get any attention and bitrotted, but not before years of inflicting
>>> pain through the zpool interface, users accidentally making very
>>> suboptimal choices, reporting the same bugs over and over again etc.
>>> If you discovered a better allocation scheme, that's excellent. But I
>>> don't see why it warrants forking the entire allocator.
>>
>> Just curious, I see a review on v4 happening on something that was nacked by two people in v2 [1].
>>
>> Do these nack's still apply or were something clarified and they no longer apply?
> 
> The reasons for both NAKs are no longer valid (since v3).

Well, there I read [2]

"This is a general NAK from me on any new allocators"

So now I am confused. But maybe that's a different NAK :)

Anyhow, I was just stumbling over this after skimming v2 when it was 
under review, and I did not find a clue about that in the version change 
info under --- (e.g., NAK addressed because of Y).

Have to leave now for the long weekend, Happy Easter / Happy Holidays!

[2] https://lore.kernel.org/linux-mm/20250408195533.GA99052@cmpxchg.org/

-- 
Cheers,

David / dhildenb

