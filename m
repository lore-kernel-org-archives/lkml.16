Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79C209677;
	Mon,  3 Feb 2025 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595404; cv=none; b=sXFZ5MyBXOvgdGbebfWdk462/bD8Rj/s03TnrIJyCZ9OP8rx9Aj8CKZz/5Bm3IWHOPo6HeLDEemNmIflWTMQJ2VqPvxrOLcRDf6TqNWFlib5S+ekaOHHo5bUQm81wctKB8y7w2kQni2yQXuGqnsySG3+Ogq3pbVw7AaeskiHNQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595404; c=relaxed/simple;
	bh=tdx7r4vSfrS9rsxrw5JRdGhUboswpdY99BStdzOSy7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEJXkRHiskJi/2iRJIKRQu13atiL3aFJDJONNIXY6L81q9R1/faU5uvsX19AOQqlP8rOEbgKLjGcj6HwqiYUsUzLDvVvYZ+ARXPVc3orxcm2BTfmkkbHCCWyQxzM4AdOuP4uyF7EcJXuqt5aAfogGfhanFZAVAQIdnuoEUFTdQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+WSsG5N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+WSsG5N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA11FC4CEE0;
	Mon,  3 Feb 2025 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595403;
	bh=tdx7r4vSfrS9rsxrw5JRdGhUboswpdY99BStdzOSy7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u+WSsG5N3fY6KrRi8mjrr9/oBzTEK0HUPJ3M/NDQIMruc8WUXGz78BQMQnoM9PFGf
	 VjNG5CoyZpDJRmkG4LufoakBolhXm/Z/iINFMrqoPDeKQk1wNnmfP6RFVyZiHs1wz/
	 BJF67EbO1iYPVNU/hK/pIcHak807t6OMoXaiFUy7IuyEPMDuFsv4JrmucSOaE0kVU1
	 Q55ZAochBhFhot+QszswOuimTjUSqKwOAjxWRNCsC+KE0wKiabnjQRFjkEDFwsL2EA
	 2KGVZsuAgW/xANLonamKQ5j3IBxquZOKXFJThdKtDKoy02jh5J3FmsThrnT0cvSQoy
	 Q5S8hE3+Py9ug==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:50 +0100
Subject: [PATCH v7 04/14] rust: hrtimer: implement `HrTimerPointer` for
 `Arc`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-4-189144725399@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4151; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=tdx7r4vSfrS9rsxrw5JRdGhUboswpdY99BStdzOSy7M=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvRLXZYWWrH5PN9gONSE3JyhSufrV/q7leMo
 mefpd2A6mGJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db0QAKCRDhuBo+eShj
 dwY/D/49tDJZd1gG5GTepWDHZ+uluuU5dTYM6hex5rT6vEkW96gtpx9UXPKheP9maUCWGWIoQ2J
 yt4wHNJE0Kd4Fe3ggBuQvhfeX5MpB+IgqAlTBo9Cj9YK1Ii7jzz4tFP3weiM6oOuAINZUuoNnXQ
 GMYhkDQiKX2gLmw9/SlurIWJeGcsEIaCOVkhoV3I/M1QRgVSohoMbHxtAvEf0/31MPIYzxMmuZN
 nkZEiGsKxYNglTObqP81R1tg5rMQOceAzOESjkDXxTxUzvg1oW4Tw36C1C18xLcy4X+Bo6AHrYZ
 RNPEJ5+JGbZmQ0/23nqg+Ah7RSly2R9m2sELo9OJ/O1801MOqvYF+Q5yLi9yFFGfZ/Q4rN9NwrB
 aj458+ssdTd3KFw0nIyCnoSwwTAqn78BUsfPerbxoiGzZ6hCUJVSoY6SWem2NZxRBZxH1FuSbux
 s4293t36RmA4ArxCKiOr8GeLc4i9OVLjFazAqqLRKKKD7qvzQv6Td9n6pRn0kXXkQRojx8tjZ9Y
 7cmfBFDzuLhLqduOP5odnPiduEMNqgm9mjhCfBxZQFvMuwE1fJIZ0mCLNT47GK/4+5077p8+Kxz
 LYaiaQT+p28n5+zZa7fhnJesM5N8Ho45DbvIM6WmMUpe+ytbGItQdi2oafunye+woJFX7yv3+Gt
 1fdLc/Ig6z2hODw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This patch allows the use of intrusive `hrtimer` fields in structs that are
