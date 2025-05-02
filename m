Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD5255F5D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191993; cv=none; b=PuCGIJa8PA6AZT7GnM34B+As7kL8k1loH81kKYhaW7ycNka8bfJddhDcJWt+mfIfFMBKWNBMUCU/eLRoMhWoKvG80emhqTiiouPg0PJLZHg8FRJF50OobXKbXvNhW6VLPji/vJwDpQF6nP/FJh8RFM78dp0XHSrsStH5mc/R6lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191993; c=relaxed/simple;
	bh=ntNHKD1aAus/XVUDLI6auIHzcPaub0zhy99OX5NhOao=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OanCRFeUQ6Ot/qk5T/Y+w/c5tFD1/f42Wf1BvOW1M/eQY6tHlZeTNrB1EVr4q1FX+sVP36JtkFCPI613qUdXUBnqKd/voqlDsNrNoIevKiSnLSmmCh4O34Ykf46/ecbyerDC2jXQVV5bGpcQQb7m38nYf7tG++qF7KvIjfv/A4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=39gPze4X; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="39gPze4X"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ea256f039so14592885e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746191990; x=1746796790; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1tpEf3+bu3lxuNrb8CKVDwlrCGOTDoKQVcY7PTqeRY=;
        b=39gPze4XylEbh5onl8W3gfJG1fMF3535/nrT6p+JQ+TiJLrD5kWBvqjV81q24bOT2c
         QNl4/DieKlirJIcuSAtLjf2sC8n9ndPpJrVHlhytBTd35m3tpjKz7NGqqEBn18U7VCbk
         lykzVbIYiVCgfXluuz32yk5J7ra1N+5t8YEUyZUfp7CioBWVrvG9c2y9mvVhrSrlfr2A
         J+ZxJX4gdq8xZDINXt/Vu3iQlU8C3EujyvXy1Bs0F1t0efsY4Qw84PBz/zY70Fg/3PR3
         z3smGPZstgAboOOqGjk3NCsLbl4f0OSF2MyATGydz8IlBt+pd3fYmPcJFJuDePAONEuB
         IUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191990; x=1746796790;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1tpEf3+bu3lxuNrb8CKVDwlrCGOTDoKQVcY7PTqeRY=;
        b=IA/A3LLcm/2/DrJObFFTT+7EfCAaOPmI8g29E3MW8OAYlHudrKsJVDcylq5mUC3x8e
         YWRU8N2RgHyoNu16U/T6aPKKgMoMQPlcFKYAlZ2JFgDZ5enLRupcDkTbwdKvkfF5snRI
         6q9nULWkcsLqhdSM+gpMw/fqivujn3/qUwFHciOEIF0gE4/MBwQAw0D6csGlQEH+32+y
         lhVXRmHZ7sVUGc7gQPK/XI2TB/HLrOolMZ4vXpW2R4xIE7eIW0mVAWdWCdnsI7FvI+Ge
         yaECnFVANx2ixcZS3fKC2M+48Bv0LKMjuQm7M+87dNYplmDMsV1SiB+CEojGBIpAUYXD
         z0tA==
X-Forwarded-Encrypted: i=1; AJvYcCULv5yGCIg/XOD9Q4YWKGxjBVw+lAPNTjwQ8qsx5YXao/EmIiRxHqzNM3D4RiZuD2kNoyNfAt3fd51eL7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJha3vcyFBTh3IiuV+JdlGhHnwghcsBtNqR9tECoDYpsHByAWg
	MLGwTBZATROAGm8G3gG3LB0vKgKqn1WU7x9iLsexc7wt8KBjXPebQoOVrmd6on2LWBQileWsQ7b
	vX5Xfx/ECoyMAWA==
