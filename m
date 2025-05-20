Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927012857C5;
	Tue, 20 May 2025 20:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771255; cv=none; b=Rtkgvkj0lL4zhIkrf27SE8KTgCoaeK6PjaUvsZva07gRAZKsk/Ldp0btrP5yW4IOcjFBH7QZJnAkieau8+U+/w8HiB9BN3zQzDAg6p7UajDdQCos8iOLbrVqK41O02mQ7lKp4EE4RDzdhlYGrtNEvMRPbTpx5dNYEkvWJC2dplU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771255; c=relaxed/simple;
	bh=0S/MUYKQJU8YSYNVsLtPXJ8m11oU8Z8u0aaLt8sJjD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkFsI9XBQoyIpzesZOdSsqG2Elo5Vv3K0RESoWCWqvHPY4ghXjf7g5M2e7M8OhXXsntVD1ZceJ5MOcG2Ag964B68lUoJ2nMcHp94jnQMV188LOZWiAsqt1u2UBakDj8wn/0phlU4hIfBzuA2v9bxnlpGXg0s0MV7ZGofVnM5acE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b255Y5xQ9z9sGf;
	Tue, 20 May 2025 22:00:49 +0200 (CEST)
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
Subject: [PATCH v5 3/9] rust: device: Add property_present() to FwNode
Date: Tue, 20 May 2025 22:00:18 +0200
Message-ID: <20250520200024.268655-4-remo@buenzli.dev>
In-Reply-To: <20250520200024.268655-1-remo@buenzli.dev>
References: <20250520200024.268655-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b255Y5xQ9z9sGf

The new FwNode abstraction will be used for accessing all device
properties, so it must have the property_present method.

It's possible to duplicate the methods on the device itself, but since
some of the methods on Device would have different type sigatures as
the ones on FwNode, this would only lead to inconsistency and confusion.
So, in the future, property_perent will be removed from Device. However,
there's a user about to be merged, so the method is left to make merging
easier.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device/property.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

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

