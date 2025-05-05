Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E12550B0
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447471; cv=none; b=p1yvQyP5iZQV4ht7nHi7zdtBfXKTpFcE4L2T85k/ODgvMVL/fRieemx6FDRFqIvnivFpOmw2LTiBEQ4RUpPpkdRNdP4FK3Ihq9xrLmN1dgdpEbFNNo8PbaOPjm9MHh6M/G2G/XwAyLvOtkrWVIwANhRSdPrdavWSxBkWIWzefZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447471; c=relaxed/simple;
	bh=lA7Gkh9jGL4mrigHzmXfNszvqrkSyoDnALirNgDesXs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HPNPUsyZ4ytKNTJJPKjQCjACf9XmmKik1LS1l+yFPn0MJQS8iztRNHKs49ytsWMnS5AaHONr8suzOXyazbdv+fYkz5gJFlfjpqL1GzcGEb8WRIePU5H4HyBDZH+FxlBR5VqzBPMBaAn+QtFqPuwmTcI4MKjgYFuVGtjspKWCxsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cT3XxS5X; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cT3XxS5X"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so31250955e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746447468; x=1747052268; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aI7ws8iZPwHTtGYkxfXZJ4wq0gS6ufEYiqCRndIOAfc=;
        b=cT3XxS5XxL72p5/9RJ2CipVe7hu3mF7ilDu/ZFJA9NXW1/4MFGEJY9C3aybipnCXHu
         NXgCGLnEvp4HqnEDOBLui4tKdzCFG26wSA3npQe/CZoJ12xRqcoBbmaQtazFSSpNNUpA
         ls6FEBFNwlKUkgBIXhq26UY7hmDk8tPEItQIisj65gDvs8I5tdtsdqD2V/mHG1qEKppz
         zcTB1TaI9dLkRT2wnQKHGsZu2qiNSZGRM7dWYSll6KSVpd4nLsjTXuqAiGL+VeXlt1hh
         ZqiFs+fWgK7lduY8fHXz3olf5DFJK1yObKNwzIdUtyM1cBRjI42OBfDGb8d96oBnk3l7
         8qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447468; x=1747052268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aI7ws8iZPwHTtGYkxfXZJ4wq0gS6ufEYiqCRndIOAfc=;
        b=Em8RRLJoZGMDsYvTMD7n/5Bb1My27UMNhWWzHZLvI7zwEGnsd23ZlQ2+EfwJkgy9d7
         FkrWrDqpmHRoLxeUaYvFDHc1vz5vd+QubVb0X4KowYHxVGlNpTlxeqP/Mgw1Qru817H/
         +qqWfArHst/i4W3PWS9DbZsyqdOM3ubCsLu08otdf4wsHrjlIaWD1nmEhJSjnTj2Cy7J
         0AfLlDnJldNcxZHgOJWWx9Hfg7tjsc+rWzBbD4vKsC5fOwZrLcwxj9L/3SV34feCdq4Y
         AIkFMmfR100BbjxokejXvHe3rZd5U7siyVCj2q9T26xFs1ILYbdKpR0cvFU7ggTlMGCG
         1YMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX32S14OZK4YjT8MBCWdDDBgiYbGxA4/QTiIuyefBiZOduQ5tw6nAhLFNBNq//3IUWx+6x9dDKhgUYTzlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTeJp/y6BLfAQ/+IZXUkNR3p+sp3bVXs+DCCjNkSHiXOMVUAx6
	m5CBFRYxnZy5FF00o4q5mTP3Ujp31X/v9bj5E9lRen3OQ+/eyot+olTtQKrBZMDs/+ypByqRp0/
	iTBWheopHpAQL8g==
