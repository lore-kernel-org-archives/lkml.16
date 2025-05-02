Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CAB1B5EB5
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166764; cv=none; b=kZd567ua3f0sMbiwOWMSUbXczUCJG/G4RGdCBFH07CaYX2Cm4Pd0kM27J+Ph9KPnoXG3qNI9yUBpTzeD/+HqyP/DcZzogjuCEw0g/ZhkEvbxwnwqS3CzoIbbnwSHbB4gn57Nma0CwKW+ifeDkEUQN6YdjHIg6JNg58ZtyH5GgME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166764; c=relaxed/simple;
	bh=ole3Q/FohH8bDCW2nW/DGxLQ7bdLWQd0eDbS5gxOUiQ=;
	h=Date:Message-ID:To:Cc:Subject:In-Reply-To:From; b=fAi5sFb0+KFvexQWKMeDRWlY79BXQR0wL3mGDxtTPIQcv6ugi78d83+6ud5oVnxxvKH3YpWmA6WmKv4gFc9mye41e22G7E+EN+AQjIq2q51PwNibyUVMsc3KipMUTYHUJLOo4NNjuLdsfMiOb4I+edbqkABHi+gWj5+SwvRHKCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nslick.com; spf=pass smtp.mailfrom=nslick.com; dkim=pass (2048-bit key) header.d=nslick.com header.i=@nslick.com header.b=mnAZFOxd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KByhPSm/; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nslick.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nslick.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nslick.com header.i=@nslick.com header.b="mnAZFOxd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KByhPSm/"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A02C21140273;
	Fri,  2 May 2025 02:19:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 02 May 2025 02:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nslick.com; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:reply-to:subject:subject:to:to; s=fm1; t=1746166760;
	 x=1746253160; bh=V0O3TjEFzX0T6A4UXVUfxMH3H4KffmMjUGilk6wg12o=; b=
	mnAZFOxdlN/Hg1KypivbnyD9rvR2S3oT6jX7onRlp6i+cU95gS4DdlY+pUgl944k
	7ClHEDoapsomBccw1rwlQ/5Lvx3GT74QDhlg0Y4JElnZhLoEKUFYHcpqqtfjBSm1
	AQ8l9yHx6HdxJb4OemDbWFno8Nj2vcp2BkKZ+ZL2h2yWbdQIuznSSx+9i91niL+s
	1WdKw1CHIIQtP/GiGS2ANmU/qwJOLOR1Whmeg6lUgjQ8fTsz4rSWdqaEU6jVX+pc
	yVb9McYi7nNQVpkMJpWfL7K6XgaHIiWCGl1tPEMR15xJ2bvx/IBIGKbCUGtoOVEy
	w0RcZw2kSAdwXW5W2nJggg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746166760; x=1746253160; bh=V
	0O3TjEFzX0T6A4UXVUfxMH3H4KffmMjUGilk6wg12o=; b=KByhPSm/CaC9HdTKL
	kyHoTG+PKaepiAHyoe9wC0pKPKT4PuVzVudHClwl9LCN3hlG/fDIcXlCnLxGO8nQ
	pt7synclrO4V2fOD7d1uoIrN9velMmA+cbqDEAlBCVPq5YW+xnniODte9lcm24zr
	UTEDiCuX+ozHkpbrxvX2cetFyFcyWQExerKSiqVQ4tEEjKclF95O2GT4S+xkVum1
	LmaJD3U10Z6G3fk4srrdK20G6guiMsC5dpb7z4x7Lq0sADujreTNYDPuE3Oo8cK0
	DeF/8vkK7J4kEZ12do/ZqlJ7Mws5VmPLCyBChFNcdPbr2AO1mfFd+11owEp9z47A
	77UzA==
X-ME-Sender: <xms:52MUaCoUO0GxA8esXh0RKmEOujYM76pgRvAbvIkAahW5aeJ5evzgag>
    <xme:52MUaApu8yRAABv0cg8u0qBLdQHDc0wveOpIKA63DS2cwn_KslMM3BWC9JzafgDny
    5msDKqTQyWlKxsNM04>
