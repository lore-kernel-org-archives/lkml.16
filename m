Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071A121B9F7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 21:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749505214; cv=none; b=pWvbY57Dl0os2vuDLmbsEfOz75fcFxV8nYtTaEqMxgve26m5M4//hh6NkK5qvC9BCOHVi41bqdMFFXipzziqHh/OpZvqNZCJkV4cqYXzfhn6/E0az0+QGKgieXlUDsI1aeWKNuM4qGVVSjlPDf6fsxZ+6RMunoMoQVwDnyHWVMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749505214; c=relaxed/simple;
	bh=tyRhSby89jcb+kTMmSAEqj7R2w2vsG40jy1iv8bU/Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/3SvuWwQwy2UDB5XYi8J6lCKvjhQRAFs9i4gkJ0W1P9b8dBpAX2UeH+vxpFwrN2AatJp7zVBiR+drEgAocKiLeElB4KIWmelEtaFC81giFhPg2u43tFWno2eUFT493zuhej7kXFz2Hdjc51CnXPH2vJ0FByYluQN3sNdLctMs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 20948803B0;
	Mon,  9 Jun 2025 21:32:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 20C9E20;
	Mon,  9 Jun 2025 21:32:05 +0000 (UTC)
Date: Mon, 9 Jun 2025 17:33:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "kprateek.nayak@amd.com"
 <kprateek.nayak@amd.com>, "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Message-ID: <20250609173333.6e0b6a55@gandalf.local.home>
In-Reply-To: <20250609165532.3265e142@gandalf.local.home>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
	<20250603233654.1838967-2-prakash.sangappa@oracle.com>
	<20250604103106.1465f847@gandalf.local.home>
	<20250604145433.KCPMF8zm@linutronix.de>
	<80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
	<20250604192327.sVjt6c4u@linutronix.de>
	<20250609165532.3265e142@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 20C9E20
X-Stat-Signature: z44hdu3pm7zgsmbotg35qsjd9yk5yi7f
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+aC5farrRC3IxJvpfUN9zRC2TmxMWHuV8=
X-HE-Tag: 1749504725-677061
X-HE-Meta: U2FsdGVkX1/rW8g8877/joGOvcce/oBqSlRnp28q7Qa4CbfjlFSSOhWimea9wC/eIV2RPQnEiq8hAkJdlJCnS2iavKAZ7gvltlvwtlvfu7uGIVqFuLa8TxjQYfwWfi0Fb4lK02hqbm7hrwF9ftPOlmdSNRbN1K+6u9/xuK/RGzD/KRmd0GvBx2TMksId0G30AU1//4nZxVfY5yquRx9tTNw8MAxfsw0tO64NxsiFJyVgyektE0moUIEzg1TtMlo+sWwldtdT+yErvAc1Mu3aschMvIpizvb6v7rj5j0SctfAEDWNjIFEyLeWeXdRXtOf


Now I put the machine under load.

In one window I ran:

  $ cd linux.git
  $ make j=20

[ This is just a 8 core machine. I just noticed that I have isolcpus=3 so
only 7 are running ]

And in another window I ran:

  $ while :; ./hackbench 50; done

This made the system have:

~# cyclictest --smp -p95 -m -s --system -l 100000  -b 1000
# /dev/cpu_dma_latency set to 0us
policy: fifo: loadavg: 38.84 19.89 8.05 29/2609 80387           

T: 0 (71748) P:95 I:1000 C:  23386 Min:      5 Act:   10 Avg:    9 Max:      30
T: 1 (71749) P:95 I:1500 C:  15635 Min:      5 Act:    7 Avg:    9 Max:      24
T: 2 (71750) P:95 I:2000 C:  11735 Min:      6 Act:   11 Avg:   10 Max:      27
T: 3 (71751) P:95 I:2500 C:   9388 Min:      6 Act:    9 Avg:   10 Max:      24
T: 4 (71753) P:95 I:3000 C:   7823 Min:      6 Act:   10 Avg:   10 Max:      24
T: 5 (71755) P:95 I:3500 C:   6699 Min:      6 Act:   10 Avg:   10 Max:      23
T: 6 (71756) P:95 I:4000 C:   5865 Min:      6 Act:   10 Avg:    9 Max:      23

Then running my extend-sched with 5us delay, it jumped up slightly.

T: 0 (104507) P:95 I:1000 C:  69385 Min:      4 Act:   10 Avg:    8 Max:      34
T: 1 (104509) P:95 I:1500 C:  46378 Min:      4 Act:   14 Avg:    9 Max:      29
T: 2 (104510) P:95 I:2000 C:  34829 Min:      5 Act:   13 Avg:    9 Max:      27
T: 3 (104511) P:95 I:2500 C:  27885 Min:      5 Act:   11 Avg:    9 Max:      28
T: 4 (104512) P:95 I:3000 C:  23246 Min:      5 Act:   12 Avg:    9 Max:      29
T: 5 (104514) P:95 I:3500 C:  19931 Min:      5 Act:   11 Avg:    9 Max:      32
T: 6 (104518) P:95 I:4000 C:  17446 Min:      5 Act:   11 Avg:    9 Max:      24

This is more in the noise but still sightly noticeable. I still argue that
this extends any worst case scenario with the delay, as if the path that
causes the worst case scenario happens when the extended slice happens,
they are combined. Which is the definition of worst case scenario.

-- Steve
