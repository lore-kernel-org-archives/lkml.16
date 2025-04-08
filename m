Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18398266581
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104257; cv=none; b=ub9zBnq+I3UM46SxsayfM4FswAsMSR2oRjMi0VVdhwtY2p6JxjHozlnT6xu0tvhjMii53glLdkxYF6HSnNbX1WACsRLslFZ6iDCRiDiyFHYL6+s7exDrjcIMFVAEuInVk8xg5hCyFK+1P9loVOtGcnvkZRGB6ItT10tkF0e+3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104257; c=relaxed/simple;
	bh=Sfgq//T2QbdbqoMqrWL7BQLUnjSkh+kpgtWBCSQivcU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I4iQZOWuIowkayp44KOK3XAEcSMN1kkm8lM20+gRYEB9iCudH8UW9rZGpJelmZkUB7Z44x8s4BKtZMc3n1KPS9wRj2r+SL95AB20FPORympXILtxtUyC+XzyRB9egYznKRbLSAEQERMdOiQ+p/Bw4h8nBznI8WNVP9P1RuBeASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cx4HGTyc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cx4HGTyc"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so36714935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744104253; x=1744709053; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BKgSHP0UtGt+oV0m7wKF/tLoW5odDMj8vC7ZBIsrjgA=;
        b=cx4HGTycjH4KeEr0pMv7vXk2vfEVLqn+WWn+LNGQ/tIY4o6W5FZbPCg86+LIy/OZjc
         aAFQ7FUmLwDvjjbFt7Cb/7vmGRE6XhFg32wOy6GM6KlNH7l9AAoY1Lexv5Zrs8FQdwSx
         vDvQp8tMo8SJJA0CjQvtrvb2tUKbdlpX+SVezJlklIixHQTzU+oJRz68IXPCdvNHie8E
         l0ipdVRyV0AEUb7D5lv3Tg7gp1yFp2S2/6zIJR8u74LDQvIkQ2rgPdZ7Kf+CiTUY37WQ
         qDbPD56dUcCxI60YI/xEALRVKR1qo7wgYo5pAittjbXjwyBOQFqdrx7QG/D6e5jn+b3+
         psLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104253; x=1744709053;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKgSHP0UtGt+oV0m7wKF/tLoW5odDMj8vC7ZBIsrjgA=;
        b=gqMyOlIOTVzVY5gGRRsjrDFDhWLpEx3i15pumb3VftTo4DxFTFXEGhtceH9D0GIENH
         LbnS4BXVFvmGxjovXXxAjlQ0FzAWMZ1Eilc4G1y4RUshApFX2wpQah4ErOqU26oW8o9Z
         imEiOrpY2NfzPmnEwzTQ8NifB1Q4aeGmc/i8qvN+08hnivi5o6An1LI9dNDiAzTKBejM
         XuTOLnomw+RPt5dIXjAppuBexl5oif8f19Qs3tZvCbR4svkqAN7olMUCI1cU+ilCGeDF
         grIv9Grndh4i/lS+JivLRCDVLEWzRqOXCoNh9hHHuh/ZQLTB7zBikav+JaZTj/4bZom1
         Wtgw==
X-Forwarded-Encrypted: i=1; AJvYcCV7FEcf90aA9UiBkp66gpksIvD1H/HlqJPOU3+W1uG9feE4iSHTWFGRoCGYMpV3IVX/pVEL21bnzk6Q+Wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxObX6/ycJpZazb64/+Twwqkm3ywsp4CffRyCZcJ5L34G6GnTUZ
	93zZiFf8ikDci3nzFLoamol//0eJMw1paNuhnLtdj0Ve8tXKXBuFYq5Vg5I13Yl8q3BLJBd8m62
	7Ixd7WCo6EfWWCw==
