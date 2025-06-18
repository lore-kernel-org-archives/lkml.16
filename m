Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [178.154.239.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA18460;
	Wed, 18 Jun 2025 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238162; cv=none; b=dLEFOo4EC6i46eS4crP1k1LqlHJSeuTY9LvcVBGBxUroaa2sks3sTpFahrpO6Trlxwy0vuTT9enZ3D6ekPV+r7HdGJ2AepS+7qltYjCwry3K7utefXLK+0SBDdLSMYvwcjEvU0WbHG3rvmD1Rh9DyUcwQ1w02ogxKuq0gwccAow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238162; c=relaxed/simple;
	bh=ZG2A4iSucAU291eWSjW71lggtPyweGYcMynvg+qYv0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fs0Lr1glBWXQXBWbUzPyqVcLS+29vWLYJUaq5azl0iDwVNnEoogQejMCM9VgvrV7knivplFKAmqEUnXua0P1oL+UrAWEVsEogvv3WSgIwuF12pCMaUI4lgv/iyk73RTnfLZPb+NjY2COYrhDWjiyUY286UJAhf9JHIdl+GdP2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=bJoMnF34; arc=none smtp.client-ip=178.154.239.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="bJoMnF34"
Received: from mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:4898:0:640:7065:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 1E367609A7;
	Wed, 18 Jun 2025 12:15:51 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id ZFJToBFLZKo0-f6wDD1so;
	Wed, 18 Jun 2025 12:15:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750238150;
	bh=rKI5qWlXphdfpnYiW4pjsQe5ZK9YH76/sNIC0XCwXUI=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=bJoMnF34cHVioZptjl0N4Twc2WBKJNA7a5ZKvWHX4c3mRzti3hD73mmVXqca4MN5P
	 D8UJzoHczMUPte7VaAHTgmzkj+Wv+oGNZl51djXnUbFWk+o+QbJ4ukonPyXKybqo5G
	 p8XW/Srin3exiRLWpN/LNKiqESsp5k6w5Falq7dQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-clk@vger.kernel.org,
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] rust: make `clk::Hertz` methods const
Date: Wed, 18 Jun 2025 12:14:42 +0300
Message-ID: <20250618091442.29104-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Marks `Hertz` methods as `const` to make them available
for `const` contexts. This can be useful when defining
static/compile-time frequency parameters in drivers/subsystems.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/clk.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 6041c6d07527..ef0a2edd52c3 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -31,37 +31,37 @@

 impl Hertz {
     /// Create a new instance from kilohertz (kHz)
-    pub fn from_khz(khz: c_ulong) -> Self {
+    pub const fn from_khz(khz: c_ulong) -> Self {
         Self(khz * 1_000)
     }

     /// Create a new instance from megahertz (MHz)
-    pub fn from_mhz(mhz: c_ulong) -> Self {
+    pub const fn from_mhz(mhz: c_ulong) -> Self {
         Self(mhz * 1_000_000)
     }

     /// Create a new instance from gigahertz (GHz)
-    pub fn from_ghz(ghz: c_ulong) -> Self {
+    pub const fn from_ghz(ghz: c_ulong) -> Self {
         Self(ghz * 1_000_000_000)
     }

     /// Get the frequency in hertz
-    pub fn as_hz(&self) -> c_ulong {
+    pub const fn as_hz(&self) -> c_ulong {
         self.0
     }

     /// Get the frequency in kilohertz
-    pub fn as_khz(&self) -> c_ulong {
+    pub const fn as_khz(&self) -> c_ulong {
         self.0 / 1_000
     }

     /// Get the frequency in megahertz
-    pub fn as_mhz(&self) -> c_ulong {
+    pub const fn as_mhz(&self) -> c_ulong {
         self.0 / 1_000_000
     }

     /// Get the frequency in gigahertz
-    pub fn as_ghz(&self) -> c_ulong {
+    pub const fn as_ghz(&self) -> c_ulong {
         self.0 / 1_000_000_000
     }
 }
2.49.0

