Received: from forward205b.mail.yandex.net (forward205b.mail.yandex.net [178.154.239.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75961F873E;
	Mon, 16 Jun 2025 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750104509; cv=none; b=ThGv2Lqq9V0ppR4zxgj+AhBxH+nT5vntbSq+6viflNynmTdqqTbBlROBdGGuSq9cYmY6vQ4xhgA2nDNbXeOCLgs8k6C+3599ZNH8GFP4m2VkUeACR/Ll/uptwGgWs+wnfRybQ+OTwdUCEPPzNfiZKa393CI9e6dRrjICDvQ6e4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750104509; c=relaxed/simple;
	bh=+LwYjfXJzueB7HaMa0+cHKiOwLTDmmJ5whlPzH24Ljg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLo6eVQDtnYMDUlNotik/C2SAH1qbZm4Rx+hVxaRS+VnQHg/UHIo3v/j0qDjxwPn4R66ebEnpkdi9Vc05bU+mMT4Z/2EaLsP3SxfsyqVqHzGEJZA5ZPOSQ8rCi+AOnUUKYgVD9qNS+bjgH2qggUWI4A0sFgXRRMPFiG3HjvtlV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=X4eg9QPP; arc=none smtp.client-ip=178.154.239.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="X4eg9QPP"
Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d101])
	by forward205b.mail.yandex.net (Yandex) with ESMTPS id 6624363755;
	Mon, 16 Jun 2025 23:01:30 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2ea3:0:640:da3e:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id 4C7D660B5F;
	Mon, 16 Jun 2025 23:01:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 91SLuw2LfuQ0-4O6sO5JM;
	Mon, 16 Jun 2025 23:01:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750104081;
	bh=NrkI11pzc6I77alUozshicWIJzB5Sj6lRW/o0Skdp4o=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=X4eg9QPPya0bErN2fEvwvQAuok5HbTxXBj9oGTok0h3/McMt/QHBimmY5aC3Nyq7u
	 ZsISnjmFZUR7kjw6A63RWim88VnCN2nVspX/ZO2CTCCBOrjEl2wUVKohdeIxKUahES
	 9xPufU6USArAvMJiypLF7KFnL28n0v6++qbuzAog=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: onur-ozkan <work@onurozkan.dev>
To: linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	onur-ozkan <work@onurozkan.dev>
Subject: [PATCH] Various improvements on clock abstractions
Date: Mon, 16 Jun 2025 23:01:03 +0300
Message-ID: <20250616200103.24245-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few changes to improve the clock abstractions and make them a little
more idiomatic:

1. `impl Hertz` functions are now constant and compile-time evaluable.
2. `Hertz` conversions are now done with constant variables, which should
    make them more readable.
3. `con_id` is handled in a single line using `map_or` instead of using
    nested if-else blocks.

Signed-off-by: onur-ozkan <work@onurozkan.dev>
---
 rust/kernel/clk.rs | 42 +++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 6041c6d07527..fbcea31dbcca 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -30,39 +30,43 @@
 pub struct Hertz(pub c_ulong);
 
 impl Hertz {
+    const KHZ_TO_HZ: c_ulong = 1_000;
+    const MHZ_TO_HZ: c_ulong = 1_000_000;
+    const GHZ_TO_HZ: c_ulong = 1_000_000_000;
+
     /// Create a new instance from kilohertz (kHz)
-    pub fn from_khz(khz: c_ulong) -> Self {
-        Self(khz * 1_000)
+    pub const fn from_khz(khz: c_ulong) -> Self {
+        Self(khz * Self::KHZ_TO_HZ)
     }
 
     /// Create a new instance from megahertz (MHz)
-    pub fn from_mhz(mhz: c_ulong) -> Self {
-        Self(mhz * 1_000_000)
+    pub const fn from_mhz(mhz: c_ulong) -> Self {
+        Self(mhz * Self::MHZ_TO_HZ)
     }
 
     /// Create a new instance from gigahertz (GHz)
-    pub fn from_ghz(ghz: c_ulong) -> Self {
-        Self(ghz * 1_000_000_000)
+    pub const fn from_ghz(ghz: c_ulong) -> Self {
+        Self(ghz * Self::GHZ_TO_HZ)
     }
 
     /// Get the frequency in hertz
-    pub fn as_hz(&self) -> c_ulong {
+    pub const fn as_hz(&self) -> c_ulong {
         self.0
     }
 
     /// Get the frequency in kilohertz
-    pub fn as_khz(&self) -> c_ulong {
-        self.0 / 1_000
+    pub const fn as_khz(&self) -> c_ulong {
+        self.0 / Self::KHZ_TO_HZ
     }
 
     /// Get the frequency in megahertz
-    pub fn as_mhz(&self) -> c_ulong {
-        self.0 / 1_000_000
+    pub const fn as_mhz(&self) -> c_ulong {
+        self.0 / Self::MHZ_TO_HZ
     }
 
     /// Get the frequency in gigahertz
-    pub fn as_ghz(&self) -> c_ulong {
-        self.0 / 1_000_000_000
+    pub const fn as_ghz(&self) -> c_ulong {
+        self.0 / Self::GHZ_TO_HZ
     }
 }
 
@@ -132,11 +136,7 @@ impl Clk {
         ///
         /// [`clk_get`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get
         pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
-            let con_id = if let Some(name) = name {
-                name.as_ptr()
-            } else {
-                ptr::null()
-            };
+            let con_id = name.map_or(ptr::null(), |n| n.as_ptr());
 
             // SAFETY: It is safe to call [`clk_get`] for a valid device pointer.
             //
@@ -304,11 +304,7 @@ impl OptionalClk {
         /// [`clk_get_optional`]:
         /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_optional
         pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
-            let con_id = if let Some(name) = name {
-                name.as_ptr()
-            } else {
-                ptr::null()
-            };
+            let con_id = name.map_or(ptr::null(), |n| n.as_ptr());
 
             // SAFETY: It is safe to call [`clk_get_optional`] for a valid device pointer.
             //
-- 
2.49.0

