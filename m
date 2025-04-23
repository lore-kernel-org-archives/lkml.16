Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E4541C69;
	Wed, 23 Apr 2025 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413324; cv=none; b=l5REBMyVsZOOhpcskBhJEPMvYxxDalohSBnJz0Ctm0WR7i42AD+YeVhfKQIGQ61awlOnMY9/43hy0Un9WkHk0nYgxiNXuTjZCBHyHSY+psk87Fy+jgswFmXKWk9nhW6b0CKWgKtxTZ3sQbSHSikbleMCp6VqHCj5AJPGaeIlJ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413324; c=relaxed/simple;
	bh=0yi/5RGccvozn62Qin1Y2rrPalzPKkJWKkwLeXjcir4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tvIPUUVEA+NERPSxiK+YCslWPzEk9iueclASYdXnn/8FqW/dUgz9ouLywp+tZRH+DUXzqUl4lpuSY/2hQNji2ynJPJKto5u5E72X1k1ol6rW31d4B8s4qCOO7nE0NGwkyHCxv/ZnbK89cYLxVSFbwp4i87Utah+g4iVmJEeTyII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOhDTP6A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOhDTP6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F39C4CEEB;
	Wed, 23 Apr 2025 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413324;
	bh=0yi/5RGccvozn62Qin1Y2rrPalzPKkJWKkwLeXjcir4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OOhDTP6AfVpGYb3OLtzvCU68EeqoqzOMMvcfZUadM3r29Xciwv2sSA9Jn0QlXMtd5
	 HcAtk9v53g5ALrwG1+oar6pajGOICQkCMhgkvLAkWA4S0vf299LoyGucW+QMmaS6Y+
	 iHfyBQajs35k+aHKnISlhzUSNniQlB4SI90No+zKeDtxE6gKwVlj573Iva8wixH3fP
	 wnSQaMBx1HK4Nwd8tR5JaAvNNJsIAYu3ZHLnfTqFhitulGdEwrk4gc35qdxw5/ueUQ
	 GtS92jL9jrzlp06zA58JG89HuckbR8DhwaGedUn28UvmfBi2mz3GzaKvB7KP/woXJG
	 JpS8HU/6A/dKg==
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
Date: Wed, 23 Apr 2025 14:57:24 +0200
Message-ID: <87ikmvkpcb.fsf@kernel.org>
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

Looking at C `hrtimer_forward`, I don't think the description is
correct:

    u64 hrtimer_forward(struct hrtimer *timer, ktime_t now, ktime_t interva=
l)
    {
      u64 orun =3D 1;
      ktime_t delta;

      delta =3D ktime_sub(now, hrtimer_get_expires(timer));

      if (delta < 0)
        return 0;

      if (WARN_ON(timer->state & HRTIMER_STATE_ENQUEUED))
        return 0;

      if (interval < hrtimer_resolution)
        interval =3D hrtimer_resolution;

      if (unlikely(delta >=3D interval)) {
        s64 incr =3D ktime_to_ns(interval);

        orun =3D ktime_divns(delta, incr);
        hrtimer_add_expires_ns(timer, incr * orun);
        if (hrtimer_get_expires_tv64(timer) > now)
          return orun;
        /*
        * This (and the ktime_add() below) is the
        * correction for exact:
        */
        orun++;
      }
      hrtimer_add_expires(timer, interval);

      return orun;
    }

As I read the code:

  If the timer expires 2s after `now` and `interval` is 6s, then the new ex=
piry
  time is moved 6s forward. Not to 6s after `now`. Return value will be 0.

  If the timer expires 3s after `now` and `interval` is 2s, then the
  expiry time is moved 2s forward and the return value is 1.

  If the timer expires 4s after `now` and `interval` is 2s, then the
  expiry time is moved 4s forward and the return value is 2.

  If the timer expires 5s after `now` and `interval` is 2s, then the
  expiry time is moved 4s forward and the return value is 2.

Can you capture this behavior in the docs?


Best regards,
Andreas Hindborg



