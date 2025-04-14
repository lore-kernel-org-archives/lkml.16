Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AFE265CD1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626191; cv=none; b=NmxheZE8WrDXh3MhOeM/+ot4cBz2GebMc2G2kc3KHk5FFiDCDknRz0fbPufmDQL6OehLBOik+Y3eDDamqJVVzRC6qGgq2TmzFEhgZyMfZSxrdApDUhMPjVUP7AUNm14PhhZwLP4w87T0+PowuXJsGV4+Dl4orOLpsqrWavdcJYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626191; c=relaxed/simple;
	bh=kihrXIMr9hHWLXef1Tj3ZL14rz9bX1cM8nUf+E9jFa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTivF5jzFeT+sYmrJmGKfa9n90TawQIcKYXuh6V4LneWEeksh+/uCwsc2AirhxvwYCHYI7Mde6LEEiV6K3HdmkkLXzj9fP2/MZq0QEosVwn8+hov18+83aS2CPN/TyTMMfUNTHecG4m5p59AuDgi8/g9nw8/rVXLXxW+3kGhelQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+pQHIyE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+pQHIyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFC2C4CEEC;
	Mon, 14 Apr 2025 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626190;
	bh=kihrXIMr9hHWLXef1Tj3ZL14rz9bX1cM8nUf+E9jFa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t+pQHIyE9JCuR6VZPxAOyGL0ycnrMlyDGFQfXaMtdklHLDv6579QEzman5UfCBG9i
	 XOkDHCVMX5ejCs+TqJxTP8ox5A/Wc1xk3fn5ydwYNQzNVIQoYNdLytkyI25sn4R/Fx
	 EV+S9SOkJcq3irVAaHSv6IUbZeEX3GAU0pbG2eY46pZwYd4J0tFWxX+9KF8znQ0Kxw
	 1TIlUlK+JbwATstQb3iyMnUnk/NJ3/A9crqiMYPgsRC85ALhAROa5EaprgidV4QWc8
	 oL7gw+py8g6hKilDQvLitDN8cWAYFOH2hw6URSTpohL7JXCdvHBdmGRqYGOH+vJZTl
	 WGps6YGfhkx+w==
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
Subject: [PATCH 01/17] rust: Rename timer_container_of() to hrtimer_container_of()
Date: Mon, 14 Apr 2025 12:22:35 +0200
Message-ID: <20250414102301.332225-2-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
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

