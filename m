Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6B20A5EC;
	Mon,  3 Feb 2025 15:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595454; cv=none; b=ITkxR5alRMzKDs9gKFU8xZH7keyKETO8/HAN8LSH0o3odzcxJ8RjzFPXOYY/lt1ccewgo5VFJhQ3KlVNz+/ob1KHhq5koJPBeQ68Fv6XoqArpBhD/o9nQu4/PSopVSC+s5gMcaNimZXVjcIRT8nB1eU0n7wi9vy56VhD2hgfW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595454; c=relaxed/simple;
	bh=QmpIeaDX7rQ/r9mC0uOtqkDNaNC/fM0iAj5up4a4Wtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASLcmhmnW0ZOpzpFkcccmbbRi9R+tsR/AcuE3mz/n58XRiHjvRUABlOKWcMI3/X2HoRcDHxvbCRI6CWdknOj8Jcdprb84jFzs1uD/8PY2yPw1A263JiR+loKBREla5mXLhtC5kpdL2NO77ve79MXwWT/VwIuF2QrkklbEwOE00E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQ280ZQe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQ280ZQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FC4C4CED2;
	Mon,  3 Feb 2025 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595454;
	bh=QmpIeaDX7rQ/r9mC0uOtqkDNaNC/fM0iAj5up4a4Wtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uQ280ZQeyxx2ybDUUlBakOOfjneHGv9BUgwwj/kuVVxXFfOz2880h4JlWdXV9tDHW
	 +KQ24WpS59qJRr8eLsjlolOD7JDscPodNlQOJgk2F7dDy+O7aOyqjCOkNfODk5q70q
	 7Gzr0XtH1F73ImAjiZT1C1+UjOww738f2RUhcmbPckGqGM5c+jm19LS2v4nhbdNTVa
	 iI9JPUNx0MYr7kgXwvnzT1PQYuhnwWHcdaJ7oRZyqyQgp0wdC72o7XMo3ytIhZApcY
	 oDRH40SFA8JwwB5hwQN+8G+Nik3KimWAhoWYWC09SRntIyz1+iwfpz6nnAGliJc3ti
	 Zz8MpT4Qp9TcQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:57 +0100
Subject: [PATCH v7 11/14] rust: hrtimer: implement `HrTimerPointer` for
 `Pin<Box<T>>`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-11-189144725399@kernel.org>
References: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
In-Reply-To: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4491; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=QmpIeaDX7rQ/r9mC0uOtqkDNaNC/fM0iAj5up4a4Wtg=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvY/guIuvL0rR3vVhB/Hxk9lpH1cmkqvnlmE
 85R1oSEtJeJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db2AAKCRDhuBo+eShj
 d1vtEAClR1C2jFxkDR5euYrjB9vc14ZRWKw0Ue+fWy44xjXQRMgWTuBHxxN/TRINBGRrybenVVX
 1Y4akNlnIDNcYiAqfXR3yWJnN2Py/SCgsUdPTWwbmB9StCUBUJW77OQPfvn9w+UH45Cx31i3k1g
 ucQpu2FHcKvWvRXiFbVyqLD0JRPZAbhd/4fnG1XjgXUd8CkJEvCYo2+SZjyQC0443AvF8VkMI/e
 cRsHAUjp2O6w4H7/sF1WpnRChRFMlIET9XtvgfPvxdo49kcNchwD+2YSr050v9fhDgZmWndjaq1
 PItorqmhgfgnRcrjRODwKDItlM2DfMnx6sW3/POP+wanbkZ0H8tuq6pZlxzkPzZd0j8EIJopQKz
 aUltYGjrQqzp/N08O/65qjFX2FTyCRld9VDE3PkvwuAXKkWHbjeYF/GVJ346DKEHNI2/+AGVwKY
 ze5FjmGm5xZBX0Gt/d4twtzYr17nj1b5u2qoBUJPciOkTGFpsrr7+4dMHcKB0b9kbSeEGI+Cy3Z
 IE6gwD1qZJ19mk+Gwj42vf9i40Pkepev3AamGOTmxFdleyTvaVo2WZ1ziI8DQD104keGJqiaekm
 9gLo6StXXAO/0YqCXV9d8ATkS0jB9/wFH5e5bnoJXFP/1mLsK81atgAVyfYWCJG2nIvCb6yUyn4
 SOb1Q7Gp5WfW+pw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow `Pin<Box<T>>` to be the target of a timer callback.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs      |   2 +
 rust/kernel/time/hrtimer/tbox.rs | 102 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 69b3737f16978657531ea2bf97a1fff56cc91195..5eaf86fd099566e9d837a1d394e666fcb8f8dab4 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -403,3 +403,5 @@ unsafe fn raw_get_timer(ptr: *const Self) ->
 mod arc;
 mod pin;
 mod pin_mut;
