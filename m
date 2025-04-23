Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBDBC8DC;
	Wed, 23 Apr 2025 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411292; cv=none; b=Vri90ZAxa88XBm2bndwqRdsOdI+v1SheB2AXLUzQDA8lKy0EZvWRR13VskqP9PcJlOnmqHEini/ulFC5mBp3AONTfCfXxjNbJmdQL7fecH90A7VPH0k5h8aFobVN7W0FDbX3zlXUCwAPYYvHlCmtIUl2PgoTH0nH3PrFvyi7pdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411292; c=relaxed/simple;
	bh=xHsLXj71Byc8m2RCajqHL6L01TY4neYM2Qlt7KikSAo=;
	h=From:To:Cc:Subject:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=RH2UpZKkhQGYepgLun2d4RteEVkUMg1F7/FD4fiZTY8mVb7ULAzO+pz6y8/yHktuIkuQ/aX4JZmo3q7SWGcfOsh8dHMSGVUl0gnQ3Kg0R4hKZiHCpqsoS5UW5jSlJ41fbO8KKX6BTERaP6VFsP8adySlb0z3Qo+AOEi9z3O7XEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuKbCEWo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuKbCEWo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4674C4CEE2;
	Wed, 23 Apr 2025 12:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745411291;
	bh=xHsLXj71Byc8m2RCajqHL6L01TY4neYM2Qlt7KikSAo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fuKbCEWomHoN2UCmBgc3ofGUoTr6RHBfDViv8i9PqQq7kPX/CaTaOz4MD9MRsCOYr
	 IPhj6n4/rOKdffDFA4JbN6Rx7K0kIh/Fk+S523K8HjFlKTrsExX7LxYgp/3CIoQJ/e
	 sYeUIxPUTWiMPnuypBexOCZWDI+aML/TgK5ynXJpzJ/knW+lmS/Jrdda225biHg1Ez
	 Ph8i8HlAVgqCrQq2eTZAs++1PuY8UY7AVEgabf0ZIVOuwQdZOptX+N1j44yDgcFAGu
	 /tJGKa4kdO6HTnAMkTENNlHoHVj7B5uX34u+9EwegQGsDow3OpLLGT4OCVhIx3VmTV
	 jRtdxhM143PNQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Boqun
 Feng <boqun.feng@gmail.com>,  FUJITA Tomonori <fujita.tomonori@gmail.com>,
  Frederic Weisbecker <frederic@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Anna-Maria Behnsen <anna-maria@linutronix.de>,
  John Stultz <jstultz@google.com>,  Stephen Boyd <sboyd@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?us-ascii?Q?=3D=3Futf-8=3FQ=3FBj=3DC3=3DB?=
 =?us-ascii?Q?6rn=3F=3D?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 4/8] rust: hrtimer: Add HrTimerClockBase
In-Reply-To: <20250415195020.413478-5-lyude@redhat.com> (Lyude Paul's message
	of "Tue, 15 Apr 2025 15:48:25 -0400")
Message-ID: <87y0vrkqrc.fsf@kernel.org>
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-5-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 23 Apr 2025 14:27:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lyude Paul <lyude@redhat.com> writes:

> This adds a simple wrapper for the hrtimer_clock_base struct, which can be
> obtained from a HrTimerCallbackContext. We'll use this in the next commit to
> add a function to acquire the current time for the base clock driving a
> hrtimer.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V2:
> * Convert safety comment to invariant comment in from_raw()
> - Add raw_clock_base() and implement clock_base() on HrTimer<T> as well
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 50 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 507fff67f8ab2..a56c66104f692 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -183,6 +183,25 @@ unsafe fn raw_forward(self_ptr: *mut Self, now: Instant, interval: Delta) -> u64
>          }
>      }
>  
> +    /// Retrieve the [`HrTimerClockBase`] for a given timer pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `self_ptr` must point to a valid `Self`.
> +    unsafe fn raw_clock_base<'a>(self_ptr: *const Self) -> &'a HrTimerClockBase {
> +        // SAFETY:
> +        // - By our safety contract, `self_ptr` always points to a valid `HrTimer<T>`.
> +        // - `base` is initialized and points to a valid `hrtimer_clock_base` for as long as
> +        //   `HrTimer<T>` is exposed to users.
> +        unsafe { HrTimerClockBase::from_raw((*Self::raw_get(self_ptr)).base) }
> +    }
> +
> +    /// Retrieve the [`HrTimerClockBase`] for this [`HrTimer`].
> +    pub fn clock_base(&self) -> &HrTimerClockBase {
> +        // SAFETY: `self` is an immutable reference and thus always points to a valid `HrTimer`
> +        unsafe { Self::raw_clock_base(self) }
> +    }
> +
>      /// Forward the timer expiry so it expires at `duration` after `now`.
>      ///
>      /// This is mainly useful for timer types that can start off providing a mutable reference (e.g.
> @@ -200,6 +219,30 @@ pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {
>      }
>  }
>  
> +/// The timer base for a specific clock.
> +///

Please elaborate what a clock base is and what the use of this structure
is.

Is it the timer base for a specific clock, or the clock base for a
specific timer?


Best regards,
Andreas Hindborg



