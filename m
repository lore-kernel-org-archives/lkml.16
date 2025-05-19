Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AD6A33B
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747617765; cv=none; b=cU0nTpYbkdOCefBOP8/CeL+K0hSYsqYbo5qsnrAwv7rwWtNlAU8pKxFffZTOm6Srs6mQohckFSjaxcIr1dsz6kSu/w9efQ/OLQuKoM/UZfD+oaHh5Ns/j1UOFHfxXAfOwnZrOyOhdxXzRWlA8+JM51td798lBXWyYjpmwiygpBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747617765; c=relaxed/simple;
	bh=70atfte4HBvpEm8r94FPfNTLBAyOSY/wKAkGEJpvvr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfYyirWjCSRdWa0WrqN3Yo0RyjPoR9Y4X5gpq5gm3EDDms1DB6mVng0LTthoWwKx985c/QvYzZAV/eP8/7p2mZAPQUtd1/s+hA7ViF9Zgs/Tn9sSXoj342UYep5aFGXEt+a99PVRBBPbGFmoqIK2kdAPlWF3XV1oqSKDUqFYVpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXdUev6s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXdUev6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747617761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qk+lwn+KJ86iaLt4lDb0E4E7jAtMtcGrh+SpnKraUCI=;
	b=NXdUev6sW0lxhYzgw6uVGyJ+eoPTpIZQed2QP4Rr1q2HNtc56yCa/6qqCOy+PEiglKxxg5
	1S5AxSNcjFbCUw5MADEhE0b6kEzMjxaLjgfgYJEbWKPqHBm8PrLaG5mSxub3Dm40upnF5g
	alyAuauUdEXZUnItfdwHSN0/LWfbyFA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-136-ke4XrhnVPzWE_Hv-0JQKcA-1; Sun,
 18 May 2025 21:22:38 -0400
X-MC-Unique: ke4XrhnVPzWE_Hv-0JQKcA-1
X-Mimecast-MFC-AGG-ID: ke4XrhnVPzWE_Hv-0JQKcA_1747617757
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BEF0195608B;
	Mon, 19 May 2025 01:22:36 +0000 (UTC)
Received: from localhost (unknown [10.72.112.83])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8439D180035C;
	Mon, 19 May 2025 01:22:34 +0000 (UTC)
Date: Mon, 19 May 2025 09:22:30 +0800
From: Baoquan He <bhe@redhat.com>
To: Kees Cook <kees@kernel.org>
Cc: Coiby Xu <coxu@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
	fuqiang wang <fuqiang.wang@easystack.cn>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <aCksAsgAw1jsGBL9@MiWiFi-R3L-srv>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
 <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
 <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
 <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
 <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
 <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
 <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>
 <sn775iwfnogyvgxetbcfneuuzsnr5wva6kc4vachyzc7r6uhfi@ozhimoihtk4b>
 <aCaycGEtgNvynjNQ@MiWiFi-R3L-srv>
 <202505161616.F4C1BCCF6A@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505161616.F4C1BCCF6A@keescook>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 05/16/25 at 04:20pm, Kees Cook wrote:
> On Fri, May 16, 2025 at 11:35:12AM +0800, Baoquan He wrote:
> > On 05/11/25 at 10:19am, Coiby Xu wrote:
> > > On Fri, May 09, 2025 at 06:35:18PM -0700, Andrew Morton wrote:
> > > > On Fri, 9 May 2025 17:58:01 +0800 Baoquan He <bhe@redhat.com> wrote:
> > > > 
> > > > > > The bad commit was introduced in 2021 but only recent gcc-15 supports
> > > > > > __counted_by. That's why we don't see this UBSAN warning until this
> > > > > > year. And although this UBSAN warning is scary enough, fortunately it
> > > > > > doesn't cause a real problem.
> > > > > >
> > > > > > >
> > > > > > > Baoquan, please re-review this?
> > > > > > >
> > > > > > > A -stable backport is clearly required.  A Fixes: would be nice, but I
> > > > > > > assume this goes back a long time so it isn't worth spending a lot of
> > > > > > > time working out when this was introduced.
> > > > > >
> > > > > > So I believe the correct fix should be as follows,
> > > > > 
> > > > > Thanks for testing and investigation into these. Could you arrange this
> > > > > into formal patches based on your testing and analysis?
> > > > > 
> > > > > It would be great if you can include Fuqiang's patch since it has
> > > > > conflict with your LUKS patch. This can facilitate patch merging for
> > > > > Andrew. Thanks in advance.
> > > > 
> > > > Yes please, I'm a bit lost here.
> > > > x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch is not
> > > > presently in mm.git and I'd appreciate clarity on how to resolve the
> > > > conflicts which a new version of
> > > > x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch will produce.
> > > 
> > > I'll resolve any conflict between these patches. Before that, I'm not sure
> > > if a separate patch to fix the UBSAN warnings alone is needed to Cc
> > > stable@vger.kernel.org because 1) the UBSAN warnings don't mean there is a
> > > real problem;
> > > 2) both Fuqiang's patch and my kdump LUKS support patches fix the UBSAN
> > > warnings as a by-product.
> > > 
> > > It seems the answer largely depends on if the stable tree or longterm
> > > trees need it. Currently, only longterm tree 6.12.28 and the stable tree
> > > 6.14.6 have the UBSAN warnings if they are compiled with gcc-15 or
> > > clang-18. Any advice will be appreciated! Thanks!
> > 
> > I personally think UBSAN warning fix is not necessary for stable kernel.
> > 
> > Hi Kees, Andrew,
> > 
> > Could you help answer Coiby's question about whether we need post a
> > standalone patch to fix the UBSAN warning fix so that it can be back
> > ported to stable kernel?
> 
> I went back through the thread and the referenced threads and I can't
> find any details on the USBAN splat. Can that please get reproduced in a
> commit log? That would help understand if it's a false positive or not.


The original patch is trying to fix a potential issue in which a memory
range is split, while the sub-range split out is always on top of the
entire memory range, hence no risk.

Later, we encountered a UBSAN warning around the above memory range
splitting code several times. We found this patch can mute the warning.

Please see below UBSAN splat trace report from Coiby:
https://lore.kernel.org/all/4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at/T/#u

Later, Coiby got the root cause from investigation, please see:
https://lore.kernel.org/all/2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei/T/#u

> 
> Also, referencing the commit would be good. I assume this is discussing
> commit 15fcedd43a08 ("kexec: Annotate struct crash_mem with __counted_by")?

Right.

> 
> > In the case exposed during reviewing this patch, the code UBSAN warned
> > is not risky.
> 
> Given that this makes things work correctly with newer compilers, I
> would say it should be backported to whatever -stable kernels have the
> "counted_by" annotation. (Hence the request to add a "Fixes" line so
> that it will happen automatically.)

Got it, then Coiby can post a standalone patch to fix commit 15fcedd43a08
("kexec: Annotate struct crash_mem with __counted_by") and CC stable, then
post a new version of this patch on top.

Thanks a lot for confirming.

