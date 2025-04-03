Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4A19ABD4;
	Thu,  3 Apr 2025 17:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.21.196.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743701839; cv=none; b=MXiUkXpGmgNc5LAo2Zw/EPncwMvRqwtbzT4Kt+dpSZmB1VGOBPxk5BgR5Cw5RQogW0GXGL5wtzaIFe8Wyu+Sx9wXHMe/eSpdMRZQ/3fXwp5D/7/ygDLuBM7Qe0KJaWSimQ/2GGRsDhfq3NKcTw7PjTn/jMeAxPSO0A6x3/6ccZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743701839; c=relaxed/simple;
	bh=nk+I4CKIPmb6qW3lmQ1p9+Ql2zwJ4KhmG08jK9uJ+lw=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XsalzhRIgV58BDY/CinGFFD3L8m7kwUvocBx0RPUkgwOGDdVd2IRHQUFsEpAmRuivsa4HsxoyqknAnt51MAUPo0+1KDEzpLKHGnGnenn2v71wQtgz6h3msSbNE0UqPcQfdxBdfpip6c2lkjOxBv2YnQ00sfhJsq9/K7viPCIaL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=DXQuVUhU; arc=none smtp.client-ip=72.21.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="DXQuVUhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1743701838; x=1775237838;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=WpuVibQmc+h4u3yVHxCHNKHGob9eFLNzJdlsI3A9dPc=;
  b=DXQuVUhUUiYQtut0H42pyr+rhNn/r9YmDHd9+J+A7hsxc9khNldZybTS
   +8OccIO07wmFf+0WWJQ43DQ3dRzNRURPoJLXTUn9myORWg1pxYk3pJHct
   kyypN4qrjTpLrYFvLF5apLU8vTe6I1h75TGochkd8ptiIKQat24TeyO5m
   I=;
X-IronPort-AV: E=Sophos;i="6.15,184,1739836800"; 
   d="scan'208";a="480135445"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 17:37:12 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.17.79:48205]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.10.171:2525] with esmtp (Farcaster)
 id 6e75c6f7-718d-4165-b919-e290268dc74d; Thu, 3 Apr 2025 17:37:10 +0000 (UTC)
X-Farcaster-Flow-ID: 6e75c6f7-718d-4165-b919-e290268dc74d
Received: from EX19D014EUC001.ant.amazon.com (10.252.51.243) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 3 Apr 2025 17:37:07 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D014EUC001.ant.amazon.com (10.252.51.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 3 Apr 2025 17:37:07 +0000
Received: from email-imr-corp-prod-iad-all-1b-a03c1db8.us-east-1.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 17:37:07 +0000
Received: from dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com [172.19.91.144])
	by email-imr-corp-prod-iad-all-1b-a03c1db8.us-east-1.amazon.com (Postfix) with ESMTP id E8B03804E2;
	Thu,  3 Apr 2025 17:37:06 +0000 (UTC)
Received: by dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id A55AF5215; Thu,  3 Apr 2025 17:37:06 +0000 (UTC)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Changyuan Lyu <changyuanl@google.com>, <linux-kernel@vger.kernel.org>,
	<graf@amazon.com>, <akpm@linux-foundation.org>, <luto@kernel.org>,
	<anthony.yznaga@oracle.com>, <arnd@arndb.de>, <ashish.kalra@amd.com>,
	<benh@kernel.crashing.org>, <bp@alien8.de>, <catalin.marinas@arm.com>,
	<dave.hansen@linux.intel.com>, <dwmw2@infradead.org>,
	<ebiederm@xmission.com>, <mingo@redhat.com>, <jgowans@amazon.com>,
	<corbet@lwn.net>, <krzk@kernel.org>, <rppt@kernel.org>,
	<mark.rutland@arm.com>, <pbonzini@redhat.com>, <pasha.tatashin@soleen.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <robh+dt@kernel.org>,
	<robh@kernel.org>, <saravanak@google.com>,
	<skinsburskii@linux.microsoft.com>, <rostedt@goodmis.org>,
	<tglx@linutronix.de>, <thomas.lendacky@amd.com>, <usama.arif@bytedance.com>,
	<will@kernel.org>, <devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
In-Reply-To: <20250403161001.GG342109@nvidia.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
	<20250320015551.2157511-10-changyuanl@google.com>
	<mafs01pu9qm6r.fsf@amazon.de> <20250403161001.GG342109@nvidia.com>
Date: Thu, 3 Apr 2025 17:37:06 +0000
Message-ID: <mafs0tt75p2nx.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 03 2025, Jason Gunthorpe wrote:

> On Thu, Apr 03, 2025 at 03:50:04PM +0000, Pratyush Yadav wrote:
>
>> The patch currently has a limitation where it does not free any of the
>> empty tables after a unpreserve operation. But Changyuan's patch also
>> doesn't do it so at least it is not any worse off.
>
> We do we even have unpreserve? Just discard the entire KHO operation
> in a bulk.

Yeah, I guess that makes sense.

>
>> When working on this patch, I realized that kho_mem_deserialize() is
>> currently _very_ slow. It takes over 2 seconds to make memblock
>> reservations for 48 GiB of 0-order pages. I suppose this can later be
>> optimized by teaching memblock_free_all() to skip preserved pages
>> instead of making memblock reservations.
>
> Yes, this was my prior point of not having actual data to know what
> the actual hot spots are.. This saves a few ms on an operation that
> takes over 2 seconds :)

