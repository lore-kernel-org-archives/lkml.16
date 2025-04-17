Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9494622687C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904097; cv=none; b=OJe+d5CXKxBa66B8ndaDZ+7GVj6U3f9cQIT+HQmPo5kdZsrHL7Bkh/tSQhlRgphI8BkzdycPXfSxWCwJi0+HAs7WeXTEQyMIFldukjxxrEqE28kvkwmL9XTZrWLJfYDcs7wVFL5ChnaEa5IoIrV6VLqwLpD+OczkBsMrobL26ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904097; c=relaxed/simple;
	bh=BYunUdQfrerhTg99uRvTw3WSL9HPwsl6RhtMEvLyqv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uumXR30nmNEsj2yBVZ1Dp/fBId6Hw2dcwxhszj93oyh5s9T6Gt1x+3DN/5Q0IUU1fa518XnEitgFapZDyikv6K5x4SiON62Sax++7RcBsULARfz8fwjcRrZejlVLY3UIkjk2GsCpKYhBXS3fq8w9S/+sCBREfHJ2OiFiNl4rZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JBWJzhZt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=37dHej4V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JBWJzhZt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="37dHej4V"
Date: Thu, 17 Apr 2025 17:34:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744904093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5BGVo1YhDlDJikVWAUwBr+O+QKov40WrC9YM1Ibwhug=;
	b=JBWJzhZtm6QvJsEBkJUCOI6YL2CFRQ5Kc4yr4YyBp1wHJa9iRqJOpczO2NUu11Dy97gflb
	J/SQOLps7jLdL/Q+TeShgoi0qZLA3LzyUKzCZ6aGxWGfcXB+nuQFT7EMnRynsWMsnWxnH5
	0MD+11AXFWCWgAfNUsKRkcfsZjriDfyplWefMeciibH1axv7Tta1duvUx7oIW2eecq/4RN
	RvtHn3OhsxLV3D/cCoWMHLsxiQ6lqXkWKgJRJ8BdHh0sc4uHOK3ASXXsIpOc2T2FCkzGGt
	STht3HTDjhyOyOK9Tme4T1eOMie2cLU7vKWqEntPqxt82bWJ62omNMxxwLqVAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744904093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5BGVo1YhDlDJikVWAUwBr+O+QKov40WrC9YM1Ibwhug=;
	b=37dHej4VehyJs8Ud06K7ACHbp9zlkVivzAZhwxBrlA9TWIvLYjXcJYrSPl2/gzUhbKgriO
	uPLySRky3xuFGHBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v11 15/19] futex: Implement FUTEX2_NUMA
Message-ID: <20250417153451.b50sWh_Z@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
 <20250407155742.968816-16-bigeasy@linutronix.de>
 <20250407165224.z0FmVaXX@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250407165224.z0FmVaXX@linutronix.de>

On 2025-04-07 18:52:25 [+0200], To linux-kernel@vger.kernel.org wrote:
> On 2025-04-07 17:57:38 [+0200], To linux-kernel@vger.kernel.org wrote:
> > --- a/kernel/futex/core.c
> > +++ b/kernel/futex/core.c
> > @@ -332,15 +337,35 @@ __futex_hash(union futex_key *key, struct futex_p=
rivate_hash *fph)
> =E2=80=A6
> > +	if (node =3D=3D FUTEX_NO_NODE) {
> > +		/*
> > +		 * In case of !FLAGS_NUMA, use some unused hash bits to pick a
> > +		 * node -- this ensures regular futexes are interleaved across
> > +		 * the nodes and avoids having to allocate multiple
> > +		 * hash-tables.
> > +		 *
> > +		 * NOTE: this isn't perfectly uniform, but it is fast and
> > +		 * handles sparse node masks.
> > +		 */
> > +		node =3D (hash >> futex_hashshift) % nr_node_ids;
>=20
> forgot to mention earlier: This % nr_node_ids turns into div and it is
> visible in perf top while looking at __futex_hash(). We could round it
> down to a power-of-two (which should be the case in my 1, 2 and 4 based
> NUMA world) and then we could use AND instead.
> ARM does not support NUMA or div so it is not a concern.
>=20
> Maybe a fast path for 1/2/4 would make sense since it is the most common
> one. In case you consider it I could run test to see how significant it
> is. It might be that it pops up in "perf bench futex hash" but not be
> significant in general use case. I had some hacks and those did not
> improve the numbers as much as I hoped for.

Since I'm cleaning up: I'm getting approx 1% improvement with this so I
am not considering it.

Sebastian
