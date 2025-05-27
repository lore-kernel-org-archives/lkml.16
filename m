Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60328134CB
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354006; cv=none; b=r0SGMHXfvGJ6iKSwmdktVvBpUKCM5R9dj0kMQDfJrho/rk60slKOUKCh/2pW9LrOycfAsnq+hnHryT0m9YIPSB0zsz6Fu2Bl8mfT+OBGO+xnoW5SQU5pk7DPqjdzXywXTeHOROBIVTmOpRECANijAk717OcwNhwaOqJ9xKXcb2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354006; c=relaxed/simple;
	bh=XoLOFBD380B0z+spAWrGkh6HkL8dD+n+VHIJvltqm0o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SIu1rAhLwLMBQ5X4Q0inxAVQEySTAjqSomKg02qI1t26l8CB4gJ9sKaonF/8LtjzpPhN+/S4o95lL21Ik3VKno9rm0R0MkqrFkFt+bIovmKzcihBCqtdJpADRi0CjsdRvSNr4HODDVC3bxYuMI/OVjhJb9aWawhT6zEyzjs1wIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmjOf60b; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmjOf60b"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-441c96c1977so20194775e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748354003; x=1748958803; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rkP95jvBM4DvOBSbTLA9rXG8Mwi0T7ESJRQ+ZKMslh8=;
        b=XmjOf60bzRQ4NogrQJ9yrsAwRh/943qm9baw+VBnCwHnfhrMbDSGrSXirFbL5SbIdI
         ga+okwGR+bbAfVRC2HvaGPKDJdhSK5/hw9Cn73iDSNps61RRNbHGRXMWm78n6MAGjaOu
         YJPxThtffcaabLbtp05dypDh3hFLet/7IO/HyaKAovTAShuMzN6JXBa6MWwLLjlg1Q9i
         I9v5CM5oSmKLXpbgezMos8eLcDEt2y+vtwMMKcQ+Fd8GfpFS6T4DjzuJWPdPseMLSjX/
         CnKEjZagtGkJ8TtgQXorY0z2F1J/bgfPgOZt8gXHvSZnjb1bA38dmrZi2C7P13Pju6z6
         FpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354003; x=1748958803;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkP95jvBM4DvOBSbTLA9rXG8Mwi0T7ESJRQ+ZKMslh8=;
        b=JHZ9y1EVnAWFOcB1mZPhWFPKqwn0rbpy1P9pMYsI7hwjEGmCaLIugx8jN0zixADwkn
         93+KZwkhYOxvruiRiOr9ot8c10XuaeCJoWoCkEq6OigSx/UgBTfpI0pGH8Vt4bwyjM9s
         rEPJF2vd6wBM516m1gLhm8iEPmyE5L+8VCmzI4QGnvR0QGplHVtMu1KrDW+srVctAwka
         r3yGQH7f4gfRD+CNSGTgYAEUpkCfFXFrP9qgfOqbJBbBM7UwGe0ly5WsYv4z0bYPyohK
         wFwLyRf3VYJQ07uc9L54W/Tb9Iv+RdyQQlyRCxLFr6+8Sb0PCcYD6vBQhgPdC+Q/TJyo
         0jyA==
X-Forwarded-Encrypted: i=1; AJvYcCU/8mM8RQmgIqDS3Mse9oJvOY2gANAmgoD0Y9Exv5wb7WD+fJa8j3O1H1lm8plLY2UXLJaGGBfOc58jSNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2eqlbJNjPpkUIeuIQkVajXslDWtz3MlL6Cc2jKtb8RcU0OkSc
	qWir0TbCi5QN4uHWksfkiP+FWvnTbXyC5bnAMY9r9W48RmIr+dLvU+PHSUlQnUCQYbhxm/VnK6B
	j5r1YzECHMUcUOdlYlw==
