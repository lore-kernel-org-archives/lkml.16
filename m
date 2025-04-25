Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0E025DD0E;
	Fri, 25 Apr 2025 15:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593331; cv=none; b=XomxZT0hrokbkTv0vWo2l2D4xrpG9IE0sMa1B0sFMnscmN5ApltmXFhc8hgvVoO9fk4+af+B5in+XseX0zVuhs4tgh44U1xb6N1EYsHlseSy9RVxXxuY9V3vcsV7kC4dUaCCV47pRwOfzqjhI64AUyJwahowxJ0ZSDDWvytWwLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593331; c=relaxed/simple;
	bh=aQ3Ij2OpGe7mSIXl0a1Dra/1GeqFov69g9H9So5/nNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXvNKQoNcCb1snaq2kGSg7safNqgQ1b0oGrTrQo9NYTqc9Ty+nuqBQehSUsG+XPe89xEl7diGT7B1R/frtOQJ8RLYUa/9MKUEc4WZZoP5oQ6iafsxk4JkzxxWmBKfMfl/91nX8TZ87wwUIZdEfmfyfYnv7ln2nWZu5kG8cU34YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZkbfP1p27z9sPr;
	Fri, 25 Apr 2025 17:02:05 +0200 (CEST)
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
Subject: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
Date: Fri, 25 Apr 2025 17:01:26 +0200
Message-ID: <20250425150130.13917-4-remo@buenzli.dev>
In-Reply-To: <20250425150130.13917-1-remo@buenzli.dev>
References: <20250425150130.13917-1-remo@buenzli.dev>
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
 rust/kernel/device/property.rs | 57 ++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 28850aa3b..de31a1f56 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -146,3 +146,60 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
         unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
     }
 }
+
+/// A helper for reading device properties.
+///
+/// Use [`Self::required`] if a missing property is considered a bug and
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
+    /// missing property is not an error, use [`Self::optional`] instead.
+    pub fn required(self) -> Result<T> {
+        if self.inner.is_err() {
+            pr_err!(
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
+    /// In contrast to [`Self::required`], no error message is logged if
+    /// the property is not present.
+    pub fn optional(self) -> Option<T> {
+        self.inner.ok()
+    }
+
+    /// Access the property or the specified default value.
+    ///
+    /// Do not pass a sentinel value as default to detect a missing property.
+    /// Use [`Self::required`] or [`Self::optional`] instead.
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

