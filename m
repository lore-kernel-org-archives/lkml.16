Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708F52F4321
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751475182; cv=none; b=izpaxa15A5XMUkWfnCkLaVZmemwPXG+UxdQblcQXqCsmDOnoKEOtQZLUQOzcCw+PwVa/0AgPF84FgKUMHGodsQFL1OYUVDXsl8+QSyKB6bThFofEr/7Gk2KKSS6+eWsEbjQwHQeCVe4YcSCCCvpXz1sNCYV2L8qqtdKa5xsvtzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751475182; c=relaxed/simple;
	bh=eYBPhk4sV4GO/PBkfuhrYLwaeqNoDsM3graeutBFqgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMP/ZpPocUxpTL8QC4VLoMRN636+MADL1L3kpC2MQV/LivXHIKeOFUV8Gx+RsrHmHIX4bHCaZF2s04qcbLHrDR+ps+TSPWQxf1xDskYIzmcfy73bi8eeUtxeoNJONhYkfi6oYBsJT4xRzD0e+o/Bn8Oz2ApypzdMzHGhTdQ6tXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EDwtMXNI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EDwtMXNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751475179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYPE9kAm4n5JaaAj3WmzYSVaYGMobSZ1mvZBnXOb9Jo=;
	b=EDwtMXNI3vV+7orAlA9+Wq/KtFXqzMNgKGA7CdZM+KspZA09Jw6I34feWgjJagvWtE2gIV
	+20aDYTE4kBxP7lMunxSB2WRZy5UXvOjHHy+GDR5yyqVo+YKJDI6zoBh0UTGJGSQ3HeaDv
	9tADzCRAVY3p7h5zGktFn2gRcz4LTJk=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-1qh7-h34NE2P6j7q6kxETA-1; Wed, 02 Jul 2025 12:52:58 -0400
X-MC-Unique: 1qh7-h34NE2P6j7q6kxETA-1
X-Mimecast-MFC-AGG-ID: 1qh7-h34NE2P6j7q6kxETA_1751475177
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2f76caa41a3so25937fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751475177; x=1752079977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYPE9kAm4n5JaaAj3WmzYSVaYGMobSZ1mvZBnXOb9Jo=;
        b=fTCVKoi+qd+EFbD9ppJtToQkOkneGxKCaX2TEgThLui1JpXxthb3xOhH+M6HJz2WVi
         bL6iSO7o0QzpMVxVu58sGIQwhhJYhWBfV5PX6mmN6FDitqCxKk2rdTeHU0/2AG0bIpT7
         T2NIV1KErf0FkgUTeWuzVmM5BFNpZXkwU4ODLF/zyZ70yUl3wPr7mKh/C0rat9h1ECOY
         sOWREOS9dOzCrZyiwJaj6QHnS/7RMIAoxq2+uBoVtT9Fr9SbiJEEekX7suU64m4vu5YI
         qj92xxOEhNkxrxXXyzyeJgO9rQbv+E9ylfjrl2RV9w71IYRofmWQ6MyeiqArEdrEMwU3
         TJTA==
X-Forwarded-Encrypted: i=1; AJvYcCXUI7J+50yUZb2ULNY+4bdOVGOjuWT2KsGCIjQqyF5hFnC661N0+xeFiXLYxTQFc5xYZKRqql8iubfVD48=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbsegVX078i1SzgmSx2gGnv2lNPn5apFnJqPw59JNOul1VdRou
	6HJ0JzfWqOPhCce+1F4eerO28Drh3di0CoF++PwWd03yfCOhP/K/GDfpfBn1jrfhBkgDR9VhwpM
	XJoEa+l0j4eT6lWApLZGNBuNw5AtD0uqPMY6kuWN7Ul4b/v7RB1g9fJFWj/AxU3wJ0w==
X-Gm-Gg: ASbGnctxn0b16DvpB9aIwRZ3l00STLOQxJ9yqYQpJPaqVKnAwCzOje/Ju0SvtC55Bpi
	H6auKxD2992/Pt1RVeEJbVIV+kh2gfKTB5SftDyizx3diNVw3X6tULEpfN573gnXChInDkBrqsG
	jARu4ije4PaXx8ZhLH5i4K1RA+Opi8EfZACk4EcjssrQ+lkjQuOWeYzdYvSDMFRZt5802CpJ9Sv
	A/lnxsLftvKo0tzlv7HtNnYu+ZgwGeLIg1jrYlOZ06lGtqPp5n63S4TN0Zxfx+vfN9ZKYVdjaEu
	z8fi+gAcqAyclP/+LIEPchY=
X-Received: by 2002:a05:6870:c18c:b0:2ea:6ec5:f182 with SMTP id 586e51a60fabf-2f76cb4ee23mr82908fac.38.1751475177335;
        Wed, 02 Jul 2025 09:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8xhPj4vbeCO6BR/7uWOvOuQ5ERydvemFdCvd/3yMMwrMEKbwcC+0fs0OrYA1xZmzNSwVtTg==
