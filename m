Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83725F7B0;
	Mon, 28 Apr 2025 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832296; cv=none; b=kTZHICapF5NU7pSBl6CEG8hRToG6SZ3m2Q5bhUxk+bYek8OyqxSiL5Tg7RCpMlit2qQgEPTRpp8iMKTgon3ZBEpz/PqpsAAjmX/ZskstaHU30NxnFrfj24QRJI3VNokCpAv6Pw1ThkKuTWEHIjgtlVQmSqg7AXX1iv56432w290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832296; c=relaxed/simple;
	bh=12svZieZzYZWxjZgqhIe9t35WfYRR9u0DVRJ0tz0wUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iTfQ5ToWlk+oxDyA8LPwhWbTk/6Tp58Y3ozC54dJVpNpJvlFfyPa4QCRKGXEBF3lgt0VrcudJHOIJMhy7QpahIOwEJCO5Z4OFdSuHyAEzh9S+nVbOsE+AkEZuYwBiK7dAriFgEl3q92gnLYgd8v4wlwXwXa0in2mKSHQ7O09V74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13638c211;
	Mon, 28 Apr 2025 17:24:44 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 28 Apr 2025 17:24:36 +0800
Subject: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for
 CV18xx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
X-B4-Tracking: v=1; b=H4sIAFNJD2gC/x3MQQqAIBBA0avIrBsw0YiuEi0sZ2oWaShFEN09a
 fkW/z9QKAsVGNQDmS4pkmJF2yhYNh9XQgnVYLRx2poew5kw7B6XFFlWZJotOdLOdgw1OjKx3P9
 wnN73A9YtdeFgAAAA
X-Change-ID: 20250428-duo-dma-config-feb4e5e0546f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huange@whut.edu.cn>, 
 Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832284; l=1588;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=12svZieZzYZWxjZgqhIe9t35WfYRR9u0DVRJ0tz0wUk=;
 b=VsL7xRIWnuhLE4kowb4JUDpMfPxlbEViDoxG8TY53XCL6zQ5eUNaGE1UaXhWvpeWHcxq8kb7R
 WxsGNmqzWExApEkYjGCXuv6hkVnnV6A/2aukDchpmHMnL/V0FpH3zjp
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEpJVk0eGUMfGk1KTEpCQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSElMQktVSktLVUpCS0
	tZBg++
X-HM-Tid: 0a967bb691d503a1kunm13638c211
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6OTo5AzJOHTQtSAEBNisq
	LjMaFEJVSlVKTE9OQ0hJSUJLT09PVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBSEpOSjcG

The "snps,data-width" property[1] defines the AXI data width of the DMA
controller as:

    width = 8 × (2^n) bits

(0 = 8 bits, 1 = 16 bits, 2 = 32 bits, ..., 6 = 512 bits)
where "n" is the value of "snps,data-width".

For the CV18xx DMA controller, the correct AXI data width is 32 bits,
corresponding to "snps,data-width = 2".

Test results on Milkv Duo S can be found here [2].

Link: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/dma/snps%2Cdw-axi-dmac.yaml#L74 [1]
Link: https://gist.github.com/Sutter099/4fa99bb2d89e5af975983124704b3861 [2]

Co-developed-by: Yu Yuan <yu.yuan@sjtu.edu.cn>
Signed-off-by: Yu Yuan <yu.yuan@sjtu.edu.cn>
Signed-off-by: Ze Huang <huange@whut.edu.cn>
---
Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f353bc296965d2d600a3df314cff6..58cd546392e056a3bbdf9c27a73c050de1060fba 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -341,7 +341,7 @@ dmac: dma-controller@4330000 {
 					   1024 1024 1024 1024>;
 			snps,priority = <0 1 2 3 4 5 6 7>;
 			snps,dma-masters = <2>;
-			snps,data-width = <4>;
+			snps,data-width = <2>;
 			status = "disabled";
 		};
 

---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250428-duo-dma-config-feb4e5e0546f

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>

