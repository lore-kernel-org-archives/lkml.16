Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079FA2DCB42
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968563; cv=none; b=gmiW30s6fgzbCLHNb8E4Yd0XAP/0A5XpTz0X1VQ1HxYm/eC1EJVbuBaY2Cbm5rU9nT96Mmyc8w+NfhiRvrb3XxmFJkbdrMSS7f7pFtGmjhh+Ykp5l7KOdgqtQ+4W5v+tK7VfG6qTVU52Tyl4LQc3aKL9aANYencISXmMrvWuiDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968563; c=relaxed/simple;
	bh=ue0hOorN/lBrLGmWDge6K1btfvMk7UJK9JMIiMBYIK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V7LLIhBqhMOeGIWfzydlXNreKtUu4UfwGx3GhbQRvOYlaU35n3fEtnpSRvEpX2kr5FDMVJ1t5xUUiPiGKs2RVl8CyKswrbu4Qk28SUeQ2A25EVWZbZzZFYro7w4DKO3Q2NplODbpEeZ7YvW9vqeN8tbmxsYO21wpzxVFK6hxxT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NbimgP2p; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NbimgP2p"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736c0306242so8696742b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968560; x=1746573360; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpFfzO6TkqksuGg6acaZEinI1XWu5p2UJLgjV+ZSwZg=;
        b=NbimgP2piuBJQoQLHN50X8Zn1ImSjH4VKL1gOWWRRTfoSGT4ISa4pH6paC7/u56gDj
         MFWWrmxoS4LJ+xa1SzakiERijEfdQPISzVyW6opOf4fkLqLLP2xuwXBuC2u9Syhh1La5
         xHAePPZPF6dOfE/dbAqiX6UTRIMYfgwFasanrhxKYQS0pcE+ExRJD5TV/+5aTuC4tjAy
         dSc4VVBf+oZPKAHRKI5zwPOhd0XQPDnzjo3Dpou3dzHQJIxqC1ip7w9nqhW4BQJbWAX5
         PAvHqY3DPFjDV1tdEYCVRGJ3IMfiSE44ivjcBqW8At3jsef4p7h+szA7QKq0b/N2gxJb
         tp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968560; x=1746573360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpFfzO6TkqksuGg6acaZEinI1XWu5p2UJLgjV+ZSwZg=;
        b=dnr/vvA0BNQsEiHQIcRAclo099lEv2zU5HCZYw59D4nWO6557RpB1Y2Oe5nF7hRbzg
         7JVS/I4X2gSjFCbOjVpyuEjtN7oVLytDrWDwDGcKA1Dyc6IXcV6XqvLVR7X9E0FO12ZA
         k/pNJJ9d3m5nSLvxd17svO5LM8NUqE4WAQzFaqHsTYH+kInrhJJX1atdZtPn/28aXAHV
         OugjI60XpRLxmEy6LDadSOLGTWWyBOAuDHh1Sdw8hu8GobXj21nRNxppluZdiGK4nF9P
         yL/clhNx+q6yRpggHCLp+h9phThf3Re7/Fx8UeHdnmRjfqpNs5JlcR7j7Ss4ZHD3mLyJ
         iQBQ==
X-Gm-Message-State: AOJu0YynnY8eOQIqjESRD2l/1Yk3XupQHt+sHM9SghXFw9H6oLx8jtK6
	fvwlPhlYFj24i22NVP5ie5H5kzIG6RdknebG89VwHhWJ2G2TKSsRst7D16SoY2FjgY+011m0yqK
	Z0gbPiA==
X-Google-Smtp-Source: AGHT+IHfHu0YEkExrKPxqPuNXPBGg3USm3tiUXWoyqewu1bJ4vyzOuz0sLtHIKC3mRAcazOTNmkCmVL3RpZP
X-Received: from pffn17.prod.google.com ([2002:a62:e511:0:b0:73e:655:5bee])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3924:b0:736:34a2:8a18
 with SMTP id d2e1a72fcca58-7403a836556mr619744b3a.24.1745968560313; Tue, 29
 Apr 2025 16:16:00 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:15:56 +0000
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745968555; l=5607;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=ue0hOorN/lBrLGmWDge6K1btfvMk7UJK9JMIiMBYIK8=; b=atZwyn2XsJyagBMkk9xDo3PNR4E2kNEq+cy4bu1OnFWo92rLAFQhRddioEiv/A7OKbrHAg1Ep
 Kj0EOw7qw4qDRXKhIrSyRZJaPzBktZie0FtGjch7XNMHC+4MAyT/zFl
X-Mailer: b4 0.14.2
Message-ID: <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com>
Subject: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived Display
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Allows creation of files for references that live forever and lack
metadata through the `Display` implementation.

