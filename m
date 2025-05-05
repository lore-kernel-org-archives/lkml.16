Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618831280C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746489102; cv=none; b=LX8jz5lVT5KPuC8FFe2X9KK+stzwyYkg609bSKYv95uiIlsWuvOxOokIVsj+omEdddHlDTPy7G25KiSWC66EIv5VA+9rgvln6lnhRYvBaF53fQSHwF1ABYlTsEOFa7W30Tca70Jx7whK/8r35FrsEHSqjNONJpVcaeFdnjEXnXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746489102; c=relaxed/simple;
	bh=b3DJ+UN94pzhqaHjRVPoghHlS3Atsv9dVe93Z+66SE4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HYGXttqqSkGVcY1UByer22XFyRuy3wIVA+6gXeyFIUUKvC+pfew80xw5mGFdCxOuS3RCNG4n3FgG4vcTCZ/tIDqGllpbX0NnAKfqKXS7f3FwgKl0QarDMqCouNyMkk280suaIEpRYkUj48hY0FWLmQ3QdMdQ7EVlPd48BK93YYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UAlJc9IA; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UAlJc9IA"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30a3c3014fcso3562880a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 16:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746489100; x=1747093900; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AlgqJD04Sxt1Yk0QMv5WSqDKEhc0Gfx3sxjzNK9A41Q=;
        b=UAlJc9IAKVeMkUhGGn6JnC4tRN/wY5ndC0gkp+5BljHcNcVyUa1yuRf3UjUE0C+5Cc
         r/Yk4P0ST1zjmujSimvZ4fz8brf9DySUzTOjTMq49SmyJGofYl3LMF0K0s64qJZQ+Kxn
         SCw/vimwbNydrTaqaVmriDGH1wgk1lwysjtOW0na62lmgeI02u44mQHfXVG0jPxF9bY3
         nTCp+bPwbPXutc7QVSzdINs1F0JQ8EZEGllcD61qLasNSaLgAg0sA9mr8ONTs5Vs2EBt
         pZwvAq89EcaZkoZ2rNIonFmzjJEQdkdl0D5b6tPj78r4k8J022A763Ma8LnXuYQjGAp9
         uOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746489100; x=1747093900;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AlgqJD04Sxt1Yk0QMv5WSqDKEhc0Gfx3sxjzNK9A41Q=;
        b=ulWrJvWAQsT8YtdHef4cCo59PUKFg4YT5GWWFbVBLojQbgEae0pL+p2g04RXnMbBGC
         jSxf6HCrLhi+YVIOr52I/o3L+nncycN8lf9qjkvj05LOXVAvsDcnmcHkIGaOi+DoPVdP
         evGkA7ZnvtDQbrjdqPJAK3D0JXc4fwbtaq6nHu2iW5xfOIyWDGm+HqyGvcFUhizNtCt5
         fjmQ22dvF13sZzKnDvWaCBO02aJSDQrOLaRP7LjXCVBQbIhYLQkrkYcBjxzw6IUUrO92
         IHWKLtbDOuxnlAvdCzEr6tnVkxiUTXZZWCy5cA9Xg37K2m7PEB6QiGTlVVbaukXaSQzx
         zKeA==
X-Gm-Message-State: AOJu0Ywc3ONzi3q9CjR5GBpua+yiYbfc/zA1dl8hUDEhiGF136QsZXRx
	WcBb6q2nvVomsNrIQeh+VtZaSNy8BTFyVWAU5teI0qQNqd/VnQhlCPqKy8XMjJvvg7Etf8g3+uX
	ZBKPWzA==
X-Google-Smtp-Source: AGHT+IFNZWb0O63dvnCCrz31HRZyMWLcWyX91j6SXGg7jk7gay8i0T8ORv64V7FMQ4A7/XzG2FlTbr1l8RpS
X-Received: from pjbqo3.prod.google.com ([2002:a17:90b:3dc3:b0:2fe:800f:23a])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8d:b0:308:2b5b:d67f
 with SMTP id 98e67ed59e1d1-30a7c080700mr2109668a91.9.1746489100052; Mon, 05
 May 2025 16:51:40 -0700 (PDT)
Date: Mon, 05 May 2025 23:51:35 +0000
In-Reply-To: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746489094; l=6760;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=b3DJ+UN94pzhqaHjRVPoghHlS3Atsv9dVe93Z+66SE4=; b=73rsMIciHfAM9y1l3JvrXYr88Qe0xLWFfHhawlgR6VZREJwnB4IW2YQkbZDQfGPQSQpSZkbRE
 BWH1rPM3JzxAifs59J0L7rfeIOoI5MMkNJy4Ul/+eQdctvojq5FbuoG
X-Mailer: b4 0.14.2
Message-ID: <20250505-debugfs-rust-v5-2-3e93ce7bb76e@google.com>
Subject: [PATCH v5 2/4] rust: debugfs: Bind file creation for long-lived Display
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Allows creation of files for references that live forever and lack
metadata through the `Display` implementation.

The reference must live forever because we do not have a maximum
lifetime for the file we are creating.

The `Display` implementation is used because `seq_printf` needs to route
through `%pA`, which in turn routes through Arguments. A more generic
API is provided later in the series, implemented in terms of this one.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 132 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index ed1aba6d700d064dbfd7e923dbcbf80b9acf5361..4a138717bd0fdb320033d07446a192c9f520a17b 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -6,6 +6,7 @@
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
 use crate::str::CStr;
+use core::fmt::Display;
 use core::marker::PhantomData;
 
 /// Owning handle to a DebugFS entry.
