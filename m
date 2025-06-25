Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C372D6631
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848335; cv=none; b=Q/uRuGd/pLQqIp9hsFUJ5eyIloiP0B1Fsn2VrbI6kOAFYoX4GDjov4Fn42BEtM9Wq4/fwxLuWrkCF63iej1X3WPuNBCst7yPGnUAoBDadcukqNTjMwXOkgRcyPCDqGrZxo9DQ5/KbGUAOMhd+okAKKcGNNZ1oPE04h+a5+sQNEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848335; c=relaxed/simple;
	bh=NXguTMKTYKcS9+04TH+RE4WvIQZsBUqDVg7o4aWiryo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pUv+fsJwjeWlTChEpmRiZDU9s5rSmUI5QfJf/Rd0BS6HHxH08mU07EwoxVDICw071rokC24nYRob9gE9aKFUuwXGsitzbwJ/5O6kmUa7erY1xCXTXyIBCPQpxQjnYetTuxxPEJH/Rl/xxnLv3N4wW6PMcxPWBQQwwntNuCNbGEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bNaR+Bgx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k47FKYd6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bNaR+Bgx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k47FKYd6"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750848332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSQHwp5JO1fSK3Q8TWqnvRLBHvmX8AI0vZCMeI3GeWw=;
	b=bNaR+BgxSjqDs5ZQM8/mzRAS037UNP8GkxJGgny1bgLa63MZC2QdFJvRDnuM3NIAcucd/7
	IyhLH8MGFitupMLjrcvNnRGs889l6PTrsthvBuNtzyOj+/APA+ks3svX3BryVxBPTHo944
	Nf+qZ0elLXdw6+xcsjxTBdncoYx8mNt+VTyy0Y5gwmVVqq4Qy5qupd10gIHQnoCVGZLwI8
	6A54YwXzT6qykyfK6/Ut9osRZJFFsPMUF3VzI+XPvarB/ZfcybF5ut/RWYxXM+qnFWdaNO
	WYQgp2fVVo4YSwzK5v9z8U6AsxB7d5yonCunMpMoD81rs38yBQ8ZuRuqVpqDOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750848332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSQHwp5JO1fSK3Q8TWqnvRLBHvmX8AI0vZCMeI3GeWw=;
	b=k47FKYd6aiPk0L186WFLhizslUUE8thBTTKW/eljrHgSHP3xPkc7pOv7RtLQN+Q8YOxKAf
	wlAMgkHd2MIyKkCA==
To: Frederic Weisbecker <frederic@kernel.org>, Gabriele Monaco
 <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
In-Reply-To: <aFq7rqbHugtiWF6Z@localhost.localdomain>
References: <20250530142031.215594-1-gmonaco@redhat.com>
 <20250530142031.215594-7-gmonaco@redhat.com> <875xgqqrel.ffs@tglx>
 <b33dcafca895da1d9c64a7d6ab771952a932e579.camel@redhat.com>
 <878qlhnunz.ffs@tglx>
 <1bc41a7a5bd46860318b0417fa27121758f28448.camel@redhat.com>
 <aFq7rqbHugtiWF6Z@localhost.localdomain>
Date: Wed, 25 Jun 2025 12:45:32 +0200
Message-ID: <87a55waylv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24 2025 at 16:52, Frederic Weisbecker wrote:
> Le Tue, Jun 24, 2025 at 04:06:41PM +0200, Gabriele Monaco a =C3=A9crit :
>> Right, but as far as I understood, the first call to=20
>> tmigr_set_cpu_available() happens after the isolcpus parameter has been
>> parsed so we know at least cpu0 is going to be isolated.
>>=20
>> On my machine it works reliably this way. I'm a bit lost in the init
>> code but seeing housekeeping_init() before rcu_init(), which in turn
>> should be required for some RCU-related early_initcalls, makes me
>> believe this order is guaranteed to be respected.
>> Or am I missing something?
>
> Right I think you need to keep those checks because if CPU 0 is isolcpus
> and CPU 5 is nohz_full, CPU 0 will become later the timekeeper and must s=
tay
> in the tmigr hierarchy.
>
> OTOH if CPU 0 is isolcpus and there is no nohz_full CPUs, then CPU 0 does=
n't
> want to go to the hierarchy.
>
> cpuset isolated partitions are different because they issue SMP calls whe=
reas
> isolcpus is defined on boot.
>
> An alternative for isolcpus could be to make a late initcall and do the s=
mp
> calls from there just like is done for cpusets.

There is zero reason for isolcpus and nohz full muck to be
active/evaluated during early boot. That's all irrelevant and just
complicates things further.

Can we please clean this up and make it a sensible design instead of
duct taping new functionality into it in completely incomprehensible
ways?

Especially under the aspect that all this should become run-time
modifyable. That requires a run-time switch mechanism anyway, so the
obvious design choice is to utilize that run-time switch late in the
boot sequence to set this stuff up before user space starts and leave
the boot process alone and simple.

The KISS principle applies here fully.

Thanks,

        tglx
