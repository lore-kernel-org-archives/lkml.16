Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD00233D85
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743588457; cv=none; b=rdRgyEHozsftzasu/z/WyA04KBnHL2wqz+0Epqwe6h0Gyu2cV94VSqX8JMS3clYE3Bowam2T+bh7zUw+yAah221E1jDPuBfjIrVvwYjDrcxI5I+YFrPstN5f+RRXyITcylE/EVuvpIce+iqRqleeyi17O1RSV/366CiTYJxL8zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743588457; c=relaxed/simple;
	bh=KN+p+9YEZxiooqCkgriTCQI77jRH2mOTQgn3S9OX8NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyZZvdMTnXhzgsuM/I52RwH/zvSljeZ2K4PN5pOduX3Hez/ZizzC8DPmp67W3lkfn3NyzCg5PwK4z7z5N3DbUWNhk9eeYdiRckMpw6raLFg2B4ismZg1yfe+2FpSVDi0UZgssdIOb9XERbDxpncqk1qhJa2zjD4TwU9U33SIhnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ix9oYmWe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ix9oYmWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743588454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5AaC1c6PKTzmWfHarTJDGBoP60gnf8d0MxZhjnD+W4Y=;
	b=Ix9oYmWeD9MgyeOkTF3jLLzwU+cRpUqxQQNwKJu707Zuag/0YI/N6VqjYxaJWeU8izs7Fy
	RmlFdAxSSOz+zg6dEexHKK6YAU52YKxOIifabY1cbdFDYfd39VvFWUv4OqVejBjrYUtsOq
	WSwxNxRpNVO/LzLsQMIMjzCxi+FggJ0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-QUD6Qb2iMhq5Lp2vl79dPA-1; Wed, 02 Apr 2025 06:07:33 -0400
X-MC-Unique: QUD6Qb2iMhq5Lp2vl79dPA-1
X-Mimecast-MFC-AGG-ID: QUD6Qb2iMhq5Lp2vl79dPA_1743588452
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912539665cso368128f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743588452; x=1744193252;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5AaC1c6PKTzmWfHarTJDGBoP60gnf8d0MxZhjnD+W4Y=;
        b=PhXFbK0pi/wNjyOiAXWdDQ6m0fpe7bckdx2cVQPLUuQuJHU6nPi2xXeOxQaTMkJ/1g
         FHt7G+aHq1TINg1bsi+SZj4PjX6QuIfpWQqVaCfbUaHpvIMNJkjEultMdSPMf25LdmTC
         +YDxu2oi6tlFqoGRUJElu3ApZ0wraWyfZhE72zcWTg7PbkXIgPSj188ErbMt5E+6xY3M
         Nme1RR6kV+wSjgDux+ZF854GtQh6RHd+qmC+xFnkRK45KxMP8o6TNGJXQWRGnn9Lc36P
         82srKrWJrqIEMu9kA9Hh6gDjXevuVBCs/nIeuAO41sp8drLWWwCRPPXu47U8xorR8nzP
         /U5g==
X-Forwarded-Encrypted: i=1; AJvYcCUkwUAr4l4wQG1bt2Xs7mLrEIi7AVPDpJBIgvJHNKZKY8Tl/hcB111x0XtmzCVgRuc5JEFvNyYnBcShPlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/D0vNfCBHMHRfVIg2YONAq1LyHzbozQDORwcVagVDsFW/cIU
	BKid0FJD4FzO/tDPDjWmtbNqZkMc/p39ZCqu24Fou+7Q1fyJxkgRo6GvlAUH+XMwIKLPcGDoFXt
	EBZjP231yLQL1O2OVZkC6B0uVARdyc003dUD/IvdCDawv7Qhx4fhJ33jg2O/xrA==
X-Gm-Gg: ASbGnctYlWnqFVZE5HrLnL2KNNmBOlKdGBAeUI5SmQWrQlacoGPkAoAntoQoGXJ3oVx
	2MyKg2bAIRalPOSdXN9f10eV9OXexApd8330f6doGrgAJx633NT/8mMhpHJq8mxe4Pb7b8M9pId
	I8UZCSIoY32tZFzyAhl89yWy0mF2D6CyWM9HCdsY+1dz7G3qb9GCvBKRIzFgOtY5Y5nMzn8Spuz
	LSuw5TJz3CQxmZQkbkDw5tfUJ1SbK0zaGsbFwYurGbxmkSIJZJhQwQxr1DyniDVgMGjeWTZJD4x
	HRbGvb5LKK3JYE8zmXLLXoreJyWTn5GLF02kmbPkFzId2qG0Sqig5bNAcvI/bHRR9FBUmpiNSEL
	Ag7XJb2DTE3Wx5+kfBRVBvxuUdwmxickb5T99Z5xK
