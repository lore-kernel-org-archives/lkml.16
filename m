Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77A91E521B;
	Tue,  3 Jun 2025 20:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748984067; cv=none; b=O+ixBJ6t4QCxqE7hDCutolnGTreeEYRZoCYhfFQ7Fx5M3GF8cyandD0gqbDW6xIt1bfF95qRDDNaDnlIYE6Pf5ReSlF04r+gxFT2UCKjmsv+uDOfOYyLdTIBas5soJ9wKf4y/W46S9s9a6nJEu4u840C1aqwvzzmVFtglWxxU+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748984067; c=relaxed/simple;
	bh=iWuTfdwizN9RZg+jwNRh6I/xoIQNOtqmjns3k6bepnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BULZPYFOzRdfW/V+4LiFVisJrW12dgddNXv+DqD2EwE9sEiV8aMo/cXhrDhprSwl3iIF7HML9Lxk/8Q407e0SwsAGnfsP82WVuMfTqEp5F91etJnVR7KCiNzdMEOHP0kP6X0IxpXrl1pa9yuglL0p/uGCG/FOe3R6b3dOpxLZFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iockyDZs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iockyDZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CE3C4CEF2;
	Tue,  3 Jun 2025 20:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748984067;
	bh=iWuTfdwizN9RZg+jwNRh6I/xoIQNOtqmjns3k6bepnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iockyDZsU7K48L+zyP7CIOaidzJdhQIVKSJLw+9B7gocActjndyP9C1O91oI9H51r
	 rwIIJ5mF0Pr0p73pCDV4JyNfDXdAZA/1qg9Z+6POvsDwaArtNxnl+ZPMWxGxF2nAtM
	 TBYncnYXeiruj79mxO6ssM7ucR2zsn4mtFuw/68I4n0VJULCjaGlTIcsezHc7SvYS9
	 MCHv5lcM7V7SAT5K2wzloskgwBaM17uwmL/10h62a4CTJQsoRgUoGFmfVfGSP1DxXb
	 eoThBB6xIITAHfRBok4DVsS1MHbyg6V0mmWSAUb+sVFj/3Pa2B9OaPX36WROrKwL6j
	 cbijM/9/5m10g==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	chrisi.schrefl@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: [PATCH 1/3] rust: completion: implement initial abstraction
Date: Tue,  3 Jun 2025 22:48:50 +0200
Message-ID: <20250603205416.49281-2-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603205416.49281-1-dakr@kernel.org>
References: <20250603205416.49281-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement a minimal abstraction for the completion synchronization
primitive.

This initial abstraction only adds complete_all() and
wait_for_completion(), since that is what is required for the subsequent
Devres patch.

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/completion.c       |   8 +++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/sync.rs             |   2 +
 rust/kernel/sync/completion.rs  | 111 ++++++++++++++++++++++++++++++++
 5 files changed, 123 insertions(+)
 create mode 100644 rust/helpers/completion.c
 create mode 100644 rust/kernel/sync/completion.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a5a6fb45d405..9da3fe89295c 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -17,6 +17,7 @@
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
 #include <linux/clk.h>
+#include <linux/completion.h>
 #include <linux/configfs.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
new file mode 100644
index 000000000000..b2443262a2ae
--- /dev/null
+++ b/rust/helpers/completion.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/completion.h>
+
+void rust_helper_init_completion(struct completion *x)
+{
+	init_completion(x);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 805307018f0e..7a5c520be8cb 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -13,6 +13,7 @@
 #include "build_assert.c"
 #include "build_bug.c"
 #include "clk.c"
+#include "completion.c"
 #include "cpufreq.c"
 #include "cpumask.c"
 #include "cred.c"
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 36a719015583..c23a12639924 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -10,6 +10,7 @@
 use pin_init;
 
 mod arc;
+pub mod completion;
 mod condvar;
 pub mod lock;
 mod locked_by;
@@ -17,6 +18,7 @@
 pub mod rcu;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
+pub use completion::Completion;
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
 pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
 pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
new file mode 100644
index 000000000000..4ec4c2aa73a5
--- /dev/null
+++ b/rust/kernel/sync/completion.rs
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Completion support.
+//!
+//! Reference: <https://docs.kernel.org/scheduler/completion.html>
+//!
+//! C header: [`include/linux/completion.h`](srctree/include/linux/completion.h)
+
+use crate::{bindings, prelude::*, types::Opaque};
+
+/// Synchronization primitive to signal when a certain task has been completed.
+///
+/// The [`Completion`] synchronization primitive signales when a certain task has been completed by
+/// waking up other tasks that can queue themselves up to wait for the [`Completion`] to be
+/// completed.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::{Arc, Completion};
+/// use kernel::workqueue::{self, impl_has_work, new_work, Work, WorkItem};
+///
+/// #[pin_data]
+/// struct MyTask {
+///     #[pin]
+///     work: Work<MyTask>,
+///     #[pin]
+///     done: Completion,
+/// }
+///
+/// impl_has_work! {
+///     impl HasWork<Self> for MyTask { self.work }
+/// }
+///
+/// impl MyTask {
+///     fn new() -> Result<Arc<Self>> {
+///         let this = Arc::pin_init(pin_init!(MyTask {
+///             work <- new_work!("MyTask::work"),
+///             done <- Completion::new(),
+///         }), GFP_KERNEL)?;
+///
+///         let _ = workqueue::system().enqueue(this.clone());
+///
+///         Ok(this)
+///     }
+///
+///     fn wait_for_completion(&self) {
+///         self.done.wait_for_completion();
+///
+///         pr_info!("Completion: task complete\n");
+///     }
+/// }
+///
+/// impl WorkItem for MyTask {
+///     type Pointer = Arc<MyTask>;
+///
+///     fn run(this: Arc<MyTask>) {
+///         // process this task
+///         this.done.complete_all();
+///     }
+/// }
+///
+/// let task = MyTask::new()?;
+/// task.wait_for_completion();
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data]
+pub struct Completion {
+    #[pin]
+    inner: Opaque<bindings::completion>,
+}
+
+impl Completion {
+    /// Create an initializer for a new [`Completion`].
+    pub fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            inner <- Opaque::ffi_init(|slot: *mut bindings::completion| {
+                // SAFETY: `slot` is a valid pointer to an uninitialized `struct completion`.
+                unsafe { bindings::init_completion(slot) };
+            }),
+        })
+    }
+
+    fn as_raw(&self) -> *mut bindings::completion {
+        self.inner.get()
+    }
+
+    /// Signal all tasks waiting on this completion.
+    ///
+    /// This method wakes up all tasks waiting on this completion; after this operation the
+    /// completion is permanently done.
+    pub fn complete_all(&self) {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        unsafe { bindings::complete_all(self.as_raw()) };
+    }
+
+    /// Wait for completion of a task.
+    ///
+    /// This method waits for the completion of a task; it is not interruptible and there is no
+    /// timeout.
+    pub fn wait_for_completion(&self) {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        unsafe { bindings::wait_for_completion(self.as_raw()) };
+    }
+}
+
+// SAFETY: `Completion` is safe to be send to any task.
+unsafe impl Send for Completion {}
+
+// SAFETY: `Completion` is safe to be accessed concurrently.
+unsafe impl Sync for Completion {}
-- 
2.49.0

