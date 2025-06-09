Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC418DB34
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502456; cv=none; b=jfG21yyAzdkDhNArgLajFu0Af26HPaGm9dsSgT2aYNboodTCl7Q0deOF0Ig+3cb3Ucwi3wD61vnAZV5UYZl/Cn07459LgjKrJu58TGg//nUPjrus4pwdo7nQ6W5u2oNcVkeHRnCoDuFnc0hqMjstz+m8tfunnxbm0opBj064BNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502456; c=relaxed/simple;
	bh=z/vEGuZc4tu6dkk1EEisYXM72I1LGtWdllhfK+YJQDA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TU9aWpWc4JL+bBJno0hpFnFIF98uViSy40Zlr+JaerVLdzuooWwJI/4AWmLticFSJ/uJm5DsCbNFHWSqK2SIV2Gp4DBR9IIO9cTv8H4qhHTuVo12lBjKjrkrazCjVZ4JKDgwRtrui7ys1jx4pSurcZaQsTnNj+GQiuoRuFMlt74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 1D18BC037A;
	Mon,  9 Jun 2025 20:54:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id F374520016;
	Mon,  9 Jun 2025 20:54:03 +0000 (UTC)
Date: Mon, 9 Jun 2025 16:55:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "kprateek.nayak@amd.com"
 <kprateek.nayak@amd.com>, "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Message-ID: <20250609165532.3265e142@gandalf.local.home>
In-Reply-To: <20250604192327.sVjt6c4u@linutronix.de>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
	<20250603233654.1838967-2-prakash.sangappa@oracle.com>
	<20250604103106.1465f847@gandalf.local.home>
	<20250604145433.KCPMF8zm@linutronix.de>
	<80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
	<20250604192327.sVjt6c4u@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F374520016
X-Stat-Signature: kqk1jkjz7tqp63pm6uzror6grjagneu9
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/s6SW87rW4GNG0b2h+ZU0ge/Lre6pTrR4=
X-HE-Tag: 1749502443-12506
X-HE-Meta: U2FsdGVkX1/1zwS4YMzcn2RSHAWExHXCrE55kfPCLTK8IHMy9igBEMmtnefbcKt6tZuv9q8GCEm4+1MOrAvxKuam6TijdyjUrawjScV53XojZGG+PWbH3IgRbXMK2w3PXao35xhhjfpj1lAPuPNxn6CSb1/fWyMzz3W1edjxoKIMdRrgSrtzDRVXksBhdKsmiNbgCggLECIrm0dB6Drx4Kd43fUwyQO6noaqp/pUrOfK5qzQO5L9R2MIcFVn2uSOjO7VD7b7zWftbMK/HBGQGNpbkrcyikGDYAal+Xkq3MmLr1R39pep+4oISRwWmp3NQt5yls2WSRwylkSL/VA5dbOIOWdBhGVmLiss2JWubxVYh3DHfiFQ2A==

On Wed, 4 Jun 2025 21:23:27 +0200
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> On 2025-06-04 17:29:44 [+0000], Prakash Sangappa wrote:
> > Don=E2=80=99t know if there were benefits mentioned when RT tasks are i=
nvolved.
> >=20
> > I had shared some benchmark results in this thread showing benefit of u=
sing scheduler time extension.
> > https://lore.kernel.org/all/20241113000126.967713-1-prakash.sangappa@or=
acle.com/
> > The workload did not include RT tasks. =20
>=20
> I don't question the mechanism/ approach. I just don't want RT tasks
> delayed.
>=20

So I applied your patches and fixed up my "extend-sched.c" program to use
your method. I booted on bare-metal PREEMPT_RT and ran:

~# cyclictest --smp -p95 -m -s --system -l 100000  -b 1000
# /dev/cpu_dma_latency set to 0us
policy: fifo: loadavg: 0.35 0.75 0.38 1/549 4219         =20

