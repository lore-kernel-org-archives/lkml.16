Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F50E208969;
	Mon,  3 Feb 2025 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595449; cv=none; b=cmkQtYe3dFT4Yl7FfEvtkHikvbzFx8uf85zo/hYf/UaBiWs6OBdCnONcvCjvGZDHYL95etpgIZXmHaAQmk/d3dioPBmOgF3lrLDCJYTex7cNjJo098xJwS7x/+zBMiBpjRXpwAsgLrohDzCiAqUq/rBZGfu5yEtRhzkAjnkWlVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595449; c=relaxed/simple;
	bh=0qlzk7jze9SXmQAdiXzFi4GXjUZy+CtrVoviTRMScZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pjelPklwqnVh9nWIMzLfIQ1uDNFpYQSJjhAmgc4UZMpvqFH5DYlVVjnuD58BlIY6Y9mGzNodSdF2oAebgSbtDQ9+xC9lkmb0l+14+R4NCg7Oa2k/cwPzb33AT1p0S2O7fYPEB5KDUXNXnt5mz2O55GhHMDPXSu5RbdH6V3a3Omk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElCx8IOh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElCx8IOh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CAEC4CEE3;
	Mon,  3 Feb 2025 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595449;
	bh=0qlzk7jze9SXmQAdiXzFi4GXjUZy+CtrVoviTRMScZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ElCx8IOhS4OBfEAOb+A0V30XYpMFJItYkgG30x0tpoiAGJjArF09xvxlstlZtQ0cE
	 7AxYklpKwYYPBt0eTrG3VIiS7eKhlpeiaMSvyx9cP6icPD73dQWebtgdcPmUcTMhfs
	 jyPksXSMD2RqsxyT/+pbSFS33QqgRl7GDavepZ3hazu1ohwQ+lxdpw2OnDtPp2ubSL
	 d7Kp54J5GWzLpXKvpjEx0MX0ipg2rjUVqAETP1BcxoRJg6NOznMOt7JNO5ZjYc++Bo
	 xgZZVR+UAH08FudqfnUCY9FnzXQZT++moH9ASVun+kg1IVx2D3NxKWor3V/LDkKWeR
	 ywNfmQfLVfMcw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:55 +0100
Subject: [PATCH v7 09/14] rust: hrtimer: implement `UnsafeHrTimerPointer`
 for `Pin<&mut T>`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-9-189144725399@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4300; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=0qlzk7jze9SXmQAdiXzFi4GXjUZy+CtrVoviTRMScZ0=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvWe/3xQVpNrGBnhe3rCMr+quwU69itcp5Yv
 Sf8QivYLMmJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db1gAKCRDhuBo+eShj
 d7DlD/9ZLYfVo5gNl3RDJciDkXSQ1u71vGRAWPE4rnuyc3LjN144s7PWWg6LsY+DRAxJiE/FzN2
 akcnFmvEpzm/kBnt8LfoK/VuIMSGIGHotfLFaM5KZmBUH6+MkSBMeEEZ65L6Fp9hioQRX6Gk1ym
 nC6Wauq7MYnq+pdzu/gEesgrAYwXWpIhHJuiqldk3WaXGAcSEbEXQpzqNFLNm66jJa7gVkBz62K
 YBB+g7LAmLyxClzLnrOTsc3is39W/psa6uMGntoHEGPqLgAt9ssxq5/A6X9SNvGCsSlW9f39wXP
 Bk7oTUjhZ0FRYvqTSUWE2P4FvR5xBiBXwooQ4GcTwHzgVgG6nhzQL8Gn3TvKOKklmNzHWaqs8zh
 3nleUE5P8rxT5pcAjL63nNkB5zsLbNRsga8N9YsslxdjhCidLtl0xmavhQ5gKs0ZDKFNm1cAw6p
 gkQpQrzHYOZ/GR6oL+9JMbn23GBVzSm/ipUupI8kP6KEb+Zcpe8BR8xEowmUFhw2nNa+8Wb8Av6
 jxFYan/mNm/RTC+scOj5pF/5S0iUPM8iWIN0/UJ6ORXaSXoEcUeLpqcAaFg6eNMwcxPdX4wtgZ6
 Ouse3ILTEw5Y8cH8k/Vr87kQiwSc2wTt+u4upz6gM1jF7w4Qnmiozsu3XWTGDxun3Wj47waD2Xk
 iz8AXmFS1t26M8g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow pinned mutable references to structs that contain a `HrTimer` node to
be scheduled with the `hrtimer` subsystem.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs         |  1 +
 rust/kernel/time/hrtimer/pin_mut.rs | 97 +++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 5d05c1bca8412a64f9ecdd79e0ec8f10afe800b5..69b3737f16978657531ea2bf97a1fff56cc91195 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -402,3 +402,4 @@ unsafe fn raw_get_timer(ptr: *const Self) ->
 
 mod arc;
 mod pin;
+mod pin_mut;
diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
new file mode 100644
index 0000000000000000000000000000000000000000..153e89b86caf25f0c1b7e9e3b34940e57600d2d5
--- /dev/null
+++ b/rust/kernel/time/hrtimer/pin_mut.rs
@@ -0,0 +1,97 @@
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
+/// A handle for a `Pin<&mut HasHrTimer>`. When the handle exists, the timer might
+/// be running.
+pub struct PinMutHrTimerHandle<'a, T>
+where
+    T: HasHrTimer<T>,
+{
+    pub(crate) inner: Pin<&'a mut T>,
+}
+
+// SAFETY: We cancel the timer when the handle is dropped. The implementation of
+// the `cancel` method will block if the timer handler is running.
+unsafe impl<'a, T> HrTimerHandle for PinMutHrTimerHandle<'a, T>
+where
+    T: HasHrTimer<T>,
+{
+    fn cancel(&mut self) -> bool {
+        // SAFETY: We are not moving out of `self` or handing out mutable
+        // references to `self`.
+        let self_ptr = unsafe { self.inner.as_mut().get_unchecked_mut() as *mut T };
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
+impl<'a, T> Drop for PinMutHrTimerHandle<'a, T>
+where
+    T: HasHrTimer<T>,
+{
+    fn drop(&mut self) {
+        self.cancel();
+    }
+}
+
+// SAFETY: We capture the lifetime of `Self` when we create a
+// `PinMutHrTimerHandle`, so `Self` will outlive the handle.
+unsafe impl<'a, T> UnsafeHrTimerPointer for Pin<&'a mut T>
+where
+    T: Send + Sync,
+    T: HasHrTimer<T>,
+    T: HrTimerCallback<CallbackTarget<'a> = Self>,
+{
+    type TimerHandle = PinMutHrTimerHandle<'a, T>;
+
+    unsafe fn start(self, expires: Ktime) -> Self::TimerHandle {
+        // Cast to pointer
+        let self_ptr: *const T = <Self as core::ops::Deref>::deref(&self);
+
+        // SAFETY: As we derive `self_ptr` from a reference above, it must point
+        // to a valid `T`.
+        unsafe { T::start(self_ptr, expires) };
+
+        PinMutHrTimerHandle { inner: self }
+    }
+}
+
+impl<'a, T> RawHrTimerCallback for Pin<&'a mut T>
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
+        let receiver_ref = unsafe { &mut *receiver_ptr };
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