Yes, you're right. But for 2.5 days of work it isn't too shabby :-)

And I think this will help make the 2 seconds much smaller as well later
down the line since we can now find out if a given page is reserved in a
few operations, and do it in parallel.

>
>> +typedef unsigned long khomem_desc_t;
>
> This should be more like:
>
> union {
>       void *table;
>       phys_addr_t table_phys;
> };
>
> Since we are not using the low bits right now and it is alot cheaper
> to convert from va to phys only once during the final step. __va is
> not exactly fast.

The descriptor is used on _every_ level of the table, not just the top.
So if we use virtual addresses, at serialize time we would have to walk
the whole table and covert all addresses to physical. And __va() does
not seem to be doing too much. On x86, it expands to:

    #define __va(x)			((void *)((unsigned long)(x)+PAGE_OFFSET))

and on ARM64 to:

    #define __va(x)			((void *)__phys_to_virt((phys_addr_t)(x)))
    #define __phys_to_virt(x)	((unsigned long)((x) - PHYS_OFFSET) | PAGE_OFFSET)

So only some addition and bitwise or. Should be fast enough I reckon.
Maybe walking the table once is faster than calculating va every time,
but that walking would happen in the blackout time, and need more data
on whether that optimization is worth it.

>
>> +#define PTRS_PER_LEVEL		(PAGE_SIZE / sizeof(unsigned long))
>> +#define KHOMEM_L1_BITS		(PAGE_SIZE * BITS_PER_BYTE)
>> +#define KHOMEM_L1_MASK		((1 << ilog2(KHOMEM_L1_BITS)) - 1)
>> +#define KHOMEM_L1_SHIFT		(PAGE_SHIFT)
>> +#define KHOMEM_L2_SHIFT		(KHOMEM_L1_SHIFT + ilog2(KHOMEM_L1_BITS))
>> +#define KHOMEM_L3_SHIFT		(KHOMEM_L2_SHIFT + ilog2(PTRS_PER_LEVEL))
>> +#define KHOMEM_L4_SHIFT		(KHOMEM_L3_SHIFT + ilog2(PTRS_PER_LEVEL))
>> +#define KHOMEM_PFN_MASK		PAGE_MASK
>
> This all works better if you just use GENMASK and FIELD_GET

I suppose yes. Though the masks need to be shifted by page order so need
to be careful. Will take a look.

>
>> +static int __khomem_table_alloc(khomem_desc_t *desc)
>> +{
>> +	if (khomem_desc_none(*desc)) {
>
> Needs READ_ONCE

ACK, will add.

>
>> +struct kho_mem_track {
>> +	/* Points to L4 KHOMEM descriptor, each order gets its own table. */
>> +	struct xarray orders;
>> +};
>
> I think it would be easy to add a 5th level and just use bits 63:57 as
> a 6 bit order. Then you don't need all this stuff either.

I am guessing you mean to store the order in the table descriptor
itself, instead of having a different table for each order. I don't
think that would work since say you have a level 1 table spanning 128
MiB. You can have pages of different orders in that 128 MiB, and have no
way of knowing which is which. To have all orders in one table, we would
need more than one bit per page at the lowest level.

Though now that I think of it, it is probably much simpler to just use
khomem_desc_t orders[NR_PAGE_ORDERS] instead of the xarray.

>
>> +int kho_preserve_folio(struct folio *folio)
>> +{
>> +	unsigned long pfn = folio_pfn(folio);
>> +	unsigned int order = folio_order(folio);
>> +	int err;
>> +
>> +	if (!kho_enable)
>> +		return -EOPNOTSUPP;
>> +
>> +	down_read(&kho_out.tree_lock);
>
> This lock still needs to go away

Agree. I hope Changyuan's next version fixes it. I didn't really touch
any of these functions.

>
>> +static void kho_mem_serialize(void)
>> +{
>> +	struct kho_mem_track *tracker = &kho_mem_track;
>> +	khomem_desc_t *desc;
>> +	unsigned long order;
>> +
>> +	xa_for_each(&tracker->orders, order, desc) {
>> +		if (WARN_ON(order >= NR_PAGE_ORDERS))
>> +			break;
>> +		kho_out.mem_tables[order] = *desc;
>
> Missing the virt_to_phys?

Nope. This isn't storing the pointer to the descriptor, but the _value_
of the descriptor -- so it already contains the physical address of the
level 4 table.

>
>> +	nr_tables = min_t(unsigned int, len / sizeof(*tables), NR_PAGE_ORDERS);
>> +	for (order = 0; order < nr_tables; order++)
>> +		khomem_walk_preserved((khomem_desc_t *)&tables[order], order,
>
> Missing phys_to_virt

Same as above. tables contains the _values_ of the descriptors which
already have physical addresses which we turn into virtual ones in
khomem_table().

>
> Please dont' remove the KHOSER stuff, and do use it with proper
> structs and types. It is part of keeping this stuff understandable.

I didn't see any need for KHOSER stuff here to be honest. The only time
we deal with KHO pointers is with table addresses, and that is already
well abstracted in khomem_mkdesc() (I suppose that can require a
khomem_desc_t * instead of a void *, but beyond that it is quite easy to
understand IMO).


-- 
Regards,
Pratyush Yadav
