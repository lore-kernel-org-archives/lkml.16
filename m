Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80815208969;
	Mon,  3 Feb 2025 15:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595445; cv=none; b=aOuhLm17cKq9lYGheRyFa+zzGhQuDOu5I6SJmmNyUfmtlc71dV2yVIRtv0ayuyGIzi7N+ENhlgDWzysmlKdl55QOeCXRy7C3AXt58rI5Hla4HhiqRCwF9Sfw8X5vLW9kDQKKgCrCxmyBHItmcRk1GO27Q59ZEegM+aueRNAClRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595445; c=relaxed/simple;
	bh=z6dq9MgZd6A4V47mI6yKmeT701L5XLek+ujKgro9aNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyeA+iiAUYVbBDsYULuwaYRFXS8agZDapS7r+g/K6QGBOV/dS5Ju3UxbnzWAweEa5UPfiWsAV4U3GNYENWyWInyiACQ/PmHTIXWGtQDdpqoyK9gcnkqL+o1Afy4+AC7mqgnUw5a9KHh6FGNHVd5K00vgkdx6xr3ygS7D5FsbKIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCVHYx1V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCVHYx1V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A46C4CED2;
	Mon,  3 Feb 2025 15:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595444;
	bh=z6dq9MgZd6A4V47mI6yKmeT701L5XLek+ujKgro9aNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YCVHYx1VR1ox1m9YeTDbxRKZvQGyyHexZ5tMqu7XfBuKonkDe8WtJpWWHvb60Y6ol
	 +K+YBaVQp+YzJua1KmkM4x1dzNxwkmy8p/tu/edlik4sOqtv1iCIZdWHwh1KdDrTP9
	 ASrl2ypfCgvoHURbzfA8LwPnFv04DboCgAAJ2ckY809EJAS+n5VoTSdNrwMjaaHi97
	 BrEDrzHsgO9B7uj2hhnDhTxWM2jQgcWndwa2FMH7mHcD4YWzpKq2Yumdk8Abxtzj2k
	 PnN6bjkVjSlzIx4+SOrqJWfSkDTYsZIPuZqmPTHSLY9R+kMEJ9+KrHqqf1MplbG2QA
	 G9P1AMGX4leLA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:54 +0100
Subject: [PATCH v7 08/14] rust: hrtimer: implement `UnsafeHrTimerPointer`
 for `Pin<&T>`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-8-189144725399@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4086; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=z6dq9MgZd6A4V47mI6yKmeT701L5XLek+ujKgro9aNY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvVy4IOoK6JjwcmgPujlQnf56YPvFIt2FaVO
 CW5ERrL1b+JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db1QAKCRDhuBo+eShj
 d3psEAC/bW1FL17/2FuWme+MGhR/7Mb0z163fY6n2o50naQiYF92p4xKiBrS60IgwU/vg0fmy4x
 4M0XShqlLh3P6uhPdCZupUzRmO3uviEj5KQ0uCC46FeX0SH+boa+iQ7EDQHymRs994sMVDcr8Au
 BycTgFbFi5wm+RuDglMijm3QqZPaJQRltVUU2sUXIHBXNwhAO2Oyjq5C6Ou80LfHyOeEAKa2now
 T8OEYliSS/Vbp2vOV04WmcMXfG5hZJLBY+ScPEqqCt9XHvdHjMjCoJ5dNPtDKc21pcIeS0eZ+uD
 saACRpc7FyLKVKGHnSWH3lHT+SmOfHCbDzfy8BBDWzeNhiMeNGk4munlZEDtvWlt9PsoR8u4Zuo
 4a9r+Do7ZUt9O/blC4Q+AJ25rVIQoNggyZeDIoe97q6QAlqJsTXLuC0oUiWIJsafX6Ov0TT51P5
 13aW8L8I6H2Za1DW5B6BfwXjciA+5+7dJX5WFu4hTb4AzSyT6ZxAewzr6J9sj6iUamsVHHCK0eO
 lMIYgXUXCd0A6w2mAA/mQ096XWFsRubIa6ICr8/f/HApoFJG+NOXK4hn4i4+SKCpJUQLVjQSfeV
 D7AUJtT+jyJRHaVTEvAR1A3AP5KUmsRUjvbSa8SIFU/gtF6iT7tc+XHYi4g/dhp37lyNUpjQWX6
 5yW/kghcuw9KXBg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow pinned references to structs that contain a `HrTimer` node to be
