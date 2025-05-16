Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A15C1F461A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747397902; cv=none; b=EowL4MbZcdF3OqsxjQDc1g4YzaNewwOrEmTGG0GKfpHzxXk6L0NRZ21DJw3k3rbnm46W7iYpnCNceEFtHQU/eBjEgIX/ZsApZl66YhnaQSTfdWTENNC5GNPWejdSBa3ekGzVT/Xg6a+Ut4R+2imSolRS6tPHjmKBrY2bUIR2MeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747397902; c=relaxed/simple;
	bh=Hnr2iZWzvuGVRw4NEQJILHEV9exKlzrTlZ6oTtJbn1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMhZEB8dqmbNrnGtuV4yPkVO7JdlZMII447704/aJHxIpaoYCZtk/kbKNSV8prL5bDUcC6Qm1aYS6HvjFXapA5F49zWMrBe19itJd5GhMz5H1IDk5cpg+TS0PJVzxvVJaVnl8BrbElfkm0QbJA1mx79w5kG3iUrwwVT8O5QGF8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4OFicBf4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DnovXWbC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4OFicBf4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DnovXWbC"
Date: Fri, 16 May 2025 14:18:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747397899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DMkJmC2M6esVleAwSYFB1xbdrJMYA8AUbzJ3pFCk23I=;
	b=4OFicBf4Pi7QzZIp+/akh3Y2itydUqU1YhBDLSb7n5pQCXU1G1RjEQfuxgIn0lGrb3uOMp
	53rR6w/jAb40INhibtCXk3FJuFAA2x3Ec1dUJKsK/MplevgC7026BLqiVuRUQd2XxJy1xa
	cCGxQcowOBy2sY5YNMSaJV8BSoR4gn+U9fVXILB+StvEwf4zAZUHA44XxSyuy+1GhsnhdF
	rrZmglnQPJNU8YIlgAdytfxpCjHsrE2ctriR7A7P21JpQ7+9OHwsKMi3IBRfPYlSrOvmZu
	bRCl8UB93TAPjf6XgZnuVK67t+rIzpbJ6RYG5pNEANQ8rp3zR/QkqNildDIPkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747397899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DMkJmC2M6esVleAwSYFB1xbdrJMYA8AUbzJ3pFCk23I=;
	b=DnovXWbCh/gXa60ymrriOz4ylflf+M7cZ/ndJ98dUpsJNZLiBo53CasOHkPcvmk6u/ElA7
	lJoHdv5ihY+npzCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 10/21] futex: Introduce futex_q_lockptr_lock()
Message-ID: <20250516121817.O0WRlIxQ@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-11-bigeasy@linutronix.de>
 <0cd48028-8eed-49c1-b4b8-798037457c8e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0cd48028-8eed-49c1-b4b8-798037457c8e@igalia.com>

On 2025-05-08 16:06:28 [-0300], Andr=C3=A9 Almeida wrote:
> > +/**
> > + * futex_hash_get - Get an additional reference for the local hash.
> > + * @hb:                    ptr to the private local hash.
> > + *
> > + * Obtain an additional reference for the already obtained hash bucket=
=2E The
> > + * caller must already own an reference.
> > + */
>=20
> This comment should come with patch 6 (that creates the function) or patch
> 14 (that implements the function).

It is too late for that.

> > --- a/kernel/futex/futex.h
> > +++ b/kernel/futex/futex.h
> > @@ -183,6 +183,7 @@ struct futex_q {
> >   	union futex_key *requeue_pi_key;
> >   	u32 bitset;
> >   	atomic_t requeue_state;
> > +	bool drop_hb_ref;
>=20
> This new member needs a comment:
>=20
>  * @drop_hb_ref:	True if an extra reference was acquired by a pi operatio=
n,
> and needs an extra put()

This is done as of today.

Sebastian