X-ME-Received: <xmr:52MUaHMuG4V6vZdCsSLgFjOgtLKSMXxWyOdvIcADY_DAHYV2cFHKov8cqgIiCRMZmBxrockn9Aslnx3I7I87dc_RWkcdWHerJSfUOGpx4PvJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedujeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffkf
    fvvefujgfhsedttdhjtddttddtnecuhfhrohhmpefpihgthhholhgrshcuufhivghlihgt
    khhiuceoohhpvghnshhouhhrtggvsehnshhlihgtkhdrtghomheqnecuggftrfgrthhtvg
    hrnhepudduhfeggeegfeeiudekgeevheevvdejveefjeefffeffeejleduveejveffudek
    necuffhomhgrihhnpehinhhtvghlrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepohhpvghnshhouhhrtggvsehnshhlihgtkhdrtgho
    mhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hhvghrthhonhesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprghokhhulhhirghrsehr
    vgguhhgrthdrtghomhdprhgtphhtthhopegrthhomhgrshhovhesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepuggrvhgvrdhh
    rghnshgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhphgrseiihi
    htohhrrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepmhhjghhuiihikhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:52MUaB6FNen9Uw1RuWSZpyQiOLzpEGud1H2tNgUgFpd-k4GCPO4C1A>
    <xmx:52MUaB5mTlny-NG6Zp_n_nG22y5fyWYPily9zO-P3zQGUvBo1aNefg>
    <xmx:52MUaBgLrx5E12awWopflQGNuBiaXcbij6Im1Qx--1F_WqtdcoDAyA>
    <xmx:52MUaL7aPNFqiM7ZaNsr7lKN4RQ9HCRswfV3HRI9tM4NoTe5vVcTkA>
    <xmx:6GMUaGthLc2Cnkye37J7NEnOuD0b1iAGgCq-E0BDre49s_TxfjdL-82T>
Feedback-ID: i78f146c6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 May 2025 02:19:18 -0400 (EDT)
Date: Fri, 02 May 2025 01:19:17 -0500
Message-ID: <992edb0fed403333d237350b0a6730f2@dogleg.nslick.com>
To: herton@redhat.com
Cc: aokuliar@redhat.com,atomasov@redhat.com,bp@alien8.de,dave.hansen@linux.intel.com,hpa@zytor.com,linux-kernel@vger.kernel.org,mingo@redhat.com,mjguzik@gmail.com,olichtne@redhat.com,tglx@linutronix.de,torvalds@linux-foundation.org,x86@kernel.org
Subject: Re: [PATCH] x86: write aligned to 8 bytes in copy_user_generic (when without FSRM/ERMS)
In-Reply-To: <20250320142213.2623518-1-herton@redhat.com>
From: Nicholas Sielicki <opensource@nslick.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, Mar 20, 2025 at 3:22 PM Herton R. Krzesinski <herton@redhat.com> wrote:
> History of the performance regression:
> ======================================
> 
> Since the following series of user copy updates were merged upstream
> ~2 years ago via:
> 
>   a5624566431d ("Merge branch 'x86-rep-insns': x86 user copy clarifications")
> 
> .. copy_user_generic() on x86_64 stopped doing alignment of the
> writes to the destination to a 8 byte boundary for the non FSRM case.
> 
> Previously, this was done through the ALIGN_DESTINATION macro that
> was used in the now removed copy_user_generic_unrolled function.
> 
> Turns out this change causes some loss of performance/throughput on
> some use cases and specific CPU/platforms without FSRM and ERMS.
> 
> Lately I got two reports of performance/throughput issues after a
> RHEL 9 kernel pulled the same upstream series with updates to user
> copy functions. Both reports consisted of running specific
> networking/TCP related testing using iperf3.
> 
> Partial upstream fix
> ====================
> 
> The first report was related to a Linux Bridge testing using VMs on a
> specific machine with an AMD CPU (EPYC 7402), and after a brief
> investigation it turned out that the later change via:
> 
>   ca96b162bfd2 ("x86: bring back rep movsq for user access on CPUs without ERMS")
> 
> ... helped/fixed the performance issue.
> 
> However, after the later commit/fix was applied, then I got another
> regression reported in a multistream TCP test on a 100Gbit mlx5 nic, also
> running on an AMD based platform (AMD EPYC 7302 CPU), again that was using
> iperf3 to run the test. That regression was after applying the later
> fix/commit, but only this didn't help in telling the whole history.

