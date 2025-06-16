Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C776D2206AA;
	Mon, 16 Jun 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088732; cv=none; b=nx2Aph+O5VOI+QcTYfrAvAzdCf8ZbaUBH1USn33htElhJPMP3Fqh0++EsKL/mnOpfziox5z7PTwVZul6WI49WN0EtoMQfu+1QHEKb4ivp8deIcZofwXL+XVSMj7pPdFkbGHyS7Z6/0tGJahKYrHY+PvlgJ1Et3mI/Tpr39VqQLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088732; c=relaxed/simple;
	bh=wCc2MJxokZdRhbLuh4AmtlILrl48Ts3XtGp1UmsQOBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpFrYytcpU6iFL5ZrQdxbZ3r65Cad3vG1LpfiIe8rVnPZVEj9AmuYfjIlK8i6UCG358Wqm16UUscrL0n6BEkuZErGF6QSgZa7LRD6Aw96n9zzlZAkf50FWb2R1jG8ORpw0WyH+kMXwaY15ChXz3sjI2iuK5Pg+E8cAOnD2KHIww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bLZ8R0rZHz9sTh;
	Mon, 16 Jun 2025 17:45:27 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Mark Brown <broonie@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 2/3] rust: device: Add property_get_reference_args
Date: Mon, 16 Jun 2025 17:45:10 +0200
Message-ID: <20250616154511.1862909-3-remo@buenzli.dev>
In-Reply-To: <20250616154511.1862909-1-remo@buenzli.dev>
References: <20250616154511.1862909-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bLZ8R0rZHz9sTh

Allow Rust code to read reference args from device properties. The
wrapper type `FwNodeReferenceArgs` allows callers to access the buffer
of read args safely.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
---
 rust/kernel/device/property.rs | 102 +++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 04a13d05785a..f56ffbd43a94 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -246,6 +246,99 @@ pub fn children<'a>(&'a self) -> impl Iterator<Item = ARef<FwNode>> + 'a {
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
+        // - The function upholds the type invariants of `out_args`,
+        //   namely:
+        //   - It may fill the field `fwnode` with a valid pointer,
+        //     in which case its refcount is incremented.
+        //   - It may modify the field `nargs`, in which case it
+        //     initializes at least as many elements in `args`.
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
+///
+/// This structure represents the Rust abstraction for a C
+/// `struct fwnode_reference_args` which was initialized by the C side.
+///
+/// # Invariants
+///
+/// If the field `fwnode` is valid, it owns an increment of its refcount.
+///
+/// The field `args` contains at least as many initialized elements as indicated
+/// by the field `nargs`.
+#[repr(transparent)]
+#[derive(Default)]
+pub struct FwNodeReferenceArgs(bindings::fwnode_reference_args);
+
+impl Drop for FwNodeReferenceArgs {
+    fn drop(&mut self) {
+        if !self.0.fwnode.is_null() {
+            // SAFETY:
+            // - By the type invariants of `FwNodeReferenceArgs`, its field
+            //   `fwnode` owns an increment of its refcount.
+            // - That increment is relinquished. The underlying object won't be
+            //   used anymore because we are dropping it.
+            let _ = unsafe { FwNode::from_raw(self.0.fwnode) };
+        }
+    }
+}
+
+impl FwNodeReferenceArgs {
+    /// Returns the slice of reference arguments.
+    pub fn as_slice(&self) -> &[u64] {
+        // SAFETY: As per the safety invariant of `FwNodeReferenceArgs`, `nargs`
+        // is the minimum number of elements in `args` that is valid.
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
+}
+
+impl core::fmt::Debug for FwNodeReferenceArgs {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        write!(f, "{:?}", self.as_slice())
+    }
 }
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
@@ -462,6 +555,15 @@ fn read_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<Self> {
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

