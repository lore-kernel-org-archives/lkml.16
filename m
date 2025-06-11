Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9026526280F;
	Wed, 11 Jun 2025 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637782; cv=none; b=sNYWUv9sOVvU1wfopa9+LAx9OmlAkFJJBtUIxEBw6Pu4bgZMDVX0DiBrJTfxZfQ+cPTpd3DtpDvIZeFTDrAL62uPN8cGBhvuCGiiMKEyRi9Gk8HmDYC1xCimmrzUZ8u69iSPHzU7eVk47+Q7SXweCrBBSDbFdVQGMNqQ05kBc2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637782; c=relaxed/simple;
	bh=hwdlFyCcTxFJRhAmgRPoYDoX5BfMe9FtVpwQHVWfm7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhPz308FE7Qt1mXIjlqQ383mIHUY6U0/K/nZAP9pqcNPJBUFPo7iaGmRY8guqq8VPBo6feHNXrAxeTkwOjvBBgv1DcbAYkQAzpYHzJGYOXKh6PDzk/OsXMpEiY+ZjSQPhBXh3snm5TnxHpFzGipZ37RcDgsn4JeeVdX3x3HPOgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bHMNK08j8z9tfM;
	Wed, 11 Jun 2025 12:29:37 +0200 (CEST)
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
Subject: [PATCH v8 2/9] rust: device: Enable accessing the FwNode of a Device
Date: Wed, 11 Jun 2025 12:29:01 +0200
Message-ID: <20250611102908.212514-3-remo@buenzli.dev>
In-Reply-To: <20250611102908.212514-1-remo@buenzli.dev>
References: <20250611102908.212514-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subsequent patches will add methods for reading properties to FwNode.
The first step to accessing these methods will be to access the "root"
FwNode of a Device.

Add the method `fwnode` to `Device`.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index d6237827a9369..b69f03a7f8d30 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -205,6 +205,21 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
         };
     }
 
+    /// Obtain the [`FwNode`](property::FwNode) corresponding to the device.
+    pub fn fwnode(&self) -> Option<&property::FwNode> {
+        // SAFETY: `self` is valid.
+        let fwnode_handle = unsafe { bindings::__dev_fwnode(self.as_raw()) };
+        if fwnode_handle.is_null() {
+            return None;
+        }
+        // SAFETY: `fwnode_handle` is valid. Its lifetime is tied to `&self`. We
+        // return a reference instead of an `ARef<FwNode>` because `dev_fwnode()`
+        // doesn't increment the refcount. It is safe to cast from a
+        // `struct fwnode_handle*` to a `*const FwNode` because `FwNode` is
+        // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
+        Some(unsafe { &*fwnode_handle.cast() })
+    }
+
     /// Checks if property is present or not.
     pub fn property_present(&self, name: &CStr) -> bool {
         // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
-- 
2.49.0

