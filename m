Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9152040B3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296370; cv=none; b=coyOX/UIg5OVFRCHaZia3Jfst8cFpvJmYuyXQH6Ao9mUQC5n8h168RHGvsqS2gadWltSU9XAYu9LMVO/1JTys2QiNrG4sC9gw8+DjCfCJeHTHmHc8HTN9x45ovFKvXF61Z5PpBwgTBENFUaXsPLuGASDkGNsfgWmU7vyLwU4S28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296370; c=relaxed/simple;
	bh=A5u1OXpddDXw8dFE3KStrVezuKW78cAqqwtK93ipYYg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QLiBAKGq7ykCh3/YcHnvzwNhjs4yGsJEXav/e+fYrnwVkrMPCdd70nrq4IaXn1NAcr1dHpr9sOeIs06zoIgLrb8liZ0S2gAjGZP3sGl5qfFAJc9GCnZf/3mtzIQBQDriapxUnvLs/164IGPbl03It0o5mDK8s6Z/qVM9LM8QKCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YpbJjuTv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WoQa50W8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YpbJjuTv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WoQa50W8"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744296366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7Hnmm43mJBxOzthbNjlhMHrNAS8HO44ebd7LLHiOkA=;
	b=YpbJjuTvrBsOkElI8Hx7aq5nQmjBJ06L2hG0P5GAV4NIzi8lDTfcv3w+fkEqPOC29FZP3a
	7vsaJX+iehYAUNUzbpZSvBrOxBh9GFHN5XfGeLwYWm+8e12OHwGdZv6tcuDK8UPVLGptJi
	0IK+D4escogqyemnZqMMV8q39EWFEA5oAejXQ1maDMy5kYA+nbdMkJwXONfNrb/7ATUQtM
	FaCeYsBywYNr0Pc6fBap/u8p/sLU/Mfe8Da2DOWfa4Cy0LRhwx+vIlar9vYtWfW5XJmJ62
	ZytCI5e/eqRiq8z++yhVuU/BAu6LLp0Pewg28IiPE+DwjG18wnbKoM/tjPs8QA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744296366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7Hnmm43mJBxOzthbNjlhMHrNAS8HO44ebd7LLHiOkA=;
	b=WoQa50W8e0f7cqEmLR4sQSBAg+JsPz9iwfmpZ3VLNHfXqEPh3xjNx1/KAZTEZBU3NxP2Ae
	CuubCFc6uBR64UCQ==
To: Frederic Weisbecker <frederic@kernel.org>, Gabriele Monaco
 <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
In-Reply-To: <Z_fTmzdvLEmrAth6@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain> <87wmbsrwca.ffs@tglx>
 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
 <Z_fTmzdvLEmrAth6@localhost.localdomain>
Date: Thu, 10 Apr 2025 16:46:06 +0200
Message-ID: <87semgrs5t.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10 2025 at 16:20, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 03:56:02PM +0200, Gabriele Monaco a =C3=A9crit :
>> On Thu, 2025-04-10 at 15:27 +0200, Frederic Weisbecker wrote:
>> > But how do we handle global timers that have been initialized and
>> > queued from
>> > isolated CPUs?
>>=20
>> I need to sketch a bit more the solution but the rough idea is:
>> 1. isolated CPUs don't pull remote timers
>
> That's the "easy" part.
>
>> 2. isolated CPUs ignore their global timers and let others pull them
>>   perhaps with some more logic to avoid it expiring
>
> This will always involve added overhead because you may need to wake up
> a CPU upon enqueueing a global timer to make sure it will be handled.
> At least when all other CPUs are idle.

Which is true for the remote enqueue path too. But you inflict the
handling of this muck into the generic enqueue path as you have to turn
a 'global' timer into a remote timer right in the hot path.

When you enqueue it in the regular way on the 'global' list, then you
can delegate the expiry to a remote CPU on return to user, no?

Thanks,

        tglx


