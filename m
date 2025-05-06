Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E2727FB35
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537968; cv=none; b=uAPqrN+EidPHtE06ufRbQsVlHdeO6yxIjCNCDMzmPHqb/ZzlT1iiqslrQ6kZHTM2t0BOvvkdjtegDkH5tZLW05bbbZlggM6uUipOSfrRMopkg67+YFW7FM2m5mxRtk0zgLkD5AxvJ3b503JVJnFqSQgdBW7IxsUoHml898i3nGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537968; c=relaxed/simple;
	bh=2XEHDDChylavDLDY+rGun5ecIVREM7AJUDpYkksAvpo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jJqSHwHFnVRCZ3o5r2Fmey3WyQHGwmA0ZVfM2ukh7kaEKd/1NafVvhw6Lmx6vTnhbZvvowpWPgosI6lQisAwI+8C4Sgx/NfNM5qEmviVQlwdgQnym28hY5OXDi+9TEOfy9pxF5NEGpMKV8S7h39/GvkVB0GuVcoDo/9sxsdXhVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=furFtvBL; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="furFtvBL"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf446681cso33147525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746537965; x=1747142765; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LqGg/4PX4lfPlBMEDVpCDGqvzRMbkhBQTtueIfGCAjQ=;
        b=furFtvBLZMFgwFthkIb1lbxC31L6ciTu+QqYJmIEHcEWgxQLE4BNvbirfxBjzMNRhj
         Vybnh+tNNYIg7LohLTtYqY1fJmcLVKKokbNoD33PgdSAnM+zH8DAXk1lmYpkIZzqg4+d
         P8MHI+k7RbCpYaYBdtKMKm2MH5WLE2HAr+hUnVlyEp4TGhXjKHeNpE109NfI3gzsB3dY
         ULj2oYL20moEIvt02gYQcnaY1PdsT4eNsAqFgzBmZFu+uZZeqVB59g0FO2DABID0kpB3
         rDyGxiOV9TLeM6UhHIv58L8fSOgALTIFO3CcBgRjyuVDCOFWaWqRSQoFlW5vud5vmyMI
         XKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537965; x=1747142765;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqGg/4PX4lfPlBMEDVpCDGqvzRMbkhBQTtueIfGCAjQ=;
        b=veVTC2QWjqs5qgT10jPfk+K73JM1MBP2DpjTXOTn/49wdg+Ra8K4P0gLIKuloMYHIt
         WEeyemqn6VAHdS0CSAajEnPQ2Vdx6d8pbfSBDKhubbE41P+OuK0xzRa21hOhHrKxkLJi
         i9De7iwv0HrsF2xhBdV33+4E0ayii7blbX6H7kqhbCw5L686E/loFqw6uwdjesIzGKT1
         SHtzPx9kFrC09aK9Rk26pD5OOJVXFP8PtlsPqdKwl0B7V0goTj3dZNN9dmL3fF+qt8BF
         tcvKCgq7TX6AhXxmQNtGediJuplpbwVW0eo/O8Z0hmS8RH8hIzvqc6o/NrlRpnIkHclO
         pD9w==
X-Forwarded-Encrypted: i=1; AJvYcCXkJ2afs/jgxG6oogRfL4iB8XeZPK5kZf2MO5hdPfWMLjpHqYo/IybZqintoMqqcr/ZMqZ2LCRlydMfu88=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52XtIJeIgZR2WESRD2V858QCTOhblGa2e4yXZ0guotArYJNEV
	039PGupxYxTytPl6vvJJ14L0nvbYKyksHrdNsRwD296yXbtAaFCMFQbXKx3bbJNS7UudomsCHPS
	gZmd9RIuvwOEMsQ==
