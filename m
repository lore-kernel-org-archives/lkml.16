Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF7128F93C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290499; cv=none; b=mMCZqAJdQdLccba010mQSeLQ8Fy3Db9B0fdyc06YGwhn5GkJylYap5pZlaEy85fWyIbLJdRpYC+7d3XkMVG5AJnibB2XzD7A3LMs+C+bj7qccBwpmPPwa2HLw5+9sRMWSserR6UdJjYMCP0CRrfgAlqHppkLkZiupsjN8vyNoME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290499; c=relaxed/simple;
	bh=0ZnD44O+6FmvMkohMWjHIti03VRs/h8FNtHRZpD6yYA=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uybepU0QvTlvVjmOUseDmU+D1mwMs2EjOgEu0H0uznD9HDDDO9CT9bhG3RxNG5qskfrDl+CGhpijAAJCeC0AYFaR0PgnASmDD0hXz41YG3Z+34fDSHwTTBl9ktQr3YvfFzUJ+j8O2icpRJ2Ch5c4968mAqw+3SBFZo8JuiCnv+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uNh/HsPp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hjgFDT5d; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uNh/HsPp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hjgFDT5d"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744290492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tJFS+kzhID4GwXUUmLhQYQQToOkIgC5Zo1yEi+GUsHU=;
	b=uNh/HsPpRIHwPn9G0TqnUh7rPF4+VcKWFZ6Ll3cTNnRMfYZ9pjMfTLS3ZbKz9Q80AHtHDx
	5xtTu8XJZ4pk7ot2yp0lRQu6b2VzGOLkUpqvCUDKm4VMU01BoI2kuBznWCgT/YKaL5tH2P
	MIK7Ml6EW29YUuNk/Siilpq/E2V6Nv4QRLULDba8hBTaMk+/Jy7SYPN7B9V/Iv5d8aVNEz
	b+EL9n/oierHQj5uXUGANT+ILhkhy6aasj8i84mI7wiCptdTkGOK/Ar/kno5ORTHZD5Goy
	2G4HahypRw9Z9fb0ZHJTiO/aW4d1Lz4En14sb6N5NMXuxGg/+j/4oHjXYKwkaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744290492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tJFS+kzhID4GwXUUmLhQYQQToOkIgC5Zo1yEi+GUsHU=;
	b=hjgFDT5d5mb+isyuwgV0gmly4oFEC4cy1yyiy2N5tnOYAG7qbaqnubxpQyY8WXWLKP8CJl
	9diwC8PhwyATtFBA==
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Frederic Weisbecker <frederic@kernel.org>, Waiman Long
 <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
In-Reply-To: <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
Date: Thu, 10 Apr 2025 15:08:12 +0200
Message-ID: <8734egtb9f.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 10 2025 at 12:38, Gabriele Monaco wrote:
> On Thu, 2025-04-10 at 10:26 +0200, Thomas Gleixner wrote:
>> > + /* Fall back to any online in case all are isolated. */
>> 
>> How can that happen? There is always at least _ONE_ housekeeping,
>> non-isolated, CPU online, no?
>> 
>
> In my understanding it shouldn't, but I'm not sure there's anything
> preventing the user from isolating everything via cpuset.
> Anyway that's something no one in their mind should do, so I guess I'd
> just opt for the cpumask_first (or actually cpumask_any, like before
> the change).

This should be prevented by the core infrastructure. Isolating _ALL_
CPUs is broken by definition.

>> That brings me to the general design decision here. Your changelog
>> explains at great length WHAT the change is doing, but completely
>> fails
>> to explain the consequences and the rationale why this is the right
>> thing to do.
>> 
>> By excluding the isolated CPUs from migration completely, any
>> 'global'
>> timer, which is armed on such a CPU, has to be expired on that
>> isolated
>> CPU. That's fundamentaly different from e.g. RCU isolation.
>> 
>> It might be the right thing to do and harmless, but without a proper
>> explanation it's a silent side effect of your changes, which leaves
>> people scratching their heads.
>
> Mmh, essentially the idea is that global timer should not migrate from
> housekeeping to isolated cores. I assumed the opposite never occurs (as
> global timers /should/ not even start on isolated cores on a properly
> isolated system), but you're right, that's not quite true.
>
> Thinking about it now, since global timers /can/ start on isolated
> cores, that makes them quite different from offline ones and probably
> considering them the same is just not the right thing to do..
>
> I'm going to have a deeper thought about this whole approach, perhaps
> something simpler just preventing migration in that one direction would
> suffice.

Indeed.
>> > +int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
>> 
>> cpumask_var_t is wrong here. 'const struct cpumask *' is what you
>> want.
>
> You mean in the function argument? That's exactly how it is handled in
> workqueue_unbound_exclude_cpumask. I get cpumask_var_t is not
> necessarily a pointer, perhaps it's worth changing it there too..

Correct. cpumask_var_t is the magic macro construct which allows to
switch from cpumask on stack to allocated ones at compile time, but
what's handed around is a pointer to struct cpumask.

Thanks,

        tglx
