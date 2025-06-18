Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAF319E96D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750277574; cv=none; b=k79nJrvfgYUDkDTHw9D//qpacscfiOr5gZDnEm9lY8z8qm9s9kfyZhcnf8EWY7Eh7iXQgLwe/umvCiePtpQdhFkztX0WXQsjwYWmEz55ydyba73vuRN9s0LZEAfXTiXUanFXH41ufAfgiWFPWYaubSvgtHHYE85idoLrIN0UGQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750277574; c=relaxed/simple;
	bh=Togvj70vVgkE8isnYaLN/63MfgSnZcJx9ObaihViXbU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N3BBK7U4cyWZPeGYxrhruoytx7AhlRDAVW63LIZD+JaEvy1YlL5+LOSJH3UF7MoUoiQMBh3Bzk9o+zcZvb3UWoCdG4EixdmEXnNeuUcJ6q7xVPE1ZoTKePh/S9pr/xkUze1woJFIZNJqsJAi4zle1UuCPGNGa+LNnARDZzIy6Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=DHTaxjcV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h+yNvMmq; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="DHTaxjcV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h+yNvMmq"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 9CD251140190;
	Wed, 18 Jun 2025 16:12:51 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-06.internal (MEProxy); Wed, 18 Jun 2025 16:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750277571; x=1750363971; bh=HLp/v9LWGN
	wJ+imbIVUELb6rW/0l10DcuVUkrmkSfJg=; b=DHTaxjcVncybfVniLALTNm7Jtw
	GAsAwei6M7P7M4CyoYufdLK4QGak55pcMibZhKtvxX4qTFAsm5R6ciHJ2rIzrWQs
	y/PBDuzfgtklBMCLc6iCIeKwtSl1UbOR4Clfhug/bjXVil7xzM5pigYi4GeOc4ab
	uGo96tCwKXVwhhh9eUfguHbiQMmqS7PJ3HyiBSbWWLDM9gedkx4Sl0lY0dVOY86g
	vnIqxkh7DOL0iZLxgiDJ7JWc8s6DRJjjG+4czzi0J02YsIHZfJKlo1VXdXd43WPI
	VVNfytZTerTb3f0+mclmMY2mEDTKr6qnx0b118gM2y9qz58VRX8gblphrNuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750277571; x=1750363971; bh=HLp/v9LWGNwJ+imbIVUELb6rW/0l10DcuVU
	krmkSfJg=; b=h+yNvMmqxd0NSQ9XhuActT4iSksfoaYIQRi6mNsh4XxYR64wuhP
	Hum9ngAAnmSF4DYCgfqJ787lhA93/VMahQnH9EXadtbvjEZ7ujSfP8cepdRumkJF
	MZrDFjpZzA+DCHgW1ak+XYpE4gKVC+g76UUwdqLZAWkSgpbaNf1ewEp3pbZSY2Hg
	sZcTBPQ8J4FbNPeVHYyRjINIlDOSKP7fiZGmmiTsGx+LBtp5RbltP8EvOWHl6vV9
	6BQ8QtrMD11Yt0v7ot2tFyZBMo9AwWg1AYPRbw0OP8Ak7/86nrr2dBaZDddwM0Bc
	KWYbDhDoXAbUMf6ROQfRu58taNGfsmTu5sQ==
X-ME-Sender: <xms:wh1TaAiJcOP9wY-Hu4C-Ci9UgHHlyPeIu3rQ716nDVqyYywdGfQpIw>
    <xme:wh1TaJCkXX039k-OrMjemaTzKAFsMZuRtnuNiSa-2M_USvNB15I_Pmb_F8Hql2Zzr
    GdNYstHkVnxBARqmKU>
X-ME-Received: <xmr:wh1TaIHJ2A5Wqc8dcFbUykNkklSdZMFvM-I2K-KWk-jubbpyZnQMvUFcoMllv_YETWtGoPmdcIXzW04JRORBUQM0uL3cKbkHCkd_j4y87ywdSYhSQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefpihgtohhlrghsucfrihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvg
    htqeenucggtffrrghtthgvrhhnpefgvedvhfefueejgefggfefhfelffeiieduvdehffdu
    heduffekkefhgeffhfefveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehnihgtohesfhhluhignhhitgdrnhgvthdpnhgspghrtghpthhtohep
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnh
    highessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepsghijhhurdgurghsrdhjiies
    sghprdhrvghnvghsrghsrdgtohhmpdhrtghpthhtohepuggrvhhiugdrlhgrihhghhhtrd
    hlihhnuhigsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtih
    honhdrohhrghdprhgtphhtthhopeholhgvghesrhgvughhrghtrdgtohhmpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wh1TaBQeJ_3d_AWEMB9Bkh-BaTfi-es8FiW-yee_Se6eyy1IbpQ9LA>
    <xmx:wh1TaNyKYT03TI0sJi-vWilH512i6uwGiWHEYjkKW-on9Fn4AiRQYQ>
    <xmx:wh1TaP5jABFUj9p_kO-WTa8thIb8FPhasFn-tMmAuUdogDxNrvXZAQ>
    <xmx:wh1TaKxYxnu914R9X90DEuOI_1IDCnNZ7dq5J37SDoZOtzujPLy4bQ>
    <xmx:wx1TaIAC4ETEZ1wKZe84W6rRvZljapPVc1-78T0qATdlC5KZlstfY0qS>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 16:12:50 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 6C12511FB964;
	Wed, 18 Jun 2025 16:12:49 -0400 (EDT)
Date: Wed, 18 Jun 2025 16:12:49 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
In-Reply-To: <20250618185432.5ce80e0d@pumpkin>
Message-ID: <0143891q-ssp6-83on-4o61-nrp2qn3678o1@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-10-david.laight.linux@gmail.com> <os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg> <7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg> <20250618101620.26533aca@pumpkin>
 <s919qno2-782s-ooqq-0p19-sr754osn8n02@syhkavp.arg> <20250618185432.5ce80e0d@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Jun 2025, David Laight wrote:

> On Wed, 18 Jun 2025 11:39:20 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > > > +		q_digit = n_long / d_msig;  
> > > 
> > > I think you want to do the divide right at the top - maybe even if the
> > > result isn't used!
> > > All the shifts then happen while the divide instruction is in progress
> > > (even without out-of-order execution).  

Well.... testing on my old Intel Core i7-4770R doesn't show a gain.

With your proposed patch as is: ~34ns per call

With my proposed changes: ~31ns per call

With my changes but leaving the divide at the top of the loop: ~32ns per call

> Can you do accurate timings for arm64 or arm32?

On a Broadcom BCM2712 (ARM Cortex-A76):

With your proposed patch as is: ~20 ns per call

With my proposed changes: ~19 ns per call

With my changes but leaving the divide at the top of the loop: ~19 ns per call

Both CPUs have the same max CPU clock rate (2.4 GHz). These are obtained 
with clock_gettime(CLOCK_MONOTONIC) over 56000 calls. There is some 
noise in the results over multiple runs though but still.

I could get cycle measurements on the RPi5 but that requires a kernel 
recompile.

> I've found a 2004 Arm book that includes several I-cache busting
> divide algorithms.
> But I'm sure this pi-5 has hardware divide.

It does.


Nicolas