The reference must live forever because the corresponding file is
reference counted, so there's no way to say the lifetime outlives it
otherwise. This restriction will be relaxed later in the series through
use of `debugfs_remove`.

The `Display` implementation is used because `seq_printf` needs to route
through `%pA`, which in turn routes through Arguments. A more generic
API is provided later in the series.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 4d06cce7099607f95b684bad329f791a815d3e86..b20df5fce692b3047c804f7ad5af90fc4248979b 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -7,8 +7,11 @@
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
 use crate::error::{from_err_ptr, Result};
+use crate::seq_file::SeqFile;
+use crate::seq_print;
 use crate::str::CStr;
 use crate::types::{ARef, AlwaysRefCounted, Opaque};
+use core::fmt::Display;
 use core::ptr::NonNull;
 
 /// Handle to a DebugFS directory.
@@ -97,4 +100,95 @@ pub fn new(name: &CStr, parent: Option<&Self>) -> Result<ARef<Self>> {
     fn as_ptr(&self) -> *mut bindings::dentry {
         self.inner.get()
     }
+
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking
+    /// [`Display::fmt`] on the provided reference.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let dir = Dir::new(c_str!("my_debugfs_dir"), None)?;
+    /// let file = dir.display_file(c_str!("foo"), &200)?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn display_file<T: Display + Sized>(
+        &self,
+        name: &CStr,
+        data: &'static T,
+    ) -> Result<ARef<Self>> {
+        // SAFETY:
+        // * `name` is a NUL-terminated C string, living across the call, by CStr invariant
+        // * `parent` is a live dentry since we have a reference to it
+        // * `vtable` is all stock `seq_file` implementations except for `open`.
+        //   `open`'s only requirement beyond what is provided to all open functions is that the
+        //   inode's data pointer must point to a `T` that will outlive it, which we know because
+        //   we have a static reference.
+        // * debugfs_create_file_full either returns an error code or a legal dentry pointer, so
+        //   `NonNull::new_unchecked` is safe here.
+        let ptr = unsafe {
+            NonNull::new_unchecked(from_err_ptr(kernel::bindings::debugfs_create_file_full(
+                name.as_char_ptr(),
+                0444,
+                self.as_ptr(),
+                data as *const _ as *mut _,
+                core::ptr::null(),
+                &<T as DisplayFile>::VTABLE,
+            ))?)
+        };
+        // SAFETY: Dir is a transparent wrapper for an Opaque<dentry>, and we received a live
+        // owning dentry from debugfs_create_dir, so we can wrap it in an ARef
+        Ok(unsafe { ARef::from_raw(ptr.cast()) })
+    }
+}
+
+/// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`
+///
+/// # Safety
+/// * inode's private pointer must point to a value of type T which will outlive the inode and will
+///   not be mutated during this call
+/// * file must point to a live, not-yet-initialized file object
+unsafe extern "C" fn display_open<T: Display>(
+    inode: *mut kernel::bindings::inode,
+    file: *mut kernel::bindings::file,
+) -> i32 {
+    // SAFETY:
+    // * file is acceptable by caller precondition
+    // * print_act will be called on a seq_file with private data set to the third argument, so we
+    //   meet its safety requirements
+    // * The data pointer passed in the third argument is a valid T pointer that outlives this call
+    //   by caller preconditions
+    unsafe { kernel::bindings::single_open(file, Some(display_act::<T>), (*inode).i_private) }
 }
+
+/// Prints private data stashed in a seq_file to that seq file
+// # Safety
+// * seq must point to a live seq_file whose private data is a live pointer to a T which is not
+//   being mutated.
+unsafe extern "C" fn display_act<T: Display>(
+    seq: *mut kernel::bindings::seq_file,
+    _: *mut core::ffi::c_void,
+) -> i32 {
+    // SAFETY: By caller precondition, this pointer is live, points to a value of type T, and is
+    // not being mutated.
+    let data = unsafe { &*((*seq).private as *mut T) };
+    // SAFETY: By caller precondition, seq_file points to a live seq_file, so we can lift it
+    let seq_file = unsafe { SeqFile::from_raw(seq) };
+    seq_print!(seq_file, "{}", data);
+    0
+}
+
+// Work around lack of generic const items
+trait DisplayFile: Display + Sized {
+    const VTABLE: kernel::bindings::file_operations = kernel::bindings::file_operations {
+        read: Some(kernel::bindings::seq_read),
+        llseek: Some(kernel::bindings::seq_lseek),
+        release: Some(kernel::bindings::single_release),
+        open: Some(display_open::<Self> as _),
+        // SAFETY: file_operations supports zeroes in all fields
+        ..unsafe { core::mem::zeroed() }
+    };
+}
+
+impl<T: Display + Sized> DisplayFile for T {}

-- 
2.49.0.901.g37484f566f-goog

