Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475052E630
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771204; cv=none; b=hlbcU89Qnk7pscxf65tsFY62BK5alrPqhrfpBHcWV5OI44A9PQhdeg75BgGIHGH70Sv2LhIMrNbOJJgezkcOiZStRa3BMEcr+MCvLYU+SCFJP0AxW/zlqm3q8rmSk29zgfG/2glmaOIwWumCJLMOsdGaPs35BMPZPPn6jaZQEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771204; c=relaxed/simple;
	bh=7ENWU273P4TzxOJ+SBH2+4yYoiGM4HCwP5SxFrfryOc=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jUWiAFBB7snHrPllhECGk5J3aedvj0lZVtu2NRcaroCzlkWNbYtqi1jYndjIWyKJcROSQBZ41Hdl9ty/vjWthExQpP0MRJp6NJl2UdhA1ElIfMGuqjH4qhtT2BtgoOeEHTVy78F7GZMpCsdlR7eUJyqRrJxlZZplAqJNfXuTDss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MsySpz/y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rZcr0U14; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MsySpz/y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rZcr0U14"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750771201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rqu1VmKUsSXUk4N8ocSLjCb043Le6kxV5qzQ2PImkK4=;
	b=MsySpz/yUSlr4OrZztYsDzYZ0/s4l5wYp/MpKK0Fv71daoHoj4LJOBTzELivAa0LPAbKbb
	W9uoSgE7KCGWXe3umwManN5QueEyJ5q5RgxLW7djevxv4+BQrhteTULsJ0+BxRwNy+n9l1
	zq9gXs2L971esuEKLxkh40WeFyA1nn15UmnGPcwJEA0qmYUrgqg+bH3PVNweKoNFYPbdiv
	HiqIFz7QuUeYMWVJUVzmJyCV4GkLgIC8MJcHbfqWF6UCJPAEnE4RyRVgFl7QHwRCKsgJRf
	653HlEjm1wL0J0SwH+MI+DpJOzrZvrW8L7PDnBA168IGAzr8PH6joqEnII3TSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750771201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rqu1VmKUsSXUk4N8ocSLjCb043Le6kxV5qzQ2PImkK4=;
	b=rZcr0U14Y2MG2nvL7VxtXxGYAdgQZl0SAMT2mVzOWW7gQdy3EqNHhOl43tKl6qCJpSWuI2
	xg2Rf0bKaHFmsYBw==
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
In-Reply-To: <b33dcafca895da1d9c64a7d6ab771952a932e579.camel@redhat.com>
References: <20250530142031.215594-1-gmonaco@redhat.com>
 <20250530142031.215594-7-gmonaco@redhat.com> <875xgqqrel.ffs@tglx>
 <b33dcafca895da1d9c64a7d6ab771952a932e579.camel@redhat.com>
Date: Tue, 24 Jun 2025 15:20:00 +0200
Message-ID: <878qlhnunz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24 2025 at 10:05, Gabriele Monaco wrote:

Please trim your replies. It's a pain to scroll through 160 quotes lines
to find the gist of the mail...

> On Fri, 2025-06-20 at 19:00 +0200, Thomas Gleixner wrote:
>> > +	if ((!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
>> > +	=C2=A0=C2=A0=C2=A0=C2=A0 cpuset_cpu_is_isolated(cpu)) &&
>> > +	=C2=A0=C2=A0=C2=A0 housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) &&
>> > +	=C2=A0=C2=A0=C2=A0 tick_nohz_cpu_hotpluggable(cpu))
>> > +		return 0;
>>=20
>> Same nonsense as above.
>>=20
> tmigr_cpu_available is called at boot time and is applying also the
> boot time isolation parameters (tmigr_isolated_exclude_cpumask is only
> used by the cpuset code).
>
> Now let's assume a machine booted with the arguments isolcpus=3D0-3
> nohz_full=3D5-7.
>
> Without checking for tick_nohz_cpu_hotpluggable() here, we would not
> set the tick cpu (0) as available at boot, ending up in the unwanted
> corner cases discussed in the v5 of the series.
>
> I could remove this call here (which is mostly redundant after boot)
> and enable explicitly the tick cpu in another way, but this still seems
> cleaner to me.
>
> Does it make sense to you? Is the comment in the code unclear?

It does not make sense and the comment does not change that.

The point is that tmigr_init() is an early initcall which is invoked
before SMP is initialized and APs are brought up.

At this point CPU0 can neither be isolated nor nohz full for obvious
reasons, no?

Thanks,

        tglx