managed by an `Arc`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs     |  3 +-
 rust/kernel/time/hrtimer/arc.rs | 89 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index a6332924efabd40c475a112bbc434db77596a16f..3494c00481a4bd25735edf44b6bdcbec9810243e 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -119,7 +119,6 @@ unsafe fn raw_get(ptr: *const Self) -> *mut bindings::hrtimer {
     /// # Safety
     ///
     /// `self_ptr` must point to a valid `Self`.
-    #[allow(dead_code)]
     pub(crate) unsafe fn raw_cancel(self_ptr: *const Self) -> bool {
         // SAFETY: timer_ptr points to an allocation of at least `HrTimer` size.
         let c_timer_ptr = unsafe { HrTimer::raw_get(self_ptr) };
@@ -310,3 +309,5 @@ unsafe fn raw_get_timer(ptr: *const Self) ->
         }
     }
 }
+
+mod arc;
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d1c90631d00362bdc38be1ccc75429ae294ab544
--- /dev/null
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::HasHrTimer;
+use super::HrTimer;
+use super::HrTimerCallback;
+use super::HrTimerHandle;
+use super::HrTimerPointer;
+use super::RawHrTimerCallback;
+use crate::sync::Arc;
+use crate::sync::ArcBorrow;
+use crate::time::Ktime;
+
+/// A handle for an `Arc<HasHrTimer<T>>` returned by a call to
+/// [`HrTimerPointer::start`].
+pub struct ArcHrTimerHandle<T>
+where
+    T: HasHrTimer<T>,
+{
+    pub(crate) inner: Arc<T>,
+}
+
+// SAFETY: We implement drop below, and we cancel the timer in the drop
+// implementation.
+unsafe impl<T> HrTimerHandle for ArcHrTimerHandle<T>
+where
+    T: HasHrTimer<T>,
+{
+    fn cancel(&mut self) -> bool {
+        let self_ptr = Arc::as_ptr(&self.inner);
+
+        // SAFETY: As we obtained `self_ptr` from a valid reference above, it
+        // must point to a valid `T`.
+        let timer_ptr = unsafe { <T as HasHrTimer<T>>::raw_get_timer(self_ptr) };
+
+        // SAFETY: As `timer_ptr` points into `T` and `T` is valid, `timer_ptr`
+        // must point to a valid `HrTimer` instance.
+        unsafe { HrTimer::<T>::raw_cancel(timer_ptr) }
+    }
+}
+
+impl<T> Drop for ArcHrTimerHandle<T>
+where
+    T: HasHrTimer<T>,
+{
+    fn drop(&mut self) {
+        self.cancel();
+    }
+}
+
+impl<T> HrTimerPointer for Arc<T>
+where
+    T: Send + Sync,
+    T: HasHrTimer<T>,
+    T: for<'a> HrTimerCallback<CallbackTarget<'a> = Self>,
+{
+    type TimerHandle = ArcHrTimerHandle<T>;
+
+    fn start(self, expires: Ktime) -> ArcHrTimerHandle<T> {
+        // SAFETY: Since we generate the pointer passed to `start` from a
+        // valid reference, it is a valid pointer.
+        unsafe { T::start(Arc::as_ptr(&self), expires) };
+
+        ArcHrTimerHandle { inner: self }
+    }
+}
+
+impl<T> RawHrTimerCallback for Arc<T>
+where
+    T: HasHrTimer<T>,
+    T: for<'a> HrTimerCallback<CallbackTarget<'a> = Self>,
+    T: for<'a> HrTimerCallback<CallbackTargetParameter<'a> = ArcBorrow<'a, T>>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
+        // `HrTimer` is `repr(C)`
+        let timer_ptr = ptr.cast::<super::HrTimer<T>>();
+
+        // SAFETY: By C API contract `ptr` is the pointer we passed when
+        // queuing the timer, so it is a `HrTimer<T>` embedded in a `T`.
+        let data_ptr = unsafe { T::timer_container_of(timer_ptr) };
+
+        // SAFETY: `data_ptr` points to the `T` that was used to queue the
+        // timer. This `T` is contained in an `Arc`.
+        let receiver = unsafe { ArcBorrow::from_raw(data_ptr) };
+
+        T::run(receiver);
+
+        bindings::hrtimer_restart_HRTIMER_NORESTART
+    }
+}

-- 
2.47.0


