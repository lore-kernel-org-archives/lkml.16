Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E3A262FEA;
	Wed, 11 Jun 2025 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637791; cv=none; b=LImrUitUIafmwIpzk9vey6/MqpyGwFXJwH9aqtMhQ0w5ExDMe4cdF+bZ6oZvFlMoLmKr1bM/rCdd89eOFgKPZZ+ydjTetgIjT2Ntm+YLc7G5M+q+M4HNTpgrMQHHQq3PfZnEpoajyOU0Ty566hMtlTXowLR3+JNMtEWBIJzrTw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637791; c=relaxed/simple;
	bh=QkMlQTTUIeB2daj1wKpftXyVVqXYCZwwM5eWfLCXFeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+eNNmFyHC9hSazjbtxKGA1xeqSkc/gLrGwEajamoRMMia6W4FBSrGhf4xdo3iDiCebHruQQAG4DZ5YU43zaGOcIAl9gsPavLdz8omXcEu2ORz4Gt+yrLVV4y3cFeB9TlT73VwK9OtcDa4pSsRJYfYeKACTVZ+tPKfWmEYPIniQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bHMNM687vz9tMg;
	Wed, 11 Jun 2025 12:29:39 +0200 (CEST)
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
Subject: [PATCH v8 3/9] rust: device: Move property_present() to FwNode
Date: Wed, 11 Jun 2025 12:29:02 +0200
Message-ID: <20250611102908.212514-4-remo@buenzli.dev>
In-Reply-To: <20250611102908.212514-1-remo@buenzli.dev>
References: <20250611102908.212514-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bHMNM687vz9tMg

The new FwNode abstraction will be used for accessing all device
properties.

It would be possible to duplicate the methods on the device itself, but
since some of the methods on Device would have different type sigatures
as the ones on FwNode, this would only lead to inconsistency and
confusion. For this reason, property_present is removed from Device and
existing users are updated.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 drivers/cpufreq/rcpufreq_dt.rs | 3 ++-
 rust/kernel/device.rs          | 7 -------
 rust/kernel/device/property.rs | 7 +++++++
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 94ed81644fe1c..4eb240dc9fdc8 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -20,7 +20,8 @@
 /// Finds exact supply name from the OF node.
 fn find_supply_name_exact(dev: &Device, name: &str) -> Option<CString> {
     let prop_name = CString::try_from_fmt(fmt!("{}-supply", name)).ok()?;
-    dev.property_present(&prop_name)
+    dev.fwnode()?
+        .property_present(&prop_name)
         .then(|| CString::try_from_fmt(fmt!("{name}")).ok())
         .flatten()
 }
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index b69f03a7f8d30..241a395d529a1 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,7 +6,6 @@
 
 use crate::{
     bindings,
-    str::CStr,
     types::{ARef, Opaque},
 };
 use core::{fmt, marker::PhantomData, ptr};
@@ -219,12 +218,6 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
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

