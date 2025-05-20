Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968AF286D56;
	Tue, 20 May 2025 20:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771257; cv=none; b=ilcBS02jJ0JtuvRYfWtLI+H7TfNIh+Bn0GkFcbdWX5TO2TLBYWGFKXIOGnuAlxjeWzBN8VUeQGfS3KR+ssw/8sy49NayC9Kz3MuoBuJeA7DIKr5palCgEzu1azxAVAaySgUw7ptTHpUfYO1iF3GFkdoKy1A/QU3Ihz3JvaBH/IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771257; c=relaxed/simple;
	bh=v7Qf/Do3avaqhR94kWRjDwETchjOW6NVRtx2BVbhaGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSOM/avCYKMi8UBIWfuvLLTMq5ztl3JcBIHiXvFzybSIB1jGYJUzArhtEbnGv03vKYVytk7l1ivQca4Jhc5JRfApi3yECFiNYRiscQwiE69nx5SCJbn0ehVGcoeGd6nWETAOA/Mlab8Z2YVaXH42lFxg4JJLFkYxmnltrZpMVGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b255V5QpLz9srp;
	Tue, 20 May 2025 22:00:46 +0200 (CEST)
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
Subject: [PATCH v5 2/9] rust: device: Enable accessing the FwNode of a Device
Date: Tue, 20 May 2025 22:00:17 +0200
Message-ID: <20250520200024.268655-3-remo@buenzli.dev>
In-Reply-To: <20250520200024.268655-1-remo@buenzli.dev>
References: <20250520200024.268655-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b255V5QpLz9srp

Subsequent patches will add methods for reading properties to FwNode.
The first step to accessing these methods will be to access the "root"
FwNode of a Device.

Add the method `fwnode` to `Device`.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index d8619d4485fb4..b4b7056eb80f8 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
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

