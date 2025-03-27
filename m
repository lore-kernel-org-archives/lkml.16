Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BA42147F1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081302; cv=none; b=bwRoSAzMCirLNOjK3rMgSyVkpaBN9HYzOkvh50y+tDdtynRBPZZT+V3Ity1aUjVpNCinok3fuv2l+86QJRA1hZMsMVU1OaZSj/7/eKwKnNXogLiPztWExpAnvwkogZDdBRFJy0+NWCeFeclMnUgg+3LsO12EfMTXPmjBhyQr2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081302; c=relaxed/simple;
	bh=1yFaZYqvcYDNJh0PGTwxZFRauzLSSfkjQfMqN8JuhOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g5JHXNycX8u5cAHthp5pFcP7v8RMIhMOVIGFLLQ25CbmsjlpmcceiOP7GVyZxT5iZrev53vVPrkJkyEbnO6m0LIu2UxX3nv19VkHappMu5dSjfx50H8e3rMZ5cHM/8xKLOADXZMJCQPvxCUUqaEX25ndgdZZWYiLfy1ElQbyYpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vBnWkEx2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Jl6Rl6FI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vBnWkEx2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Jl6Rl6FI"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743081298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUx68NoJVcmegmS//LLZAzu2/GU40CRk3xOu5dI0Fug=;
	b=vBnWkEx2G0gw/bZeWZBxLwL7e3dlti7KImGKbpbD8b0Z8yqPE9GRmw0PKF1uNG6SxffFHz
	OaIBrcEa0Bo+ks140cPOAu0jsS6jEqx1Rq8jqrDa8+lfenCBAtj9P/EQkeCmaMvg1Z/Y+n
	MhLt4ZCdbyQN+lxG425OsR2XFt7H6vPYk5MFdzh7v3R425MYy3Peq6bvQyn87mUh0yRZGB
	iFKFnFno17C1QhBaQsYqAtCPnBTcJXEivW40f4n3je7oalld+EMpyt5ogBffXKMY0CPTnr
	24Ax3LdUKObrPNB1G0pglcc55xgaogYHhbZsTPZ7i2YcJBj370D/AnuCTWwbjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743081298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUx68NoJVcmegmS//LLZAzu2/GU40CRk3xOu5dI0Fug=;
	b=Jl6Rl6FIa4GjE4ERVTvXTc5M6kNny5VamJxlrDGqWQnoQvzPWSRn4LUhdCScALiGUH0K8d
	qVYMIn6KlFuZM7DQ==
To: Eric Dumazet <edumazet@google.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, kernel test robot
 <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org, x86@kernel.org, Benjamin Segall
 <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [tip:timers/core] [posix] 1535cb8028:
 stress-ng.epoll.ops_per_sec 36.2% regression
In-Reply-To: <CANn89iJvxYsF0Y9jH+Oa2=akrydR8qbWAMbz_S6YZQMSe=2QWQ@mail.gmail.com>
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
 <877c4azyez.ffs@tglx>
 <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
 <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
 <87v7ruycfz.ffs@tglx>
 <CANn89iJvxYsF0Y9jH+Oa2=akrydR8qbWAMbz_S6YZQMSe=2QWQ@mail.gmail.com>
Date: Thu, 27 Mar 2025 14:14:58 +0100
Message-ID: <87jz8ay5rh.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27 2025 at 12:37, Eric Dumazet wrote:
> On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@linutronix=
.de> wrote:
>> Cute. How much bloat does it cause?
>
> This would expand 'struct ucounts' by 192 bytes on x86, if the patch
> was actually working :)
>
> Note sure if it is feasible without something more intrusive like

I'm not sure about the actual benefit. The problem is that parallel
invocations which access the same ucount still will run into contention
of the cache line they are modifying.

For the signal case, all invocations increment rlimit[SIGPENDING], so
putting that into a different cache line does not buy a lot.

False sharing is when you have a lot of hot path readers on some other
member of the data structure, which happens to share the cache line with
the modified member. But that's not really the case here.

Thanks,

        tglx
