Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC3D256C9E;
	Thu, 15 May 2025 17:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329832; cv=none; b=OT5oVO2BY9GPR6ZYZPFr2OUmpJSoEpEb/bFwFntt2WK2FQb2mf8s04yLnBt+wajS4q13LwcQ1iXmqyS5mofg/eoj2utfW3vdwk2iN2GZYUx0EmQ5aPqqnOLQOlFPStJAom/2rfLNq1vMukcmGr19sSQyRaajfoeqpm5S+NbJ1+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329832; c=relaxed/simple;
	bh=u82z6V+UxR0TG68YO34FSdeIVHuIUfHqLUEEfehwl9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGkcVV0j+/oV36iYzB1hKsjsxECEkjOIHH5v8EyS6JbDw3w4ypgvk7dBru5mHq0RlhvON7X0gKvWUigPvKdPvbUqxonen7Ck9j+T6C2Bx4cw37lzYhnDnE4YpQHy/KPzIkgs4eMu/6YLPE49cHU0/PCMoocz4O0k/LVwn5Y5tjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8k4izbo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8k4izbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EF5C4CEE7;
	Thu, 15 May 2025 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747329831;
	bh=u82z6V+UxR0TG68YO34FSdeIVHuIUfHqLUEEfehwl9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8k4izbo5xYZeRv6Ch+yGUWImUwFWBmT04pdnqXgrVZH84ztssHonrd/WzrzhY515
	 BiKRhAJhdrud8Ddxd762NVAcc7ABQ/h7+El2hsatVOZqEzE8Qr6D0tXWrckymvDpwR
	 rzrpdyqJ8Hw0Ehteu2l+dmAnf1tDO7FHszqpEoWCmCuhanXUBKnr5q5gifzccKkp9/
	 V8PcJZShRe/Ih8b1XQ1FFDS0iSZpyJ4d+nvCmKyKiMr5sWTTeZ5aKUIwyuypCYzcOZ
	 ufXGK20qkRT42Ow/CTEtwd++K15YyEGa1Rm0QznAfdn+iEzg8vix2sFXCJhify8zBq
	 UaDl72Pl2j4rA==
Date: Thu, 15 May 2025 19:23:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Lyude Paul <lyude@redhat.com>,
	Rust ML <rust-for-linux@vger.kernel.org>
Subject: [PATCH -v2 01/10] rust: Rename timer_container_of() to
 hrtimer_container_of()
Message-ID: <aCYjIg6OIENQBY_K@gmail.com>
References: <20250507175338.672442-1-mingo@kernel.org>
 <qqz686a7_ob8uzbREL3X3P-MTdPUVJo9hi33Dsv-3kgJoB1_bE0ynnuXFVLIwbZ5dNkntegTdZhkBp04syneXA==@protonmail.internalid>
 <20250507175338.672442-2-mingo@kernel.org>
 <877c2spaag.fsf@kernel.org>
 <exZlQK8ioPft3NijtFzp4A_qkGlCunbqRbqwq8STs5kyK8khboJDM8LqVH7EZTImMbpeMOnxadeRvyEnyU69kA==@protonmail.internalid>
 <aBu2ocPIFOvq_EiA@gmail.com>
 <87jz6mnpnm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz6mnpnm.fsf@kernel.org>


* Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "Ingo Molnar" <mingo@kernel.org> writes:
> 
> > * Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >
> >> "Ingo Molnar" <mingo@kernel.org> writes:
> >>
> >> > This primitive is dealing with 'struct hrtimer' objects, not
> >> > 'struct timer_list' objects - so clarify the name.
> >> >
> >> > We want to introduce the timer_container_of() symbol in the kernel
> >> > for timer_list, make sure there's no clash of namespaces, at least
> >> > on the conceptual plane.
> >>
> >> Is this a resend?
> >
> > I noted the changes in the boilerplate:
> >
> >   Changes in -v3:
> >
> >     - Picked up review tags
> >     - Rebased to v6.15-rc5
> >
> > This particular patch didn't change.
> 
> Thanks. I didn't get the cover letter, but I should have looked for it.

Sorry about that, I have added your Cc: to the main timer_container_of 
patch as well.

> >> [1] https://lore.kernel.org/all/877c3cbdq2.fsf@kernel.org
> >
> > Yeah, saw that, but you said you are fine with it if I insist, and I'd
> > like to have this to free up the timer_* namespace.
> 
> Yes. I did not hear any proper insisting till now though.

:) I always see these threads in their full context, and I didn't
immediately realize that you only saw part of it, with a limited, 
misleading context, and was slow at reacting to your concern.

> > Since I think we'd like to introduce the timer_container_of() in 
> > the future it would be nice to do this rename, as:
> >
> > 	$ git grep -w timer_container_of
> >
> > will have hrtimer related false positive hits in rust/ code, even
> > though the namespaces are obviously independent.
> 
> Ok, I see. I'm not used to grepping like that, but I see how that can be
> annoying.
> 
> >
> > The Rust method is arguably a minor misnomer as well: you have
> > work_container_of around struct work, but timer_container_of is around
> > struct hrtimer?
> 
> Yes, you are right.
> 
> Feel free to take this through tip. Otherwise maybe Miguel can pick it
> up in the rust PR for 6.15.
> 
> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

