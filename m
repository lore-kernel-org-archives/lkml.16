Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD80279791;
	Fri, 30 May 2025 19:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633376; cv=none; b=ciY+nwdztDUCtPikANxApNvwjwFxKIBbOiI/MI+L1F8aBwNdOHMzx2L7rDUofipja092rfsfX8iMwmeFjPIUfsJX8KFU/LydvS8Wh3RTkabaFdG3k70r7+X65DxmbhKorWtZcoSo5txNAL3O65e7aPIkC96cesTjbIWlmaKGssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633376; c=relaxed/simple;
	bh=fJQhwyNpL3iXzLUz52rCejz7gVZ5SFq49N/wZlVyA+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHyzxHk7OLbhseeWuYzM4zfyVKBh9PUlqec7YW1vertwxWLo8d9G0pVrkVhTfaS0qbbYl+P+xaIkWBAUMKwpgvGBuZhu9mrBfThIoSWVE3DESzZYi/4ysZ30FhFoGpfllY3BzdjeptYyZB9EHe4f6ghfR1F1OA+pyoEH03tnrO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4b8Cwp4x43z9srN;
	Fri, 30 May 2025 21:29:30 +0200 (CEST)
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
Subject: [PATCH v7 3/9] rust: device: Add property_present() to FwNode
Date: Fri, 30 May 2025 21:28:50 +0200
Message-ID: <20250530192856.1177011-4-remo@buenzli.dev>
In-Reply-To: <20250530192856.1177011-1-remo@buenzli.dev>
References: <20250530192856.1177011-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b8Cwp4x43z9srN

The new FwNode abstraction will be used for accessing all device
properties, so it must have the property_present method.

It's possible to duplicate the methods on the device itself, but since
some of the methods on Device would have different type sigatures as
the ones on FwNode, this would only lead to inconsistency and confusion.
So, in the future, property_present will be removed from Device. However,
there's a user about to be merged, so the method is left to make merging
easier.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/property.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 03850b7bb8087..50c61aa056e6b 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -8,6 +8,7 @@
 
 use crate::{
     bindings,
+    str::CStr,
     types::{ARef, Opaque},
 };
 
@@ -55,6 +56,12 @@ unsafe fn from_raw(raw: *mut bindings::fwnode_handle) -> ARef<Self> {
     pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
         self.0.get()
     }
+
+    /// Checks if property is present or not.
+    pub fn property_present(&self, name: &CStr) -> bool {
+        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
+        unsafe { bindings::fwnode_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
+    }
 }
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
-- 
2.49.0

