Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A12229B36;
	Thu, 12 Jun 2025 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749724547; cv=none; b=dwRFEFzKHaaGq2dmG05nWTh0j3utQk6xT+wducIndZMlKU41BjPs1EUpD2nrZIbTJ9ewPwQHgatkct0ikjXY79qezdD6FC0539Ak9vkk7o4PY5FKNGR7q7L/8kXCnAVmdbtiiK6l5oNVHTq+d0+mulZzBDTjAE2RysYcq+VbJ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749724547; c=relaxed/simple;
	bh=2cMinGMtqFMDHKt7F5egUPZjdd5uttrkp8p8sCdhHn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8UnEQdPQvJdDJ262+rv4FyLyHySu4B9wLWvrmJCTbyRxdoV3QYRsL/H1MsTJBG60KmBJBERsJMgXczPIaNsX2f/Qo1+O3+XCvhMvLP6l67N/w2aRcg2jzXvRs+GgmkV2aAvqs75kP0g4aS5SOxXnNi2Sy08qT1pBAAgQ3snRnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9dGSSaF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9dGSSaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EAEC4CEEE;
	Thu, 12 Jun 2025 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749724546;
	bh=2cMinGMtqFMDHKt7F5egUPZjdd5uttrkp8p8sCdhHn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9dGSSaFr/H7gH0V/3AViZD6Xv+sQ6CL9k5/B5PPt2+8JFonaZhFoFJ6s1nQks2w5
	 ZpkkmmZi5yhPMdQW5aAwbhJCfzWcOyubtQL9Z3DTf2OXnCPNAosbgD7wokQEqCQBZU
	 ASQt7C3AL4hCUJyxMDLn1GxMgyh5qLWODd2IUgmD200oRKSGC2hmmjMjqjVFYeYPSK
	 e456Zuq0wcV806g7xqbvjWmSbuPlWb4c7ivF0pxMUhqZcgJhxUYJFVZQkuNQsiZBMw
	 UL3ArrVusqmGIdydUk19o5HHOnijn3TX9j10m+ef4wciCP5aazv4MlTCn4WcQxUTZG
	 yige577CutTUw==
Date: Thu, 12 Jun 2025 12:35:39 +0200
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
Message-ID: <aEqtexr4WwfU7rIP@pollux>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-2-dakr@kernel.org>
 <DAKEM192U5RZ.3D00TOR520LRY@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAKEM192U5RZ.3D00TOR520LRY@kernel.org>

On Thu, Jun 12, 2025 at 10:15:55AM +0200, Benno Lossin wrote:
> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> > +    /// Signal all tasks waiting on this completion.
> > +    ///
> > +    /// This method wakes up all tasks waiting on this completion; after this operation the
> > +    /// completion is permanently done.
> > +    pub fn complete_all(&self) {
> > +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
> > +        unsafe { bindings::complete_all(self.as_raw()) };
> > +    }
> > +
> > +    /// Wait for completion of a task.
> > +    ///
> > +    /// This method waits for the completion of a task; it is not interruptible and there is no
> > +    /// timeout.
> 
> Another thing that we should document is weather this function returns
> immediately when `complete_all` was already called in the past.

The details are all documented in [1], which is also linked in the module
documentation of this file.

[1] https://docs.kernel.org/scheduler/completion.html
