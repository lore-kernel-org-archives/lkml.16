Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE34177111
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746463533; cv=none; b=JScwlK0/VVOspjwZGuuH6AbwDpHpakLnw5RWEwRRtFT00x5Lt7Ib4ZLaoW0LJZccE9EEEYNMVLSwXv7f+BNsUixMD2YXgMosEIlVwnr5oT7hfM+Q7t/+BdcmX2SGhk8ZXGlI2WlN9K/hdVnjl7hDiqLD2bSQjltWal6IwGQ6TRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746463533; c=relaxed/simple;
	bh=grz7Ed8cgxFxj3rXyPStZZDqPWyc6T6Oz4gLCu4H6rg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1ruU9UgfH/gBJm0dyIUvtquD2mOI6Lp0pkWLVbUAdsA3VTCkCl/HC3V4gg+ECtd5EqoYZgvJNZ2+PGUCNZsg4PbfvcTJD03ow9hCOo7x7NIQz4kY+vl1cphkZorKIA//UYQj7V0vvAqo+piqVhe34Rpl/RIRRxzAgc1Udobnhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34CBC4CEE4;
	Mon,  5 May 2025 16:45:31 +0000 (UTC)
Date: Mon, 5 May 2025 12:45:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
 "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Message-ID: <20250505124537.74ed5126@gandalf.local.home>
In-Reply-To: <20250505123423.3494a18b@gandalf.local.home>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
	<20250502015955.3146733-2-prakash.sangappa@oracle.com>
	<20250502090529.GU4198@noisy.programming.kicks-ass.net>
	<20250502090643.3809b6f5@batman.local.home>
	<C3F85063-68B5-4C6D-B95F-27B72DBFA178@oracle.com>
	<20250505104830.36f22a4d@gandalf.local.home>
	<4D9FC618-1BD6-4126-8B1D-96ECD497CA90@oracle.com>
	<20250505123423.3494a18b@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 May 2025 12:34:23 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> 	if (dec_extend(&rseq_map->cr_counter)) {
> 		rseq_map->cr_counter = 0;
> 		yield();
> 	}

Note there is a possibility that the kernel could schedule it between the
dec_extend() above and the yield() call where it would call yield() twice,
but the chances of that happening is extremely slim and if it does, doing
the extra do_sched_yield() will highly likely not show up in any benchmarks.

-- Steve
