Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE73022F167
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305155; cv=none; b=PqOVgAnnuvN+5VB0QpQ6olXqfWXIUH04nMuxGcWgWXYF4DZ3vbTMgnpuTMRnqAZ25qNteyqpLPVuIrz4V9NYyx+sd3ikfRHP3fGMvk9GBKV8YemzfauVDPVLHPLbGQwhSLFmTvAKtXaiMC5glaWgkObg6gHZd+4NGat+zQe/i9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305155; c=relaxed/simple;
	bh=frDAZCgCzvkACKR2xRU7ny9ZS6gomb/IAsTaqkIQ8zk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RQgd+o63JzF3XNsx5p2kH9iOR+Dn45GdCS/boFlWMfTOHIEHf32lQQG70hYzSqlCqtGfJS4/9SjexgZT4AHYErOniaEVMo6f4kHT4nLeJxkxwto+dMCLCqHGHi5oSSFb888ES6NXbziDx8IyfF7hHTS6189jbMPfAQPOGEZQG5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4o3bYPi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4o3bYPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3199C4CEEC;
	Tue, 22 Apr 2025 06:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745305154;
	bh=frDAZCgCzvkACKR2xRU7ny9ZS6gomb/IAsTaqkIQ8zk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=d4o3bYPiwBLHZjNCgljd157DFxijzrVffhvftKIwCS9bgvz7/pO91K+j4CXKISmQq
	 oM7nrNG7tMqaMsVTdXX2o0LHJFJYJd1dY9Q296d5P9vMzS2zmbAFk2wyHKT2jQLCpw
	 1frsPbsb3qnIH61zBcz84ykBVhMhIDxA8ELQvsg8hk94KBxIC+bQK4e8YUkhqtFjoy
	 ySYafAFohXyCtS/82gaMTraRh/49fuvGmgvEGKeCC7pSYEDwKVaY5sdjAVq7s67Z3I
	 2JS0snusyvo/DuVxSgWEaPAfh/aSl2Mzh9knM92h34M0/BKW7kvfBgADwrZ37L14xr
	 07ZranskX2yHw==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id EC5681200068;
	Tue, 22 Apr 2025 02:59:12 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 02:59:12 -0400
X-ME-Sender: <xms:QD4HaO5sWZcQ5XURQqjpdwMiml5WPlPlPm94qbjAqP_pUcf1Aqo3XQ>
    <xme:QD4HaH5RT-B_8Y3rlOBTfxPHyo6xiE8mQ7efy7CJO3HTNQNbPRLNqWWuHcMUSJQFp
    e4uRlOlRLvC34XgnGs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepjeejffetteefteekieejudeguedvgfef
    feeitdduieekgeegfeekhfduhfelhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvg
    hlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehkvg
    gvshgtohhokhestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrphhp
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigi
    druggvpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihho
    nhdrohhrghdprhgtphhtthhopehpmhgvnhiivghlsehmohhlghgvnhdrmhhpghdruggv
X-ME-Proxy: <xmx:QD4HaNc-hSAFlwc-97d5ZNRZUOPjbCyAqNyt5r_6F3ZUGTQJ6OLKog>
    <xmx:QD4HaLJXSDRHGEXCyqDqOpdod5xlrj0PmeJko0rr1IMb8q45Cm_EHg>
    <xmx:QD4HaCIH87G4dFL_PCVMb3bD686HxwOFl78FdDUxUJfKWyTr3Frodw>
    <xmx:QD4HaMwxIa1T3Nun-ZJoizDfHpkTj2Dpd1pljQDyIfYQWQqThGwjWQ>
    <xmx:QD4HaGINjcz4MuVB197t8NxcOnIXVfflC6Aqwylaywv6hYKx3U4B_jjo>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C53CC2220073; Tue, 22 Apr 2025 02:59:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T2ca61220d4b17788
Date: Tue, 22 Apr 2025 08:58:32 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Ingo Molnar" <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "Andy Shevchenko" <andy@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Juergen Gross" <jgross@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Mike Rapoport" <rppt@kernel.org>, "Paul Menzel" <pmenzel@molgen.mpg.de>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
Message-Id: <f647bbd0-254f-42b7-be2a-54ddfa5679db@app.fastmail.com>
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
Subject: Re: [PATCH 00/29] x86/boot/e820: Assorted E820 table handling features and
 cleanups
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 21, 2025, at 20:51, Ingo Molnar wrote:
>
>  - Assorted cleanups: type cleanups, simplifications, standardization
>    of coding patterns, etc.

Since you are already looking at cleaning up the types and testing
a lot, I wonder if you could make sure this also works for a 32-bit
phys_addr_t when booting a 32-bit kernel with and without
CONFIG_X86_PAE. In my recent cleanup series I originally
changed phys_addr_t to 32 bit after removing CONFIG_HIGHMEM_64G,
but this caused regressions, so it's still left as u64 even
though it should not be needed any more.

     Arnd
