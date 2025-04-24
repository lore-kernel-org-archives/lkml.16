Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF0B14F9EB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507911; cv=none; b=XegQqyDqBAyh/k6AvW76JWMMnP2nprCMyWIyLrJdBtmC0cj9vH9y9bQMnZ4ciE0UaPRYvJje7iCmkSosfcgXOvZ8f1qH6Lf2l/d62VliKPTAfyKCPkQhsRa8LKdNza/+Wju6OXGJvTBVjQYm57oiGrUgYA4HSc4588ti3kxBfhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507911; c=relaxed/simple;
	bh=9BNIxnc9r804rmE7+FXrComHgep37vSfqHSO0rVjenE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EwoTDIIY1O3tOTv8dQjd+zYSQoPjKwo4PA+D32p216Wd/yrqXg835cAsB305d6xtJg4gdFrLj8aBAYVqRGesrwTz9xZO2nD3Hye5d0ZIJiqkt4WIvIdPT7u44qKK8lpCND8lPJ4KItSL+t6abjeOAhMKqefFOyD3wHlS/ETwaPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0W0/oTRz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0W0/oTRz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so8185665e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745507908; x=1746112708; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cfA5KJ+Q12EFPpKOtsI5SxxVVjHn+/t0FQnzxOZ5ksc=;
        b=0W0/oTRzQVbau4AbZlDZ19TifVo7XetwHL5h3BmpiFoB0q14/X3NwKklSPMGjQ4zib
         7F2B5PDVU8epHDOrTRZMjYMySzw/6lC6ohqEwWb/3A7AwnRnCL3UUMUB/oA54QLAA1uJ
         Ym9Vc6tzYdwaoyb/2OVr/UAmgIeqPUWP1pndEZ5feFsxq6F+jgllB3CAP+t3biyp/F/k
         xIatNNZEQY9OMf+cGi0e9+vmn06RGs4kf0RLXCFETewtzth90o+VsLpy7npdCbszZaQN
         GRpC8ZR5zUc4ygZdg5Qc1ZhqWqdE80b6mps+45QWDkXCFRnIdcE8jDfZnM6246LjrSSs
         shtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745507908; x=1746112708;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfA5KJ+Q12EFPpKOtsI5SxxVVjHn+/t0FQnzxOZ5ksc=;
        b=bh7WlxNPW3xUPVvWASkMo7qi9mDubEI7H1kM0tWyw9HGcG0tbx8+Bac6ueOFJwOPBx
         PElLhKYlmnRlRZna06LjJJISpKI3Y0uE2KfaxSEwWSQtKEfzeKSQ1beLOSjBjV2E352i
         Og4QW2ZYXDleSmq9yaQ9RWavSHYJY5pypKRiluuomXjgghq8Aj9bU/Nzj+NCfiAdSPTx
         XdIcERVZJqTL4Q92pxsMUnCwOAlM88JFmHcG6J2G5eJzigeDZ1POAdD26j/8yXYSy5Fw
         YjvpSnk47t04oCg+Bt5jwmrErtVILBVp3XyHxYKfKRaDgJg9JxBzO3S6BDet/9Gs4lTO
         +Zig==
X-Forwarded-Encrypted: i=1; AJvYcCV/qDVloECRcWKwQRYZpOIZOLzXiO27g83Gq2qok5LvO68MyHBhFaZs6wpYJ0II9VZWuWESqtvGAU/K/w0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4KAAA68JyymjCyB9gyUfv/3QW4mYVj7db7wO/0hfTtOAwYwjw
	VhLBiAK3I8jtFX9uj9RtNJ2sfPFIADs9Hy/iYDeAd80rfEUwJSvGrESFEX94Ki8oA+5Npqxy1Ky
	iOeYvtrE047ikZQ==
