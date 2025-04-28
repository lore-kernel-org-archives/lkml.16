Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A45CA55
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.184.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831643; cv=none; b=Ea7Duf1VYfLj8ZlwhWmkzJaTjBwGJNSzulwAXKh/8EguGsTDnbJNL3EZRHMax7gB6qX+CZTg7O4YzRDZHMPSTNXhDwoRae7BGk0kaY0t883j2hncerDoIEpsZH0orhgDKz5AbW18+InuP2japYNqKEGShjrL4fWmhyWjg53IkfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831643; c=relaxed/simple;
	bh=lpLR6PF/omX9CepkaRhE8mIQpFXnZBa6VvnVfSjfzss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDf3gF3++A1OUGTgACQCUx7OHTwt/LB+i6UuqmUC991V4A3AJr/Ys95NHURTwBrQP6Y4DXSbsH8Y3r7d3FRp4u+hSw+xHbe+HPmwFNkP0W6TPWpUnrC7Kn4ztiq2aaOdEwfUxkQoKSz7yoGSYbUlAZx3q74GHa1lDNdAZIlvZkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=TNcF9spK; arc=none smtp.client-ip=207.171.184.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="TNcF9spK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1745831642; x=1777367642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pyYUZlU0kPDTIR6PqpPn1Y1eN8DjEsEk5RarAm93ECk=;
  b=TNcF9spKnXXd0j5P2oEyIOrS4si6saQDombFzA0dqWilOj0Bk5qAvHBB
   psDMYB6NIEfhgI4QbuJYMF/afQBMmKiGNHTUwiFKKiTW5Cjetv+RFhq04
   T33yY7Ed+Kvo9nOGm+PuFPIw3MlBYv79ruQFp2sjeuNDKXZkIu6B0uHDZ
   o=;
X-IronPort-AV: E=Sophos;i="6.15,245,1739836800"; 
   d="scan'208";a="515189629"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:13:56 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.17.79:10646]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.41.40:2525] with esmtp (Farcaster)
 id 0a8945ba-130b-4357-89ef-013a5d46b884; Mon, 28 Apr 2025 09:13:54 +0000 (UTC)
X-Farcaster-Flow-ID: 0a8945ba-130b-4357-89ef-013a5d46b884
Received: from EX19D014EUC004.ant.amazon.com (10.252.51.182) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 28 Apr 2025 09:13:52 +0000
Received: from dev-dsk-bercantu-1c-725598d7.eu-west-1.amazon.com
 (10.253.100.253) by EX19D014EUC004.ant.amazon.com (10.252.51.182) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Mon, 28 Apr 2025
 09:13:49 +0000
From: "Bernardo C. Gutierrez Cantu" <bercantu@amazon.de>
To: <akpm@linux-foundation.org>
CC: <bercantu@amazon.de>, <dwmw2@infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <lkp@intel.com>,
	<rppt@kernel.org>, <yajun.deng@linux.dev>
Subject: Re: [PATCH] mm: memblock: Fix arguments passed to memblock_set_node()
Date: Mon, 28 Apr 2025 09:13:33 +0000
Message-ID: <20250428091333.35120-1-bercantu@amazon.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250425180539.2b780a8b3d0958fcc2e8a500@linux-foundation.org>
References: <20250425180539.2b780a8b3d0958fcc2e8a500@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D039UWB004.ant.amazon.com (10.13.138.57) To
 EX19D014EUC004.ant.amazon.com (10.252.51.182)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 26 Apr 2025 03:05:39 +0200 Andrew Morton <akpm@linux-foundation.org> wrote:
> On Fri, 25 Apr 2025 10:20:03 +0000 "Bernardo C. Gutierrez Cantu" <bercantu@amazon.de> wrote:
> 
> > memblock_set_node() receives a `base` and a `size` arguments, but we are
> > passing the `start` and `end` of the memory regions when iterating over
> > them in memmap_init_reserved_pages() to set their node ids.
> > 
> > This results in the function setting the node ids for the reserved memory
> > regions in `[base, base + base + size)` instead of `[base, base + size)`.
> > 
> > Pass `start` and `size`, so that we iterate over the correct range.
> > 
> > Fixes: 61167ad5fecd ("mm: pass nid to reserve_bootmem_region()")
> > 
> > ...
> >
> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -2196,7 +2196,7 @@ static void __init memmap_init_reserved_pages(void)
> >  		if (memblock_is_nomap(region))
> >  			reserve_bootmem_region(start, end, nid);
> >  
> > -		memblock_set_node(start, end, &memblock.reserved, nid);
> > +		memblock_set_node(start, region->size, &memblock.reserved, nid);
> >  	}
> >  
> >  	/*
> 
> What were the runtime effects of this bug?

I found the bug via code introspection while trying to learn how the boot time
memory allocation of Linux worked. I was not actively pursuing to fix a runtime
issue that I could then prove was fixed by this.

But I see that in most cases this bug should be mostly benign (which could
explain why it was not caught before). In kernels compiled with CONFIG_NUMA, the
memblock_set_node() function would iterate over more memblock regions and
potentially set incorrect node ids, which would then be overwritten with the
correct node ids once the caller function memmap_init_reserved_pages() iterates
over the next regions. So the resultant node ids after initialization should
still be correct.

It could still impact the length of the mm init process on kernel boot, but I
did not measure the improvement, as it is highly dependent on the memory
configuration system, and in my specific system under test, it was neglible.



Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

