Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014001F3FEC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940546; cv=none; b=qij7SGNuK6SolrjZUsjo6/nFz5gg5XJdrPkEDDz62YA58cycFAFMaSU5K00Euv6WAw2hcB0im0UKc3Vs30djpCUNzZa8R237bXyZbU3qerpZTmfM0ycczQjVmBe+LKZLqBCrSGPX7DFGrrDozu/D3ivYeo3pS1Wk3bT4TqorX5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940546; c=relaxed/simple;
	bh=ixPIHyOir8cPjkZjuNzSYJZCzjhxKzBneRBShXgOp7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2xvuPqh9AoatABOS7vaD1HZenWMXvSrk3bXUpp2l3rZFyOPWf8ayz0MPYTRRgSXwOZWBQO+tWFHFgRyRJIqdkuWzMKY8aqHUgghlb8te5N8R1j00Fr4UPhAhR2c8mmqaRVxSFgpd/9pkeBBRWqkQ8mtmYzXltrcUTh0d+sF8PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=lFfyUE45; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="lFfyUE45"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ff1e375a47so12312657b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940544; x=1745545344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwxScseOQw1FlOZC8ZbLSlfG5B8Iqept6klH4FSUhoA=;
        b=lFfyUE45HqFgqwImf5FQWOUX9q38b9SGO142kRSgfq6sO5TF3K6oWPLyVIigKbNeHL
         0pOQFQ/E359NJ5/obfKtvxKCaB4fHKBijZFJgL0z5WwPBE1Huov7DwyUB5IM05T3WCUr
         6Hh1An52e/2+pCplVvZI97bHoFXbPgGe9wiKIKc9ZjtQuca4t9z7Z3Oc0vT3VXM6Rwda
         ayayQ9rPTZrBNhYuhLQsP09s6nEREcxardSO8lBkGo/eY8vJhcyCiA1zXjNcxMxPAA5q
         AqOD/Qyw+H2zDBxs6fV4ocNQO2DZAy207OaQgsGNScbqq32JrG8UvzbEulthNQF743EZ
         k9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940544; x=1745545344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwxScseOQw1FlOZC8ZbLSlfG5B8Iqept6klH4FSUhoA=;
        b=JKc65cN5i4Gkp4BcrJHXWDT0EbqsEO9C3gpVKx0cPUmRMcm5R+aCDy0/BrKC28imp1
         /6DAGGJfmXFpoIz715zwsLoPxT4PBwvHLD92JE/x9RTHWQ6vyILb4JiMEV8gLF2+KIZb
         U7/slFs/hberRI3Bg5T3hQZaEbKmuChy5KOalwPu7SPbW/ZNt08pedC5B9ISCdkQrewh
         NXdhRH7iYEBQBJTTxtQp/sBlLQcrjXIyqVT1JnPuw1ESSws7LUmYrVV8jRdmdbkevJzn
         2QvIio6YyQbCdLO1HaKx1WaIzJttlcvsA7ol2sqgP2vIY/5CXVza3tqRB2FPn1avuPm3
         uI1A==
X-Forwarded-Encrypted: i=1; AJvYcCXIgwTjHMgZwrPwOFD+xairIlm/JXWSOgGRUd1wxdJtDEZ3pIAEQFmW6Ybhe5Hym0BftcNWHDwtSSJzYgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7U+E+qZ2IKQXiWJKUHmpDMEQ3hCnFSN6XLGG1v5WkaHjonAjI
	h/y/I3l/N6yJOOcoM1ZVRnB0TIVq3ewu/DA5Wwc779f42+MeS9MYzy8Fd1Pxqmk=
X-Gm-Gg: ASbGnctcMsr/vZIy5+YNVXcLqPqZKjBnHb+EneoregBId2zBfq2oZZjEqHvfIGE8rVw
	/cX/aShGAUgtDVSzK9Kj4ZyWq1/hujiGWPzUymobKfrU22aPapUfonj/xixhJvhzjUI3/yAb/1U
	K6WXUcVr91Ifbl4jNWoW42CQeKsFGugYbSLeVA4p6VILHFQy6lKnX+LINjZji54ae97rPsKgquu
	dVngQ+UhDlv5xGAXF0J0UfOPGHp/4Xj8yXg24Po4S0asKKZNJgfgj3nd5RMbz9cMdV/LsuUwcCw
	cd1MseMBUfJqYvmvDHKw8BLtKhBUQ4Pb+tzcloS61It07pdSAqWVUruzD5iVvovKa6HqLj+uRNV
	tvk0uXUmaOoPwn6YJ3GLL4ca+muZeXb3k72VH
X-Google-Smtp-Source: AGHT+IHwJejReAjzu7zp5ph/fNbSSOSO8a6C6bk5Grburt5rknFWefJSbxGkwUM9NLgxy5QvPNkyGg==
X-Received: by 2002:a05:690c:9b0a:b0:702:5689:356e with SMTP id 00721157ae682-706cccfcef6mr16287377b3.12.1744940543891;
        Thu, 17 Apr 2025 18:42:23 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:23 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/18] rust: rbtree: refactor to use `&raw mut`
Date: Thu, 17 Apr 2025 21:41:29 -0400
Message-ID: <20250418014143.888022-9-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of_mut!(place)`
with `&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/rbtree.rs | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 5246b2c8a4ff..04dbbeb8318d 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -11,7 +11,7 @@
     cmp::{Ord, Ordering},
     marker::PhantomData,
     mem::MaybeUninit,
