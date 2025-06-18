Received: from forward204b.mail.yandex.net (forward204b.mail.yandex.net [178.154.239.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1DB281531;
	Wed, 18 Jun 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239332; cv=none; b=UyzPEBNZ4wlySd5JGtFYGP4lgFQQ0W56vu+KJz4rwGp/FvHnN6a3Ka7Ia1HSzyUuqlseMY/lEdbdDeSF+KtpGvnxbRBo8cptD7nWXQ20+1q5rinOfmqv3FOWBbz311cDz78hE3ovQeLnfKhb6bHlV3AN29gVrBZwZghceJe+RNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239332; c=relaxed/simple;
	bh=yP0+8GmbtpPKWcM1m16ilybPZ3Jwzm+ZXhYXis/MEcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H76YAja70zycYt+BFSfkqD827TbY2QANNMBBTZovz0n0Jsio5NTMRQvsFqaObgKWpeg6DyrB+Oz69x7lM81GadhTjs8w8BGx0gEyKYT5VtaquEBF+N1RyQOZ3vr6V4Pqht+dpVCxUDhLjeMqxxVIbSk/ww5/JckEldVMTLbAsG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=LOxDWUda; arc=none smtp.client-ip=178.154.239.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="LOxDWUda"
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
	by forward204b.mail.yandex.net (Yandex) with ESMTPS id 0C2E264C39;
	Wed, 18 Jun 2025 12:28:31 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:aaac:0:640:94d6:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 6C21960D12;
	Wed, 18 Jun 2025 12:28:23 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id HSJfHFFLlOs0-oEA26d2T;
	Wed, 18 Jun 2025 12:28:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750238902;
	bh=nLy/zmKoPAJaNBFhjjOaDK0vOCitRXvt18tMyA0z2/s=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=LOxDWUdaWYl9IlKfoU7InmzQpu07ULulEVheZimN/CryD3uTemSR6Rprp2mBQu3AI
	 c4n+A3dxxSOR44VtGtDNns0HoB8K6KSPfyLsG2ZTWqDRGS4L34zCCbnRSJgXcXp5GN
	 cU42cG8/0+pLAuSs0EuSpdtg1RAACdi+iJjinSU8=
Authentication-Results: mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH] rust: replace literals with constants in `clk::Hertz`
Date: Wed, 18 Jun 2025 12:28:10 +0300
Message-ID: <20250618092810.29370-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replaces repeated numeric literals in `Hertz` conversions
with named constants.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/clk.rs | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 6041c6d07527..b8c5dafdc29c 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -30,19 +30,23 @@
 pub struct Hertz(pub c_ulong);

 impl Hertz {
+    const KHZ_TO_HZ: c_ulong = 1_000;
+    const MHZ_TO_HZ: c_ulong = 1_000_000;
+    const GHZ_TO_HZ: c_ulong = 1_000_000_000;
+
     /// Create a new instance from kilohertz (kHz)
     pub fn from_khz(khz: c_ulong) -> Self {
-        Self(khz * 1_000)
+        Self(khz * Self::KHZ_TO_HZ)
     }

     /// Create a new instance from megahertz (MHz)
     pub fn from_mhz(mhz: c_ulong) -> Self {
-        Self(mhz * 1_000_000)
+        Self(mhz * Self::MHZ_TO_HZ)
     }

     /// Create a new instance from gigahertz (GHz)
     pub fn from_ghz(ghz: c_ulong) -> Self {
-        Self(ghz * 1_000_000_000)
+        Self(ghz * Self::GHZ_TO_HZ)
     }

     /// Get the frequency in hertz
@@ -52,17 +56,17 @@ pub fn as_hz(&self) -> c_ulong {

     /// Get the frequency in kilohertz
     pub fn as_khz(&self) -> c_ulong {
-        self.0 / 1_000
+        self.0 / Self::KHZ_TO_HZ
     }

     /// Get the frequency in megahertz
     pub fn as_mhz(&self) -> c_ulong {
-        self.0 / 1_000_000
+        self.0 / Self::MHZ_TO_HZ
     }

     /// Get the frequency in gigahertz
     pub fn as_ghz(&self) -> c_ulong {
-        self.0 / 1_000_000_000
+        self.0 / Self::GHZ_TO_HZ
     }
 }
2.49.0

