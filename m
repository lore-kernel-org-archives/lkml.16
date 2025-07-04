Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA262E9EC6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621186; cv=none; b=i75ahLDsI/sBC8Iq5ULHsoP4c82YRX7Haflj5k2s2JNhc+EOnMLXs/VRnoiZRnbuJjMLjgbOlR5iYCRS0zJxfhtOi3oewpma2hKZPs2QwvApd7syLqOt2zIRtcEGJO4k8ZDKfEnveWCvDTZWOLG/0d9jHXza1b+a7K0es0NOk1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621186; c=relaxed/simple;
	bh=bRUtI9KpAhhm4yIAN+C8rrv5c2+QoPmfHSk9YxoCjuw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kPiRLf5j8VRpvdS+uIAGvYyAe3U6D+flc/ORIj5248A5J6g1vdvgsURU9BfZL1bozEiR1oHdD4pRwdf4bVJpIK0cfshJkPf+fv1k6pG7wifxI5uBXLEEvItMT4OxyHCGxgFdW/Ep+GWa+JiLuNLXmhXplOUQUz6inejhDalGHaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lOWjDgtA; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lOWjDgtA"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so306113f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751621183; x=1752225983; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUd2sq4XBEjYfJBZbomCDBt/A4I34lE0cFv0SVFw/2I=;
        b=lOWjDgtAqKo6AaRSbm9xETI83ruGhsFW99hMOX4D0jbXewwdOkamajOgQavbhDm3Li
         Bzseop/lepHUoUcXr1jOnb08ZSlPwsBMbNZ7T/gwge3XPMeryGgsi+jJp9SBGUJFMuDa
         otkPCo0OvWamwcpshR98mmMQ8LNkTLVNc85i933OwxISvr5fAAnFQWwfJexpuQHRp4Vd
         gAOq6Ssk9/nFdkUcGrlzkPqbvHwYQAD/Dv59F03KkO6Wsg3vY+awTKCC8US79h/C+foR
         z+vfR+pTzJ0ktQjRXWEhUdcYWkj4lQRa4DkWAfkUyQky4fGuXuWY9J0//I39q/cMSP0D
         wVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751621183; x=1752225983;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUd2sq4XBEjYfJBZbomCDBt/A4I34lE0cFv0SVFw/2I=;
        b=ZtYmPpvud2hBJG2Jhd+W99Rw/FBt2U2ZRM6H7c6/xDxC2v0lm5o2jxeFyvoVOYEVaW
         eG2dfWQxQkaOSZQUHOpDsQteo/2yWHOvhJKXJ8Z+WRMQv4d3+dzN7FMRSY798iwuui94
         hDJ7NzQHyYGOLIyvi9Rj+JN/eka8dvNb2Ti3E9iFJZdhmcXNzC1A0b5FkYQz4Rb6PdRh
         MKOHvPIvHsKnIumDPS/4zgcn+kORVXYuXhlpp/+wgVMXFYMqgMs0p6jIRa50Uc1sENSS
         Yh4AznYgo/FPlnZ1YepAWPLKz4ocEiSZlCxw9VlJbs6gbkstykURkkRy5KGJDQDzLAtr
         i6+w==
X-Forwarded-Encrypted: i=1; AJvYcCW/ooB5aC0DcWO6i38b3bPe63q/rFNz4s+q7vBCc4vVPNEhiLKiEId/TS+2vsep7LTIKZLNgDOmXU/5qGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxazeHil7yPjgDm4MIB5OzaCACOwCKokC8EDFupv7qQX0wEbqV2
	9gls6THjzya6CaYE8MyiKDGkTHm/WxVE/xE2bHqAmoS1OdX4hns2gVoNG6QMRc8ooFIJiuzoqoo
	QnCftijMnJs7BsTeiZw==
