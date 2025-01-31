Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811DF1F3D36
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354569; cv=none; b=EF4DGT18lDBkt2GiSIS6K/PaEs6GedWuesz9iI5CgkM0xDs8ji9xm4JdSWwOdd2clnpIW2Ez4fzPPWNDgrR6iYrsdNUVZ0aIhnl2FF2Gy7T8aRjiguyRgLs6uRP8p9v4Asuz6s3oiK92iudP1wsJq1sKHMvXLygg7hIfY1+x9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354569; c=relaxed/simple;
	bh=QbeuZzZYzaAjA7Y9SDXeoGE0V6d2lMZNZ4ojTWaKdVU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TCFatHIKtGJSpk6/zJkS0JZszz4uy1mhhqsUP0RI4IFbEJz7fux1s81WAuIvFDCyCY61Rsn9RvDQSZkUnvwWBXF7lomp1oVcKvC9VUX2VXwD2E2sbaQujm06IsOhJGjvnhLlHc7AvyTApB/Au+ml4ynGWNADX7loBJfWZFIB3ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ksOqpHoH; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ksOqpHoH"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38639b4f19cso1444023f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738354566; x=1738959366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VW71bQwjKl2HIpecZg8wq011m/Z0vS1XawvYTWLchIY=;
        b=ksOqpHoHvj9Euga2RzaQ82PsSOmKYvK1VqWhFAMVFzwJlRiLYgbDvSw79x4mscQXUA
         0NWARajPch5xbdjA2xJZGDnV0L2J8Th8D7Asob34NJatoZmyRUDLiADl2frGDNmhgVpL
         VnKbrraNbXS3iX2dI07jk5AaU8LblHn+ah3C0229Kkl/wzfF4KJf+bVbr4OWmQzLMWfE
         IZmamxqk6uYe2N8AWL4V1H0jMa/iQG/0YR+RSC+REciyq2Y60RQ7onZ3ypFUOyPD9D0+
         SqovOmtn25njUI2XlzlVNKSg1e5kjFG/dyFDJFnZ8McGSao7aa/e8BJswSmvV+nsPagU
         ZqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354566; x=1738959366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VW71bQwjKl2HIpecZg8wq011m/Z0vS1XawvYTWLchIY=;
        b=RUvvRNROcYuT3LqmldNNJ/4gYiU/JVmDEOGnzkL1KdWiNBURd9aaLF8zxGnjLiFjI8
         /heGFQ84sf5KQMEK8RcKI7eZ+fnZovqXvNZgGJIjcDguRyd8VdwpP6rmfbY8Kw2+pTFk
         4HVAwaOweN7E6fOXOIfueabpWP6i69irC59V+Lloqc5wrdut8YZYmVPe8KGUAeetTUnd
         xDB+CgQPUtGgyIAi0QEALpUde/L4jNrC8dIQSC2pwh7lTkYYCqjZcO408hR4QHfVir2k
         NGh45BK6GDWAn10hiJR2mGOwfejjArOcaVjRh1bioSYWNoCXf85P078X5o6K/V586VzA
         8kCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc9ur24WC3DGkYjtYX1oktvxYE6jmvRgTaG0tPUXaCV+T8hvK4JZKPGr7l6sFw+pDYRQR/y+eKhY1XNDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyryf9iPLw82gS7ynZZin05GcmZbQ5oTegAXiZ6yuft7BMpMOuy
	eyCP3paVNN7AOBxQepnFI4CZH2cpbcw0n1UDvba9PIspY6y39L1QmrftvmiSIoNLmhqDSfUlu73
	XCXXWi7gRlg4ZSw==
X-Google-Smtp-Source: AGHT+IGBd1o+FUP4LT+phF1aV8/Ej8Md0JgOxyv83FeTv1wHQxFpfkB3hsMAjyV31AGxmqh+TRC+nUDoQZMYopc=
X-Received: from wruq12.prod.google.com ([2002:a5d:658c:0:b0:38b:da0a:5fe3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:598c:0:b0:38a:50f7:24fa with SMTP id ffacd0b85a97d-38c520a682bmr13501477f8f.54.1738354565780;
 Fri, 31 Jan 2025 12:16:05 -0800 (PST)
Date: Fri, 31 Jan 2025 20:15:50 +0000
In-Reply-To: <20250131-cursor-between-v6-0-603bdc7d4449@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250131-cursor-between-v6-0-603bdc7d4449@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5247; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QbeuZzZYzaAjA7Y9SDXeoGE0V6d2lMZNZ4ojTWaKdVU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnnS+A0q5Ot6ctE6cwwV03E/1CIoRlG1UUnK/nT
 iijIz7ZkzuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ50vgAAKCRAEWL7uWMY5
 RowtEACsjSIktsZqM4Bst//5krkI014uMAgTc0zZ4mdnbzjf8/WfIQSLYvTHJ6JfXsF/KQ7DNey
 qyNOjQKx8xPEoWV+iL8n0hBGdykbEqenEmApROlKT0CRiUiKpooO35cz5BmJcCD0kBHKN4Ndlv0
 LqzxdXWWWLhAR1E+tJkOxMd2lL+cWLKJDze+ovpC4rmwUPQJ/BC2E8WruLKkZTJnyIP0QNKnAPE
 x5V6walH56VArIAt7TNQylqeV8y0HZW8DfIBzKy0e9QEpClGujY6dno6ppQtH3Uo2ZA0sZ0yzy1
 doYAOje9rorDKTr3gq7ndKAVQjeRjqAq2c4PoM5wdy9fp2qK0Dx6V3ona6CIrW54nN+lkKGM26U
 ZDFkiJa/Oo9ZHv4ysRASUeEP6G32kHP/y8KW7Zpr6finq7ekNgKCAAo8AP55qp/nTvbhQX/JKgT
 UH8fOFMzjrCBaQTknIgGuIQoe9kSGjTZBfMxZNNa21fa9tYUW+kQoCugk31YkesParTN4x1oI5k
 ivRYuunfURBt8x9wgARpOxixsDVnrnR077lr6eSX1HUktRDdkdjl95uX3Gn/n0sclH7/fur17n8
 B9MfHs2VzII8wkKMMDIH6jShx4Vvj/tgxFSwpFuIMe2ZG44fibbmXDo3nMyInZDOZza1LMQdmKN uxmlNdI46aT1neg==
X-Mailer: b4 0.13.0
Message-ID: <20250131-cursor-between-v6-1-603bdc7d4449@google.com>
Subject: [PATCH v6 1/2] rust: list: extract common code for insertion
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
2.48.1.362.g079036d154-goog

