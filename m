Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84801190072
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269433; cv=none; b=IB4QsjlNqCwSC/EtEQsNjO5PIoaxRADu0ROgy8N5FEo8wFZBn38siH+A1kXTtj1sCRlE/wrxceZbRmqv3D2OE+aq6Q07qRPu1p3MnwxaW5R2YIw0xD0xfDPM7Mod3B90TZpwpjwQozES27L3w2s3hL3HLs7rEi1S0ZFOK3XMpQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269433; c=relaxed/simple;
	bh=wzUGC/g+Kc8HmaXcAsTiLRM+HXcGRpv8ZDrFBKUT/RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGoYbzTnx7mQCAVJve4mS2OsAZ7yqmh1vL7g3f9535OJLXVlhKBB/RbXzC92s52t+qrqNOCDv14zJDZHbOlQojbj4o9wBRuTmLFGcUhtpY4bp7l0pWp9+Wa+TjXdX38X9wGreZmv1uV03QhfFkpVVsOzs6ZEpMlfgqomZGL3eKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RxYbVixa; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RxYbVixa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dZfCzIqS0Ptn3nr+ORDa8qmkAF49TPrkMwvLYPx4ASQ=; b=RxYbVixaDDn8+Urggx6I/btjqP
	shrYdEUFHBReVh8KOjMgtkEVE+SmioppDETTCs8Rrte46Vw2+NW+hUX9JIU6cGvGBI+GxLeZe7fW+
	cizZJfDtO8Ci+9qhpgIwkXhtaY2Xy+5t3icqx4qZ4doCDQQwqWjUpGWj2cXZ5BUFs552vu5N+0PAW
	cidREqmWzEDjYXyn3hdFs/PoyDO2IAfl62Ujk39uwkuEwjBSmXiFB6X9r/a4bdSHRIJgA0BxryjuZ
	Pz+XhhgVaUKPlJwA+WBARvzsUXRhrsBGh2ImT2X/4OH853kb0XyGS8k4S8RNlxqrFX/OqueMRHUp6
	aZmWKJxA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Ay-00000006k4c-3Gmx;
	Mon, 30 Jun 2025 07:43:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 57ABF300125; Mon, 30 Jun 2025 09:43:40 +0200 (CEST)
Date: Mon, 30 Jun 2025 09:43:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 01/11] x86: kcov: disable instrumentation of
 arch/x86/kernel/tsc.c
Message-ID: <20250630074340.GG1613200@noisy.programming.kicks-ass.net>
References: <20250626134158.3385080-1-glider@google.com>
 <20250626134158.3385080-2-glider@google.com>
 <20250627075905.GP1613200@noisy.programming.kicks-ass.net>
 <CAG_fn=XvYNkRp00A_BwL4xRn5hTFcGmvJw=M0XU1rWPMWEZNjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG_fn=XvYNkRp00A_BwL4xRn5hTFcGmvJw=M0XU1rWPMWEZNjA@mail.gmail.com>

On Fri, Jun 27, 2025 at 12:51:47PM +0200, Alexander Potapenko wrote:
> On Fri, Jun 27, 2025 at 9:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Jun 26, 2025 at 03:41:48PM +0200, Alexander Potapenko wrote:
> > > sched_clock() appears to be called from interrupts, producing spurious
> > > coverage, as reported by CONFIG_KCOV_SELFTEST:
> >
> > NMI context even. But I'm not sure how this leads to problems. What does
> > spurious coverage even mean?
> 
> This leads to KCOV collecting slightly different coverage when
> executing the same syscall multiple times.
> For syzkaller that means higher chance to pick a less interesting
> input incorrectly assuming it produced some new coverage.
> 
> There's a similar discussion at
> https://lore.kernel.org/all/20240619111936.GK31592@noisy.programming.kicks-ass.net/T/#u

Clearly I'm not remembering any of that :-)

Anyway, looking at kcov again, all the __sanitize_*() hooks seem to have
check_kcov_mode(), which in turn has something like:

 if (!in_task() ..)
   return false;

Which should be filtering out all these things, no? If this filter
'broken' ?
