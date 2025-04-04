Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com [207.171.188.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2920ADEE;
	Fri,  4 Apr 2025 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743783913; cv=none; b=QCkDyPihvWY2CFDhORfvgjqEN1PTmLrEtf6veysO4uOXzirvlOX7lcP+JNORNBYV00eJYZCYqvrQk5CbFVLiM+nTEnnbfQMDxnN4NHpsKor1pxiHDGQKxP7Xn54AGNvC3IavuwF/Q7CLiYpeLSPrghLcykdu+hQWsPbT5FgleTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743783913; c=relaxed/simple;
	bh=eF+HTA08ywMrReINY75pZwsJgSFDqgNGDi1vthS9iHo=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f82mnlw/DO1wu0QyYwCq1JMT8ZZovA6Bm8oPWqsSjKDW9uwFVZKpOml1PLBZP3oFjF6SqRt7eXrWNgRK14n9A9BtsPDtlefMl1aGBSc04gODWCwATnCprzlpAY1A1QyUifwnmlK3SSlzPaoFMT5iCv3jQYMcCKktkw8fZHV9c1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=GRrTQdV/; arc=none smtp.client-ip=207.171.188.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="GRrTQdV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1743783912; x=1775319912;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=8M1kcrllrPJGqNpSTkGjHsOAwcJ4P4JfrDK2o2gPRAw=;
  b=GRrTQdV/oqMyDHVDf2wgm4Zc24mJeZVF0GWGtisl/D6UJl/3VDLEH5qs
   BkC6KousddgRX3CetGXbI5sG5NFwKG68CK3UmP19TUp6FRHi1Tkgb2XhS
   SFagrcb/OegaDa5ILUtBw5PzFSeg0eFfIqxpZUxtBrfUe0Jc8fPTnACls
   8=;
X-IronPort-AV: E=Sophos;i="6.15,188,1739836800"; 
   d="scan'208";a="7655191"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9105.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 16:25:05 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:19358]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.57:2525] with esmtp (Farcaster)
 id 41e9b48e-af72-465f-a631-5054d723289f; Fri, 4 Apr 2025 16:25:04 +0000 (UTC)
X-Farcaster-Flow-ID: 41e9b48e-af72-465f-a631-5054d723289f
Received: from EX19D020UWA001.ant.amazon.com (10.13.138.249) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 4 Apr 2025 16:24:56 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D020UWA001.ant.amazon.com (10.13.138.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 4 Apr 2025 16:24:55 +0000
Received: from email-imr-corp-prod-iad-all-1a-059220b4.us-east-1.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 16:24:55 +0000
Received: from dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com [172.19.91.144])
	by email-imr-corp-prod-iad-all-1a-059220b4.us-east-1.amazon.com (Postfix) with ESMTP id EBBDF42F0D;
	Fri,  4 Apr 2025 16:24:54 +0000 (UTC)
Received: by dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id A83976148; Fri,  4 Apr 2025 16:24:54 +0000 (UTC)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Mike Rapoport <rppt@kernel.org>, Changyuan Lyu <changyuanl@google.com>,
	<linux-kernel@vger.kernel.org>, <graf@amazon.com>,
	<akpm@linux-foundation.org>, <luto@kernel.org>, <anthony.yznaga@oracle.com>,
	<arnd@arndb.de>, <ashish.kalra@amd.com>, <benh@kernel.crashing.org>,
	<bp@alien8.de>, <catalin.marinas@arm.com>, <dave.hansen@linux.intel.com>,
	<dwmw2@infradead.org>, <ebiederm@xmission.com>, <mingo@redhat.com>,
	<jgowans@amazon.com>, <corbet@lwn.net>, <krzk@kernel.org>,
	<mark.rutland@arm.com>, <pbonzini@redhat.com>, <pasha.tatashin@soleen.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <robh+dt@kernel.org>,
	<robh@kernel.org>, <saravanak@google.com>,
	<skinsburskii@linux.microsoft.com>, <rostedt@goodmis.org>,
	<tglx@linutronix.de>, <thomas.lendacky@amd.com>, <usama.arif@bytedance.com>,
	<will@kernel.org>, <devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
In-Reply-To: <20250404143031.GB1336818@nvidia.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
	<20250320015551.2157511-10-changyuanl@google.com>
	<mafs05xjmqsqc.fsf@amazon.de> <20250403114209.GE342109@nvidia.com>
	<Z-6UA3C1TPeH_kGL@kernel.org> <20250403142438.GF342109@nvidia.com>
	<Z--sUYCvP3Q8nT8e@kernel.org> <20250404124729.GH342109@nvidia.com>
	<Z-_kSXrHWU5Bf3sV@kernel.org> <20250404143031.GB1336818@nvidia.com>
Date: Fri, 4 Apr 2025 16:24:54 +0000
Message-ID: <mafs08qofq4h5.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 04 2025, Jason Gunthorpe wrote:

> On Fri, Apr 04, 2025 at 04:53:13PM +0300, Mike Rapoport wrote:
[...]
>> Most drivers do not use folios
>
> Yes they do, either through kmalloc or through alloc_page/etc. "folio"
> here is just some generic word meaning memory from the buddy allocator.
>
> The big question on my mind is if we need a way to preserve slab
> objects as well..

Only if the objects in the slab cache are of a format that doesn't
change, and I am not sure if that is the case anywhere. Maybe a driver
written with KHO in mind would find it useful, but that's way down the
line.

>
>> and for preserving memfd* and hugetlb we'd need to have some dance
>> around that memory anyway.
>
> memfd is all folios - what do you mean?
>
> hugetlb is moving toward folios.. eg guestmemfd is supposed to be
> taking the hugetlb special stuff and turning it into folios.
>
>> So I think kho_preserve_folio() would be a part of the fdbox or
>> whatever that functionality will be called.
>
> It is part of KHO. Preserving the folios has to be sequenced with
> starting the buddy allocator, and that is KHO's entire responsibility.
>
> I could see something like preserving slab being in a different layer,
> built on preserving folios.

Agree with both points.

[...]
>> As for the optimizations of memblock reserve path, currently it what hurts
>> the most in my and Pratyush experiments. They are not very representative,
>> but still, preserving lots of pages/folios spread all over would have it's
>> toll on the mm initialization.
>
>> And I don't think invasive changes to how
>> buddy and memory map initialization are the best way to move forward and
>> optimize that.
>
> I'm pretty sure this is going to be the best performance path, but I
> have no idea how invasive it would be to the buddy alloactor to make
> it work.

I don't imagine it would be that invasive TBH. memblock_free_pages()
already checks for kmsan_memblock_free_pages() or
early_page_initialised(), it can also check for kho_page() just as
easily.

>
>> Quite possibly we'd want to be able to minimize amount of *ranges*
>> that we preserve.
>
> I'm not sure, that seems backwards to me, we really don't want to have
> KHO mem zones! So I think optimizing for, and thinking about ranges
> doesn't make sense.
>
> The big ranges will arise naturally beacuse things like hugetlb
> reservations should all be contiguous and the resulting folios should
> all be allocated for the VM and also all be contigous. So vast, vast
> amounts of memory will be high order and contiguous.

Yes, and those can work quite well with table + bitmaps too.

[...]

-- 
Regards,
Pratyush Yadav
