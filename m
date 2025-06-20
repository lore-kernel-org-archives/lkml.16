Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4BC1CAA6D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420185; cv=none; b=YEOxpGfrV8qCJoMqDbDj0FQYAJSIu+RIXRW/0eKCKq5i3ILNJQoPiOl8wmWr3BDEGEvVnomjtoXL5HrTcnkFXPJxebIrwcR7Yw0pybYsHc3rzmKtCxLscih0XsQHDK7KV4/wJJaryw38fngT7TUDMBaziUGwkhBY2w7hiceWJeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420185; c=relaxed/simple;
	bh=iYcWysrw+50j+9IEeqBdWM5KrP5ED7xiKHUq2pSfPvE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=n2KXi6tLsxLKiX+oYKdVxQdwRvFG8Cw60Kph0Znko2tdQSrKXfSnAHD3/05HrpK+ikJZIkJY133LUQbssMF/iCTFI8Sc2J7uc/2jHGNcBV6gP+IqlPjm4vORBUXrf5YSvMsXyfIYU2So8LQIlIBJh8n2w1wNFHbSns9cbKEc/YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ulCI1cQz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ulCI1cQz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4532514dee8so13411085e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 04:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750420182; x=1751024982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=osALxqpKlzPFa1tkBcSzMAGIeg6+FRzFxocb6BFYLtY=;
        b=ulCI1cQzyGA4iSbzQlkuhGRGXv3b24cj6g6crDQdmGt0HD5O6HDtxDS+B4WahVHlWm
         bRglcsRxt2Cel81WGR6eV+FzD5U78G9sD82rz+UteA0P5nlYfhjRCxbQd2TOqINTSeBi
         eXXwrDiEHmZNOioJ9s7nHcmG8QsLBDZVUL7w2mnIb3tPhRVqK9KFQuIUR+FJODkRVXNE
         85z26XxmFRisroMXlPeC72AqGnmKrY8q3XqMIjVdSoWMxu1RodEuRtKD5+mLHzCVANVs
         PnEsP3tTxDHEG/rwQpjXU/krT8KPC1eCQio93VYxWzRezuqiSRvPSBv+GgXWOprv5T8c
         +XOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750420182; x=1751024982;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osALxqpKlzPFa1tkBcSzMAGIeg6+FRzFxocb6BFYLtY=;
        b=qoJIN52yNfk+XeycL6iPAKO3NZnxP/PrXVTbs6ahsGp2Ogt+9pRyB5LUwaYik7QSFS
         CyVGDnJHTceZAqKOL+ppb0fPRhwdlmOXDhmMShNC6RU4U6QkMUt+PyU5SuVdcgos1iMJ
         FslackeCSdMkIwsMQgpVB1/VR4Ii0kLkZVAArbcgm8l8kUxvwr2POLVV8N1emEVesslu
         g0b75ShVGNdihWwpOxfWm+nmpy2Sod4NUoNp/5ReAORGiHRdLhkSEfjcWaRuq821mlfx
         S2sx2ayodqSvxP8SnDER2DVvKOwJHcX80cTIbisfYx21NZYtf6pRQG2XTnJzykpWpjME
         xH4w==
X-Forwarded-Encrypted: i=1; AJvYcCUKoeRH7S4FEQLTdqp9h+0pygXWZIp4XU8Ashw6tWqV60393k5+WBRcdAEBtgiSncLsh4RQP+e21j0ug+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8UOOQbPiBFADBmgUCt9jfFI3VEvOJ5myj+IhtjBuYl0YFyOb
	WMqrIocbtjdzQEc6QkQFE0S5Vs+m5LPoUonBlMcVSJyAK3fCqM/2lAJnGKWta2UpnyqJGsbInNE
	987dwLIigddQFjzI7Ug==
