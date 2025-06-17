Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98792E2650;
	Tue, 17 Jun 2025 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169656; cv=none; b=nbyjSJAMVcLFkK4+N8vW4VyaHUvmvi5sedL0LbJO3aIVJd50ySUhtPF9f5kamYhwnhqgTyhsZor6Ls50W30Uabrm10lR6XjWeoGQbSoLDEHr68HlMs8BEtfc38WU6po5zGvoBlYefB8/vBW92FlEEtXaLjUgwRngngHFk5iVtWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169656; c=relaxed/simple;
	bh=swK8vRSykGCNL6jYjUTWXfJhBRKaRxDMYP0abX/i9Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILsb31S/aPbmRtfWmN5lAoEh9p8f8WhhXPSFVMsRhF2obkydwkhMXvPOvnrP7Jasf2chCinqsKc0NdNlLw6H+hlbNH3lz/t3n219O5QSBLv7T6qzFil6HLgdePqdYTMmeE5CbxzpZBpQqvJ0FUyaBQqTcjSDrkAvXft+DIwgWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 8E5585869A;
	Tue, 17 Jun 2025 14:14:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 9676620019;
	Tue, 17 Jun 2025 14:14:02 +0000 (UTC)
Date: Tue, 17 Jun 2025 10:14:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
 rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Daniel Almeida
 <daniel.almeida@collabora.com>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
 <vschneid@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long
 <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Jens Axboe
 <axboe@kernel.dk>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 NeilBrown <neilb@suse.de>, Caleb Sander Mateos <csander@purestorage.com>,
 Ryo Takakura <ryotkkr98@gmail.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>
Subject: Re: [RFC RESEND v10 03/14] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <20250617101408.6dde6324@gandalf.local.home>
In-Reply-To: <703f5e6f-4bfe-4134-ae40-d9d14cd04879@nvidia.com>
References: <20250527222254.565881-1-lyude@redhat.com>
	<20250527222254.565881-4-lyude@redhat.com>
	<20250528091023.GY39944@noisy.programming.kicks-ass.net>
	<683721f1.050a0220.80421.29ff@mx.google.com>
	<20250616175447.GA900755@joelnvbox>
	<aFBcTePC-iXqRuXq@Mac.home>
	<703f5e6f-4bfe-4134-ae40-d9d14cd04879@nvidia.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9676620019
X-Stat-Signature: g8ciu3sexo1b3gdeshd6gcpog5hextpj
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Xfvps9rZDPHwo9nJ90LjSHFcqZnMh+sg=
X-HE-Tag: 1750169642-677972
X-HE-Meta: U2FsdGVkX1/KpAiEXKV+5+VYEUZfviuejwq0JLPd0KXTofD90YZWENKfFXk+zIdQ2JrZh4nzGgGsuCdpEqJJqsO0aQB0TpmXn9whGlxt+j1m3Qn9iH+QLAeXjn5R/aURO6UuMjOxWjkpVA4LoBEAvFK8NSU9IDc2w3BJtmKp1xGMcJ3qSG7HIE5C1cAy7MVnafU+SQOHUicBkHj9R/U8Yj+r/JJK97XA2Gvn3P2Jx1h8AqzosPDBBUQuv5B0QYJKoy2xGPx3EVujIdh1BJDqWUfm6KBEd2HB6gLW6dloIH34shyCavNFzJeN8TM8cNFYI6e+wSKl4oszu8KKFxI0FX66/MfAU7n8

On Mon, 16 Jun 2025 14:37:49 -0400
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> At first glance that makes sense. Was there some concern about overhead? Me and
> Steve did some experiments back in the day where we found local_irq_disable()
> can be performance-sensitive, but we were adding tracers/tracing which
> presumably can be higher overhead than what this series is doing.
> 

The performance overhead was because, I believe, we added a function call
to the local_irq_disable, which can add quite a bit of overhead.

> thanks,
> 
>  - Hiek

I like the new sig! (Right hand off by one?) You should keep it ;-)

-- Steve
