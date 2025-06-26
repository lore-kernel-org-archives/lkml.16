Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0A1B4F0A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942639; cv=none; b=cCybvTKr80qA/L9bP9Y+8sYkX1OkO7ZbRlXjGeDfQJjTI/9CHbJCitKo0pT/cE+lil8J+y1+z5ai9HVTTJJkowGV8dCpGOwnDxE5pV1Qk/cG080PYkRphmYejgL+RsdHefyEBorzTr6HAREw+RIOlygANbd5qu66g9dpRlUNDa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942639; c=relaxed/simple;
	bh=n679wSAWWOiJ9JTMrysAzGgXFa3wPFP/gQmNq2IQmn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=las7YgSo2ribCX1UuRkmq/E0pVoDifOfE7K6R8806CtZpPgBlG0VLewstvwW8Vq31mxEVBTk4GVjSnSazbnjBO+06kHd/M7RM75lWgEFqPizJaEd8hhbZTqQyApAWBINgIxTfvLvHH4bGGOOdyN3ByidZdmvQUVBTGCoYsaPetE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PUdiby0/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PUdiby0/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4EgDGm6+JjMaSHHTQLImViqJKszRwHALciz1EDmlv3k=; b=PUdiby0/r30UJepnl62/YjZb+q
	21+qOBf6mhtIWw1ohPknJyY8pN16AH+cBKXvO9etVu7UvCoEMmsbMq/+BPQULD6voNcXoBXdM3d4I
	jICeGmQ8/tHpXAZfDmGa7w6BigyWUztpMxXZDxENROPzUylZOkJgQ6XMoGGlr28Sl3r7U2x8SzuJS
	EMPv+Yo3ZIyNpghFGh8CacGHfFIPZxUk/upR20y2T8fPKpBNpgXTAQxDX4Q5E9jscw1XbINRZmHNl
	rnBKbEu180OHyEuvbX1I9leMmyq0zMbsBFRIdmHcttT5iuGYBdVCXrd/XkdHzTLlZex+iw8OelRin
	NgQafXPQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmAF-0000000BfqF-4BKe;
	Thu, 26 Jun 2025 12:57:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 89A0030BDA9; Thu, 26 Jun 2025 14:57:15 +0200 (CEST)
Date: Thu, 26 Jun 2025 14:57:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [BUG v6.16-rc3] kernel oops in __migrate_swap_task
Message-ID: <20250626125715.GF1613200@noisy.programming.kicks-ass.net>
References: <aFtfZgcL66nq6TcY@dread.disaster.area>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFtfZgcL66nq6TcY@dread.disaster.area>

On Wed, Jun 25, 2025 at 12:31:02PM +1000, Dave Chinner wrote:
> Hi folks,
> 
> I had this happen once randomly on 6.16-rc2 but was messed up in
> amongst a heap of failures, but I've now got a clean, single failure
> on 6.16-rc3 that looks like this:
> 
> [11001.388660] BUG: kernel NULL pointer dereference, address: 00000000000004c8
> [11001.392374] #PF: supervisor read access in kernel mode
> [11001.394574] #PF: error_code(0x0000) - not-present page
> [11001.396687] PGD 0 P4D 0
> [11001.397821] Oops: Oops: 0000 [#1] SMP NOPTI
> [11001.399507] CPU: 10 UID: 0 PID: 66 Comm: migration/10 Not tainted 6.16.0-rc3-dgc+ #342 PREEMPT(full)
> [11001.403327] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [11001.407288] Stopper: multi_cpu_stop+0x0/0x120 <- migrate_swap+0x80/0x110
> [11001.410066] RIP: 0010:__migrate_swap_task+0x31/0x1a0
> [11001.412132] Code: 89 e5 41 57 41 56 53 48 89 fb 48 ff 87 60 03 00 00 41 89 f7 65 48 ff 05 7d 13 22 04 4c 8b b7 10 09 00 00 66 90 e8 ff db 05 00 0
> [11001.419845] RSP: 0018:ffffc90006677d90 EFLAGS: 00010002
> [11001.422015] RAX: ffff88810231d100 RBX: ffff888843982880 RCX: 000000000000392e
> [11001.425316] RDX: 0000000075dcabe7 RSI: 0000000000000020 RDI: ffff888843982880
> [11001.428559] RBP: ffffc90006677da8 R08: 0000000000000001 R09: 0000000000000090
> [11001.431695] R10: 0000000000000080 R11: 00000000000000d0 R12: ffff88881fcab440
> [11001.434781] R13: ffff88981fa2b440 R14: 0000000000000000 R15: 0000000000000020
> [11001.437783] FS:  0000000000000000(0000) GS:ffff88889a6f1000(0000) knlGS:0000000000000000
> [11001.441208] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [11001.443645] CR2: 00000000000004c8 CR3: 000000013c31b000 CR4: 0000000000350ef0
> [11001.446645] Call Trace:
> [11001.447770]  <TASK>
> [11001.448618]  migrate_swap_stop+0x16a/0x1d0

> I don't know exactly what triggers it, except to say I'm running the
> parallel variant of fstests with 64 concurrent tests being run.
> These tests are in parallel with operations like random CPU hotplug,

The stopper thread and hotplug involved make me think it *might* be
related to this:

  https://lkml.kernel.org/r/20250626125323.GG1613376@noisy.programming.kicks-ass.net

Which isn't a new problem, but seems to have popped up recently.

> memory migration, cache dropping, etc whilst there may be thousands
> of processes executing filesystem stress across more than a hundred
> mounted filesystems on loop devices.
> 
> This is not reproducable on 6.15.0, so it is likely a regression
> introduced in the 6.16 merge window....

Let me go look through the commits to see if anything stands out..

Thanks!
