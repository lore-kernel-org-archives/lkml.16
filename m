Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2989326980F;
	Wed,  9 Apr 2025 14:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209815; cv=none; b=JTlCCC6ZW6tv7xQleQDCVT8On1M7EWJObE1+mZ9OYhDiDevMZIx8gpRuYmd0dymaj9RIpOJChSTrR8Zwa1MnLlVwbT4TAzPT1D6NEhz83Keg5ynXrZ4CpxluIlA7f1h5q51mL/RMUb7JcUseF0drfcTVXDDUSfPNzR7RwwfWqfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209815; c=relaxed/simple;
	bh=55xj2dep3MokLpLRxr+nyhMZKrz7iW75JqqR6hPoPhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L29ItFsFYrd4S6ZZSp3mzSGsyRnj15euKDyp+/6R+8NyAHRK63iZkEGJhth84/El3wMtn09Ek4582jF3IMBXBFhX0ULvFoL/uI8MG7fzTRgSRxVIrEFlPCHl+XQMFSZV/Eve4cf/DP3v/XR1cv6cbpgRkP3vha2k767AanmwBOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/+sm7rC; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/+sm7rC"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5e2fe5f17so675980485a.3;
        Wed, 09 Apr 2025 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744209812; x=1744814612; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXjtjSGRBJAecGZkTORy/ykoAp22kdkGcCUZ52AKfbI=;
        b=a/+sm7rCPIx0pOrWTBi200zl9vJmpSjYwl71/gXLRgFpfq1dwDYgvVtsoeS8ojWYZc
         PO30l1LZGwMc+56KG+DkoD7RQDD8mfOfSb/5j3/Bd43HKsNcr84sKbdLK47/YhNKQYwB
         /tD3Feo5LekCynxWVB9/wEDJ3jdgjaaanBS8ql4CMxPhpJ3ULSX3Eaw3Cpp75Tig+vYi
         g9goTYdQV5FsCD0j5fnRI+sdfIa/A7zmwumSkZ8Z2cloRcMZ/RDq1lVRPkJa7gmo543S
         IlBNZmXjy6C+Pl3cbVYnfgeJqhRHX3PUri4T01rkWuxbA6jAARzCjS6rP2a4UZxTfZHn
         s/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209812; x=1744814612;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXjtjSGRBJAecGZkTORy/ykoAp22kdkGcCUZ52AKfbI=;
        b=N4KmEzNlymmNIoSwvmBSABFtR3rUulJiZNaPwSRooR5jC+Sv9SvX5bCaVokC6DvJ4v
         oaW3SjH3D48tnZbyqDFPapNn52tPd+Q4JywsqY0GNYSJFJB8LY3HCCOrBXkobKbOE48Z
         uHvH8TIP0xTrqSJ2BFbjLSftSCPvYpTUaytnZeuwqXNhDv8EBfUsgoHJfBYqo5wLh/qX
         1ebYuMF+5px/9a6idgIqLXc3IRBGTi2reRnjDjHYNnvFJ/AdPFFXfXkwfQ5J+YBok4Y8
         kGQg5kC3b6yPmvqpNlCVD/hVJazqVRSQ+E4oEKBqH3WKUdpRnZe4BT7pmBG8flb5m6Bn
         svOg==
X-Forwarded-Encrypted: i=1; AJvYcCWeA94WxgpXo/s5BT5a8nfuuAZnErS0rufRuAQoAqA3Sye7W+1jJZnpAl1eeHGXMfBa3PzkBXK4JUVvNhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQbeTH38p2WxyVO7oaD4AexZAeezJqGpKTypQ3gEcKSMsaUSTH
	Mp81gmgAOimBwLPdvWX6ieTlPTMPWH+85g2B5q7/9hljG1bpxas/
X-Gm-Gg: ASbGnctlh1iFP2ddisi3usmij4euVDNE7zK4WOQ2+erO16M/q2chprDwfEkxs9FUrGd
	B6aWvUWg4rS/7TTgtlHu5KtxkCHywHA4TalWbTsze2xEmTRIe6a0U9abbFnFv1gbWqGfQKRA9aR
	rfZRois9vLjWaiEeGLF//XNV+2QNaNKXt8stjTlJodqZ5woUeDDsn3Txu2Ofi6WPneJkojW3gGR
	LLZC/RDAam5IpKzJuz3kDwypL4mCsg3ykdRSW8RXdSNvdX/R2nBzGskWbkPmEFTyQwq2cD4neL5
	BAgxodb2CQ7eafmWSyKWMaSe5Uzck9LkP1nDujalP+9ABAk8n7FCOC1YYLLzovx43iXx3bR9a65
	K2GMe/wyT5oJ6ROgojShCH1L5soeC38QVKP/CQFFESj4S
