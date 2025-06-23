Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C764E2561D9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687055; cv=none; b=GE8br151vpAvzFhMgS0M+aFGO9XZa9vKTZq8aaBiSvgTu+KfIa7dgMQr57f0WI0PiWpQOMwGj1ue4rqPeJvhQkW+GwZZMKXAmIGTbT595Ve0Fn2+uW+b5TTEp2x2l1xgt0eRby0QNleI44tFQoRSD6+kNT02A7PVjxrqruaurdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687055; c=relaxed/simple;
	bh=2t3YQ1+iDGqoFk0JWiw+F8ieR6NrXZIS0LcyrI8jDzE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oEn5EiCiXDREGRFnI45gv+RulY4nEedIur3YQh5MvkvRH4FK8CS8ekjpFVKtt46cjTlhNwFjIpGbrdntuZH4oEU1rIKqA3S9i4+h/5XBJ1fOLSXsmZwMM28pitOjPs51mWb3O/OFk2xoczblaD7WtLiaZsmc06q7eZAyLibGpV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nyWeJ5id; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nyWeJ5id"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so21556105e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750687052; x=1751291852; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pe80s/Z2Rf2nyL6DrwRxXyxaDYlnzGJXM4+hg4JQ2Tk=;
        b=nyWeJ5ideQSLnaU3tlhsHueveNxXn3UKkbRaQ66D1Ce8WWpZiun2BzLx7lLNtJza8d
         43P9nhANsKsukoP+seAy1hhlmn0FCgcsT9A5xNczaR9NJLFJs3+tUyp+nlTDd0a04ujm
         fwjrcqpD9j1CflRvt1/5D67dYjGVT0PzQSWF5fWbwS0SEeZAyVI/u2wJx1Pf2PC7+Jqt
         FVI2vKJAPfVAELVfV5pB8WkE4t6rWLJpItihD5/4nY8+4Q8drLcUUB1GjJtUquNxN1v3
         sL0Hk5VHhACZrtrDO7i9nj9I7gk6dnUEm1aOo5d2YgAGmOSoQ/o31eA3LAiiGswAZGOe
         GbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687052; x=1751291852;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pe80s/Z2Rf2nyL6DrwRxXyxaDYlnzGJXM4+hg4JQ2Tk=;
        b=OkgdcJ0XUSZ/SxFH3tYA2apSO1eHRphj9/phExgqUv0t+7KdLYtVfPlL4ItovMLp2g
         z4cyWa3QKykJBLgmVSeBH1DGJG3Ip1DoGCt7aZNcwsR+7culmWXbsaNqqG6gyqE5Y8dw
         S3pOyaZJg9GmNoVgC8mmXm/geiYJjAu1mhc44wyNq70uvbqrqqd0vRFJumCcVmw+lxzS
         XJ6W/Nk3NYditqo3owMEBQsNQQzX37MvH1cZyDTPX9IuWeJJKT3/tqVWEyzSa60igxZ5
         WWLFCLXhCbWosBhdIGubhWDAxpRaFaPpaNkG0tbixp2096zgHxusU4sUS76gTIz+7XTA
         D1/A==
X-Forwarded-Encrypted: i=1; AJvYcCX7o4HrKutQ9uIuhkX8qXed3BwnuhVcNa2MUYdwj0PIU9+raCIzWml1NzXROyLfhr3icqOM5u73391wE4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUopHJV5aNniP5TeYL2lsQLjIiOYu/AIRR+gECwUjyInWfsgHr
	YF+nB6e6UYnIsPrEcgl5rkXJyXIyyynf7qXfv3wQXeY0oZEHsPVgUvd9ppCdca43qRl1jm816hT
	4RD2lHhXxg18m9IUgJA==
X-Google-Smtp-Source: AGHT+IGyqmrbiVo1Mj6x+qEhclT4oIm698Y2OoRwygH0y3/K9oX48CoMODvy6PmTts9uQFZpIei9ewu/VZ99Z0k=
X-Received: from wmrn13.prod.google.com ([2002:a05:600c:500d:b0:453:f66:5f37])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1392:b0:44a:b793:9e4f with SMTP id 5b1f17b1804b1-453659aef47mr91540655e9.19.1750687052121;
 Mon, 23 Jun 2025 06:57:32 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:57:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEZdWWgC/3WNyw7CIBREf6W5azEULQmu/A/TBY8LJUFooBJNw
 7+L3bubM8mc2aFg9ljgNuyQsfriU+zATgPoRUaHxJvOwCibKGeUrCkEskkVkMRXj8oKySXXExc IfbVmtP59GB9z58WXLeXPcVDHX/vfVUcyEnWxKJi8WkPN3aXkAp51esLcWvsCky3Rgq8AAAA=