X-Google-Smtp-Source: AGHT+IFoo5QcCulFekCf8I6f2N+r1G5/Ka9pAfegofIbJT/CNK4xDoFUvlPWo60yM7wW6Y2tvexbwqYKVhHFU4s=
X-Received: from wmqe18.prod.google.com ([2002:a05:600c:4e52:b0:441:b607:4ec0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1986:b0:43d:585f:ebf5 with SMTP id 5b1f17b1804b1-441c48b03e9mr90672685e9.1.1746537964761;
 Tue, 06 May 2025 06:26:04 -0700 (PDT)
Date: Tue, 06 May 2025 13:25:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOYNGmgC/0XNQQ7CIBCF4asQ1o6hUIhyFdNFC4OyKEWg1abp3
 cW6cPlP8r7ZaMbkMVNNNppw8dlPoUZzItQ8+nBH8LY25YxLJpmCuQ5iSRDwVdaIwB1T7HqRRoi
 B1lVM6Pz7EG/drxM+5wqX3/HvanKoLW8hlxRMXMGlaTxeQOO4ZWpgxlrUi/jSQ58RzDSOvmiyq HMjIRlBu33/AIHHZ3HHAAAA
X-Change-Id: 20250506-userptr-newtype-2f060985c33b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5645; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=2XEHDDChylavDLDY+rGun5ecIVREM7AJUDpYkksAvpo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoGg3qDaNXyRWS1mHsy/OJSeNrGJlFRLCn2VlGx
 jC5vmCS4z+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBoN6gAKCRAEWL7uWMY5
 RkpSD/9o7WdzaOtvDLPgmTU8X3U3DldTmrIwiEyidGsWiaPXKbbYmBZJW7VK7jwoXt8/mik5Wgu
 wUWcMh24zL/HF9ficiFvwfDk/pGe0TxA7WCKj8mIwJgKN+1iAvG5lc8XcXzT79t6Hkbzd7Swfc9
 F4xZ1N6ymCjKMkWZ7YvxQNjPJ8H0AXPZeRVN9LWPOu5/I6KlnpLF0NBdUGiTf+7/19FXh7+8ZBR
 5EToWj8X0RphLKtbEBRDve7XoAKyk61aO0rvfw/bb2kuwjOYUhhQYDyYu6VQlCc3zS0W86Lk4Rx
 OVp4vDEsXyDsdn5XPCt6JyZasC1nEmYviu2qGtexJo8j+gpDuTHZ86rwHJLJkqNrYEZTbLb5NR0
 xoirV2rvMVuUC6JO909Ps3KE4rD7/hbt53tMZOiYnQNoaclmiHrpCPC0QwUz6ZOE/qJLqQFjo+f
 QIVqiaLMwQrUAFeUhAKWTBKydZo+6lMwikafudTySOIwFmt8ffctE/tC4S10MOazsx1U7234wha
 yf9JPmx0C+sJKHxnuAduzy78jwW4oWXeGhhO6Ez2rtFUQELLa/UY7nhiKBfIeEcCaqKf/tAK3ah
 IY/qM0jRub2NhyG28ebpA3fX4q/zvWieN2Jy+I8dkqL1IHfKcweuLTx5zBYMooA1t8c0HqCQzmM wnukExuUiexPhNQ==
X-Mailer: b4 0.14.2
Message-ID: <20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com>
Subject: [PATCH] uaccess: rust: use newtype for user pointers
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

In C code we use sparse with the __user annotation to detect cases where
a user pointer is mixed up with other things. To replicate that, we
introduce a new struct UserPtr that serves the same purpose using the
newtype pattern.

The UserPtr type is not marked with #[derive(Debug)], which means that
it's not possible to print values of this type. This avoids ASLR
breakage.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs           | 48 ++++++++++++++++++++++++++++++++++------
 samples/rust/rust_misc_device.rs |  4 +++-
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 978205289d297a4001a51fa40ac29039bff73672..2914a35de3dfbc7860ebf0d6e11cc65d409e9481 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -14,8 +14,38 @@
 };
 use core::mem::{size_of, MaybeUninit};
 
-/// The type used for userspace addresses.
-pub type UserPtr = usize;
+/// A pointer into userspace.
+///
+/// This is the Rust equivalent to C pointers tagged with `__user`.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct UserPtr(pub usize);
+
+impl UserPtr {
+    /// Cast this userspace pointer to a raw const void pointer.
+    ///
+    /// It is up to the caller to use the returned pointer correctly.
+    #[inline]
+    pub fn as_const_ptr(self) -> *const c_void {
+        self.0 as *const c_void
+    }
+
+    /// Cast this userspace pointer to a raw mutable void pointer.
+    ///
+    /// It is up to the caller to use the returned pointer correctly.
+    #[inline]
+    pub fn as_mut_ptr(self) -> *mut c_void {
+        self.0 as *mut c_void
+    }
+
+    /// Increment this user pointer by `add` bytes.
+    ///
+    /// This is addition is wrapping, so wrapping around the address space does not result in a
+    /// panic even if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
+    pub fn wrapping_add(self, add: usize) -> UserPtr {
+        UserPtr(self.0.wrapping_add(add))
+    }
+}
 
 /// A pointer to an area in userspace memory, which can be either read-only or read-write.
 ///
@@ -226,7 +256,7 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
         }
         // SAFETY: `out_ptr` points into a mutable slice of length `len`, so we may write
         // that many bytes to it.
