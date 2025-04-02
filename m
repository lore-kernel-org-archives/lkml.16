Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DA31442F4;
	Wed,  2 Apr 2025 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621398; cv=none; b=Z2vibACnhPGF40s8UwONZN2X6R+FFDvuuNkdlU4/g5pvJUHhdrKZy7kFfMzD75Vofuzf1wPXdY2s5/2iwaiEl/Th5PcC/KC076XIXMCoMLryn5ffQm6bjjtGuENvax20IqRKOGXwzzrMPcIwRaMrrgIMB4HRPD6l1xcob86ld7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621398; c=relaxed/simple;
	bh=cAs+wIf0YxeeJJc1k2FwvxC4kPJYJUIJfrDRhxRP4Us=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B0HbxwPs6DVcTM5Cwl0d2jG5SVCPvXjGWkHoRCxxgaPn+ZPKOOE4/lCePi+NK7B8EDQmVQzYOkZont5JLZV4OuxDY0CXQ11GKwk7wMvvRj50eVhXe4d8ELTRQh/IhHZ8zrSR8LoPKH5/pX9es3/84HwUpFticWc3xglTD8QlahY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=iRHE1Dob; arc=none smtp.client-ip=99.78.197.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="iRHE1Dob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1743621397; x=1775157397;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=8umj+ndDF/ipCfwtuKdMZkQWmOijnGXaazU2k4hwCNY=;
  b=iRHE1DobpITxvIKwFSr7VZ3/+YI7EtW6fBkoKLP9AVJoEHINPrYiYYIf
   TCn4mwAQ/2r0kxyeg9XIcaWoMT8XCXQ9N/RqnyvgyO2gZKAyXJORopRBJ
   D052Je+b6KT8dTDxXUnQGOcV9Gvqx2MhUe9fRpXp9i2nshqSlw3S5cJzP
   I=;
X-IronPort-AV: E=Sophos;i="6.15,183,1739836800"; 
   d="scan'208";a="37530635"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:16:34 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:8453]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.148:2525] with esmtp (Farcaster)
 id 3d208980-fd57-4d9c-b742-ec30a98b0997; Wed, 2 Apr 2025 19:16:33 +0000 (UTC)
X-Farcaster-Flow-ID: 3d208980-fd57-4d9c-b742-ec30a98b0997
Received: from EX19D020UWC002.ant.amazon.com (10.13.138.147) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 2 Apr 2025 19:16:29 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D020UWC002.ant.amazon.com (10.13.138.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 2 Apr 2025 19:16:28 +0000
Received: from email-imr-corp-prod-pdx-all-2c-785684ef.us-west-2.amazon.com
 (10.43.8.6) by mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 19:16:28 +0000
Received: from dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com [172.19.91.144])
	by email-imr-corp-prod-pdx-all-2c-785684ef.us-west-2.amazon.com (Postfix) with ESMTP id 88B30A046F;
	Wed,  2 Apr 2025 19:16:27 +0000 (UTC)
Received: by dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 1CF466148; Wed,  2 Apr 2025 19:16:27 +0000 (UTC)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Changyuan Lyu <changyuanl@google.com>
CC: <linux-kernel@vger.kernel.org>, <graf@amazon.com>,
	<akpm@linux-foundation.org>, <luto@kernel.org>, <anthony.yznaga@oracle.com>,
	<arnd@arndb.de>, <ashish.kalra@amd.com>, <benh@kernel.crashing.org>,
	<bp@alien8.de>, <catalin.marinas@arm.com>, <dave.hansen@linux.intel.com>,
	<dwmw2@infradead.org>, <ebiederm@xmission.com>, <mingo@redhat.com>,
	<jgowans@amazon.com>, <corbet@lwn.net>, <krzk@kernel.org>, <rppt@kernel.org>,
	<mark.rutland@arm.com>, <pbonzini@redhat.com>, <pasha.tatashin@soleen.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <robh+dt@kernel.org>,
	<robh@kernel.org>, <saravanak@google.com>,
	<skinsburskii@linux.microsoft.com>, <rostedt@goodmis.org>,
	<tglx@linutronix.de>, <thomas.lendacky@amd.com>, <usama.arif@bytedance.com>,
	<will@kernel.org>, <devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
In-Reply-To: <20250320015551.2157511-10-changyuanl@google.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
	<20250320015551.2157511-10-changyuanl@google.com>
Date: Wed, 2 Apr 2025 19:16:27 +0000
Message-ID: <mafs05xjmqsqc.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Changyuan,

On Wed, Mar 19 2025, Changyuan Lyu wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Introduce APIs allowing KHO users to preserve memory across kexec and
> get access to that memory after boot of the kexeced kernel
>
> kho_preserve_folio() - record a folio to be preserved over kexec
> kho_restore_folio() - recreates the folio from the preserved memory
> kho_preserve_phys() - record physically contiguous range to be
> preserved over kexec.
> kho_restore_phys() - recreates order-0 pages corresponding to the
> preserved physical range
>
> The memory preservations are tracked by two levels of xarrays to manage
> chunks of per-order 512 byte bitmaps. For instance the entire 1G order
> of a 1TB x86 system would fit inside a single 512 byte bitmap. For
> order 0 allocations each bitmap will cover 16M of address space. Thus,
> for 16G of memory at most 512K of bitmap memory will be needed for order 0.
>
> At serialization time all bitmaps are recorded in a linked list of pages
> for the next kernel to process and the physical address of the list is
> recorded in KHO FDT.
>
> The next kernel then processes that list, reserves the memory ranges and
> later, when a user requests a folio or a physical range, KHO restores
> corresponding memory map entries.
>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> ---
>  include/linux/kexec_handover.h |  38 +++
>  kernel/kexec_handover.c        | 486 ++++++++++++++++++++++++++++++++-
>  2 files changed, 522 insertions(+), 2 deletions(-)
[...]
> +int kho_preserve_phys(phys_addr_t phys, size_t size)
> +{
> +	unsigned long pfn = PHYS_PFN(phys), end_pfn = PHYS_PFN(phys + size);
> +	unsigned int order = ilog2(end_pfn - pfn);

This caught my eye when playing around with the code. It does not put
any limit on the order, so it can exceed NR_PAGE_ORDERS. Also, when
initializing the page after KHO, we pass the order directly to
prep_compound_page() without sanity checking it. The next kernel might
not support all the orders the current one supports. Perhaps something
to fix?

> +	unsigned long failed_pfn;
> +	int err = 0;
> +
> +	if (!kho_enable)
> +		return -EOPNOTSUPP;
> +
> +	down_read(&kho_out.tree_lock);
> +	if (kho_out.fdt) {
> +		err = -EBUSY;
> +		goto unlock;
> +	}
> +
> +	for (; pfn < end_pfn;
> +	     pfn += (1 << order), order = ilog2(end_pfn - pfn)) {
> +		err = __kho_preserve(&kho_mem_track, pfn, order);
> +		if (err) {
> +			failed_pfn = pfn;
> +			break;
> +		}
> +	}
[...
> +struct folio *kho_restore_folio(phys_addr_t phys)
> +{
> +	struct page *page = pfn_to_online_page(PHYS_PFN(phys));
> +	unsigned long order = page->private;
> +
> +	if (!page)
> +		return NULL;
> +
> +	order = page->private;
> +	if (order)
> +		prep_compound_page(page, order);
> +	else
> +		kho_restore_page(page);
> +
> +	return page_folio(page);
> +}
[...]

-- 
Regards,
Pratyush Yadav
