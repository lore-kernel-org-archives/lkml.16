Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C4729DB86
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917383; cv=none; b=puesmVX12ZhNXbzBngTyQyQsKiR0np/55IVq1FqxqFUC5REle2xv6Vv9JbPRbY4gUWW/esq291A32Oj0x/pi99JyFVydQmkFpNv7mhl2N2MdN9TVpLAxd5K7k+vg+g2kvjvoSqlc7Vz37sG0kWCJT+q4P2cuUP6Uj/pzQwe1uYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917383; c=relaxed/simple;
	bh=dyDefe82hIBiNbyWx3qTCr9+uQypdm3oJ5qQzsDuAU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lpkSF21Ji8HnbmJW5uZsxv3VtsYYMAncCL+00w3CfuuF6eVaYD/dMtOzJCERuhH2rpzZwgIBdAUH2cu78JfQYGCbj9P2KU+bFAyXZ4yj0ZujoQhMe19K7NIGYWSHShtgWOcO4xPbf8I+t8ILPmUr86hUgPaNj+2EA52R9tTCew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yo3Q2CYM; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yo3Q2CYM"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so30860035e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745917378; x=1746522178; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHjZ3Nei53ppvuUDW2u8OKVXVo6iIJEmbG6DHXYQHVU=;
        b=yo3Q2CYMu4J7eNfQrQVq427OQtHf7WnVOni6Ex/mfoCZAUf2pmTzIegBOR767ApUlD
         g0pztHQY14g0raGXkk0jcFoHjch5ZT2FcXE2Qmm3Q7sLt9vvgxi1+foLEJCkSOdJZPin
         92Ban29lHh/oIokzhlJVgtNKMpfvU/CFtEVm5i58+XLLACfSdxFUk07AxwO5iyxg8w7k
         eEiPo8VBZYZAMLrNhSzp0pnhB9Jb6RlVzRVbGHB2gHCv3sQn9xuEuKkeln9inBOzc3Gx
         Sj/tyBdIgKzH8A8gBiBZugWJz6k1en8/cRqbcXlUQfhgV3DlMspR0+BI/uJXThFnKCT/
         rGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917378; x=1746522178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHjZ3Nei53ppvuUDW2u8OKVXVo6iIJEmbG6DHXYQHVU=;
        b=DnV3Vs7GT1cnvxIdUvPGYJ4ByrpULkTOXSskeoTXuQ3xRA/gj78BGGEFhzv6/dHfSf
         XGncZn+8bNnBpNwdKyxY36hoFqDNP+nPkAaxenRALh4jaODl0M5irgjAbT5/A0FLP/4L
         3DXH9zsYOiYiNLYRnAj22CngzKOdjExCaVuuw9OvOms5Tg+b7wKRAOLyTMDIv8ZgpxD6
         w4PgmOT0thR2ofaX6l+8Pwb4lV0kT1Fr6Ag1VSbbtjSDAtxRlwOtjzOcEVws9Fu+6SzO
         fh7IqAsVTqMwdp7DStJcUOfa9R7p6vE2iMnWHGgICr9iFqM3byV6dBmqF9gIOgpTY8QX
         Y1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXrJAVLG0nhU9efe6u2AJFl/qEvupPQY1022QTOuGZxynrVWzuMGA9NA5E8Zc+4Es+nPsPbl0UtxSPVCCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC/VSgu5Y3aZRi5/qSw7wz7WZSLEu/x1J49vFJKEO47qols61h
	s7U/GEp3dQDMnTj0au27hjrM0WepTz9tPrxV5BRpJiRvkq/+lG6T09uHmUqhfbZ6LbCFEP/BBBq
	QsGkINXEXhMz6Dg==