X-Google-Smtp-Source: AGHT+IE6AFyUXyEIT9EnJhREUPE9hpaInNQlNF10dFxnM4HagCVj0WgYnGLNPolh10kXeKG6yflvcg==
X-Received: by 2002:a05:620a:454e:b0:7c7:95ee:77bf with SMTP id af79cd13be357-7c79cbd19a2mr430038585a.19.1744209811740;
        Wed, 09 Apr 2025 07:43:31 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:3298])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a11e6c1dsm79816085a.108.2025.04.09.07.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:43:31 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Apr 2025 10:43:16 -0400
Subject: [PATCH] rust: retain pointer mut-ness in `container_of!`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIOH9mcC/x3MPQqAMAxA4atIZgP1D9SriEO1UTOYSqMiFO9uc
 fyG9yIoBSaFPosQ6GZlLwlFnsG8WVkJ2SVDacrG1KbD2ctpWSigX3C/TiFVnIqmcnaqq7Z1kNI
 j0MLPvx3G9/0AFL1lgmYAAAA=
X-Change-ID: 20250409-container-of-mutness-b153dab4388d
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Avoid casting the input pointer to `*const _`, allowing the output
pointer to be `*mut` if the input is `*mut`. This allows a number of
`*const` to `*mut` conversions to be removed at the cost of slightly
worse ergonomics when the macro is used with a reference rather than a
pointer; the only example of this was in the macro's own doctest.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
This patch is extracted from 3 other series to reduce duplication.
---
 rust/kernel/lib.rs    |  5 ++---
 rust/kernel/rbtree.rs | 23 ++++++++++-------------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de07aadd1ff5..1df11156302a 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -190,7 +190,7 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 /// }
 ///
 /// let test = Test { a: 10, b: 20 };
-/// let b_ptr = &test.b;
+/// let b_ptr: *const _ = &test.b;
 /// // SAFETY: The pointer points at the `b` field of a `Test`, so the resulting pointer will be
 /// // in-bounds of the same allocation as `b_ptr`.
 /// let test_alias = unsafe { container_of!(b_ptr, Test, b) };
@@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 #[macro_export]
 macro_rules! container_of {
     ($ptr:expr, $type:ty, $($f:tt)*) => {{
-        let ptr = $ptr as *const _ as *const u8;
         let offset: usize = ::core::mem::offset_of!($type, $($f)*);
-        ptr.sub(offset) as *const $type
+        $ptr.byte_sub(offset).cast::<$type>()
     }}
 }
 
diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 5246b2c8a4ff..8d978c896747 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -424,7 +424,7 @@ pub fn cursor_lower_bound(&mut self, key: &K) -> Option<Cursor<'_, K, V>>
         while !node.is_null() {
             // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
             // point to the links field of `Node<K, V>` objects.
-            let this = unsafe { container_of!(node, Node<K, V>, links) }.cast_mut();
+            let this = unsafe { container_of!(node, Node<K, V>, links) };
             // SAFETY: `this` is a non-null node so it is valid by the type invariants.
             let this_key = unsafe { &(*this).key };
             // SAFETY: `node` is a non-null node so it is valid by the type invariants.
@@ -496,7 +496,7 @@ fn drop(&mut self) {
             // but it is not observable. The loop invariant is still maintained.
 
             // SAFETY: `this` is valid per the loop invariant.
-            unsafe { drop(KBox::from_raw(this.cast_mut())) };
+            unsafe { drop(KBox::from_raw(this)) };
         }
     }
 }