-    ptr::{addr_of_mut, from_mut, NonNull},
+    ptr::{from_mut, NonNull},
 };
 
 /// A red-black tree with owned nodes.
@@ -238,7 +238,7 @@ pub fn values_mut(&mut self) -> impl Iterator<Item = &'_ mut V> {
 
     /// Returns a cursor over the tree nodes, starting with the smallest key.
     pub fn cursor_front(&mut self) -> Option<Cursor<'_, K, V>> {
-        let root = addr_of_mut!(self.root);
+        let root = &raw mut self.root;
         // SAFETY: `self.root` is always a valid root node
         let current = unsafe { bindings::rb_first(root) };
         NonNull::new(current).map(|current| {
@@ -253,7 +253,7 @@ pub fn cursor_front(&mut self) -> Option<Cursor<'_, K, V>> {
 
     /// Returns a cursor over the tree nodes, starting with the largest key.
     pub fn cursor_back(&mut self) -> Option<Cursor<'_, K, V>> {
-        let root = addr_of_mut!(self.root);
+        let root = &raw mut self.root;
         // SAFETY: `self.root` is always a valid root node
         let current = unsafe { bindings::rb_last(root) };
         NonNull::new(current).map(|current| {
@@ -459,7 +459,7 @@ pub fn cursor_lower_bound(&mut self, key: &K) -> Option<Cursor<'_, K, V>>
         let best = best_match?;
 
         // SAFETY: `best` is a non-null node so it is valid by the type invariants.
-        let links = unsafe { addr_of_mut!((*best.as_ptr()).links) };
+        let links = unsafe { &raw mut (*best.as_ptr()).links };
 
         NonNull::new(links).map(|current| {
             // INVARIANT:
@@ -767,7 +767,7 @@ pub fn remove_current(self) -> (Option<Self>, RBTreeNode<K, V>) {
         let node = RBTreeNode { node };
         // SAFETY: The reference to the tree used to create the cursor outlives the cursor, so
         // the tree cannot change. By the tree invariant, all nodes are valid.
-        unsafe { bindings::rb_erase(&mut (*this).links, addr_of_mut!(self.tree.root)) };
+        unsafe { bindings::rb_erase(&mut (*this).links, &raw mut self.tree.root) };
 
         let current = match (prev, next) {
             (_, Some(next)) => next,
@@ -803,7 +803,7 @@ fn remove_neighbor(&mut self, direction: Direction) -> Option<RBTreeNode<K, V>>
             let neighbor = neighbor.as_ptr();
             // SAFETY: The reference to the tree used to create the cursor outlives the cursor, so
             // the tree cannot change. By the tree invariant, all nodes are valid.
-            unsafe { bindings::rb_erase(neighbor, addr_of_mut!(self.tree.root)) };
+            unsafe { bindings::rb_erase(neighbor, &raw mut self.tree.root) };
             // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
             // point to the links field of `Node<K, V>` objects.
             let this = unsafe { container_of!(neighbor, Node<K, V>, links) }.cast_mut();
@@ -918,7 +918,7 @@ unsafe fn to_key_value_raw<'b>(node: NonNull<bindings::rb_node>) -> (&'b K, *mut
         let k = unsafe { &(*this).key };
         // SAFETY: The passed `node` is the current node or a non-null neighbor,
         // thus `this` is valid by the type invariants.
-        let v = unsafe { addr_of_mut!((*this).value) };
+        let v = unsafe { &raw mut (*this).value };
         (k, v)
     }
 }
@@ -1027,7 +1027,7 @@ fn next(&mut self) -> Option<Self::Item> {
         self.next = unsafe { bindings::rb_next(self.next) };
 
         // SAFETY: By the same reasoning above, it is safe to dereference the node.
-        Some(unsafe { (addr_of_mut!((*cur).key), addr_of_mut!((*cur).value)) })
+        Some(unsafe { (&raw mut (*cur).key, &raw mut (*cur).value) })
     }
 }
 
@@ -1170,7 +1170,7 @@ fn insert(self, node: RBTreeNode<K, V>) -> &'a mut V {
 
         // SAFETY: `node` is valid at least until we call `KBox::from_raw`, which only happens when
         // the node is removed or replaced.
-        let node_links = unsafe { addr_of_mut!((*node).links) };
+        let node_links = unsafe { &raw mut (*node).links };
 
         // INVARIANT: We are linking in a new node, which is valid. It remains valid because we
         // "forgot" it with `KBox::into_raw`.
@@ -1178,7 +1178,7 @@ fn insert(self, node: RBTreeNode<K, V>) -> &'a mut V {
         unsafe { bindings::rb_link_node(node_links, self.parent, self.child_field_of_parent) };
 
         // SAFETY: All pointers are valid. `node` has just been inserted into the tree.
-        unsafe { bindings::rb_insert_color(node_links, addr_of_mut!((*self.rbtree).root)) };
+        unsafe { bindings::rb_insert_color(node_links, &raw mut (*self.rbtree).root) };
 
         // SAFETY: The node is valid until we remove it from the tree.
         unsafe { &mut (*node).value }
@@ -1261,7 +1261,7 @@ fn replace(self, node: RBTreeNode<K, V>) -> RBTreeNode<K, V> {
 
         // SAFETY: `node` is valid at least until we call `KBox::from_raw`, which only happens when
         // the node is removed or replaced.
-        let new_node_links = unsafe { addr_of_mut!((*node).links) };
+        let new_node_links = unsafe { &raw mut (*node).links };
 
         // SAFETY: This updates the pointers so that `new_node_links` is in the tree where
         // `self.node_links` used to be.
-- 
2.48.1

