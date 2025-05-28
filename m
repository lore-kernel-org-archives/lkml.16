Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117CD202998;
	Wed, 28 May 2025 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429605; cv=none; b=dyB5bAB0YNARpzVbDwLm9yeSHVeO8xhs19nlss/nK0CG9bXvuT0VokI1PN/hKYV1YCDYiWYqr7IATq3ic+cGf0R/f2aBTgxRCgSf9D+MHiZsSygOVlXp/FnKk1nbHNI2n9ENb9SKepy5MrfL5pIGdq/UBmLD9l0VBy/m+pKx9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429605; c=relaxed/simple;
	bh=l7ZaowPXCK8iLTg+xbpTw8MkGvzHbfT8jsk/1NqwjhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFdcR4MCvNA30s6oM5JP4zU0ubTcOHnabdc22kEClu2N+DmjB3Z8isgfalK4QMD63RqRSi2jgdJ67dEjYrj3yc5m6PPxV+NELQR7kphf7399uiVpmRnCLqiNovuCwOOPDnlgePCcV1mzdTzv6hSJ9EMwt5k62kTixnOij/t9NGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F33FA150C;
	Wed, 28 May 2025 03:53:06 -0700 (PDT)
Received: from [10.57.94.142] (unknown [10.57.94.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C03483F5A1;
	Wed, 28 May 2025 03:53:21 -0700 (PDT)
Message-ID: <ee8db861-3632-48a1-977d-b05670d9637a@arm.com>
Date: Wed, 28 May 2025 11:53:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/mm: add simple VM_PFNMAP tests based on
 mmap'ing /dev/mem
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Ingo Molnar
 <mingo@redhat.com>, Peter Xu <peterx@redhat.com>, Dev Jain
 <dev.jain@arm.com>, Aishwarya TCV <Aishwarya.TCV@arm.com>
References: <20250509153033.952746-1-david@redhat.com>
 <232960c2-81db-47ca-a337-38c4bce5f997@arm.com>
 <7cb7f23a-ce9e-4664-8083-deb73ed23da3@redhat.com>
 <3c15a093-7c19-4c2a-a571-56a5ed4b445f@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <3c15a093-7c19-4c2a-a571-56a5ed4b445f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2025 11:48, David Hildenbrand wrote:
> On 28.05.25 12:44, David Hildenbrand wrote:
>> On 28.05.25 12:34, Ryan Roberts wrote:
>>> Hi David,
>>>
>>>
>>> On 09/05/2025 16:30, David Hildenbrand wrote:
>>>> Let's test some basic functionality using /dev/mem. These tests will
>>>> implicitly cover some PAT (Page Attribute Handling) handling on x86.
>>>>
>>>> These tests will only run when /dev/mem access to the first two pages
>>>> in physical address space is possible and allowed; otherwise, the tests
>>>> are skipped.
>>>
>>> We are seeing really horrible RAS errors with this test when run on arm64 tx2
>>> machine. Based solely on reviewing the code, I think the problem is that tx2
>>> doesn't have anything at phys address 0, so test_read_access() is trying to put
>>> trasactions out to a bad address on the bus.
>>>
>>> tx2 /proc/iomem:
>>>
>>> $ sudo cat /proc/iomem
>>> 30000000-37ffffff : PCI ECAM
>>> 38000000-3fffffff : PCI ECAM
>>> 40000000-5fffffff : PCI Bus 0000:00
>>> ...
>>>
>>> Whereas my x86 box has some reserved memory:
>>>
>>> $ sudo cat /proc/iomem
>>> 00000000-00000fff : Reserved
>>> 00001000-0003dfff : System RAM
>>> ...
>>>
>>
>> A quick fix would be to make this test specific to x86 (the only one I
>> tested on). We should always have the lower two pages IIRC (BIOS stuff etc).

I'm not sure how far along this patch is? I'm guessing mm-stable? Perhaps you
can do the quick fix, then I'd be happy to make this more robust for arm64 later?

>>
>>> I think perhaps the only safe way to handle this is to parse /proc/iomem for a
>>> region of "System RAM" that is at least 2 pages then use that for your read
>>> tests. This would also solve the hypothetical issue of reading something that
>>> has read size effects.
>>
>> That sounds also plausible yes. I somehow remembered that mmap() would
>> fail if "there is nothing".
> 
> Ah, my memory comes back, we perform checks only with CONFIG_STRICT_DEVMEM.

Ahh makes sense. I guess our config doesn't include this. I just checked the RAS
error and it is for PA 0. So I'm confident that what I describe above is
definitely what is happening.



