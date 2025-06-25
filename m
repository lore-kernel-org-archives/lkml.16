Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67502222CC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849030; cv=none; b=lMUvgSHdZyPVOpV65VyfNkVJtmDSSVemcADyNDNlas++3mMUAqq+PYrta9Y6iCT3Mrx97osOpmv+KM3zjy+HmGm5boaNb8wcVDUUxjj8zJmmGkARtDiy9VLhu8PUs4chObxellYZALs2RuGcfeNKfXSQK6g2zN6v7JVYUaILzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849030; c=relaxed/simple;
	bh=3TQZ8ESGt0fV923f7tYZMTwoU2Q4ytVqepIAaG8soDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=av7sl+M2ZyTeUGYn/OJeJqVmSTvM8qV0RfrpeJFA6Ty2vWFGyE/GZ7bjeAqtho5XjVFjepY7d97SD7b5BOBBEnAoGar++h42AAKSu6lKrpaT4LNHptTy5XSCUlfHY6y3Cn3ICHI1lhS2w4n3FVS/hDCYzgzW6tFplAZGtFR+iQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9837D106F;
	Wed, 25 Jun 2025 03:56:49 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E65E3F58B;
	Wed, 25 Jun 2025 03:57:04 -0700 (PDT)
Message-ID: <94e6bb2c-22b8-4911-a970-d030ec4ac501@arm.com>
Date: Wed, 25 Jun 2025 11:57:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, Karim Manaouil <kmanaouil.dev@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
 <20250614145021.7yve56wcxf3dlvwg@ed.ac.uk>
 <1c7ba21a-7038-4edf-8734-fdba0c617c52@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <1c7ba21a-7038-4edf-8734-fdba0c617c52@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/06/2025 05:03, Dev Jain wrote:
> 
> On 14/06/25 8:20 pm, Karim Manaouil wrote:
>> On Fri, Jun 13, 2025 at 05:27:27PM +0100, Lorenzo Stoakes wrote:
>>> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>>>> +        if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
>>>> +            return -EINVAL;
>>> I guess the point here is to assert that the searched range _entirely
>>> spans_ the folio that the higher order leaf page table entry describes.
>>>
>>> I'm guessing this is desired.
>>>
>>> But I'm not sure this should be a warning?
>>>
>>> What if you happen to walk a range that isn't aligned like this?
>> My understandging is that the caller must ensure that addr is
>> pud/pmd/pte-aligned. But, imho, since -EINVAL is returned, I don't think
>> the WARN_ON_ONCE() is needed.
> 
> I don't really have a strong opinion on this. Ryan may be better fitted
> to answer.

IMHO it's a pretty serious programming cock-up if we ever find this situation,
so I'd prefer to emit the warning.

apply_to_page_range() (which we are replacing here) emits WARN_ON_ONCE() if it
arrives at any non-page leaf mappings, which is stronger than what we have here;
it expects only to modify permissions on regions that are pte-mapped. Here we
are relaxing that requirement to only require that the region begin and end on a
leaf mapping boundary, where the leaf can be at any level.

So for now, we still only expect this code to get called for regions that are
fully pte-mapped.

This series is an enabler to allow us to change that in future though. Yang Shi
is working on a series which will ensure that a region that we want to change
permissions for has its start and end on a leaf boundary by dynamically
splitting the leaf mappings as needed (which can be done safely on arm64 when
FEAT_BBM level 2 is supported). This will then open up the door to mapping the
linear map and vmalloc with large leaf mappings by default. But due to the
splitting we ensure never to trigger the warning; if we do, that is a bug.

Thanks,
Ryan