X-Received: by 2002:a05:6870:c18c:b0:2ea:6ec5:f182 with SMTP id 586e51a60fabf-2f76cb4ee23mr82872fac.38.1751475176870;
        Wed, 02 Jul 2025 09:52:56 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afafee51bsm2562567a34.10.2025.07.02.09.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 09:52:56 -0700 (PDT)
Message-ID: <1a14ee0a-04af-407d-89a5-5222ee6da9c7@redhat.com>
Date: Wed, 2 Jul 2025 12:51:06 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] KVM: arm64: Map GPU device memory as cacheable
Content-Language: en-US
To: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "david@redhat.com" <david@redhat.com>, "seanjc@google.com"
 <seanjc@google.com>
Cc: Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <danw@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>,
 Dheeraj Nigam <dnigam@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "sebastianene@google.com" <sebastianene@google.com>,
 "coltonlewis@google.com" <coltonlewis@google.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, "ardb@kernel.org"
 <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "tabba@google.com" <tabba@google.com>,
 "qperret@google.com" <qperret@google.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>
References: <20250621042111.3992-1-ankita@nvidia.com>
 <SA1PR12MB7199F8346F2CA802E9F3965DB040A@SA1PR12MB7199.namprd12.prod.outlook.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <SA1PR12MB7199F8346F2CA802E9F3965DB040A@SA1PR12MB7199.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/2/25 5:33 AM, Ankit Agrawal wrote:
>> Grace based platforms such as Grace Hopper/Blackwell Superchips have
>> CPU accessible cache coherent GPU memory. The GPU device memory is
>> essentially a DDR memory and retains properties such as cacheability,
>> unaligned accesses, atomics and handling of executable faults. This
>> requires the device memory to be mapped as NORMAL in stage-2.
>>
>> Today KVM forces the memory to either NORMAL or DEVICE_nGnRE depending
>> on whether the memory region is added to the kernel. The KVM code is
>> thus restrictive and prevents device memory that is not added to the
>> kernel to be marked as cacheable. The patch aims to solve this.
>>
>> A cachebility check is made by consulting the VMA pgprot value. If
>> the pgprot mapping type is cacheable, it is considered safe to be
>> mapped cacheable as the KVM S2 will have the same Normal memory type
>> as the VMA has in the S1 and KVM has no additional responsibility
>> for safety.
>>
>> Note when FWB (Force Write Back) is not enabled, the kernel expects to
>> trivially do cache management by flushing the memory by linearly
>> converting a kvm_pte to phys_addr to a KVA. The cache management thus
>> relies on memory being mapped. Since the GPU device memory is not kernel
>> mapped, exit when the FWB is not supported. Similarly, ARM64_HAS_CACHE_DIC
>> allows KVM to avoid flushing the icache and turns icache_inval_pou() into
>> a NOP. So the cacheable PFNMAP is made contingent on these two hardware
>> features.
>>
>> The ability to safely do the cacheable mapping of PFNMAP is exposed
>> through a KVM capability for userspace consumption.
>>
>> The changes are heavily influenced by the discussions among
>> maintainers Marc Zyngier and Oliver Upton besides Jason Gunthorpe,
>> Catalin Marinas, David Hildenbrand, Sean Christopherson [1]. Many
>> thanks for their valuable suggestions.
>>
>> Applied over next-20250610 and tested on the Grace Blackwell
>> platform by booting up VM, loading NVIDIA module [2] and running
>> nvidia-smi in the VM.
>>
>> To run CUDA workloads, there is a dependency on the IOMMUFD and the
>> Nested Page Table patches being worked on separately by Nicolin Chen.
>> (nicolinc@nvidia.com). NVIDIA has provided git repositories which
>> includes all the requisite kernel [3] and Qemu [4] patches in case
>> one wants to try.
>>
>> v8 -> v9
>> 1. Included MIXEDMAP to also be considered for cacheable mapping.
>> (Jason Gunthorpe).
>> 2. Minor text nits (Jason Gunthorpe).
> 
> Humble reminder for review.
> 

Apologies for the delay, I had some issues getting a Grace-Hopper to test on,
and a VM that needed to be adjusted(bigger file system) to run the 12.9.1 CUDA install script.

Anyhow, able to assign a G-H GPU to a VM under qemu-kvm, and in the
guest, successfully perform an 'nvidia-smi'.  Previously, without this patch
series in the host, the nvida-smi command would fail and hang the guest.
(qemu-kvm was qemu-10.0 -based)

If anyone wants more details, or want more tests run, feel free to ask;
I can probably keep the system for another day or two, but I'll have to
give it up by this Friday.

Tested-by: Donald Dutile <ddutile@redhat.com>

