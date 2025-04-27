Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC522512C5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745755664; cv=none; b=rma1g+YTbQVVEsWtqCoF1imaHbZFIqdsYL/SgF18wAasUa7VMZJWDwWc97ZxV35Ts+VcFh5MlPTCCQ6kPQaShy02o9nyAlHp0R9vVfbLEAZ76OvmfYbC9IsmUQLCtYBmEHQI4SIydTUqF7G0a2jw+P9N2bTugyc+D183eNd68sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745755664; c=relaxed/simple;
	bh=fh3YZcna7PAqGGZrqSG8L84Kek1j85WvaOHEx+BiTPY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pHvamik6RjmElq+wnSCdEIrFQchH8wbrFEYrGMMNZfj5Dp980DqvonYZLc+/T7qXG/wJeaccWN2Ga8KbLKUCaz70wmwNstgGB5FDAjSKGASqmHsFzmA5mjrncGQTZuyGGe0X2TOUQcuNQoDGBGHa8uVQ6iJ+70KLM/8wAJSbDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lQOGehIQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lms6Yl5f; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="lQOGehIQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lms6Yl5f"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 665B81380202;
	Sun, 27 Apr 2025 08:07:41 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Sun, 27 Apr 2025 08:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745755661;
	 x=1745842061; bh=Xm+QNyrBBBf52RUqRDiFJoX0T4B7OZD984bHM/sS2w4=; b=
	lQOGehIQWpzPFewT1DD2sGDQpJCvhEhDOPrimsXykveo2AMK13J7OuXnmAaVKoAZ
	GIy5YKzoPvUkMYE2/Sh5RSnxVYwI+yol8B7QUkCLvAxHDE92xkIFDNRx1++uIR7U
	7W8QUzS4aInk9Ctzqidyo9YxPr7HawjsjFobmGh+EpGxkDPnsOLKE49h8+nPBlaI
	nIwhas9HYe3qu50DP5jxLEa2RUFSVMWkbe1gu//YWpiIPYGbdFWA+icUmkuBiaau
	41oXbCZNCIZqBMNydRTBMSeEe2bF4ldaQO2RQBYkGGOp5vka0kh9gd5Qt40Xr/vr
	SckLeQAMV9v3wk5IBNS8yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745755661; x=
	1745842061; bh=Xm+QNyrBBBf52RUqRDiFJoX0T4B7OZD984bHM/sS2w4=; b=L
	ms6Yl5fnE2XCYUr6MTlEGoU6bstHYpA4VtfEaqbGWQ6u8tm7RPrQK//gRYwCA7Av
	1A8A7iN4haKlctlH338jvkaAJzHkT5juB/f1rIXzXYYitWwDzEcGK5MR6lOwQeWR
	woPcPMiPUxNf8toVPRH8dj1m0c9vccTXilq0MgoysWR9qFqde5go9LtljL3NdISs
	CKFXaLM8nHRJPtTrgIPlPUP/26kRLsaOjuwadOW9YcZTOwiJNY+3xPYVS3Lr7N4u
	f+SX6N5aKEyw/d7y9m5ecHc6Ol5zu6ihOtCGaJVvpC4xJqspxUoV1xxuBkkfebmt
	EooWRu46pHwQxOClL1H4Q==
X-ME-Sender: <xms:Cx4OaKsT3GOxzu4H8YG9IIQPN5vEpf7CXuN7tdNywXpZR4pX4hh7Uw>
    <xme:Cx4OaPcd-vF-wQ4ZfEdrkY3Oq0ZMT6AIAUQBkhQjuTuqcDPsZbJdShtbw1UhHSPXG
    N_QE6qCwXidgr5hUnc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheektddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopehjshhtuhhlthiisehgohhoghhlvgdrtghomhdprhgtphhtthhopehl
    khhpsehinhhtvghlrdgtohhmpdhrtghpthhtohepohhlihhvvghrrdhsrghnghesihhnth
    gvlhdrtghomhdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehssghohigusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgt
    phhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:DB4OaFwEf4dFOwgHav67mIbtqfrxSZvCwTesDxbVep81xyZaevn7rA>
    <xmx:DB4OaFPvsuA1JZO4k6-SH8fD8KX72akWANl9ngI_csCbnCi0tzQ9Pg>
    <xmx:DB4OaK88_EVfD0uwb7ex1hJ37laQrY7Jp2xyx7r3_g02WLMKNSPkGw>
    <xmx:DB4OaNWsJZ8U8EbY7wf_2cLHIZp1sOiM_EOTCV5bhRLtSuzLDvkdQw>
    <xmx:DR4OaOqmQFP4KQYsAh679jXjIydHt3r5CDsKeTw2gRix95YKtQCQlXb5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DDF032220073; Sun, 27 Apr 2025 08:07:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T98d234c297665c71
Date: Sun, 27 Apr 2025 14:07:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, "kernel test robot" <lkp@intel.com>,
 linux-kernel@vger.kernel.org, "Ingo Molnar" <mingo@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "John Stultz" <jstultz@google.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Stephen Boyd" <sboyd@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Message-Id: <963683ea-eaba-4430-bd8a-1b11affe104a@app.fastmail.com>
In-Reply-To: <aA3FL6e1HVAw1J+w@xsang-OptiPlex-9020>
References: <202504211553.3ba9400-lkp@intel.com>
 <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
 <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
 <aA3FL6e1HVAw1J+w@xsang-OptiPlex-9020>
Subject: Re: [linus:master] [x86/cpu]  f388f60ca9:
 BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Apr 27, 2025, at 07:48, Oliver Sang wrote:
> On Thu, Apr 24, 2025 at 09:59:38AM +0200, Arnd Bergmann wrote:
>> 
>> Thanks for confirming. So a 486-targeted kernel still passes
>> your tests on modern hardware if we force TSC and CX8 to
>> be enabled, but the boot fails if the options are turned
>> off in Kconfig (though available in emulated hardware).
>> 
>> To be completely sure, you could re-run the same test with
>> just one of these enabled, but I'm rather sure that the TSC
>> is the root cause.
>
> just FYI. we rerun the tests. if only enable X86_TSC, the config diff is

...
> the various issues still exists:

>
> if only enable X86_CMPXCHG64:
...
> various issues gone:

Interesting, so cx8 was indeed a problem. I would still assume
that TSC caused the boot panic I cited, but it looks like CX8
caused all the other symptoms.

At the minimum this strengthens the case for the consensus of
dropping support for all pre-586 cores.

Thanks a lot for confirming! 

      Arnd