X-Google-Smtp-Source: AGHT+IFXZluW9vjRa/UB5oPmtlNwMPAUSfTUT0iOsUDG4USvhFDRhmzfMEgUj47CN6VNy38IHOWMWFvqOU1ARic=
X-Received: from wmbbd6.prod.google.com ([2002:a05:600c:1f06:b0:450:d422:69f9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:23c2:b0:3a5:2ef8:34f9 with SMTP id ffacd0b85a97d-3a6d12fc23bmr1583422f8f.27.1750420182429;
 Fri, 20 Jun 2025 04:49:42 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:49:35 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM9KVWgC/x2MQQqAIBAAvxJ7bsGEFuwr0cFqrQXR0Iog/HvSb
 eYw80LmJJxhaF5IfEuWGKp0bQPLbsPGKGt10Er3irTCI3qPp509Y7gqzs5YsrT0ZBhqdSR28vz HcSrlA/cUDRthAAAA
X-Change-Id: 20250620-poll-table-null-bf9a6a6c569e
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6621; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=iYcWysrw+50j+9IEeqBdWM5KrP5ED7xiKHUq2pSfPvE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoVUrUp5UNN8n2PVnEUCVOoCMu1GnBMLMSBTy0Z
 p29Pfof6IKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFVK1AAKCRAEWL7uWMY5
 Rob2D/9v6AEDnDI7C4zX9iONvfRYtwMhtpvexvE8CIeZcgUTigpxQBLVkeCCYTt299BYvX5XYKK
 oHfVcOV/UV9N+4Y3y3uKn5dPRmEnvORbOd5znNlF/KvulLw6H62RywQlTB21VRROEr5rF9rlGIX
 Y+DE9aULDI/LSMRGbGaPScvpc+A7AG8xlm/utE/1HGI0qMX85PjprNYfm3rEajZOlaQCUfnPvxA
 NxTyQcgMu2oijhQrFleTiKycS8xn0YIJr9g/gd+2QvmaONc4wbTZakHq0CS3gUUf03V9MCiuA92
 mcranE2Nitol2ZVbWTw+/UN6scbBdQLydTD3lvjvJTkS54tHUlQdKWxquNyIb1B8nBxiFjQvN8T
 5/KEjNNrszj3lK/VZ7aZITg2IhHCpvLLlz49cBUwgJvsgGl3I8w4Y3o5PxqWc5G4s93x+ccI6Sz
 Vfrv8P+0ek5QB9nHVhX0ACzLTt0ff9chM50WR+YV7CuxCMBrlbuxszxQVF/8xhTiP9ae/52Z5WZ
 5Bgf/Ps2uY1LYMb5cQ4yhBRCfE4ENTmq7xaL5rH+O55wo9uNOdtr26wQ5Znvnq0wTVUx7e0aU/O
 I+saGg5TooOBjmApiEOgbwkfjDAq5WJo/FTWwcmHJ9DmA6SIg2l0iBCehzz/fBf7AClfuhHDOWw Emcfq4KkZn8XVAw==
X-Mailer: b4 0.14.2
Message-ID: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com>
Subject: [PATCH] poll: rust: allow poll_table ptrs to be null
From: Alice Ryhl <aliceryhl@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

It's possible for a poll_table to be null. This can happen if an
end-user just wants to know if a resource has events right now without
registering a waiter for when events become available. Furthermore,
these null pointers should be handled transparently by the API, so we
should not change `from_ptr` to return an `Option`. Thus, change
`PollTable` to wrap a raw pointer rather than use a reference so that
you can pass null.

Comments mentioning `struct poll_table` are changed to just `poll_table`
since `poll_table` is a typedef. (It's a typedef because it's supposed
to be opaque.)

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This issue was discovered from a syzkaller report on Rust Binder.

Intended for Christian Brauner's tree.
---
 rust/helpers/helpers.c   |  1 +
 rust/helpers/poll.c      | 10 ++++++++
 rust/kernel/sync/poll.rs | 65 +++++++++++++++++-------------------------------
 3 files changed, 34 insertions(+), 42 deletions(-)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0f1b5d11598591bc62bb6439747211af164b76d6..ff65073fe3a5220e7792306fc9ae74c416935a52 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -30,6 +30,7 @@
 #include "platform.c"
 #include "pci.c"
 #include "pid_namespace.c"
+#include "poll.c"
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
diff --git a/rust/helpers/poll.c b/rust/helpers/poll.c
new file mode 100644
index 0000000000000000000000000000000000000000..7e5b1751c2d526f2dd467fcd61dcf49294d3c20d
--- /dev/null
+++ b/rust/helpers/poll.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/poll.h>
+
+void rust_helper_poll_wait(struct file *filp, wait_queue_head_t *wait_address,
+			   poll_table *p)
+{
+	poll_wait(filp, wait_address, p);
+}
diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d7e6e59e124b09d5f0d62244ca46089e0748d544..f86e3e565e7e6a6d244a01d34113beb9e799e424 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -9,9 +9,8 @@
     fs::File,
     prelude::*,
     sync::{CondVar, LockClassKey},
-    types::Opaque,
 };
-use core::ops::Deref;
+use core::{marker::PhantomData, ops::Deref};
 
 /// Creates a [`PollCondVar`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -23,58 +22,40 @@ macro_rules! new_poll_condvar {
     };
 }
 
