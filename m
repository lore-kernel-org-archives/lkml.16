Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363C9201269;
	Wed, 23 Apr 2025 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410725; cv=none; b=Zm+8cnG+vAGXTi4WV8yXBTEc5izIo7GqOrIVLJhLzZKQUoWvWeJafDh9q0ZhCoKIXJO6seII7KVRriYRHOec4BhuLdnLE3qjFqroD0ltaQa9S0TbTE5RdrXZSCL4mIaVsWYZ+iYr/9z3OJC6Xk6oi7y5l+x707p9BzSeRgTDMfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410725; c=relaxed/simple;
	bh=qz7ZOLyrsps+7W5jqHThd243CmHxX6DhRJ+IsqFNMbk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TPnkYIhZQtzuAMdm+nAPpfukqcWsPHklLPj7aX5kQ1UDawe1FWEl7eGItLeQntX3/W7N0q/mcF1wjbyd2ePgv2lQCz96lhFHKpOKwVHoDTWBV6rV1dodMdBHfmei9zm3PpawixqiHZIOOhueDC0hGHAg2TG2WjVwPP1xSlIw9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3PEWaAI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3PEWaAI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB6FC4CEE2;
	Wed, 23 Apr 2025 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745410724;
	bh=qz7ZOLyrsps+7W5jqHThd243CmHxX6DhRJ+IsqFNMbk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=S3PEWaAIonixO9Yb73JdIIsiuDJhJPib8Hyjp0ud9o1w77SUFFMkIjjvYzLrzhjoW
	 F1/Znk704QP1yRdCJ4/hBtnSERhRQjXstpclx23fp4smA/1IbGlTcQ1GrkRKoJiElg
	 GzIABOC7hzLxYNBq2KbBx4veJGUMY9TNw4W2fCuXaSAOkVmHFQKPcXjESb69mYpxUh
	 VCZqDFcEWklLfAJui21nkuwGPmTpyYuEgKIXm0ztY59W+pmNhjSuSYqVNxpAMQ0tiz
	 krhmE4ff5pots/vgwnXw6+/YWsji3AC6yBadFjmfjlWTYlbeo9s2V3853w0/gT2Pb6
	 8D/nyK6e3ssbQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Boqun
 Feng <boqun.feng@gmail.com>,  FUJITA Tomonori <fujita.tomonori@gmail.com>,
  Frederic Weisbecker <frederic@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Anna-Maria Behnsen <anna-maria@linutronix.de>,
  John Stultz <jstultz@google.com>,  Stephen Boyd <sboyd@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 2/8] rust: hrtimer: Add HrTimer::raw_forward() and
 forward()
In-Reply-To: <20250415195020.413478-3-lyude@redhat.com> (Lyude Paul's message
	of "Tue, 15 Apr 2025 15:48:23 -0400")
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-3-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 23 Apr 2025 14:18:35 +0200
Message-ID: <87a587m5pg.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Lyude Paul <lyude@redhat.com> writes:

> Within the hrtimer API there are quite a number of functions that can only
> be safely called from one of two contexts:
>
> * When we have exclusive access to the hrtimer and the timer is not activ=
e.
> * When we're within the hrtimer's callback context as it is being execute=
d.
>
> This commit adds bindings for hrtimer_forward() for the first such contex=
t,
> along with HrTimer::raw_forward() for later use in implementing the
> hrtimer_forward() in the latter context.
>
> Since we can only retrieve a &mut reference to an HrTimer<T> in contexts
> where it is not possible for the timer to be accessed by others or
> currently executing (e.g. a UniqueArc), a &mut is actually enough of a
> guarantee to safely fulfill the C API requirements here.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index bfe0e25f5abd0..aadae8666f7ea 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -68,7 +68,11 @@
>  //! `start` operation.
>=20=20
>  use super::ClockId;
> -use crate::{prelude::*, time::Instant, types::Opaque};
> +use crate::{
> +    prelude::*,
> +    time::{Delta, Instant},
> +    types::Opaque,
> +};
>  use core::marker::PhantomData;
>  use pin_init::PinInit;
>=20=20
> @@ -164,6 +168,36 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -=
> bool {
>          // handled on the C side.
>          unsafe { bindings::hrtimer_cancel(c_timer_ptr) !=3D 0 }
>      }
> +
> +    /// Forward the timer expiry for a given timer pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `self_ptr` must point to a valid `Self`.
> +    unsafe fn raw_forward(self_ptr: *mut Self, now: Instant, interval: D=
elta) -> u64 {
> +        // SAFETY:
> +        // * The C API requirements for this function are fulfilled by o=
ur safety contract.
> +        // * `self_ptr` is guaranteed to point to a valid `Self` via our=
 safety contract
> +        unsafe {
> +            bindings::hrtimer_forward(Self::raw_get(self_ptr), now.as_na=
nos(), interval.as_nanos())
> +        }
> +    }
> +
> +    /// Forward the timer expiry so it expires at `duration` after `now`.
> +    ///
> +    /// This is mainly useful for timer types that can start off providi=
ng a mutable reference (e.g.
> +    /// `Pin<Box<=E2=80=A6>>`) before the timer is started.
> +    ///
> +    /// Note that this does not requeue the timer, it simply updates its=
 expiry value. It returns
> +    /// the number of overruns that have occurred as a result of the exp=
iry change.
> +    pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {

Can you add an example? I think maybe we are not going to be able to get
this mutable reference. `HrTimer` should probably be behind a `Pin<_>`.


Best regards,
Andreas Hindborg


