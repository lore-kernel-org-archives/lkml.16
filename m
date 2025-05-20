Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC6126A1CC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747738796; cv=none; b=eeVlksVRjI+JdgzDS6eUbd62BUD88rXfLb9rGxB8j72ZyovM/THASH/9tCNLhMZ8sWRzMPqs7MDhcYofU7fOu2+slQLlvQhAt/EWc4W/IJ2pIqfqXyfZGQREqxFvOoIpkSmELbgLsEFJmEAqdWWwB/h+xN9MHS26r9xQPcwN3kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747738796; c=relaxed/simple;
	bh=X62kn2V/O4Hz1j1YlCNkrxKHotw7w0NdnUAxWEl4lvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPmO1MZLTEFIEJOstX6Fi1vm1mUHaYDOjRSjg4BC0botT2/8iJFWTsQ4kxn7COoEWnrWhV23V/dUOWo0ApNAM9CdM1ezKMHef1sBsDyF9zU2T6wU2ejt9nUzracJtqkIbPwzILut02Y9XPgDE+VYASbov0RQV6HJfH7RQY8KV54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=omcGBZUI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m0dj33bT; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="omcGBZUI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m0dj33bT"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id C37B11380472;
	Tue, 20 May 2025 06:59:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 20 May 2025 06:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1747738792; x=
	1747825192; bh=ygNhWVe5vIXCf/URS8Fkfj75f7gA1QG3R5DG52s29XY=; b=o
	mcGBZUIinX6eGmERS4p/IEq/KDvkoaCzZ1Y8jZqnUTOYF87k8mloR+pweMMrZV9i
	5dCTBWdUb0zT0MdvXNLWavrhYWub5Fwy3hyfs7PM4/lZM546JrlUJvfEDx6lMeZY
	s09zqmvyQiLpSdzTXehQ/1MB70fLl5+vUkkSQStVBF2S5CB7Y5yhofDkPFCR66qg
	EuS3gHib+cAeDPoye1idciSMsfIrRLE3AQ3yRZqpPFzTCr3OCkVuxMbXWKlEEu45
	G/VqK4EiyXmyOcarAS5D+lSnZy1Is/0QtdB08pD3nHs9pvvc5E+WsFb182dLpQZZ
	COR+pOtZtK+TElrbR6cAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747738792; x=1747825192; bh=ygNhWVe5vIXCf/URS8Fkfj75f7gA1QG3R5D
	G52s29XY=; b=m0dj33bTiiJcK0GVWPpu9TMFa+Q83pNeM9nynxt0N6ltRSo/8XE
	ilLIYoYrnxUyf/TiusN+thCRNeRfvG17wGV8IYya7FU9OQFoJx3jOLGAmaOJ13Wx
	guwcTDKfAs6erekJZv1UrngO3W53+DL3fUmsUH7blpS+h9Ag11FTEQY4egZ/iS7W
	owhLimAEnwLe/EkKo9EWnZk1zKiwBzDYtem+ZLiwLNNghoW+LZ82AOrljuVVYitp
	jSYKsHlAI6funrcszQX4iTuMuLStXduEabQnZUU16GnnE5Bueh9G+SJRCik4IG9i
	J0dYqXhfd7xrn/f+sXQhq7s+Ot7crO76Wtw==
X-ME-Sender: <xms:qGAsaKMIAsdy2XvB3f9M08eQ8FOcCKAO98jLo8V0YQaACIvzHnq-Cg>
    <xme:qGAsaI872ifpO4czFhn45JLi3MgiiOw11k0VJwj52cvEqpPz3NHRYKEFBZBcF1192
    f1v6FMTv5yLR4kBgqQ>
X-ME-Received: <xmr:qGAsaBQuouqLJb6TqG5SBN6QFRYLTS8nkUWVKRfwEF5-pzOu56zBFx6wmNTQDXOxd3BwFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecu
    hfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhessh
    hhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepffdvveeuteduhffhffev
    lefhteefveevkeelveejudduvedvuddvleetudevhfeknecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdr
    nhgrmhgvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegrrhgusgdoghhithesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlh
    gusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepsghrghgv
    rhhsthesghhmrghilhdrtghomhdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
X-ME-Proxy: <xmx:qGAsaKsCx7ONccZNXm_jDvOYuehuzT3V-DxrPPibKqjf_AnpkN62SQ>
    <xmx:qGAsaCeJCVR0sYoS7coJhbQd44VwdLsRdZCztNPSWZs_gisL7bFbaA>
    <xmx:qGAsaO0LIxxB8sNwrp1DWe9Hdbogs_altjJPE0fuVfwe7tP2K4_a-A>
    <xmx:qGAsaG-TvG7ZOJirsSUQHhloyw9huUiUUszBc8-DtEHFyHJ_6axM-A>
    <xmx:qGAsaE16A3v_rt6SSAwE170AusvWzNhbP8Xz7KMJBRwtW0ImV68T5gCU>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 06:59:49 -0400 (EDT)
Date: Tue, 20 May 2025 13:59:45 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 1/7] x86/mm: Decouple MAX_PHYSMEM_BITS from LA57 state
Message-ID: <sjsxy65qkdikr6ppdyce2mu7exbnlvxdjbf3ypfqbpspf566rh@cc4atj6vn2pa>
References: <20250520104138.2734372-9-ardb+git@google.com>
 <20250520104138.2734372-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520104138.2734372-10-ardb+git@google.com>

On Tue, May 20, 2025 at 12:41:40PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> As the Intel SDM states, MAXPHYADDR is up to 52 bits when running in
> long mode, and this is independent from the number of levels of paging.
> I.e., it is permitted for a 4-level hierarchy to use 52-bit output
> addresses in the descriptors, both for next-level tables and for the
> mappings themselves.
> 
> So set MAX_PHYSMEM_BITS to 52 in all cases for x86_64, and drop the
> MAX_POSSIBLE_PHYSMEM_BITS definition, which becomes redundant as a
> result.

I think it will backfire.

We only have a 46-bit window in memory layout if 4-level paging is
enabled. Currently, we truncate PA to whatever fits into 46 bits.

I expect to see weird failures if you try to boot with this patch in
4-level paging mode on machine with > 64 TiB of memory.

If we want to go this path, it might be useful to refuse to boot
altogether in 4-level paging mode if there's anything in memory map above
46-bit.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
