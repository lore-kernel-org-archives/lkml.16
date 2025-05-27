Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80C5269CF6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748349280; cv=none; b=EjUdz+jjUSQ2wof0/pDB/DcX5caLQXh4NJhThq/oTX9B016x2/HiQdytlij6O1ueAn7hCndkiO3A8JBWb4mGedKEtAkmAFCqvYN9Rk1akr4pKbz/vGQJzfrPR/Uw+jUQ/kEUmAQqnpY/KdkwAyTw1+pNcrxn+CR4VqraaCjpGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748349280; c=relaxed/simple;
	bh=qSzSccNwHm/EbOY1HUt+rDd/6Vn+Dn1mSUc44tIJgVU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uzqFCNBqwk1qqqDHrW6S8j40y4wyBcNF3SxlXvDxKMQHGB2xER26zV1vLKiEFDdk+0wmrXXKSiZ3M62ZtM47A7sWn+QGaFQLNGR1XAYBmI5ZoEIdYBkM0qnZ0Me2wYMZWR+skpu4gf71JcD/erzmhvUSp6kcywMRdn/HV+7uoyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zeZRoO2I; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zeZRoO2I"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-44b1f5b91c1so25338715e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748349277; x=1748954077; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgiTcbnODmN7NBNzZHsAa4v7DHZcix2AOinDeZo93mI=;
        b=zeZRoO2I9rMxuKyR5KIRQOaQBqLUT4EfhMHMvR10hKbBlDcIieTtKBUvzzhWPSrsil
         xmweIShljtmpYkYTNEujqfu+vczQdQHC9iePH7xpRNFK+Zo++R3H4ZDv3gfs8Dhvm9YQ
         yMcx5kgBj96w/aHzalkp5cDuoIpgZWF7NpRwM2N5neSjRp8CYkUlC1bluXt+gNNwfvDg
         9X489+TU/sBWXeF+E/otkvXEdP4fb3DvZehsQjEFE1xaHl1+MrXgvVmZUasq4Cu/CJff
         RrmE44q+e6R6KHQMrLHVobTVg9oAR38ES/5FFRbHJ5dive5cWCfiK2M0izwFswXvHSgu
         fV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748349277; x=1748954077;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgiTcbnODmN7NBNzZHsAa4v7DHZcix2AOinDeZo93mI=;
        b=bDXhg+r4M5IaBVV3YAK1pVP2GpoA8x9F/VJUG929hw5nKGxc6kDI78WLmxCPzvyesT
         EDY3tWSr7tEkGlALqDaaZH5/wA4+Mcinje+/lc+Cs69wg5hgLTN93QvILp92nYcMOGoS
         L6Dl5x9TwqoGKn6Qf95q8V1HsnvzPjhPDAr9IMtc6msNBhA2TzKnxtZ6z+igs9C+NswF
         ZZ5b628ivvaQ2mn2DCD/m+BPOWPKSsjfvDCR/s5PYRRRu5+vZly5pf1dqw1FQrHPM6eT
         JjljzeohrWgCybE/h4YyYZEwR9uXcMBrUZZJDfAREj1FZzDEA+xuGQpbi1cLYiqo5vBh
         1FOg==
X-Forwarded-Encrypted: i=1; AJvYcCUqWJXM14YA9gXCBOw9QF5lB8gTnIk+ndajY6YQLusEHJUBWT7v3nVlGOZi1WmHF5rrK5jHBwZL858sFHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp7Nh2+fiLLilUjsSuCbjVGhi6VleukDp+6Hj3+L4d6SMOqaz8
	rPpBriKhkiiFt1UNIg9XmvnDB270QDT7sFs+bVHpCMGNtiHuu9P7KrT3xU4C3mXU/HEdn4feJa3
	33uNKN70+Q995Ezcptw==
