Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643331E520F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207951; cv=none; b=uvco2iZbrGYrKJymjKKarUlzcd/sD+W235xmEztCIMYepqOBnIwIhw3dBSsBD2auB/QsXwBVGa1NSOYuFeQnkLWd3YAa2fcysuNe6Jg8Ph9mBifmGTInkwVimRBAmYZSr1jzZ+oNBEtI7t9PfBCSNCx9O9kGwn/aj6wecoiQ02E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207951; c=relaxed/simple;
	bh=mNTpKyACjW3IqLthvEUFSkgCuriLRZXfpUG4yh6Zus8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeodnW1Ze7bexEd4ifF6uuJVKE7+7nacGrJ+vQhG1oe3QOiNevW2umC/l2fTmc5DfqzY4fH4DnCfReMGA16mhDw0x1kecU6WQyM43oozVZtzt0Ky7OMrg2CVYsYFSKBB3z0j2pk/qIJuOhBdPCtSuyIkZgieis1ZK2fULASze2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=B4lGwSa5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CCLD/VxP; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="B4lGwSa5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CCLD/VxP"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A759D254010E;
	Wed, 14 May 2025 03:32:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 14 May 2025 03:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1747207947; x=
	1747294347; bh=r84kY0TqgFUDsXhe/cStkhgcg5vNsY/bvqHg3SLMDs4=; b=B
	4lGwSa53VF1p3B9uF3DTva9uEmOqC/Ao3R6RwN/QwAUf3InCoyXZTJtAGQWnh+pY
	03H3gCTTxlPMq63lYhuu3l4iszfAcoZGDN4pCXXD0B+H8tWThKudRYQnpXtQ12jr
	g672iwlDz28vmAPDBL5DtDxB7HeEFepiY3abPjQMx4U7Rwn9V3sIbnfCzui9rl4y
	EcfknpzTc9P9I1rKHiiRx68qfC5Cc7f4dqEbTF5JFXmcCNvZYDfAUqU9LK/BLCU0
	SEanZ/2PxDLlf1YPge9WRcJvllsd8UzJFdEg8t4QOTR+p9GCl9SCg4I0xE3gBeSZ
	56rjYJfhyZSAMxBprmzKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747207947; x=1747294347; bh=r84kY0TqgFUDsXhe/cStkhgcg5vNsY/bvqH
	g3SLMDs4=; b=CCLD/VxPohQNb0neE/LuEw6aoMjdho1511QvJJ8enYoCe4wP00t
	nh/xMqkCtmJwgLHy5VVK7H4cSE2YUFYE6Mgc5KbxKaPEEaTHtsqHs/l4r5G661X3
	jqsGtDS/rHwM6cb8QIZ1ByfQrx8xBbZ6tXggwGcYxyCQj0AHUF7UnhcOZJvd2h1E
	t3yU7HWOnpDvMeloumkS3CG9yxcRBGMjw2MZZTC2KGvYRKEMKMMD+BGjaPyUGC/b
	GYHnGGxc8PCsNet8xofGh4LJYkfu456BabcLf82Rz/aL1dXwI3dUEtc7UdKeSPyy
	zrX2samer86fE0g1usbhrxMegus1n/2jKAg==
X-ME-Sender: <xms:C0ckaDkcs-fvg7WAfmzSBgaPlX0Xj7T0KuQmEqgO92tmeK4YUP8-YA>
    <xme:C0ckaG1WIE23LKV9XfGnuMWIaBA3GdLTUrX7S4xhXd6LKRQ8PrL81YKI6M2dljQaT
    350FcT-sUBjhiqQzRk>
X-ME-Received: <xmr:C0ckaJoSRw48E74Nilp4gpcuCdL-Q4ixDFYHj8gUU8J78UW_D7sN_3qRhQCHEqfH9qZGrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeifeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfh
    hfffveelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghm
    ohhvrdhnrghmvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprghruggsodhgihhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeigke
    eisehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorh
    hvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:C0ckaLmz1OUxAwz9bnG8VhxjpagAesWclVFyPoG34MR_MYD93WVIbw>
    <xmx:C0ckaB2A2E1p-KPvc0xF3bLsaSTDlRq3hmeLbsi_gAzVlEy7YuAl_g>
    <xmx:C0ckaKs262l4E9o3-11yQCyqsEZ04Jy23yOthngpXfTtzo8dLlHYIw>
    <xmx:C0ckaFV6hY7nxa54JbtF_S2nWlPhLEfPKhoRhNuI-ZoQyckB36anjw>
    <xmx:C0ckaNbv7gmhULiD1WHCpFY9ylrWLxN3q3ORA_smRvLQylha_wPIe7VY>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 May 2025 03:32:24 -0400 (EDT)
Date: Wed, 14 May 2025 10:32:21 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 2/6] x86/cpu: Use a new feature flag for 5 level
 paging
Message-ID: <7uh3pi23cdd5r2t6ln5p2z2htgmzo5b6omlhb6vyddobcbqqnt@nyujbhsnpioh>
References: <20250513111157.717727-8-ardb+git@google.com>
 <20250513111157.717727-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513111157.717727-10-ardb+git@google.com>

On Tue, May 13, 2025 at 01:12:00PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, the LA57 CPU feature flag is taken to mean two different
> things at once:
> - whether the CPU implements the LA57 extension, and is therefore
>   capable of supporting 5 level paging;
> - whether 5 level paging is currently in use.
> 
> This means the LA57 capability of the hardware is hidden when a LA57
> capable CPU is forced to run with 4 levels of paging. It also means the
> the ordinary CPU capability detection code will happily set the LA57
> capability and it needs to be cleared explicitly afterwards to avoid
> inconsistencies.
> 
> Separate the two so that the CPU hardware capability can be identified
> unambigously in all cases.

Unfortunately, there's already userspace that use la57 flag in
/proc/cpuinfo as indication that 5-level paging is active. :/

See va_high_addr_switch.sh in kernel selftests for instance.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
