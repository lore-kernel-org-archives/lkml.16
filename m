Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0516F139E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537202; cv=none; b=FKLnHzeVf4H8AGaDPLJDQWV3CfbnjlZkFtNX7sKEV/zWjJNccpbb+OObgktombN8pDSKmUsmAv7EThwjnf9euPR6xwKE4aFpzkLQ7zNBx7UR9A5xj+nehWwGOsvU1VKbvUEZ5+2ZqohA95BfmlaagZCesSSuB67oSd+3PDh8PEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537202; c=relaxed/simple;
	bh=6YuSLVNHD608xLhspdbHqDK9D3hSPLPqNeY3qV2W+PE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X2e4gcofsIiun3KYlS7HRZ3zQ64F+mCSms5trsQTVlveAY7uGDeM2NOpVnmj7vSBSUI/BWdCMgZZwoqeLwPv1MuZc7vi5YWXtLZedvwnb6Ed0V47ShOYtlUZiyw/xb/C+BBaK61Nid03hedtQXx70P6Gr6yrjDnMQKiIdAzidjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20ACC4CEE4;
	Tue,  6 May 2025 13:13:20 +0000 (UTC)
Date: Tue, 6 May 2025 09:13:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
 "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Message-ID: <20250506091328.32696fe6@gandalf.local.home>
In-Reply-To: <E47F0700-73FE-4D85-A5FA-CE14D0C41CE4@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
	<20250502015955.3146733-2-prakash.sangappa@oracle.com>
	<20250502090529.GU4198@noisy.programming.kicks-ass.net>
	<20250502090643.3809b6f5@batman.local.home>
	<C3F85063-68B5-4C6D-B95F-27B72DBFA178@oracle.com>
	<20250505104830.36f22a4d@gandalf.local.home>
	<4D9FC618-1BD6-4126-8B1D-96ECD497CA90@oracle.com>
	<20250505123423.3494a18b@gandalf.local.home>
	<E47F0700-73FE-4D85-A5FA-CE14D0C41CE4@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 May 2025 01:23:55 +0000
Prakash Sangappa <prakash.sangappa@oracle.com> wrote:

> Does it have to be sched_yield()? Or can the application call some other (fast)system call to yield the cpu
> (getppid(2) ) if extended time was granted?

It can be anything we decide I guess. yield() just seemed to be the most
appropriate, because in essence, that's exactly what it's doing.
 
> 
> It appears by default sched feature HRTICK/HRTICK_DL is disabled so
> hrtick_clear() Will not get called from __schedule().  I have noticed
> that enabling these sched feature to let hrtick_clear() get called from
> __schedule(), adds overhead.
> 
> So not sure if we need to enable the sched_feat(HRTICK//HRTICK_DL) to use
> the scheduler time extension.
> 
> Maybe rseq_delay_resched_tick() with this support,  would have to be
> called in __schedule() path but not thru hrtick_clear(),

I think that's more of a question for Peter.

-- Steve
