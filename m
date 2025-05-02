Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26B255F4E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191995; cv=none; b=OmZT6Q++9zILC5LiWvv1ypndbw7PjqwCHctN39DozkNClxUUKGMTrPbgzX1tsC6TxV1Fquysaj5YT8bWQr3q0vuLx484FRV3piZib1V95aaVVoBH1ZrJvqQR5edA2Ja8SXbi114tfQLGmrguzP8E2Va+MwpoeXmXiqrrLV6BmZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191995; c=relaxed/simple;
	bh=NPI8Q0CzeDhYCgGRlOT+/ncU0nCVd9zf3HV87DMudMQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G5/IeTxPBku7teWI/4ab8w3nCRFskET6qsJsLgYr01HR3dOHZb24T0CYH3APWXLUnZ9s8lyLoed/wNMqq0WLRQWpoJeHNIghNjqb/FSh/wPE0AFm7HU9nBe5m0MmT+CaxcYe8uEpivA/wtDcIY9qsJd4oN17ZGYCCSfm9dcTjww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ly42+29Y; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ly42+29Y"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a07a867a4dso1015546f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746191992; x=1746796792; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xzccJFQgm3Btdw/UpST5BSIO17Up7GalLaw9yByRn6A=;
        b=ly42+29YxXpVExFhm8YGYF3wR9/NK8l9/xOp/SzJAK88h60ycU3XNSWWwEUsKrXgbT
         qclKUnjzLqcs8Ztu0U8tvxN1YSzDAlUBVrs6OnqYO6ZQGpEFJIAEw7m2vzE5syunX/69
         1CBJ3R1haE97W1KPL+ltUhvgVCmSgH7djFYQSjY64GpfWfmXfxXD5ViuBN3V6qXDcfOr
         hON1DMk1Ki/n50UB4eCwEXKv6j73GiKLt+PlhVwFAfQ6uoXoEFOzaRMh8wOJcu1AzSOy
         ne0W1vN9mheo3xkfi9HaMhCtewXQ7+VLKl8ZKAU7OKYIlBTkoRFvuZKHoPc5YFh7Pw4P
         2vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191992; x=1746796792;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzccJFQgm3Btdw/UpST5BSIO17Up7GalLaw9yByRn6A=;
        b=GSVDnWr7GHDWH7gj5H537ioDcA50MEIMuMMawvbEH74q5xZv9xlVIAKVpGxZgofmPA
         HrdCh4AmlSwaai/2Uha/wL6q2O6AQD6n39zuQ9cgD1vxgzXvowtZsOsFxpzUoD3LhMBC
         T03Ydg1CxnKO2bHBTR7sB33tMhhRDKXq3qZhhlMVYO+4ZCxAGEGjsVrU5XwmAsHVAwhg
         meT/DHr74MHQnRs9qrsHm/Xr6wF6Y9sUu311cpOBJoHI3lg78poyapKs1+DnM7RkadHK
         WB3YLsD8mC7z9JKAurJn12CqgbnaSUj6ShH62KxrMXDwKk0Wgbj/aw4GfiBire+gFLam
         Llxg==
X-Forwarded-Encrypted: i=1; AJvYcCXecnQOeT7IGB72hRJh4lfWgL8PRnRJJaK6VWuIsTwpGurwXtsdHnqHFMTXnSQwoqqNHNXqF3+Yrb5AJMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9aAuXYnEWakwhj4MFmS0/NYbdN9KRRPC0foQD28QnQRTVlZrJ
	iF9wmkrhAqfn+hfyQG/SnHPdUUb+BObyKQ6Lw2KA8GDKnvyqvvBSag3UjCeF+UKg6u1p8ogdHby
	cHGOTIhcZAHlSPA==
