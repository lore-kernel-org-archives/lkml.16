Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2800C204C0C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584931; cv=none; b=bK+m4zlVdUQxzyW3fmiQO/WyXQO1L/drGrrH8uWDn+klYLDKf7AqVGKkYO930creFkLGqwvopt/SbHzEHUGTRbwpjKXAxXER3P68pJb+tXvq/S3OffLFvYMEr6ay4MW03vnWD+ey4B8wMRNhHgUmDqdr4rR9MgBQ5WTFdrH//8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584931; c=relaxed/simple;
	bh=lOxibc3nuZLQi8BiPbjAzGGX8r7u+1l6+AedXlWTNQY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=loJGd1ltnhgGTmQyEOIHX/2yNuzR1xvPcYhH6bGe0ZI8BlFoHQDdkyAKa0MhpG1Ctyldb9Qa/1IDlwZ3CPZt3BJ7rQhEFka6Jgxm6RD7SnKbxV+xquENT0CWUoJsulWhgU0DOaLMlTIXDls3dKo5OUcH2xMgcbK9VARQGIsRuaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U32EsQZ8; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U32EsQZ8"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43626224274so22353565e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738584927; x=1739189727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L5YAFJcoe9aWjiMWck/T3XsvxbQLU+eGKUV8qsjc/6o=;
        b=U32EsQZ8DM9DkrD1obqlLmfSI6gR2K1406+GmI8XfOwZtdM01fkEpGvMFEwtusdk2/
         9PISjVNhAAkosSU6CQlxLM3S4cGWrUTkKU5HZ5nauauoXjS+GqVSz4YeNOKV3VT/whMO
         m42uqLfX38uLJH9dVX2Nnbj3b/MIsVm64Py6tD8MF0VNRTaA+rbS6vczma3E6OjNF4q9
         65JDDRA4/YZ5FeXzgxySnW1tPjvaAeQVvnltz7FXpCQ5AJWjlw6PA80i9JvotVeROxdq
         F/aSRUYheX7bCdAIvSMWs0NITPVnF5nF7xaT6cAX3VB6fSrddDTUL6bWGIhXJovhZpAG
         Z5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584927; x=1739189727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5YAFJcoe9aWjiMWck/T3XsvxbQLU+eGKUV8qsjc/6o=;
        b=Bp56/diOolsHW270OkuLIUGbwIsMGSpBftHqR5oM3xnljJgZ4w6NDEc+wN9tz8aani
         FTWLv1KkdWDe++jnTkQTiJ5tR/NfPiNFUVD5tpIAjEMbKTPTaxAPVSEpDvKyUfeV2kRD
         5uMJDgCMywGWnl+mqzI7i3qApR1AemGsCxTbq4Na6IRSYF7dW6yaoQo7medvrzMFZcka
         sWy0oFmt9CtddLawXiazdnqdydEBYxUzuV1yG500vn6bZhBUzG2ODl3SXqJG88NreeKy
         CcwzysWwb48UAlkLm3fb7OaA7Qgtt3CkGs+dWatap4mkjVVu+Z1+/SCbYkwt+VkQR5PP
         7AEA==
X-Forwarded-Encrypted: i=1; AJvYcCWoa+u88p0OzIcaeOUc+wzHzZmFm44WUyhFkOJWV6bBaNEq4Gbc7h/Pjthc/dTmxK56kgOzDt7S+ygxq28=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOFQ5cWdiyq0xEOJgfYxSh5/Bpt/xzjXUUgpsgOC+a1rVIG1wF
	323TrvIZaLk845+7FhYvpJu1ifSlER1eh/2qu/W0dD/ibZEiuOFu9s0BDAHWagZm/vNUYdVUic5
	e9BRMddx112RV7w==
X-Google-Smtp-Source: AGHT+IGRpqHAm8e8m8G19+Ggf+AlSBBiph12yce/Z46WS7aebCTZGTPSeXVYEmtSCMFpqP+rea7lVywnd8EwYTc=
X-Received: from wmdd16.prod.google.com ([2002:a05:600c:a210:b0:434:f9da:44af])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1913:b0:434:ff9d:a3a1 with SMTP id 5b1f17b1804b1-438dc42f5ddmr193300145e9.2.1738584927497;
 Mon, 03 Feb 2025 04:15:27 -0800 (PST)
