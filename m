Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E85230D0F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746811909; cv=none; b=sLYsF0T4REhhSt3edZW450Wpsz1yQw1SsH814xfLVdPrJOeqEjrcACboasRzPq19f4eIwNAFZPWf0HMroTFzv8PWfa5oml/fKDXBDznpnp/xdN3VoEYPvm0VFyNzqUUFyzuDt++rPAN38AEf/3fdy4FGYRlf3+GEIj/T5iuFk68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746811909; c=relaxed/simple;
	bh=+Y6SEUiPeBpC2NUQ2aPdXqflB3XoucQAgGACd87ryyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixdgGaLwLM1wOBxqY/bE7A1vhbxDykd6IoTFzHgj/Tgj6hZYHoLU12tRIcHdaudGj/Gu0gP045+s3ZuXb701MJ9r1JWfHhjWkVZkp63jEFukSjozUDs5bedUKiAVq0S3RIB7p0RqwMcrvq5dc5Mw0sASmzwZzotb4gD7217qB2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rabHm6eT; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rabHm6eT"
Date: Fri, 9 May 2025 13:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746811903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZHus4BQXuwMWJ5xzAyDa3Z0SeYkhpUCnYMt4IUvQ5k=;
	b=rabHm6eTWxgqYNuifQ8m1qcfblvIC+fA6umtoTaa7tfGljpcFIGcrlNisd+23gOyESRDIr
	oICo65KRMY9pjak5pGGt0ChcUySo7yBVPy1TjbBvkXkT6OkqAHsf1JAsoQ23TpbwZXHorR
	fCYLVfjiEb+ykypQAif79gm74zYvRtg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: David Wang <00107082@163.com>, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [BUG?]Data key in /proc/allocinfo is a multiset
Message-ID: <tmz2vkytqr27djdkcntshba2efdyjilxzx2cwmugy2fxapzvio@3olyd6gu333p>
References: <20250509061013.922944-1-00107082@163.com>
 <CAJuCfpH4eiSgZqdMTCUOU2VfYezZuLoJefc0wuOWor9eeNzNTA@mail.gmail.com>
 <152dd526.b05a.196b5e7b738.Coremail.00107082@163.com>
 <CAJuCfpHi1nAQ5FbPECE12j2-m7ndYQ739rY=RuNCB6AxeJM=3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHi1nAQ5FbPECE12j2-m7ndYQ739rY=RuNCB6AxeJM=3w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, May 09, 2025 at 09:57:27AM -0700, Suren Baghdasaryan wrote:
> On Fri, May 9, 2025 at 9:36 AM David Wang <00107082@163.com> wrote:
> >
> >
> > At 2025-05-09 23:56:32, "Suren Baghdasaryan" <surenb@google.com> wrote:
> > >On Thu, May 8, 2025 at 11:10 PM David Wang <00107082@163.com> wrote:
> > >>
> > >> Just start a new thread for this[1].
> > >> There are duplications in /proc/allocinfo where same [file:line]
> > >> shows up several times:
> > >>
> > >> =======================
> > >>            0        0 ./include/crypto/kpp.h:185 func:kpp_request_alloc
> > >>            0        0 ./include/crypto/kpp.h:185 func:kpp_request_alloc
> > >> =======================
> > >>            0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_options
> > >>            0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_options
> > >> =======================
> > >>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_alloc_pages_node
> > >>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_alloc_pages_node
> > >>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_alloc_pages_node
> > >> =======================
> > >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node
> > >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node
> > >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node
> > >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node
> > >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_alloc_pages_node
> > >
> > >Yep, that happens when an inlined function allocates memory. It ends
> > >up inlined in different locations. Usually that's done by allocation
> > >helper functions.
> > >To fix this we need to wrap these allocator helpers with alloc_hooks:
> > >
> > >-static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
> > >+static inline void *iommu_alloc_pages_node_noprof(int nid, gfp_t gfp,
> > >int order)
> > >{
> > >-        struct page *page = alloc_pages_node(nid, gfp | __GFP_ZERO,
> > >order);  struct skcipher_request *req;
> > >+        struct page *page = alloc_pages_node_noprof(nid, gfp |
> > >__GFP_ZERO, order);  struct skcipher_request *req;
> > >...
> > >}
> > >+#define iommu_alloc_pages_node(...)
> > >alloc_hooks(iommu_alloc_pages_node_noprof(__VA_ARGS__))
> > >
> > >See 2c321f3f70bc "mm: change inlined allocation helpers to account at
> > >the call site" for examples of how this was done before.
> > >Thanks,
> > >Suren.
> >
> > Thanks for clarifying this, seems like a never-ending work...... >_<|||
> 
> Like anything else in the kernel :)

Yeah, I generally end up doing these fixups here and there whenever I'm
staring at allocation profiling output - we should probably document the
process for that, and there's some nifty tricks you can do.

e.g. if you've got "container" data structure, like rhashtable, you
don't want allocations accounted to the rhashtable code itself - you
really want to know which rhashtable it was for.

So, you can create an alloc tag for the rhashtable_init() call (wrap it
in alloc_hooks), and then stash a pointer to that alloc tag in 'struct
rhashtable', and use that for all the rhashtable internal allocations.
