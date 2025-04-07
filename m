Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03D1A2391
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015579; cv=none; b=YgFt3TUFIt/wQMCURyxUtmOgDpywvOpsWz5qqnRixc75xPBZkPM2r9q7P2LXgaGck4uHhc2y2ykUUFNQdJBBdhKnXrucofRNfZChDj3Fs9oTbOB1nJ68ax5nAJj8W2Dfa+wrJYwiwbKNFQrAjtDJUWboYn1kNdsu+IYjXFiXF60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015579; c=relaxed/simple;
	bh=W4K3fMcEmhk3bdSeaujmShUwd7XI3klv4PsPVfvNKDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQ1kcC7JiP31JwCLndjBoLOOm7AFwSlhkJQv/aF1Y/Zld2fdyAyvLzoawm+4/WpemjhretrLBSOO0MowcvdabS4KR7pbFnNK1TjYVeuYEDGe8vSVIaR3YPp+TqdI87tp7ImX7WBr0bmjM8ZzdNI0r5YaK6BE+PzfBmnlOmkLTT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cCeNAT7R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cCeNAT7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744015576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GLLgKrRQxI+dKck3z70CqekBFlHPAQ3jOtytL0v+L2Q=;
	b=cCeNAT7RHxQOQ8J1ebcrSennDAj+mQbHbnIdnP30F7apoWyY5jT01wjl4l4Ff9wFMZznv0
	R6tnAYZiHTPOFem4ip0IsJn7Hbc2jDtXSp68qJsiOXgnpdrpouPydOt4Pc7BjmkhUKlQKM
	oNrKxWhMv9dKK09SYd4txOniPz4mqjs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-JQrBcpVTP8WO2CmfYaMqwg-1; Mon, 07 Apr 2025 04:46:14 -0400
X-MC-Unique: JQrBcpVTP8WO2CmfYaMqwg-1
X-Mimecast-MFC-AGG-ID: JQrBcpVTP8WO2CmfYaMqwg_1744015574
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so36052705e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015573; x=1744620373;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GLLgKrRQxI+dKck3z70CqekBFlHPAQ3jOtytL0v+L2Q=;
        b=MWGtr57VaXJqr7P2ZoB3mJyOjGHPNfxhLACg9VoEXjw6tb09figHD07Nde3MDjbrdC
         Nm8n9UCAKt5VtV45Qk8+Cm0PlCqp1ZGswOYyartC4uBUVj/XwHQnQ7PEKhkE+FkV30Ep
         oUJFog+35lZdDNVsRt0wwPSUPiggEsyzo2yRPtf+FvbwEg0hhLQH9tAp0eACCnSVwR5d
         Z/T/G0UfibGgvQzv6vbnPjO5nZEP/OGUYM0eLv8F5uAskkrv0aykuJpJDlDyLJ/q+Jv3
         guRWbOMxM6cgDSCmF0NMKzmryj3OxkUKwMfnCWtBrYY+Kdk5VdsGnixff1w0KNZ6YmFV
         OarQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDgzxu+2uDnT6q8sWHhbNPogoEa9DhJxfgq3pDRz71CpusxQ43gb+4Pq303oXGDPpWF1DkRQ3ktBPJF4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kGjptY1xyScYLlNYSbAWRRmlVAm80MYbOkGxBwEYb6X5xHIo
	XigOw/2kd8qXs44Bz9HOGR9HQmiRUqMwS1YftApdwktSD8iGslkSnCwCbOua6cmzgV4JC75oPBz
	4tEn4XEPGrLTQu6qAYSYSIMH0vFSyCNFHydV6k6O2af7P0Ae6nRHXmYUZg+3ltpWZ0jI6LE6v
X-Gm-Gg: ASbGncubOustb+VJbbcbFMaz0gp0B/z3PMstvkJ0UVjd8l03xUkjC39t45kvT/FwMee
	5JE8Qx9ePyCSjbbQhZgfcCcMG2eCSzU67a/MJj9bGoRLTjBfXo9Hkh40/ny/yKDIHimKbqqdv/R
	XEKhjx63ADwKObISU8z8B5hyiaK+1qopc3iEF4JNvY9W92tdHk8K4CDGZ4vsUsUHKt3POlWV0WD
	X+pypzv+7qXIs2ic62hdnu+NTEeuPqVT9Jt9ApkcnGOF2J1qsnInSqFMhphm5JxK11l7qVNcuT/
	M42gzcgaKl88VAr7LTkiEj0CjpV/Amn8gIXW/yzhpg80pID5N/ZtFoO73MMqCKTUjH9XPC1Fasr
	2TxJPXcqi6K2OA5+tESTcDFyvTsLhzj+/6nuDAbKSU4Q=
X-Received: by 2002:a5d:64cd:0:b0:39c:dfa:ca71 with SMTP id ffacd0b85a97d-39d1466350fmr7341000f8f.49.1744015573597;
        Mon, 07 Apr 2025 01:46:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDq/rKarvN5qyVgOPK2GsrYkPJXvHCkkP5ZP4BdxEvKwE9L171LEz2ZcCVV4nBIl9U9nRTUA==
X-Received: by 2002:a5d:64cd:0:b0:39c:dfa:ca71 with SMTP id ffacd0b85a97d-39d1466350fmr7340975f8f.49.1744015573206;
        Mon, 07 Apr 2025 01:46:13 -0700 (PDT)
