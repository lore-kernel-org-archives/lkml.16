Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EBF221FDB;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375375; cv=none; b=svczllbu8KLAlwD0NE6uqlYZakTuW39s2NSF2MZ7UJrC+Ivz4X2PR1vL4FM47PNfKr+EvAKUZtjnwuQhOuGoZ/QSl1wKkJzphMrd+qM61sQkfiF87dadigOggqIDvbe1kzS01pqUgZSzk9/8z4+Z31h5KYES8+6CutHSaAo9kck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375375; c=relaxed/simple;
	bh=h91kvtbHybCRq0mtV86D3bylhFUe+/Vc/2PFX8biaKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BKGZuiexMofJRnZBDWddomMwZQ5SYiOWIn52MPoB+a3I/85+4P0Kfgxys8u7IXodVXBSmoedhTUr0anUTPke3qc2WPqVdVfToRsdugBm87PSIl4L38AKm/HcRt2KpZpYvIWscgF6pq7Jj5pVASWBCs5RTaf7+f1EK9W8ZApXxZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4l/n/yX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4l/n/yX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 247E1C4CEEC;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375375;
	bh=h91kvtbHybCRq0mtV86D3bylhFUe+/Vc/2PFX8biaKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p4l/n/yXGL07puYnYDDXxapTQdssnlMlIC8A7LkUh1mxNn1fONnffscPSKdeiCxuN
	 Nvsb1Pp8PebunxZxG2Aijs5UQqQFbZOPfCdeTCYPACVMe9jAv6ukiCgwvukEJOpr9h
	 boj7wgp9AyNaTX0M5ZMMhozrVEWcxwDPow3KZMRJzsbxhKhT3vIR24uXMq3PbEjJwB
	 l9eDWyr1ndb3oUseTl/oi5uowrewunARjMVefRkj/mdEouS2aW9/djkZtzkEfmRdc5
	 gjXx9u4z2GfvyiUo72qzN13htSAFP7YkvoZweopRA1NmtT1+ICN56FJPIy8Vm30OVw
	 +hnN1b9XdeetQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1855FC369A9;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 20:42:48 +0800
Subject: [PATCH 6/7] arm64: dts: amlogic: C3: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-clk-measure-v1-6-cb46a78d019a@amlogic.com>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
In-Reply-To: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=777;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=RawVLe8oduTQK4vrDANIUMhpJtp0oGlCVlxkPVdHe1c=;
 b=kD+M8iLLzKrtqwHv85JmaHPCN+0T/MomV0av1kF1svLfbHmi3SSYxB5FAsMaSYqaUEDZLlmm1
 PtwybkplcdiCjWOXzWuAH2eETaxwvqJxyO0R6+ncKnFeRlBzSaXHGv5
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for C3 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index fd0e557eba06..cb9ea3ca6ee0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -760,6 +760,11 @@ internal_ephy: ethernet_phy@8 {
 				};
 			};
 
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,c3-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			spicc0: spi@50000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x50000 0x0 0x44>;

-- 
2.42.0


