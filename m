Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21642FEE1E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265458; cv=none; b=fenxCi1o84EH0AekfJ8EZir4Xpe09zzfH97yh+QeQhShyIb2jcj8GxkE4wZnnyR7YPEb3CN13keGTx9YCpSwi4GQdNY7co0nYVeQ8yiRPrmzSbsbHf5IPTwImsKmYWWI2NnZ20VLDlZ5C3aMjHSwz/04sNpwCze8joSHDRmi+a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265458; c=relaxed/simple;
	bh=AGjxQLLZ51lsyG9UJkIXZW70rGMweAmu+h8b725a/2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crthrhoi9gJZjFY6Gin/iG70KgFuo5dNOZVESyKYX6mE6AUdWsN9YikVEwUxrdT098qfN+VhdERz1FolHMQqvfUcYmdLKaRQs2DzDT7Mb54lDK8txOcLGGbVeSXBknLHJvWRP5CrYz1ktJnc7dghScZPnS5ljH3EKmom3BsUJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccC9dfvR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccC9dfvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E70CC4CEE7;
	Wed, 18 Jun 2025 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750265458;
	bh=AGjxQLLZ51lsyG9UJkIXZW70rGMweAmu+h8b725a/2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccC9dfvRgMR5VhC8Vi7ZnKgP99rAi1QnYKpJYUJ1/X0piDuDhgFbCEtAXhH8gowLX
	 8N4VtBGD05e2ORIFn9FdvXITzjYkQFmVicEsnDH+Y13VZXPGmmQEMq6QHOfBlD7aww
	 uJ5516zSiAm0z81hx1BFF03nPhpC9BpdNXMzX1b8gfNyTLCh/xCUs0gkLCwgiMv+F1
	 8p6BQnCmX1n/+hUY/gtakqkeRNhnGORf6NbrNru2x2n64QMgTW9AoJv9FH2bsE0T5L
	 A4u7CuT8GLEzx3tr2Wn/RvssUktIymmqulyj3vpS5Ds+VN/X1B3q67d3LHx9sQ6t48
	 S3eFk+0mT6+Iw==
Date: Wed, 18 Jun 2025 19:50:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add further init files to mm init block
Message-ID: <aFLubPfiO5hqfhCe@kernel.org>
References: <20250617174538.188977-1-lorenzo.stoakes@oracle.com>
 <20250617161800.84fe3274a9ed3c9049dde2ab@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617161800.84fe3274a9ed3c9049dde2ab@linux-foundation.org>

On Tue, Jun 17, 2025 at 04:18:00PM -0700, Andrew Morton wrote:
> On Tue, 17 Jun 2025 18:45:38 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> 
> > These files comprise the bootmem info logic which is initialised on startup
> > and also memory tests that are run on startup and as such this seems the
> > most appropriate section for them.
> > 
> > ...
> >
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15679,8 +15679,11 @@ S:	Maintained
> >  F:	Documentation/core-api/boot-time-mm.rst
> >  F:	Documentation/core-api/kho/bindings/memblock/*
> >  F:	include/linux/memblock.h
> > +F:	mm/bootmem_info.c
> >  F:	mm/memblock.c
> > +F:	mm/memtest.c
> >  F:	mm/mm_init.c
> > +F:	mm/rodata_test.c
> >  F:	tools/testing/memblock/
> >  
> 
> Doesn't this want T: entries for 
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git#fixes
> git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git#for-next

A long overdue indeed:

From 4d0b56ca0bbfe161c07e284163582180d4dfb749 Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 18 Jun 2025 19:47:52 +0300
Subject: [PATCH] MAINTAINERS: add tree entry to mm init block

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cba00609855b..b1e6f242b972 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15678,6 +15678,8 @@ MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
 F:	Documentation/core-api/boot-time-mm.rst
 F:	Documentation/core-api/kho/bindings/memblock/*
 F:	include/linux/memblock.h

base-commit: 75856c59ae536a369ac79c1b8f5f5c002a9f5c70
-- 
2.47.2

 

-- 
Sincerely yours,
Mike.
