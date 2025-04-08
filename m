Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E112F2698AE;
	Tue,  8 Apr 2025 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114583; cv=none; b=gPm0c4pvXsdBoD8Rcr23a8pz6LZo3vrFsijTZQKgT3JLifXXbLm5E+vqPLB8znSmnF5/99QXQSmQa0gKqjdj6cCUbs4tOdpuO91UzS/QhupL7Z/zZ/SZFHvWBelJJiFr0NN3ROzaosENgnglWMm4lRfOuthburqWb1j4LdtwtiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114583; c=relaxed/simple;
	bh=FlvoDL4dD4vmywPtBIrc819XH2xTfJa0KoRzqm1pE3U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mKYShmKvIHqYyNKYNHG6FY7lBnEsEyLLJEIJ1f6sanPtjdY5KzECUSI8nx96ylgdMmsKy0M/Sjxg0bWLnxmGa0MWl2z+6qRElyHmaxcrRQkbQYu8rxg3RNVASzRaIaMbtJalqwZpv+gsTgq48Hm/1haFJurwZV1czIJxKapvnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/2qovIA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/2qovIA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794BBC4CEE7;
	Tue,  8 Apr 2025 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744114582;
	bh=FlvoDL4dD4vmywPtBIrc819XH2xTfJa0KoRzqm1pE3U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H/2qovIAqJGGcy2ejFPLP9TBpWesS3t1Nrdi9xZ9ztwprrl0+zsi6Vbh6+wMnpCe7
	 bLuMJcijsFZC+FFQkU3KpyNTV+2THJTQFsAMzFqvOhnOaBlEEy2DEuUnBqAUyG2bw2
	 PnaHqNXjiHjSOw+XQTaK9h+KxVWKSnPfW1Z48mJDdJqxsWhnibLMb1vxDwhpVGZnWd
	 PS/sVMkSfMMAsrlJo3I4DCLGMahFMpKAIllXq+3lB9c+BXnJGSLUYZcjuRJbaqzpfE
	 VMqtWKyyVqvZziC2SVFHTZyAHgAyfJwkmy0V6XZFPh7WaOY2qTvih0EKHbMXPPOotA
	 5SxdJehBTwNqQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "Frederic Weisbecker"
 <frederic@kernel.org>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Anna-Maria Behnsen" <anna-maria@linutronix.de>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 6/6] rust: hrtimer: Add HrTimerCallback::expires()
In-Reply-To: <20250402214109.653341-7-lyude@redhat.com> (Lyude Paul's message
	of "Wed, 02 Apr 2025 17:40:34 -0400")
References: <20250402214109.653341-1-lyude@redhat.com>
	<KF4J159g5GKvvA_atpNMRwFdllr-BeBiKtVkJfyTLoBdoy58A9xVVr7K-1MPTVRS8lBLq4jpyeId-53SLew6ag==@protonmail.internalid>
	<20250402214109.653341-7-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 08 Apr 2025 14:16:11 +0200
Message-ID: <8734eij1bo.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> This adds the ability to read the expiry time of the current timer from the
> HrTimerCallbackContext.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index d52cbb6cfc57f..e28b7895d8f37 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -69,7 +69,7 @@
>
>  use super::ClockId;
>  use crate::{init::PinInit, prelude::*, time::Ktime, types::Opaque};
> -use core::{marker::PhantomData, ptr::NonNull};
> +use core::{marker::PhantomData, ptr::{NonNull, addr_of}};
>
>  /// A timer backed by a C `struct hrtimer`.
>  ///
> @@ -131,7 +131,7 @@ unsafe fn raw_get(this: *const Self) -> *mut bindings::hrtimer {
>          // SAFETY: The field projection to `timer` does not go out of bounds,
>          // because the caller of this function promises that `this` points to an
>          // allocation of at least the size of `Self`.
> -        unsafe { Opaque::raw_get(core::ptr::addr_of!((*this).timer)) }
> +        unsafe { Opaque::raw_get(addr_of!((*this).timer)) }
>      }
>
>      /// Cancel an initialized and potentially running timer.
> @@ -163,6 +163,31 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
>          // handled on the C side.
>          unsafe { bindings::hrtimer_cancel(c_timer_ptr) != 0 }
>      }
> +
> +    /// Return the time expiry for the given timer pointer.
> +    ///
> +    /// This value should only be used as a snapshot, as the actual expiry time could change after
> +    /// this function is called.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `self_ptr` must point to a valid `Self`.
> +    unsafe fn raw_expires(self_ptr: *const Self) -> Ktime {
> +        // SAFETY: self_ptr points to an allocation of at least `HrTimer` size.
> +        let c_timer_ptr = unsafe { HrTimer::raw_get(self_ptr) };
> +
> +        // SAFETY: There's no actual locking here, a racy read is fine and expected.
> +        Ktime::from_raw(unsafe { core::ptr::read(addr_of!((*c_timer_ptr).node.expires)) })

From what I have picked up about racy reads lately, this should probably
be a `read_once` when we get that. For now you should use
`core::ptr::read_volatile` with a `FIXME(read_volatile)`.


Best regards,
Andreas Hindborg