@@ -761,7 +761,7 @@ pub fn remove_current(self) -> (Option<Self>, RBTreeNode<K, V>) {
         let next = self.get_neighbor_raw(Direction::Next);
         // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
         // point to the links field of `Node<K, V>` objects.
-        let this = unsafe { container_of!(self.current.as_ptr(), Node<K, V>, links) }.cast_mut();
+        let this = unsafe { container_of!(self.current.as_ptr(), Node<K, V>, links) };
         // SAFETY: `this` is valid by the type invariants as described above.
         let node = unsafe { KBox::from_raw(this) };
         let node = RBTreeNode { node };
@@ -806,7 +806,7 @@ fn remove_neighbor(&mut self, direction: Direction) -> Option<RBTreeNode<K, V>>
             unsafe { bindings::rb_erase(neighbor, addr_of_mut!(self.tree.root)) };
             // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
             // point to the links field of `Node<K, V>` objects.
-            let this = unsafe { container_of!(neighbor, Node<K, V>, links) }.cast_mut();
+            let this = unsafe { container_of!(neighbor, Node<K, V>, links) };
             // SAFETY: `this` is valid by the type invariants as described above.
             let node = unsafe { KBox::from_raw(this) };
             return Some(RBTreeNode { node });
@@ -912,7 +912,7 @@ unsafe fn to_key_value_mut<'b>(node: NonNull<bindings::rb_node>) -> (&'b K, &'b
     unsafe fn to_key_value_raw<'b>(node: NonNull<bindings::rb_node>) -> (&'b K, *mut V) {
         // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
         // point to the links field of `Node<K, V>` objects.
-        let this = unsafe { container_of!(node.as_ptr(), Node<K, V>, links) }.cast_mut();
+        let this = unsafe { container_of!(node.as_ptr(), Node<K, V>, links) };
         // SAFETY: The passed `node` is the current node or a non-null neighbor,
         // thus `this` is valid by the type invariants.
         let k = unsafe { &(*this).key };
@@ -1021,7 +1021,7 @@ fn next(&mut self) -> Option<Self::Item> {
 
         // SAFETY: By the type invariant of `IterRaw`, `self.next` is a valid node in an `RBTree`,
         // and by the type invariant of `RBTree`, all nodes point to the links field of `Node<K, V>` objects.
-        let cur = unsafe { container_of!(self.next, Node<K, V>, links) }.cast_mut();
+        let cur = unsafe { container_of!(self.next, Node<K, V>, links) };
 
         // SAFETY: `self.next` is a valid tree node by the type invariants.
         self.next = unsafe { bindings::rb_next(self.next) };
@@ -1216,7 +1216,7 @@ pub fn get_mut(&mut self) -> &mut V {
         // SAFETY:
         // - `self.node_links` is a valid pointer to a node in the tree.
         // - We have exclusive access to the underlying tree, and can thus give out a mutable reference.
-        unsafe { &mut (*(container_of!(self.node_links, Node<K, V>, links).cast_mut())).value }
+        unsafe { &mut (*(container_of!(self.node_links, Node<K, V>, links))).value }
     }
 
     /// Converts the entry into a mutable reference to its value.
@@ -1226,7 +1226,7 @@ pub fn into_mut(self) -> &'a mut V {
         // SAFETY:
         // - `self.node_links` is a valid pointer to a node in the tree.
         // - This consumes the `&'a mut RBTree<K, V>`, therefore it can give out a mutable reference that lives for `'a`.
-        unsafe { &mut (*(container_of!(self.node_links, Node<K, V>, links).cast_mut())).value }
+        unsafe { &mut (*(container_of!(self.node_links, Node<K, V>, links))).value }
     }
 
     /// Remove this entry from the [`RBTree`].
@@ -1239,9 +1239,7 @@ pub fn remove_node(self) -> RBTreeNode<K, V> {
         RBTreeNode {
             // SAFETY: The node was a node in the tree, but we removed it, so we can convert it
             // back into a box.
-            node: unsafe {
-                KBox::from_raw(container_of!(self.node_links, Node<K, V>, links).cast_mut())
-            },
+            node: unsafe { KBox::from_raw(container_of!(self.node_links, Node<K, V>, links)) },
         }
     }
 
@@ -1272,8 +1270,7 @@ fn replace(self, node: RBTreeNode<K, V>) -> RBTreeNode<K, V> {
         // SAFETY:
         // - `self.node_ptr` produces a valid pointer to a node in the tree.
         // - Now that we removed this entry from the tree, we can convert the node to a box.
-        let old_node =
-            unsafe { KBox::from_raw(container_of!(self.node_links, Node<K, V>, links).cast_mut()) };
+        let old_node = unsafe { KBox::from_raw(container_of!(self.node_links, Node<K, V>, links)) };
 
         RBTreeNode { node: old_node }
     }

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250409-container-of-mutness-b153dab4388d

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

