Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C1A146A68;
	Sat, 19 Apr 2025 03:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745033578; cv=none; b=NHrHRWZ/ffQCk1xzlvsCTJ1KNy9BfcZu4Ly5dvuCkEST+0lMWKqbnhdu1X/+QGFiqujokoclMxKhIPdAbPZGP0uPQXTkz9drTScRn/YbsPlGy7aZ+PN346uOv3SkPjmg0NL9NMtg1uUBHycyxWON8ZwyIT7Yg5c7JoxQuCeFup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745033578; c=relaxed/simple;
	bh=1lyIFLBt62MDSyjlKUp7yZb6HXkiKK19zM19Y3kS9H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=azuAPxNu14GwpPXR7bzxY9F3iiME6amF4LaDxgv4v5JIvWIy8JzuegNUmiodMfxoE0xgsF0yHd3zVIuHo8u78OfdFN9QqaHLU5rfBoUuFuKkFKblqFV0xsHGdNPS7a9JYoje+mIGx0XgKCkihc7fWjbpTYfWwqXBxwB628XB3+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BD7FD343003;
	Sat, 19 Apr 2025 03:32:51 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 19 Apr 2025 11:32:30 +0800
Subject: [PATCH 1/2] riscv: dts: spacemit: Acquire clocks for pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-05-dts-clock-v1-1-1cce5d59aba2@gentoo.org>
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
In-Reply-To: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=1lyIFLBt62MDSyjlKUp7yZb6HXkiKK19zM19Y3kS9H4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoAxlXK3lMEs/5J8RMMiYgvTqcW3mtjFu3h4ZoQ
 86T0ew+cyiJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAMZV18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UQREACSNZDSsNl+LRlFTb
 UtR9eYCCQMVV0I4iMo9KDdPFvOnYfWgpfrP96bdR3uupMlozMUkqC62gPwGlPQf41dRhp4ommNY
 ZGDJyvTmaVZIG7sPl97v85vFvV2tEpEUTMWcvSPz2uJBXPpBbZ5GM5f6SBAeDQRjXEHGja3nLzt
 Y0FkkyPJluscwDOn5iJcYTG88AnIGAgUbrEG82ORvZ83MUW5p4j5TgNzWuPBSxR46f37ubP/KLC
 EW/fqMv+P9ywDYeGLRGNsttDX1PzC+hjJEROqBvDXe5jfoq7zv3jFbQOUF70qvT6+GBRw9zSx0B
 yhhap/fwp2k3bnj78AbUcgIXcCwHIUbRNYiDUiKy2g8GIe5MSbJ7/5LRbhEifNAqHDjN3/xIklW
 xseXpWhExw/KKm1B+ii/r8X5lJqEsZXKwEUTsjz9jg/IOIZVNqwQbMIXDGXnwN5fuHWxYFxCI4h
 SM1KNf/UtzNuwHvltloaDoyK6HWAnqv3AmPstgLs07tyDJiCy0/IaW+XvdTsykhYOZQVsYjAWZe
 OZ8kBx63xPd3GO9KkiDYl782tLlG8MiD2Ebf0d/zO024ROmPoZOBJreGrrEVIGFyZmPDyIAXyIz
 HJNJ8HDOZF4xow7qO6ZN89xzzUN2gmujPq4XUrLHMOHhOkIIsEt0RKgvhV1WhObtfUnw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Pinctrl of K1 SoC need two clocks, so explicitly acquire them.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 584f0dbc60f5b0d078c7127cc4021ad6022cb182..153fd1160182b42fe1a2f7f042c9c1da90f63b0c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -450,6 +450,9 @@ uart9: serial@d4017800 {
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
+			clocks = <&syscon_apbc CLK_AIB>,
+				 <&syscon_apbc CLK_AIB_BUS>;
+			clock-names = "func", "bus";
 		};
 
 		syscon_mpmu: system-controller@d4050000 {

-- 
2.49.0

