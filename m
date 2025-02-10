Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C7253F0F;
	Mon, 10 Feb 2025 22:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227529; cv=none; b=nI6h+QZPfdXv9LqKvFIKmF7sD61lnZzdswHV7NEsUmmcbY5wgOh4FnpG/l+8aOH+co/ofMn5d44Qdu23QAQx1YqTi2qc2/Z5RfxH5pLZENJfKNm1Go80aJbPEIZBU/KE6Um4zltmubqdS0DGcGs7Xx7sOcu+jP260WokPrxVRh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227529; c=relaxed/simple;
	bh=ftEo79nVrBwy7ELzoRgROXCAYRUE2bRoCXZ+F7CDVVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/sJtUwBdmU3fg822xBNiiwI4+4PYstomWdFGLzm8LNETPufBg0Xch+n+kWo3Z/FgxnR9pGEf7iLEYuvZnhR7c4NNiZqEtkTeZbiRYCXVKP2MtA3drlK+aD0UYOXxF7LFylKKcINo6/A061PEYOHQPLG/nbA1It3VcWcNeRDy4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Ai3PI4V4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Ai3PI4V4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GidM2RkVPSnp2I62eKw/eMu8qqKqT/4Si7o7i4IuzDE=; b=Ai3PI4V48kVOVSeVp+RWvcmQRE
	oOBFyiyAay9K5W5ltOJ7xdecpX/GsLCAko/ELY234sinuysiZfbka1nAATlarkO2idV00wp894J5h
	rDhP1cMNGs47ygow/gx2XoRr7voIaRx/snsisuReU/shOWCpPjVnmhT9cx5mEzvafBxjK+BoI2Y+U
	qVQ3+Uj4cwORk+f/3KCDZXsgHcs4BCnd2J464G8xygt0L8fkUB4FgE6nagZWPzumacz2A4Mh7a+R/
	TgLe6vdLJx9t81BWeziQl6JdTpWi10g32MechffHGgTwpwux85EDpXNdYyLUmt4rhhSO7aeu55mNS
	SkGgN8rA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWp-0008Re-C8; Mon, 10 Feb 2025 23:45:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH RESEND v2 2/6] nvmem: rockchip-otp: Move read-offset into variant-data
Date: Mon, 10 Feb 2025 23:45:06 +0100
Message-ID: <20250210224510.1194963-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3588 has an offset into the OTP area where the readable area begins
and automatically adds this to the start address.
Other variants are very much similar to rk3588, just with a different
offset, so move that value into variant-data.

To match the size in bytes, store this value also in bytes and not in
number of blocks.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/nvmem/rockchip-otp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index ebc3f0b24166..3edfbfc2d722 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -59,7 +59,6 @@
 #define RK3588_OTPC_AUTO_EN		0x08
 #define RK3588_OTPC_INT_ST		0x84
 #define RK3588_OTPC_DOUT0		0x20
-#define RK3588_NO_SECURE_OFFSET		0x300
 #define RK3588_NBYTES			4
 #define RK3588_BURST_NUM		1
 #define RK3588_BURST_SHIFT		8
@@ -69,6 +68,7 @@
 
 struct rockchip_data {
 	int size;
+	int read_offset;
 	const char * const *clks;
 	int num_clks;
 	nvmem_reg_read_t reg_read;
@@ -196,7 +196,7 @@ static int rk3588_otp_read(void *context, unsigned int offset,
 	addr_start = round_down(offset, RK3588_NBYTES) / RK3588_NBYTES;
 	addr_end = round_up(offset + bytes, RK3588_NBYTES) / RK3588_NBYTES;
 	addr_len = addr_end - addr_start;
-	addr_start += RK3588_NO_SECURE_OFFSET;
+	addr_start += otp->data->read_offset / RK3588_NBYTES;
 
 	buf = kzalloc(array_size(addr_len, RK3588_NBYTES), GFP_KERNEL);
 	if (!buf)
@@ -280,6 +280,7 @@ static const char * const rk3588_otp_clocks[] = {
 
 static const struct rockchip_data rk3588_data = {
 	.size = 0x400,
+	.read_offset = 0xc00,
 	.clks = rk3588_otp_clocks,
 	.num_clks = ARRAY_SIZE(rk3588_otp_clocks),
 	.reg_read = rk3588_otp_read,
-- 
2.47.2

