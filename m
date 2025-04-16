Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D723B23FC55;
	Wed, 16 Apr 2025 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797624; cv=none; b=i661/wzuKE2IWb21mPp647bBAbVnQkSphNmia62dKlByS49TD+aZx8TU0wg8jGbiB9nQW77YK1ZTbEY0vR4b7K8bJ6fqi/wpQ8TUgnpbGp4GjoAGkptTZ0LCJGoUk/kDcmjz02PgKCGT19LA2cGit92sfNOuk+bGKeh3M/T9ErE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797624; c=relaxed/simple;
	bh=kGN2aD857pJDb+H3nbziFSBMmHeAQay5/PvA7Ob7aBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PMG2kclxI2HrTUyQgNpr1oT0DR5+J9fFxgN0/nawAUANX/IJpAcJf1jtdk5ysAORxJ1/EjZ4UFeOjr+8D26wEPBaAJxr2IZk5D/ZP6VgknzIkLy7e0qe1uTq3uVHPihwYmVH+xMqTu76R35+c6wI9u/cNwJ564aSpjrddu8jDGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [119.122.214.249])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1215c4861;
	Wed, 16 Apr 2025 18:00:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] arm64: dts: allwinner: correct the model name for Radxa Cubie A5E
Date: Wed, 16 Apr 2025 18:00:06 +0800
Message-Id: <20250416100006.82920-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHkkfVh0fS05DTUxPGkhCH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VJT0JZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
X-HM-Tid: 0a963e0ab3c903a2kunm1215c4861
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Njo6Sgw4DzICGhM0OTkPDiwo
	KjdPCkNVSlVKTE9PTEJMTUpJSUpJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUlPQllXWQgBWUFKTEpJNwY+

According to https://radxa.com/products/cubie/a5e,
the name of this board should be "Radxa Cubie A5E".
This is also consistent with the dt-bindings.

Fixes: 80e0fb4e491b ("arm64: dts: allwinner: a523: add Radxa A5E support")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
index 912e1bda974c..03c9a9ef5adc 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
@@ -8,7 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Radxa A5E";
+	model = "Radxa Cubie A5E";
 	compatible = "radxa,cubie-a5e", "allwinner,sun55i-a527";
 
 	aliases {
-- 
2.25.1

