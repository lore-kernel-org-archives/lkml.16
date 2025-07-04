Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1BD289370
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621185; cv=none; b=NQNkqKKIXcK1BzcPe023dXWjmqaJS1mpUybnALHLZrmD3dBGLWf3DecASx8uFGaADDvntCnyBmLW9eIRoCvsYzkglCs8RYMkQMEx874ccE+CVY0wW8ja0tmr504cQQ6qMkHSKcTTiXJJy9AxRuXPBSgJrWdZ8sNWby/HgPJXZDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621185; c=relaxed/simple;
	bh=JZB7zO6gqQwgdwPk0qXB8K1QI4fPJKH7jlUq1EQPJjU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nZc6IUmF2ru+Bu7bf2LydpR1OyS7JYvhhkI6wfhRemaz5lG7h57SuSuU2e99tnkOkBA/8LE9LsRWga6KBScxMIDQA1WBKSZSmRndxycHzh5iRaBxZ9Cu/Srl8DtU97Gl82Gelht5yzYH48gyoHXq/BBP4O7YL3Y3/Y5ZshCxkOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZO+SP0Dq; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZO+SP0Dq"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so414094f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751621182; x=1752225982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+EGNm95/fFlMRBClRB3thVQC3r+aHPvX8cMZ8s8+maE=;
        b=ZO+SP0Dq+GoNYrEeZyGR2weFj8Owc7ZFcjDdqYPoeqYTXcPYloyrLsNtGVTTy752u7
         sgWUpRRK4EiDeMWGAjJqaAag1yGRduLehE6OvPEp3K6gzjXZD3t8H9WF1/Z4Fo2fgeTf
         lsy9mjBGOz5t9HQrs3V6eY0g4gnCtY4JuX6IQ5KKvwJAiFSjaGSAy1L5FDdtPrlWA9Be
         IcDn5t5wrRQbVFyeksgCLPEYmjjPPynqp3XLBf0ZJRHQqSNT+16dUdrLgaYtglqRtXA+
         0+vwaC5KxWaV4IZLZMxNPagzZUmxuaHu23RvyyNJhGmS7VdMifrFFNYjCAQDVcQ5uW7i
         rOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751621182; x=1752225982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EGNm95/fFlMRBClRB3thVQC3r+aHPvX8cMZ8s8+maE=;
        b=xI06qxPH08Bqn4y0ZrrEdIn/oyuoZFInrHYoR5Cb+cblldrH+XhF046/Dx/xFeF97M
         OFsy5DUkkpjpSDpjEa65QqmeFNApOyK/eDHAZHwVgsVjrIDDo/68tScNMZ5wvslVZngC
         oy7TgLrwK84ZqGNQ2AYN+RXtzrd9CqG/lqcUtBw3C2lwAW+Wtnia2MR6RQRm+TPpqAly
         AwZtlEZkFzGfSDph/QlkUxgIZOUx2qvjk2W1/AMsgO84VR5xCcyaiyge3+KvQkNMdf9i
         dKXm9Buju8BNt5QKYpt11AGSfKSw4O0fBvx3DFuQsdLCO0dWJbWT2hqD69UPntck37B/
         lz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXedSvS7PUAVKWoapdgrh4Mnc6l3DC2xutNf9VO3lrrfFJrOSPNX3gO8Ee+3ytlwo87MwVqVy7Rq6b/1vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTF5VomYp/1pV8+JOGeQejjOzgGsLj6DOYleBsJGpwhshVgeUR
	QMRe+B9BFCscQRvcoyXRoNIopqd9a3Cejv2P9lc6qhgruQhT9/MFarXo8XQKWdkBQW/YtV2WhFD
	OKDYNnuRUAM0+RGosmg==
X-Google-Smtp-Source: AGHT+IHIM44HlZd8PDW2GOIjhtkmQHmHcNHFBYJ2nX7KOkSBkxrzLTkXgN3wEtT7InvpBRPg4JPHYIulJ8VfwjA=
X-Received: from wrbce17.prod.google.com ([2002:a5d:5e11:0:b0:3a5:79a4:f479])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f47:0:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3b4964f9d83mr1594055f8f.13.1751621181896;
 Fri, 04 Jul 2025 02:26:21 -0700 (PDT)
