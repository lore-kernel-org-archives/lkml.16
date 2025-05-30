Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5968327FD5B;
	Fri, 30 May 2025 19:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633389; cv=none; b=aj4GNcimxkOLVlmHlsfCjfd2A1Hdif2K6CpMDfgyhDkGTmBUHgJAHIWKVmpEbllKhcViM/je/mHFwpmv25eqVG4Ei4KJTj/kSDfhetcS0hv4K8emPy5pN/qc0Vivh9Fzb3F6AOhToBPxJjpWBKqrHNaM4aO9ZR92Gnm1ljFkZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633389; c=relaxed/simple;
	bh=PTCY1jhE8pJs7JEsYCU7z7GmKRJLt4yqfC1uMhJlfaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UVFlSk9fS7lu/D9vzSjO7/zcw6OhoAEX0rALUBS3GVO4uNWSMiNqQCPVyg6yE/FAOIdysPVWI+DFQlDYwjOWiEe+R9IqKQNO0fhBOBgysGvOzQ8WB6oByQd55dG+WBqJIps1SfYglxGdwmzLCnuCXVIxH6nry/bTQ20ZzZlE51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b8Cx35z0dz9tjh;
	Fri, 30 May 2025 21:29:43 +0200 (CEST)
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
Subject: [PATCH v7 8/9] rust: device: Add property_get_reference_args
Date: Fri, 30 May 2025 21:28:55 +0200
Message-ID: <20250530192856.1177011-9-remo@buenzli.dev>
In-Reply-To: <20250530192856.1177011-1-remo@buenzli.dev>
References: <20250530192856.1177011-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b8Cx35z0dz9tjh

Allow Rust code to read reference args from device properties. The
wrapper type `FwNodeReferenceArgs` allows callers to access the buffer
of read args safely.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/property.rs | 67 ++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 743f296bfb03c..4dec6ef591620 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -297,6 +297,64 @@ pub fn children<'a>(&'a self) -> impl Iterator<Item = ARef<FwNode>> + 'a {
             Some(next)
         })
     }
+
+    /// Finds a reference with arguments.
+    pub fn property_get_reference_args(
+        &self,
+        prop: &CStr,
+        nargs: NArgs<'_>,
+        index: u32,
+    ) -> Result<FwNodeReferenceArgs> {
+        let mut out_args = FwNodeReferenceArgs::default();
+
+        let (nargs_prop, nargs) = match nargs {
+            NArgs::Prop(nargs_prop) => (nargs_prop.as_char_ptr(), 0),
+            NArgs::N(nargs) => (ptr::null(), nargs),
+        };
+
+        // SAFETY:
+        // - `self.0.get()` is valid.
+        // - `prop.as_char_ptr()` is valid and zero-terminated.
+        // - `nargs_prop` is valid and zero-terminated if `nargs`
+        //   is zero, otherwise it is allowed to be a null-pointer.
+        let ret = unsafe {
+            bindings::fwnode_property_get_reference_args(
+                self.0.get(),
+                prop.as_char_ptr(),
+                nargs_prop,
+                nargs,
+                index,
+                &mut out_args.0,
+            )
+        };
+        to_result(ret)?;
+
+        Ok(out_args)
+    }
+}
+
+/// The return value of [`FwNode::property_get_reference_args`].
+#[repr(transparent)]
+#[derive(Copy, Clone, Default)]
+pub struct FwNodeReferenceArgs(bindings::fwnode_reference_args);
+
+impl FwNodeReferenceArgs {
+    /// Returns the slice of reference arguments.
+    pub fn as_slice(&self) -> &[u64] {
+        // SAFETY: As per the safety invariant of `FwNodeReferenceArgs`, `nargs`
+        // is the number of elements in `args` that is valid.
+        unsafe { core::slice::from_raw_parts(self.0.args.as_ptr(), self.0.nargs as usize) }
+    }
+
+    /// Returns the number of reference arguments.
+    pub fn len(&self) -> usize {
+        self.0.nargs as usize
+    }
+
+    /// Returns `true` if there are no reference arguments.
+    pub fn is_empty(&self) -> bool {
+        self.0.nargs == 0
+    }
 }
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
@@ -463,6 +521,15 @@ fn read_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<Self> {
     i64: fwnode_property_read_u64_array,
 }
 
+/// The number of arguments of a reference.
+pub enum NArgs<'a> {
+    /// The name of the property of the reference indicating the number of
+    /// arguments.
+    Prop(&'a CStr),
+    /// The known number of arguments.
+    N(u32),
+}
+
 /// A helper for reading device properties.
 ///
 /// Use [`Self::required_by`] if a missing property is considered a bug and
-- 
2.49.0

