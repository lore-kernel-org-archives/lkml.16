Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F7A184
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428826; cv=none; b=ZNbcqfpeLL84GEPZHOFJwI1oh6RIZ8jIHcCL7tBuDjDkAffJgcdS5TTIE2e4BAzgtFELvkH2Wo5Lp+RRy2PnFumbbCrukQhDUXk47mUcQEv59BA5hcen+s1qlw4yKLYQWV1i2l3dBLKWFQYy5mBYGdyRv2idzO1clglE6yhc8zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428826; c=relaxed/simple;
	bh=G42ojtVD9lhuuQuPprYSc9qLt5lqQFh8iHJEH+7wbqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfhQhdfjxnu9geFOHVv5+vH0iCsabrjp1yq4XdnWud0E92qNC7ZQsK8nIaSPF1E1pdl/j3prhn4iZe3i4HjR3/0myENzyy1YLMbk3L4bWk4DJ292pRPfXLzkPjs4V/N7J/fIegUJ8jFGYX5OumA5bEXD7J5v6RF3eF+AGLK2FWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 632AF12FC;
	Tue,  1 Jul 2025 21:00:08 -0700 (PDT)
Received: from [10.163.88.114] (unknown [10.163.88.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 497BF3F58B;
	Tue,  1 Jul 2025 21:00:21 -0700 (PDT)
Message-ID: <bdf24a5f-43e5-4817-8262-23bad4d4e1b5@arm.com>
Date: Wed, 2 Jul 2025 09:30:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Use str_plural() in report_hugepages()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630171826.114008-2-thorsten.blum@linux.dev>
 <b1d80881-89da-41a2-8402-c07ec704775a@arm.com>
 <3339A0D2-76EF-498C-858C-EE11C8C1193C@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <3339A0D2-76EF-498C-858C-EE11C8C1193C@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/07/25 2:05 PM, Thorsten Blum wrote:
> On 1. Jul 2025, at 06:43, Anshuman Khandual wrote:
>> Seems like there be more than one place where such str_plural() changes
>> could be made. Hence could you please collate them all part of a series
>> instead.
> 
> There are only two instances under mm/ and I didn't think a patch series
> would be necessary.

Reasonable enough.

LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

