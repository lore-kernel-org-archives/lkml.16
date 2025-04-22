Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB152036F3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315570; cv=none; b=i9aOfGiiszzPnGoCfJOIkTqcd4ZbrSRg1KKpeGjzdiDsuqMgvvvjRjNlrrAVGhuH+7sZ2fD5FxbmuQkpu/mmYIgPNNw8+bFv9stmg5EclhI4PzjosFiruZSxvbTgujnH0ci384PTfC7RVWfgun6niBUNUpbhln6bj2IVHN/naaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315570; c=relaxed/simple;
	bh=mb+O7XPiHthdR+y4O3MYaMfVR53TvV7CjFTDaLnXoqM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GK0ezPNDbyXw0aR12on3mvCUlUgdV/N3zsR/e/6CFqvNoiw21wsgBPLj8Uokl0WB3XJDxrXKgZYlsLoKNhgbgateHD6nY72sJq0+UlYEN8y91NdYDreHgUR3hZdcKgfPTBVed1fK3fW/xPbqOxUhBg7T9oV9Qy+FE5dxpwuabDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MA1LtTSG; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MA1LtTSG"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3912d5f6689so2746045f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315567; x=1745920367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2DCVJ0DtabWjawqQbg/BlO9LZ4XfJJVnHx9onycFg7g=;
        b=MA1LtTSGtODIqERyuw3dNB6U6GbaYBdP/32sq/LZ5Fn8mYv0JdDNCvCR6q1HugAsma
         nFefogcXbT+V/kFqJpAeW7I0XCTMDEer+GFp5kE5RYxQHWZR9YREmT1iU6DhdXuSFP3Q
         U/OqW9+eJ+D+QxT1YEclwLKP4GOeacVzYn1m0U+FF5MdXZ1SVaiwhGUi5OJBSF8CTgb1
         dIrI9uu4A42U2/f75vYtyRm3Qtj+MvyU1wSriRzetdEYjIqIw2lloCrjhLIprkfdphrc
         oIUvtGLWIw2k2uOmTtCARpj4On+eptLVTHZRhPLribKH3q2FvVVUN4EVALpvkDHOHlH1
         HR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315567; x=1745920367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DCVJ0DtabWjawqQbg/BlO9LZ4XfJJVnHx9onycFg7g=;
        b=anIerrx+JpqM68ZtQ/unPH7oGva+SY+m2WyOoO2s8KIFFNXbdkFHoUQhl1W89agfvB
         kZIioO8/Hp6GsxjwVaI9OQ69rYn1ruTnwhZxRXMeBZZ6FBhWeJB88JKD6b+rfZz2cise
         95rEF8SeXDTuedP9gJi4bnaGnRTP2HVxb35tzhMxy5UPVwR6WM4ICNfuexuuHFmisQ25
         mJUHiP4+ZFjYc4Ppsrg0GLT78sy7xXlWGOLBpB6C/ZkCFtrKIGQogDIOujWn6D8S5DMZ
         x8QRr8sfuJvNzfQXtCGTgCjcs95M9gbr7TzDnVB69zlavJoienK1gS2CkXF1Ynb74uNn
         NYsA==
X-Forwarded-Encrypted: i=1; AJvYcCVnltaiXzmBk3b6BrbQ6aVg59krtMFy71xcvhC9aDWAYQ86hmb54QseVwLzTvolGiFkIwztGBzKJhpLxpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGjRbHiaDLSYHIMkDTvuGWfH7EM0dIL0iC70cAF3GoaZJ7lHuv
	vLeyOklV9AxFkSCRiWqtK57wM1BN9CiiaHYeStnOP+YHE85I3+4PoY3kxiKqMoZQX4t/b3Ynpbu
	1cU1sV68/Z72Lzw==
