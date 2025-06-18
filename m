Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C6B2F4A;
	Wed, 18 Jun 2025 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239333; cv=none; b=cMWUoDGLC6LMAkpjXmcXRikZmgz3+dzH4DfnJUfkMVXChtBXZyqIFDU4vrk4Vu1P2UglE5aBORN2RrOaFBsZCk88DP1+ynnhO581mHrJ7ZaWJSAnD5+MXK9h62rr5/OqHIts3UHHJMTRPtAAiiBANTxC64T5sek15+fxkFRGO/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239333; c=relaxed/simple;
	bh=YU3g3k0WI0TIreD0uy1PYqPC1ea+hDt2Wtn110/Qe/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hvS8VKMpCHqUqNSj4s2m9rWPVFf3V7nTNTJTk4ebqeI+mz3hvskRwjkMTMnH2hw1DPHwzJyWa3a0S5N/267XQML6m0/HQ9VOUFyHXhdCbTfSFVBax7iMDdx+hSPFWHlM9TiqIoXwG/MKC3jjlEFzuqCbE37WA2zRsb2as2Gx2aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=i5BaFQa3; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="i5BaFQa3"
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:c54a:0:640:3e90:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id CAE4160975;
	Wed, 18 Jun 2025 12:35:20 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 9ZJio6LLhGk0-CUnUE2OG;
	Wed, 18 Jun 2025 12:35:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750239320;
	bh=laVuCmTHwnEXq+teSL+zw/wpHFG9GlwTF+ioUX7tsiU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=i5BaFQa3lQR5V9OzsYmEXI5GUiHGTG5vNASPSuYzypwXIKdMMtO8wL79w713DQXQ0
	 pHBEKc4NuU28+X5b02Kg8rQiTsdz9BcxYL7OUaYMq3ttZbIYp8yHfU3faKg9+6RPxO
	 p/XrkVGxiG2ReQtO/ymX4Va2Y4oF9GWRaUPp3aTk=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH] rust: shorten `con_id`s in `get` methods in clk module
Date: Wed, 18 Jun 2025 12:35:08 +0300
Message-ID: <20250618093508.16343-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Converts `if-else` blocks into one line code using `map_or`
for simplicity.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/clk.rs | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 6041c6d07527..b09f295addce 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -132,11 +132,7 @@ impl Clk {
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
@@ -304,11 +300,7 @@ impl OptionalClk {
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
2.49.0

