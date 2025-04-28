Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790FF1F462C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834010; cv=none; b=EQWGm7HfYmZcobcOKXVHmXATHv78/3Wq2N9wQREak/PSFRQt6nZ31bWm6Y0U9B6ErZdhSoom/QSOz0GUKgUvhWdmiPHD/H935kAxsgsmYN17AvZViDxspM2ZvvSqpx24p0EXzXCcmATJmhckOm/fgvL4FVTWUuGvg0ssNy30VuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834010; c=relaxed/simple;
	bh=AjyB/sbxVDWriPqsJPvQovSOAwFVq9YRBy0W4A17yro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByiBLN58it97KW00RLEm1kanhw/DvouvWLXMOJ/2QUkNSAWEGhcY2l/1Euj6gN2ecmLba4Dq+1JByK4aOxvGPx+7wXib+07yLHOQ/jm1w7IW2fkcUxXbU7186vUOm7mCzrOKAWF18iX261AoawYokxp0RK28nDJ3BX4byZJ4fwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=a6o18NKf; arc=none smtp.client-ip=52.119.213.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="a6o18NKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1745834005; x=1777370005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CJ9V2Ue301c3Mhn7ZN2+hlhZ2/bUKJOp0yfrB5IvETA=;
  b=a6o18NKfDabhTyeQAnxM5BgBPMYcmihT0KsyJMvekFcDitUIs+z4t+Np
   MGjShqoxr5VSGnXbe8N8LFtOwhbxwqz2usOGbiMVnNae2irt6K08kgJbv
   FIZYO/czLfv14V+X7ajotcCeeXQKrGhHOfJpLC/JhrtgmxbmL2KMzHuvH
   I=;
X-IronPort-AV: E=Sophos;i="6.15,246,1739836800"; 
   d="scan'208";a="292234928"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:53:23 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.17.79:18526]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.19.253:2525] with esmtp (Farcaster)
 id cbd36dde-692d-4f89-b0f0-b1dd114db2cd; Mon, 28 Apr 2025 09:53:22 +0000 (UTC)
X-Farcaster-Flow-ID: cbd36dde-692d-4f89-b0f0-b1dd114db2cd
Received: from EX19D014EUC004.ant.amazon.com (10.252.51.182) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 28 Apr 2025 09:53:21 +0000
Received: from dev-dsk-bercantu-1c-725598d7.eu-west-1.amazon.com
 (10.253.100.253) by EX19D014EUC004.ant.amazon.com (10.252.51.182) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Mon, 28 Apr 2025
 09:53:18 +0000
From: "Bernardo C. Gutierrez Cantu" <bercantu@amazon.de>
To: <rppt@kernel.org>
CC: <akpm@linux-foundation.org>, <bercantu@amazon.de>, <dwmw2@infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <lkp@intel.com>,
	<yajun.deng@linux.dev>
Subject: Re: [PATCH] mm: memblock: Fix arguments passed to memblock_set_node()
Date: Mon, 28 Apr 2025 09:53:10 +0000
Message-ID: <20250428095310.68227-1-bercantu@amazon.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aAyXzywgqH2qFRKn@kernel.org>
References: <aAyXzywgqH2qFRKn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
 EX19D014EUC004.ant.amazon.com (10.252.51.182)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 26, 2025 at 10:22:39AM +0200, Mike Rapoport wrote:
> Hi Bernardo,
> 
> On Fri, Apr 25, 2025 at 10:20:03AM +0000, Bernardo C. Gutierrez Cantu wrote:
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
> > Signed-off-by: Bernardo C. Gutierrez Cantu <bercantu@amazon.de>
> 
> There's already a fix in memblock tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git/commit/?h=for-next&id=06eaa824fd239edd1eab2754f29b2d03da313003
> 
> Will send PR to Linus soon.
>
Hi Mike

Oh ok, I see. Thank you, that patch should fix the issue.

Will it also be backported to LTS kernels affected by the bug, which was
introduced in v6.5?

> > ---
> >  mm/memblock.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/mm/memblock.c b/mm/memblock.c
> > index 0a53db4d9f7b..9639f04b4fdf 100644
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
> > -- 
> > 2.47.1
> 
> -- 
> Sincerely yours,
> Mike.

Best regards
Bernardo



Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

