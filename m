Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64838158218;
	Wed, 28 May 2025 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440966; cv=none; b=s5vfuZXoCKBRYCMtVeJYEz6wSfLBtAnF+D98zQEfhzOAtNPu8LAlJcwI6wuYhhBBzusENG2SaO0huq2rvU7Ae50wdLnvNMbhjiVxDQj4dZtMg1L2ep0LPlMVqBq9XI/epbyiMGQNrGKQ1W9pLc4nk+xABPH/VrGWSStJyaeUPys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440966; c=relaxed/simple;
	bh=6rP9uumW2dRvvfBLPAtOem3d+giinVW++XhqPnPmrPc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6CrfzvW7DoDsvvl5M6UjnsUu+cHuc9AIEpxwyqaz55+Ww09B7nFu77udoxSx3HmokxN5LK/J6V+ZCcVOLlZ6sKRIyJAaBQJAlu/RSTF0mN5ucb4+87fiLiM6tzC8qn5MnBs3+WZ/EtjZsquPxS1xR0HWeKA2eW95D71l++QUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2945BC4CEE3;
	Wed, 28 May 2025 14:02:42 +0000 (UTC)
Date: Wed, 28 May 2025 10:03:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>,
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
Message-ID: <20250528100341.2d5755c9@gandalf.local.home>
In-Reply-To: <20250528091023.GY39944@noisy.programming.kicks-ass.net>
References: <20250527222254.565881-1-lyude@redhat.com>
	<20250527222254.565881-4-lyude@redhat.com>
	<20250528091023.GY39944@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 May 2025 11:10:23 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> Also, is there effort planned to fully remove the save/restore variant?
> As before, my main objection is adding variants with overlapping
> functionality while not cleaning up the pre-existing code.

I'm sure we could get people to do that. When all the strncpy()'s are
removed what are those folks going to do next?

-- Steve
