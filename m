Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC53623183A;
	Thu,  1 May 2025 04:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746074622; cv=none; b=lNlO5vxecSEw8Foiapy6kkjQBZX2qAPKQsZnVqlls1XgQmQlgsev0G65BJ7XwjFeUkkl1mDHDyHvb9d7WNXI7/lMtUxg4Rw8zYW528LPZyMMp18Ngpa+Cvt6UVrI9Ft5Xctll6pCufjKuqbA+6yax4OQgW7odbgt1Cpi1227zxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746074622; c=relaxed/simple;
	bh=5FPWhBm4X1OTS7xp/ARoIaRaAOjl3Qg4OzcTMaWFyI4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUbB4mfvMfHQqIAiFBC46m7jZ3pJE0+dMi2yTjsg/Omz0O8cqwOSFQCgo0UrIGblBVvPV3tHTEr2VU0v1xptig5vf2Lh3PzRPjc/CnABOM6/nMRuhbugt/V/tlJd9drLQT79jpuKyx9OMWxPF4+/mVpieM6eeFc+Dv1aXwkRW4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QKGR4Pxf; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QKGR4Pxf"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0045D25BE2;
	Thu,  1 May 2025 06:43:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfSt8HToqoqj; Thu,  1 May 2025 06:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746074617; bh=5FPWhBm4X1OTS7xp/ARoIaRaAOjl3Qg4OzcTMaWFyI4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QKGR4Pxfm0vsKev0STRjYqRyiJ8pNwuwFVM6ciHT2RNlpoihDYk9bNbiGoARAhpht
	 aPX6ItGqtNvkbrIrBE9bt6tD8MX/xyI1vtHqbxuwJsso0RkEjoSOubiD8o+USMhmCE
	 lGVOmx1D3SuWKJoOiwy4Xt4A/xB0Qxpa5ZBCOepcMusW/Pz9b/FIPVnRPU/rVxMyd6
	 nXKygsbiRtUZOlL3ZBw0AWUt22gmStI152FX7wQh1qvmCrksYj7d+A2idlaibEvDnu
	 WhCLwB3Vvr2xabHmEZ4vzEpPboN0qahKRfnkg2kO8xhwDw0wNIFfJMVuN/3bfQrEVi
	 2Y9zzAtyOZtZg==
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
	Binbin Zhou <zhoubinbin@loongson.cn>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add CTCISZ Technology Co., LTD.
Date: Thu,  1 May 2025 04:42:37 +0000
Message-ID: <20250501044239.9404-3-ziyao@disroot.org>
In-Reply-To: <20250501044239.9404-2-ziyao@disroot.org>
References: <20250501044239.9404-2-ziyao@disroot.org>
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

