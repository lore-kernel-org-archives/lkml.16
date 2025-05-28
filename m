Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0402928C86C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449233; cv=none; b=esOCScD1g5jwMFrixWOZTexkDT0cjNuV01jMlNLNDzY2TMeoTQst7UblqRZvKwun2cqUyiNo2FZcLOZSstwdEvoBkgTOH1cDsmfytRlmTgiHvX9kBlIosH+axH4C/STPXxXkr0jTiuIHzyEhW9ZFnbFuu0Y4PCwS0q4OzAq+X7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449233; c=relaxed/simple;
	bh=rtknfNWoEK+Ik+dCQAnloEVSjqtEhNouvIqjdscPbL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HB1kMZkRc7zZ2xiPT7dg91/EcjGtaQT2ENKsod8J7rrJCd+58sWXUN0YQiju9yZ5+laUD4D/BuFg90k995hUglo8Pn9GHXrm6LssFTguAFS5BlvVkJZf/I+QYfujEZ++qhz1tkcmxZv99QTanh4xZJLBpKRb5+U0DHJTJeGEw3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4FBC4CEE3;
	Wed, 28 May 2025 16:20:31 +0000 (UTC)
Date: Wed, 28 May 2025 12:21:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Valentin Schneider
 <vschneid@redhat.com>, Mel Gorman <mgorman@suse.de>, Vincent Guittot
 <vincent.guittot@linaro.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [PATCH 00/43] sched: Use the SMP scheduler on UP too
Message-ID: <20250528122131.70adfac9@gandalf.local.home>
In-Reply-To: <20250528161020.GF39944@noisy.programming.kicks-ass.net>
References: <20250528080924.2273858-1-mingo@kernel.org>
	<20250528085813.GX39944@noisy.programming.kicks-ass.net>
	<20250528100000.0ab0a8b1@gandalf.local.home>
	<20250528161020.GF39944@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 May 2025 18:10:20 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> > Although I wish there was better documentation about it.  
> 
> It has a manpage :-)

Ah, google has it. I was looking at the scripts/unifdef.c

I now see that it also has a debian package (that I don't have installed),
so no man page on my system.

-- Steve