-        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr as *const c_void, len) };
+        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr.as_const_ptr(), len) };
         if res != 0 {
             return Err(EFAULT);
         }
@@ -264,7 +294,7 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
         let res = unsafe {
             bindings::_copy_from_user(
                 out.as_mut_ptr().cast::<c_void>(),
-                self.ptr as *const c_void,
+                self.ptr.as_const_ptr(),
                 len,
             )
         };
@@ -381,7 +411,7 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
         }
         // SAFETY: `data_ptr` points into an immutable slice of length `len`, so we may read
         // that many bytes from it.
-        let res = unsafe { bindings::copy_to_user(self.ptr as *mut c_void, data_ptr, len) };
+        let res = unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
         if res != 0 {
             return Err(EFAULT);
         }
@@ -408,7 +438,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         // is a compile-time constant.
         let res = unsafe {
             bindings::_copy_to_user(
-                self.ptr as *mut c_void,
+                self.ptr.as_mut_ptr(),
                 (value as *const T).cast::<c_void>(),
                 len,
             )
@@ -441,7 +471,11 @@ fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<us
 
     // SAFETY: `buf` is valid for writing `buf.len()` bytes.
     let res = unsafe {
-        bindings::strncpy_from_user(buf.as_mut_ptr().cast::<c_char>(), ptr as *const c_char, len)
+        bindings::strncpy_from_user(
+            buf.as_mut_ptr().cast::<c_char>(),
+            ptr.as_const_ptr().cast::<c_char>(),
+            len,
+        )
     };
 
     if res < 0 {
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08cf4308fe1bd37d11d28374c1f034..6519c61636311b9ffb90d55c03c0a36520933fde 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -107,7 +107,7 @@
     prelude::*,
     sync::Mutex,
     types::ARef,
-    uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
+    uaccess::{UserPtr, UserSlice, UserSliceReader, UserSliceWriter},
 };
 
 const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);
@@ -176,6 +176,8 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
     fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
         dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
 
+        // Treat the ioctl argument as a user pointer.
+        let arg = UserPtr(arg);
         let size = _IOC_SIZE(cmd);
 
         match cmd {

---
base-commit: f34da179a4517854b2ffbe4bce8c3405bd9be04e
change-id: 20250506-userptr-newtype-2f060985c33b
prerequisite-change-id: 20250424-strncpy-from-user-1f2d06b0cdde:v3
prerequisite-patch-id: 3b99605d033602b9440a12c7ca38acd5ad071a13
prerequisite-patch-id: fae3d2f99d1b0f00a79105921dcbff30d5229b91

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

