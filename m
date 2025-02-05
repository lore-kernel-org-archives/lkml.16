Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF00212D69
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741884; cv=none; b=LhlBedQbbz+mRSwHaShw1PNqGrsNSoyTM/ICicEX+rpKuTGuhc27dOyIfOHzFDgKsqrCmoJUJdJAwIk7iLVEL2RZ4YH+06LrSSRXQu5p2jaz1Pm/qwKKyhT2ozuhLZp6SM32T5rm+juGJRHC8fpRg88Fl+yYS7X/yh8xUGSSsxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741884; c=relaxed/simple;
	bh=P6JoyISIkvGDyKiTWwNPWAcb6fJkTKsZPWv7BrszMfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thnnHomuhc26mPIAse3AAVwNPXKg65hZLZvm+wg9EbsvILiM15dcC/qtXMbBouQjWOLcmiT/yedf8rN/IdlNT8cLf9zsk+QxCQg7jQvnoJZ8q9aCA6l3FXhCARFKoiz9xyatYhwdZNtjPcjf9/DQE1hTygxH+Q8GmfK1+1sciNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uOqdUD0+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KU3TFHb/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uOqdUD0+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KU3TFHb/"
Date: Wed, 5 Feb 2025 08:51:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738741879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtzaBZJLMbHcpq1mgREbqn1bR5qCQ0E5Zmu8KNrabus=;
	b=uOqdUD0+WePf6aLT1DTsH68K24desYhN4BcQZ7trSwJ0EGaQ5RlsiGSRcIpP4n6X5efJxB
	ZfyqOTfF4Z5Vm7qQ0r4mJwyxzvvCXy7o+ylMV6UpZgz53ihfwIUFtfNXNcOCkXnTYT++M3
	OKIxtfgVe4V02znXM3mbqXHtnjT8IyMzbyb6ztIeOnJlKzQyl51/zdG1+jgqeXHaMuzdfw
	seO6civeA9SISwA+U0ageL4krKVZlM7mfLnQswefuhpzrxU20Ai2iK019jxo56X3O+yj6Q
	1YkwhbV/RdIiRWXd4t7A644vFqzdUu4J5DOKiykkOPSm9gnY+So8VGVB6XHoRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738741879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtzaBZJLMbHcpq1mgREbqn1bR5qCQ0E5Zmu8KNrabus=;
	b=KU3TFHb/OK320PF+9KxCdUncvUOX0cFS+nNeOkAXB50oXQ+i3iLnOwjNEGOxAoRqTejsLc
	OUhGfdEOVWOFuPBw==
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
Subject: Re: [PATCH v8 06/15] futex: Move private hashing into its own
 function.
Message-ID: <20250205075117.Qho6oGnQ@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-7-bigeasy@linutronix.de>
 <20250204093402.GR7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204093402.GR7145@noisy.programming.kicks-ass.net>

On 2025-02-04 10:34:02 [+0100], Peter Zijlstra wrote:
> > index f608cd6ccc032..fdfc3402278a1 100644
> > --- a/kernel/futex/core.c
> > +++ b/kernel/futex/core.c
> > @@ -131,14 +143,9 @@ struct futex_hash_bucket *futex_hash(union futex_key *key)
> >  	u32 hash;
> >  
> >  	fhb = current->mm->futex_hash_bucket;
> > -	if (fhb && futex_key_is_private(key)) {
> > -		u32 hash_mask = current->mm->futex_hash_mask;
> > +	if (fhb && futex_key_is_private(key))
> > +		return futex_hash_private(key, fhb, current->mm->futex_hash_mask);
> >  
> > -		hash = jhash2((void *)&key->private.address,
> > -			      sizeof(key->private.address) / 4,
> > -			      key->both.offset);
> > -		return &fhb[hash & hash_mask];
> > -	}
> >  	hash = jhash2((u32 *)key,
> >  		      offsetof(typeof(*key), both.offset) / 4,
> >  		      key->both.offset);
> 
> Humph, this is a lot of back and forth. Maybe just do it right once?

I pulled it in little steps and I replaced it step by step.
I stayed with the "smaller" jhash2 because it is less code. We might do
something like hash_long() which is even less. I had numbers at
	https://lore.kernel.org/all/20241101110810.R3AnEqdu@linutronix.de/

But I can pull it in as suggested.

Sebastian
