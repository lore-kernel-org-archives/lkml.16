Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8462D25776;
	Sun,  4 May 2025 17:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746380331; cv=none; b=NcutaDaYm1dt/3Stuiuz6WnuGng3EJnZmaqolEQOVIpWJhcdssyWR9mW6T2P5Lv6FplDvVw3+RN3G1yfXMwZxIfezKx7GsWeWbbtYShjgvieez2rfHNMtB1WWVkDaNGdePMcIktBKeiVNcccuMnrxupanpe8oOgKNm8AUx0c1vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746380331; c=relaxed/simple;
	bh=xZMoxyD1M6hO1rjE/H9RTuK9a0wHG4M1f4p3TCszldo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRtGo9nj+1I7KD1UfM6WAQeh9B1NA1wyj4uDdHrJtUc2Sebw2OLFluyIegw8LV7bFtMhQjkfD1y4ARDb+ywGMNkHEFe14RucgqPQQ0dYSZOYdd/H3cZs+0xYG2pRxXEr1XUlCwaVQMwZ988N+rlfydoMpPRvkIopuWrdkMvjhkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZrBYJ12J4z9tk2;
	Sun,  4 May 2025 19:32:04 +0200 (CEST)
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
Subject: [PATCH v4 2/9] rust: device: Enable accessing the FwNode of a Device
Date: Sun,  4 May 2025 19:31:47 +0200
Message-ID: <20250504173154.488519-3-remo@buenzli.dev>
In-Reply-To: <20250504173154.488519-1-remo@buenzli.dev>
References: <20250504173154.488519-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FwNode is an abstraction over the C struct fwnode_handle. It will be
used to access all device properties.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/mod.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/device/mod.rs b/rust/kernel/device/mod.rs
index d8619d4485fb4..b4b7056eb80f8 100644
--- a/rust/kernel/device/mod.rs
+++ b/rust/kernel/device/mod.rs
@@ -186,6 +186,21 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
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

