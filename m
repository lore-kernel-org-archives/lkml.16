Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CB284D34
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745530161; cv=none; b=E7rBY/7r+/6fBDbt7D8xDH2//6dOuDDDWApo8rXB5rJr4S15IGYXR+0WMCHXDFZYzrpbGbrCNwB/CfoSwhmlsNTNwI8oQsXsh38v63OJBQQ6rqwTnVGYeLgg3ZUNtrNMJIL/Ck1Xhc4yYSY1JAfUG2poCn8vAgtJ6MPbyCdIi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745530161; c=relaxed/simple;
	bh=BhzExbpzrPKUgy42EN4sE/Wv9CXou3EJXKPwtr5ATKc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uOPP0G6GL2F0XMJ/HNPmKAXSEaHRvIT0KK1IvkDFPILY2t6F7vJMuyEah+w4OpTo8R+DW9jSRt6gAn5VsZiwIku8FgNKIkFjCkvNLY4TlCNVfo9HKm9tMUNRUA3Pupsicci/vwljN9ZUgecjvNIuZZLitxubVLLiRyQX0qdungQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=vA/lrhLb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CJQ8/njO; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="vA/lrhLb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CJQ8/njO"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 6CD0F138021E;
	Thu, 24 Apr 2025 17:29:18 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 24 Apr 2025 17:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745530158;
	 x=1745616558; bh=BhzExbpzrPKUgy42EN4sE/Wv9CXou3EJXKPwtr5ATKc=; b=
	vA/lrhLbSY2yike30giGfEHTyIcxT79wmqLDSJSO+5dXnsk2HKoUb050OGiAljJE
	ZdlN0YrQgi4FVvZ9ueBJ0Fx7A6wARcHa62VtYOB6Ya93e0T0HeWPyxkyDSipMbiC
	lZeVyGUT62n25vvEptAWAx0J5VVe0te2WvgNhB53BZGnmEgGyz0R7CGpy6I9cMXB
	cS2EGKqFAKl+X39nkpvxtWr3uyuNewZINwY1s+o/1+qVGwZd8mKFKQe+oT5Jeuwq
	9eCQj+fzQ1XA6jWv70zkTeKK49ouv1Lg9RyTxn4Ef90ObiYuslMtepdmnsYJfb+q
	R27J1IeQaGOVJD94WkmFjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745530158; x=
	1745616558; bh=BhzExbpzrPKUgy42EN4sE/Wv9CXou3EJXKPwtr5ATKc=; b=C
	JQ8/njOExgWzV13TqOlOonOZicNX2mVN3yoA+lagJXkH2LI29EWhfICdJchkpGVT
	dIKpp3Np2b1eaP6LU0xIc4MHAlP0EtHJSnnZljnR5szbtdI0kB2b9x95V7anc74B
	7Yw3W6HaA1k3MVzpWEtKyk5LKIAx5eEpDjHghenN920SunV4IYAEj0S4UWtx9b/P
	xUBnEnZEpHOkSoff2i+rCsTKDRPcszpOw01jfLQ1UvIqasf53zxi6TbbWyH1emPN
	WdZqZ8mdXHDUaS81rILC2sATxL2klk7/3M57Y1DGpEs+opcrqXM+rG1gnFhvqwLZ
	ahPv8rxfNJ/UH+nOakutg==
X-ME-Sender: <xms:LK0KaFWGLDFJU_h0xmlOrhlbMu1yC-HjYSH_3uLMtUQAaGcnVm_XIg>
    <xme:LK0KaFms98She0lkQLU9KMwzxunTlVFUF6FTJFBLiIIufXUmwTwOnO0JzgmJ7Q4f_
    Xj_Qhb9Un5GLIgT93Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrhigrnhdrrhhosggvrhhtsh
    esrghrmhdrtghomhdprhgtphhtthhopehjvghffhiguhestghhrhhomhhiuhhmrdhorhhg
    pdhrtghpthhtoheprhhitghhrghrugdrfigvihihrghnghesghhmrghilhdrtghomhdprh
    gtphhtthhopeihjhhnfihorhhkshhtrghtihhonhesghhmrghilhdrtghomhdprhgtphht
    thhopegthhgrnhhghihurghnlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfhhvug
    hlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehsuhhrvghnsgesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepfigrnhhgkhgvfhgvnhhgrdifrghngheshhhurgifvghirdgtoh
    hmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:LK0KaBawuGlmIHWYuyLQe9KaUxLHAAFnnJ9kuiKL0iRxuFlRIrBtyQ>
    <xmx:LK0KaIUpAp8eAA7wEl6dzjpmhyQg0Vpks7XUM2rGXkdzefScqjPKWQ>
    <xmx:LK0KaPnvGH64pFmMwBj3If6unlUamff1OX1_J10VFXN6fo1LMp3mHw>
    <xmx:LK0KaFd_qsBw1VsdqkFbfcZu5_QtmGtVbw0rrCZ4habC0WFOQUaK4g>
    <xmx:Lq0KaFUgNb4XK7eKC_FbWEcZ4moZOjmayU62m3rwMRztoGeNY3Kmi_rH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A83BF2220073; Thu, 24 Apr 2025 17:29:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td38c79e1c6632dec
Date: Thu, 24 Apr 2025 23:28:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Rapoport" <rppt@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Changyuan Lyu" <changyuanl@google.com>,
 "David Hildenbrand" <david@redhat.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Kefeng Wang" <wangkefeng.wang@huawei.com>,
 "Ryan Roberts" <ryan.roberts@arm.com>, "Barry Song" <baohua@kernel.org>,
 "Jeff Xu" <jeffxu@chromium.org>, "Wei Yang" <richard.weiyang@gmail.com>,
 "Baoquan He" <bhe@redhat.com>, "Suren Baghdasaryan" <surenb@google.com>,
 "Frank van der Linden" <fvdl@google.com>,
 "York Jasper Niebuhr" <yjnworkstation@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Message-Id: <7fcb9e20-fd7e-4b59-9187-8993b3b163fe@app.fastmail.com>
In-Reply-To: <aAqPQgjgkPNtOElr@kernel.org>
References: <20250423160824.1498493-1-arnd@kernel.org>
 <aApm344CnIwy4s2d@kernel.org> <aAqPQgjgkPNtOElr@kernel.org>
Subject: Re: [PATCH] memblock: mark init_deferred_page as __init_memblock
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 24, 2025, at 21:21, Mike Rapoport wrote:
> On Thu, Apr 24, 2025 at 07:29:29PM +0300, Mike Rapoport wrote:
>> On Wed, Apr 23, 2025 at 06:08:08PM +0200, Arnd Bergmann wrote:

>> It should be __init even, as well as a few other kho-memblock
>> functions.
>> I'll run some builds to make sure I'm not missing anything.
>
> Yeah, it looks like everything inside CONFIG_MEMBLOCK_KHO_SCRATCH can be
> just __init unconditionally:

Right, I tried the same patch after your earlier comments and agree
this is better than my patch.

Tested-by: Arnd Bergmann <arnd@arndb.de>
