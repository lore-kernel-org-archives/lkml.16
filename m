Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9238A1FFC44
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063048; cv=none; b=ASxfKbDBuQPjVMbizPwF1g9pKKhgSXNG/arEdX9PflXz76Cm/ZPIumbtn1v0o1N2XqxyFkffRm7cYXKjwfl1ES+7yNc/jvFE2dQOPOTJIJM4unqc332dwM2tvTDveumyb0s8rpYpiZCT587RhAZXlbR7AMtmDGuzVQY3IQJqQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063048; c=relaxed/simple;
	bh=Ok6sbhuAHQgOj0VCWpsrZDM5gqJfXhwA7DaUP3dLmD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B+3zIW1U3oOMEsKf+7B0JiIxYaZgVg2wiqQQ+mwOZpTqE7nRoEOY3hzITe6N7P+uWTkXP3NND5l7Hscxa68y7L/GZAnqdNmyrZUw8GJub90t/TYWvtw0qNP5+VRAyionujarWJHZMJ0GO68patojAqQ4K1OCA25igCvs60dYkIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OX0DLUrl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o+qzkT+6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OX0DLUrl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o+qzkT+6"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743063044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKLZQkdc4yEMpxWrE9FAL8M+lw5YXUz3sNPr4J+7xHU=;
	b=OX0DLUrlW+fgg5NnLkdMX53EVPjOBtgQZTbnXRiyEg+ITLbebuSKU6OSInDWxVutaf+9iD
	9o9J5Z9kYnc9K8BQvue0zb1JPXOzlP0x5FbIg87InVQbkLgLG6A8lCjGYMUCGXzeW1rXK+
	YSqyZZFu3rbbNkQprdoF2dmOa5yIO1tK3S+iLQXd0xnv+KVW5K2TCasXe1sT7900yDDJAd
	hzgDdz9HeU+qXthyhvqG/JFeZMrqKkkBgYZRF97foX99JXtRst1S90KtyAk4y1o2wleqHR
	aM/rwW6H9VjtWV+8c3b7xxKnEU3gjWKkO2xlTJg3uImAoHcv9X5XfoOrADwx2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743063044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKLZQkdc4yEMpxWrE9FAL8M+lw5YXUz3sNPr4J+7xHU=;
	b=o+qzkT+6oSMCd+hmHu1f9f+3QPwQAX/BmaGuV+qdKtl43dl3LiWMsQa2Z4wuwoBiwa9SlI
	g3IeWjmlQoolRJDQ==
To: Eric Dumazet <edumazet@google.com>, Mateusz Guzik <mjguzik@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, Benjamin
 Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [tip:timers/core] [posix] 1535cb8028:
 stress-ng.epoll.ops_per_sec 36.2% regression
In-Reply-To: <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
Date: Thu, 27 Mar 2025 09:10:44 +0100
Message-ID: <877c4azyez.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27 2025 at 07:21, Eric Dumazet wrote:
> On Wed, Mar 26, 2025 at 10:11=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com=
> wrote:
>> On Wed, Mar 26, 2025 at 09:07:51AM +0100, Thomas Gleixner wrote:
>> > Unfortunately I can't reproduce any of it. I checked the epoll test
>> > source and it uses a posix timer, but that commit makes the hash less
>> > contended so there is zero explanation.
>> >
>>
>> The short summary is:
>> 1. your change is fine
>
> Let me rephrase this.
>
> Absolutely wonderful series, thanks a lot Thomas for doing it.

Thank you!

> Next bottlenecks are now these ones, but showing up in synthetic
> benchmarks only.

Right. I saw them too when working on this.

>     33.36%  timer_storm      [kernel.kallsyms]           [k]
> inc_rlimit_get_ucounts
>
>     32.85%  timer_storm      [kernel.kallsyms]           [k]
> dec_rlimit_put_ucounts

These two are not really posix-timer specific. They are also the
standouts for any signal micro benchmark.

I stared at the implementation a bit, but there is not much we can do
about that I fear.

Thanks,

        tglx