Date: Fri, 04 Jul 2025 09:26:01 +0000
In-Reply-To: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6731; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JZB7zO6gqQwgdwPk0qXB8K1QI4fPJKH7jlUq1EQPJjU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoZ545Eqk7L7oIUAZ0Q4uJFClYlg76z4GoKVod/
 En/CeWvOqmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaGeeOQAKCRAEWL7uWMY5
 RqkLD/wO0YkFF4uRja0y8RMp77mYdzlpkRGJvZTpxtKBNxxhH4zCchA9MeC6EfThyI091bf6IY0
 mSQFKPZ3RKhV75ZYmyqVEpiq5xlkZFhCQ5aco1wD5B6a5y1NNRbVAqINWQSJOe2ASspvHORyCvs
 zq98By88lFuhnGQEBw9rELy0UqQqmPSwZzwzvzLdf1Yyg5oG4n01ZZKJSDqXrplt5m4feSOfUyM
 jh3Q1NggZi5z4TwSdz40KMOqYD67jWrJiVQWJe8T9N255h2Fu+q06cVLP4ahVR2Q5ZeV97wDoaA
 LZU+aP0K9umS7d22SJe6DFrynioAi7xkQGVrDu2qDtdmW8x4t+6aeTBlFqKsTj+LExSlr9OqcrW
 +SZu8AgpMhjH6eiNS3geQNKFMp9m3tksFd4PPpSHOPH+FPVHObqUTJFSQseGE6cDjQqC9lD8Yr3
 PhmK262k5vVz1/OEiWaVaJBK8Jw6axPRuZQrGt5ln/wOWdeUbENQqXqvm3QxQ7x49nwQOEqDb40
 cmKMqxxZmIXzq9UhmfFWnoqLYdzit2e+bjGdHCbyypMnqubrR626hDqEds9Uyw8PUs3b4NmaSIN
 9XZ+UicFCRlblM/oevmhspqJjENahg4vF/t1B3QYschAeipcOxD9FooY7/fuLArUwc1xEln6aC4 AGGPOxk9z1kNOqA==
X-Mailer: b4 0.14.2
Message-ID: <20250704-iov-iter-v2-2-e69aa7c1f40e@google.com>
Subject: [PATCH v2 2/4] rust: iov: add iov_iter abstractions for ITER_DEST
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

This adds abstractions for the iov_iter type in the case where
data_source is ITER_DEST. This will make Rust implementations of
fops->read_iter possible.

This series only has support for using existing IO vectors created by C
code. Additional abstractions will be needed to support the creation of
IO vectors in Rust code.

These abstractions make the assumption that `struct iov_iter` does not
have internal self-references, which implies that it is valid to move it
between different local variables.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/iov.rs | 137 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/rust/kernel/iov.rs b/rust/kernel/iov.rs
index b4d7ec14c57a561a01cd65b6bdf0f94b1b373b84..917fc5242225aaef60e2170c80637a9161351f50 100644
--- a/rust/kernel/iov.rs
+++ b/rust/kernel/iov.rs
@@ -16,6 +16,15 @@
 use core::{marker::PhantomData, mem::MaybeUninit, slice};
 
 const ITER_SOURCE: bool = bindings::ITER_SOURCE != 0;
+const ITER_DEST: bool = bindings::ITER_DEST != 0;
+
+// Compile-time assertion for the above constants.
+const _: () = {
+    build_assert!(
+        ITER_SOURCE != ITER_DEST,
+        "ITER_DEST and ITER_SOURCE should be different."
+    );
+};
 
 /// An IO vector that acts as a source of data.
 ///
@@ -150,3 +159,131 @@ pub fn copy_from_iter_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> &mut [u8] {
         unsafe { slice::from_raw_parts_mut(out.as_mut_ptr().cast(), len) }
     }
 }
