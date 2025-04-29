Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9803C220696
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937893; cv=none; b=GeO/Ul02XoGIkftRaQ/06zJBivDlFF7SdBAk1PUa6cUkC6qq2UeepadayBLFyklrvapkzgmc7yfJm/6REkzZ0OW5VLGZ5v0K8e/rYAqoyOSAs+0Jj0niffnYcPsAegFpqAU5iKkkafg2rqnzNqeiWWzmPSe2mjqVITla5I8hQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937893; c=relaxed/simple;
	bh=AdpVzWf/iSEg4CY8RxM9JhdoOUZnrP3eK8KVcPmJkTc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fuqiS14bz6DAOJvqUJF0JN3x+IF92TqE4E/Bm3wgIzSSp3tjIbfAUv0g2rhgKffVwpS4GIxhLsd8Dbdd8uqzTLq1VIq7Fvql8ACwZzGmKwrYSSUVcmu1ViSoQdm3K7zNFTi4GvCUWQMG6TNWf9OIbbZI/CkWvkEQFb1DMb3oKRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n+mbkoiv; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n+mbkoiv"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39143311936so2081561f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745937890; x=1746542690; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A42+m41OcL/e/spEAKjlneIVplUFFprYUT5iY2HFKbA=;
        b=n+mbkoiv74YrQS1sN2CZa3SZWiu1zJUL6NQ5VI960KOD83qBNs0/zoX30PwUjRkAwB
         uKQYH0Dy+e23r7sIp+PUig7KFCAc9XUa3+uOI3yaQgilSazbC7kabeuVGUvKnh7yeIuY
         1VJvyq6FXPRraKnsu8DQNxwChTLglayfXkxnDH92bi2BXRx9ppOaejDei+ATjiA0ukY4
         9U7tMRafO/YAD0bW/3FoVtj+lLOEQb9/a+bmNBzOdZ0eUDCcW8nAE1651zVcSwkBlRJM
         4PEO3cYdWEmLG/e0IYBHwBkGLgugXLgXMLkcMd15zGG1CdjP1TVrMg+0q5saIXknufWx
         DoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937890; x=1746542690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A42+m41OcL/e/spEAKjlneIVplUFFprYUT5iY2HFKbA=;
        b=KqV99cxywgHe3uIUHTnXMhDgL2ipjMH8kKTA8p/RTlSNdWilODr/9hsf+jMI8SlYUd
         zpHhawfLY9syBaEtZWW3K8mA706fmejOV0LPdanbtrv1o3TM0qQFDRbrc9UfHdKJ3RiV
         FQ7UiQFi5/UFxTZAiaQvX3Qe8G8Z0Gn8sqiKin5vJ0GCxJlBa4f9YTt5HXN6Bp0YRyyV
         B+bSe58WAz9943l15VopdWIB2tWJhhB0qWpEiS5DoArULIhqE/c2UhL5hfa6YliK6TtZ
         EfETbS+dsasJCM3CERZ5ZrWVjltBpC0JwdNThjsOmgGwVWs/+DkDC6vC5OMq7Dgk98zl
         ukCw==
X-Forwarded-Encrypted: i=1; AJvYcCWyljdmjUGWpsB0qrWf5xEEmniHCB2Nq+8mLZKws3W0t/5xnxfQ4CxbuGXXvkArIj/7qJbpm0WwBRfohkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGUlktbJP/y+DqcaCCQu3pZl6nXjI6iwjZc5jQzfPTWg9UnKLM
	TVvNblfXF1zUXPkkHS32OrZTJaTQaESngZrUVhtuKuSlZVqVfeh8v5FC5Bvm10wmqLFSPeDRuBN
	DkUN5YVGrYr/htA==
X-Google-Smtp-Source: AGHT+IHhJSK+7koiunSSzcCVzQ77aTvXG1iPV+Hp+spfU9/Yl4M6sM7CtYRYW/0JJQWitygkl9Q//K8CiNm8ifA=
X-Received: from wmhu21.prod.google.com ([2002:a05:600c:a375:b0:43d:1f28:b8bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:18af:b0:39f:e50:af8 with SMTP id ffacd0b85a97d-3a08a35195emr2803148f8f.18.1745937890061;
 Tue, 29 Apr 2025 07:44:50 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:44:25 +0000
In-Reply-To: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3500; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=AdpVzWf/iSEg4CY8RxM9JhdoOUZnrP3eK8KVcPmJkTc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEOXSDpUMekv/1pyCb0+9ojAEvqMM9IZquOAtR
 FVfCW1aQ0eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBDl0gAKCRAEWL7uWMY5
 RmrtD/9sBsZBHn6oUzRnbNq/WOOtkd42Go6fbOgk4zEhQxOolpceVwPJahLf3cFklxRtwDqLFyt
 3XgiDnwa24W6CoZTuIvf7AZtElX8yNyhKDuEGYooVhmmjZEZ4xu3x3o8LTdes7PPh0WJsArljfA
 dfNGUDyf/3qOybY/pHwdBTnlBqK0gkvEVyQC1LAF1jcPLOzEbLRrs299gJx2u5E8oqOubZc+MEf
 kZIMa1azekniBuEguuUo2VIvLUpVDPIqZiS+v2KQmn1Pqejvi7zLkXntK1XhSl7xHvnLKgkKHGS
 MrdoWoBzajGX5bhWS5/8u5gXXKdMwk596pEb+AXIFAARcCaVbMclNMTkNSJ7ivmiQM1JLw+qmyj
 ayueiOn2ZXkTzUJKkC+wFxcWsLRAoSXgs+JjUn4S02pIPwe0gu6IpwSEuEvb5sUZu1+GGmJ3dQ4
 bWUdSeJQZonofi/Y07Q59X0CNCowXsop+88y5mTji/seKD+F8HUDHaspnz0aIONbFbtczK2ykao
 zOVPa6KXqmpmdDhP+uuegBSw39rukri/dbML+Yq895K8I6A8279k1gBpJXG3/g8x1SONOqMgCe9
 +XCvout0xzhhvdmIB9b9rY2oeWjAN7EnOyuAl/74HyB0oyX6z6RbZbblEKaLOUaak3VOm2jYqmY CoHwQ9LbqVSi9pQ==
X-Mailer: b4 0.14.2
Message-ID: <20250429-vec-methods-v4-5-dad4436ff82d@google.com>
Subject: [PATCH v4 5/7] rust: alloc: add Vec::retain
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
index 72bc743ec88bf7b91a0a1ffd9f830cfe4f983ffd..357f5a37c7b1d15b709a10c162292841eed0e376 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -608,6 +608,29 @@ pub fn drain_all(&mut self) -> DrainAll<'_, T> {
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
@@ -1130,3 +1153,52 @@ fn drop(&mut self) {
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
2.49.0.901.g37484f566f-goog

