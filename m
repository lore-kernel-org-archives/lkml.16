Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A3B2EF9DB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750264967; cv=none; b=Xx7apYGPmhLMuQfM5iGzDAYo5MqnQ2NTyilNHfVO2KkBFMG+D7ibI/BfDM5Vd4m1avp5o6gXx8jwux+6wp9sDWLc1T+y6KU2Ok+QuTMHbXRdB6r0O9LVr2GAU1ShLQkud4a1w7mvIZHOah1n1OX5j4VXrN45gCGet2yp8o5XbCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750264967; c=relaxed/simple;
	bh=1jAwEhEW9a9Q0nz3YvE3Pn1HJX8HmuC2aTahWMU+raw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Dwl9r23vcR0Is5uT/7oIMDt5XyexpPWSvjqHXX7MngPo4TIX8tCKtsqPTX4aEhgSmLYrsyR55hgnmH/NbFSmMPkZLP+n25oZf5jKEUblauCKgJ9G33eGP88bxjijAUmA+9gnBJhFZgPU2Q9hrm/wOzSH1xAX/oKyIzQCg1i+aUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=auhUWrxa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m4LyV3/i; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="auhUWrxa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m4LyV3/i"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5DB1C2540154;
	Wed, 18 Jun 2025 12:42:43 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-06.internal (MEProxy); Wed, 18 Jun 2025 12:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750264963; x=1750351363; bh=l2ptRcZN44
	1eE8R/iJ9ck2xx1G0VQynL+dygpmbMaac=; b=auhUWrxaQDSMxaEmLYojb50UHI
	mTCMlkLUa8PNWN/NfdWLQ06WQ7BHJlJwQgQUlSVOOBa6WH281r9wU41vOtYYgv3t
	xJ+lIYYtQWtAqAjc5W605mw4/LP0p+660vJz9WrrrZlbTq1LNK9aNO7fsmuuXGzi
	fkk/Lhk05E0MY6MAgcdlL1ey+M7weZGo89jxuJdZcWP6rAwdv6uwyN56N4kfpwla
	77zl8wDaPw0fi5DCz7LKJg5+Ry+jTxufAheZVZTZzx314kVDx8SqF0hfQJd31a5U
	lKPuwdjBYIk5PLzHha+Nvuq274uo0qYaYddcOEzCWblheUnls0IUgVBQd1tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750264963; x=1750351363; bh=l2ptRcZN441eE8R/iJ9ck2xx1G0VQynL+dy
	gpmbMaac=; b=m4LyV3/inyHCi1kr+Y7o/yNWsT1jeGIbtd+5wFSpJfVeUTgZsxx
	r9bQ8JcRVnFrj6/D+nsEPqO8TUrH7uWG3CXJ4yKz73+wR/aR0NMhqyB4GqAurWop
	s6WYOotoX/2Voj8UjEUMDchq/9CH/1fT68oK1n3ZDzI1S2hRdZ6C6/NWmCf5L7Ky
	hbBnDNmUAAkYb6lZ+qXXh7OBH5xYIMz4apNgLYViHSAfNJ7sX4YOTr04Dg49gr1f
	fxy6Sf02i1YVKHNmZSuwaNM0+vFXDvNhMPQG/nHPvDrSofITaEVY0QCfSdyac84Q
	m89EvaGaWRZTw/oUkjyWW+f6QuSaGtMFooQ==
X-ME-Sender: <xms:guxSaOkARwcegFLXfeiTirRFvEDtJVZVeNnbsnLMRiXaifmHnm-osA>
    <xme:guxSaF3VzhBomegjZT2-Ftd5KaMZza6nHJe2inLT9FCivKjWfdYCQLT3qFyuP18WX
    THbE-PECxd2JB4PgME>
X-ME-Received: <xmr:guxSaMq-3kq8J7dBtXpUeN9O9scrbNs9PuLvzO8A93nvORTmNHEXriep2bcY0qy5lF2lDVzv3Tp9Iq_HeM3O5kZ2D5GdI4sKmPOazRYnLxnXRL560g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefudegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:guxSaCkkXFPAtimBAOfuKwDRi7aOhRpnldL9V1wMLUFJZlEXyAw9GA>
    <xmx:guxSaM3_x2Z8o9SD3O_vHWM4HwEKsmcH45bIvffgdGh6OMyXoDNU9w>
    <xmx:guxSaJu03Iojt79jIaLBjOZhSxNTeQYG5kfAuTP4CHx4oSj7buuP5w>
    <xmx:guxSaIW5vcWR_yJt4B9h5kKDiYLZ0pwLUUS8fDRNef-7a9mjWGvT6w>
    <xmx:g-xSaD1WHD2ABPrP5R0YI6uOJARtrFyJ1jKv3yzJD7Vca130mUn-TRVD>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 12:42:42 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 8599911FB560;
	Wed, 18 Jun 2025 12:42:41 -0400 (EDT)
Date: Wed, 18 Jun 2025 12:42:41 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
In-Reply-To: <s919qno2-782s-ooqq-0p19-sr754osn8n02@syhkavp.arg>
Message-ID: <2388o883-4317-1n2n-70po-ro7os5qo41so@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-10-david.laight.linux@gmail.com> <os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg> <7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg> <20250618101620.26533aca@pumpkin>
 <s919qno2-782s-ooqq-0p19-sr754osn8n02@syhkavp.arg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Jun 2025, Nicolas Pitre wrote:

> On Wed, 18 Jun 2025, David Laight wrote:
> 
> > If the low divisor bits are zero an alternative simpler divide
> > can be used (you want to detect it before the left align).
> > I deleted that because it complicates things and probably doesn't
> > happen often enough outside the tests cases.
> 
> Depends. On 32-bit systems that might be worth it. Something like:
> 
> 	if (unlikely(sizeof(long) == 4 && !(u32)d))
> 		return div_u64(n_hi, d >> 32);

Well scratch that. Won't work obviously.


Nicolas