+
+/// An IO vector that acts as a destination for data.
+///
+/// IO vectors support many different types of destinations. This includes both buffers in
+/// kernel-space and writing to userspace. It's possible that the destination buffer is mapped in a
+/// thread-local manner using e.g. `kmap_local_page()`, so this type is not `Send` to ensure that
+/// the mapping is written to the right context in that scenario.
+///
+/// # Invariants
+///
+/// Must hold a valid `struct iov_iter` with `data_source` set to `ITER_DEST`. For the duration
+/// of `'data`, it must be safe to write data to this IO vector.
+#[repr(transparent)]
+pub struct IovIterDest<'data> {
+    iov: Opaque<bindings::iov_iter>,
+    /// Represent to the type system that this value contains a pointer to writable data it does
+    /// not own.
+    _source: PhantomData<&'data mut [u8]>,
+}
+
+impl<'data> IovIterDest<'data> {
+    /// Obtain an `IovIterDest` from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// * For the duration of `'iov`, the `struct iov_iter` must remain valid and must not be
+    ///   accessed except through the returned reference.
+    /// * For the duration of `'data`, the buffers backing this IO vector must be valid for
+    ///   writing.
+    #[track_caller]
+    #[inline]
+    pub unsafe fn from_raw<'iov>(ptr: *mut bindings::iov_iter) -> &'iov mut IovIterDest<'data> {
+        // SAFETY: The caller ensures that `ptr` is valid.
+        let data_source = unsafe { (*ptr).data_source };
+        assert_eq!(data_source, ITER_DEST);
+
+        // SAFETY: The caller ensures the struct invariants for the right durations.
+        unsafe { &mut *ptr.cast::<IovIterDest<'data>>() }
+    }
+
+    /// Access this as a raw `struct iov_iter`.
+    #[inline]
+    pub fn as_raw(&mut self) -> *mut bindings::iov_iter {
+        self.iov.get()
+    }
+
+    /// Returns the number of bytes available in this IO vector.
+    ///
+    /// Note that this may overestimate the number of bytes. For example, reading from userspace
+    /// memory could fail with EFAULT, which will be treated as the end of the IO vector.
+    #[inline]
+    pub fn len(&self) -> usize {
+        // SAFETY: It is safe to access the `count` field.
+        unsafe {
+            (*self.iov.get())
+                .__bindgen_anon_1
+                .__bindgen_anon_1
+                .as_ref()
+                .count
+        }
+    }
+
+    /// Returns whether there are any bytes left in this IO vector.
+    ///
+    /// This may return `true` even if there are no more bytes available. For example, reading from
+    /// userspace memory could fail with EFAULT, which will be treated as the end of the IO vector.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        self.len() == 0
+    }
+
+    /// Advance this IO vector by `bytes` bytes.
+    ///
+    /// If `bytes` is larger than the size of this IO vector, it is advanced to the end.
+    #[inline]
+    pub fn advance(&mut self, bytes: usize) {
+        // SAFETY: `self.iov` is a valid IO vector.
+        unsafe { bindings::iov_iter_advance(self.as_raw(), bytes) };
+    }
+
+    /// Advance this IO vector backwards by `bytes` bytes.
+    ///
+    /// # Safety
+    ///
+    /// The IO vector must not be reverted to before its beginning.
+    #[inline]
+    pub unsafe fn revert(&mut self, bytes: usize) {
+        // SAFETY: `self.iov` is a valid IO vector, and `bytes` is in bounds.
+        unsafe { bindings::iov_iter_revert(self.as_raw(), bytes) };
+    }
+
+    /// Write data to this IO vector.
+    ///
+    /// Returns the number of bytes that were written. If this is shorter than the provided slice,
+    /// then no more bytes can be written.
+    #[inline]
+    pub fn copy_to_iter(&mut self, input: &[u8]) -> usize {
+        // SAFETY: `input` is valid for `input.len()` bytes.
+        unsafe { bindings::_copy_to_iter(input.as_ptr().cast(), input.len(), self.as_raw()) }
+    }
+
+    /// Utility for implementing `read_iter` given the full contents of the file.
+    ///
+    /// The full contents of the file being read from is represented by `contents`. This call will
+    /// write the appropriate sub-slice of `contents` and update the file position in `ppos` so
+    /// that the file will appear to contain `contents` even if takes multiple reads to read the
+    /// entire file.
+    #[inline]
+    pub fn simple_read_from_buffer(&mut self, ppos: &mut i64, contents: &[u8]) -> Result<usize> {
+        if *ppos < 0 {
+            return Err(EINVAL);
+        }
+        let Ok(pos) = usize::try_from(*ppos) else {
+            return Ok(0);
+        };
+        if pos >= contents.len() {
+            return Ok(0);
+        }
+
+        // BOUNDS: We just checked that `pos < contents.len()` above.
+        let num_written = self.copy_to_iter(&contents[pos..]);
+
+        // OVERFLOW: pos+num_written <= contents.len() <= isize::MAX <= i64::MAX
+        *ppos = (pos + num_written) as i64;
+
+        Ok(num_written)
+    }
+}

-- 
2.50.0.727.gbf7dc18ff4-goog

