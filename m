Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B4F288C82;
	Tue, 20 May 2025 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771260; cv=none; b=Au1FPwX4RGvvfQl6Il+33sk7O9pAwiHVGyPgjSSWA6oqoxd3zQD1rIWnf/6r5D893sdegS1VF7LcFBQYuxlT3HKTINg183JTKKg+lGu5rQgCbH0DsUlqd9cdVg0mhPd34snvmMOogm03TRqkMfYcd1Gg1HTisigFzV/Q++WFW4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771260; c=relaxed/simple;
	bh=J2lwdCE8iDDP3UvbXLuSXS9ESV77jCz6AkFvJkR0FyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/e5tXuuPlENiGB8SyoNehecz7EqDDwkv5M8rV+ZsKrb+oC4q7ZMJpUTzYtppKuubjsjpqRE5PLRqWQzJ1I9q5zQGkITF6QlWhAbpkr0j1vOm4EEjUEq0IhN9ZJ5NFKCCPaxaIl8EWZkuHXypvmDhlMzoDGkjBLcb/9pFds8V1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b255g3zYWz9shs;
	Tue, 20 May 2025 22:00:55 +0200 (CEST)
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
Subject: [PATCH v5 5/9] rust: device: Introduce PropertyGuard
Date: Tue, 20 May 2025 22:00:20 +0200
Message-ID: <20250520200024.268655-6-remo@buenzli.dev>
In-Reply-To: <20250520200024.268655-1-remo@buenzli.dev>
References: <20250520200024.268655-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b255g3zYWz9shs

This abstraction is a way to force users to specify whether a property
is supposed to be required or not. This allows us to move error
logging of missing required properties into core, preventing a lot of
boilerplate in drivers.

It will be used by upcoming methods for reading device properties.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/property.rs | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 6ccc7947f9c31..59c61e2493831 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -123,3 +123,62 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
         unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
     }
 }
+
+/// A helper for reading device properties.
+///
+/// Use [`Self::required_by`] if a missing property is considered a bug and
+/// [`Self::optional`] otherwise.
+///
+/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
+pub struct PropertyGuard<'fwnode, 'name, T> {
+    /// The result of reading the property.
+    inner: Result<T>,
+    /// The fwnode of the property, used for logging in the "required" case.
+    fwnode: &'fwnode FwNode,
+    /// The name of the property, used for logging in the "required" case.
+    name: &'name CStr,
+}
+
+impl<T> PropertyGuard<'_, '_, T> {
+    /// Access the property, indicating it is required.
+    ///
+    /// If the property is not present, the error is automatically logged. If a
+    /// missing property is not an error, use [`Self::optional`] instead. The
+    /// device is required to associate the log with it.
+    pub fn required_by(self, dev: &super::Device) -> Result<T> {
+        if self.inner.is_err() {
+            dev_err!(
+                dev,
+                "{}: property '{}' is missing\n",
+                self.fwnode.display_path(),
+                self.name
+            );
+        }
+        self.inner
+    }
+
+    /// Access the property, indicating it is optional.
+    ///
+    /// In contrast to [`Self::required_by`], no error message is logged if
+    /// the property is not present.
+    pub fn optional(self) -> Option<T> {
+        self.inner.ok()
+    }
+
+    /// Access the property or the specified default value.
+    ///
+    /// Do not pass a sentinel value as default to detect a missing property.
+    /// Use [`Self::required_by`] or [`Self::optional`] instead.
+    pub fn or(self, default: T) -> T {
+        self.inner.unwrap_or(default)
+    }
+}
+
+impl<T: Default> PropertyGuard<'_, '_, T> {
+    /// Access the property or a default value.
+    ///
+    /// Use [`Self::or`] to specify a custom default value.
+    pub fn or_default(self) -> T {
+        self.inner.unwrap_or_default()
+    }
+}
-- 
2.49.0

