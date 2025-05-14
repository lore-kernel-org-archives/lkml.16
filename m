Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDD94A0F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210879; cv=none; b=cRB6NMkEiLTRbDck1n6407MT80LSTITI0Nm/cHMJP39KMEE4iU8p1IfFELzxr9molbS6xzuj24dCHMdoKWi7FKKElDnW7TfGdbjoDmAHvQk5tYKS/Swl4jZOTNHjRquwrmeFF62oAo3xTd8bXVF/9WQZDezhuDOeI8conphd0+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210879; c=relaxed/simple;
	bh=+qCz5Y1Cvu3t6eGy/8WDhGhgVRs3s59MwWSoGq8FM+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TD1vaALpGSA8XYgBQrk4h34+CeptQeIH+4pwsqqj0G8MxT9KVTiZa57ZWibLx4SJzGK80rNzr+xzgMD2vEC++5ytCkYpf4NDOrzvVKfgD2XRffu+Lo6yTrDMOBqRj66zryM8WpPJ14k1uPEjvlNF7sHmZWAyKTXI8IYcOF+pqrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=M5Wv0/p3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BDrJ4X4D; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="M5Wv0/p3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BDrJ4X4D"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 4BB571140093;
	Wed, 14 May 2025 04:21:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 14 May 2025 04:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1747210876; x=
	1747297276; bh=C7B9xklrPBdiOB1WdiiGqRFEIojGW5kErpndHo8XMeQ=; b=M
	5Wv0/p3fUGbLZ14WCQniYNYPusvuKSwT90JnEBmZzka0DRXlj++eJBDupQtQPXmY
	9zTFfTDOX3CaZLOpggV6XgR7bKusUChAPzUfpRTQbnNeJeMAr0BV7LIjdqxa6X7d
	2y1Ah9pFkm+v4iFe2vAyxZ4oLB4bjlmqkxvholrB1xjSCqOrztEQU1mmeRuU5rse
	edLAYBn7DB/o7b3lRTW+55GSUFwEdfO3KwPcZLfPACLCIts+DzzZ/bBwOux/Wczx
	hyglr70JeaSjadzI0EdTWb45TSS7UVtuX9Uvdou00GA2ID35XO2aUy46+Z1fTs71
	WDFXQ5I3ZVwKqOTpZzP0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747210876; x=1747297276; bh=C7B9xklrPBdiOB1WdiiGqRFEIojGW5kErpn
	dHo8XMeQ=; b=BDrJ4X4Dm/i3Y5lRSVy5FsJSkzdyZzPQU+nqwiBIXUJhAy46fmz
	VZljHvk9BtiYDdpL2XrVRvvfI6HO0Es95RK9lfh5VdFFlavNs1VyBBa6zCtdCnJL
	83OJqO5MqXfK0zXDzUrESvyaaSqTRj+W0Z1iFnD6wcVR2ggDgOV2HaHiO3SaXPbc
	D2WOKWk/r73P54ocCmBwGWtoCr33ADmkI9hh31zTUhdpfhdR5OP767AccQY//cH2
	LWXuPe6jr89PJze89T1DE6mkk25Zh4jikQQueJJExt1QtgVxlgX3jlNWWu7L4aYZ
	ATl181dfhaim0hMP2lq1gNGx3oQi4DIAwJQ==
X-ME-Sender: <xms:e1IkaNi2cxdXzn-HVkUUQAw47AVByEl3BG3nKGusVOLGUgOiSl82IQ>
    <xme:e1IkaCAGoRka8aetZKDxFPw_Lh_L9Veil9WBmE1xKn3hHUSC4WSUTUgs2oTtdrepS
    _QoQcicMfm3wj5vlzE>
X-ME-Received: <xmr:e1IkaNGz8PHf0lZq7CmYtrJGc_UW3-4DfXwQsfWjJXeThAhgwmQ3ohx_zAg2KcIy_X7j8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeigeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfh
    hfffveelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghm
    ohhvrdhnrghmvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegrrhgusgdoghhithesghhoohhglhgvrdgtoh
    hmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorh
    hvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:fFIkaCTCmYz-fTs6KltNFf7O8YS_tS6DFjkv0oFmwr8T6IRqrrNd-Q>
    <xmx:fFIkaKzFV29Vi-oQ7MvTi_ptuY7mVZLsiBtexKRRrx7VTN49RhR9mw>
    <xmx:fFIkaI5ObicVDh89QlyudxSmDYhfzHTlDSmE64dlmjLsUusApAAdyQ>
    <xmx:fFIkaPyXEObcT44AP70A0PwU0T9V0R53gpZzy-W3yNdGg7MvvMorJw>
    <xmx:fFIkaGjXrsM4ZhgdmIoMY4DqMNJDRo9m7SrTQYJ0xf_qAlcu6GsnrysE>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 May 2025 04:21:13 -0400 (EDT)
Date: Wed, 14 May 2025 11:21:10 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 2/6] x86/cpu: Use a new feature flag for 5 level
 paging
Message-ID: <62225ofhgw35cjrw6vr6qs3wbhotigbswin3542ltq5wkxelvh@jfkht7a6b2bs>
References: <20250513111157.717727-8-ardb+git@google.com>
 <20250513111157.717727-10-ardb+git@google.com>
 <7uh3pi23cdd5r2t6ln5p2z2htgmzo5b6omlhb6vyddobcbqqnt@nyujbhsnpioh>
 <aCROdV_fIygO8OoM@gmail.com>
 <CAMj1kXGChWHhbfjUgTQ37+epLjivrKhV8unwyZCHvNTJL2f57w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGChWHhbfjUgTQ37+epLjivrKhV8unwyZCHvNTJL2f57w@mail.gmail.com>

On Wed, May 14, 2025 at 09:14:56AM +0100, Ard Biesheuvel wrote:
> On Wed, 14 May 2025 at 09:04, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > > On Tue, May 13, 2025 at 01:12:00PM +0200, Ard Biesheuvel wrote:
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Currently, the LA57 CPU feature flag is taken to mean two different
> > > > things at once:
> > > > - whether the CPU implements the LA57 extension, and is therefore
> > > >   capable of supporting 5 level paging;
> > > > - whether 5 level paging is currently in use.
> > > >
> > > > This means the LA57 capability of the hardware is hidden when a LA57
> > > > capable CPU is forced to run with 4 levels of paging. It also means the
> > > > the ordinary CPU capability detection code will happily set the LA57
> > > > capability and it needs to be cleared explicitly afterwards to avoid
> > > > inconsistencies.
> > > >
> > > > Separate the two so that the CPU hardware capability can be identified
> > > > unambigously in all cases.
> > >
> > > Unfortunately, there's already userspace that use la57 flag in
> > > /proc/cpuinfo as indication that 5-level paging is active. :/
> > >
> > > See va_high_addr_switch.sh in kernel selftests for instance.
> >
> > Kernel selftests do not really count if that's the only userspace that
> > does this - but they indeed increase the likelihood that some external
> > userspace uses /proc/cpuinfo in that fashion. Does such external
> > user-space code exist?
> >
> 
> Bah, that seems likely if this is the only way user space is able to
> infer that the kernel is using 5-level paging.

Well, you can also try to map high addresses. lam.c selftest does this.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
