Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8CB292B3E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077733; cv=none; b=DgbVrWiYfsvbw9buFDCIpUeBFXQxda6+9hf3Z3g+5Ou6YpxKLWF/62l16GqTI9t1cosGWc+/TN3qtwmQljT+XrBLESz5kUla0xVISHEP+HH7Nx7zNDgPkyxcIbsiL+ry6Hd/NgWOwWI9FbT5vyL0Y3EXn45HDFKvoobX99xL4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077733; c=relaxed/simple;
	bh=Y22ZxTR2DcKyT7kx2NYZr8N8bEg7nYMhhgJibMcqX0g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e5ztrNmd6BW2p2LRET97lx0qfSKgZJvVerMi8rQ8lPzpUOBKNwDauTqMQkwbE7dB9nA90CYgsCdcRixVQAgoCpqluenboGudTR0f1Fg6ycLmXhGbvDhPwoCy3auNjwE0RnEtuHRCBHlTzSxl+djUdRv8RBF94OgZzggL8Q6HZKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LHGtTA7n; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LHGtTA7n"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so1969290f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750077729; x=1750682529; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CuCPHidyaJNjh33RmhUzqGRp6ORq7xZF7q/o9iPn7Ss=;
        b=LHGtTA7n926K/gWUxflXxgrXAr4zU/wzdk02roKJBO8tDXZycQZcAqOATrVwhM+MIJ
         jLaptEw4iGyK5s76FpbHdNZylYPkwzcOVuoKsYilzbp/VMMrriVhScSiDs00JYDjlCMV
         LPnF2vRkPWxVz3QSBORIuvEEHgS5Q1LQusuh22dL1aSATPB7yfCRy5g3yeyZ4JYBb9Ix
         gx9BUQIwPm2LaFr9L7bxOKHd8nWk4LvbIVTnSlb9C0UDZNvogtrdeMDy/49GwGraxiNb
         pBICJQ60LfLVvsX9l/Y4XkSlw7gIYBH+IAdqlf9Gn47uu6Ye1H635OF5Vfc95jFg77rX
         f2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750077729; x=1750682529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CuCPHidyaJNjh33RmhUzqGRp6ORq7xZF7q/o9iPn7Ss=;
        b=Jrz9W/xVV3bGJ86ojm0h+DP7aC+I5uDea4Pp7CEa2f2yDx36ZUfpAvqNEFo81eHyoe
         RdOQ+HavUyVqcMqtXJ1i0e+aRhql9fDwfHLzycxlW5yBPqGmN21eM92LMpGdb6DJmHEU
         JOobpehXVDloBT2sJ/bNqjj5zpAJTdDlQlhIA3LvcxSEVK+e6BbQyIlg0p6JwEE3qdyx
         8wcancma7DIP+TYPwsUr8ykViuo5FOPlPoVhZq5HtoWhqYYju5DCYeX14pB79kVfwrJT
         kVfCl9NV7N3suw39cgHMuqT+JlNvWw6zJ7uIF3pzx/IRkR6vIvLIPo0UV/by8dSir4P5
         jyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOA1Sj1nS7YyBn3Iuf2zCSAbMNOdVA4Gzfx2YtTqVMvdCkJCz7fMxr3hKwg0c1Z/+HP4icjoOhEIL275A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVaGn+K3uv20zPEjkfOJ+Xwhl2IracJESKP+qBPSX8dZI04pRl
	gihOKNlvDmcquQYBjxR6pj1N4BTZCWtqqsGh+o44PPS9X4GCK4L8Mws5cBvC1ArX9nHp87KRjZn
	cNJ6491Khuob5LopZwA==
X-Google-Smtp-Source: AGHT+IEos9wyOljUVIq90oH/1Empt3J27Zrm4ASfnekdBgunNGd+0fbNM/dRPiUIggHpq4BXdQu5iWPUfUkkAZo=
X-Received: from wmbet8.prod.google.com ([2002:a05:600c:8188:b0:453:f66:5f37])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:718:b0:3a5:3b63:58f0 with SMTP id ffacd0b85a97d-3a57237178dmr6945893f8f.18.1750077729505;
 Mon, 16 Jun 2025 05:42:09 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:41:48 +0000
