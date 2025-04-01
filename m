Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0A1F03C4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743545431; cv=none; b=h6AnQ7izPORmG9L2HiaOHGj2NMdBUOXOEvI0xX8ob+17Eqm3AY0b96h21hn3KozqFaLTF0NkQHyi3rustKyccuT2HLyOLdoxfoMqgkpEHaJoJS1DUyoGBG+XaL2qZI6D4bHB133baM8KJFVE2VQ/NrsGrdnKKm1U941TSnyow1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743545431; c=relaxed/simple;
	bh=x4AXsN86DN2//KXoO6ot4oODdioONSrKrir7IBYWpGQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Dxu530ZveLCMw9AeFstvTIquJLLDfkniYbM00UD1M5XTYRPfOkz9IinGBWhQIV7RJu1BMZajhDIGlO+iJUBRHJP0/Odu0XZ3Nx4IztjW4jVKnE2kJvf9KA+3akdTBqVaG/J2pFKyOPjLeu85b5LrTgqfwpawW3lOJhtR+ZV1yso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=kL+flJjC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xElX9UD5; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="kL+flJjC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xElX9UD5"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id E2FA513838F2;
	Tue,  1 Apr 2025 18:10:27 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-02.internal (MEProxy); Tue, 01 Apr 2025 18:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743545427; x=1743631827; bh=WyUlJ7uRML
	gJ02b+YrdElxYIqX3W84hTtBtwB45CndM=; b=kL+flJjCGnwjw5gEFWRmF3Eigo
	9qqLQJlnK8G/kEStsU6mWgIrD6sml0gpiBG+pPqpgo8y3k4dj/dgXoaxTzW3fkfM
	idg6T3pwjGdzVo3c/XjuFEs2Q8SbW0iTZ1eNQX6mlKnxWEXeeUn/aognh0i5hi8V
	80ZnVvxwkg5CiK80UxyO/6x41dK+20ntmspQoTnQHtSK+ejbYB8S5LaUW7GSMM/P
	GxNvndyML5IMVFtthIt6xdlOLcsQAfF8RjaBcxUPqKq+UqqG3gkAsW+L25Y30RQH
	bQ0Ba+0yxsjYoRrlbUWnHokFgf6k2CmdLnU01RRTbSfkygpwHYv3MXTgBmYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743545427; x=1743631827; bh=WyUlJ7uRMLgJ02b+YrdElxYIqX3W84hTtBt
	wB45CndM=; b=xElX9UD5ODEy6Y9RophsjIVZ4TLiDsraDOW9Gr5UeLDx3jd4/5k
	hXJb6jOBsuw7ExnPjn/f19hPA868J+rFdCShtr9o7dWbsDN0P1QDqsm7lKfCz7Y5
	VrbuXPe8lR5teuqZFvq36Zf5RyKbO9q4GzP8BldE1EByC6rgqHJtjx626wALfshc
	wvoH2PL2FsEHkfKfpIDE+funbI2OJOeyysP38pJ+dk5lUzP1tZT7EZSrYmt5a/k4
	TEAAgBfQ1w39RlQTUBH2Y46ACY4PIDAPabFMpvDeqNPfVzPuMWuU+HTJ8kUKs5ft
	9N8h5LqMiFTPy9ePftS+3XpuYYfRB/oxZiQ==
X-ME-Sender: <xms:U2TsZwh_MOKuVMMd9AbZL80eBHb41PELkcdlQVdbreJk5uzKNhvVGg>
    <xme:U2TsZ5BiHTQnhU0BG6gmPUTyBxdzrlyr7dRj7ExHunI_KuWki0lI3sIboapMeU9W2
    8C_wAIzHgNCYYIuFjw>
X-ME-Received: <xmr:U2TsZ4GvMEs6D4A42aa23LNR-vqjpr0RgFJGE_f9J3tBm5Mr0rdHnDOuGght1Ee6jIQyFlwIoiwnSpmjQwvXRfom1TKOY8g8YeBLdnkn12NLS8pNQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeefleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomheppfhitgholhgrshcurfhithhr
    vgcuoehnihgtohesfhhluhignhhitgdrnhgvtheqnecuggftrfgrthhtvghrnhepgfevvd
    fhfeeujeeggffgfefhleffieeiuddvheffudehudffkeekhfegfffhfeevnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhitghosehflhhugi
    hnihgtrdhnvghtpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprh
    gtphhtthhopegurghvihgurdhlrghighhhthdrlhhinhhugiesghhmrghilhdrtghomhdp
    rhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:U2TsZxQMOK9M2HLg-NnMn5dWjpi-FBdPHmlz9pXi8N-MwfRaTIRbaA>
    <xmx:U2TsZ9zgaqyly6JVMvG3CvjsCuCrEYa5mEzuW2X9U0c6FKYTNomXDw>
    <xmx:U2TsZ_4BPgNoO3RASXkDy7YKdObOBKE-Q8wn-4slJSEgddjZny0OAA>
    <xmx:U2TsZ6ye9qPJJKBKyAMs7N146SmSuHWZcgutgS_m3EaPYEx6LiDsjQ>
    <xmx:U2TsZwoBghEhvmPDzXj0yI7AJKaofMPsfRNeZuIufRu1x7UdwiDmJh4g>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Apr 2025 18:10:27 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 66EB010BE5AB;
	Tue,  1 Apr 2025 18:10:26 -0400 (EDT)
Date: Tue, 1 Apr 2025 18:10:26 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
In-Reply-To: <20250401223731.7102103d@pumpkin>
Message-ID: <rnp80365-s71r-s169-7os0-r38s80qp8123@syhkavp.arg>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com> <20250321131813.6a332944@pumpkin> <epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu> <20250331195357.012c221f@pumpkin> <mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
 <20250401202640.13342a97@pumpkin> <15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz> <46368602-13n7-s878-s7o2-76sr0q67n9q4@syhkavp.arg> <20250401223731.7102103d@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Apr 2025, David Laight wrote:

> On Tue, 1 Apr 2025 16:30:34 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > On Tue, 1 Apr 2025, Nicolas Pitre wrote:
> > 
> > > On Tue, 1 Apr 2025, David Laight wrote:
> > >   
> > > > Looking at the C version, I wonder if the two ilog2() calls are needed.
> > > > They may not be cheap, and are the same as checking 'n_hi == 0'.  
> > > 
> > > Which two calls? I see only one.  
> > 
> > Hmmm, sorry. If by ilog2() you mean the clz's then those are cheap. Most 
> > CPUs have a dedicated instruction for that. The ctz, though, is more 
> > expensive (unless it is ARMv7 and above with an RBIT instruction).
> 
> The code (6.14-rc6) starts:
> 
> u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> {
> 	if (ilog2(a) + ilog2(b) <= 62)
> 		return div64_u64(a * b, c);

Oh! those... yeah. They are carry-overs from the previous 
implementation. They kinda fell outside my consciousness.

> If you assume that most calls need the 128bit product (or why use the function)
> then there is little point adding code to optimise for the unusual case.

It's not that you "assume most calls". It is usually that you "may need 
128 bits" but don't know in advance. I'd even argue that most of the 
time, 128 bits might be needed but often enough isn't.


Nicolas