X-Google-Smtp-Source: AGHT+IERAEp6Y3HGppF1/OOjzNHvj6vYq+bUMzpiTu5TzcOhpBKMX4Gv/giZgYisNuR6fADi18ZYP+Bp7+ayHh4=
X-Received: from wmbji5.prod.google.com ([2002:a05:600c:a345:b0:440:595d:fba9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1446:b0:391:3406:b4e2 with SMTP id ffacd0b85a97d-3a099af1304mr2118599f8f.49.1746191992447;
 Fri, 02 May 2025 06:19:52 -0700 (PDT)
Date: Fri, 02 May 2025 13:19:34 +0000
In-Reply-To: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3519; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=NPI8Q0CzeDhYCgGRlOT+/ncU0nCVd9zf3HV87DMudMQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoFMZpQGtBpyeKhsH9KTgDwX8YIWvfvp819rVCW
 YiaMq2+1gKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBTGaQAKCRAEWL7uWMY5
 RohPD/9xqXoqE6eao1bCOeaVAHUgZfFMO25NzqOL07q7JHy8Fg11q2TXwxY6bX/++nRczCVbjnP
 hrk+OsTrwAYjZYZDUXUtq8OMKBCwS/XBOltyx2PRUAo6QAqUcVtb6LA0PHoCoK1CO+L3p4u0lei
 IkaHFhImdw30BiXxJkSE9K4rF4BeaaQOzI/6IE2JqVWvOHCtX3yopWudEKOuZ8/ME+vxs5A3e7Y
 nz8uI9FNmFUAkslZWD0tXKltpZYG6XmskbiIvRvBVeXg0aQW0ysnhYyLJXKQP2LbkkZhKgsquQE
 t0gGlnuRu6NdtPO6KmoulGayRe6e3jE2GXx78uqMxSpDLvMftvo52G9EF0uylg5bn1ZijWnlAlg
 pOUTJX2QiqALXYRtGvTccFBLFxZl+PgpgOtV3vwIvL8B4or2tpM8V0bLwsCC+Iteim0ck/Zwp9r
 k0Ub7L5COkfII3YdNitpM0TRSSUoBT9KlBIfDsSryL1bNHkJUyiXzjjmcgNJr9V04LnRbPSmURK
 tnPHWwhbCfs9G/HxjkScyTOEQ3hNMYkj5tnGHwjz3XZFg+UH+dUWx3g8l1RlL9CWHXQU/ZZ+Jwo
 Tvpg4BRPLEHVEN+nEfnf8RDBYB9vm8n/MWuYxNguZZzyYTbmfnEBE01Sc8vhrVuKQweB9MCmH9c 51Yf9X9Jtlw7N/Q==
X-Mailer: b4 0.14.2
Message-ID: <20250502-vec-methods-v5-6-06d20ad9366f@google.com>
Subject: [PATCH v5 6/7] rust: alloc: add Vec::remove
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is needed by Rust Binder in the range allocator, and by upcoming
GPU drivers during firmware initialization.

Panics in the kernel are best avoided when possible, so an error is
returned if the index is out of bounds. An error type is used rather
than just returning Option<T> to let callers handle errors with ?.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs        | 42 +++++++++++++++++++++++++++++++++++++++-
 rust/kernel/alloc/kvec/errors.rs | 15 ++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3298b3b0f32c70f3fe517fcb7af6b9922fea926b..8845e7694334b672476ff935580f3a9eb94d23fe 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -22,7 +22,7 @@
 };
 
 mod errors;
-pub use self::errors::PushError;
+pub use self::errors::{PushError, RemoveError};
 
 /// Create a [`KVec`] containing the arguments.
 ///
@@ -389,6 +389,46 @@ pub fn pop(&mut self) -> Option<T> {
         Some(unsafe { removed.read() })
     }
 
+    /// Removes the element at the given index.
+    ///
+    /// # Panics
+    ///
+    /// Panics if the index is out of bounds.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    /// assert_eq!(v.remove(1)?, 2);
+    /// assert_eq!(v, [1, 3]);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn remove(&mut self, i: usize) -> Result<T, RemoveError> {
+        let value = {
+            let value_ref = self.get(i).ok_or(RemoveError)?;
+            // INVARIANT: This breaks the invariants by invalidating the value at index `i`, but we
+            // restore the invariants below.
+            // SAFETY: The value at index `i` is valid, because otherwise we would have already
+            // failed with `RemoveError`.
+            unsafe { ptr::read(value_ref) }
+        };
+
+        // SAFETY: We checked that `i` is in-bounds.
+        let p = unsafe { self.as_mut_ptr().add(i) };
+
+        // INVARIANT: After this call, the invalid value is at the last slot, so the Vec invariants
+        // are restored after the below call to `dec_len(1)`.
+        // SAFETY: `p.add(1).add(self.len - i - 1)` is `i+1+len-i-1 == len` elements after the
+        // beginning of the vector, so this is in-bounds of the vector's allocation.
+        unsafe { ptr::copy(p.add(1), p, self.len - i - 1) };
+
+        // SAFETY: Since the check at the beginning of this call did not fail with `RemoveError`,
+        // the length is at least one.
+        unsafe { self.dec_len(1) };
+
+        Ok(value)
+    }
+
     /// Creates a new [`Vec`] instance with at least the given capacity.
     ///
     /// # Examples
diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index 84c96ec5007ddc676283cbce07f4d670c3873c1e..06fe696e8bc6612a5e6aa2f6c28b685033acfa2f 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -21,3 +21,18 @@ fn from(_: PushError<T>) -> Error {
         EINVAL
     }
 }
+
+/// Error type for [`Vec::remove`].
+pub struct RemoveError;
+
+impl Debug for RemoveError {
+    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+        write!(f, "Index out of bounds")
+    }
+}
+
+impl From<RemoveError> for Error {
+    fn from(_: RemoveError) -> Error {
+        EINVAL
+    }
+}

-- 
2.49.0.967.g6a0df3ecc3-goog