Date: Mon, 03 Feb 2025 12:14:42 +0000
In-Reply-To: <20250203-vma-v13-0-2b998268a396@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3871; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=lOxibc3nuZLQi8BiPbjAzGGX8r7u+1l6+AedXlWTNQY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnoLNNqHQ7JzZkQoXiERXxGW2E5JDKpE49JYLMB
 Rby6/PrLUOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6CzTQAKCRAEWL7uWMY5
 RjLXD/95wijzWi48bnFkANglJrcsl0MrU+pyM7kJiSBNfVa3+Ct2A/y+4U1IlJACvWcFHqWajuC
 mL++v1+KfsbIKUcEfClZDikejXKtig8h2WFaYIQm/E6CYWyJ5grXcti+YF1/e/Ymydu2ZZ5bLZl
 KVNGyd0+Lp5tdcZ9T701aTiUnvu8O40oFHccZOQBH3oGo7eX7cGxvJtZKW4JUFLCKxWyfT7nbWG
 oFekPegNJE14QqSjpE3xPaHt/yip9D/Pj/IRd3hO9/C48NCSOJiSDMIExCktPYcoa8tK9iw3wW9
 bjaTKYOY43WY6/QDxf9VhyMgCN+vL5VdIDWhlgbzUHPL5/XbQm/QjbtiNTSEPbcHLXBMOWTxMFt
 MX8mvoeWXJfUzM75hnM7+fVstYgWUNHecMpyfJytxrsBHvEoFaMxzf7WUPrsdtB9drPHSWXYveX
 aSYxWcLTDVwFHzjjFlWfmh+f40y92zSVPrSfosNfkqUSboZes0qIppDnhDEz0W17izMWFHv2Gxa
 F68fFyj86L6y+A9PxCnGfnge/0TFRWo1URk3iliqqMQn8PJPJaN2UeU+vAi6tfi9Nf5V+tvKBA6
 uMul2VWCKKdy+/rCiIL4dXSTCpU3IQUl3ISSgKnZ9XRlFG1SqxF+m4iqFi+1PHBL9S9S0TbZUjx QyWDwCPrjbpztOg==
X-Mailer: b4 0.13.0
Message-ID: <20250203-vma-v13-7-2b998268a396@google.com>
Subject: [PATCH v13 7/8] rust: miscdevice: add mmap support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
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
the `VmAreaNew` type from the previous commit; this type provides the
correct set of operations for a file_operations->mmap hook.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index e14433b2ab9d..97b2384f0816 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -14,6 +14,7 @@
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
     fs::File,
+    mm::virt::VmAreaNew,
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
+        _vma: &VmAreaNew,
+    ) -> Result {
+        kernel::build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Handler for ioctls.
     ///
     /// The `cmd` argument is usually manipulated using the utilties in [`kernel::ioctl`].
@@ -176,6 +193,7 @@ impl<T: MiscDevice> VtableHelper<T> {
         const VTABLE: bindings::file_operations = bindings::file_operations {
             open: Some(fops_open::<T>),
             release: Some(fops_release::<T>),
+            mmap: maybe_fn(T::HAS_MMAP, fops_mmap::<T>),
             unlocked_ioctl: maybe_fn(T::HAS_IOCTL, fops_ioctl::<T>),
             #[cfg(CONFIG_COMPAT)]
             compat_ioctl: if T::HAS_COMPAT_IOCTL {
@@ -257,6 +275,32 @@ impl<T: MiscDevice> VtableHelper<T> {
     0
 }
 
+/// # Safety
+///
+/// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
+/// `vma` must be a vma that is currently being mmap'ed with this file.
+unsafe extern "C" fn fops_mmap<T: MiscDevice>(
+    file: *mut bindings::file,
+    vma: *mut bindings::vm_area_struct,
+) -> c_int {
+    // SAFETY: The mmap call of a file can access the private data.
+    let private = unsafe { (*file).private_data };
+    // SAFETY: This is a Rust Miscdevice, so we call `into_foreign` in `open` and `from_foreign` in
+    // `release`, and `fops_mmap` is guaranteed to be called between those two operations.
+    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+    // SAFETY: The caller provides a vma that is undergoing initial VMA setup.
+    let area = unsafe { VmAreaNew::from_raw(vma) };
+    // SAFETY:
+    // * The file is valid for the duration of this call.
+    // * There is no active fdget_pos region on the file on this thread.
+    let file = unsafe { File::from_raw_file(file) };
+
+    match T::mmap(device, file, area) {
+        Ok(()) => 0,
+        Err(err) => err.to_errno(),
+    }
+}
+
 /// # Safety
 ///
 /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.

-- 
2.48.1.362.g079036d154-goog