Received: from ?IPV6:2003:cb:c738:3c00:8b01:4fd9:b833:e1e9? (p200300cbc7383c008b014fd9b833e1e9.dip0.t-ipconnect.de. [2003:cb:c738:3c00:8b01:4fd9:b833:e1e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6c8sm11299424f8f.73.2025.04.07.01.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:46:12 -0700 (PDT)
Message-ID: <a4049e95-5aa4-4a3e-b912-1c0fe33b5906@redhat.com>
Date: Mon, 7 Apr 2025 10:46:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/mm/pat: fix VM_PAT handling when fork() fails in
 copy_page_range()
To: Fedor Pchelkin <pchelkin@ispras.ru>, peterx@redhat.com
Cc: mawupeng <mawupeng1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, xrivendell7@gmail.com,
 wang1315768607@163.com, fleischermarius@gmail.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 akpm@linux-foundation.org
References: <yph6s75zq4lpkrito7gzralkayxtibz4zxizzfjw43i73yldzv@o6lwk3rzvihy>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <yph6s75zq4lpkrito7gzralkayxtibz4zxizzfjw43i73yldzv@o6lwk3rzvihy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.04.25 10:43, Fedor Pchelkin wrote:
> Hi, David, Peter
> 
> Sorry for reviving an old thread. I've tried to keep the context as-is.
> Here is an original link in the archives:
> https://lore.kernel.org/lkml/20241029210331.1339581-1-david@redhat.com/T/#u
> 
> Please see below.
> 
> On 07.11.24 10:08, David Hildenbrand wrote
>> On 07.11.24 09:43, mawupeng wrote:
>>> On 2024/10/31 17:47, David Hildenbrand wrote:
>>>> On 30.10.24 22:32, Peter Xu wrote:
>>>>> On Tue, Oct 29, 2024 at 10:03:31PM +0100, David Hildenbrand wrote:
>>>>>> If track_pfn_copy() fails, we already added the dst VMA to the maple
>>>>>> tree. As fork() fails, we'll cleanup the maple tree, and stumble over
>>>>>> the dst VMA for which we neither performed any reservation nor copied
>>>>>> any page tables.
>>>>>>
>>>>>> Consequently untrack_pfn() will see VM_PAT and try obtaining the
>>>>>> PAT information from the page table -- which fails because the page
>>>>>> table was not copied.
>>>>>>
>>>>>> The easiest fix would be to simply clear the VM_PAT flag of the dst VMA
>>>>>> if track_pfn_copy() fails. However, the whole thing is about "simply"
>>>>>> clearing the VM_PAT flag is shaky as well: if we passed track_pfn_copy()
>>>>>> and performed a reservation, but copying the page tables fails, we'll
>>>>>> simply clear the VM_PAT flag, not properly undoing the reservation ...
>>>>>> which is also wrong.
>>>>>
>>>>> David,
>>>>>
>>>>
>>>> Hi Peter,
>>>>
>>>>> Sorry to not have chance yet reply to your other email..
>>>>>
>>>>> The only concern I have with the current fix to fork() is.. we started to
>>>>> have device drivers providing fault() on PFNMAPs as vfio-pci does, then I
>>>>> think it means we could potentially start to hit the same issue even
>>>>> without fork(), but as long as the 1st pgtable entry of the PFNMAP range is
>>>>> not mapped when the process with VM_PAT vma exit()s, or munmap() the vma.
>>>>
>>>> As these drivers are not using remap_pfn_range, there is no way they could currently get VM_PAT set.
>>>>
>>>> So what you describe is independent of the current state we are fixing here, and this fix should sort out the issues with current VM_PAT handling.
>>>>
>>>> It indeed is an interesting question how to handle reservations when *not* using remap_pfn_range() to cover the whole area.
>>>>
>>>> remap_pfn_range() handles VM_PAT automatically because it can do it: it knows that the whole range will map consecutive PFNs with the same protection, and we expect not parts of the range suddenly getting unmapped (and any driver that does that is buggy).
>>>>
>>>> This behavior is, however, not guaranteed to be the case when remap_pfn_range() is *not* called on the whole range.
>>>>
>>>> For that case (i.e., vfio-pci) I still wonder if the driver shouldn't do the reservation and leave VM_PAT alone.
>>>>
>>>> In the driver, we'd do the reservation once and not worry about fork() etc ... and we'd undo the reservation once the last relevant VM_PFNMAP VMA is gone or the driver let's go of the device. I assume there are already mechanisms in place to deal with that to some degree, because the driver cannot go away while any VMA still has the VM_PFNMAP mapping -- otherwise something would be seriously messed up.
>>>>
>>>> Long story short: let's look into not using VM_PAT for that use case.
>>>>
>>>> Looking at the VM_PAT issues we had over time, not making it more complicated sounds like a very reasonable thing to me :)
>>>
>>> Hi David,
>>>
>>> The VM_PAT reservation do seems complicated. It can trigger the same warning in get_pat_info if remap_p4d_range fails:
>>>
>>> remap_pfn_range
>>>     remap_pfn_range_notrack
>>>       remap_pfn_range_internal
>>>         remap_p4d_range	// page allocation can failed here
>>>       zap_page_range_single
>>>         unmap_single_vma
>>>           untrack_pfn
>>>             get_pat_info
>>>               WARN_ON_ONCE(1);
>>>
>>> Any idea on this problem?
>>
>> In remap_pfn_range(), if remap_pfn_range_notrack() fails, we call
>> untrack_pfn(), to undo the tracking.
>>
>> The problem is that zap_page_range_single() shouldn't do that
>> untrack_pfn() call.
>>
>> That should be fixed by Peter's patch:
>>
>> https://lore.kernel.org/all/20240712144244.3090089-1-peterx@redhat.com/T/#u
> 
> 
> The fix seemingly has not been applied so the issue in question still
> persists. There is a long thread on that patch without an explicit
> conclusion. Did the patch cause any problems or its status changed?

That one still needs to be applied. Peter is currently out for a couple 
of weeks; I might be able to revive that in the meantime.

-- 
Cheers,

David / dhildenb

