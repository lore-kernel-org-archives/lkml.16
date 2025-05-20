Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA922874F5;
	Tue, 20 May 2025 20:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771258; cv=none; b=kolCM4NAfx1O/+DycqUlsvqFZTFxgeezU8Z+qjN3dp9rACIserJR/5/HXi/0nrN2fV8veMgC36YFfbXRVjXjTRHBAnZfPGRMvepZdpyICRT996qWnA2XGqCROyI5E7/iK2YisLeXoQM5pZmWZ/YYjz374598e4ecMt3PWxB5lLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771258; c=relaxed/simple;
	bh=lBPC/zrvrNHermCXWGNtETuEb0cFund/AAT9AWz+vvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCqtTtTm19qbY/VT/Jd9IrPlMt+2B0EEBlEuQ1KTi+zzobeXFVAJXRIEOQCmfKykX0kwWVw5BmWxBO9Y4zLphMu00xXtQPFWme6TP6pGpG3H6+2r5fEMmqLYnxu4tYM6XUiQkZA6p4yojz+Hnv6uQKk3/yRO9YaDakU5gdivlek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b255c4Q8Vz9sNt;
	Tue, 20 May 2025 22:00:52 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
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
Subject: [PATCH v5 4/9] rust: device: Enable printing fwnode name and path
Date: Tue, 20 May 2025 22:00:19 +0200
Message-ID: <20250520200024.268655-5-remo@buenzli.dev>
In-Reply-To: <20250520200024.268655-1-remo@buenzli.dev>
References: <20250520200024.268655-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b255c4Q8Vz9sNt

Add two new public methods `display_name` and `display_path` to
`FwNode`. They can be used by driver authors for logging purposes. In
addition, they will be used by core property abstractions for automatic
logging, for example when a driver attempts to read a required but
missing property.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/property.rs | 72 ++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 70593343bd811..6ccc7947f9c31 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -32,6 +32,78 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
         self.0.get()
     }
 
+    /// Returns an object that implements [`Display`](core::fmt::Display) for
+    /// printing the name of a node.
+    pub fn display_name(&self) -> impl core::fmt::Display + '_ {
+        struct FwNodeDisplayName<'a>(&'a FwNode);
+
+        impl core::fmt::Display for FwNodeDisplayName<'_> {
+            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+                // SAFETY: self is valid by its type invariant
+                let name = unsafe { bindings::fwnode_get_name(self.0.as_raw()) };
+                if name.is_null() {
+                    return Ok(());
+                }
+                // SAFETY: fwnode_get_name returns null or a valid C string and
+                // name is not null
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
+                // SAFETY: `self.0.as_raw()` is valid by its type invariant
+                let num_parents = unsafe { bindings::fwnode_count_parents(self.0.as_raw()) };
+
+                for depth in (0..=num_parents).rev() {
+                    let fwnode = if depth == 0 {
+                        self.0.as_raw()
+                    } else {
+                        // SAFETY: `self.0.as_raw()` is valid
+                        unsafe { bindings::fwnode_get_nth_parent(self.0.as_raw(), depth) }
+                    };
+
+                    // SAFETY: fwnode is valid, it is either `self.0.as_raw()` or
+                    // the return value of `bindings::fwnode_get_nth_parent` which
+                    // returns a valid pointer to a fwnode_handle if the provided
+                    // depth is within the valid range, which we know to be true.
+                    let prefix = unsafe { bindings::fwnode_get_name_prefix(fwnode) };
+                    if !prefix.is_null() {
+                        // SAFETY: fwnode_get_name_prefix returns null or a
+                        // valid C string
+                        let prefix = unsafe { CStr::from_char_ptr(prefix) };
+                        write!(f, "{prefix}")?;
+                    }
+                    write!(f, "{}", self.0.display_name())?;
+
+                    if depth != 0 {
+                        // SAFETY: `fwnode` is valid, because `depth` is
+                        // a valid depth of a parent of `self.0.as_raw()`.
+                        // `fwnode_get_nth_parent` increments the refcount and
+                        // we are responsible to decrement it.
+                        unsafe { bindings::fwnode_handle_put(fwnode) }
+                    }
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

