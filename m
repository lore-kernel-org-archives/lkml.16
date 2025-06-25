Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A7C262FF5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857372; cv=none; b=JGC+Gz70QhRoVnKWnLTB7MU5cJjK9W/nuMjPs6i8b+DfKcsSvNjUyg7csoyAnd8yR7hZVN5aaid8iN4bu608MRUePtjSfPMbT7e53R9bFHHPkw2sA67ITUZb3PAnzhs+ECiAJSFAHmQ3795+hagjlXaxkrcn4PeTUZxOq364mW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857372; c=relaxed/simple;
	bh=QHCB4urdBJBIlkKBAKRhwgC29BeTmZl9cL0tpXDUwa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/0Ge30WleipMUfvdVHMZvMJt6//QLfKQApQr3K0wxA5u4wvCNSp+gJRQvpZNGkhoQEeqDevI/AChZaOzwHHciti51lF5ilX4y/C066e+YoKcZYvZvrnfDaa/Q9X8poikTUwBQnpSeeaKqGk2Q9fWDqHT7OV8x9oPwfYWJ/6B2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/VBU0pG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/VBU0pG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5159AC4CEEA;
	Wed, 25 Jun 2025 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857371;
	bh=QHCB4urdBJBIlkKBAKRhwgC29BeTmZl9cL0tpXDUwa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/VBU0pGHjMKELm3AvbBCE/4TmjsNJhGDH/8fkYu08vkCdNYlEyY5S5q+e+qu1Smd
	 W/P5zKhihcUlB13sB+VvLTNWUv+jR4MN9eBhfSDfHqIbPAoq8rqEPsXENA6F6DV2vK
	 KhyKl3eeEi4XCfDt3+NwKm9f5rJnUihDj8kHMjd1csOjadQNMcG1P98St2x6uRlDK+
	 pVSnkLL1CigJOEKcIbgxqyjw991d49tyq4Cu8Af605hZy+YvBfjDkXFCyvJSj2GkfV
	 5OP59OjahJPMX25j/EiLUERqFjVRigUuI01v66nNEIBJ6YZuo6gqQGrLr0XyyN7BJl
	 l3gvX/Ce46a9Q==
Date: Wed, 25 Jun 2025 15:16:08 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
Message-ID: <aFv2mLdH3lNHdKtp@localhost.localdomain>
References: <20250530142031.215594-1-gmonaco@redhat.com>
 <20250530142031.215594-7-gmonaco@redhat.com>
 <875xgqqrel.ffs@tglx>
 <b33dcafca895da1d9c64a7d6ab771952a932e579.camel@redhat.com>
 <878qlhnunz.ffs@tglx>
 <1bc41a7a5bd46860318b0417fa27121758f28448.camel@redhat.com>
 <aFq7rqbHugtiWF6Z@localhost.localdomain>
 <87a55waylv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a55waylv.ffs@tglx>

Le Wed, Jun 25, 2025 at 12:45:32PM +0200, Thomas Gleixner a écrit :
> On Tue, Jun 24 2025 at 16:52, Frederic Weisbecker wrote:
> > Le Tue, Jun 24, 2025 at 04:06:41PM +0200, Gabriele Monaco a écrit :
> >> Right, but as far as I understood, the first call to 
> >> tmigr_set_cpu_available() happens after the isolcpus parameter has been
> >> parsed so we know at least cpu0 is going to be isolated.
> >> 
> >> On my machine it works reliably this way. I'm a bit lost in the init
> >> code but seeing housekeeping_init() before rcu_init(), which in turn
> >> should be required for some RCU-related early_initcalls, makes me
> >> believe this order is guaranteed to be respected.
> >> Or am I missing something?
> >
> > Right I think you need to keep those checks because if CPU 0 is isolcpus
> > and CPU 5 is nohz_full, CPU 0 will become later the timekeeper and must stay
> > in the tmigr hierarchy.
> >
> > OTOH if CPU 0 is isolcpus and there is no nohz_full CPUs, then CPU 0 doesn't
> > want to go to the hierarchy.
> >
> > cpuset isolated partitions are different because they issue SMP calls whereas
> > isolcpus is defined on boot.
> >
> > An alternative for isolcpus could be to make a late initcall and do the smp
> > calls from there just like is done for cpusets.
> 
> There is zero reason for isolcpus and nohz full muck to be
> active/evaluated during early boot. That's all irrelevant and just
> complicates things further.
> 
> Can we please clean this up and make it a sensible design instead of
> duct taping new functionality into it in completely incomprehensible
> ways?
> 
> Especially under the aspect that all this should become run-time
> modifyable. That requires a run-time switch mechanism anyway, so the
> obvious design choice is to utilize that run-time switch late in the
> boot sequence to set this stuff up before user space starts and leave
> the boot process alone and simple.
> 
> The KISS principle applies here fully.

Ok so the late initcall should work.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