@@ -46,6 +47,19 @@ unsafe fn from_ptr(entry: *mut bindings::dentry) -> Self {
         }
     }
 
+    /// Constructs a new DebugFS [`Entry`] from the underlying pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must either be an error code, `NULL`, or represent a transfer of ownership of a
+    /// live DebugFS directory.
+    #[cfg(not(CONFIG_DEBUG_FS))]
+    unsafe fn from_ptr(_entry: *mut bindings::dentry) -> Self {
+        Self {
+            _phantom: PhantomData,
+        }
+    }
+
     #[cfg(not(CONFIG_DEBUG_FS))]
     fn new() -> Self {
         Self {
@@ -124,6 +138,57 @@ pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b> {
         Dir::create(name, Some(self))
     }
 
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking
+    /// [`Display::fmt`] on the provided reference.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let dir = Dir::new(c_str!("my_debugfs_dir"));
+    /// dir.display_file(c_str!("foo"), &200);
+    /// // "my_debugfs_dir/foo" now contains the number 200.
+    /// ```
+    pub fn display_file<'b, T: Display + Sized>(
+        &'b self,
+        name: &CStr,
+        data: &'static T,
+    ) -> File<'b> {
+        // SAFETY:
+        // * `name` is a NUL-terminated C string, living across the call, by `CStr` invariant.
+        // * `parent` is a live `dentry` since we have a reference to it.
+        // * `vtable` is all stock `seq_file` implementations except for `open`.
+        //   `open`'s only requirement beyond what is provided to all open functions is that the
+        //   inode's data pointer must point to a `T` that will outlive it, which we know because
+        //   we have a static reference.
+        #[cfg(CONFIG_DEBUG_FS)]
+        let ptr = unsafe {
+            bindings::debugfs_create_file_full(
+                name.as_char_ptr(),
+                0o444,
+                self.0.as_ptr(),
+                data as *const _ as *mut _,
+                core::ptr::null(),
+                &<T as DisplayFile>::VTABLE,
+            )
+        };
+
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        let ptr = {
+            // Mark parameters used
+            let (_, _) = (name, data);
+            crate::error::code::ENODEV.to_ptr()
+        };
+
+        // SAFETY: `debugfs_create_file_full` either returns an error code or a legal
+        // dentry pointer, and without `CONFIG_DEBUGFS` we return an error pointer, so
+        // `Entry::from_ptr` is safe to call here.
+        let entry = unsafe { Entry::from_ptr(ptr) };
+
+        File(entry)
+    }
+
     /// Create a new directory in DebugFS at the root.
     ///
     /// # Examples
@@ -137,3 +202,70 @@ pub fn new(name: &CStr) -> Self {
         Dir::create(name, None)
     }
 }
+/// Handle to a DebugFS file.
+#[repr(transparent)]
+pub struct File<'a>(Entry<'a>);
+
+#[cfg(CONFIG_DEBUG_FS)]
+mod helpers {
+    use crate::seq_file::SeqFile;
+    use crate::seq_print;
+    use core::fmt::Display;
+
+    /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
+    ///
+    /// # Safety
+    ///
+    /// * `inode`'s private pointer must point to a value of type `T` which will outlive the `inode`
+    ///   and will not be mutated during this call.
+    /// * `file` must point to a live, not-yet-initialized file object.
+    pub(crate) unsafe extern "C" fn display_open<T: Display>(
+        inode: *mut bindings::inode,
+        file: *mut bindings::file,
+    ) -> i32 {
+        // SAFETY:
+        // * `file` is acceptable by caller precondition.
+        // * `print_act` will be called on a `seq_file` with private data set to the third argument,
+        //   so we meet its safety requirements.
+        // * The `data` pointer passed in the third argument is a valid `T` pointer that outlives
+        //   this call by caller preconditions.
+        unsafe { bindings::single_open(file, Some(display_act::<T>), (*inode).i_private) }
+    }
+
+    /// Prints private data stashed in a seq_file to that seq file.
+    ///
+    /// # Safety
+    ///
+    /// `seq` must point to a live `seq_file` whose private data is a live pointer to a `T` which is
+    /// not being mutated.
+    pub(crate) unsafe extern "C" fn display_act<T: Display>(
+        seq: *mut bindings::seq_file,
+        _: *mut core::ffi::c_void,
+    ) -> i32 {
+        // SAFETY: By caller precondition, this pointer is live, points to a value of type `T`, and
+        // is not being mutated.
+        let data = unsafe { &*((*seq).private as *mut T) };
+        // SAFETY: By caller precondition, `seq_file` points to a live `seq_file`, so we can lift
+        // it.
+        let seq_file = unsafe { SeqFile::from_raw(seq) };
+        seq_print!(seq_file, "{}", data);
+        0
+    }
+
+    // Work around lack of generic const items.
+    pub(crate) trait DisplayFile: Display + Sized {
+        const VTABLE: bindings::file_operations = bindings::file_operations {
+            read: Some(bindings::seq_read),
+            llseek: Some(bindings::seq_lseek),
+            release: Some(bindings::single_release),
+            open: Some(display_open::<Self> as _),
+            // SAFETY: `file_operations` supports zeroes in all fields.
+            ..unsafe { core::mem::zeroed() }
+        };
+    }
+
+    impl<T: Display + Sized> DisplayFile for T {}
+}
+
+#[cfg(CONFIG_DEBUG_FS)]
+use helpers::*;

-- 
2.49.0.967.g6a0df3ecc3-goog

