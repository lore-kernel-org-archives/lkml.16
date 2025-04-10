Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E9F19343B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290952; cv=none; b=sVkUcQApQ9/pSJXQZ1tBw9cqG2PqrIgNU1jtJnWP2qyWrL9Pd7YPWyGocdGQdEoAFysOASGSlH5FEZDDsvY9+abe+oqaJWxUOjrgx0MR8f7dLmn0vSSHXb6EziPSqFXI6ehCdw65lmJlN7qzeSkfhfJP+nWi+eMGpMyFZdo3q5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290952; c=relaxed/simple;
	bh=RfpFwOtcA1qvw8C28siFaHxStABFOSOiQ6DwUgxTZvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O7gTr5vWMyJEdNtCHmKzzH0EnpSiLoto64p4rBcqFip0Haib9may4GZMYfIZZcpVjZXF7LZXk0r1l2ZGt3DuuTGl4njWSOqODEDwzS74Dj59cNNcGf63inmt7rA0hk7cClHuyXdXy5a3rXhcm0wLGrPhSOJA0Nm2soFJOOnxLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4SclhWrP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6iAlA4pj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4SclhWrP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6iAlA4pj"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744290949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ysS/RpeiUdnIEsB3iIUSjM3Nu+3C80KYWTrvERpIetw=;
	b=4SclhWrP7zdqUExWGDWfG23Kamky0qJ3kFl+DhPmQzzjXqYWjdYvidCoL0SDtc2gwZFNGY
	3k5e8hQeIU0zyn9QSuVOjIZQRlbXfj4iLvyCGxGDoxTpBE+4JoUCR6I2fUNCI5Bsb921hU
	4RGy2p5JuLcqpQlOzMEkwnHG+834E8momrX/rmMTu1ARmOk1Hu3uk5woqoBqQZeVeG+IW6
	bc45NSy8LVJuLOSMmn9XK0l9cyAhQ720X90nOB8lz9IhrV6U77JmWdM0qP31lcyiMXsPMk
	a8bil6tQoGCqYLidTl0mxa0gaYR/BMYY+iqW29Oi9zluY8/Ws/DbFCRzfWJ/gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744290949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ysS/RpeiUdnIEsB3iIUSjM3Nu+3C80KYWTrvERpIetw=;
	b=6iAlA4pjfAbMVbaphpHgEboAYlcEgffLRcUl2QErxIgHDz5jMYAhvjM/ZmDRqyExNwJkKA
	Futr70QLHwJEeDCg==
To: Frederic Weisbecker <frederic@kernel.org>, Gabriele Monaco
 <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
In-Reply-To: <Z_fBq2AQjzyg8m5w@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
Date: Thu, 10 Apr 2025 15:15:49 +0200
Message-ID: <87wmbsrwca.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10 2025 at 15:03, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 12:38:25PM +0200, Gabriele Monaco a =C3=A9crit :
> Speaking of, those are two different issues here:
>
> * nohz_full CPUs are handled just like idle CPUs. Once the tick is stoppe=
d,
>   the global timers are handled by other CPUs (housekeeping). There is al=
ways
>   one housekeeping CPU that never goes idle.
>   One subtle thing though: if the nohz_full CPU fires a tick, because the=
re
>   is a local timer to be handled for example, it will also possibly handle
>   some global timers along the way. If it happens to be a problem, it sho=
uld
>   be easy to resolve.
>
> * Domain isolated CPUs are treated just like other CPUs. But there is not
>   always a housekeeping CPU around. And no guarantee that there is always
>   a non-idle CPU to take care of global timers.

That's an insianity.

>> Thinking about it now, since global timers /can/ start on isolated
>> cores, that makes them quite different from offline ones and probably
>> considering them the same is just not the right thing to do..
>>=20
>> I'm going to have a deeper thought about this whole approach, perhaps
>> something simpler just preventing migration in that one direction would
>> suffice.
>
> I think we can use your solution, which involves isolating the CPU from t=
migr
> hierarchy. And also always queue global timers to non-isolated targets.

Why do we have to inflict extra complexity into the timer enqueue path
instead of preventing the migration to, but not the migration from
isolated CPUs?

Thanks,

        tglx
