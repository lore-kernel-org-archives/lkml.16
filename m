Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06486233D9E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794354; cv=none; b=P338drlWaFIqmmXEF1oAi/92M2/gMKhdlQKLKP/oRdQfjItgvEdIFPhHIiFo8QNc0IlvVTXQEFfeV01nzhUpLRcMA3I3PJ+gehl44vAumdJJ2698/N8cFxTm2mm3gQOyZDwxJPdFthmLLP3aHaqnAUJ0vHNip94gOdWpyz1whmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794354; c=relaxed/simple;
	bh=kihrXIMr9hHWLXef1Tj3ZL14rz9bX1cM8nUf+E9jFa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rfwr7l8viBIr22ZmE7Y+qQD1OIm8cLOm289s+TAx6Qu2iN9srD7Lplyk7ZDGua+xnYaat/BEZgd9wGLXB94A3AvGi91gB8n5GkcgrW837gjkPsCoczCr0YwbK7ZbpSwDDPVnrQn4sFO0iccVc9T4PpCsytsrr/L4HgiP2vduYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3w7xUGi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3w7xUGi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C3DC4CEEE;
	Wed, 16 Apr 2025 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794353;
	bh=kihrXIMr9hHWLXef1Tj3ZL14rz9bX1cM8nUf+E9jFa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q3w7xUGiHhSZiElj3m2yvdeWq2R8qmTFcTjFLp20T/zRpolN/ciIAa7y8g3QniYeU
	 ydokFmNM0x3iU5kiBcyavkK1XRu/T1T1O7i9s8Fr9UsRxCNZGMrXfegyq1nGmeUhrw
	 6ujySICE+h1s4UMd/hi1H0QQy/vCH7C2zp/uZxYYjgB0/9HYlqbZydCc9+C87xLgZK
	 iIAEe45PN2yVdnMM9J4HpKXct17HTQZyeYoSjEjw1uYCX9d9OhVnfxk9VqNyraNMr2
	 KcMODhLvmwO0+GcvWocKAc22djR2qo7wf4bEAjeWJoCuCgHvT5zNtwDKbKlQfD15DA
	 lKYraxA5Rzyew==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 01/10] rust: Rename timer_container_of() to hrtimer_container_of()
Date: Wed, 16 Apr 2025 11:05:35 +0200
Message-ID: <20250416090544.3311613-2-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416090544.3311613-1-mingo@kernel.org>
References: <20250416090544.3311613-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This primitive is dealing with 'struct hrtimer' objects, not
'struct timer_list' objects - so clarify the name.

We want to introduce the timer_container_of() symbol in the kernel
for timer_list, make sure there's no clash of namespaces, at least
on the conceptual plane.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
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
-- 
2.45.2