+// `box` is a reserved keyword, so prefix with `t` for timer
+mod tbox;
diff --git a/rust/kernel/time/hrtimer/tbox.rs b/rust/kernel/time/hrtimer/tbox.rs
new file mode 100644
index 0000000000000000000000000000000000000000..39db96de023a8caa69442591c73b2e1322df3a30
--- /dev/null
+++ b/rust/kernel/time/hrtimer/tbox.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::HasHrTimer;
+use super::HrTimer;
+use super::HrTimerCallback;
+use super::HrTimerHandle;
+use super::HrTimerPointer;
+use super::RawHrTimerCallback;
+use crate::prelude::*;
+use crate::time::Ktime;
+use core::mem::ManuallyDrop;
+
+/// A handle for a [`Box<HasHrTimer<T>>`] returned by a call to
+/// [`HrTimerPointer::start`].
+pub struct BoxHrTimerHandle<T, A>
+where
+    T: HasHrTimer<T>,
+    A: crate::alloc::Allocator,
+{
+    pub(crate) inner: *mut T,
+    _p: core::marker::PhantomData<A>,
+}
+
+// SAFETY: We implement drop below, and we cancel the timer in the drop
+// implementation.
+unsafe impl<T, A> HrTimerHandle for BoxHrTimerHandle<T, A>
+where
+    T: HasHrTimer<T>,
+    A: crate::alloc::Allocator,
+{
+    fn cancel(&mut self) -> bool {
+        // SAFETY: As we obtained `self.inner` from a valid reference when we
+        // created `self`, it must point to a valid `T`.
+        let timer_ptr = unsafe { <T as HasHrTimer<T>>::raw_get_timer(self.inner) };
+
+        // SAFETY: As `timer_ptr` points into `T` and `T` is valid, `timer_ptr`
+        // must point to a valid `HrTimer` instance.
+        unsafe { HrTimer::<T>::raw_cancel(timer_ptr) }
+    }
+}
+
+impl<T, A> Drop for BoxHrTimerHandle<T, A>
+where
+    T: HasHrTimer<T>,
+    A: crate::alloc::Allocator,
+{
+    fn drop(&mut self) {
+        self.cancel();
+        // SAFETY: `self.inner` came from a `Box::into_raw` call
+        drop(unsafe { Box::<T, A>::from_raw(self.inner) })
+    }
+}
+
+impl<T, A> HrTimerPointer for Pin<Box<T, A>>
+where
+    T: Send + Sync,
+    T: HasHrTimer<T>,
+    T: for<'a> HrTimerCallback<CallbackTarget<'a> = Pin<Box<T, A>>>,
+    T: for<'a> HrTimerCallback<CallbackTargetParameter<'a> = Pin<&'a T>>,
+    A: crate::alloc::Allocator,
+{
+    type TimerHandle = BoxHrTimerHandle<T, A>;
+
+    fn start(self, expires: Ktime) -> Self::TimerHandle {
+        let self_ptr: *const T = <Self as core::ops::Deref>::deref(&self);
+
+        // SAFETY: Since we generate the pointer passed to `start` from a valid
+        // reference, it is a valid pointer.
+        unsafe { T::start(self_ptr, expires) };
+
+        // SAFETY: We will not move out of this box during timer callback (we
+        // pass an immutable reference to the callback).
+        let inner = unsafe { Pin::into_inner_unchecked(self) };
+
+        BoxHrTimerHandle {
+            inner: Box::into_raw(inner),
+            _p: core::marker::PhantomData,
+        }
+    }
+}
+
+impl<T, A> RawHrTimerCallback for Pin<Box<T, A>>
+where
+    T: HasHrTimer<T>,
+    T: for<'a> HrTimerCallback<CallbackTarget<'a> = Pin<Box<T, A>>>,
+    T: for<'a> HrTimerCallback<CallbackTargetParameter<'a> = Pin<&'a T>>,
+    A: crate::alloc::Allocator,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
+        // `HrTimer` is `repr(C)`
+        let timer_ptr = ptr.cast::<super::HrTimer<T>>();
+
+        // SAFETY: By C API contract `ptr` is the pointer we passed when
+        // queuing the timer, so it is a `HrTimer<T>` embedded in a `T`.
+        let data_ptr = unsafe { T::timer_container_of(timer_ptr) };
+
+        // SAFETY: We called `Box::into_raw` when we queued the timer.
+        let tbox = ManuallyDrop::new(Box::into_pin(unsafe { Box::<T, A>::from_raw(data_ptr) }));
+
+        T::run(tbox.as_ref()).into()
+    }
+}

-- 
2.47.0


