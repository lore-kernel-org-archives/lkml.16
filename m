Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A9A267B65;
	Wed, 11 Jun 2025 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637794; cv=none; b=Uyt82cjYZav4BoPWpc1cvyVmSZPDxLo0/3RGxW2RBUy+zuCUk+YMIPO8f+TanQPw/YaYnQI6ZdZx/iGLL3FID3m448Ge4n7HOt6STllR5rLtP1CX1EesDH+TyWzvnoLhqyjTUlxFlkokE5Cv5i+XYsblot3gXbDvDRjiCMiYRHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637794; c=relaxed/simple;
	bh=2BoW4pFaIctzE8BFvVPtU04cbrv4X3tZKXfOo1/sW/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tk5/L0RIYom1zuGltXpUAkV5SX/lSy94H9aZt3zvjgm9CkC4EYjrQIeea5uMcfFMvFam847oGdqi1ARbjzwQhYBbt0AFaNXPFzdTYmb/D+pJMtU55QUh38zYGQVaIb32xRhtlpCfZxJgcXAqQlj1UpQhg8M5pwOb64ueNi2lAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bHMNR0zGNz9tKs;
	Wed, 11 Jun 2025 12:29:43 +0200 (CEST)
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
Subject: [PATCH v8 4/9] rust: device: Enable printing fwnode name and path
Date: Wed, 11 Jun 2025 12:29:03 +0200
Message-ID: <20250611102908.212514-5-remo@buenzli.dev>
In-Reply-To: <20250611102908.212514-1-remo@buenzli.dev>
References: <20250611102908.212514-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bHMNR0zGNz9tKs

Add two new public methods `display_name` and `display_path` to
`FwNode`. They can be used by driver authors for logging purposes. In
addition, they will be used by core property abstractions for automatic
logging, for example when a driver attempts to read a required but
missing property.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/property.rs | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 50c61aa056e6b..4cac335bad78c 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -57,6 +57,32 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
         self.0.get()
     }
 
+    /// Returns an object that implements [`Display`](core::fmt::Display) for
+    /// printing the name of a node.
+    ///
+    /// This is an alternative to the default `Display` implementation, which
+    /// prints the full path.
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
     /// Checks if property is present or not.
     pub fn property_present(&self, name: &CStr) -> bool {
         // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
@@ -78,3 +104,53 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
         unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
     }
 }
+
+enum Node<'a> {
+    Borrowed(&'a FwNode),
+    Owned(ARef<FwNode>),
+}
+
+impl core::fmt::Display for FwNode {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        // The logic here is the same as the one in lib/vsprintf.c
+        // (fwnode_full_name_string).
+
+        // SAFETY: `self.as_raw()` is valid by its type invariant.
+        let num_parents = unsafe { bindings::fwnode_count_parents(self.as_raw()) };
+
+        for depth in (0..=num_parents).rev() {
+            let fwnode = if depth == 0 {
+                Node::Borrowed(self)
+            } else {
+                // SAFETY: `self.as_raw()` is valid.
+                let ptr = unsafe { bindings::fwnode_get_nth_parent(self.as_raw(), depth) };
+                // SAFETY:
+                // - The depth passed to `fwnode_get_nth_parent` is
+                //   within the valid range, so the returned pointer is
+                //   not null.
+                // - The reference count was incremented by
+                //   `fwnode_get_nth_parent`.
+                // - That increment is relinquished to
+                //   `FwNode::from_raw`.
+                Node::Owned(unsafe { FwNode::from_raw(ptr) })
+            };
+            // Take a reference to the owned or borrowed `FwNode`.
+            let fwnode: &FwNode = match &fwnode {
+                Node::Borrowed(f) => f,
+                Node::Owned(f) => f,
+            };
+
+            // SAFETY: `fwnode` is valid by its type invariant.
+            let prefix = unsafe { bindings::fwnode_get_name_prefix(fwnode.as_raw()) };
+            if !prefix.is_null() {
+                // SAFETY: `fwnode_get_name_prefix` returns null or a
+                // valid C string.
+                let prefix = unsafe { CStr::from_char_ptr(prefix) };
+                write!(f, "{prefix}")?;
+            }
+            write!(f, "{}", fwnode.display_name())?;
+        }
+
+        Ok(())
+    }
+}
-- 
2.49.0