X-Change-Id: 20250620-poll-table-null-bf9a6a6c569e
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6955; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=2t3YQ1+iDGqoFk0JWiw+F8ieR6NrXZIS0LcyrI8jDzE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoWV1KsM4Kp+t7jF4ybxNf64Lro9DIeugU6c6Np
 l/MSCgtQtSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFldSgAKCRAEWL7uWMY5
 RuZSD/4ri2fmT2Uv3jxw5G4QhneLQbcMZ1aQYzCcN3b0cgY0FNFTthZ/yMn2bROMoME/tPesxjR
 +Q0AqpF6Cfy+ePudwfPa1LJCbO/CZCTH8CzLJCtDxSnSvPhmPnbtyTqLEeZpbchyYfQtToFiSoX
 9QV8xQLEZvTVds1v9LJc2HwVNbLf7NwTq7y2JGphGR16evtpH/qTfdHN4Qv42VM5HmDNdN4qZg7
 AXO37LQVcq00pwtg0zA9sMz+8jEeGDURsDbP+VyOyPASLH85M6wMPexgD76YboTX95fe2FfDaqq
 o+Eqf+oFYoEazpBRaw8ApgipWH4S6OF+HS6Fev/c6eVuch/9pDeXbO2j7vjVH72uHSiZTVzvXLj
 jstKMCe5VVAOKByD6X/TVR0MC13D9p0ge4551fHg0LL1omVSlsur8VnuT7hHdDdzcg8DMUVALUC
 GPdZ+ceecQ8gZov0dhsP0GtMW5IHSFwdrMBPAH7Q0m6bQ4s2mTz4nwVCB8Vh0Ae/P4Qx/mk7FDn
 2cFB9sTqHN/v0fYi2ArTsCza3MVSPEtVglfbkeIe7wejl33W7jGlK0kORV8tc45OS1+R2sYGyqP
 2WUA+9rBD0NqP7KvCh0pRod94vACIi2OssxGoXiah5GE49txGdQF94ltnNFmCJbxw6gIOPz+BDu Fih7eO2CjWSmt1Q==
X-Mailer: b4 0.14.2
Message-ID: <20250623-poll-table-null-v2-1-7561174bae7a@google.com>
Subject: [PATCH v2] poll: rust: allow poll_table ptrs to be null
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

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This issue was discovered from a syzkaller report on Rust Binder.

Intended for Christian Brauner's tree.
---
Changes in v2:
- Reword safety comment on poll_wait. (Benno)
- Link to v1: https://lore.kernel.org/r/20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com
---
 rust/helpers/helpers.c   |  1 +
 rust/helpers/poll.c      | 10 +++++++
 rust/kernel/sync/poll.rs | 68 ++++++++++++++++++------------------------------
 3 files changed, 37 insertions(+), 42 deletions(-)

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
index d7e6e59e124b09d5f0d62244ca46089e0748d544..69f1368a2151c489bdb95705d1ddac1c79bf566b 100644
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
@@ -23,58 +22,43 @@ macro_rules! new_poll_condvar {
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
+        // SAFETY:
+        // * `file.as_ptr()` references a valid file for the duration of this call.
+        // * `self.table` is null or references a valid poll_table for the duration of this call.
+        // * Since `PollCondVar` is pinned, its destructor is guaranteed to run before the memory
+        //   containing `cv.wait_queue_head` is invalidated. Since the destructor clears all
+        //   waiters and then waits for an rcu grace period, it's guaranteed that
+        //   `cv.wait_queue_head` remains valid for at least an rcu grace period after the removal
+        //   of the last waiter.
+        unsafe { bindings::poll_wait(file.as_ptr(), cv.wait_queue_head.get(), self.table) }
     }
 }
 

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-poll-table-null-bf9a6a6c569e

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