In-Reply-To: <20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4668; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Y22ZxTR2DcKyT7kx2NYZr8N8bEg7nYMhhgJibMcqX0g=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoUBEaT5eIFMl7DUCzdjz0g9XIj9E+jo8Q9i1mT
 2jQH/b4/1+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFARGgAKCRAEWL7uWMY5
 Run8D/9uR2TkeeCSeYbhMCB9fnbQeEsT3DeNMpVZDAtJSqXmkusSPB+9E9qlBSNt2z604bOQ2d6
 48wxi0hTUluSRGs9EvZPjIiWfjPOhGbUk/5Qc0LtNFBK/BfJ5L6DLsO4uCQK1fymL5rsNbLsNCv
 f2CWyKlX7IMJxE0SpDAKxH5XgBvgc2isNOZfqmI4zI1A6Dn56uUcDNqXmtyzbDys82MFrsEp1Bq
 C1OXgES8mm8kXQrScgmKfkQzRJwHDoFgesbx1Noc0N1NRQqnv2V3ppYjx2r/vAntVy6nqDbvXvh
 mubfwSFHQ0OiHxCs4SSfDURnjRPQ8iaZOwndZxNQcQf2a8Zvdu4o6CTKIud7WHIcIepCTD/HxOl
 7N6EAXyssV0I7JvSxsndjQIzuTUhdcUHPt5Eaqqr1vR3zVACt21DALVD2QurJifeMHk/YgWkh4O
 uHLDau5USjWyVIOIxQPWjXqrnIFFuhRVrL9vrnrtNBOB4lXU6ZAH5ZBpW7nAolmHuk4ZyQXKSzR
 noMO7FmCgfp3x8K87IfkFeES6tLdryyIQUOcAkxIYkFBjtRXYfELrRD/CXLVYEM5Jl+uO41dUQz
 AolPq1W4Jx4obxS3j11PSmQfAyhV+GXTwOTqzW5kUyPiq09AWpvnLm5nI4cIYL0Lt3cLW/C/rhK LSucTuUoKNStijw==
X-Mailer: b4 0.14.2
Message-ID: <20250616-strncpy-from-user-v5-2-2d3fb0e1f5af@google.com>
Subject: [PATCH v5 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patch adds a more convenient method for reading C strings from
userspace. Logic is added to NUL-terminate the buffer when necessary so
that a &CStr can be returned.

Note that we treat attempts to read past `self.length` as a fault, so
this returns EFAULT if that limit is exceeded before `buf.len()` is
reached.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 635a03e0989f3fe99be80987aa47763782de1d3f..106aa05ea1b88868fe48f64ca9c86b20ad7db68e 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -291,6 +291,65 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
         unsafe { buf.inc_len(len) };
         Ok(())
     }
+
+    /// Read a NUL-terminated string from userspace and return it.
+    ///
+    /// The string is read into `buf` and a NUL-terminator is added if the end of `buf` is reached.
+    /// Since there must be space to add a NUL-terminator, the buffer must not be empty. The
+    /// returned `&CStr` points into `buf`.
+    ///
+    /// Fails with [`EFAULT`] if the read happens on a bad address (some data may have been
+    /// copied).
+    #[doc(alias = "strncpy_from_user")]
+    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
+        if buf.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: The types are compatible and `strncpy_from_user` doesn't write uninitialized
+        // bytes to `buf`.
+        let mut dst = unsafe { &mut *(buf as *mut [u8] as *mut [MaybeUninit<u8>]) };
+
+        // We never read more than `self.length` bytes.
+        if dst.len() > self.length {
+            dst = &mut dst[..self.length];
+        }
+
+        let mut len = raw_strncpy_from_user(dst, self.ptr)?;
+        if len < dst.len() {
+            // Add one to include the NUL-terminator.
+            len += 1;
+        } else if len < buf.len() {
+            // This implies that `len == dst.len() < buf.len()`.
+            //
+            // This means that we could not fill the entire buffer, but we had to stop reading
+            // because we hit the `self.length` limit of this `UserSliceReader`. Since we did not
+            // fill the buffer, we treat this case as if we tried to read past the `self.length`
+            // limit and received a page fault, which is consistent with other `UserSliceReader`
+            // methods that also return page faults when you exceed `self.length`.
+            return Err(EFAULT);
+        } else {
+            // This implies that `len == buf.len()`.
+            //
+            // This means that we filled the buffer exactly. In this case, we add a NUL-terminator
+            // and return it. Unlike the `len < dst.len()` branch, don't modify `len` because it
+            // already represents the length including the NUL-terminator.
+            //
+            // SAFETY: Due to the check at the beginning, the buffer is not empty.
+            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
+        }
+
+        // This method consumes `self`, so it can only be called once, thus we do not need to
+        // update `self.length`. This sidesteps concerns such as whether `self.length` should be
+        // incremented by `len` or `len-1` in the `len == buf.len()` case.
+
+        // SAFETY: There are two cases:
+        // * If we hit the `len < dst.len()` case, then `raw_strncpy_from_user` guarantees that
+        //   this slice contains exactly one NUL byte at the end of the string.
+        // * Otherwise, `raw_strncpy_from_user` guarantees that the string contained no NUL bytes,
+        //   and we have since added a NUL byte at the end.
+        Ok(unsafe { CStr::from_bytes_with_nul_unchecked(&buf[..len]) })
+    }
 }
 
 /// A writer for [`UserSlice`].
@@ -380,7 +439,6 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
 /// When this function returns `Ok(len)`, it is guaranteed that the first `len` bytes of `dst` are
 /// initialized and non-zero. Furthermore, if `len < dst.len()`, then `dst[len]` is a NUL byte.
 #[inline]
-#[expect(dead_code)]
 fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {
     // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
     let len = dst.len() as isize;

-- 
2.50.0.rc2.692.g299adb8693-goog

