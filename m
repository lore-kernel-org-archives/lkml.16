Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D51C8FD6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181254; cv=none; b=m77G/Y/pkSOCKJ7bc5T9nV+nTj0WDQR+y/hK1iIiY78P29/CNEizwOt0T/x3ngtJv9PaJvfgrLu73l2gnOrMznKzmUsLxpqqGSysxJH2mZm6+4nedCU/sC3tqbQnUpCr/I5LD4vF8/7AcqcyiMVtXJdkim8reSMIplTB4LU3+fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181254; c=relaxed/simple;
	bh=q2MIIkWvFGpnW2y+D9w5SXFpqVQT/+2RyqA+9oXqSpw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qixWedyNqfnnrJ5aE8BzIXp1DX0gwRahWCDtFaEY/n+VhGoD2v0MMnJI7Q6C1kErX1sukkL2PLBSX+NQad+dJCrMFn476vd9A/MMaGUQDzTYuaER6LZcTwyfO49D4/JEZw0tPabokQ6ewbymiZGxwOjIrEZXfKU2o8Pd/zCOdMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HRroQG05; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HRroQG05"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38dd5031ee7so690190f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739181250; x=1739786050; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=19LPWxQwPLnoPvSYWbbaFeo4Fqk8TAPkgblR6XyorN0=;
        b=HRroQG05I142blCQhyZbsMCQ6Z6Qd4nqLx+yAHK+TkHVdipSAhYofcpap2ImZxiR1q
         yYaRX6XqWJ0HWNURCSVQJ4bF6Ea5RoK+D0b47sOd4sO7QcTCKo6wCQPMRbUD+vHd2BfL
         d2HwZ2Y1v5mNF2pzNpHxomYWFtOyiEZP9e7f4DKllcz6p739vj6Qah9zH6nYjcd5X8wE
         NXCM4RRSUnU8yFaRe5k0vZG4NE+Ovi3VuzJ3qpELwpQDowMACbKkVAjm8QTFD9kQ1zPE
         8to7T5Afwykgxn7GC211zrNiNEIMRh32Ms/V23h/a1+EOy8kz266rLr5a2dKOh/2lLiN
         wAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181250; x=1739786050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19LPWxQwPLnoPvSYWbbaFeo4Fqk8TAPkgblR6XyorN0=;
        b=SwZsGaDx0WKjXRsQl+uZDu+a8R+ZXb0axMJ6V2XWKLjhp5csa79rKYQsgNV6Y6YmNN
         xReBYHsDBJJvpg/NDuYJbpjBVVYmp+HjTjcCKzMs9RwbxCc493/pfnLZHeJ0e5mKhH/N
         42wGKob2QoToD4YIm0FLLkpNRhv/2xUTGMxKeYJD845wZ2inLG4clT/jA/nZzb043I5R
         NaP3NexYZ9M7IRwq3lhPB7JoXjUQ4926PuDa84eI3SAGZhlGMIGgsdNzV60wc2dgOWxx
         rsjCq2viE/GNgYgXwDnDQXOXmDh1eJ9hfOiDXnuIwnm4JepKQVfvX4MTvsFUmTqh5xSW
         C4IA==
X-Forwarded-Encrypted: i=1; AJvYcCVQG+zJoi/sVt9+buoGcvCc5RFdoeoX8WTz2JnvtTjSqVWyrsCwKSf79f8iiKYykDD8dd8xdNugJp8FAZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBwaWrw1vssY0waLoJ8Ludurm9Hxr/PjSaLVbPRwtcBj4nkC7t
	6gfPgkyKS11ZoP7fBwesyIL0TZDcBC5AeAKfQq7b/g6GH3IKHkxK8lMZs9pM1hM6PYTnTzRf/gT
	iXotgXtiXSzWNSQ==
X-Google-Smtp-Source: AGHT+IGhcr1Yo66ORkJYF6hDunNWep8P06MZMX1OedmhVGxDa9+nHg4zw8+tjIWq0v24w89a5t99hxQQEMGgo7I=
X-Received: from wmsp33.prod.google.com ([2002:a05:600c:1da1:b0:439:485a:8775])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1865:b0:385:e105:d884 with SMTP id ffacd0b85a97d-38dc9371e85mr9663719f8f.46.1739181250753;
 Mon, 10 Feb 2025 01:54:10 -0800 (PST)
