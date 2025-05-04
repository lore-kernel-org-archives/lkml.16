Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE291F3D2C;
	Sun,  4 May 2025 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379941; cv=none; b=qt/426xJ5nEID5SCWugGTLzKQiyEm7oX80ZyNiDuxwWCkdxcP6dddVMlczc7Rgp2m0pFhYGlfaD1wkrnXss0FByvLDD8ZiJPHDzhlQ6BtDly9X7IyeSP5s4+QTmKIaDowDs/tRjIjYJy1NL2YMGtqd22YlFKBa6Q9P6zLXmXOs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379941; c=relaxed/simple;
	bh=J2lwdCE8iDDP3UvbXLuSXS9ESV77jCz6AkFvJkR0FyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMqGwmbjwXBxx1jfMbj3/sCbFjScg8gCyP+pew+vHhuogHHIISIOjtYV+PfkiQgY7DTj5MFCrIsehg9cBLbGB/dRmlB/7qy6FVcjGVZr50cl955dyT1ygrfN1di5WCKHAUwPkYiI9WLo2fun5s1kilw8TrVpisJ8dMtcxmKXQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZrBYQ25W8z9tQQ;
	Sun,  4 May 2025 19:32:10 +0200 (CEST)
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
Subject: [PATCH v4 5/9] rust: device: Introduce PropertyGuard
Date: Sun,  4 May 2025 19:31:50 +0200
Message-ID: <20250504173154.488519-6-remo@buenzli.dev>
In-Reply-To: <20250504173154.488519-1-remo@buenzli.dev>
References: <20250504173154.488519-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