X-Google-Smtp-Source: AGHT+IGRlviQWDMm0JA9tB+a5FlOvz3A/Z4hQKhAVSVd7A0c+V+17SbTcKuOwq2RUwtBR0ovkffnvqcRY7oC5LM=
X-Received: from wmbjb17.prod.google.com ([2002:a05:600c:54f1:b0:441:bf4e:899c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b96:b0:43c:f64c:447f with SMTP id 5b1f17b1804b1-441c49483c0mr51904745e9.29.1746447467965;
 Mon, 05 May 2025 05:17:47 -0700 (PDT)
Date: Mon, 05 May 2025 12:17:32 +0000
In-Reply-To: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=lA7Gkh9jGL4mrigHzmXfNszvqrkSyoDnALirNgDesXs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoGKxl2bSoTcsJCcnQIyuizzBKGVs20krozLvxf
 msQUXTjH0WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBisZQAKCRAEWL7uWMY5
 RndXD/oChQWpR+z9zVjQaGvOxyzaRIeKJU038RRe/zOMeiMEDMezfjn4DLPiI3wz0RlKzJFvbCN
 FuPB+HB5GpkD94rp87Q0OOleKxkMtJHhD7IRC1Zdu3BoAUfTQc1nQDuOk84tFt7AOm0arDS3v+X
 efm3d62o4rNhBrp3ejEtc2UOLUDRyEFeTB7hhplhh80vhDYWP5kNksV61vUchG7k244PtsBJkUs
 RF7ryElwzZUrNfP1T4mpFgX64+rWLuSvYwVSnKmoL5+Iruk1QSVYdA3W6I7nKnQXXhIjT1VgGvO
 clQKmJqIs+19jvx8n+QCtEZfhKFAatQO2p0YNd8467Wx9iG754qmMxztHS9C1jfu0D3wYx/j9bj
 ME4FK8k5dDI13kKFl972C8+kxbxVj27A2UrV16jQoM7ZU2uaC0H8UvH2bzMNKfgxBzyUl8heSPm
 eOlemNhRWs0lw4kFBHPyLe4OaWVFEt345eBxdMDK9NmDf1jpTOGe0BtQfPhpdGIFDoPBD1fokX6
 yfHORGu8rkDlEUMpA4Ix67XPK480KLqba4fJHgOkVW4jk40G2y1q821uKm5vubW7ktWKI2mzuVr
 84jmLSMjSgopzqAB79nfewtQei2rGfbBw9HBB8+ZDnVeOAIAKcj6PtwfShdEKBSmMxodAPbBgOF k42O/qnrvf0ZUPg==
X-Mailer: b4 0.14.2
Message-ID: <20250505-strncpy-from-user-v3-2-85c677fd4f91@google.com>
Subject: [PATCH v3 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patch adds a more convenient method for reading C strings from
userspace. Logic is added to NUL-terminate the buffer when necessary so
that a &CStr can be returned.

Note that we treat attempts to read past `self.length` as a fault, so
this returns EFAULT if that limit is exceeded before `buf.len()` is
reached.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index a7b123915e9aa2329f376d67cad93e2fc17ae017..978205289d297a4001a51fa40ac29039bff73672 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -293,6 +293,58 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
         unsafe { buf.set_len(buf.len() + len) };
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
+        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
+        if len < dst.len() {
+            // Add one to include the NUL-terminator.
+            len += 1;
+        } else if len < buf.len() {
+            // This implies that len == dst.len() < buf.len().
+            //
+            // This means that we could not fill the entire buffer, but we had to stop reading
+            // because we hit the `self.length` limit of this `UserSliceReader`. Since we did not
+            // fill the buffer, we treat this case as if we tried to read past the `self.length`
+            // limit and received a page fault, which is consistent with other `UserSliceReader`
+            // methods that also return page faults when you exceed `self.length`.
+            return Err(EFAULT);
+        } else {
+            // This implies that len == buf.len().
+            //
+            // This means that we filled the buffer exactly. In this case, we add a NUL-terminator
+            // and return it. Unlike the `len < dst.len()` branch, don't modify `len` because it
+            // already represents the length including the NUL-terminator.
+            //
+            // SAFETY: Due to the check at the beginning, the buffer is not empty.
+            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
+        }
+
+        // SAFETY: `raw_strncpy_from_user` guarantees that this range of bytes represents a
+        // NUL-terminated string with the only NUL byte being at the end.
+        Ok(unsafe { CStr::from_bytes_with_nul_unchecked(&buf[..len]) })
+    }
 }
 
 /// A writer for [`UserSlice`].
@@ -383,7 +435,6 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
 /// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
 /// Unsafe code may rely on these guarantees.
 #[inline]
-#[expect(dead_code)]
 fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
     // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
     let len = buf.len() as isize;

-- 
2.49.0.967.g6a0df3ecc3-goog