X-Google-Smtp-Source: AGHT+IEjIs1PP1IgSTDnsDg2V0e4IMM0C96a3E5gUuieuIiK+z1Yx08h5EmsDcyABmJfcB1dZ3l6N/RlKRYDPYY=
X-Received: from wmbfs18.prod.google.com ([2002:a05:600c:3f92:b0:43c:fd99:1b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:188b:b0:39a:e71d:ee34 with SMTP id ffacd0b85a97d-39efbad2b2emr9931349f8f.37.1745315566643;
 Tue, 22 Apr 2025 02:52:46 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:20 +0000
In-Reply-To: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3177; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=mb+O7XPiHthdR+y4O3MYaMfVR53TvV7CjFTDaLnXoqM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bgzL2YXfnjsb+0grk8LTEfvaNgSyI9SVyF0
 M3uPkRGogaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm4AAKCRAEWL7uWMY5
 RlCcEACPjIjx9RDJ7vcD8aDcHdH+cnxFQBPXi1fTrPvF1JcMsKLVcE6ZQsN9ceI0QdlUlZ8iPt9
 a2IYIFDvB+AEBCNRtfgiA1X11ecn8/425kj74k0jXjbhoiwY16VCdAuisZSAHoJxfmdkHzWzXKz
 Tu8gDGfNehpTvFCoY2rq+qJY4N0QyCt99bziUndoj3FYysy4DthA2t15OAWwFg2QO+2rOxno8gY
 EyfxfCsSiqyV0xC/qkUT0Ct24d0Y5rCTISRV74VQfPgEM3Jq92O7GATpFtSt1gtfwlCXMemkkTK
 V+dHgtcKP+HjXiSrkO0zJSVyxvXOK+ixsXWD4icGA4/ZEw9gCkzHrLH0LNUhx2RPnlLrkZdc2Jn
 LUURUMPXoXjqsnZonpAmL6r0SKHn+bmzjZzkq7tr5UidyjUg2T7lUBJE8lXvw+EAFubER/AU/Q7
 YZAcFIAG3ZSChkFdcKmSFlwikvVI75EPVG3j5RmZKoEi5FOOYAV5R3+UrjxHndksq+DBtx7jzTr
 xeOrr++aF4i534kqOYKuRPNANZKZ57i0m3WZ+Xbxz2I0EMWruKwp4D55mVKFKHWUcbhdSUL6XtL
 FnqT5aH4ek0FPBWys1IO4kfxF0b4nIvGrnPSBnpFAGA0/fBQTh+/6oovLjHj4eCh/LmooE3Ut6g kh2Np/Qp5iGp1VA==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-5-deff5eea568a@google.com>
Subject: [PATCH v3 5/7] rust: alloc: add Vec::retain
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds a common Vec method called `retain` that removes all elements
that don't match a certain condition. Rust Binder uses it to find all
processes that match a given pid.

The stdlib retain method takes &T rather than &mut T and has a separate
retain_mut for the &mut T case. However, this is considered an API
mistake that can't be fixed now due to backwards compatibility. There's
no reason for us to repeat that mistake.

To verify the correctness of this implementation, you may run the
following program in userspace:

    fn retain<T>(vec: &mut Vec<T>, f: impl Fn(&T) -> bool) {
        let mut num_kept = 0;
        let mut next_to_check = 0;
        while let Some(to_check) = vec.get_mut(next_to_check) {
            if f(to_check) {
                vec.swap(num_kept, next_to_check);
                num_kept += 1;
            }
            next_to_check += 1;
        }
        vec.truncate(num_kept);
    }

    fn verify(c: &[bool]) {
        let mut vec1: Vec<usize> = (0..c.len()).collect();
        let mut vec2: Vec<usize> = (0..c.len()).collect();

        vec1.retain(|i| c[*i]);
        retain(&mut vec2, |i| c[*i]);

        assert_eq!(vec1, vec2);
    }

    // Used to loop through all 2^n bit vectors.
    fn add(value: &mut [bool]) -> bool {
        let mut carry = true;
        for v in value {
            let new_v = carry != *v;
            carry = carry && *v;
            *v = new_v;
        }
        carry
    }

    fn main() {
        for len in 0..10 {
            let mut retain = vec![false; len];
            while !add(&mut retain) {
                verify(&retain);
            }
        }
        println!("ok!");
    }

Unfortunately this can't be a kunit test because it uses the upstream
Rust implementation of Vec::retain as a comparison, which we can't call
from a kunit test.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 4a29ca6e7dedc3e93a58830938f3a51619c270ed..2f894eac02212d15d902fe6702d6155f3128997c 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -607,6 +607,28 @@ pub fn drain_all(&mut self) -> DrainAll<'_, T> {
             elements: elems.iter_mut(),
         }
     }
+
+    /// Removes all elements that don't match the provided closure.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3, 4]?;
+    /// v.retain(|i| i % 2 == 0);
+    /// assert_eq!(v, [2, 4]);
+    /// ```
+    pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
+        let mut num_kept = 0;
+        let mut next_to_check = 0;
+        while let Some(to_check) = self.get_mut(next_to_check) {
+            if f(to_check) {
+                self.swap(num_kept, next_to_check);
+                num_kept += 1;
+            }
+            next_to_check += 1;
+        }
+        self.truncate(num_kept);
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {

-- 
2.49.0.805.g082f7c87e0-goog

