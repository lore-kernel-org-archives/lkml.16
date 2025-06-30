Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2804C11CAF
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274260; cv=none; b=jLRRB+fudW+Tw4xTkTqbwaTyubRxQA8s3OFbmDbZCkfWdFo2HZi9K6smgFL+mkW0Opuc17EQ9W+6XvZk9K8rEpVVJCm5wRQlvTGPpgAQK9MJiOqcej7MrRe3jgyJ9uTOMxgly+8oqkJcf0oDB3PXHkkqFqmbdvBhhV/qZXPAuWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274260; c=relaxed/simple;
	bh=5q+paxmGeWovpQYgcOS1cNMlnGOfttYyyz9/4VJ2FQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izyd8p4GQPHt3keLqEKvU3BY3JDvTGrEd83W6MvOxHi/5Acq6+8LpkvotOYORkfuYzUC5hde0Ll+Cf+FYSfPtnosVyyXs7iEFtt9QBJIr2gnPPiE0WxhaSasiXrf5wqqAOIkWBxE+3Obw3520/zqVftKfmzt1sKXksZk3bPQTxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 780871D34;
	Mon, 30 Jun 2025 02:04:02 -0700 (PDT)
Received: from [10.1.34.165] (XHFQ2J9959.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A561F3F6A8;
	Mon, 30 Jun 2025 02:04:14 -0700 (PDT)
Message-ID: <aa9c4bd5-f36e-4820-9ca2-1154b44b8908@arm.com>
Date: Mon, 30 Jun 2025 10:04:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <5c3428c6-25be-4a94-811a-6bb6718f6c58@arm.com>
 <cc846c55-0505-4ad6-9664-ac799d9c0226@redhat.com>
 <5375208d-2c11-4579-a303-e8416ab07159@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <5375208d-2c11-4579-a303-e8416ab07159@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2025 04:34, Dev Jain wrote:
> 
> On 29/06/25 2:30 am, David Hildenbrand wrote:
>> On 28.06.25 05:37, Dev Jain wrote:
>>>
>>> On 27/06/25 5:25 pm, David Hildenbrand wrote:
>>>> Honoring these PTE bits is the exception, so let's invert the meaning.
>>>>
>>>> With this change, most callers don't have to pass any flags.
>>>>
>>>> No functional change intended.
>>>
>>> FWIW I had proposed this kind of change earlier to Ryan (CCed) and
>>> he pointed out: "Doesn't that argument apply in reverse if you want
>>> to ignore something new in future?
>>>
>>> By default we are comparing all the bits in the pte when determining the batch.
>>> The flags request to ignore certain bits.
>>
>> That statement is not true: as default we ignore the write and young bit. And
>> we don't have flags for that ;)
>>
>> Now we also ignore the dirty and soft-dity bit as default, unless told not to
>> do that by one very specific caller.
>>
>>> If we want to ignore extra bits in
>>> future, we add new flags and the existing callers don't need to be updated.
>>
>> What stops you from using FPB_IGNORE_* for something else in the future?
>>
>> As a side note, there are not that many relevant PTE bits to worry about in
>> the near future ;)
>>
>> I mean, uffd-wp, sure, ... and before we add a FPB_HONOR_UFFD_WP to all users
>> to be safe (and changing the default to ignore), you could add a
>> FPB_IGNORE_UFFD_WP first, to then check who really can tolerate just ignoring
>> it (most of them, I assume).
> I agree.

Meh. Personally I think if you start mixing HONOR and IGNORE flags, it becomes
very confusing to work out what is being checked for and what is not. I stand by
my original view. But yeah, writable and young confuse it a bit... How about
generalizing by explicitly requiring IGNORE flags for write and young, then also
create a flags macro for the common case?

#define FPB_IGNORE_COMMON (FPB_IGNORE_WRITE | FPB_IGNORE_YOUNG |	\
			   FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY)

It's not a hill I'm going to die on though...

Thanks,
Ryan