X-Received: by 2002:a05:6000:40dc:b0:39c:e0e:b6d1 with SMTP id ffacd0b85a97d-39c2a34ce4emr1079897f8f.12.1743588452250;
        Wed, 02 Apr 2025 03:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA9Iqwj7hFswOQhPG3OLqgxRArhj4fhhc2pkpCBw4j/ahF3y6lotXUQXiv6qT4+hu2Sa6rqg==
X-Received: by 2002:a05:6000:40dc:b0:39c:e0e:b6d1 with SMTP id ffacd0b85a97d-39c2a34ce4emr1079858f8f.12.1743588451818;
        Wed, 02 Apr 2025 03:07:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:cd00:4066:4674:d08:9535? (p200300cbc70fcd00406646740d089535.dip0.t-ipconnect.de. [2003:cb:c70f:cd00:4066:4674:d08:9535])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b662c1csm16288825f8f.28.2025.04.02.03.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 03:07:31 -0700 (PDT)
Message-ID: <8317bce8-1a50-4870-b29a-f8a6b9bb66c6@redhat.com>
Date: Wed, 2 Apr 2025 12:07:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] memory,x86,acpi: hotplug memory alignment
 advisement
To: Mike Rapoport <rppt@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>, Gregory Price <gourry@gourry.net>,
 linux-mm@kvack.org, linux-acpi@vger.kernel.org, kernel-team@meta.com,
 x86@kernel.org, linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, rafael@kernel.org, lenb@kernel.org,
 gregkh@linuxfoundation.org, akpm@linux-foundation.org,
 dan.j.williams@intel.com, Jonathan.Cameron@huawei.com,
 alison.schofield@intel.com, rrichter@amd.com, bfaccini@nvidia.com,
 haibo1.xu@intel.com, dave.jiang@intel.com, Ira Weiny <ira.weiny@intel.com>,
 Fan Ni <fan.ni@samsung.com>
References: <20250127153405.3379117-1-gourry@gourry.net>
 <Z-w2O8O9MGJ1Ok78@localhost.localdomain>
 <01d8cde7-0973-4303-bb5d-3d377a6862cb@redhat.com>
 <Z-0F4Fm0byd0Co3v@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z-0F4Fm0byd0Co3v@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.04.25 11:39, Mike Rapoport wrote:
> On Tue, Apr 01, 2025 at 09:08:31PM +0200, David Hildenbrand wrote:
>> On 01.04.25 20:53, Oscar Salvador wrote:
>>> On Mon, Jan 27, 2025 at 10:34:02AM -0500, Gregory Price wrote:
>>>> v8: nits and tag pickups
>>>>
>>>> When physical address regions are not aligned to memory block size,
>>>> the misaligned portion is lost (stranded capacity).
>>>>
>>>> Block size (min/max/selected) is architecture defined. Most architectures
>>>> tend to use the minimum block size or some simplistic heurist. On x86,
>>>> memory block size increases up to 2GB, and is otherwise fitted to the
>>>> alignment of non-hotplug (i.e. not special purpose memory).
>>>
>>> I wonder if something like this could help us in improving the
>>> ridiculous situation of having 16MB memory-block size on powerpc.
>>
>> They have this granularity because ... they want to add/remove memory in
>> 16MiB on some powerpc dlpar machines :(
> 
> I'm not sure they do it today, there's a comment in near define of that 16M
> in arch/powerpc/mm/init_64.c:
> 
> /*
>   * Outside hotplug the kernel uses this value to map the kernel direct map
>   * with radix. To be compatible with older kernels, let's keep this value
>   * as 16M which is also SECTION_SIZE with SPARSEMEM. We can ideally map
>   * things with 1GB size in the case where we don't support hotplug.
>   */
 >   > and their SECTION_SIZE didn't change since 2005.
> Quite possible that they'll be fine with increasing their
> DEFAULT_MEMORY_BLOCK_SIZE.

At least modern PowerVM on Power10 seems to support LMBs of 128 MiB. 
"Based on this data, Power10 initially only supported LMB sizes of 128MB 
and 256MB." The default usually seems to be 256 MiB.

In reality, the expectation is that the hypervisor will always 
communicate the LMB such that the memory block size will be set to that.

Assuming we'd increase DEFAULT_MEMORY_BLOCK_SIZE to 128MiB, we might 
also be able to increase SECTION_SIZE to 128 MiB I assume.

Not sure about older PowerVM / systems.

[1] 
https://community.ibm.com/community/user/power/blogs/pete-heyrman1/2024/03/06/power10-lmb-sizes

-- 
Cheers,

David / dhildenb

