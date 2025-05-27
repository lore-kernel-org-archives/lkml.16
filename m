Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A09C3209
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353557; cv=none; b=S2AHkcX8ms7a5nIKxj5lmzdeHpx4hCvkfBdnHH/hfNnjMKLjBq8hfCzIUoHHHgvX4pEDmAlq3QnuNkRQUp5b2KLUg8Gbf43+n5qw9wAWVPMwZlKFTDLgJigXCWkYvbl/dyU9ZGN2x0zQGlGHBut/iupCto2aRXBXb++rRXyAriA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353557; c=relaxed/simple;
	bh=FurPThMsCHlFJHvzQf6hl3kAPfo/GmHqQqO8qk75XZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tr99v7jU/0rVM2nzedrqQXvg1LB+FaCHSsBq+wCiHe0xr1ORdGpua3PyFycSa5TONvQycBvh3fLG36qAVdYiJK9rDbojuRY8SKB1VTbQID3H7xuZrPhb4Xw0SjBc0jREbQJvP6BD4Hi2WeKCB6n2piqRXszfw8jfsXLJ/y/yEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=htHd0bpb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TmI7j7MX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="htHd0bpb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TmI7j7MX"
Date: Tue, 27 May 2025 15:45:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748353554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qQw3+7LurU3drz9tWiN0PohXM7cxdZZzT4tBqY5HlQ=;
	b=htHd0bpbVsRPWXn6oD6IW5tmZhwGAPj3QiMOqVP36ylh8B184cuGSD6eZq9bQncn52jTEX
	7VLOQZrqMJZvA230qxeOCEMCr5bVCJsYiiS5MmShNM7w+BjapuNPbVJ4nNCW46AycrJkUt
	I3TTg6DvfeB/ICM3bJYtRAEpCFXXrfHYIJhXmyuMYgbp7TFE4fhlwNpFlZLUZ1h7abPMyV
	rfgkDHiOomiX7KEOgFFap0sHXL8VSV1cComyUzv5Le15jJ/pb7KT8hyKPv6J56+zon6p8B
	0E/BPb63sLLa5RBuffLQwF7oKEuQRD6fFtm8SEQIlMOGyvP4Djlm+ec+I2torg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748353554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qQw3+7LurU3drz9tWiN0PohXM7cxdZZzT4tBqY5HlQ=;
	b=TmI7j7MXFR7Uvw7Gg6FpoeHr24SvaPfKzeKxPQ9ckim+tXqF9F9eBPUB1xWiIrWedUhQ0s
	WFeR4ii21UEO5cDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 20/21] selftests/futex: Add futex_priv_hash
Message-ID: <20250527134553.wEpPpYff@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
 <31869a69-063f-44a3-a079-ba71b2506cce@sirena.org.uk>
 <20250527122332.M0ucxhwh@linutronix.de>
 <231a9862-58ea-4a6d-8893-862776d9deca@sirena.org.uk>
 <20250527124327.5UDnm-ho@linutronix.de>
 <269b2f41-1405-4cab-9310-11df428e64c6@sirena.org.uk>
 <20250527132533.lqWBepWy@linutronix.de>
 <36bdcbe1-5f74-4afb-83dd-89f7348aeb5d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <36bdcbe1-5f74-4afb-83dd-89f7348aeb5d@sirena.org.uk>

On 2025-05-27 14:40:22 [+0100], Mark Brown wrote:
> >  	int ret;
> > -	char c;
> > +	int c;
> > =20
> >  	while ((c =3D getopt(argc, argv, "cghv:")) !=3D -1) {
>=20
> Ah, yes - that'd do it.  Looking at the other tests there they do have c
> as int.

And in the mpol. I'm going to send a patch later=E2=80=A6
Thank you.

Sebastian
