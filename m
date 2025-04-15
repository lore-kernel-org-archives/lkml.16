Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416361C6FEC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698340; cv=none; b=qLXas+fbob+JmbxkR/+jl+Of877DNOOtJ0OmoRVNqwe3uwYfxh6DqU0B/r3V6XbQs61sdCSu6bN2uLOXI3JRAYqud/oJCFngMIS75BScqUgJHfvsgCcPzycSbwNxyceZy9OFlTjgc43lrOE/VfFSHXVQbQSczNVp5j1J5thuY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698340; c=relaxed/simple;
	bh=dh5FhgAhU8QzQEcMHBR2nna5AVFACjEqIBTgqHGYQBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ca8lgVzZTBqCX0004nKDTncwc3S+KZp0M4xmdiNjNcS+ZKSwDQUkkxgxmjCWVj8t5nIR2/60SjwB0mrtAASm2XIkjz3aDJxnN3QZhrqujHUH2oSrSjsH80EJR4AY6NxTl2S6mEkzqdgCKbDqjmIlE5catWxJRtjKQ9i1Zav+7wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=alc5URBg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OTzimcXr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="alc5URBg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OTzimcXr"
Date: Tue, 15 Apr 2025 08:25:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744698337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcPw+x42bijeD1N1uyjV3n6thrcv749kYyckCWzN074=;
	b=alc5URBgJpTS+lZWdamyLP7p8bwwAs4nS58oUHQEXnWNvxkYwVL4gMrTevw/JPfoDm9kM5
	wSuhguRfMWC7VK5GGbMsmem1J2BZGjCFGrynyipeMoOi9WdRzYGexZ2nXQnpubB9gyuPCd
	ORsGUbCPkEo/stctuxIbGSwCIDqLnw2hTW81G2C6sZJ1aa+Mj5hoaGV6sxu5ooQO+hhKe1
	Ww5IIdX9Z5Q47J59scq6tGdaZHGkIK48l4ZGSJ8cEvTBQG9ZU/1QyedHABOKgSKnU88AjC
	ab+YxTE4+IBeww+YUy+K0sRbfwUq+ahniogemfeAev4RYb+/PRJjzbCmhBRCxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744698337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcPw+x42bijeD1N1uyjV3n6thrcv749kYyckCWzN074=;
	b=OTzimcXrUlUGf0nyGY1w0qCcxgJ09y4H0ft42ENVZoPVpPdKgtx4YD38uwcmrXzKJCkIFH
	zzUPBtoXhnXktzBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH 0/2] Scheduler time extension
Message-ID: <20250415062536.7tvr17qv@linutronix.de>
References: <20250215005414.224409-1-prakash.sangappa@oracle.com>
 <20250217120000.5ae1201a@gandalf.local.home>
 <821926D8-ABED-4B66-9E2D-39594DB82FA1@oracle.com>
 <20250322061422.2b24f021@batman.local.home>
 <1142C71C-32B8-4C34-BA3F-4D061BA25620@oracle.com>
 <20250414124149.2543d6c0@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250414124149.2543d6c0@gandalf.local.home>

On 2025-04-14 12:41:49 [-0400], Steven Rostedt wrote:
> On Fri, 11 Apr 2025 20:54:14 +0000
> Prakash Sangappa <prakash.sangappa@oracle.com> wrote:
>=20
> > > On Mar 22, 2025, at 3:14=E2=80=AFAM, Steven Rostedt <rostedt@goodmis.=
org> wrote:
> > >=20
> > > On Tue, 18 Mar 2025 16:10:09 +0000
> > > Prakash Sangappa <prakash.sangappa@oracle.com> wrote:
> > >  =20
> > >> How do we proceed on this feature?=20
> > >> Are we leaning towards enabling this feature for SCHED_OTHER only un=
der PREEMPT_LAZY? =20
> > >=20
> > > The merge window is about to open and I'm way behind in what needs to=
 go in.
> > >=20
> > > Let's continue this discussion after rc1 comes out. =20
> >=20
> > Can the API be finalized? We have an use case which will benefit from i=
t. So like to see this feature
> > merged.=20
>=20
> I'm still not for SCHED_OTHER tasks being allowed to delay RT or deadline
> tasks, even for 5us. But if that's what Peter wants, I'm not going to nack
> it.

I tried to explain in
	https://lore.kernel.org/all/20250206150152.-5Fauhtm@linutronix.de

that I don't see how this delay could work for PREEMPT_RT.

> Just keep it configurable so that it can be easily disabled, as I have no
> intentions of using it.

same here.

> -- Steve

Sebastian