Date: Mon, 10 Feb 2025 09:53:35 +0000
In-Reply-To: <20250210-cursor-between-v7-0-36f0215181ed@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250210-cursor-between-v7-0-36f0215181ed@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5247; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=q2MIIkWvFGpnW2y+D9w5SXFpqVQT/+2RyqA+9oXqSpw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnqcy7IWwPmEzrMiPnrP/71ochHUmadaVFiAnSb
 TFkWwQH5UaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6nMuwAKCRAEWL7uWMY5
 RkqhD/9ItzaKTVMEsfS+SVzg7EZaZa+l32ci9rcfyYKPNEHEPgZEi7QA2bvxi61oQSIl/FwGm5r
 KG2RsQ0Stp0w9FQ9lVuD2dNafDgk5dSjUz+wYAQlrghKq7sqe2dtQsVCX+TgOMImiv8d/T0BQyo
 WkxBv6eSutFIhyxnwXGlFMXPBFPrFOdjmxoYNdcrsJaXoSCqIcd7noKFjcyKWQiqqMJUd/bTvP1
 ShPVwkTdeLOGVtUsdKGNplxwYkw5gL3lBURGUEjrnrnrN+EGRbLb6BhptxMPXCStyyG1q/Ux9M1
 RT0KYZcv6qsqctLgtOcaNw8ZUXYeiYQ9n9jTg3L6+tOUDH+cWriU3lH5Tq+xWSwg4lRAN7hwe52
 YLH4kF4x9pmGBsO2yzoDItdTSDNIMuWPQXG8hxEOcQ30qfAK9BJrpVWVy0rr7KAy7S2BFenAvjq
 KGpDTUE59B44zeKdoUmSzpSRWM0+FbVbVSpQdprNbakwANldLodBUApq1Cp1xljTdO3o8sXBT44
 WKvFzq77WG51/XNajaiB3ra/avagh2wlhgMFwDXbSICFlBJsflqm4QQ7DCzCZgpxC7SFrhD1z7L
 PXSMNsqcqVQlX8owulxMSbe7fddYObjL5lPzsb/bOCZ1ULhbG7GD3HmfgTelwPpUhSqxwMN5G31 JGUiKh31ZV98ldA==
X-Mailer: b4 0.13.0
Message-ID: <20250210-cursor-between-v7-1-36f0215181ed@google.com>
Subject: [PATCH v7 1/2] rust: list: extract common code for insertion
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To prepare for a new cursor API that has the ability to insert elements
into the list, extract the common code needed for this operation into a
new `insert_inner` method.

Both `push_back` and `push_front` are updated to use the new function.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 70 ++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index fb93330f4af4..97b3599b7207 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -245,8 +245,20 @@ pub fn is_empty(&self) -> bool {
         self.first.is_null()
     }
 
-    /// Add the provided item to the back of the list.
-    pub fn push_back(&mut self, item: ListArc<T, ID>) {
+    /// Inserts `item` before `next` in the cycle.
+    ///
+    /// Returns a pointer to the newly inserted element. Never changes `self.first` unless the list
+    /// is empty.
+    ///
+    /// # Safety
+    ///
+    /// * `next` must be an element in this list or null.
+    /// * if `next` is null, then the list must be empty.
+    unsafe fn insert_inner(
+        &mut self,
+        item: ListArc<T, ID>,
+        next: *mut ListLinksFields,
+    ) -> *mut ListLinksFields {
         let raw_item = ListArc::into_raw(item);
         // SAFETY:
         // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
@@ -259,16 +271,16 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
         // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
         let item = unsafe { ListLinks::fields(list_links) };
 
-        if self.first.is_null() {
-            self.first = item;
+        // Check if the list is empty.
+        if next.is_null() {
             // SAFETY: The caller just gave us ownership of these fields.
             // INVARIANT: A linked list with one item should be cyclic.
             unsafe {
                 (*item).next = item;
                 (*item).prev = item;
             }
+            self.first = item;
         } else {
-            let next = self.first;
             // SAFETY: By the type invariant, this pointer is valid or null. We just checked that
             // it's not null, so it must be valid.
             let prev = unsafe { (*next).prev };
@@ -282,45 +294,27 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
                 (*next).prev = item;
             }
         }
+
+        item
+    }
+
+    /// Add the provided item to the back of the list.
+    pub fn push_back(&mut self, item: ListArc<T, ID>) {
+        // SAFETY:
+        // * `self.first` is null or in the list.
+        // * `self.first` is only null if the list is empty.
+        unsafe { self.insert_inner(item, self.first) };
     }
 
     /// Add the provided item to the front of the list.
     pub fn push_front(&mut self, item: ListArc<T, ID>) {
-        let raw_item = ListArc::into_raw(item);
         // SAFETY:
-        // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
-        // * If this requirement is violated, then the previous caller of `prepare_to_insert`
-        //   violated the safety requirement that they can't give up ownership of the `ListArc`
-        //   until they call `post_remove`.
-        // * We own the `ListArc`.
-        // * Removing items] from this list is always done using `remove_internal_inner`, which
-        //   calls `post_remove` before giving up ownership.
-        let list_links = unsafe { T::prepare_to_insert(raw_item) };
-        // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
-        let item = unsafe { ListLinks::fields(list_links) };
+        // * `self.first` is null or in the list.
+        // * `self.first` is only null if the list is empty.
+        let new_elem = unsafe { self.insert_inner(item, self.first) };
 
-        if self.first.is_null() {
-            // SAFETY: The caller just gave us ownership of these fields.
-            // INVARIANT: A linked list with one item should be cyclic.
-            unsafe {
-                (*item).next = item;
-                (*item).prev = item;
-            }
-        } else {
-            let next = self.first;
-            // SAFETY: We just checked that `next` is non-null.
-            let prev = unsafe { (*next).prev };
-            // SAFETY: Pointers in a linked list are never dangling, and the caller just gave us
-            // ownership of the fields on `item`.
-            // INVARIANT: This correctly inserts `item` between `prev` and `next`.
-            unsafe {
-                (*item).next = next;
-                (*item).prev = prev;
-                (*prev).next = item;
-                (*next).prev = item;
-            }
-        }
-        self.first = item;
+        // INVARIANT: `new_elem` is in the list because we just inserted it.
+        self.first = new_elem;
     }
 
     /// Removes the last item from this list.

-- 
2.48.1.502.g6dc24dfdaf-goog