-/// Wraps the kernel's `struct poll_table`.
+/// Wraps the kernel's `poll_table`.
 ///
 /// # Invariants
 ///
-/// This struct contains a valid `struct poll_table`.
-///
-/// For a `struct poll_table` to be valid, its `_qproc` function must follow the safety
-/// requirements of `_qproc` functions:
-///
-/// * The `_qproc` function is given permission to enqueue a waiter to the provided `poll_table`
-///   during the call. Once the waiter is removed and an rcu grace period has passed, it must no
-///   longer access the `wait_queue_head`.
+/// The pointer must be null or reference a valid `poll_table`.
 #[repr(transparent)]
-pub struct PollTable(Opaque<bindings::poll_table>);
+pub struct PollTable<'a> {
+    table: *mut bindings::poll_table,
+    _lifetime: PhantomData<&'a bindings::poll_table>,
+}
 
-impl PollTable {
-    /// Creates a reference to a [`PollTable`] from a valid pointer.
+impl<'a> PollTable<'a> {
+    /// Creates a [`PollTable`] from a valid pointer.
     ///
     /// # Safety
     ///
-    /// The caller must ensure that for the duration of `'a`, the pointer will point at a valid poll
-    /// table (as defined in the type invariants).
-    ///
-    /// The caller must also ensure that the `poll_table` is only accessed via the returned
-    /// reference for the duration of `'a`.
-    pub unsafe fn from_ptr<'a>(ptr: *mut bindings::poll_table) -> &'a mut PollTable {
-        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
-        // `PollTable` type being transparent makes the cast ok.
-        unsafe { &mut *ptr.cast() }
-    }
-
-    fn get_qproc(&self) -> bindings::poll_queue_proc {
-        let ptr = self.0.get();
-        // SAFETY: The `ptr` is valid because it originates from a reference, and the `_qproc`
-        // field is not modified concurrently with this call since we have an immutable reference.
-        unsafe { (*ptr)._qproc }
+    /// The pointer must be null or reference a valid `poll_table` for the duration of `'a`.
+    pub unsafe fn from_raw(table: *mut bindings::poll_table) -> Self {
+        // INVARIANTS: The safety requirements are the same as the struct invariants.
+        PollTable {
+            table,
+            _lifetime: PhantomData,
+        }
     }
 
     /// Register this [`PollTable`] with the provided [`PollCondVar`], so that it can be notified
     /// using the condition variable.
-    pub fn register_wait(&mut self, file: &File, cv: &PollCondVar) {
-        if let Some(qproc) = self.get_qproc() {
-            // SAFETY: The pointers to `file` and `self` need to be valid for the duration of this
-            // call to `qproc`, which they are because they are references.
-            //
-            // The `cv.wait_queue_head` pointer must be valid until an rcu grace period after the
-            // waiter is removed. The `PollCondVar` is pinned, so before `cv.wait_queue_head` can
-            // be destroyed, the destructor must run. That destructor first removes all waiters,
-            // and then waits for an rcu grace period. Therefore, `cv.wait_queue_head` is valid for
-            // long enough.
-            unsafe { qproc(file.as_ptr() as _, cv.wait_queue_head.get(), self.0.get()) };
-        }
+    pub fn register_wait(&self, file: &File, cv: &PollCondVar) {
+        // SAFETY: The pointers `self.table` and `file` are valid for the duration of this call.
+        // The `cv.wait_queue_head` pointer must be valid until an rcu grace period after the
+        // waiter is removed. The `PollCondVar` is pinned, so before `cv.wait_queue_head` can be
+        // destroyed, the destructor must run. That destructor first removes all waiters, and then
+        // waits for an rcu grace period. Therefore, `cv.wait_queue_head` is valid for long enough.
+        unsafe { bindings::poll_wait(file.as_ptr(), cv.wait_queue_head.get(), self.table) }
     }
 }
 

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-poll-table-null-bf9a6a6c569e

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