X-Google-Smtp-Source: AGHT+IFsAR7ak+uOFE2//Zn4PgR+QTZcpjZtO9D/5Piz3xZ6reTuB/G8jhnPA+dUhSNRqNVBuuFGL+Z6pShPp1k=
X-Received: from wrbew11.prod.google.com ([2002:a05:6000:240b:b0:3a4:f038:be6b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2004:b0:3b3:9ca4:ac8e with SMTP id ffacd0b85a97d-3b4964f7b7emr1517776f8f.44.1751621183379;
 Fri, 04 Jul 2025 02:26:23 -0700 (PDT)
Date: Fri, 04 Jul 2025 09:26:02 +0000
In-Reply-To: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5635; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=bRUtI9KpAhhm4yIAN+C8rrv5c2+QoPmfHSk9YxoCjuw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoZ546DiATh9SRSszo5bqCJdgjEr67UShsCFwE+
 lHjRArvg5WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaGeeOgAKCRAEWL7uWMY5
 RlqZD/wInSW2tpLzMczSL3xJmfBk81/dAlQcSKAP90dF9bAFfklJS2Ef5UQsCgghYigYFx4Cles
 HzNkNZmXEuzWbW68Gbas/HzMicHzEtDN/Vv5sLOwKPCvM+Kc70rXwkZdGM+k6NHET0Xfpxzt2sY
 uYWAauu6OD71rBL6m4m1S4Xs8Dn3s4xDVUq75BBgQk34rCywSlGbItwB6BCnC9HCnEb7w5soVBa
 trFWXr9JjHb36UJXC/+hb3WYajKdv8lskv91gHbSIHLjHuL/XM6VT0iV12N01emtXhM7j2X4075
 0n22N0FL7zBy6WnIEXHNLXDv+ZelkWlV85Jiqo8mc62PZILCgoWxLKbkzl3lzh/0w9o/21LVo5Q
 xB6L4tt6hjZgwS38zlsFzbvKJgzPNs/Z0PlHfxUZtMFOenqUOkEpeffqZagZyWJoJL4deHxMS2j
 D+yMsuFo5arjbxWrFeS1d/kcXIRcuGEyASv3hKabzzii4mJHvlPzrLWMRKBwHwAPk4rmc0uERmR
 LbEnnuTGxJ1zBIDUG+aw6ZjvaA7e0R6OwEh4TQNjlIclSiPPNjA3qw/52n2dmdvYpCkNtqqoFFw
 K/oUxfOxVq3TJC1Oeaz6esqzaJ2iqVVeciK1Z2haaEBtS9e7lkWfzHXs4riRd3ba7eFKdcifEPv veMQzsFj1VuuPMg==
X-Mailer: b4 0.14.2
Message-ID: <20250704-iov-iter-v2-3-e69aa7c1f40e@google.com>
Subject: [PATCH v2 3/4] rust: miscdevice: Provide additional abstractions for
 iov_iter and kiocb structures
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

These will be used for the read_iter() and write_iter() callbacks, which
are now the preferred back-ends for when a user operates on a char device
with read() and write() respectively.

Co-developed-by: Lee Jones <lee@kernel.org>
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 97 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 22f291211636f66efca6b33b675833236332719e..a49954c9b0d14117645be8139db792f1fd22589d 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -14,13 +14,14 @@
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
     fs::File,
+    iov::{IovIterDest, IovIterSource},
     mm::virt::VmaNew,
     prelude::*,
     seq_file::SeqFile,
     str::CStr,
     types::{ForeignOwnable, Opaque},
 };
-use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin, ptr::NonNull};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
@@ -136,6 +137,16 @@ fn mmap(
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
+    /// Read from this miscdevice.
+    fn read_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterDest<'_>) -> Result<usize> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Write to this miscdevice.
+    fn write_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterSource<'_>) -> Result<usize> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Handler for ioctls.
     ///
     /// The `cmd` argument is usually manipulated using the utilities in [`kernel::ioctl`].
@@ -177,6 +188,36 @@ fn show_fdinfo(
     }
 }
 
