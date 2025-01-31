Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B5C1C5F08;
	Fri, 31 Jan 2025 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738330337; cv=none; b=T5CO7eI0QD5vmxN5o2Bievl2Rqucqc54FMz5Ycpk9ybv1NIAISrzqG++6FkfUXbnmYqhwVyHJdZO4qFXsCgI/Tw10DED9Br+KdJ90ixQTeQMCR2QvHuFL9XcrTbzYdTJ5ZmEkQzfgbXDoac/Zmox2tJv/MOttkuVZFOsIaQQ4k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738330337; c=relaxed/simple;
	bh=jHpF1BuZ7uj/LCUV3YDDlFLxUILPvoQ+0fRV9/HcuJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQ/11t1LIe+1eH021MxyZ8xuA9Z/fIBER8+l3XdSKEzv8taBMIoxMGbs6D9l3QVe/UPHp9v4UeteR8BkW0WyNMlt8t3vu4HNxEeB+Faud7k9YQ5ADlkfiQfwCjJYT7r6sJtJ1m273nmXzDkvKoPPw8H+x+enGs82YLQbNZTKmlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huBXUyEj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huBXUyEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217B6C4CED1;
	Fri, 31 Jan 2025 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738330335;
	bh=jHpF1BuZ7uj/LCUV3YDDlFLxUILPvoQ+0fRV9/HcuJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=huBXUyEjVVKAL+eSvihoFNaVsPzB1AlK0d/ITTrAu4XoY4ZzLjQRrEJsZPLswFbqm
	 lLa2s0XQwUtLG7JBkhEbQFQCVxswLT/CsDlWRQDhOgQzrEtgjBZer1DAAs4RU2eZ4X
	 HTZBkR8BZPETXyJz/Xp5AcVYbLjsUP/UAGClSsFca090VhRuAnFs0C+o/Hf+O+3MAu
	 naB2+umJqVyHwpRTwrNDFM+fc7uR3bTpWoPaJ4pPei4lkVJ/WKcGAMsVF8yf2CIAxa
	 ga/mk5lB14Oaa/drc2x7h7p/vugy0lamlH3E+okqTuB4BZdswUXtI4+zshif/gheO1
	 7wSU6hNORDlLg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 31 Jan 2025 14:30:09 +0100
Subject: [PATCH 2/4] rust: sync: change `<Arc<T> as
 ForeignOwnable>::PointedTo` to `T`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-configfs-v1-2-87947611401c@kernel.org>
References: <20250131-configfs-v1-0-87947611401c@kernel.org>
In-Reply-To: <20250131-configfs-v1-0-87947611401c@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Christoph Hellwig <hch@lst.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3523; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=jHpF1BuZ7uj/LCUV3YDDlFLxUILPvoQ+0fRV9/HcuJk=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnnNCE4hN1GKXpwFBcbE/AjFXNXsUDuZz20NKHt
 BxIPsSi32WJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ5zQhAAKCRDhuBo+eShj
 d7P+D/9GGJ/ooXfnANlP5KCxqWGPR3A/IgmrYAGCzMMrPDfHh5NSK05dFGgqRYiwNZDbkdUVIcv
 X49IbCeSJKn9m24StFnWyqsApxCR0qaeLTnLG+QeflgYcUHy5qY6LQuY1xe1eULCyREfxT0xp79
 vqhkO6ZDPgvZJSkSW6bRvoS3xNVqbZttatfZEC6Xn8S3NyKWFzweBqPmuTOdUEk54qW7TWTEJQf
 1pHZ5yOiYhxh9c2Pu4EBBQP4PdxjzHNTMYNCzwxI+TSE4wfntvd13GCi8iPBbtMNQCp/7a5UsCb
 PSAY99527e5G5Y5J0uLQAu2KNWshVAdefsIhCnSk9++MMXTR3ksFzhzsWsHXfLXwi7usCbTHIG/
 Oi9E584bWzVf4Nyk/etTIyTp6Szyf7ZfINj/MIJLd9FsAV8fW5BvwD09y+cJToaX9WvtGGDCsmA
 X9hFRAM+eSLFKnHGg6/+XtBlj7LBv+L02ozgYEWgZUBmG8qUI0YCsWoISDLp/19Obtf9wiMi7g5
 oRhC3MMMxqK2ATrzfJHOCLIkon+XKmrxaw3girv5/khVXnDYpMLfprSzE62vnCWoU1pNqrAhr/w
 kvyeZKH/Sbmz7h3dUb2/TLLbGirRhzTVTI5elAZl/vAsN6TrQHBEwkESuxnTOmM8ZTkWtiB3MQY
 AO5Y0jdlJxtm7eQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Using `ArcInner` as `PoinedTo` in the `ForeignOwnable` implementation for