I went down the rabbit-hole of this issue in late 2022 at $work, which
we found from running the same iperf3 single-flow workload being
described above on a Milan system. It took me some time (much longer
than I'd like to admit), but eventually I started asking questions about
FSRM and ERMS, and stumbled across the lkml threads surrounding the
+FSRM/-ERMS alternative.

Before arriving at that root cause, I had noticed that tx-nocache-copy /
NETIF_F_NOCACHE_COPY was able to considerably improve perf compared to
baseline. Is that interesting to anyone?

I did a bit of research on the history of tx-nocache-copy, and how it
might relate to znver3, and walked away believing the following story to
be mostly true:

1. tx-nocache-copy was introduced in 2011 and was initially enabled by
default on all non-loopback interfaces. It was tested on an AMD
bulldozer-like system, it showed a significant improvement in tail
latency and a 5%-10% improvement in transactions per second.

2. A year later, for products released in year 2012, intel introduced
something called DDIO. My entire understanding of DDIO comes from a
single PDF [1], so take this with a massive grain of salt, but from what
I understand it was intended to largely solve the same problem that
tx-nocache-copy was optimizing for, and I think it did so in a way that
broke many of the underlying assumptions that tx-nocache-copy was
relying on.

In other words, it didn't just make tx-nocache-copy unnecessary, but
made its usage actively harmful. For two reasons:

+ DDIO operates atop dedicated cache ways. So if that reserved cache
  space is not used, it doesn't result in any less cache contention for
  other uses, it just means wasting that cache space. Remote reads from
  the NIC of data held in cache stopped resulting in a write-back to main
  memory from the cache, which you might otherwise expect to occur under
  most coherency protocols; their state machine grew a carve-out for this
  specific flow.

  So if your motivation for issuing a non-temporal write is any of:

   a) to avoid your write from evicting other useful data from the cache
   b) to avoid coherency traffic triggered by the remote read.
   c) you anticipate a significant amount of time and/or cache churn to
      occur between now and when the remote read takes place, and you feel
      it's reasonable to suspect that the data will have been evicted from
      cache into main memory by then, anyway.

  all of them make less sense on a system with ddio.

+ Because reads by the NIC are expected to usually be directly serviced
  from cache, Intel also stopped issuing speculative reads against main
  memory as early as they otherwise could, under the assumption that it
  would be especially rare for it to be used.

  This means that on systems with DDIO, if you elect to use the non-temporal
  hints, those remote reads become extra slow, because they are
  serialized with the read attempt against the cache.

Putting these two together, tx-nocache-copy stopped making sense, and
the best thing the kernel could do, was to play dumb.

3. By 2017, after many complaints, and in a world where almost everyone
in the high-performance networking/server space was using an intel
platform with DDIO, tx-nocache-copy was moved to be disabled by default.

I didn't see DDIO mentioned in any of the on-list discussions of
tx-nocache-copy that I could find, and it lead me to wonder if this is
real story behind tx-nocache-copy: a reasonable feature, introduced with
unlucky timing, which ultimately fell victim to a hardware monoculture
without anyone fully realizing it.

If that story is true, then it might suggest that tx-nocache-copy still
has merit under the current zen systems (which have nothing similar to
DDIO, as far as I'm aware). At least in late 2022, under the original
unpatched kernels that were available at the time, I can report that it
did. I no longer work at $work, so I have no ability to retest myself,
but I'd be curious to hear the results from anyone that finds this
interesting enough to look into it. 

[1]: https://www.intel.com/content/dam/www/public/us/en/documents/technology-briefs/data-direct-i-o-technology-brief.pdf
The relevant section for tx-nocache-copy is "2.2".
