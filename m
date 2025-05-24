Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B602DCBF7;
	Sat, 24 May 2025 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748114581; cv=none; b=jSIe93b2HIXkQHE5ugrM2lD5wL0fMAg7gwu8V4eqwylqHL2J7hyZXhVGvQHqsOr4PFfdlq1ZpIq5KnrcvumDPOhELENhsRoM5aK0/xtf9yE6ReNM5HWYSCLtxcmYn9S128EcjcGwin/B90YiYJPtXTeG6Mnu+OuQRLwL0sHrq6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748114581; c=relaxed/simple;
	bh=fOzZvbDXSMEXRk0rGZRdRjBIfJRFcL7ZXeXZpEFVu9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbdKQCkjItkp5LGX0uvjlje2yv3+cRcoQk4PsRpZYq3ajNvYgmsxEVHDLiQKOA9X1gJt8QueAUft98u439XjuN49KqMAKIhLbhKGwYKY84bdxWaDOyAdbDWQLxsyFCq920FC+V9q2w8JfCGBdtZpXidfCqtHFSeO59GwRlYcqM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b4X402L0dz9tWL;
	Sat, 24 May 2025 21:22:56 +0200 (CEST)
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
Subject: [PATCH v6 4/9] rust: device: Enable printing fwnode name and path
Date: Sat, 24 May 2025 21:22:27 +0200
Message-ID: <20250524192232.705860-5-remo@buenzli.dev>
In-Reply-To: <20250524192232.705860-1-remo@buenzli.dev>
References: <20250524192232.705860-1-remo@buenzli.dev>
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
 rust/kernel/device/property.rs | 75 ++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 71a0605b8ecad..09c38775b2354 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -32,6 +32,81 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
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
+                        self.0.as_raw()
+                    } else {
+                        // SAFETY: `self.0.as_raw()` is valid.
+                        unsafe { bindings::fwnode_get_nth_parent(self.0.as_raw(), depth) }
+                    };
+
+                    // SAFETY: `fwnode` is valid, it is either `self.0.as_raw()`
+                    // or the return value of `bindings::fwnode_get_nth_parent`
+                    // which returns a valid pointer to a `fwnode_handle` if the
+                    // provided depth is within the valid range, which we know
+                    // to be true.
+                    let prefix = unsafe { bindings::fwnode_get_name_prefix(fwnode) };
+                    if !prefix.is_null() {
+                        // SAFETY: `fwnode_get_name_prefix` returns null or a
+                        // valid C string.
+                        let prefix = unsafe { CStr::from_char_ptr(prefix) };
+                        write!(f, "{prefix}")?;
+                    }
+                    write!(f, "{}", self.0.display_name())?;
+
+                    if depth != 0 {
+                        // SAFETY:
+                        // - `fwnode` is valid, because `depth` is
+                        //   a valid depth of a parent of `self.0.as_raw()`.
+                        // - `fwnode_get_nth_parent` increments the refcount and
+                        //   we are responsible to decrement it.
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

