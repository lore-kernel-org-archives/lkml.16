Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DADA285075
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288344; cv=none; b=rz0zNsQ9LUDVodAKSSVjzi/pcasag4+rG2471dyXddBAeNAdrJuVcnHSMMUYEKv3ItZDTOJ5CyNZj5dTXT2GtIPD2fiOPsalSyqLMTa1uRfp94EMmFg6NS/+lY+1InXKbMfHSoiESPWv3l5q+1vJK+e4Vvot4ouWj/ktFiYggSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288344; c=relaxed/simple;
	bh=2HCNxwnVn3E25Gr1Y94nbzeByRqc884EvDUmwrqDa+8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jupGKGKjuTSpNrBwMjjVHSiIxXTcbwvwzvfxyvn41tGFKiCXW+Y+jlgnHoJ+y5QsliMN1e6I+BjEKLafau12MELsblD93QVZJx2HZ+m6PIoMcdgdjHAgbLPNZfj48SIKMG4lwp/Vz35ZXKCMBrNAk020cQlFaKyr2KHDEeS5UdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YqNXHcSe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3IKH00+R; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YqNXHcSe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3IKH00+R"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751288341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/t8WT+CEw8DpiDJZRZUOBsoX4SUNCxdtYF7mwRpIXkY=;
	b=YqNXHcSefou04MdgtGobKj22bzaxzBCmCHK+6+u69x7xqet6ubFM50yCJZwyHMFN0gPUT/
	wBDdDtyn9gASGjnmGPvkoflCSWqWUMIHNj3ul+rjSwB24C8LHLWFKz7enY0xtszt8Ukrrm
	FEc8Vc7u84XnCuQWdbyAn1P0C5V5A44I8bFREUhm66Xkc8tKj0yoxg5zowiVen+wDJ52QM
	8XFzJ3s6BcvbBGMNhIn2XsMYVwuuIPuo9wYK/vN/U+dK/JguLRVcwMRU7acKqNNJrV0qbW
	+F10iHG4R6YN0u0SJfN9PbKS+FLBo3seKiuymS3knnK5W6LJoYjaRrvlqW4W6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751288341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/t8WT+CEw8DpiDJZRZUOBsoX4SUNCxdtYF7mwRpIXkY=;
	b=3IKH00+RID0eSuV+P8GA7QJJ7Z+XX61+j0Y0K6mJg02U+KlExKJXzZ5YYwSStLmQgkEwmc
	ZhT8uj+4NucD0BCw==
To: Phil Auld <pauld@redhat.com>, Waiman Long <llong@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Marco
 Crivellari <marco.crivellari@suse.com>, Michal Hocko <mhocko@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
In-Reply-To: <20250627004851.GB222768@pauld.westford.csb>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
 <20250625121850.GA57862@pauld.westford.csb>
 <aFwI6sCtObAGoMBt@localhost.localdomain>
 <20250625155017.GC57862@pauld.westford.csb>
 <c205b6a8-89ee-424e-ac83-94584d59a449@redhat.com>
 <20250627004851.GB222768@pauld.westford.csb>
Date: Mon, 30 Jun 2025 14:59:00 +0200
Message-ID: <878ql9o06j.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 26 2025 at 20:48, Phil Auld wrote:
> On Thu, Jun 26, 2025 at 08:11:54PM -0400 Waiman Long wrote:
>> > My understanding is that it's the stop machine issue. If you have a way
>> > around that then great!
>> 
>> My current thinking is to just run a selected set of CPUHP teardown and
>> startup methods relevant to housekeeping cpumasks usage without calling the
>> full set from CPUHP_ONLINE to CPUHP_OFFLINE. I don't know if it is possible
>> or not or how much additional changes will be needed to make that possible.
>> That will skip the CPUHP_TEARDOWN_CPU teardown method that is likely the
>> cause of most the latency spike experienced by other CPUs.
>>
>
> Yes, CPUHP_TEARDOWN_CPU is the source of the stop_machine I believe.

Correct.

> It'll be interesting to see if you can safely use the cpuhp machinery
> selectively like that :)

It is supposed to work that way and you can exercise it from userspace
via sysfs already. If it fails, then there are bugs in hotplug callbacks
or ordering or ..., which need to be fixed anyway :)

Thanks,

        tglx
