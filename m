Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B6E28DB63;
	Wed,  7 May 2025 17:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640428; cv=none; b=UtIuCmuVfYqMLcWSuKycgbr6hYvvnjWEGnHGZ9fTk58aLmltWofZVNAEVtnX352Qmniws/czBTRLmY13/LLC1mClgKbRdNvT+vLL3rIpZm77ljeGzsYZVzJl+3SGBjM5pNG/a2QPeK531HK1aN5YTNfRcItso0ta8uWyzQOgDKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640428; c=relaxed/simple;
	bh=QGcDqAQuSa9okafnCrCRkL6UgL4Sk93CNEDzAIbFxyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udaRbe1B6t/Lchuz0x5mhgkciT1Ay0vAUyjFgkX6/iLvsEiTcurrVHGg3EqlXk9cCaiPjM03DlBie99UUifXC+AhVEzY904ZzK4Km1fvwn6iFAbKW71RTdnnntDlaVE+wDSU8sdNrnKv/VUfpZEayrO4gbbZylnZDCobHU5OGQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGr7U607; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGr7U607"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44706C4CEE9;
	Wed,  7 May 2025 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640427;
	bh=QGcDqAQuSa9okafnCrCRkL6UgL4Sk93CNEDzAIbFxyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGr7U607EU70Qd5a7nnE3k2Ht5/ESSdzl7fBcOk0xF+vWjBSrwc444NJgxgdu/cs7
	 +tNqYjGqEHy68UOSVXWOSNp2qSfpUNkHW1lnMdLEq4sLgzTAHTPqK3M1o6M58Jc6e1
	 Y2gmHPVY5plsHKSOUCKbYqjDTYX142JLcMkr0FcOPAxAVTogKKIlQJeWLkGMrrrUvg
	 PEaLvDS6HMlO18FSdIQpg0jwyp+Qg+qfWfynLyVEBUEt7wuBwSSQsKRxy3aBmC3ZFe
	 ZpdZC+xA7Gdwa9KIIRP/ObhRxOTPpvP95nMhlqSB8nwTeuyIoDqofl0WD3VjiKfHEa
	 eMxUV2oJoAAEw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Rust ML <rust-for-linux@vger.kernel.org>
Subject: [PATCH 01/10] rust: Rename timer_container_of() to hrtimer_container_of()
Date: Wed,  7 May 2025 19:53:29 +0200
Message-ID: <20250507175338.672442-2-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507175338.672442-1-mingo@kernel.org>
References: <20250507175338.672442-1-mingo@kernel.org>
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
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rust ML <rust-for-linux@vger.kernel.org>
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

