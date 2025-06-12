Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D1239E92;
	Thu, 12 Jun 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726396; cv=none; b=f3NWvI4BFtGGIGv96ZAXQIMppB+FuPV88b3KGSWUbjnijxH88fySGYU01en+KWZN+heOKf05vNTSP8XaqnbLKECd8qWKowaaAsNhvh3Tgi9rraGUOBaHx4piWlLM+MWJlJTGvU0DEI9xk+TeYDKmE3bz/u1rqpHbdJ4L+OrR7rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726396; c=relaxed/simple;
	bh=CX/SJ6p2PC4ePksVeP0bGJ7+lohsdUHkw9p8R2H3Ufs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBKViFZgQcpCqTz9YkRVL0pwmCf+B5hQOGnG0o2RJjB9+nZrBR6h9gWVxBmS6Hwnh6JMw477IU86cG5o0hPgaCfl2A9IskfwYUSe8akKjs2Nu/7r3hYL7y2+Hhc71tT6lXmGPZ9hVBTg2nOaRHcXDdDhZzAL+kRc5A8tJYcg28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8w5btC+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8w5btC+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840AAC4CEEA;
	Thu, 12 Jun 2025 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749726396;
	bh=CX/SJ6p2PC4ePksVeP0bGJ7+lohsdUHkw9p8R2H3Ufs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8w5btC+atZJrFVZ2nyZfr4+HxCVdpaQ4Cg98xepzMKVDR4E/sGpyF/nUCZMfjfva
	 j3Re4i6p/Cpf/rJxDMIK/Z8rQIGwHGH6wHVSscq1J4Mq/5Dcsli4ltdcGk7jt+UfX9
	 fWgO7jzM5e/arjAW3OGpdOljFmN/kQ6ttdYxgq2NNB412PKTyvaInrUxMsQi/XeZ2C
	 lBIPhh/TgknjyhpC5SOJVPWBwK1bDcJaSL1Xw0gR2YZLptw6FLgxYlZ3WA8rD2xu4G
	 s9Ck+UYEEPAMxpi+LXit2IlkuinaqctK6qUK+gBseyxaNHOyLDkLDyohU8cNisIFbX
	 h/a+wtCkLYBUQ==
Date: Thu, 12 Jun 2025 13:06:28 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH 1/3] rust: completion: implement initial abstraction
Message-ID: <aEq0tA7yuBPxTSXq@pollux>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-2-dakr@kernel.org>
 <DAKEM192U5RZ.3D00TOR520LRY@kernel.org>
 <aEqtexr4WwfU7rIP@pollux>
 <DAKHYVHNSO30.3SICBU2MAW9UL@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAKHYVHNSO30.3SICBU2MAW9UL@kernel.org>

On Thu, Jun 12, 2025 at 12:53:45PM +0200, Benno Lossin wrote:
> On Thu Jun 12, 2025 at 12:35 PM CEST, Danilo Krummrich wrote:
> > On Thu, Jun 12, 2025 at 10:15:55AM +0200, Benno Lossin wrote:
> >> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> >> > +    /// Signal all tasks waiting on this completion.
> >> > +    ///
> >> > +    /// This method wakes up all tasks waiting on this completion; after this operation the
> >> > +    /// completion is permanently done.
> >> > +    pub fn complete_all(&self) {
> >> > +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
> >> > +        unsafe { bindings::complete_all(self.as_raw()) };
> >> > +    }
> >> > +
> >> > +    /// Wait for completion of a task.
> >> > +    ///
> >> > +    /// This method waits for the completion of a task; it is not interruptible and there is no
> >> > +    /// timeout.
> >> 
> >> Another thing that we should document is weather this function returns
> >> immediately when `complete_all` was already called in the past.
> >
> > The details are all documented in [1], which is also linked in the module
> > documentation of this file.
> >
> > [1] https://docs.kernel.org/scheduler/completion.html
> 
> I dislike that we don't have the docs right there on the function.
> Following that link, there is also a lot of other stuff there that don't
> apply to Rust (eg initializing completions, and the
> wait_for_completion*() variants).
> 
> After a bit of reading, I found the part that I was looking for (by
> searching for `complete_all`...):
> 
>     A thread that wants to signal that the conditions for continuation have
>     been achieved calls `complete()` to signal exactly one of the waiters
>     that it can continue:
>     
>     ```c
>     void complete(struct completion *done)
>     ```
>     
>     ... or calls `complete_all()` to signal all current and future waiters:
>     
>     ```c
>     void complete_all(struct completion *done)
>     ```
> 
> Let's just put this information on the `complete_all` function.

It's already there, no?

"after this operation the completion is permanently done"
