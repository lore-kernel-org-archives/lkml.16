Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9364C85
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743539438; cv=none; b=XmlSD6B5/gRk5w+44Cxa0M/Z2NK271NwI16GS6T4GncGknOL+eTcevwQx7XrHWjlgILBNc9OlkPKJonuPY+YH626qPnL4x7H/I9VjqV+1NqbHpT6kHnt4qAimhz17mNYrkHfOAQNJEfe3l14858myMddN6itUlBetMYPhUB21io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743539438; c=relaxed/simple;
	bh=4gpdqAfUNOfyHaSzy+oL6c35oIBJqrMwk9W09sffOhs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K/hDSMn6V3ECXNfs4ZWsCJ8xVF28gAuZt0CHslM2WpV1MhpkjALOdkZWqdvmaoaeNtAx/E/I3+30Vh/sWyqgOtDideMltvMdtacR8E4zp1S9lpPQ9JUIbGpZZpS31/MWnVgLssrjUlDfo9Fjin4k+RwtjadY47SdZYgecUXlqVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=Kp3qrwzK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bw8BCDbF; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="Kp3qrwzK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bw8BCDbF"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 64CBD114026F;
	Tue,  1 Apr 2025 16:30:35 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-13.internal (MEProxy); Tue, 01 Apr 2025 16:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743539435; x=1743625835; bh=qSZxOh1JXE
	hTopJuYEoTNy4J5eI7vnzSDzPPKuRU/KM=; b=Kp3qrwzKt44pQBmVDP0P1R75II
	S80HmU7tw8PoyrszRw4J7L+v8AMAyWstg+FJJN4ooxm1jjvm5bZr/jRVoDaNKMUI
	kQm8MO7lXmgf7RBf09s6VGe4fDOQJOp1kMQ5+xSV6e5rZX1AvaGGTHkxX1T9EcuA
	dmXoDuF7SocJyrpKP+40e9i4V1WQ41frzZKHZjIJho0e/doRc5FVWNGcdxO+TP+H
	89WqgOGUmccoeSujeaZOb36sS9SZ96T2yRWQMkKw6YKXfGfyN7O4uxdScVgH8C5B
	PKwNiqd6fPM2bWT4Hf5sKHzdToBLk0XA2rP0nVPI29pqVLU4cNeIuiga0yig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743539435; x=1743625835; bh=qSZxOh1JXEhTopJuYEoTNy4J5eI7vnzSDzP
	PKuRU/KM=; b=bw8BCDbFrVHmhOY22ca4u0SNPqqxUHMe3lyQfhggadRNqwcqNCR
	4IvRKiHs6JS9hP6gSoCSyAWphpp99bCLWExZ4bLNxaE2FiXKUuMgQ8C9TeIwMypP
	M69x1IkhQ5NZx7FckEvqCkEcfRYZCA9FFjrCBTvbA6RbEUWfvqS8hXsFX37QVYGc
	CXBHIBvmRF3LVCz3ll2B5E4dFDpPdSssOOCgUtRXnP2HXOxXMGFIpKu9qGqg9muw
	dOXvHAhFtkhXXam3ZxV8Cz5ujHmT9Zl6O6PEW25GvwT1cCTYJnENh52B3DqONEQt
	pAMVB3iTWAV289X2FCS1ZfNsq5/RJZXdoFQ==
X-ME-Sender: <xms:60zsZ0rgfY0GMgzh44Pqe6u5KroE208xM0u03r5HBc8onysfyl-Z1A>
    <xme:60zsZ6oXSY4IP-OY7jIy6-BA5_UMgDlqJO-n7AER6-k85xa_QmN1W1R5c5gvm32Lt
    e5DhHSeuURnxXy6sBQ>
X-ME-Received: <xmr:60zsZ5MnenTPs7gBh_SXJsFqburyrK3jO4sYWBM3RCinVW-qxWeFz2NcIEgV8uZ6RGXdvpBuc_-KFA5rY3B7TWfrZfNdBURXMT4lytRvodh0oL0ybg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeefjeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:60zsZ75X-JECDy_A2xBcdj0AJtQzsiIR43NtpnB9c-kFPc4roH72xQ>
    <xmx:60zsZz7U_ShEgLoY_KvM7k1L-knzeCyYzMaBSBXSrA2i3EFhrPBzqw>
    <xmx:60zsZ7iu0W6xOG6xyVNmF7Pbo44d6ELBiM894BHYeawlUThN3nXcvg>
    <xmx:60zsZ95FfqZmTds6LAegKzSQk1wMKwS__KMnj7ZtDdKiO76-Jh-ceQ>
    <xmx:60zsZ21yszMtvlD3cQr9BuZ_ykYh4lbJH_NfixaChjKyLsN0zmeKYNdy>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Apr 2025 16:30:35 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 27F4110BE327;
	Tue,  1 Apr 2025 16:30:34 -0400 (EDT)
Date: Tue, 1 Apr 2025 16:30:34 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
In-Reply-To: <15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz>
Message-ID: <46368602-13n7-s878-s7o2-76sr0q67n9q4@syhkavp.arg>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com> <20250321131813.6a332944@pumpkin> <epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu> <20250331195357.012c221f@pumpkin> <mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
 <20250401202640.13342a97@pumpkin> <15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Apr 2025, Nicolas Pitre wrote:

> On Tue, 1 Apr 2025, David Laight wrote:
> 
> > Looking at the C version, I wonder if the two ilog2() calls are needed.
> > They may not be cheap, and are the same as checking 'n_hi == 0'.
> 
> Which two calls? I see only one.

Hmmm, sorry. If by ilog2() you mean the clz's then those are cheap. Most 
CPUs have a dedicated instruction for that. The ctz, though, is more 
expensive (unless it is ARMv7 and above with an RBIT instruction).

> And please explain how it can be the same as checking 'n_hi == 0'.

This question still stands.


Nicolas
