Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BFD56B81
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210775; cv=none; b=trrPm3G0eIQMtADwWUyxRKFvGdKsuMYCbdL3ePvNrwHbY2smA5w3QnpA8W03B7yI6Q3Xj3Hx3Jcc+W7BbNhMocFwQ9lQfDEdfakEh1iwPM/XHadjuiQsBpOBqCYGq3kbqZgDDkUg2/F2sGBK7gmHkcG0+qIxa0hKYFESZ8VA/Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210775; c=relaxed/simple;
	bh=BlLRWm6/SCpoL1LlvVlPkm8KznkW8TXPMTFWDsqMdQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qg9EU1VV6pcyp/SWX2geS5tWD8PW5EVkzwtKrjr8KAOO12dbVQSMuIq/c+tJBSGsfuKA7DifvE5Kj0p2mRik9ZV5HX8OYSalY96KHa1y5R9lYO6FH/kMkOUCpiXJstI5LdeL7TtGXt/Wd3Q8RsOGoK9VO9/dL1kl1P8bAPbtgSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=GEORpygr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JDxboOce; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="GEORpygr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JDxboOce"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 606D02540132;
	Wed, 14 May 2025 04:19:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 14 May 2025 04:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1747210772; x=
	1747297172; bh=415FrOkNWRZ/0yT8oEnh7GQiM9vjE/s+XHw/Fpk6qBs=; b=G
	EORpygr/I+ARO+9MXJ2nrE/74AjOzp/cCTUQ186thWBPf+nYoN+jWv7JMvh1KYS3
	crVomUmbipZ5lAc9hDfgwDSp72TFvlqU3sqX9NMSXF+/cBDh9j7fKz4gnmbM41wg
	pxYl4UsEUeYTfObpMDYjAvtLk7VWREXG/XCrqMYtQgKqjEAMIuIoMwwBjj/iAj8b
	KPpPcXAwWIq3PjCgJy5nLsS4eMV5AG6+6tQX/Ig2nNM648vE3ZShovwPIYhfEbKg
	CVmo0SAZLW5aqb0rlGlVjDn7qNbttsG4+VuzM0XzVfsJ0EZApJ4z1HyqJe3csjZ/
	H1XKqiPj00mTDR1MXAQwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747210772; x=1747297172; bh=415FrOkNWRZ/0yT8oEnh7GQiM9vjE/s+XHw
	/Fpk6qBs=; b=JDxboOceS+Rtv2Z2CI7C5xo8HlgEHMKxfvcHerYUdrMDGf1hpmD
	IjkTpfYTRzgnP/sKtV6zG0pu0k48Uhe6gyqa2TDA/fl5n7acGunjsubD8LvHQHvf
	ZK2WJeOnBMS55b5WbYcLsV08WxFAA/B9Do5f9y8LqRhRRaaXmwD52S7/UPU4aDJ6
	cnnLBeWj5z9MtrXm2YeiXwLVvxob6DUZGPCON3KRijoNrIZLeJctKRYzvcKLmCsD
	ekLKSp7T++2AEdEu6rbbpl5aXFwMnNfPObpUxNBUaYvXprAp4xcecFTbQOA1wr4o
	E+aTnuikKzE5aqj29/ciIqR6kKj0Lp3htjA==
X-ME-Sender: <xms:E1IkaH1ftbKHa9c2dP9XE6FR33BGOnE245Oec6BzZ7IEta1lgi9VYg>
    <xme:E1IkaGESNsDMMbNGhmGEVh_aaV6_pqwPc-9KPTyhMfiQXTVu17MSjGdK9zjEQW68_
    IhMDGpBSdTSxl2yExc>
X-ME-Received: <xmr:E1IkaH5RVXIAtoVIYVe5BdNMph9oqrHIxmvzXnpilViTP9G6sUpsawE4tIs9sOPQ79RErQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeigeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfh
    hfffveelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghm
    ohhvrdhnrghmvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghruggsodhg
    ihhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorh
    hvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:E1IkaM1Slv41flGWI-OMuIbikw6zXoBEXLC8InOZw810kj2sum2VPg>
    <xmx:E1IkaKEzpcuQ_1XkT8QkVFXpe3wfFFAHaZc0DQYMfEKX8sXqvu70Uw>
    <xmx:E1IkaN89DNnS6I4-hjxMH3BCLrKx9JR6zLVQT4Kqyt0L5Nu_NsDAtQ>
    <xmx:E1IkaHlD_kcGpgveji1Z4pRUJCv7AcJROrjvBFX3R-04eI9DDQsMVg>
    <xmx:FFIkaBoJmW8UMGcJmHanvDXa1DW6WE7vJMkDOzVekuviVKQgc_AJw7xD>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 May 2025 04:19:29 -0400 (EDT)
Date: Wed, 14 May 2025 11:19:25 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 2/6] x86/cpu: Use a new feature flag for 5 level
 paging
Message-ID: <jjvzxxat34tc2uebx3sjqpuft3onxk2izv6azvmmrvr2yxkir7@jqeumosuzmrd>
References: <20250513111157.717727-8-ardb+git@google.com>
 <20250513111157.717727-10-ardb+git@google.com>
 <7uh3pi23cdd5r2t6ln5p2z2htgmzo5b6omlhb6vyddobcbqqnt@nyujbhsnpioh>
 <aCROdV_fIygO8OoM@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCROdV_fIygO8OoM@gmail.com>

On Wed, May 14, 2025 at 10:04:05AM +0200, Ingo Molnar wrote:
> 
> * Kirill A. Shutemov <kirill@shutemov.name> wrote:
> 
> > On Tue, May 13, 2025 at 01:12:00PM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > > 
> > > Currently, the LA57 CPU feature flag is taken to mean two different
> > > things at once:
> > > - whether the CPU implements the LA57 extension, and is therefore
> > >   capable of supporting 5 level paging;
> > > - whether 5 level paging is currently in use.
> > > 
> > > This means the LA57 capability of the hardware is hidden when a LA57
> > > capable CPU is forced to run with 4 levels of paging. It also means the
> > > the ordinary CPU capability detection code will happily set the LA57
> > > capability and it needs to be cleared explicitly afterwards to avoid
> > > inconsistencies.
> > > 
> > > Separate the two so that the CPU hardware capability can be identified
> > > unambigously in all cases.
> > 
> > Unfortunately, there's already userspace that use la57 flag in
> > /proc/cpuinfo as indication that 5-level paging is active. :/
> > 
> > See va_high_addr_switch.sh in kernel selftests for instance.
> 
> Kernel selftests do not really count if that's the only userspace that 
> does this - but they indeed increase the likelihood that some external 
> userspace uses /proc/cpuinfo in that fashion. Does such external 
> user-space code exist?

I am not aware of any production code that does this. But changing is
risky.

Maybe leave "la57" flag in cpuinfo for 5-level paging enabled case and add
"la57_enumerated" or "la57_capable" to indicate that the hardware supports
5-level paging?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
