Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F092E272E48;
	Mon, 16 Jun 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088736; cv=none; b=sCfoO47G1qmZrH419heseR08FjPYl8x+G5BK6dOEOxn+hA3NkVfqLh+Ku557iR3kA1JdTR/YzyFH/1WhatTcI1LRatLANjVGDE58ANIEHpmcLoZNOhTP/bz09rXs8mXo2FvoEBDEHr7SdSUua6sSv0QCQfffJcJVYkwT7xMKN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088736; c=relaxed/simple;
	bh=ra8p9X0kjOiFPIwyw3A4kgvR0ernRDG0F99sfFix9qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYXnFhqFFXWPCJL2/i9RsuqPNu3Qxut2rTovEUSJ4Az3Mmhsbk7/S01aPmmF1fmm+gHBNgPcJEwi0ZSDka/AlxOytdwdayxeM6mM1lMfFdQoxh/n6yKDCr6hUWcQHf21lNsTTLvwxvtAWS6i8A6fCXOBIBrm1U080pawIuS3oHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bLZ8W4LT5z9sWF;
	Mon, 16 Jun 2025 17:45:31 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Mark Brown <broonie@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 3/3] samples: rust: platform: Add property child and reference args examples
Date: Mon, 16 Jun 2025 17:45:11 +0200
Message-ID: <20250616154511.1862909-4-remo@buenzli.dev>
In-Reply-To: <20250616154511.1862909-1-remo@buenzli.dev>
References: <20250616154511.1862909-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some example usage of the device property methods for reading
DT/ACPI/swnode child nodes and reference args.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 drivers/of/unittest-data/tests-platform.dtsi |  7 +++++++
 samples/rust/rust_driver_platform.rs         | 13 ++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
index 50a51f38afb6..509eb614ab2b 100644
--- a/drivers/of/unittest-data/tests-platform.dtsi
+++ b/drivers/of/unittest-data/tests-platform.dtsi
@@ -40,6 +40,13 @@ test-device@2 {
 
 				test,u32-prop = <0xdeadbeef>;
 				test,i16-array = /bits/ 16 <1 2 (-3) (-4)>;
+
+				ref_child_0: child@0 {
+					test,ref-arg = <&ref_child_1 0x20 0x32>;
+				};
+				ref_child_1: child@1 {
+					test,ref-arg = <&ref_child_0 0x10 0x64>;
+				};
 			};
 		};
 
diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index c0abf78d0683..4dcedb22a4bb 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -4,7 +4,11 @@
 
 use kernel::{
     c_str,
-    device::{self, Core},
+    device::{
+        self,
+        property::{FwNodeReferenceArgs, NArgs},
+        Core,
+    },
     of, platform,
     prelude::*,
     str::CString,
@@ -91,6 +95,13 @@ fn properties_parse(dev: &device::Device) -> Result {
         let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}' (KVec)\n");
 
+        for child in fwnode.children() {
+            let name = c_str!("test,ref-arg");
+            let nargs = NArgs::N(2);
+            let prop: FwNodeReferenceArgs = child.property_get_reference_args(name, nargs, 0)?;
+            dev_info!(dev, "'{name}'='{prop:?}'\n");
+        }
+
         Ok(())
     }
 }
-- 
2.49.0

