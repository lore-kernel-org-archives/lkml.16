Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3501A27E1C8
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429114; cv=none; b=mUEc3OzfAGpHYaIG0eXQqnzxwNT5+FjacJCIrMajWyVFUt62AnRxbaqirCG4FCAsoMqKwBG7QJr10gRAPbVQgovE3gjBIXCzLv/k8m6ofHgqE1Ygkl7SUsASe0X1DfrvfHtIcLpniYY4hbHfNWsm2InSk/jxyqfwaMTruQ6a3uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429114; c=relaxed/simple;
	bh=co/uBLSGp53c7N+mMpcb7E6STfbfEyBwA2pfzeCn2cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnThv7n0sIF3+WdcjYCW7L4W90QQfNMlJTq2sFguUIRNCvbltUaMFy1UC/JbKNgUuA+Cap924KLSbUnDkUxIthjSIFMpNu6T6A4GWgq8cd+9IZXkxMAapQLE+552KUmh/Eu94L17kmDbH7KW4SonCPmkXD8oYeowrgQz3EbxNY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AcO+Xcvk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AcO+Xcvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748429111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IE8zZqs9qBuIS+UhWEzh2HdhWYiIOXmhgGdM2au/NtM=;
	b=AcO+XcvkgWRP38++G4lzAQul52c0UZQxvhXKDX8fIPWTjTEoP6dzhtfY2r0N1jQOdZaeir
	aYEYB/Hg+U9w6+NzpQayY/3YDZmS+4Jn99ZRmOXfTHw3SI1eKsAd+Lm099o2YDAFkf+WTT
	jSLc5X520gd/h9mdz5Ps7zJ/weC8oNI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-7ZV6SC5JPe-KOhik5X6mRg-1; Wed, 28 May 2025 06:45:08 -0400
X-MC-Unique: 7ZV6SC5JPe-KOhik5X6mRg-1
X-Mimecast-MFC-AGG-ID: 7ZV6SC5JPe-KOhik5X6mRg_1748429108
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so27508465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429107; x=1749033907;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IE8zZqs9qBuIS+UhWEzh2HdhWYiIOXmhgGdM2au/NtM=;
        b=w51sAHVw32l07Eb1fuCBbOdZ2+FcaT6QHIwwEePyg6DaskzxX3P39KCvWD3oAr9iwf
         SwdOkTEzQ7CryuSkBlLP26JBaxMOWhuDb5N4PSUW3JnHZpeqaifYguYP9HXVV6nSf7fu
         dzXt2bd/cFP9z0Lm315uWhMZqrdvfiVU2SPDEOopWTltW3nzjlttML9GCTr3dAoQz8fH
         0si/sZKSiUlEyk3JGb6zCio82KnkCNJCn5NNFr4xfbzpaXUjRCnvmUYLpl0r1tz0UQ71
         Ts0TYH3+JwhiMdvlqd0BdGKXznLiV451MZZgbnYa1IHWj7kHysHpvHf3p1jCmUxeaG+x
         j3gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBQHNaw0OWYTQy/Cr5213ir1omAjkjjyjVDCLSwm2cCNctMGeen6xiBrqDZ53q3epjjpcng0YhNo4Li7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZyqxAb2rk6PjVBcTsZtYWexGQcDA0T2V6gSN8IC41OYTFc3/
	SuJ3LuNsYVQLwnqrwYEP0GeKGRLT9OPJcy6Ro4wlN9sPtI7uIDmtmh1i/1hi+k7MuoBWy9gvpYP
	RC3i1EUhSgX3+5J9cIsFz0mmcKzwMGA9dzmCduBIT50dSTYBb4jnymL0u03pyypfE0g==
X-Gm-Gg: ASbGncu/rWNbXtUrq9BjBe4dwMleURuNmc0OK4D5jWfx4zmQpEhecTy/Wbp5tyO1g53
	55GCK+IgVcImw/J4T1WLpzZvyH/sgLRhr3o9kZORsek/yTJUVYgJow0ecJKI5nQeF+zuarWkblK
	aMymkrFWcvB086l5btPAEsFVQEP6bg4vr1jsVw1vSqzvaVMH4q7IL8j8mpG2Cp1LZNy/k7pt5f6
	/OY1SuAhnWyAk82rM2zDpgEMh/CzGW4vuxLO02F8K+Vy/g6YJSjyFF+JufdaApSownqjkrXh99B
	52nXcAyhn4rZk/fpYro3XcEpqvQL98IUruYAs0Z6Xw==
X-Received: by 2002:a05:600c:348d:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-44c930164e9mr135342755e9.1.1748429107577;
        Wed, 28 May 2025 03:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqaM2F9y7Cz/Ou34Qp3QRxOSMXmQR7BVDBUFBfuKZ4r79nAuU1/Hi+bdNGUeCGQloNJ0UjLg==
X-Received: by 2002:a05:600c:348d:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-44c930164e9mr135342385e9.1.1748429107111;
        Wed, 28 May 2025 03:45:07 -0700 (PDT)
