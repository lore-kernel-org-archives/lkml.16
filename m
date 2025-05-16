Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF71C2BD
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401803; cv=none; b=NQ/nMs9vDriSJKHbjpz6PlsU6UB1dHLduwP3NNOi19E8Gy99GuqalP2NpvO7cJSXghLzt2LbhR495ODdkoHHFuYiBHpWRdoHwvd/Fz6zGn8X+pEoveuWTKTyP2tKxr/mdnAmP/BZj4yPS6ORkf/m93XP1rnUOlf6Zr/RUxa4y1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401803; c=relaxed/simple;
	bh=ahmnuwVGqI+XOj5hlhZChZOWOYWcKP/VzpcYR5f6vNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PS6tyY/Toy/Iigg8+Hopx2k02DsMirbNRs0rjg8jeNjqDIaQdB8FQrZK8vVfEAtDdLPyXpiwUUamOLMoX+j6BDzYAhuxiRl+FgiC17/GzgThZXcvjecH0Ch7NlsWLqJqUYTtaomM2/czZEYqffNimk+8kK2f3rGyi8lreXwmkWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Mj2ydTBY; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Mj2ydTBY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PqXz5ra12IMA7iAqCW0VfJCH6zDymLCNTkAd/+H0nqk=; b=Mj2ydTBYSJ9Dkuf+qEb7h5m53T
	4Qkqs5crKZUGr3aR5Ubu0i86IXjxxaRAfeovNDUYD8QAeXE8kTL/oYBHdGxxhWe9EyJQvJIOQB+er
	cNoF5A3p84xszLbfCMcaV/aBtEiZulZNi1wlbhImkXTRnGsbO1IdaT3qhprW/Xnd1bkIKWelP0xup
	wFIguE3xF8w02YIKo/61Qv3cE9SdtBlxqTnnqlylpwAXPIvUzrUbKFp5Ab3vR81iXW72BpHzQ/fXE
	Z3ocPdwi3eTe9j2pSbC1kf1I50A3LvRPN4QNOuzJYA5OBkfjZdFRviGYHtdekBYtFGA0jyC0mqsEO
	ICXHxbLw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFv1u-000000004ba-14sS;
	Fri, 16 May 2025 13:23:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D092A30082A; Fri, 16 May 2025 15:23:13 +0200 (CEST)
Date: Fri, 16 May 2025 15:23:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 05/21] futex: Create hb scopes
Message-ID: <20250516132313.GF16434@noisy.programming.kicks-ass.net>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-6-bigeasy@linutronix.de>
 <4b41236e-b4dc-43e1-922a-4bb9dcc318aa@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b41236e-b4dc-43e1-922a-4bb9dcc318aa@igalia.com>

On Tue, May 06, 2025 at 08:45:06PM -0300, André Almeida wrote:
> Em 16/04/2025 13:29, Sebastian Andrzej Siewior escreveu:
> > From: Peter Zijlstra <peterz@infradead.org>
> > 
> > Create explicit scopes for hb variables; almost pure re-indent.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> >   kernel/futex/core.c     |  81 ++++----
> >   kernel/futex/pi.c       | 282 +++++++++++++-------------
> >   kernel/futex/requeue.c  | 433 ++++++++++++++++++++--------------------
> >   kernel/futex/waitwake.c | 193 +++++++++---------
> >   4 files changed, 504 insertions(+), 485 deletions(-)
> > 
> > diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> > index 7adc914878933..e4cb5ce9785b1 100644
> > --- a/kernel/futex/core.c
> > +++ b/kernel/futex/core.c
> > @@ -944,7 +944,6 @@ static void exit_pi_state_list(struct task_struct *curr)
> >   {
> >   	struct list_head *next, *head = &curr->pi_state_list;
> >   	struct futex_pi_state *pi_state;
> > -	struct futex_hash_bucket *hb;
> >   	union futex_key key = FUTEX_KEY_INIT;
> >   	/*
> > @@ -957,50 +956,54 @@ static void exit_pi_state_list(struct task_struct *curr)
> >   		next = head->next;
> >   		pi_state = list_entry(next, struct futex_pi_state, list);
> >   		key = pi_state->key;
> > -		hb = futex_hash(&key);
> > +		if (1) {
> 
> Couldn't those explict scopes be achive without the if (1), just {}?

Yes, this is possible. I have some experience with people getting
confused with that style though. But yeah, whatever :-)