Thank you!!

The tentative merge plan is/was that, if everything goes smoothly, we'd 
send this and the general timer_container_of() patch to Linus a few 
days before -rc1, due to the substantial cross section of the changes:

  treewide, timers: Rename from_timer() => timer_container_of()

  693 files changed, 913 insertions(+), 913 deletions(-)

:-/

But with your Acked-by we can now send the Rust patch through the 
regular channels with the timer tree and only send the single treewide 
patch to Linus separately.

If things are too busy in the merge window for Thomas or Linus, the 
non-Rust patch can easily slip to the v6.17 merge window though.

Thanks,

	Ingo

====================>
From: Ingo Molnar <mingo@kernel.org>
Date: Mon, 14 Apr 2025 11:19:20 +0200
Subject: [PATCH] rust: Rename timer_container_of() to hrtimer_container_of()

This primitive is dealing with 'struct hrtimer' objects, not
'struct timer_list' objects - so clarify the name.

We want to introduce the timer_container_of() symbol in the kernel
for timer_list, make sure there's no clash of namespaces, at least
on the conceptual plane.

Tested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rust ML <rust-for-linux@vger.kernel.org>
---
 -v2: Add Andreas Hindborg's Acked-by

 rust/kernel/time/hrtimer.rs         | 4 ++--
 rust/kernel/time/hrtimer/arc.rs     | 2 +-
 rust/kernel/time/hrtimer/pin.rs     | 2 +-
 rust/kernel/time/hrtimer/pin_mut.rs | 2 +-
 rust/kernel/time/hrtimer/tbox.rs    | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index ce53f8579d18..f3fb7a0caf2f 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -338,7 +338,7 @@ pub unsafe trait HasHrTimer<T> {
     /// # Safety
     ///
     /// `ptr` must point to a [`HrTimer<T>`] field in a struct of type `Self`.
-    unsafe fn timer_container_of(ptr: *mut HrTimer<T>) -> *mut Self
+    unsafe fn hrtimer_container_of(ptr: *mut HrTimer<T>) -> *mut Self
     where
         Self: Sized;
 
@@ -498,7 +498,7 @@ unsafe fn raw_get_timer(
             }
 
             #[inline]
-            unsafe fn timer_container_of(
+            unsafe fn hrtimer_container_of(
                 ptr: *mut $crate::time::hrtimer::HrTimer<$timer_type>,
             ) -> *mut Self {
                 // SAFETY: As per the safety requirement of this function, `ptr`
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index 4a984d85b4a1..5cfe6c27795f 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -80,7 +80,7 @@ impl<T> RawHrTimerCallback for Arc<T>
 
         // SAFETY: By C API contract `ptr` is the pointer we passed when
         // queuing the timer, so it is a `HrTimer<T>` embedded in a `T`.
-        let data_ptr = unsafe { T::timer_container_of(timer_ptr) };
+        let data_ptr = unsafe { T::hrtimer_container_of(timer_ptr) };
 
         // SAFETY:
         //  - `data_ptr` is derived form the pointer to the `T` that was used to
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
index f760db265c7b..d16a676b0639 100644
--- a/rust/kernel/time/hrtimer/pin.rs
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -83,7 +83,7 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a T>
 
         // SAFETY: By the safety requirement of this function, `timer_ptr`
         // points to a `HrTimer<T>` contained in an `T`.
-        let receiver_ptr = unsafe { T::timer_container_of(timer_ptr) };
+        let receiver_ptr = unsafe { T::hrtimer_container_of(timer_ptr) };
 
         // SAFETY:
         //  - By the safety requirement of this function, `timer_ptr`
diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
index 90c0351d62e4..17c68f8fbb37 100644
--- a/rust/kernel/time/hrtimer/pin_mut.rs
+++ b/rust/kernel/time/hrtimer/pin_mut.rs
@@ -87,7 +87,7 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a mut T>
 
         // SAFETY: By the safety requirement of this function, `timer_ptr`
         // points to a `HrTimer<T>` contained in an `T`.
-        let receiver_ptr = unsafe { T::timer_container_of(timer_ptr) };
+        let receiver_ptr = unsafe { T::hrtimer_container_of(timer_ptr) };
 
         // SAFETY:
         //  - By the safety requirement of this function, `timer_ptr`
diff --git a/rust/kernel/time/hrtimer/tbox.rs b/rust/kernel/time/hrtimer/tbox.rs
index 2071cae07234..9dace895ce58 100644
--- a/rust/kernel/time/hrtimer/tbox.rs
+++ b/rust/kernel/time/hrtimer/tbox.rs
@@ -103,7 +103,7 @@ impl<T, A> RawHrTimerCallback for Pin<Box<T, A>>
 
         // SAFETY: By C API contract `ptr` is the pointer we passed when
         // queuing the timer, so it is a `HrTimer<T>` embedded in a `T`.
-        let data_ptr = unsafe { T::timer_container_of(timer_ptr) };
+        let data_ptr = unsafe { T::hrtimer_container_of(timer_ptr) };
 
         // SAFETY:
         //  - As per the safety requirements of the trait `HrTimerHandle`, the
