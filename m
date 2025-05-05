Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE0F33997
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430254; cv=none; b=folI8exV7PoBVE+KslVNjS4W/FgXRcSfjVi345krZ8nlMII92UqyUovbxCdYX8FFc8gmpvJnM+1210he/IoOgw82Ir95+DNCHJ8XD61bpD9LYGuolVL9nbKoNRIHP9/vVbvK82gzwZI92r4tAxgoy9Wtzo9nQMxt/2DhmQcdniQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430254; c=relaxed/simple;
	bh=/NomUYm99ImwBtNTMLQ5P6fqE3vAr+aiGaAvGjT0NTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i10/sZTL3+1kBzC3KD8KyW5ojjzBLe8DFZ/a7efj+TmGR0+OZz6T0L5loZRZPBiOxIRe5FR7jS7ZT3DnQpRjVTcxz+zdxNtHwU/vUa2Elm+4ij1Rjr1TCfKej+CX98GmxrOKu3S8a6n9ylHi+gU7OaLhtlDHUb9BBYhlBvKI0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qbk/01yB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p9p9zF9i; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qbk/01yB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p9p9zF9i"
Date: Mon, 5 May 2025 09:30:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746430251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NomUYm99ImwBtNTMLQ5P6fqE3vAr+aiGaAvGjT0NTc=;
	b=qbk/01yBAC0nVejADZG4RLuOy+0+v5dnkzq76BFKdMcNbf4rJ41p1xQNyoNlq7pikc2qcN
	0qJRv/8CXALTNamzX5RCIWKRpx7rOkbS/mbwJLPkKUqYLx1NPc90w1tRm+lHeeF4ocjsxa
	UjU651yatzuf+gXdbbSYanbONh+D3xHIsVwj+8doU2AtG+9Ij33roK62n+KXOo1/uZiSfs
	mznThbGPShuVejiR29yV7leK/OTle5wOx5Ba2QddMZfJsy0A1Wu9AxANlMEUcUVvlgD+A8
	U2VkXc8me2WAC9NvK6e/fdeSlnBkqt/nEZeInbIXBtcn5i+M4F1KcorvGO9x6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746430251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NomUYm99ImwBtNTMLQ5P6fqE3vAr+aiGaAvGjT0NTc=;
	b=p9p9zF9ifTZfy23ITAjIfsFTTt1xCVsnolyC6JEELypmllabuzijXQQZ9orkmRw/wnyFoV
	qpzdcjIVJCb1bVBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 00/21] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
Message-ID: <20250505073036.ikHE6K4T@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416163142.aKBzQeqK@linutronix.de>
 <20250502194807.GD24078@noisy.programming.kicks-ass.net>
 <20250503100905.GG4356@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250503100905.GG4356@noisy.programming.kicks-ass.net>

On 2025-05-03 12:09:05 [+0200], Peter Zijlstra wrote:
> On Fri, May 02, 2025 at 09:48:07PM +0200, Peter Zijlstra wrote:
> > On Wed, Apr 16, 2025 at 06:31:42PM +0200, Sebastian Andrzej Siewior wro=
te:
> > > On 2025-04-16 18:29:00 [+0200], To linux-kernel@vger.kernel.org wrote:
> > > > v11=E2=80=A6v12: https://lore.kernel.org/all/20250407155742.968816-=
1-bigeasy@linutronix.de
> >=20
> > I made a few changes (mostly the stuff I mailed about) and pushed out to
> > queue/locking/futex.
>=20
> And again, with hopefully less build errors included :-)

Okay. I guess the NUMA part where the nodeid is written back to userland
if 0 was supplied is not an issue. I was worried that if you fire
multiple threads which end up in the sys_futex_wait() at the same time,
waiting on the same addr on two nodes and the "current" nodeid is used
then the variable might be written back twice with two node ids. The
mpol interface should report always the same one.

Sebastian