X-Google-Smtp-Source: AGHT+IGKxxFnPnuYQhaMn/C1VHYnvMuiIufsTL+sO+MIIaikeAKJnyM61wTXLBWoQ3PMLnGlIdAs32Q49e1duTw=
X-Received: from wmbbg30.prod.google.com ([2002:a05:600c:3c9e:b0:43d:44cf:11f8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c8d:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-43ecf85f20amr127759175e9.14.1744104253433;
 Tue, 08 Apr 2025 02:24:13 -0700 (PDT)
Date: Tue, 08 Apr 2025 09:22:44 +0000
In-Reply-To: <20250408-vma-v16-0-d8b446e885d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4043; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Sfgq//T2QbdbqoMqrWL7BQLUnjSkh+kpgtWBCSQivcU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn9Osphtn+zBbO8bZFvj7pkZhABnr8VbaFiFEa8
 vSFFXvSY0CJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/TrKQAKCRAEWL7uWMY5
 RuB5D/9RA7H3cjo5/vuxD/VzZyAqYJY0YR+6BZctDljbIzIBs0tHYjQGyX3i9/lx7Z7I24HZgG3
 GYQdZnhqBnxIJeK+aTd3+I6/0Kxt/6IQR6Q12dP9St1jrQR8QY0NbbDlJIpZsh4EnSERgXH4VR2
 Iv/dWP2koycKPHA53sb047tk00stSC8FBUFUrjU+fXIPEprHdC2O05Nn5ARdWJUF/teV+/VTF6O
 MjPU9y7a0TfFX9kS24LGjGguBGUuk04TbeSD3AJ4zI5ttYztwe4rDoy0G5JK0WAdqdOzGvUzjyA
 AqLPw3Ciycje/cSkNmjIHN4NgE5iCyRh6m6L/7vT4aE+XlSlK/fFXROSRYWDwRSP/MQc0QPPXCm
 NN3I1c3hL62W/8E3tveIBF+7V6kp8O8061h//5D2SScR/0OuE8ZVF+UvtYcgqS+ZHSWbog/rDqb
 LvsWYiaW8W+F501INqaTk2CdldRz8wUlYQ2xCRWzFZTlkuXChlDP4Zf8Uhv25SGDKHNwfGiWyoC
 cw7vMFfyvtUFsM0wxwdFhrB6PlXfugS1gsYCk4jrqO7Oq1WipRemsXxl5MPxVF9hjTQSISjPoT4
 mlt0NTtEaoXDAUWMGbFJyHdFpelBc1wv8qCvZZmccvdR9ztCb6uhqJ185K2TK0waNVyj8MsR5Cz nJaPeEL8PTxVTAw==
X-Mailer: b4 0.14.2
Message-ID: <20250408-vma-v16-7-d8b446e885d9@google.com>
Subject: [PATCH v16 7/9] rust: miscdevice: add mmap support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Add the ability to write a file_operations->mmap hook in Rust when using
the miscdevice abstraction. The `vma` argument to the `mmap` hook uses
the `VmaNew` type from the previous commit; this type provides the
correct set of operations for a file_operations->mmap hook.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index fa9ecc42602a477328a25b5d357db90b59dc72ae..9d9771247c3865761c4387467de3f1d1a82691b7 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -14,6 +14,7 @@
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
     fs::File,
+    mm::virt::VmaNew,
     prelude::*,
     seq_file::SeqFile,
     str::CStr,
@@ -119,6 +120,22 @@ fn release(device: Self::Ptr, _file: &File) {
         drop(device);
     }
 
+    /// Handle for mmap.
+    ///
+    /// This function is invoked when a user space process invokes the `mmap` system call on
+    /// `file`. The function is a callback that is part of the VMA initializer. The kernel will do
+    /// initial setup of the VMA before calling this function. The function can then interact with
+    /// the VMA initialization by calling methods of `vma`. If the function does not return an
+    /// error, the kernel will complete initialization of the VMA according to the properties of
+    /// `vma`.
+    fn mmap(
+        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _vma: &VmaNew,
+    ) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Handler for ioctls.
     ///
     /// The `cmd` argument is usually manipulated using the utilties in [`kernel::ioctl`].
@@ -223,6 +240,33 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         0
     }
 
+    /// # Safety
+    ///
+    /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
+    /// `vma` must be a vma that is currently being mmap'ed with this file.
+    unsafe extern "C" fn mmap(
+        file: *mut bindings::file,
+        vma: *mut bindings::vm_area_struct,
+    ) -> c_int {
+        // SAFETY: The mmap call of a file can access the private data.
+        let private = unsafe { (*file).private_data };
+        // SAFETY: This is a Rust Miscdevice, so we call `into_foreign` in `open` and
+        // `from_foreign` in `release`, and `fops_mmap` is guaranteed to be called between those
+        // two operations.
+        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        // SAFETY: The caller provides a vma that is undergoing initial VMA setup.
+        let area = unsafe { VmaNew::from_raw(vma) };
+        // SAFETY:
+        // * The file is valid for the duration of this call.
+        // * There is no active fdget_pos region on the file on this thread.
+        let file = unsafe { File::from_raw_file(file) };
+
+        match T::mmap(device, file, area) {
+            Ok(()) => 0,
+            Err(err) => err.to_errno(),
+        }
+    }
+
     /// # Safety
     ///
     /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
@@ -291,6 +335,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
     const VTABLE: bindings::file_operations = bindings::file_operations {
         open: Some(Self::open),
         release: Some(Self::release),
+        mmap: if T::HAS_MMAP { Some(Self::mmap) } else { None },
         unlocked_ioctl: if T::HAS_IOCTL {
             Some(Self::ioctl)
         } else {

-- 
2.49.0.504.g3bcea36a83-goog

