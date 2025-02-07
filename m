Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B2923FC50;
	Fri,  7 Feb 2025 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939415; cv=none; b=gG4JP0XngRd7MjcqoGHdw+WSBqqdqSVRgAuvkHPpdC0Uzec8l+0VXiV9gCmPXSvUeiIF1VR3IhvRoNyK9tQEpRdeU6s6BMXPBmYtD9eeXOekrF3yaoJIybjqpkpwPRZUByCJp/+b8pgFZmzcDzUy78ZLDj9ysMRBZLC/B8uQZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939415; c=relaxed/simple;
	bh=ClO8YJIbE9c0gk0c6i4IoClKBab3Gs03jS3vF+MezEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjh2J6evqnb2A6zwRibebD6zHr7UAu7KKwJG2sMchZOlPbjgClqWwQMn73UeNp+CWaQAADa4qyWjWEy9hlSPfGgm1DF2jEWbtbknf4LHyFaO9KlLHxPC3/HibX1p1M2d5Tr3S/aQsBffxyGMtIS8noozE8/3xTOPbBIFnAagi7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2FU8Ef4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2FU8Ef4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCB6C4CEE6;
	Fri,  7 Feb 2025 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738939415;
	bh=ClO8YJIbE9c0gk0c6i4IoClKBab3Gs03jS3vF+MezEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s2FU8Ef4AN/k1wF9iJYtQBeOHGQTMlPOXndusvlEgnkWV/Vg1hla9byeiJQqk1ULI
	 52YvTksPyLvr1YrIluL1Hd6egtnAKUXvwyOSH2fqsXlSrMsP3L7S3pP2+toOOeiZ4g
	 jgUbFJ3l8p6x3flpqgEev6nj7dSLjYC8NHrfIIpWMoC9kBx4gwsB6HWZ6s5FXIudUq
	 VRJCHNemgC04jyK3Cy0qfwJxndde4s+Psf8e+BUlBH6LdALPFaSIYvwhg46xs4bJZn
	 9KGzYn3ojnmzuhnRu1VgO2M4t5abo/kYno/+WF5eWY+VCL1BkjG05/qT9Y/Pe9TDN4
	 z0A7Fl0d8ToEw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 07 Feb 2025 15:41:20 +0100
Subject: [PATCH v2 1/3] rust: sync: change `<Arc<T> as
 ForeignOwnable>::PointedTo` to `T`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-configfs-v2-1-f7a60b24d38e@kernel.org>
References: <20250207-configfs-v2-0-f7a60b24d38e@kernel.org>
In-Reply-To: <20250207-configfs-v2-0-f7a60b24d38e@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Fiona Behrens <me@kloenk.dev>, 
 Charalampos Mitrodimas <charmitro@posteo.net>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3511; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ClO8YJIbE9c0gk0c6i4IoClKBab3Gs03jS3vF+MezEg=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnphvEDxg3kJKt58XmXMM3aeZAbvsDFo99r6efl
 53CEg4r/9GJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6YbxAAKCRDhuBo+eShj
 d6pXD/9sO1Sonhyp/1guztlWX8ZE7lbddkEuuv5maGp0yEGe6jzEu8JBMvTevSU0w2kBwH1pSoR
 ArrOWpS7EWx1XA6hg8oPcd/pz9k92410BAG5DSVDapWNb7tnzw5rUDqwOP56elneHPMkOE6E4hv
 TJS8HzE53Jk1GWqVM+tGGaUKYEIQ5WsfCBQUuH0ifM0x46Cf8qwbjJcztOr2a2OovLiaR6v1wTS
 XLohJ4RiwTpdyoRLIS/tnlVtto8cILZguUIwpuEMPA6dXSbXxxcd78EHQYGZm1rVCKDQm/Me/Me
 zr1SSpzfeKtXcNsoCYT0VyuZgHXh+fdS1HD7HSQ+XCfL8lctC6AkTCGCV8B/3nI8tcHtfbAMfjH
 Ag71mUi7dqnjfDUE9io55qsjVS4fxQY3XlkLdDRXK5VEwJeFf9a/dEuUnRxDjvU0wmb24c9IOar
 d1Ck/knOEFN1N+6LOB1GjSwUYv+3/OiUM7GeUbIVdIp+XFtsr+5aaCxKlfm05Ec27NyufXoF0Lh
 89VJRNH9hUMCt37GBMIpy6afwbjy02Raz1VBfvp4yku6f7mkkds1VmwRoipDEduszikur0L5cA4
 sI/9ftimax8zy6b6G0KdgJkBKHSmW4lmG23lsWwpYO4PEUR+p5eYHIFTcSvbeKp2KGNSoNzs4NB
 RvGS9dx6CPOEoHA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Using `ArcInner` as `PoinedTo` in the `ForeignOwnable` implementation for
`Arc` is a bit unfortunate. Using `T` as `PointedTo` does not remove any
functionality, but allows `ArcInner` to be private. Further, it allows
downstream users to write code that is generic over `Box` and `Arc`, when
downstream users need access to `T` after calling `into_foreign`.

Reviewed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---

This patch is a dependency for Rust `configfs` abstractions. It allows both
`Box` and `Arc` to be used as pointer types in the `configfs` hierarchy.
---
 rust/kernel/sync/arc.rs | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index dfe4abf82c25c..503e318b4c4ef 100644
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