scheduled with the `hrtimer` subsystem.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs     |  1 +
 rust/kernel/time/hrtimer/pin.rs | 95 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 4d39c3526a897cba3b76589f21d0866beaae0c4f..5d05c1bca8412a64f9ecdd79e0ec8f10afe800b5 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -401,3 +401,4 @@ unsafe fn raw_get_timer(ptr: *const Self) ->
 }
 
 mod arc;
+mod pin;
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ecab39118662e29a4e3e2ee365c25b7da7a953c5
--- /dev/null
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::HasHrTimer;
+use super::HrTimer;
+use super::HrTimerCallback;
+use super::HrTimerHandle;
+use super::RawHrTimerCallback;
+use super::UnsafeHrTimerPointer;
+use crate::time::Ktime;
+use core::pin::Pin;
+
+/// A handle for a `Pin<&HasHrTimer>`. When the handle exists, the timer might be
+/// running.
+pub struct PinHrTimerHandle<'a, T>
+where
+    T: HasHrTimer<T>,
+{
+    pub(crate) inner: Pin<&'a T>,
+}
+
+// SAFETY: We cancel the timer when the handle is dropped. The implementation of
+// the `cancel` method will block if the timer handler is running.
+unsafe impl<'a, T> HrTimerHandle for PinHrTimerHandle<'a, T>
+where
+    T: HasHrTimer<T>,
+{
+    fn cancel(&mut self) -> bool {
+        let self_ptr: *const T = self.inner.get_ref();
+
+        // SAFETY: As we got `self_ptr` from a reference above, it must point to
+        // a valid `T`.
+        let timer_ptr = unsafe { <T as HasHrTimer<T>>::raw_get_timer(self_ptr) };
+
+        // SAFETY: As `timer_ptr` is derived from a reference, it must point to
+        // a valid and initialized `HrTimer`.
+        unsafe { HrTimer::<T>::raw_cancel(timer_ptr) }
+    }
+}
+
+impl<'a, T> Drop for PinHrTimerHandle<'a, T>
+where
+    T: HasHrTimer<T>,
+{
+    fn drop(&mut self) {
+        self.cancel();
+    }
+}
+
+// SAFETY: We capture the lifetime of `Self` when we create a `PinHrTimerHandle`,
+// so `Self` will outlive the handle.
+unsafe impl<'a, T> UnsafeHrTimerPointer for Pin<&'a T>
+where
+    T: Send + Sync,
+    T: HasHrTimer<T>,
+    T: HrTimerCallback<CallbackTarget<'a> = Self>,
+{
+    type TimerHandle = PinHrTimerHandle<'a, T>;
+
+    unsafe fn start(self, expires: Ktime) -> Self::TimerHandle {
+        // Cast to pointer
+        let self_ptr: *const T = <Self as core::ops::Deref>::deref(&self);
+
+        // SAFETY: As we derive `self_ptr` from a reference above, it must point
+        // to a valid `T`.
+        unsafe { T::start(self_ptr, expires) };
+
+        PinHrTimerHandle { inner: self }
+    }
+}
+
+impl<'a, T> RawHrTimerCallback for Pin<&'a T>
+where
+    T: HasHrTimer<T>,
+    T: HrTimerCallback<CallbackTarget<'a> = Self>,
+    T: HrTimerCallback<CallbackTargetParameter<'a> = Self>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
+        // `HrTimer` is `repr(C)`
+        let timer_ptr = ptr as *mut HrTimer<T>;
+
+        // SAFETY: By the safety requirement of this function, `timer_ptr`
+        // points to a `HrTimer<T>` contained in an `T`.
+        let receiver_ptr = unsafe { T::timer_container_of(timer_ptr) };
+
+        // SAFETY: By the safety requirement of this function, `timer_ptr`
+        // points to a `HrTimer<T>` contained in an `T`.
+        let receiver_ref = unsafe { &*receiver_ptr };
+
+        // SAFETY: `receiver_ref` only exists as pinned, so it is safe to pin it
+        // here.
+        let receiver_pin = unsafe { Pin::new_unchecked(receiver_ref) };
+
+        T::run(receiver_pin).into()
+    }
+}

-- 
2.47.0