X-Google-Smtp-Source: AGHT+IHA/HFwxxIRQOtbI1uDLPJwDHqJWj0wO1Q0Kmd/AnsOvvc6FYwY9fpV87JPakUyydWc3hvucjeQrZOhy7g=
X-Received: from wmbji3.prod.google.com ([2002:a05:600c:a343:b0:44a:bc4e:e9a9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3505:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-44c95aad969mr105708265e9.33.1748354002720;
 Tue, 27 May 2025 06:53:22 -0700 (PDT)
Date: Tue, 27 May 2025 13:53:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMfDNWgC/3WPQQ6CMBBFr0K6dkxbaKOsvIdxAWWKTYTitFaJ4
 e4WXLhy+X/y35t5s4DkMLC6eDPC5ILzYw5yVzBzbcYewXU5M8ml4opreOTBFAlGfMZ5QpCWa34
 8KFOWLcuridC610Y8X76Z8P7I4Pgtf9ysWamVrCBEGs00gyU/bAoQVnZct9x0HdapWtFtExCMH
 wYX6yLpvVBApmSr5epC9DRvbySxaf5enAQIaLjV9mDwaI069d73N9xnNLssy/IBLwY+jBUBAAA =
X-Change-Id: 20250506-userptr-newtype-2f060985c33b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8034; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XoLOFBD380B0z+spAWrGkh6HkL8dD+n+VHIJvltqm0o=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoNcPQVrJo6mDhBtSmIkXVfp3lnVBNTa0P3XEiE
 eASdyUXbdOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaDXD0AAKCRAEWL7uWMY5
 Ri6VD/0bfcRV/DMj5lQaJvM2e49ubNOFNpQjMvSMxychwpvpGWHL2RDBYflmsGRnz9hwbbuwqDA
 9VQ7UZQUCqVKvpKuZeGpeN46vThECXgHKCTD61fIDO5Fvu6MO8hzVFNfIargSSh4JoITQWmKa7r
 HLevFSusTwKHCaFZ/1rBlvfPHeYeJYUDU05DjICJyaiXEvD0yUlKSwb46a4WMfEq7o5vglGHHzZ
 IXpv0bjVCxBo/52Ah9ofOniXXSRgUKoWAfms+wZhSr0OhzlCx3mUq4q81z3SdzKIp6OFVGB4ems
 QWk4CS2P8q6LmzUKWtbd32s7v1sV1G7O2e3gFlCtgdniqvop3XjZdm5H01TbggFKu+vxI+NTvgT
 cDYh3IL5ffaRssXP+xTcxcd+9sipY8fbuHAJ1D8NId7zpZPh2jrhxCfeUyZw5smZ3wLwE7JLy2r
 FCMAhDbQCiGRlYg4rMi+tkso+800rddYqkGAbV51jOSA6wUGGyEToWGlOrtMFdoGZhKj2Vx66Sm
 WfSp15zUOS/Y1+VmZXXgMAywX0mRxISUGmHS9pN2zZVxqu+GXZxgYAD5pM6mkI3+2gMlZVfRdQP
 k4dWquExPhivmkjgFEBV7ouN5z4lY2TlKuC2meUjCs40iBWCKTmqznJSzmfvgLsh7g3XF6RCkNh 0IoYThTW53j+ZqQ==
X-Mailer: b4 0.14.2
Message-ID: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
Subject: [PATCH v2] uaccess: rust: use newtype for user pointers
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
leakage.

The type is added to the prelude as it is a fairly fundamental type
similar to c_int. The wrapping_add() method is renamed to
wrapping_byte_add() for consistency with the method name found on raw
pointers.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This is based on top of the strncpy_from_user for Rust patch.
---
Changes in v2:
- Change usize to raw pointer.
- Make field private.
- Rename wrapping_add to wrapping_byte_add.
- Add to prelude.
- Rebase on v4 of strncpy_from_user
- Link to v1: https://lore.kernel.org/r/20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com
---
 rust/kernel/prelude.rs           |  2 ++
 rust/kernel/uaccess.rs           | 68 +++++++++++++++++++++++++++++++++-------
 samples/rust/rust_misc_device.rs |  2 ++
 3 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index baa774a351ceeb995a2a647f78a27b408d9f3834..081af5bc07b0bcefb1da16e5a81fc611b3178aea 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -41,3 +41,5 @@
 pub use super::init::InPlaceInit;
 
 pub use super::current;
+
+pub use super::uaccess::UserPtr;
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index e6534b52a1920254d61f8349426d4cdb38286089..02e0561eb1c6f4d813a4ab13a124bfac2d2a5c75 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -14,8 +14,48 @@
 };
 use core::mem::{size_of, MaybeUninit};
 
-/// The type used for userspace addresses.
-pub type UserPtr = usize;
+/// A pointer into userspace.
+///
+/// This is the Rust equivalent to C pointers tagged with `__user`.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct UserPtr(*mut c_void);
+
+impl UserPtr {
+    /// Create a `UserPtr` from an integer representing the userspace address.
+    pub fn from_addr(addr: usize) -> Self {
+        Self(addr as *mut c_void)
+    }
+
+    /// Create a `UserPtr` from a pointer representing the userspace address.
+    pub fn from_ptr(addr: *mut c_void) -> Self {
+        Self(addr)
+    }
+
+    /// Cast this userspace pointer to a raw const void pointer.
+    ///
+    /// It is up to the caller to use the returned pointer correctly.
+    #[inline]
+    pub fn as_const_ptr(self) -> *const c_void {
+        self.0
+    }
+
+    /// Cast this userspace pointer to a raw mutable void pointer.
+    ///
+    /// It is up to the caller to use the returned pointer correctly.
+    #[inline]
+    pub fn as_mut_ptr(self) -> *mut c_void {
+        self.0
+    }
+
+    /// Increment this user pointer by `add` bytes.
+    ///
+    /// This addition is wrapping, so wrapping around the address space does not result in a panic
+    /// even if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
+    pub fn wrapping_byte_add(self, add: usize) -> UserPtr {
+        UserPtr(self.0.wrapping_add(add))
+    }
+}
 
 /// A pointer to an area in userspace memory, which can be either read-only or read-write.
 ///
@@ -179,7 +219,7 @@ impl UserSliceReader {
     pub fn skip(&mut self, num_skip: usize) -> Result {
         // Update `self.length` first since that's the fallible part of this operation.
         self.length = self.length.checked_sub(num_skip).ok_or(EFAULT)?;
-        self.ptr = self.ptr.wrapping_add(num_skip);
+        self.ptr = self.ptr.wrapping_byte_add(num_skip);
         Ok(())
     }
 
@@ -226,11 +266,11 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
         }
         // SAFETY: `out_ptr` points into a mutable slice of length `len`, so we may write
         // that many bytes to it.
-        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr as *const c_void, len) };
+        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr.as_const_ptr(), len) };
         if res != 0 {
             return Err(EFAULT);
         }