Received: from [192.168.3.141] (p57a1aa11.dip0.t-ipconnect.de. [87.161.170.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4507253bebdsm13854235e9.4.2025.05.28.03.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 03:45:06 -0700 (PDT)
Message-ID: <7cb7f23a-ce9e-4664-8083-deb73ed23da3@redhat.com>
Date: Wed, 28 May 2025 12:44:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/mm: add simple VM_PFNMAP tests based on
 mmap'ing /dev/mem
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Ingo Molnar
 <mingo@redhat.com>, Peter Xu <peterx@redhat.com>, Dev Jain
 <dev.jain@arm.com>, Aishwarya TCV <Aishwarya.TCV@arm.com>
References: <20250509153033.952746-1-david@redhat.com>
 <232960c2-81db-47ca-a337-38c4bce5f997@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <232960c2-81db-47ca-a337-38c4bce5f997@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.05.25 12:34, Ryan Roberts wrote:
> Hi David,
> 
> 
> On 09/05/2025 16:30, David Hildenbrand wrote:
>> Let's test some basic functionality using /dev/mem. These tests will
>> implicitly cover some PAT (Page Attribute Handling) handling on x86.
>>
>> These tests will only run when /dev/mem access to the first two pages
>> in physical address space is possible and allowed; otherwise, the tests
>> are skipped.
> 
> We are seeing really horrible RAS errors with this test when run on arm64 tx2
> machine. Based solely on reviewing the code, I think the problem is that tx2
> doesn't have anything at phys address 0, so test_read_access() is trying to put
> trasactions out to a bad address on the bus.
> 
> tx2 /proc/iomem:
> 
> $ sudo cat /proc/iomem
> 30000000-37ffffff : PCI ECAM
> 38000000-3fffffff : PCI ECAM
> 40000000-5fffffff : PCI Bus 0000:00
> ...
> 
> Whereas my x86 box has some reserved memory:
> 
> $ sudo cat /proc/iomem
> 00000000-00000fff : Reserved
> 00001000-0003dfff : System RAM
> ...
> 

A quick fix would be to make this test specific to x86 (the only one I 
tested on). We should always have the lower two pages IIRC (BIOS stuff etc).

> I think perhaps the only safe way to handle this is to parse /proc/iomem for a
> region of "System RAM" that is at least 2 pages then use that for your read
> tests. This would also solve the hypothetical issue of reading something that
> has read size effects.

That sounds also plausible yes. I somehow remembered that mmap() would 
fail if "there is nothing".

> 
> I also spotted a few nits while reading the code...
> 
>>
>> On current x86-64 with PAT inside a VM, all tests pass:
>>
>> 	TAP version 13
>> 	1..6
>> 	# Starting 6 tests from 1 test cases.
>> 	#  RUN           pfnmap.madvise_disallowed ...
>> 	#            OK  pfnmap.madvise_disallowed
>> 	ok 1 pfnmap.madvise_disallowed
>> 	#  RUN           pfnmap.munmap_split ...
>> 	#            OK  pfnmap.munmap_split
>> 	ok 2 pfnmap.munmap_split
>> 	#  RUN           pfnmap.mremap_fixed ...
>> 	#            OK  pfnmap.mremap_fixed
>> 	ok 3 pfnmap.mremap_fixed
>> 	#  RUN           pfnmap.mremap_shrink ...
>> 	#            OK  pfnmap.mremap_shrink
>> 	ok 4 pfnmap.mremap_shrink
>> 	#  RUN           pfnmap.mremap_expand ...
>> 	#            OK  pfnmap.mremap_expand
>> 	ok 5 pfnmap.mremap_expand
>> 	#  RUN           pfnmap.fork ...
>> 	#            OK  pfnmap.fork
>> 	ok 6 pfnmap.fork
>> 	# PASSED: 6 / 6 tests passed.
>> 	# Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0
>>
>> However, we are able to trigger:
>>
>> [   27.888251] x86/PAT: pfnmap:1790 freeing invalid memtype [mem 0x00000000-0x00000fff]
>>
 >> There are probably more things worth testing in the future, such 
as>> MAP_PRIVATE handling. But this set of tests is sufficient to cover 
most of
>> the things we will rework regarding PAT handling.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Shuah Khan <shuah@kernel.org>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>
>> Hopefully I didn't miss any review feedback.
>>
>> v1 -> v2:
>> * Rewrite using kselftest_harness, which simplifies a lot of things
>> * Add to .gitignore and run_vmtests.sh
>> * Register signal handler on demand
>> * Use volatile trick to force a read (not factoring out FORCE_READ just yet)
>> * Drop mprotect() test case
>> * Add some more comments why we test certain things
>> * Use NULL for mmap() first parameter instead of 0
>> * Smaller fixes
>>
>> ---
>>   tools/testing/selftests/mm/.gitignore     |   1 +
>>   tools/testing/selftests/mm/Makefile       |   1 +
>>   tools/testing/selftests/mm/pfnmap.c       | 196 ++++++++++++++++++++++
>>   tools/testing/selftests/mm/run_vmtests.sh |   4 +
>>   4 files changed, 202 insertions(+)
>>   create mode 100644 tools/testing/selftests/mm/pfnmap.c
>>
>> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
>> index 91db34941a143..824266982aa36 100644
>> --- a/tools/testing/selftests/mm/.gitignore
>> +++ b/tools/testing/selftests/mm/.gitignore
>> @@ -20,6 +20,7 @@ mremap_test
>>   on-fault-limit
>>   transhuge-stress
>>   pagemap_ioctl
>> +pfnmap
>>   *.tmp*
>>   protection_keys
>>   protection_keys_32
>> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
>> index ad4d6043a60f0..ae6f994d3add7 100644
>> --- a/tools/testing/selftests/mm/Makefile
>> +++ b/tools/testing/selftests/mm/Makefile
>> @@ -84,6 +84,7 @@ TEST_GEN_FILES += mremap_test
>>   TEST_GEN_FILES += mseal_test
>>   TEST_GEN_FILES += on-fault-limit
>>   TEST_GEN_FILES += pagemap_ioctl
>> +TEST_GEN_FILES += pfnmap
>>   TEST_GEN_FILES += thuge-gen
>>   TEST_GEN_FILES += transhuge-stress
>>   TEST_GEN_FILES += uffd-stress
>> diff --git a/tools/testing/selftests/mm/pfnmap.c b/tools/testing/selftests/mm/pfnmap.c
>> new file mode 100644
>> index 0000000000000..8a9d19b6020c7
>> --- /dev/null
>> +++ b/tools/testing/selftests/mm/pfnmap.c
>> @@ -0,0 +1,196 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Basic VM_PFNMAP tests relying on mmap() of '/dev/mem'
>> + *
>> + * Copyright 2025, Red Hat, Inc.
>> + *
>> + * Author(s): David Hildenbrand <david@redhat.com>
>> + */
>> +#define _GNU_SOURCE
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <stdint.h>
>> +#include <unistd.h>
>> +#include <errno.h>
>> +#include <fcntl.h>
>> +#include <signal.h>
>> +#include <setjmp.h>
>> +#include <linux/mman.h>
>> +#include <sys/mman.h>
>> +#include <sys/wait.h>
>> +
>> +#include "../kselftest_harness.h"
>> +#include "vm_util.h"
>> +
>> +static sigjmp_buf sigjmp_buf_env;
>> +
>> +static void signal_handler(int sig)
>> +{
>> +	siglongjmp(sigjmp_buf_env, -EFAULT);
>> +}
>> +
>> +static int test_read_access(char *addr, size_t size, size_t pagesize)
>> +{
>> +	size_t offs;
>> +	int ret;
>> +
>> +	if (signal(SIGSEGV, signal_handler) == SIG_ERR)
>> +		return -EINVAL;
>> +
>> +	ret = sigsetjmp(sigjmp_buf_env, 1);
>> +	if (!ret) {
>> +		for (offs = 0; offs < size; offs += pagesize)
>> +			/* Force a read that the compiler cannot optimize out. */
>> +			*((volatile char *)(addr + offs));
>> +	}
>> +	if (signal(SIGSEGV, signal_handler) == SIG_ERR)
> 
> I think you mean:
> 	if (signal(SIGSEGV, SIG_DFL) == SIG_ERR)
> 
> Otherwise your signal_handler will remain installed, right?

Yeah, copy and past error.

> 
>> +		return -EINVAL;
>> +
>> +	return ret;
>> +}
>> +
>> +FIXTURE(pfnmap)
>> +{
>> +	size_t pagesize;
>> +	int dev_mem_fd;
>> +	char *addr1;
>> +	size_t size1;
>> +	char *addr2;
>> +	size_t size2;
>> +};
>> +
>> +FIXTURE_SETUP(pfnmap)
>> +{
>> +	self->pagesize = getpagesize();
>> +
>> +	self->dev_mem_fd = open("/dev/mem", O_RDONLY);
>> +	if (self->dev_mem_fd < 0)
>> +		SKIP(return, "Cannot open '/dev/mem'\n");
>> +
>> +	/* We'll require the first two pages throughout our tests ... */
>> +	self->size1 = self->pagesize * 2;
>> +	self->addr1 = mmap(NULL, self->size1, PROT_READ, MAP_SHARED,
>> +			   self->dev_mem_fd, 0);
>> +	if (self->addr1 == MAP_FAILED)
>> +		SKIP(return, "Cannot mmap '/dev/mem'\n");
>> +
>> +	/* ... and want to be able to read from them. */
>> +	if (test_read_access(self->addr1, self->size1, self->pagesize))
>> +		SKIP(return, "Cannot read-access mmap'ed '/dev/mem'\n");
>> +
>> +	self->size2 = 0;
>> +	self->addr2 = MAP_FAILED;
> 
> Do you need to init all the params in FIXTURE(pfnmap) to their "safe" values
> before any possible early returns? We don't want FIXTURE_TEARDOWN(pfnmap)
> getting confused.

If FIXTURE_SETUP fails, we'll exit immediately. See __TEST_F_IMPL().

Note that all tests are executed in a fork'ed child process, so quitting 
early (or not even having FIXTURE_TEARDOWN in most cases ...) does not 
really matter.

-- 
Cheers,

David / dhildenb