`Arc` is a bit unfortunate. Using `T` as `PointedTo` does not remove any
functionality, but allows `ArcInner` to be private. Further, it allows
downstream users to write code that is generic over `Box` and `Arc`, when
downstream users need access to `T` after calling `into_foreign`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

---

This patch is a dependency for Rust `configfs` abstractions. It allows both
`Box` and `Arc` to be used as pointer types in the `configfs` hierarchy.
---
 rust/kernel/sync/arc.rs | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index dfe4abf82c25cf18398628d9cd5345a292419351..503e318b4c4effa2f1499b6fee0944079fde99aa 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -143,7 +143,7 @@ pub struct Arc<T: ?Sized> {
 #[doc(hidden)]
 #[pin_data]
 #[repr(C)]
-pub struct ArcInner<T: ?Sized> {
+struct ArcInner<T: ?Sized> {
     refcount: Opaque<bindings::refcount_t>,
     data: T,
 }
@@ -345,18 +345,25 @@ pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
 
 // SAFETY: The `into_foreign` function returns a pointer that is well-aligned.
 unsafe impl<T: 'static> ForeignOwnable for Arc<T> {
-    type PointedTo = ArcInner<T>;
+    type PointedTo = T;
     type Borrowed<'a> = ArcBorrow<'a, T>;
     type BorrowedMut<'a> = Self::Borrowed<'a>;
 
     fn into_foreign(self) -> *mut Self::PointedTo {
-        ManuallyDrop::new(self).ptr.as_ptr()
+        let x = ManuallyDrop::new(self).ptr.as_ptr();
+        // SAFETY: `x` is a valid pointer to `Self` so the projection below is
+        // in bounds of the allocation.
+        unsafe { core::ptr::addr_of_mut!((*x).data) }
     }
 
     unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self {
+        // SAFETY: We did the reverse offset calculation in `into_foreign`, so
+        // the offset calculation below is in bounds of the allocation.
+        let inner_ptr = unsafe { kernel::container_of!(ptr, ArcInner<T>, data).cast_mut() };
+
         // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
         // call to `Self::into_foreign`.
-        let inner = unsafe { NonNull::new_unchecked(ptr) };
+        let inner = unsafe { NonNull::new_unchecked(inner_ptr) };
 
         // SAFETY: By the safety requirement of this function, we know that `ptr` came from
         // a previous call to `Arc::into_foreign`, which guarantees that `ptr` is valid and
@@ -365,9 +372,13 @@ unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self {
     }
 
     unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
+        // SAFETY: We did the reverse offset calculation in `into_foreign`, so
+        // the offset calculation below is in bounds of the allocation.
+        let inner_ptr = unsafe { kernel::container_of!(ptr, ArcInner<T>, data).cast_mut() };
+
         // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
         // call to `Self::into_foreign`.
-        let inner = unsafe { NonNull::new_unchecked(ptr) };
+        let inner = unsafe { NonNull::new_unchecked(inner_ptr) };
 
         // SAFETY: The safety requirements of `from_foreign` ensure that the object remains alive
         // for the lifetime of the returned value.

-- 
2.47.0


