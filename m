Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6141227BA1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711817; cv=none; b=dnWKnR33ZlorLhbTtmZV/n3rC4gaH8BjcDrRM23ULxewBuYV/HziC6ml3XTWwA7lw5WFYBjhgKp9cPKOJCOhLYkrhOXA2A4ywpF3jnS7eA6HGi1Ab757twJlbXRFXpYvD/aBNDoVOpzDfDz60KtP3dZ2/eWjeVp6LbY358rUjF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711817; c=relaxed/simple;
	bh=Y55wLFIvvID7sOrwT7mRN800kTlffZtkYjyvo+A31sc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5XiYkOgB1yv7rNEOFJm/B7cPK1Wow3SWz1zrAv6r/ZUnyq9Dh4f6Rbm9Z9VhDpIyFWfYHfz30ue7SHMx9KsVeEKakEOiwAq79pZtTG2ItmJ1rJ5TRwkOeY3UFlR5ob4B/wn88DZw69abYyotcfEtG+hM1KN3lYv/8OU1pu+Q8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFD2C4CEE7;
	Thu,  8 May 2025 13:43:34 +0000 (UTC)
Date: Thu, 8 May 2025 09:43:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Aaron Lu <ziqianlu@bytedance.com>, Florian Bezdeka
 <florian.bezdeka@siemens.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, Ben
 Segall <bsegall@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>, Ingo
 Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Xi
 Wang <xii@google.com>, linux-kernel@vger.kernel.org, Juri Lelli
 <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Mel
 Gorman <mgorman@suse.de>, Chengming Zhou <chengming.zhou@linux.dev>, Chuyi
 Zhou <zhouchuyi@bytedance.com>, Clark Williams <clark.williams@gmail.com>,
 daniel.wagner@suse.com, josephtsalisbury@gmail.com, lgoncalv@redhat.com,
 Tom Zanussi <zanussi@kernel.org>, williams@redhat.com, dwagner@suse.de
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
Message-ID: <20250508094342.177ddf4d@gandalf.local.home>
In-Reply-To: <ef402bac-3b41-4322-b5b2-224c874275e3@siemens.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
	<20250409120746.635476-8-ziqianlu@bytedance.com>
	<099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>
	<20250507090923.GA194948@bytedance>
	<618bc3b199f19be916913301edb5ec832131e842.camel@siemens.com>
	<20250508024525.GA628019@bytedance>
	<ef402bac-3b41-4322-b5b2-224c874275e3@siemens.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 8 May 2025 08:13:39 +0200
Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 08.05.25 04:45, Aaron Lu wrote:
> > On Wed, May 07, 2025 at 11:33:42AM +0200, Florian Bezdeka wrote:  
> >> To sum up: This series fixes (or seems to fix, let's wait for one more
> >> week to be sure) a critical RT issue. Is there a chance that once we
> >> made it into mainline that we see (official) backports? 6.12 or 6.1
> >> would be nice.  
> > 
> > I don't think there will be official backports if this series entered
> > mainline because stable kernels only take fixes while this series changed
> > throttle behavior dramatically. Of course, this is just my personal
> > view, and the maintainer will make the final decision.  
> 
> With 6.12 carrying RT in-tree and this patches serious fixing a hard
> lock-up of that configuration, a backport to 6.12-stable would be
> required IMHO. Backports beyond that should be a topic for the
> (separate) rt-stable trees.
>

Agreed, and I'm adding the stable RT maintainers as well in case this needs
to go earlier than 6.12.

Thanks,

-- Steve
