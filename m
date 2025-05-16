Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14751216E24
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747392566; cv=none; b=I2569WKZ1tluPrykkQpgu5TgoIKIXDeR1BOynKTHAsUcRzthJE9U3J1lj3TGWzbQBj5Hrx4iVSfUWs7/61FvWBrMhkSTkPLqZs3h2L4ZqHQG9GkPkZHtkAdgL6vdFMAk0m3wV+qsDD8Dwsi/BIQDFS54alAdEHkoMZeJpRuyyq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747392566; c=relaxed/simple;
	bh=Ry3gqvuwLYxCPEe58dK0PM8l9IrA9rWjO77DhXM11dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frdj0c98xC0909LVmKdK0H7ctoGpLdMdwLKTCQ1YXwRjdPHqlwZEzHDS9qXIPxvoV8GsXjT7DA4Uvt5/thqj/eenByuOhkd2gqZ2hrRszlwZOecQZ1NoAjKqV94oKWVOpD50sTgh1UkyavszEKQF1vt+qICi7+Ue5RtmyMTrp/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yuw1Vew4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AXhuwIwj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yuw1Vew4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AXhuwIwj"
Date: Fri, 16 May 2025 12:49:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747392563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R5dBZwZOInTb8Xoa71QPFJcZFd6PF6TpQBto51aEBo4=;
	b=yuw1Vew4jVDKAfbNV7N6/ibe/VHyDCKTPmSx5OBVef5MMQwsQee5+8cQZYmUdcvDHNrS1j
	ZbXStWjUOqvjHwiyR3KmVa+zj87lW4sU47lSJhUQQFvq9jqH1ZMTjzdB8CphBnEf2G063m
	GrHp8+6qI10v9U5KBn7pGMofpSDl/nv+KYG00v4D0ctcM9czEo7Af1vmg1fYAjww5VzI7x
	SHiX76O3sTa1Zbt1OCORUc6q6C8UUYA7Tl3oVF2YZnrU9NEfJrO4s7C+slhHxPqKpW3zYf
	gK6+Xe8d9RIxSposHrQSB7CyN8max5rIRAzv2sRrQIuwJii0/a92DrHSp98VZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747392563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R5dBZwZOInTb8Xoa71QPFJcZFd6PF6TpQBto51aEBo4=;
	b=AXhuwIwjxDokse1Uw2RIoifMIxjkWLSeJ695XUV4G5j0+XzkCCfdG28xA6hSfAhb89dbKf
	trYSzCGal02thIDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 14/21] futex: Allow to resize the private local hash
Message-ID: <20250516104921.sy7Z-oy_@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-15-bigeasy@linutronix.de>
 <986dcbc0-0505-496a-ae75-e0c1bd7c2725@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <986dcbc0-0505-496a-ae75-e0c1bd7c2725@igalia.com>

On 2025-05-08 17:32:24 [-0300], Andr=C3=A9 Almeida wrote:
> > @@ -1290,26 +1466,102 @@ static int futex_hash_allocate(unsigned int ha=
sh_slots, bool custom)
> >   	for (i =3D 0; i < hash_slots; i++)
> >   		futex_hash_bucket_init(&fph->queues[i], fph);
> > -	mm->futex_phash =3D fph;
>=20
> If (hash_slots =3D=3D 0), do we still need to do all of this work bellow?=
 I
> thought that using the global hash would allow to skip this.

Not sure what you mean by below. We need to create a smaller struct
futex_private_hash and initialize it. We also need to move all current
futex waiters, which might be on the private hash that is going away,
over to the global hash. So yes, all this is needed.

> > +	if (custom) {
> > +		/*
> > +		 * Only let prctl() wait / retry; don't unduly delay clone().
> > +		 */
> > +again:
> > +		wait_var_event(mm, futex_pivot_pending(mm));
> > +	}
> > +
> > +	scoped_guard(mutex, &mm->futex_hash_lock) {
> > +		struct futex_private_hash *free __free(kvfree) =3D NULL;
> > +		struct futex_private_hash *cur, *new;
> > +
> > +		cur =3D rcu_dereference_protected(mm->futex_phash,
> > +						lockdep_is_held(&mm->futex_hash_lock));
> > +		new =3D mm->futex_phash_new;
> > +		mm->futex_phash_new =3D NULL;
> > +
> > +		if (fph) {
> > +			if (cur && !new) {
> > +				/*
> > +				 * If we have an existing hash, but do not yet have
> > +				 * allocated a replacement hash, drop the initial
> > +				 * reference on the existing hash.
> > +				 */
> > +				futex_private_hash_put(cur);
> > +			}
> > +
> > +			if (new) {
> > +				/*
> > +				 * Two updates raced; throw out the lesser one.
> > +				 */
> > +				if (futex_hash_less(new, fph)) {
> > +					free =3D new;
> > +					new =3D fph;
> > +				} else {
> > +					free =3D fph;
> > +				}
> > +			} else {
> > +				new =3D fph;
> > +			}
> > +			fph =3D NULL;
> > +		}
> > +
> > +		if (new) {
> > +			/*
> > +			 * Will set mm->futex_phash_new on failure;
> > +			 * futex_private_hash_get() will try again.
> > +			 */
> > +			if (!__futex_pivot_hash(mm, new) && custom)
> > +				goto again;
>=20
> Is it safe to use a goto inside a scoped_guard(){}?

We jump outside of the scoped_guard() and while testing I've been
looking at the assembly and gcc did the right thing. So I would say why
not. The alternative would be to do manual lock/unlock and think about
the unlock just before the goto statement so this looks "easier".

Sebastian
