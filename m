Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29BE1F4C8C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746215391; cv=none; b=VNyun3DiL8P9FpW+QOyhPgZjHtZ/OTBBXRizCd6jf2w9sfymO/ukjxcBji3rej0hRqppABLGyNm2lJxYBwOxu/3F04GyvQVtQgeEsDStWO3xaRaR1xcgBzSJwtrxGQ11+9+Z75VGozK+AxK+54R6ztsEnKE2ff5izSLlWNbDPHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746215391; c=relaxed/simple;
	bh=5WvGXldG5bcGQ6en9bVq55b0OrTvTyjsMF6SZd8Z0Bg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rgeH33iaXCOHnbFWbCuLWfnUrekmpTHf8t1d0vPdb5rC9swkb9nQN//KISIi63HVNzdkydlQOwxsnbZ8bDitV2/lOCSxYDlGXqlva2N8UvxnyR2alUN8a5yzwgxtR9DTJYQHF4F09dSrCxBBVjb5/Hn9NZ1z19NBhmG3kV/b25o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QQepJyYo; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QQepJyYo"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224192ff68bso21501565ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 12:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746215389; x=1746820189; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LE24yftjPky7Y2IO1C0R+PH9HBG2ii3K+MN0duXsHJs=;
        b=QQepJyYoRuIA1naIpEltkpN1y9n76XNV8pGtj7V+kj4hHcMI7dPp8zFGa9Od16TQl7
         huC8zmD0NtQz/VhwYuGo3Bu1vDf4iaXj1zm1gehYgPtcQi3X6DVFJxEhRZusn1zwplcV
         usEPLufja9f7oVoYCe7q2lf1qypHBm71pWt/srdKaDSQL2o96Y7pwUlzsQezByqOQG5C
         IySuQde1WhpTHJTf7/iFpcYHL58YBC8e4Sz/bvxmINBC4Kq35/ervFoNXrilJptXBHhn
         B5Q6zxK8uUnwSFeOqxv21n140elbcM34UcV1NJqT0YKz4NuHrIUezb5/EE5Gpf9XTLAz
         aTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746215389; x=1746820189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LE24yftjPky7Y2IO1C0R+PH9HBG2ii3K+MN0duXsHJs=;
        b=wZqN10Lj9lsubmF0tZ4Fob9gz/oGSfVtnf+f9+3+oTzJ4oZnvVCgHQQPaDkdjlTjv/
         +YeKyBKxuz5NLsBMvNFOiPIAbd9yNMZmEWKDwV85BqOkPqaSp5DGCqsFoMqULION8jpq
         GDxNhpmDkqstUD9ZT70WhaLE/63D8g9aP2snKG2/4ZvSAajgw85t7ldqI7En8VDuhJp7
         c1hniPPAAOZ8NALEKUw5xTbPNc2yZo/C+VSu1OW5WtG9HMoUpu5VNXElD28NIHzeOW9U
         WVXMJXYQ4AkmAOTSFf0nlrFd77IwBGOkIdMPWF4I/kw7AUSfi3w32CQrSrAijdxjUBV4
         b5WQ==
X-Gm-Message-State: AOJu0Yzz0YRRNsElmEzI2uCKgNP0c6kHYNS0gZjpVDV8oQ/wywdF7Bk1
	4g4sSMseW8ABv1AkqwJKi1eUukl14d3dBeexUVH/E6mmKAkO3zVpEnh799Qk2guyDT0jeZXrJgD
	KBnFGzQ==
X-Google-Smtp-Source: AGHT+IHkpua1Vghb+Jy8opdP02Q/1cQHwzORd+5iSClvFlwjf1VuPwqdumtC+R0Xu3VGwgvOukYgWBW6XEFp
X-Received: from plhs15.prod.google.com ([2002:a17:903:320f:b0:21f:b748:a1c8])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1109:b0:223:4d7e:e52c
 with SMTP id d9443c01a7336-22e18b864damr5930405ad.5.1746215389085; Fri, 02
 May 2025 12:49:49 -0700 (PDT)
Date: Fri, 02 May 2025 19:49:31 +0000
In-Reply-To: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746215384; l=6716;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=5WvGXldG5bcGQ6en9bVq55b0OrTvTyjsMF6SZd8Z0Bg=; b=xNFl7XVnitDzw+Q68ShzQxJezdhBNjD8bPK6UkGs1VR4IZP3d4bykIm39W5i/pH3LTK6qYTAl
 ixqrmmeI2myBjbEK1+2ymiW8Xc9zMNnohxAHuZPlRIM9D/LFzZCuS5C
X-Mailer: b4 0.14.2
Message-ID: <20250502-debugfs-rust-v4-2-788a9c6c2e77@google.com>
Subject: [PATCH v4 2/4] rust: debugfs: Bind file creation for long-lived Display
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
 rust/kernel/debugfs.rs | 139 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 41ac1711e9c0e66de1a434217c363176f806f434..21b116abad864d303f11cc515fe6f86ce5d51cbf 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -7,6 +7,7 @@
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
 use crate::str::CStr;
+use core::fmt::Display;
 use core::marker::PhantomData;
 
 /// Owning handle to a DebugFS directory.
@@ -108,6 +109,57 @@ fn as_ptr(&self) -> *mut bindings::dentry {
     pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b, true> {
         Dir::create(name, Some(self))
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
+    pub fn display_file<'b, T: Display + Sized>(
+        &'a self,
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
+                self.as_ptr(),
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
+            ERR_PTR(ENODEV)
+        };
+
+        // SAFETY: `debugfs_create_file_full` either returns an error code or a legal
+        // dentry pointer, and without `CONFIG_DEBUGFS` we return an error pointer, so
+        // `Dir::from_ptr` is safe to call here.
+        let dir = unsafe { Dir::from_ptr(ptr) };
+
+        File(dir)
+    }
 }
 
 impl<'a> Dir<'a, false> {
@@ -157,3 +209,90 @@ fn drop(&mut self) {
         }
     }
 }
+/// Handle to a DebugFS file.
+#[repr(transparent)]
+pub struct File<'a>(Dir<'a, true>);
+
+impl<'a> File<'a> {
+    /// Remove the file from DebugFS.
+    ///
+    /// # Examples
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let dir = Dir::new(c_str!("foo"));
+    /// let file = dir.display_file(c_str!("bar"), &0);
+    /// // "foo/bar" is created.
+    /// file.remove()
+    /// // "foo/bar" is removed"
+    pub fn remove(self) {
+        drop(self.0.owning())
+    }
+}
+
+#[cfg(CONFIG_DEBUG_FS)]
+mod helpers {
+    use crate::seq_file::SeqFile;
+    use crate::seq_print;
+    use core::fmt::Display;
+    use core::ptr::addr_of;
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
+        // SAFETY: By caller precondition, seq points to a live seq_file.
+        let private_addr = unsafe { addr_of!((*seq).private) };
+        // SAFETY: By caller precondition, this pointer is live, points to a value of type `T`, and
+        // is not being mutated.
+        let data = unsafe { &*(*private_addr as *mut T) };
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

