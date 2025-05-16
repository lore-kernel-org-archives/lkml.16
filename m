Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748BEA32
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398061; cv=none; b=CjVz8L9+PyRSE9aQ8irJMn7ZB1f4OMEcyonCDitkKp0B6A/T4sbg9ryIR9lFkiTjWg/dmmkV9wlQR5gnB84Q2eZN7JSkt4Q4kQ/5taK6nbKUWT4iFbhXvGeJcib4wnNirBi55wlcuYb5HnhRFMQbFfDr02QxLffmAhqrq5/AavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398061; c=relaxed/simple;
	bh=SgN2Ac3yeQReJdlDrCGVgU05iL5kJyNzfSD5RAzLByo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZpsjuaQyyw+S/AI2IV0f2pbwbQfI75zL3SGvVslviHBvk8MK8BVZ59NsDlifjjNYi09MDYBK5BbQBpgq1/G8lBgjiVwUeNu4ynaHsUFtbreDMCtmO3TgNAp5ovss5Lf8zuMNQ3/gZRV+jnYeuul/NYZj5cxHWz0giagB7AJFRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OVP4SKXM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xW3HS3xe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OVP4SKXM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xW3HS3xe"
Date: Fri, 16 May 2025 14:20:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747398058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ozukXh+w/FU8VHzAqw13J34aPsQryjXLpmUX5nxY204=;
	b=OVP4SKXMqHfFPzBagwk2/KSOQCgIAhBdhl2OQRvcdwqg6gDwSG2FzkfGgSvhJClNnANVs/
	qmHudOHmCjdmLwoaqS/ks/SBwxzyI6LMjPd3sQ6ptauPYMrXSJ6vPS5U4aYjhcgeWBo/1n
	AJbP+sgdsEGKKOqZmR85P2/xBwpDYx1BeUjunE0eMI5FF3TIiYIaOLiucg6rKdDNEALC0c
	w4mfdEBr2o1EmETOVldtOBpqSSYygE4D9T/y2loKdQGvP5ve+VBHDDgKCPmOJwmxMRog6F
	TCFxS3shAqx3cq8Ud0RqKlD7aPKni0vGgduF42eGjIpqv2l6zzJyIkrQ7XakWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747398058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ozukXh+w/FU8VHzAqw13J34aPsQryjXLpmUX5nxY204=;
	b=xW3HS3xecOoPbat1esB32r5Zan8RkxVOpflejIaJ9crIDD9yz6ogRY2sGOzyTJZWEEGVqr
	pVUlgyizS7r580AA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 05/21] futex: Create hb scopes
Message-ID: <20250516122057.qAU9aPn3@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-6-bigeasy@linutronix.de>
 <4b41236e-b4dc-43e1-922a-4bb9dcc318aa@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4b41236e-b4dc-43e1-922a-4bb9dcc318aa@igalia.com>

On 2025-05-06 20:45:06 [-0300], Andr=C3=A9 Almeida wrote:
> > --- a/kernel/futex/core.c
> > +++ b/kernel/futex/core.c
> > @@ -957,50 +956,54 @@ static void exit_pi_state_list(struct task_struct=
 *curr)
> >   		next =3D head->next;
> >   		pi_state =3D list_entry(next, struct futex_pi_state, list);
> >   		key =3D pi_state->key;
> > -		hb =3D futex_hash(&key);
> > +		if (1) {
>=20
> Couldn't those explict scopes be achive without the if (1), just {}?

I don't see why not. I guess it looks nicer that way.

> > +			struct futex_hash_bucket *hb;
>=20

Sebastian