X-Google-Smtp-Source: AGHT+IFYlRdWdDBWEytA3wAsf7mafXhWXPvUDFxyzQdqN7Sx421ZAojDUsD1snyQx+fuZBzGtNoo+knrTEpnQPE=
X-Received: from wmsp1.prod.google.com ([2002:a05:600c:1d81:b0:43c:f5f7:f76a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3482:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4409bd23196mr37607955e9.13.1745507907748;
 Thu, 24 Apr 2025 08:18:27 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:17:48 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABtWCmgC/x3MMQ6AIAxA0auYzjZBog5exTgoFO0gkKJGY7i7x
 PEP77+QSJgSDNULQhcnDr5EU1dgttmvhGxLg1a6U61uMR3iTXzQSdjxLBobp63qF2WsJSguCjm +/+c45fwBd4u50WMAAAA=
X-Change-Id: 20250424-strncpy-from-user-1f2d06b0cdde
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2100; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9BNIxnc9r804rmE7+FXrComHgep37vSfqHSO0rVjenE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoClY8RSQvWwEQndvmFwi89glgqILwEhoVJ15aK
 lPvvfLhCO+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaApWPAAKCRAEWL7uWMY5
 Rp8CD/9tbXhInLSabFWUztQR3lTNjgICrtdrNs8ftT/5o1QwiqRAXwe+2l6q+rZ+MdGyBIErAF0
 zoYJ4F+KhawbAH5je3edyYmeyMRtiKGuhTA6Sb8F3BLWGtKd/7VIa1yA0fN3jnHCnJ3v9/9AMn4
 0glbkXdhjSrmkFlzuLU7WpmioBBrQ4kqNsKH0ChZNjpbOyQsMDFP7ddc9946nics9IOVQQJKW6y
 +9WyHYv3bQsb3Y7qP8VHsbh7UATHKmmnmugN5CvN8nygEXFBxsvOj2C/HW4BzqVOwKlyfDzh+Ox
 Rq5wzXNx4Wq9rDb4K7rAFH/+6+nSXDmdkk8vDnU2sc//hhvPMBWAjVLVX/n65FfB8RHiE27ftoR
 fY7DNC5FwUAd4pA/rJNYLjwUdBxbQ3HBtB62r1kBcXCsOv+dDga5G99P1ydDjwPrJ6bn5Xxw45L
 Jbwn1i8zX+nVbT/TI0kc/skSqiAikiN/QnaltMqHktjePIoIZdy7XpiBeRZv5Rt+OMTj0aWX6Aj
 vGzaTYDf6VGrwwrSnKF9PFnYyP94TfTNFpa9GXrEG0kli0kaKrNg+zvBnu73Wt/puU1pQ/8CB9G
 umW+ioYL8CfXPyX2xGv7pZ4rc6R90LBVhRccZbYOc6FVCXuz2kF/Ci/OQRfiZIs2o2Q8xa3l0bF 6kWUsHPzoa7/X9Q==
X-Mailer: b4 0.14.2
Message-ID: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
Subject: [PATCH] uaccess: rust: add strncpy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is needed for ioctls that operate on a user-provided string.

It is somewhat unfortunate that strncpy_from_user does not nul-terminate
the string when the end of `buf` is reached. This implies that we can't
return a &CStr from the function, since the buffer may not always be
nul-terminated.

That said, we could add more convenient helpers on top that add a NUL
byte in that case.

This method isn't defined on UserSliceReader because it complicates the
semantics. The UserSliceReader type also has its own maximum length, so
we would have to limit the read by that length too.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 80a9782b1c6e98ed6eae308ade8551afa7adc188..1bd82045e81ea887008e30241bd6de27f096b639 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -369,3 +369,30 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         Ok(())
     }
 }
+
+/// Reads a nul-terminated string into `buf` and returns the length.
+///
+/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
+/// then the buffer will not be nul-terminated.
+#[inline]
+pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {
+    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
+    let len = buf.len() as isize;
+
+    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
+    let res = unsafe {
+        bindings::strncpy_from_user(
+            buf.as_mut_ptr(),
+            ptr as *const u8,
+            len,
+        )
+    };
+
+    if res < 0 {
+        Err(Error::from_errno(res as i32))
+    } else {
+        #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
+        assert!(res <= len);
+        Ok(res as usize)
+    }
+}

---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250424-strncpy-from-user-1f2d06b0cdde

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

