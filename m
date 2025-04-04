Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8CE1DB363
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769654; cv=none; b=nHKGudbJZt1LCEREh+IpwJp3Glzh0Us4/WwgUsvnXxPmHQYmPmTV+rhcgYgwyswCtRDBjgLxqxDpgoFQZ5yVmTWylC5kJOGTwo8UM4WMfczLC5RLIdN/++RJZSO5nteDHE1r5yiAaJt+5HKo+ZNwWff9IW6L1xlPIh+dirDo8Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769654; c=relaxed/simple;
	bh=S9+fW9jDaiGWggO/G99OVpMxjxgFEh1PJM5b81cf49Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IhltraD1/D6M1IxcO7THIxhVnrZnnY3UGu1OskTBIJm7echqzLCZmcBRtCAl6X2vtA2DSoWnvZsAsahhGq3PeCntTq3B+Xo3X3rU1AUR85Zj4rS56YXvBvZjyOmXawvpl6HEB2YdMSWNmuFfLfYZfMhs92R15SDSfTHXnOy/wvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CPiW0RLi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CPiW0RLi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743769651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GLwMeURzuMh3nERtIkv27OCcHdi53UzzaDVQnEDcAlU=;
	b=CPiW0RLie2BWzt3PZ1UOe5c7Bm/r3JbSgt5IbqoVQ0sHP1PIsCM5/8Mali5JviB4a7OuyG
	JLDdlw0Ddi77xwLUldSBrXnmjmNouezHChxsiw+itcWHj3xj20ULFqpa1vXZSSf+NjvJjG
	e3Q4SdTHqR1aABPBav/VdlckGKXSBgw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-XAJO2K7_OQ6IaUSHuJSSrA-1; Fri, 04 Apr 2025 08:27:30 -0400
X-MC-Unique: XAJO2K7_OQ6IaUSHuJSSrA-1
X-Mimecast-MFC-AGG-ID: XAJO2K7_OQ6IaUSHuJSSrA_1743769649
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39126c3469fso903708f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743769649; x=1744374449;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GLwMeURzuMh3nERtIkv27OCcHdi53UzzaDVQnEDcAlU=;
        b=K6EIz8uUP2+OE7sSOO6JjRkIZ12qS53AdEir1fZFoZPEvP+37c5TWDAEW5ctwYayK8
         dPRqLXyfFlQ+Gq0J1HDCmjTgAcHHGo9mYgLyOqCr05qz2zFyjfJzuy4/Bhx3dCiXBkZc
         t8KfDJ2JSGo7blTfG9Svg9/NAAA2qX9u3Af1EYT+iApcK2THi+Jm0inZLLrqID6ZLPVk
         +h845bcJJI/cXrfGv0nE/0ONR5vOtDTc8/VWN3gAtZxi4hgkUT322Dq1m/bXcnSF6L5L
         mdbiPbMDlC6thyjlmxAawgsba1MBnXOYar9dFugSPgiR4zG/v+hg/X8l6m6PWH566Buq
         W9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCU1OfHPMzmOdz/AIIbXmTGCTxSzRHb6gCrram0hZJMYMT1jg/1ib9M0O2jmsCAPRyOkPaynl9abeHZoUIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YziY7Qy8w2vqgLb+B+DB6194K2RNGeHbNgX4INKEwRIlYFG94wO
	x4hN6dxSyR8xKDd4KY8jMBKyOxriJBCAO7hBkJGhi/hpp6eNwbzCGmF7WdpeZ6Pd2Lb3o/aEFqS
	QUnEd4kahFBWti2XoaUqmiYOJUoU1qL62GUOc+n+dmjjZqQjfOBhkBZr1+P8ZNw==
X-Gm-Gg: ASbGncukN0DZDaSyLRTsf3nvPJ782J+0lMAZZpq3iW+/e4Ve98128VjnFcaFb+QbLiD
	k5nAwsbcB7R8i8rnjX6xhqDiqi8kg4OcFm6TKOdwu9m6uUpP+fCIP+lLLD5PmEI2HH6mGm2KRqY
	nzsX3uodFSH+aFmo6VWOfLBa9LKJM5vbK5cIBIYzLB2nW7auq32RxLqov7u1Tk2RYg0pShDXEEF
	kXna+0GquKi6teJAsuQhI8yFLWHAWacVlqcMEjLQgdsvpOVzvBWHsCb34prvTloh4ELtorVNuGR
	EXsLT9dehWMtcaPl/ylXjgzMInluqXrqd46z4bPQJAVdZYxpo/jA65223xMz8TwSumcn9Aa9hP1
	Yu7frfTJe5CbJlcuUAfcaPOezPM0VCCGfcc1d7Sq/+ac=
X-Received: by 2002:a05:6000:4210:b0:390:e1c5:fe2 with SMTP id ffacd0b85a97d-39cba975cb2mr2102798f8f.38.1743769649193;
        Fri, 04 Apr 2025 05:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDaeuJ+2foR+W6LwpzdkHucTnoX0fNEEY1FkOxSODlHwM7VGi2JXLd91UUY8W5456NWELZiA==
X-Received: by 2002:a05:6000:4210:b0:390:e1c5:fe2 with SMTP id ffacd0b85a97d-39cba975cb2mr2102778f8f.38.1743769648811;
        Fri, 04 Apr 2025 05:27:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096964sm4271241f8f.15.2025.04.04.05.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:27:28 -0700 (PDT)
Message-ID: <18abdf06-9d45-42bf-b666-af1a416bf2a6@redhat.com>
Date: Fri, 4 Apr 2025 14:27:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
From: David Hildenbrand <david@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
 Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 x86@kernel.org
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
 <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
 <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>
 <e75ca8d9-0386-4de6-bee9-e6044b001a30@lucifer.local>
 <92c40df4-2e93-40ca-929e-a0b50ab2b631@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <92c40df4-2e93-40ca-929e-a0b50ab2b631@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.04.25 14:20, David Hildenbrand wrote:
> On 04.04.25 13:52, Lorenzo Stoakes wrote:
>> On Thu, Apr 03, 2025 at 10:59:12PM +0200, David Hildenbrand wrote:
>>> On 03.04.25 17:14, Dan Carpenter wrote:
>>>> Sorry, I've been having trouble with my email recently...  I replied
>>>> earlier but my email got eaten on the way out.
>>>>
>>>> What happened here is that the zero day bot emails go to me first and
>>>> then I review them or forward them depending on if they're a real
>>>> issue or not.
>>>>
>>>> Here it's a false postive because it's set and used if the
>>>> (src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
>>>> this correctly.  I've been meaning to fix this in Smatch for a
>>>> while.
>>>
>>> There is a slight complication (on top of the VM_PFNMAP checks):
>>>
>>> If "src_vma->vm_flags & VM_PAT" we
>>> * set pfn
>>> * set dst_vma->vm_flags |= VM_PFNMAP
>>>
>>> Then, we only consume the pfn if "dst_vma->vm_flags & VM_PFNMAP"
>>>
>>> While we won't be using the uninitialized pfn (good), we'd still pass an
>>> uninitialized pfn, which IIRC is UB; likely nothing happens on GCC clang,
>>> but we better handle it.
>>>
>>> So that should better be changed; I'll send a fix.
>>
>> Maybe just worth setting pfn = 0 _as well_ in the caller, belts + braces maybe?
> 
> I'm planning on doing the following, just didn't get to testing it:
> 

Ah, now I get your comment. Yeah, we could just set pfn=0 in the caller 
as well to make smatch completely happy I guess.

-- 
Cheers,

David / dhildenb

