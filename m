Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B17214232
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055932; cv=none; b=FeDxblBQXL3Vga/kH+JkZHFM0UER/69uIGYIDcDmlo4zPvhrWdabJ54Kg03SX5BIA4OKpkuaPQK7+N25fOqIWp66OlA8UfdDUb2i2ykeJwq80i/KEE76kIDxC+mUPJPOALp0cHKsFwuAihe9uT5oqFggVO+iDSCcJYk289G1Rtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055932; c=relaxed/simple;
	bh=K3ANi7xRlSj5yHHCVsAYvdNWi4HCri0Umkny65ip/+s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FkXn5PcfxCaohWrUHFRG19oPhGE720s5J3dkeMM/rxUSPEeKj/t08CJFm2z3H34TDkhni9ipbKaddaOR9xw27VUr+C/2zC2zf62JFwHI+FO9C72y+eH2dvVhF1jU2RL+ZNeJrEJjuoEz5CSqOLp0sSjhuFAnODESW/j/9nsdzm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jBi07hiL; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jBi07hiL"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b115383fcecso225129a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746055929; x=1746660729; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W2PaGNarEJSxlEaGNeHssoqREdq53cRaBB8TVSLbGvg=;
        b=jBi07hiLqmy+RnSw92lvBxVwcH1L3NX3pgU1yH+oey9CY0B/VNNHCCfbSHg3l3biQP
         t3UojTSSSLF79sGmdpqgXzpN0MueqfWVkjFga5ohrqOj9PaSzs0D+CIQkT0wF1v6l2Nz
         P6sD+FAHdZEU7EWzNU5SPtkPZWrHTMqmCND4h1j8KkjyG/rQA+B9ono9ktB0XFhJW99a
         kyVczyCHWW6xsTYutFJe2l/TlGeQhf8vcA8mVx+Xcn0T04ohb+1oQjcxh1QUTOSRvGA9
         T2DMH6qLy5qOVzypOqzJ7Ppbf5R1l0xQPaGgORWBotbnL/9VOklJpRa8DzNRicZz6er5
         X2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055929; x=1746660729;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2PaGNarEJSxlEaGNeHssoqREdq53cRaBB8TVSLbGvg=;
        b=pkB617bRt18xmKee16nGN+jXzK9xKT6736wqcx71EGaOBs5RdSx/k5h70btgR/Az3C
         YVcKSZeo4nPw3+uSXQ1mVzkTapmFLaBG9uMwkhjf2hrq5ijf+i82qiUVfxOsiFbYn4XT
         eoLOn6JIhEAn9xJHMS2nTyqzHsNgwFLBwvYzPHz3yXI7qPgSUyeecYN9TmC3nZmLJELr
         FrcpT8qEaZv3cDDNir8sY5xy09BbFCr0q9staVrzIqlTHPW2E0FXL2pRLhcJhcGJfjv+
         fEPDXfXZ/XuF7QInS032d/TmnuPZl+PQIYoU0Gysp5eQc3ss2vnmqfKCilkej6frpnc0
         c0gA==
X-Gm-Message-State: AOJu0YwtOyhamK0037flb11/4tS+0MGWx60JAUqy6CZqV7bKBtObSG1u
	rDCkxPoZYT6EEiYWKwOVuPz309TrXGIpEEsusBw8DWBimoxxrwA68HETMbIxRw2zIgvcrPeawjg
	6Mz2c3g==
X-Google-Smtp-Source: AGHT+IFXnTJSYIgkAmYiFhWawzHDclbmYW4vocFGHfbUMvt00HY5mWdcj77NAjHsOUZw3S7ps85/EhVjj2ES
X-Received: from pjbsw7.prod.google.com ([2002:a17:90b:2c87:b0:309:da3b:15d1])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a48:b0:2ff:6788:cc67
 with SMTP id 98e67ed59e1d1-30a4337e5d4mr362658a91.34.1746055929125; Wed, 30
 Apr 2025 16:32:09 -0700 (PDT)
Date: Wed, 30 Apr 2025 23:31:57 +0000
In-Reply-To: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746055923; l=5710;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=K3ANi7xRlSj5yHHCVsAYvdNWi4HCri0Umkny65ip/+s=; b=H932J1Iteny0GaOUFT89EwS069TMIC7KPthw1db2MoFRYGx7QsQ+M/c7GEfTIPyLnjbLtTP1b
 /BLqVsNh+F3AVJfYfntAOqLPjjENnpUYE/NAfJKI4lz1H1rMDoy4yN/
