Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DF52222CC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849055; cv=none; b=a+tXIyd+l7Bg9zuX9kSTdT+GRMQsrLpUfw23vzQRBObwUWpaBdkizWYjRrRMAbRvuM+kF3CPWgTG4pizSCjzaf7pcKVHvJFkCCLnBNJQdSxEwxc8qAmUGlMJhE8JTNH5iv7i7MhoS3oD48S2x6ewEH0mYZINVpxs/Elwb0eoGDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849055; c=relaxed/simple;
	bh=Nep5sqQSrUXmieR3/Vj7bpG3Y2kQ+1E9cMxQU+iWDMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qplo+rgViAkvChuxcfhoksP29jcPNRdrxJtOJq5hoYx+1K25aIdkztWbtwG4eIBgApzNS5YbnsavcWaaoknjMuE3teIAsgbvcI2Vj/4ZXvVdBGGuCbV7ZYTBYFfTaKuqxQgbepes0GtF9mR9ctzNGEPbLnaIksTnPxeXZPmWq/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 527A5106F;
	Wed, 25 Jun 2025 03:57:15 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ED4E3F58B;
	Wed, 25 Jun 2025 03:57:30 -0700 (PDT)
Message-ID: <9cc06930-2671-4534-ac30-6d3ae3e472d3@arm.com>
Date: Wed, 25 Jun 2025 11:57:28 +0100
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
To: Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
 <aE51cWMkSfNJ5i4c@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aE51cWMkSfNJ5i4c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/06/2025 08:25, Mike Rapoport wrote:
> On Fri, Jun 13, 2025 at 05:27:27PM +0100, Lorenzo Stoakes wrote:
>> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>>> -/*
>>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>>> - */
>>> -static int __change_memory_common(unsigned long start, unsigned long size,
>>> +static int ___change_memory_common(unsigned long start, unsigned long size,
>>>  				pgprot_t set_mask, pgprot_t clear_mask)
>>
>> I wouldn't presume to comment on conventions in arm64 arch code, but that's
>> a lot of underscores :P
>>
>> I wonder if this is the best name for it as you're not only invoking it
>> from __change_memory_common()?
> 
> Could update_range_pgport() work?

Sounds good to me!

>  
>> And yes this is a pedantic comment, I realise :)
>>
> 

