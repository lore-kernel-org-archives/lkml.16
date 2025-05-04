Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325BE1EDA35;
	Sun,  4 May 2025 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379931; cv=none; b=Q7pQYuxP71r4NB8Tdk/Bavi5RA6mTDXOLg0T+P7axm6xbQ5/9YeVV79vQdc/S2REwxgH+iSOWsjYCas53jyI0svtxDhPnTP9sfHHDiLLcdae7Ab/D1y3DyKN+EMz2kC4IzwPfa4tjw94o0oP+FgorZDAu3Hg7ocyVboC51B+odU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379931; c=relaxed/simple;
	bh=IuJ/JYEcJX5Y174KySDaQUhQfRssj2v+q0jSvHXpWBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAkGEJhn1gvDQNDie2Cax1An0wkGlSk4GsVM9CHvVOM3jowVPeZc9Z1onzkgKaLdL206aN9hEMW0XhBWN+BUjry1RJ4OjwMc/u5ETm4ErquAXGIQmoDf14kTX2dtIxC6tOYA28uixKVN/VwJEVCRoazovtOVdLyoLpLeXY3PlLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZrBYL24Gzz9tch;
	Sun,  4 May 2025 19:32:06 +0200 (CEST)
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
Subject: [PATCH v4 3/9] rust: device: Move property_present() to FwNode
Date: Sun,  4 May 2025 19:31:48 +0200
Message-ID: <20250504173154.488519-4-remo@buenzli.dev>
In-Reply-To: <20250504173154.488519-1-remo@buenzli.dev>
References: <20250504173154.488519-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new FwNode abstraction will be used for accessing all device
properties, so it must have the property_present method.

It's possible to duplicate the methods on the device itself, but since
some of the methods on Device would have different type sigatures as the
ones on FwNode, this would only lead to inconsistency and confusion.
Hence, remove the method from Device.

There aren't any users to update yet.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/mod.rs      | 7 -------
 rust/kernel/device/property.rs | 8 +++++++-
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/device/mod.rs b/rust/kernel/device/mod.rs
index b4b7056eb80f8..15d89cd45e871 100644
--- a/rust/kernel/device/mod.rs
+++ b/rust/kernel/device/mod.rs
@@ -6,7 +6,6 @@
 
 use crate::{
     bindings,
-    str::CStr,
     types::{ARef, Opaque},
 };
 use core::{fmt, marker::PhantomData, ptr};
@@ -200,12 +199,6 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
         // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
         Some(unsafe { &*fwnode_handle.cast() })
     }
-
-    /// Checks if property is present or not.
-    pub fn property_present(&self, name: &CStr) -> bool {
-        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
-        unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
-    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index e75d55f5856cf..70593343bd811 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -6,7 +6,7 @@
 
 use core::ptr;
 
-use crate::{bindings, types::Opaque};
+use crate::{bindings, str::CStr, types::Opaque};
 
 /// A reference-counted fwnode_handle.
 ///
@@ -31,6 +31,12 @@ impl FwNode {
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

