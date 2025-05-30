Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C115C280334;
	Fri, 30 May 2025 19:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633391; cv=none; b=fUeNJUbkk9j0aSQKv2MJelOVwM+xt60csX9PixvfFiOwBDQNPq/dgtPcfWUqfcUn0hHHxGSHnZAKOfaqtpgHwKA9OyAdRzurarhrmAMZAr295C63kG8C5FRl2XfKfREzKEFfValRn8ENP8YGhcqd49zMWkt2PJObFPF4eSnOvAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633391; c=relaxed/simple;
	bh=vdm9YqlomFKenOuQjRuWXrchHCdacWgaJQJ6IxcsSKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5xagBgJud0duJ9UC0e/HJ/ElDwWfg+mo+pRVit2zWSLIEBapWU9ZHN7Ld/Z65xmA9m0SY8aBTZ45dk+HBVd2floo9Sc9yu3aoYJxmszl+GxVcPma/6mkDK4edlhe7NGXCuEdczORFLZC/xpwzwUsUA2wSZDA3pqIDwCw0LFJ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b8Cx62Q0yz9syT;
	Fri, 30 May 2025 21:29:46 +0200 (CEST)
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
Subject: [PATCH v7 9/9] samples: rust: platform: Add property read examples
Date: Fri, 30 May 2025 21:28:56 +0200
Message-ID: <20250530192856.1177011-10-remo@buenzli.dev>
In-Reply-To: <20250530192856.1177011-1-remo@buenzli.dev>
References: <20250530192856.1177011-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some example usage of the device property read methods for
DT/ACPI/swnode properties.

Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 drivers/of/unittest-data/tests-platform.dtsi |  3 +
 samples/rust/rust_driver_platform.rs         | 60 +++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
index 4171f43cf01cc..50a51f38afb60 100644
--- a/drivers/of/unittest-data/tests-platform.dtsi
+++ b/drivers/of/unittest-data/tests-platform.dtsi
@@ -37,6 +37,9 @@ dev@100 {
 			test-device@2 {
 				compatible = "test,rust-device";
 				reg = <0x2>;
+
+				test,u32-prop = <0xdeadbeef>;
+				test,i16-array = /bits/ 16 <1 2 (-3) (-4)>;
 			};
 		};
 
diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 8b42b3cfb363a..c0abf78d0683b 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -2,7 +2,14 @@
 
 //! Rust Platform driver sample.
 
-use kernel::{c_str, device::Core, of, platform, prelude::*, types::ARef};
+use kernel::{
+    c_str,
+    device::{self, Core},
+    of, platform,
+    prelude::*,
+    str::CString,
+    types::ARef,
+};
 
 struct SampleDriver {
     pdev: ARef<platform::Device>,
@@ -31,12 +38,63 @@ fn probe(
             dev_info!(pdev.as_ref(), "Probed with info: '{}'.\n", info.0);
         }
 
+        Self::properties_parse(pdev.as_ref())?;
+
         let drvdata = KBox::new(Self { pdev: pdev.into() }, GFP_KERNEL)?;
 
         Ok(drvdata.into())
     }
 }
 
+impl SampleDriver {
+    fn properties_parse(dev: &device::Device) -> Result {
+        let fwnode = dev.fwnode().ok_or(ENOENT)?;
+
+        if let Ok(idx) =
+            fwnode.property_match_string(c_str!("compatible"), c_str!("test,rust-device"))
+        {
+            dev_info!(dev, "matched compatible string idx = {}\n", idx);
+        }
+
+        let name = c_str!("compatible");
+        let prop = fwnode.property_read::<CString>(name).required_by(dev)?;
+        dev_info!(dev, "'{name}'='{prop:?}'\n");
+
+        let name = c_str!("test,bool-prop");
+        let prop = fwnode.property_read_bool(c_str!("test,bool-prop"));
+        dev_info!(dev, "'{name}'='{prop}'\n");
+
+        if fwnode.property_present(c_str!("test,u32-prop")) {
+            dev_info!(dev, "'test,u32-prop' is present\n");
+        }
+
+        let name = c_str!("test,u32-optional-prop");
+        let prop = fwnode.property_read::<u32>(name).or(0x12);
+        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n",);
+
+        // A missing required property will print an error. Discard the error to
+        // prevent properties_parse from failing in that case.
+        let name = c_str!("test,u32-required-prop");
+        let _ = fwnode.property_read::<u32>(name).required_by(dev);
+
+        let name = c_str!("test,u32-prop");
+        let prop: u32 = fwnode.property_read(name).required_by(dev)?;
+        dev_info!(dev, "'{name}'='{prop:#x}'\n");
+
+        let name = c_str!("test,i16-array");
+        let prop: [i16; 4] = fwnode.property_read(name).required_by(dev)?;
+        dev_info!(dev, "'{name}'='{prop:?}'\n");
+        let len = fwnode.property_count_elem::<u16>(name)?;
+        dev_info!(dev, "'{name}' length is {len}\n",);
+
+        let name = c_str!("test,i16-array");
+        let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;
+        dev_info!(dev, "'{name}'='{prop:?}' (KVec)\n");
+
+        Ok(())
+    }
+}
+
 impl Drop for SampleDriver {
     fn drop(&mut self) {
         dev_dbg!(self.pdev.as_ref(), "Remove Rust Platform driver sample.\n");
-- 
2.49.0

