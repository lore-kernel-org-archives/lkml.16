Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B585C23E336
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400021; cv=none; b=EBLJEYUur6wkLecLsBJIyQyG1TOw3r0K1mceOG3lnfRKEAfCzlIJRCoBxjmriPPwbgmLygjhjOoMDUybdz91YqucYVjdwE4787Y/Cfsr6/3K+dy9zFqk+eCv3naeTnELry2bJmI7qhShT0vptyGnrkDGUqzkF+E8I4olVy9LJvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400021; c=relaxed/simple;
	bh=1QcFDARgJ/NZlT5hJNgAwCkcdIeenMBtbImX2aLknN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkMxxkqGOcDCkYrjI0jdbVA0N0iVtVRiHWq1APPdz+ly/k/YCnkg4prgdKTIsufOVRCs0hsoXLZ1WAVdsUyznBYRSxprUIpIZ/+GqL+3kLCIPSehuI1t7QhcM0WZFEAEinnl9sx2JrAyFJupl+4rdb81340X4sW+ubbXQbfour8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eOb4QqOH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Uag54dlR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eOb4QqOH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Uag54dlR"
Date: Fri, 16 May 2025 14:53:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747400018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vys/FNYdzEnMcyGygtNsLyX1fDBnwOGQAd6LgzIouk=;
	b=eOb4QqOHqGOrsIMa0BPgFFGyrwpb470b9J9apOTbkyaktX/vyEx0NEX0TrY0oIvgcabDpF
	ZP8cCZMt4QUalEp3HzG5vnYo3VLC0v7ISzGqSEcB3p6hWYkjNsm+kTHqbg9dcpdp06B/FN
	XSwXJLh8/5uENWxaMjqe0+NNesSZOvXGo625LXaUMMiWkc7SDllSfAu6xd+Cb0T6o/urYB
	bsLBRwhTTpaYQYmtU1/8DE6xaAaZE/Uef+8jmcHwSjbyKuZ5Y1f9hDSKx5XVaSpGHsKBXh
	RpdV07S/dG9nbtOsM3KfykFpxTUCgL9h6dPmqSE8nVlCgZ3HcL2bYlzqo8JyGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747400018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vys/FNYdzEnMcyGygtNsLyX1fDBnwOGQAd6LgzIouk=;
	b=Uag54dlR8zRl0oQmC0bvs9rsP8aF6wRAsAZNnwWz9guT9aUTE1aVRUKTu9Doj/dtpoQ0sN
	N5a5wVRrkyebQnDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 03/21] futex: Move futex_queue() into
 futex_wait_setup()
Message-ID: <20250516125336.zd1aBkwv@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-4-bigeasy@linutronix.de>
 <7a0da763-08ae-4e3a-a630-2ce3d32e477e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7a0da763-08ae-4e3a-a630-2ce3d32e477e@igalia.com>

On 2025-05-05 18:43:16 [-0300], Andr=C3=A9 Almeida wrote:
> > --- a/kernel/futex/waitwake.c
> > +++ b/kernel/futex/waitwake.c
> > @@ -339,18 +339,8 @@ static long futex_wait_restart(struct restart_bloc=
k *restart);
> >    * @q:		the futex_q to queue up on
> >    * @timeout:	the prepared hrtimer_sleeper, or null for no timeout
> >    */
> > -void futex_wait_queue(struct futex_hash_bucket *hb, struct futex_q *q,
> > -			    struct hrtimer_sleeper *timeout)
> > +void futex_do_wait(struct futex_q *q, struct hrtimer_sleeper *timeout)
>=20
> Update the name in the kernel doc comment as well. Also drop from the
> comment the part that says "futex_queue() and ..."

This has been done.

=E2=80=A6
> > @@ -636,10 +629,25 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, =
unsigned int flags,
> >   	}
> >   	if (uval !=3D val) {
> > -		futex_q_unlock(*hb);
> > -		ret =3D -EWOULDBLOCK;
> > +		futex_q_unlock(hb);
> > +		return -EWOULDBLOCK;
> >   	}
> > +	if (key2 && futex_match(&q->key, key2)) {
> > +		futex_q_unlock(hb);
> > +		return -EINVAL;
>=20
> Please add this new ret value in the kernel doc too.

I'm going to add this:

--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -585,7 +585,8 @@ int futex_wait_multiple(struct futex_vector *vs, unsign=
ed int count,
  *
  * Return:
  *  -  0 - uaddr contains val and hb has been locked;
- *  - <1 - -EFAULT or -EWOULDBLOCK (uaddr does not contain val) and hb is =
unlocked
+ *  - <0 - On error and the hb is unlocked. A possible reason: the uaddr c=
an not
+ *	   be read, does not contain the expected value or is not properly alig=
ned.
  */
 int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
 		     struct futex_q *q, union futex_key *key2,

Sebastian
