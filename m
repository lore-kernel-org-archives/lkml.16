Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0482F3E;
	Fri, 23 May 2025 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994085; cv=none; b=hKRGgVb2pSz+nbitBy/3m1GrYP7ZHsrWWRRLafqpbsYvuwfHyY1HoTRzH4w7XDhT01peKP7Th55034t8C1bVffXFWrHpb1LPHgwBm3VhR3l2UjzuLcjuGNm6ihyc+Pcgy/yV0C9at2wxtZYo8g3VMs8AvdCvArToH7uoQD8BdRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994085; c=relaxed/simple;
	bh=sRRjPUmIqYUdwSQpeIZVUP6SShzlUr9KqJp8thVkl6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7FHP0JkEZ9vW7pZv3926jsLPNIkbUnTgaFoHIm2Yz6VCV6/UX/o3WuDMLXSnAvcQdK087HcxDWOrbK5QalMvm7NlbLza4YEILVnXeLYYkUa47/NDBm+f7pE8y92sbD+K4QiVngH4+C+sGwNGH/8Vnm1vweB0MowDtzn03J3Kyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Qi4OieKX; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Qi4OieKX"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1F2E726144;
	Fri, 23 May 2025 11:54:41 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPAIPWj2ALs0; Fri, 23 May 2025 11:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747994079; bh=sRRjPUmIqYUdwSQpeIZVUP6SShzlUr9KqJp8thVkl6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qi4OieKXc5Jb29iv2NOxZ/RtFw8udWZOcDNkg8vVIujwZDJ99jtiJvsQ4N28XFo9r
	 s05HzTjUQnaV6Gs6vPLvfVXUu0TVtz+POIvL1quwv8yHiCyuT5BwHSQm7lEdNRehJw
	 RzAjzu+4uljU6sCE3c38ummNpksAeS/yYzLIykCrZ2D410jcjc1qt2ohruyQ4CU/3z
	 0986d9hCP6Cjr92oTn3h2WpohjiNewIZi6E5kJ+gNFHhp9L3lnkL4wVQqsMMGxioOM
	 TxSY9yqEd5d//iJcRpf2LZLpzXm2gvrRYuU96LBzZan2ZKV/jHnwoINWTNcte61rZa
	 Ae7BqieE96v1A==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yao Zi <ziyao@disroot.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Yanteng Si <si.yanteng@linux.dev>
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add CTCISZ Technology Co., LTD.
Date: Fri, 23 May 2025 09:54:05 +0000
Message-ID: <20250523095408.25919-2-ziyao@disroot.org>
In-Reply-To: <20250523095408.25919-1-ziyao@disroot.org>
References: <20250523095408.25919-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CTCISZ Technology Co., LTD. is a company specializing in designing of
embedded systems. Document the vendor prefix.

Link: http://www.ctcisz.com/
Signed-off-by: Yao Zi <ziyao@disroot.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..02f35e583948 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -344,6 +344,8 @@ patternProperties:
     description: Guangzhou China Star Optoelectronics Technology Co., Ltd
   "^csq,.*":
     description: Shenzen Chuangsiqi Technology Co.,Ltd.
+  "^ctcisz,.*":
+    description: CTCISZ Technology Co.,Ltd.
   "^ctera,.*":
     description: CTERA Networks Intl.
   "^ctu,.*":
-- 
2.49.0