X-Mailer: b4 0.14.2
Message-ID: <20250430-debugfs-rust-v2-2-2e8d3985812b@google.com>
Subject: [PATCH v2 2/4] rust: debugfs: Bind file creation for long-lived Display
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
 rust/kernel/debugfs.rs | 102 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index b533ab21aaa775d4e3f33caf89e2d67ef85592f8..87de94da3b27c2a399bb377afd47280f65208d41 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -7,6 +7,7 @@
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
 use crate::str::CStr;
+use core::fmt::Display;
 
 /// Handle to a DebugFS directory.
 // INVARIANT: The wrapped pointer will always be NULL, an error, or an owned DebugFS `dentry`
@@ -121,6 +122,47 @@ fn as_ptr(&self) -> *mut bindings::dentry {
     pub fn keep(self) {
         core::mem::forget(self)
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
+    /// dir.display_file(c_str!("foo"), &200).keep();
+    /// // "my_debugfs_dir/foo" now contains the number 200.
+    /// ```
+    pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> Self {
+        // SAFETY:
+        // * `name` is a NUL-terminated C string, living across the call, by CStr invariant
+        // * `parent` is a live dentry since we have a reference to it
+        // * `vtable` is all stock `seq_file` implementations except for `open`.
+        //   `open`'s only requirement beyond what is provided to all open functions is that the
+        //   inode's data pointer must point to a `T` that will outlive it, which we know because
+        //   we have a static reference.
+        // * debugfs_create_file_full either returns an error code or a legal dentry pointer, so
+        //   `Self::from_ptr` is safe to call here.
+        #[cfg(CONFIG_DEBUG_FS)]
+        unsafe {
+            Self::from_ptr(bindings::debugfs_create_file_full(
+                name.as_char_ptr(),
+                0o444,
+                self.as_ptr(),
+                data as *const _ as *mut _,
+                core::ptr::null(),
+                &<T as DisplayFile>::VTABLE,
+            ))
+        }
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        {
+            // Mark parameters used
+            let (_, _) = (name, data);
+            Self()
+        }
+    }
 }
 
 impl Drop for Dir {
@@ -133,3 +175,63 @@ fn drop(&mut self) {
         }
     }
 }
+
+#[cfg(CONFIG_DEBUG_FS)]
+mod helpers {
+    use crate::seq_file::SeqFile;
+    use crate::seq_print;
+    use core::fmt::Display;
+
+    /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`
+    ///
+    /// # Safety
+    /// * inode's private pointer must point to a value of type T which will outlive the inode and
+    ///   will not be mutated during this call
+    /// * file must point to a live, not-yet-initialized file object
+    pub(crate) unsafe extern "C" fn display_open<T: Display>(
+        inode: *mut bindings::inode,
+        file: *mut bindings::file,
+    ) -> i32 {
+        // SAFETY:
+        // * file is acceptable by caller precondition
+        // * print_act will be called on a seq_file with private data set to the third argument,
+        //   so we meet its safety requirements
+        // * The data pointer passed in the third argument is a valid T pointer that outlives this
+        //   call by caller preconditions
+        unsafe { bindings::single_open(file, Some(display_act::<T>), (*inode).i_private) }
+    }
+
+    /// Prints private data stashed in a seq_file to that seq file
+    /// # Safety
+    /// `seq` must point to a live `seq_file` whose private data is a live pointer to a `T` which is
+    /// not being mutated.
+    pub(crate) unsafe extern "C" fn display_act<T: Display>(
+        seq: *mut bindings::seq_file,
+        _: *mut core::ffi::c_void,
+    ) -> i32 {
+        // SAFETY: By caller precondition, this pointer is live, points to a value of type T, and is
+        // not being mutated.
+        let data = unsafe { &*((*seq).private as *mut T) };
+        // SAFETY: By caller precondition, seq_file points to a live seq_file, so we can lift it
+        let seq_file = unsafe { SeqFile::from_raw(seq) };
+        seq_print!(seq_file, "{}", data);
+        0
+    }
+
+    // Work around lack of generic const items
+    pub(crate) trait DisplayFile: Display + Sized {
+        const VTABLE: bindings::file_operations = bindings::file_operations {
+            read: Some(bindings::seq_read),
+            llseek: Some(bindings::seq_lseek),
+            release: Some(bindings::single_release),
+            open: Some(display_open::<Self> as _),
+            // SAFETY: file_operations supports zeroes in all fields
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