X-Google-Smtp-Source: AGHT+IHAFqMJkAtqC2SWZxLVqIggAEd9I23F+Rr4fh+PToGXouWQ4XCpFH5Wsw5/aFzuNZFmLh2jeM6OTeI2tjY=
X-Received: from wmbfp20.prod.google.com ([2002:a05:600c:6994:b0:43c:f5b8:aad0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3155:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-441bbea0e1dmr24794695e9.4.1746191989989;
 Fri, 02 May 2025 06:19:49 -0700 (PDT)
Date: Fri, 02 May 2025 13:19:33 +0000
In-Reply-To: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3500; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ntNHKD1aAus/XVUDLI6auIHzcPaub0zhy99OX5NhOao=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoFMZpNca3fQ1kydJbsV7WpBUsdAazh+kXuZlEZ
 v14TxsM44WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBTGaQAKCRAEWL7uWMY5
 RrIDEACIdhbzpcsrR3j0V7JeiyO3csHGQGJy5MMPwxn71owlEsaD+YPjE+unTZ5jKnkyBFiNtdc
 PmE1KoUHPxRhOa9WAYXQ+LN8hCCPUrmvySQbZY9BPwz3N56zxqtWCbaUldBy4qf0QuhOAQTz7wu
 cyRrC6JmMZ9zwdAgoBzV8BmKkls3MKCKyAnJebkCgCydQFms7W0tltvzv7vdxLBWzBDCYGHWeQO
 WPxJo9T8YEydA4armdMctooU9c5KCwZbpEtbrsOgqsBK5FXVjWddpNpQ2wyBz3vtXdynIZL5Bhq
 beSTEjH18j/gUxarR72KGLqXVH5NhczOXLLUDyXV9VN9OJixt+QHCFyALlUPGMx71TrnfI4/vSA
 TwPuxqk0q1KFXuwVUPrcWg5599tKgJFLSlXv/pjeunTCrUqGJI8eRm0Q1tjY9TR7qa/HEWNOX6M
 oCav5In6udDYm9p+KxnUtwy/5KOrjL1IY2R+Yqqt1viEI+zzLzS6beSqmgAyRBkBDuSsekfWDNO
 Ozw8PF1+hzv1yqqiM1O/HjNWBuHUY4tlnLre7YIkPnhuliQyHLaW+013cr3qRMPdEZEphxxUjJm
 OMV2G9XTQip7yx1fU453j5BUesKmMH3HG7dFtlt/hnG3A2COKu2NBWFS+wK2K1NcD78mVPBw4KN YTmcFlWd/JBl3tA==
X-Mailer: b4 0.14.2
Message-ID: <20250502-vec-methods-v5-5-06d20ad9366f@google.com>
Subject: [PATCH v5 5/7] rust: alloc: add Vec::retain
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 72 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 7f75f3174ccb85daa3a9546d7b110da97f46063f..3298b3b0f32c70f3fe517fcb7af6b9922fea926b 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -610,6 +610,29 @@ pub fn drain_all(&mut self) -> DrainAll<'_, T> {
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
+    /// v.retain(|i| *i % 2 == 0);
+    /// assert_eq!(v, [2, 4]);
+    /// # Ok::<(), Error>(())
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
@@ -1132,3 +1155,52 @@ fn drop(&mut self) {
         }
     }
 }
+
+#[macros::kunit_tests(rust_kvec_kunit)]
+mod tests {
+    use super::*;
+    use crate::prelude::*;
+
+    #[test]
+    fn test_kvec_retain() {
+        /// Verify correctness for one specific function.
+        #[expect(clippy::needless_range_loop)]
+        fn verify(c: &[bool]) {
+            let mut vec1: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
+            let mut vec2: KVec<usize> = KVec::with_capacity(c.len(), GFP_KERNEL).unwrap();
+
+            for i in 0..c.len() {
+                vec1.push_within_capacity(i).unwrap();
+                if c[i] {
+                    vec2.push_within_capacity(i).unwrap();
+                }
+            }
+
+            vec1.retain(|i| c[*i]);
+
+            assert_eq!(vec1, vec2);
+        }
+
+        /// Add one to a binary integer represented as a boolean array.
+        fn add(value: &mut [bool]) {
+            let mut carry = true;
+            for v in value {
+                let new_v = carry != *v;
+                carry = carry && *v;
+                *v = new_v;
+            }
+        }
+
+        // This boolean array represents a function from index to boolean. We check that `retain`
+        // behaves correctly for all possible boolean arrays of every possible length less than
+        // ten.
+        let mut func = KVec::with_capacity(10, GFP_KERNEL).unwrap();
+        for len in 0..10 {
+            for _ in 0u32..1u32 << len {
+                verify(&func);
+                add(&mut func);
+            }
+            func.push_within_capacity(false).unwrap();
+        }
+    }
+}

-- 
2.49.0.967.g6a0df3ecc3-goog