+/// Wrapper for the kernel's `struct kiocb`.
+///
+/// The type `T` represents the private data of the file.
+pub struct Kiocb<'a, T> {
+    inner: NonNull<bindings::kiocb>,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T: ForeignOwnable> Kiocb<'a, T> {
+    /// Get the Rust data that represents this misc device.
+    pub fn device(&self) -> <T as ForeignOwnable>::Borrowed<'a> {
+        // SAFETY: The `kiocb` lets us access the private data.
+        let private = unsafe { (*(*self.inner.as_ptr()).ki_filp).private_data };
+        // SAFETY: The kiocb has shared access to the private data.
+        unsafe { <T as ForeignOwnable>::borrow(private) }
+    }
+
+    /// Gets the current value of `ki_pos`.
+    pub fn ki_pos(&self) -> i64 {
+        // SAFETY: The `kiocb` can access `ki_pos`.
+        unsafe { (*self.inner.as_ptr()).ki_pos }
+    }
+
+    /// Gets a mutable reference to the `ki_pos` field.
+    pub fn ki_pos_mut(&mut self) -> &mut i64 {
+        // SAFETY: The `kiocb` can access `ki_pos`.
+        unsafe { &mut (*self.inner.as_ptr()).ki_pos }
+    }
+}
+
 /// A vtable for the file operations of a Rust miscdevice.
 struct MiscdeviceVTable<T: MiscDevice>(PhantomData<T>);
 
@@ -240,6 +281,50 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         0
     }
 
+    /// # Safety
+    ///
+    /// `kiocb` must be correspond to a valid file that is associated with a
+    /// `MiscDeviceRegistration<T>`. `iter` must be a valid `struct iov_iter` for writing.
+    unsafe extern "C" fn read_iter(
+        kiocb: *mut bindings::kiocb,
+        iter: *mut bindings::iov_iter,
+    ) -> isize {
+        let kiocb = Kiocb {
+            // SAFETY: The read_iter call of a file is given a kiocb for that file.
+            inner: unsafe { NonNull::new_unchecked(kiocb) },
+            _phantom: PhantomData,
+        };
+        // SAFETY: This is a valid `struct iov_iter` for writing.
+        let iov = unsafe { IovIterDest::from_raw(iter) };
+
+        match T::read_iter(kiocb, iov) {
+            Ok(res) => res as isize,
+            Err(err) => err.to_errno() as isize,
+        }
+    }
+
+    /// # Safety
+    ///
+    /// `kiocb` must be correspond to a valid file that is associated with a
+    /// `MiscDeviceRegistration<T>`. `iter` must be a valid `struct iov_iter` for writing.
+    unsafe extern "C" fn write_iter(
+        kiocb: *mut bindings::kiocb,
+        iter: *mut bindings::iov_iter,
+    ) -> isize {
+        let kiocb = Kiocb {
+            // SAFETY: The read_iter call of a file is given a kiocb for that file.
+            inner: unsafe { NonNull::new_unchecked(kiocb) },
+            _phantom: PhantomData,
+        };
+        // SAFETY: This is a valid `struct iov_iter` for reading.
+        let iov = unsafe { IovIterSource::from_raw(iter) };
+
+        match T::write_iter(kiocb, iov) {
+            Ok(res) => res as isize,
+            Err(err) => err.to_errno() as isize,
+        }
+    }
+
     /// # Safety
     ///
     /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
@@ -336,6 +421,16 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         open: Some(Self::open),
         release: Some(Self::release),
         mmap: if T::HAS_MMAP { Some(Self::mmap) } else { None },
+        read_iter: if T::HAS_READ_ITER {
+            Some(Self::read_iter)
+        } else {
+            None
+        },
+        write_iter: if T::HAS_WRITE_ITER {
+            Some(Self::write_iter)
+        } else {
+            None
+        },
         unlocked_ioctl: if T::HAS_IOCTL {
             Some(Self::ioctl)
         } else {

-- 
2.50.0.727.gbf7dc18ff4-goog