T: 0 ( 4213) P:95 I:1000 C:   5163 Min:      3 Act:    3 Avg:    3 Max:    =
  12
T: 1 ( 4214) P:95 I:1500 C:   3444 Min:      3 Act:    4 Avg:    3 Max:    =
   9
T: 2 ( 4215) P:95 I:2000 C:   2582 Min:      3 Act:    3 Avg:    3 Max:    =
   8
T: 3 ( 4216) P:95 I:2500 C:   2066 Min:      3 Act:    4 Avg:    3 Max:    =
   9
T: 4 ( 4217) P:95 I:3000 C:   1721 Min:      3 Act:    4 Avg:    3 Max:    =
   7
T: 5 ( 4218) P:95 I:3500 C:   1474 Min:      3 Act:    4 Avg:    4 Max:    =
  11
T: 6 ( 4219) P:95 I:4000 C:   1290 Min:      3 Act:    3 Avg:    3 Max:    =
   9

In another window, I ran the "extend-sched" and cyclictest immediately turn=
ed into:

T: 0 ( 4372) P:95 I:1000 C:  33235 Min:      3 Act:    4 Avg:    3 Max:    =
  36
T: 1 ( 4373) P:95 I:1500 C:  22182 Min:      3 Act:    4 Avg:    3 Max:    =
  39
T: 2 ( 4374) P:95 I:2000 C:  16647 Min:      3 Act:    5 Avg:    3 Max:    =
  35
T: 3 ( 4375) P:95 I:2500 C:  13321 Min:      3 Act:    5 Avg:    3 Max:    =
  36
T: 4 ( 4376) P:95 I:3000 C:  11103 Min:      3 Act:    4 Avg:    3 Max:    =
  35
T: 5 ( 4377) P:95 I:3500 C:   9518 Min:      3 Act:    5 Avg:    3 Max:    =
  36
T: 6 ( 4378) P:95 I:4000 C:   8330 Min:      3 Act:    5 Avg:    3 Max:    =
  35

It went from 12us to 39us. That's more than triple the max latency.

I noticed that the delay was set to 30, so I switched it to 5 and tried aga=
in:

~# cat /proc/sys/kernel/sched_preempt_delay_us=20
30
~# echo 5 > /proc/sys/kernel/sched_preempt_delay_us=20
~# cat /proc/sys/kernel/sched_preempt_delay_us=20
5

T: 0 ( 4296) P:95 I:1000 C:  15324 Min:      3 Act:    3 Avg:    4 Max:    =
  21
T: 1 ( 4297) P:95 I:1500 C:  10228 Min:      3 Act:    3 Avg:    4 Max:    =
  21
T: 2 ( 4298) P:95 I:2000 C:   7676 Min:      3 Act:    3 Avg:    4 Max:    =
  21
T: 3 ( 4299) P:95 I:2500 C:   6143 Min:      3 Act:    3 Avg:    4 Max:    =
  20
T: 4 ( 4300) P:95 I:3000 C:   5119 Min:      3 Act:    3 Avg:    4 Max:    =
  21
T: 5 ( 4301) P:95 I:3500 C:   4388 Min:      3 Act:    3 Avg:    4 Max:    =
  20
T: 6 ( 4302) P:95 I:4000 C:   3840 Min:      3 Act:    3 Avg:    4 Max:    =
  19

It went from a max of 12us to 21us. That's almost double. And this with jus=
t 5us.

The point we have with this, is it's NOT NOISE! It's addition to the worse
case scenario.

If we have 30us as the worst case latency, using this with 5 will make the
worst case latency 35 (or more as there's some overhead with this).

You cannot say "oh, the system causes 5us latency in general, so we can
just make it 5us", because this adds on top of it. If the system has 5us
latency in general and you set the extended scheduler slice to 5us, then
the system now has a 10us latency in general.

This is why it should be turned off with PREEMPT_RT.

-- Steve