-        self.ptr = self.ptr.wrapping_add(len);
+        self.ptr = self.ptr.wrapping_byte_add(len);
         self.length -= len;
         Ok(())
     }
@@ -264,14 +304,14 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
         let res = unsafe {
             bindings::_copy_from_user(
                 out.as_mut_ptr().cast::<c_void>(),
-                self.ptr as *const c_void,
+                self.ptr.as_const_ptr(),
                 len,
             )
         };
         if res != 0 {
             return Err(EFAULT);
         }
-        self.ptr = self.ptr.wrapping_add(len);
+        self.ptr = self.ptr.wrapping_byte_add(len);
         self.length -= len;
         // SAFETY: The read above has initialized all bytes in `out`, and since `T` implements
         // `FromBytes`, any bit-pattern is a valid value for this type.
@@ -384,11 +424,11 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
         }
         // SAFETY: `data_ptr` points into an immutable slice of length `len`, so we may read
         // that many bytes from it.
-        let res = unsafe { bindings::copy_to_user(self.ptr as *mut c_void, data_ptr, len) };
+        let res = unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
         if res != 0 {
             return Err(EFAULT);
         }
-        self.ptr = self.ptr.wrapping_add(len);
+        self.ptr = self.ptr.wrapping_byte_add(len);
         self.length -= len;
         Ok(())
     }
@@ -411,7 +451,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         // is a compile-time constant.
         let res = unsafe {
             bindings::_copy_to_user(
-                self.ptr as *mut c_void,
+                self.ptr.as_mut_ptr(),
                 (value as *const T).cast::<c_void>(),
                 len,
             )
@@ -419,7 +459,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         if res != 0 {
             return Err(EFAULT);
         }
-        self.ptr = self.ptr.wrapping_add(len);
+        self.ptr = self.ptr.wrapping_byte_add(len);
         self.length -= len;
         Ok(())
     }
@@ -444,7 +484,11 @@ fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<us
 
     // SAFETY: `dst` is valid for writing `dst.len()` bytes.
     let res = unsafe {
-        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>(), src as *const c_char, len)
+        bindings::strncpy_from_user(
+            dst.as_mut_ptr().cast::<c_char>(),
+            src.as_const_ptr().cast::<c_char>(),
+            len,
+        )
     };
 
     if res < 0 {
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08cf4308fe1bd37d11d28374c1f034..e7ab77448f754906615b6f89d72b51fa268f6c41 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -176,6 +176,8 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
     fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
         dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
 
+        // Treat the ioctl argument as a user pointer.
+        let arg = UserPtr::from_addr(arg);
         let size = _IOC_SIZE(cmd);
 
         match cmd {

---
base-commit: f34da179a4517854b2ffbe4bce8c3405bd9be04e
change-id: 20250506-userptr-newtype-2f060985c33b
prerequisite-change-id: 20250424-strncpy-from-user-1f2d06b0cdde:v4
prerequisite-patch-id: d35c479ddb84bacc541dbb226c7911e5a22cad7e
prerequisite-patch-id: e0c345945dabfa18e9ca11f7fe11f8178d071285

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

