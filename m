Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D8212F97
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745222; cv=none; b=KQy6pflGTeE+2uRPx0b7Fsup5lXVimuRafWrBTdLudD6JsIWHnwrhCnPOqwc9kzOo0kJb6rXtDmyiXLAvFQd9UIneNtm85BM0eyn8EeOR+Fn0CKL9X9t2dYl9WlfwaA9EIt3PFopNaXs4UkoTUjgAqA5ethNWCfHOeAzNizItew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745222; c=relaxed/simple;
	bh=TF8Vmh8LkLITaUeYWBLmgw2YaPLJqdX7GQ2EmZxtG90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2ieG10quSDKxdEl/BJ16NbFgDr87P+yk469eB7dLTQfRfV5tOq0z6TgAt54kwqO6WH6WUrgo9zBn/5K6IX3GQduBSTKH5mbDErejMxzorGCOApEdpQUjK7BmSxeVj53KflJe4WEm2+hhBRnDBKLzEdoAdKLALE8hp8pzopCwxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LF9D+oDP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wQmb/FH7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LF9D+oDP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wQmb/FH7"
Date: Wed, 5 Feb 2025 09:46:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738745219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TWnQhEzppyo2s20CCYhmE147/yA5tbxR4dbIOWPkEXo=;
	b=LF9D+oDPSuKi6w9CjpQ4tELjQWete+RSxmHGIk/Y7rpQKYfll7Hj+0Gp+peeC7CXjaZeJ4
	jF/Kwl7U/yku0PO4bEij27Hai+3Mo3qhdyxBqK0tBnnjEivYDUNheU1CZO8PQg8aHFuPsO
	Fgqs8/36pfZdVMPupP+kSrcA8pVquHiaxrs1NVFQdi3U82HTll7RVRmltrOY23w8Illi++
	7Srd2XcKuvyLANl1nZvjruX75x3vC3eXife0L7X2DBE3Hti6ydtRmum1aRGh8WDn3J+Xms
	AwY87x+KB8BZfoAe//wQg4FTTYIO/2WBbjk0HCGP1F9qk2Dw7WzYVFLnIaUCkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738745219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TWnQhEzppyo2s20CCYhmE147/yA5tbxR4dbIOWPkEXo=;
	b=wQmb/FH7JiTQxwwe27bwFWjhD8q1nukxTqXcs3m7yModeqih34TGOmZrEskZm9fk3G0qHw
	9ZNKdDNgfeKOW6DQ==
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
Subject: Re: [PATCH v8 00/15] futex: Add support task local hash maps.
Message-ID: <20250205084658.iUmkP3_Z@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250204151405.GW7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250204151405.GW7145@noisy.programming.kicks-ass.net>

On 2025-02-04 16:14:05 [+0100], Peter Zijlstra wrote:
> On Mon, Feb 03, 2025 at 02:59:20PM +0100, Sebastian Andrzej Siewior wrote:
> >   futex: Decrease the waiter count before the unlock operation.
> >   futex: Prepare for reference counting of the process private hash end
> >     of operation.
> >   futex: Re-evaluate the hash bucket after dropping the lock
> >   futex: Introduce futex_get_locked_hb().
>=20
> I must admit to not being a fan of these patches. I find them very hard
> to review.
>=20
> In part because while you go stick _put() on various things, there is no
> corresponding _get(), things like futex_hash() become an implicit get
> -- this took a while to figure out.

There is one get in futex_hash() and multiple puts depending on the
context usually after dropping the hash bucket lock.

> I tried tying the whole get/put to the hb variable itself, using the
> cleanup stuff. The patch is pretty massive because fairly large chunks
> of code got re-indented, but perhaps the final result is clearer, not
> sure.

=E2=80=A6 Let me find some time and dig through this.

Sebastian