X-Google-Smtp-Source: AGHT+IGUdGoc9kWEo4dBuCw+VIQGeYKUwY+zpACgrutqHlc2rqm6n1Ssrc8EZOTz7NSsdxPPD68l3PWXaMzI7jc=
X-Received: from wmbji3.prod.google.com ([2002:a05:600c:a343:b0:44a:bc4e:e9a9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fcd:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-44c91ad6329mr107575295e9.8.1748349277376;
 Tue, 27 May 2025 05:34:37 -0700 (PDT)
Date: Tue, 27 May 2025 12:34:22 +0000
In-Reply-To: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2738; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qSzSccNwHm/EbOY1HUt+rDd/6Vn+Dn1mSUc44tIJgVU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoNbFZAnmeyWKbI8/QBJ6CUOZ2bBb/QB8Bp9NiX
 NP0QcLLmUGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaDWxWQAKCRAEWL7uWMY5
 RlnRD/4tKhcp5FVbA8ub8EK/siY4DNNs29ckv82qj+LAthILy0di7qU/qwPGGmHvIF1B5C5E2aU
 jcaZQXGLTO5zFUM8Z4hzk0CD7r3AVZpIlpNL+R/slhOqUQVs9fDM6Q4ImBtsKujuzFoxDz8kgX6
 rtay0mcK9PRJKGt9aueXEnWS6tjXF7msWCtiIMvUIBKrR6f3EpXzB6PTf+hWICwRdyxqrrktaPx
 54MhAhoZVjRDzIHUkEc1WHfIdOTjF2ZpaOuia3gJQ8CmSpeKlfvtamPmWRUAIjnDOcIK2y0mMXJ
 SN9UF6MyL9Hy5Vbj/WU20riL1S30Oz7B8G5MT1J/5SPSIbOvecIyfxC8LqvH8Mu/dJIJxAS88J8
 c0PXKGuNWlb+JQY70SgYoTV23+cSQTqJ4dwxgpPSMUPYyS+NmTxUna8/E7eK4DPRrcY8qyEVOl8
 zwI8IDnUCttiyuixkM/VfTv4XsyVMhDGxo27OZJFdWRniEHLB3FjS3LIGiDRVOKOvm2OLiGX85U
 X1ku4JxecJsmYHzMVQqwfA87h7awackxG3oi+vUVz3CB9C9uPCXSVvHWo6n9ojIzXot1ntE6ZHK
 MorKGBPxFsK44AzQQ+rhPo8PfIQ4VXV/dqj8swG/XMM7g3MrgIImgFCkcNSE6EkEPe13TNa0cSr 6h01ds1kMQjFxnQ==
X-Mailer: b4 0.14.2
Message-ID: <20250527-strncpy-from-user-v4-1-82168470d472@google.com>
Subject: [PATCH v4 1/2] uaccess: rust: add strncpy_from_user
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

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 80a9782b1c6e98ed6eae308ade8551afa7adc188..9b1e4016fca2c25a44a8417c7e35e0fcf08aa959 100644
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
@@ -369,3 +369,36 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         Ok(())
     }
 }
+
+/// Reads a nul-terminated string into `dst` and returns the length.
+///
+/// This reads from userspace until a NUL byte is encountered, or until `dst.len()` bytes have been
+/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
+/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
+/// *not* guaranteed to be NUL-terminated when `Ok(dst.len())` is returned.
+///
+/// # Guarantees
+///
+/// When this function returns `Ok(len)`, it is guaranteed that the first `len` bytes of `dst` are
+/// initialized and non-zero. Furthermore, if `len < dst.len()`, then `dst[len]` is a NUL byte.
+/// Unsafe code may rely on these guarantees.
+#[inline]
+#[expect(dead_code)]
+fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {
+    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
+    let len = dst.len() as isize;
+
+    // SAFETY: `dst` is valid for writing `dst.len()` bytes.
+    let res = unsafe {
+        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>(), src as *const c_char, len)
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
2.49.0.1151.ga128411c76-goog

