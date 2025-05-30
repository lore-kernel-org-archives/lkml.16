Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6C27BF86;
	Fri, 30 May 2025 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633378; cv=none; b=Ejc+U8ph88T9w9lZupq0ahb4CublbaL3hMoxCNI6jl+EB3QAGMdnb9bXamWxtA/rM/08iTXU1AUNtmDX7WrnoQO3xHzJSn2JqeL45m3ZpWZotMS5KiCbCwUc/jGnYTBZvlAcO1rNjlzOxh2cS65qk4k2o9Djeyqj4WL3fE9yvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633378; c=relaxed/simple;
	bh=kznznVOiTt0rMPoIbwckts/UG2t7rn7iMzsEsUG214w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMyT+3A40BNd6Cx5bzI5P2v90pT2G2QB4fg84E9F2DykrWviuDuuBDQpEi/8romBMrQH9nbKeAUInWP1Yt1CpEPyTxsvMNX80I495JRL/erwHcBD+ny06ChlK1YAwPV0yhkzb1v7pHpMXaEPvw+FaDuJq15gy0egUNWRxcct8cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b8Cws1XJzz9spY;
	Fri, 30 May 2025 21:29:33 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v7 4/9] rust: device: Enable printing fwnode name and path
Date: Fri, 30 May 2025 21:28:51 +0200
Message-ID: <20250530192856.1177011-5-remo@buenzli.dev>
In-Reply-To: <20250530192856.1177011-1-remo@buenzli.dev>
References: <20250530192856.1177011-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two new public methods `display_name` and `display_path` to
`FwNode`. They can be used by driver authors for logging purposes. In
addition, they will be used by core property abstractions for automatic
logging, for example when a driver attempts to read a required but
missing property.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/property.rs | 79 +++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 50c61aa056e6b..8e0414b0517e4 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -9,7 +9,7 @@
 use crate::{
     bindings,
     str::CStr,
-    types::{ARef, Opaque},
+    types::{ARef, Either, Opaque},
 };
 
 /// A reference-counted fwnode_handle.
@@ -57,6 +57,83 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
         self.0.get()
     }
 
+    /// Returns an object that implements [`Display`](core::fmt::Display) for
+    /// printing the name of a node.
+    pub fn display_name(&self) -> impl core::fmt::Display + '_ {
+        struct FwNodeDisplayName<'a>(&'a FwNode);
+
+        impl core::fmt::Display for FwNodeDisplayName<'_> {
+            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+                // SAFETY: `self` is valid by its type invariant.
+                let name = unsafe { bindings::fwnode_get_name(self.0.as_raw()) };
+                if name.is_null() {
+                    return Ok(());
+                }
+                // SAFETY:
+                // - `fwnode_get_name` returns null or a valid C string.
+                // - `name` was checked to be non-null.
+                let name = unsafe { CStr::from_char_ptr(name) };
+                write!(f, "{name}")
+            }
+        }
+
+        FwNodeDisplayName(self)
+    }
+
+    /// Returns an object that implements [`Display`](core::fmt::Display) for
+    /// printing the full path of a node.
+    pub fn display_path(&self) -> impl core::fmt::Display + '_ {
+        struct FwNodeDisplayPath<'a>(&'a FwNode);
+
+        impl core::fmt::Display for FwNodeDisplayPath<'_> {
+            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+                // The logic here is the same as the one in lib/vsprintf.c
+                // (fwnode_full_name_string).
+
+                // SAFETY: `self.0.as_raw()` is valid by its type invariant.
+                let num_parents = unsafe { bindings::fwnode_count_parents(self.0.as_raw()) };
+
+                for depth in (0..=num_parents).rev() {
+                    let fwnode = if depth == 0 {
+                        Either::Left(self.0)
+                    } else {
+                        // SAFETY: `self.0.as_raw()` is valid.
+                        let ptr =
+                            unsafe { bindings::fwnode_get_nth_parent(self.0.as_raw(), depth) };
+                        // SAFETY:
+                        // - The depth passed to `fwnode_get_nth_parent` is
+                        //   within the valid range, so the returned pointer is
+                        //   not null.
+                        // - The reference count was incremented by
+                        //   `fwnode_get_nth_parent`.
+                        // - That increment is relinquished to
+                        //   `FwNode::from_raw`.
+                        Either::Right(unsafe { FwNode::from_raw(ptr) })
+                    };
+                    // Take a reference to the owned or borrowed `FwNode`.
+                    let fwnode: &FwNode = match &fwnode {
+                        Either::Left(f) => f,
+                        Either::Right(f) => f,
+                    };
+
+                    // SAFETY: `fwnode` is valid by its type invariant.
+                    let prefix = unsafe { bindings::fwnode_get_name_prefix(fwnode.as_raw()) };
+                    if !prefix.is_null() {
+                        // SAFETY: `fwnode_get_name_prefix` returns null or a
+                        // valid C string.
+                        let prefix = unsafe { CStr::from_char_ptr(prefix) };
+                        write!(f, "{prefix}")?;
+                    }
+                    write!(f, "{}", fwnode.display_name())?;
+                }
+
+                Ok(())
+            }
+        }
+
+        FwNodeDisplayPath(self)
+    }
+
     /// Checks if property is present or not.
     pub fn property_present(&self, name: &CStr) -> bool {
         // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
-- 
2.49.0

