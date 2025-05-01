Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB391EA7FF
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746139670; cv=none; b=Kz2knxlmf70EvpUGEYRorWeKpNm/DivLNmyJBKHcMMSHuoYUyGy9TMEYueTDcE1xBvfyYdmohEPC/qQXhwgGReamRXVfTSW/+5h0mOUF+txsVLsfJ8L7lUOI/OPvEZXXWsOsV4+mGtvlD1mvZJ/R5VBmXZHBATmKl7IObSsBtuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746139670; c=relaxed/simple;
	bh=vGtX626ufCW0kxKZSGGr1DsjP6wp5nwALWioEPKyoDM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ccF1aAtpUDuvqpTSsjRL5FE3FqKhCL9nmthC/E7tVjMyv0gD3F8AMa8gSsf6k9TzT2ONJqPhxbAL0Gklxiz6bVcNOj4GGkfuZdxeiT3mSzbktOHVVC2jxEdW89M2fNe+2I1Y+suvmsdtWFtaTfaa5WkRcF6F0UqohyL5hq3UNWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LqHr5sVi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LqHr5sVi"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso1894991a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746139668; x=1746744468; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C38GHycutHTGIWUmaIQeGI20h3XTl61MbEqtw6bDUhs=;
        b=LqHr5sViKkc8XdCVfMZ/qfNmNqyufxfI4D0ul1Pjt6zP+ORg7jnFcYGCl/x2FxdirC
         kDy9+FK8mxqEcYj1DlQQ1kb1dJnF+ynAz7Kx4glFDBxGPiNCd1jTzIzpMMRX0jOPSU7b
         GhJE5pX9Igysc3Cgq8KZ+akwF24NmBc0s2Sp+/tuuQlRGdfzD2abpURNQtt/DzxVKP3L
         th3nFWVBWaJazaruZOwHYKn/SraKT+l1QI5u9zr2LCGBgjoHXFZlj5iMuCZMOLeBYEC8
         Ht2MbpMkGMcK7ks00E28JwspzXd6FPbQUmQXIoGdIrJW/lP+IzphwGt/O+YamGS10X9W
         ycFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746139668; x=1746744468;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C38GHycutHTGIWUmaIQeGI20h3XTl61MbEqtw6bDUhs=;
        b=dm0t1rzCtVf7d9hlMH7H2eQlNqH52aMP2IHArLZ8LaPvedr6fC0GY2o4OlI4JGPqOd
         GiCP5D1mlXScrGQ7fXStOO0Vzjw6+JyHvl2n0d5YRh0OaybRL11DYaguuYFI1LSc/ZCc
         Kr8DJfaZGS+6aTeRspKPqjkmPXfsV9EY7+eqkuMALd4KdWiGe5sEgyHqqjydfolT0cKb
         DOAPctSRIgp4cs0zVmmSBZk1Sbi5rUscMX1aBAYmyRAqs++WFqAl1lzJSMCJFR/sqqSZ
         yzu6drC+7m+WOrdiNkAFv6iY0J6Aelp5mzeNaCZTJ46vNuYaZsbjoIbD8Z2wpoiJS1+L
         jhJA==
X-Gm-Message-State: AOJu0Yza2/drbdSZr5iB6Foj63UkP8t/9sLGFj4K/V2rjPf80mcPGMBb
	kAUGWLiArYrcbLMjRwLrRX32+qrwFFOUHBNS4toZYRXWVaZEZA2ycM5Rr+ruwj0u39vW01gHFDe
	kykyWqw==
X-Google-Smtp-Source: AGHT+IEHhAjLNh4B5uuSy96gpwkNJdmG0NJVHyV4NzmklUFQ0ooeDa27MV9sjJQh/AhLvjGleYqTMwlo7A3y
X-Received: from pjbqn16.prod.google.com ([2002:a17:90b:3d50:b0:2f9:dc36:b11])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35c2:b0:2fa:603e:905c
 with SMTP id 98e67ed59e1d1-30a42e4ec2bmr6434727a91.2.1746139668389; Thu, 01
 May 2025 15:47:48 -0700 (PDT)
Date: Thu, 01 May 2025 22:47:42 +0000
In-Reply-To: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746139663; l=6574;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=vGtX626ufCW0kxKZSGGr1DsjP6wp5nwALWioEPKyoDM=; b=U+ouHWH+j8aDuCE2NAbl2aFiHOzXeoikFWOS1YbGeOihe8jY5adamc/Zb4JfweIvqZN58P5x4
 f4He64v6TqzBLY4dcobtiGUtFVXDcEZ+WkRM7GNNkqdi3HCkPBdyp0y
X-Mailer: b4 0.14.2
Message-ID: <20250501-debugfs-rust-v3-2-850869fab672@google.com>
Subject: [PATCH v3 2/4] rust: debugfs: Bind file creation for long-lived Display
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
 rust/kernel/debugfs.rs | 134 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index b589c2d9a8d169bd66e98d2894261784e427230e..ef69ae8f550a9fe6b0afc1c51bebaad2fc087811 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -7,6 +7,7 @@
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
 use crate::str::CStr;
+use core::fmt::Display;
 use core::mem::ManuallyDrop;
 use core::ops::Deref;
 
@@ -118,6 +119,48 @@ unsafe fn from_ptr(ptr: *mut bindings::dentry) -> Self {
     fn as_ptr(&self) -> *mut bindings::dentry {
         self.0
     }
+
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
+    pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
+        // SAFETY:
+        // * `name` is a NUL-terminated C string, living across the call, by `CStr` invariant.
+        // * `parent` is a live `dentry` since we have a reference to it.
+        // * `vtable` is all stock `seq_file` implementations except for `open`.
+        //   `open`'s only requirement beyond what is provided to all open functions is that the
+        //   inode's data pointer must point to a `T` that will outlive it, which we know because
+        //   we have a static reference.
+        // * debugfs_create_file_full either returns an error code or a legal dentry pointer, so
+        //   `Self::from_ptr` is safe to call here.
+        #[cfg(CONFIG_DEBUG_FS)]
+        let dir = unsafe {
+            Self::from_ptr(bindings::debugfs_create_file_full(
+                name.as_char_ptr(),
+                0o444,
+                self.as_ptr(),
+                data as *const _ as *mut _,
+                core::ptr::null(),
+                &<T as DisplayFile>::VTABLE,
+            ))
+        };
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        let dir = {
+            // Mark parameters used
+            let (_, _) = (name, data);
+            Self()
+        };
+        File(ManuallyDrop::new(dir))
+    }
 }
 
 impl Drop for Dir {
@@ -153,3 +196,94 @@ fn new(dir: Dir) -> Self {
         Self(ManuallyDrop::new(dir))
     }
 }
+/// Handle to a DebugFS file.
+#[repr(transparent)]
+pub struct File(ManuallyDrop<Dir>);
+
+impl File {
+    /// Remove the file from DebugFS.
+    ///
+    /// # Examples
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let dir = Dir::new(c_str!("foo"));
+    /// {
+    ///     let file = dir.display_file(c_str!("bar"), &0);
+    ///     // "foo/bar" is created.
+    /// }
+    /// // "foo/bar" still exists.
+    /// {
+    ///     let file = dir.display_file(c_str!("baz"), &0);
+    ///     // "foo/baz" is created.
+    ///     file.remove();
+    ///     // "foo/baz" is gone.
+    /// }
+    pub fn remove(self) {
+        drop(ManuallyDrop::into_inner(self.0))
+    }
+}
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
2.49.0.906.g1f30a19c02-goog

