Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8FF1DD877
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953278; cv=none; b=HZyQny5Z/VrDFyawbEaWO1sZYGULsZym7asls1tf1WyzopmeAUurad+0BZYeJVqvRcSlRbp9WWCjDTkzTtodFV0UUhSP+j37SmAl4NsxV8nyLSz1SS5VlOHhF6Vl919Pgcnm9Di3TOCFL7QG8Gau8JhHl7QSh3MTZ0vr8JHUItU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953278; c=relaxed/simple;
	bh=/hLN2kFYId9KcJ/+BShnzfZrQf77sPkxaqi+BYJ89G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbFu1DdALl7+C/GarZiofTtzc3yQ/Aj9FgNFMbFgCbr9NuwehbDsKvrImUE7RsYx6HStJhpA1hbr0C86XwfprqiGDEJNE4n5wxn1nZBGzPpQ3LeXIgo2VEr/8mjDTAms6L9llPmsSqxEFgSMVF5Q2JJ79XbT1IC0oyzzTgseFD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=IuLWbit1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cepGdbLO; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="IuLWbit1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cepGdbLO"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 6093D1D002B0;
	Thu, 26 Jun 2025 11:54:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 26 Jun 2025 11:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1750953275; x=
	1751039675; bh=e6cjGtKpmc/36/ftnj0y0w25+0xMvdXNUNnkwHoxfUU=; b=I
	uLWbit1vBS5j8psysCR8ZoFS/Lw2UN/X0p+Z+H0UnKKGxv8u/QNNTgM1Dq+/5SVI
	MhKrg77JZz5qLsG9b/YWcfYeQLgxQKu8c1/+Vgk1JJ4/YSp0tisCemg1hlqYHcb1
	XIhPuL9EW5R+eAusxtDSbeUR5regGrWl8pN2EtjfxgCOC02ptyoEfHqxTFg7nQnJ
	YZmt92DJJ4+GhaNg6A16tyE0eSWA6+A3XHwMjchuRH4TI8cec52G5C6qFneaisMH
	V47HHOAiYrVBGBVc0kVl0LEfkMk/FYVJI+yJ4TavObXwl7ioB8IuuSXTGlS/RQ1S
	M9qgqHf6tJp2y/S+Plpsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750953275; x=1751039675; bh=e6cjGtKpmc/36/ftnj0y0w25+0xMvdXNUNn
	kwHoxfUU=; b=cepGdbLOlMJUZXAUgtbTscEjHG1nJ6vzzZx9pxt7NT4t8v/XizG
	VkTzS8LB7YhcBu9PvszYxT6GFKka0OPmPZuLxPl2vYaYZhPwe093I9x89dYeisYa
	2jfvQ2qx80q7uNS9x8Ju+GGjYo6AgZe1AlKxNK+9km4f7PuE/u+wkUS8CuIDw3v7
	AKWNowfkTUdz/2mcf5Ry+OOthnZo7SqEK7pZMhjO7LCWF/pbcNBpk0df2vVEj8Re
	s7HSJ5+/GFtXvY9N2FFhPxaaRUyvHR7Tz1Xl4rtA7sWRWsVeQYGjeQ8F49Mrh93I
	+I7I3XQ7SsM+TbzWpNZL+qXWVkBa38sxTbQ==
X-ME-Sender: <xms:Om1daChdF1eoiawmZLBT7v9t81Xg0LROrgNaUhE3kkZDkN7p1TlXAw>
    <xme:Om1daDC2euuYvkbqnASs4FedIu-NpZiKAdRwW7txFNa4OXk88cQFRXqLpKjoTyjyy
    Xn9p6_--0AddusWutc>
X-ME-Received: <xmr:Om1daKEKjw5ixFcg96ODDTWmMpQU_lCH6ljpEjhUcm889bk_KVOdNa_J9-4gUO8m3wFLTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpedfmfhirhhilhhlucet
    rdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvgeqne
    cuggftrfgrthhtvghrnhepffdvveeuteduhffhffevlefhteefveevkeelveejudduvedv
    uddvleetudevhfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhivghlsehsuhhrrhhivg
    hlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlqdhtvggrmhesmhgvthgrrdgtohhmpd
    hrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehluhhtoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrh
    iisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsghpsegrlhhivghnkedruggv
    pdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgruggrvh
    drrghmihhtsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Om1daLSYw2Wsx1v1PWc1PQOVCVP1mzYJauU6-E6f1NGmyptp511KIQ>
    <xmx:Om1daPyArSmzzzeWccP--UHqVff0oA457UG2Yd_AEz_K6QOoo4Go8g>
    <xmx:Om1daJ7v-JEDY6wDip0gIPkcic4w-caiGLWSZgg-rK6w1AxDuGZP2Q>
    <xmx:Om1daMyLiyp8ou4PvFH7ZpBukykKJDNm4RB9eTOCfyaRAG4b-tFtEg>
    <xmx:O21daPt8ShvMJUelciciezj6eRtp3qUPBNlHUPymrlebhFvLWbFut_7w>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 11:54:30 -0400 (EDT)
Date: Thu, 26 Jun 2025 18:54:27 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, bp@alien8.de, 
	x86@kernel.org, nadav.amit@gmail.com, seanjc@google.com, tglx@linutronix.de, 
	mingo@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC PATCH v4 5/8] x86/mm: Introduce Remote Action Request
Message-ID: <xrshtiuedxfwh5iabo3eq7y5sskpkwh45mi36xy72bja6ceoqy@3phukaxf4bvc>
References: <20250619200442.1694583-1-riel@surriel.com>
 <20250619200442.1694583-6-riel@surriel.com>
 <2wis5t6gys734pzky7vfpsw5tefmymww6n7sqylnlbx7o4ll7e@j2cah4e2cns2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2wis5t6gys734pzky7vfpsw5tefmymww6n7sqylnlbx7o4ll7e@j2cah4e2cns2>

On Thu, Jun 26, 2025 at 06:41:09PM +0300, Kirill A. Shutemov wrote:
> > +	/*
> > +	 * Allow RAR events to be processed while interrupts are disabled on
> > +	 * a target CPU. This prevents "pileups" where many CPUs are waiting
> > +	 * on one CPU that has IRQs blocked for too long, and should reduce
> > +	 * contention on the rar_payload table.
> > +	 */
> > +	wrmsrl(MSR_IA32_RAR_CTRL, RAR_CTRL_ENABLE | RAR_CTRL_IGNORE_IF);
> 
> Hmm. How is RAR_CTRL_IGNORE_IF safe? Wouldn't it break GUP_fast() which
> relies on disabling interrupts to block TLB flush and page table freeing?

Ah. I missed that x86 switched to MMU_GATHER_RCU_TABLE_FREE.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
