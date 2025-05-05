Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403B253F23
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447469; cv=none; b=Hd4TE/GdBREBITqMDo6iuJRU5Z/JGaSX0qlWiqUUemRjTWvBByADgdLj0ztZlnhb4fjKFTVJE9VmwnjVbR/rXo8QAWWEpnFJb9uY2dVZsJZRwWwGZ8LP4rj8IXdGZzGaZYeOhdjDUhG1lJjoJWrmwSVVEiqaHYUu/00+acm8R+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447469; c=relaxed/simple;
	bh=8u/2C1HjCG7Oo6U0j0F+topZF+8Fd+oSzLpsbfJQZO0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SupXikCAKVUetWtBdBr0k4HLZcqMJpNoUsdQVclt4DHhdZC1j2jyy9wPFmlZpEkm9z7gybyL9f8MKYW9ydk62qZ5D4LgN3bAEkmX9yxeG1vGtURV/gAcVyrSztBsNhQ5xLhYHIG1uviROURHLK3YsGjjR+9g8JlH7hHQmpORFVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GQwo4koI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GQwo4koI"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so31459175e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746447466; x=1747052266; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7fVelJcRG2V/ngzKa3XTWCRHf2jEKMazBViPO8hcSl0=;
        b=GQwo4koIkNAYI5IEgZPHXyi3dToO4CgvOfXMByjRmXlTA70TppchkLSuMIlhwfeZDS
         U4GcZKnKSRb9TcTzEbIwivzNOhYm/QEXKklqvM8XPveahCd9AggFSMZ8TT1bYS/7kaFr
         cKZ+uL/nXjU6zp9EThzh2r/1kHVxCt2MT6btjUvVBZAtwd/dzXIqNJJaMPIjyAnmdp/5
         HELTZfmHamRJPOodxfTIN7g/0OY2NhmkKrzOd4zu+OTgbgZDB3yEOhAG80VGSNPlpR66
         KASRODhaXalLWHm6Pf1ljgnYj5FCf6FbSW9Pabc6RPB5pRq75ZoPpAt2K3nrmtN9OxJX
         vikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447466; x=1747052266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fVelJcRG2V/ngzKa3XTWCRHf2jEKMazBViPO8hcSl0=;
        b=ZevRB5t4u/yDhRLoOthuPWgcchqnoE/nWsaZw9xuw3z3egxNg/YUdjBr+SnRZ8YxUM
         q6LperDscX5CQpeWhQpspMmUrjQ3CL/KGULjK5rwiMBNLEdSrwpB9qX9WRUqsP021ndO
         MkJMd5jOmNKmc5zY57hCF+8iasHPXUuiVI2fkUM87wMteytYbqPxe7HzMIc5r2nKoCoM
         Tnm2eutlbWjl4yC+HcFRs5OJ7fbLSG0iNasqhZexZSbRK3Q+zk2Y21VT+TEz0emW+x/W
         nwo2wHfJGcghvAstiAtwPStg0fgEcf0BhIU1KQD1f/iiO1Mxj3XZSzdQHRoAqHXJCtcg
         d0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+16MOty1jAcgUq2qgA0E7uqKFQcItqRvMbv17m9M9kWV3rSVI2AOg4YNTpbqg1Jyz7DZS6+oyNjfEI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHMRFKEMHdJk89/jpAdO4sXBbMFdoa++VUNkLtXs1a6ZsZSG4L
	dQwwJxcIZ8rmf1UxYgiMbwvcKZAmegV5PK4Q1C0VKGdw7i++Noht5/H3EMN3QjbmboytpGF1Y1F
	5J066VoDsgWmgIw==
X-Google-Smtp-Source: AGHT+IGkvf05eY5B/6AaWdydV0XrkJVTEQQFjoaEGwZ6A/Xamp8EAUBgQbx3YAm3ZvJ8xf7GFwZL7TXQHi43U04=
X-Received: from wmbji5.prod.google.com ([2002:a05:600c:a345:b0:440:595d:fba9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e88:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-441c48bdfe5mr60583825e9.10.1746447465827;
 Mon, 05 May 2025 05:17:45 -0700 (PDT)
Date: Mon, 05 May 2025 12:17:31 +0000
In-Reply-To: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=8u/2C1HjCG7Oo6U0j0F+topZF+8Fd+oSzLpsbfJQZO0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoGKxlFgZEs3Oh+QBj4OXOMyTEaavUaL+fS+to3
 MfE0g0Bs1WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBisZQAKCRAEWL7uWMY5
 RtTyEACdu6fQS60hMvPeUzEyFGVNQmJPug3scwpiOn+SxBRJ2zB8bTrLxZ2Y3OAIlf0j123nHJr
 KMT3/LYn5zH73ckH6NLT0jLQ9eU3cgQuUA0p3gkRh+Uvp2X2dywWyrWu5RdEqEfJRvTN/gRr3HR
 G835GMqGJ5ANPqx1DKVSdoawQZ626vbI+PKeILtKprF5/2ZAkKpX5+xCDIq3IsiWW89Sq8xWtbH
 Z3cqr9M+AWHidqRs+sPAqmsy40RwjPatK7tSyhu4hM1FlWEMQZ3ogFYNWyZVvI0dQnBocmuIzsY
 vTabftRpKGVJrOXALoSejEUf3LRlaLVGSGJpydNJbnHKtdMXK1JFmhPOzG7KgBw1ag2HNdwRlq7
 ri+gsTt2mmODzfFklmcTWWfuVPzdK/nBViT1H+GYk4RDysrELnORXIaAutueyWK3PEso39Emgil
 TmlnDYWuYGq2fbBwFawOP3cql/59UerkFNtv49Q9EgLsU5RfzxMmE3qlwkS3mqK1cjhFo5soVid
 R3PmWBNy4P/naPTTUHDHm+jmve773OgAQcLIRpRYS+FBpnMADhfYBCUKKcvQLgLWiTPh7euOMUk
 02QI/UyjhuQSGJRz5VHma7v3L6hHJlksHMRXTjRGYnFOjcD20JqLBlSOFptJRynFsbxGtiJTbnZ pbXr6bR7GSZ+chg==
X-Mailer: b4 0.14.2
Message-ID: <20250505-strncpy-from-user-v3-1-85c677fd4f91@google.com>
Subject: [PATCH v3 1/2] uaccess: rust: add strncpy_from_user
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
index 80a9782b1c6e98ed6eae308ade8551afa7adc188..a7b123915e9aa2329f376d67cad93e2fc17ae017 100644
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
+/// Reads a nul-terminated string into `buf` and returns the length.
+///
+/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
+/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
+/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
+/// *not* guaranteed to be NUL-terminated when `Ok(buf.len())` is returned.
+///
+/// # Guarantees
+///
+/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
+/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
+/// Unsafe code may rely on these guarantees.
+#[inline]
+#[expect(dead_code)]
+fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
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
2.49.0.967.g6a0df3ecc3-goog