X-Google-Smtp-Source: AGHT+IEkjtpE5gxA6o16lXjwWSJPR7W07Pw5Y0350PxaC15Po3Bojdz9zW3meUNOq/JU0Rh79sbZAA70WS24L8U=
X-Received: from wmkg20.prod.google.com ([2002:a7b:c4d4:0:b0:43c:fd99:1b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f07:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-441ac88dfa2mr21472625e9.25.1745917378670;
 Tue, 29 Apr 2025 02:02:58 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:02:22 +0000
In-Reply-To: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2525; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=dyDefe82hIBiNbyWx3qTCr9+uQypdm3oJ5qQzsDuAU4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEJW9gcmweZUewzLgUOsj7vu7zX56pzg3nly+D
 hcWOO7qkiGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBCVvQAKCRAEWL7uWMY5
 RkqcD/9WQOiOz5ufQpxUtUeOPa4TW0o2JhY1hBZT5j6mD+88vVBxLJ6+R/KosaAyiRAYGKNXAuN
 5Jk/wdXw4ZQB4F4W3JJXMfeCP57OhsjervIhZ+NrVnnTDjwjHahB+H6Lji8KAYn/P7UxeXGDknU
 JG6guq47iDWbpVkZo0N5HpabWWdm+y1uDA4RIeya6xXOlJp0cL7SncK6BFkZgEvnzNk08o5OxLg
 Lpb0smNLJPnIYcTUFhCe8/L4WKx/5IbrDMi0pIjfZfV0WvkgjYyFDNrK6sz3waXZYDSAHUSsSHO
 vyoZECgOk3uemqj+WqWXuwyQ+xCVAxRvlBFAetGtofbC0ERrO2n0IJ0/2lL1Xeqx5Zn4FGqSZjg
 KpIu4iARUO2fNSa1bu7h0KCr1Tp7Icczo9v2xCAnD7GmNyNBwYrPCKUZ+7WqHWjxxNa7ubA5EdQ
 xSpHH35zns5j+j2J9itmnlRVz2LSwffwe4+TGQ5FtJePdbB9iNlRGpTAEFy1fsfPMIFdaAzzZQQ
 1olKPkn/M3gBKLuaWkx6ViKV2deK2yUqj8xC9NKgrAeUkbZ7QLcDH+9OwDP+1g/c6JM9pAVDCuP
 bDH21xLmz4JIeqxqS3Iior2zIyuzt2odcTulncKS3KZHWMeJNMQ4IoAn5GK2iF5Z8qconm0A2g5 zRgrAIs9fPWsbVg==
X-Mailer: b4 0.14.2
Message-ID: <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com>
Subject: [PATCH v2 1/2] uaccess: rust: add strncpy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patch adds a direct wrapper around the C function of the same name.
It's not really intended for direct use by Rust code since
strncpy_from_user has a somewhat unfortunate API where it only
nul-terminates the buffer if there's space for the nul-terminator. This
means that a direct Rust wrapper around it could not return a &CStr
since the buffer may not be a cstring. However, we still add the method
to build more convenient APIs on top of it, which will happen in
subsequent patches.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 80a9782b1c6e98ed6eae308ade8551afa7adc188..acb703f074a30e60d42a222dd26aed80d8bdb76a 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -8,7 +8,7 @@
     alloc::{Allocator, Flags},
     bindings,
     error::Result,
-    ffi::c_void,
+    ffi::{c_char, c_void},
     prelude::*,
     transmute::{AsBytes, FromBytes},
 };
@@ -369,3 +369,35 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         Ok(())
     }
 }
+
+/// Reads a nul-terminated string into `buf` and returns the length.
+///
+/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
+/// read. Fails with [`EFAULT`] if a read happens on a bad address. When the end of the buffer is
+/// encountered, no NUL byte is added, so the string is *not* guaranteed to be NUL-terminated when
+/// `Ok(buf.len())` is returned.
+///
+/// # Guarantees
+///
+/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
+/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
+/// Unsafe code may rely on these guarantees.
+#[inline]
+pub fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
+    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
+    let len = buf.len() as isize;
+
+    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
+    let res = unsafe {
+        bindings::strncpy_from_user(buf.as_mut_ptr().cast::<c_char>(), ptr as *const c_char, len)
+    };
+
+    if res < 0 {
+        return Err(Error::from_errno(res as i32));
+    }
+
+    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
+    assert!(res <= len);
+
+    Ok(res as usize)
+}

-- 
2.49.0.901.g37484f566f-goog

