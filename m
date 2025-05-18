Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39AD188CB1;
	Sun, 18 May 2025 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555473; cv=none; b=mwIctffR0weRNydDWBpRpBHL+JqO7pmUZlaF8gVg66cMHcsjrYoFu4fnKrPO36D/U60yiYHMu72Pt3VaNw8lirWiXG/C7K6k6eZgqJkNmV5/TS+vdaaB3oj0Lb/Ul7mYzBvh2jKCNAEUbaQOP1lRNW401ZBSNpCgPrMOAWsqlu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555473; c=relaxed/simple;
	bh=4kTselMSX3qhJVX2g5hVPG/pZaQRbrwMDnvZHbpjioM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGE1vkeQ+/jcskDFxWCWw+Nd0KxZazIfBMr/SMTeP/2YRR5ssjk7mRmhQe3Zw5xFPVfoR01bli31H4Q20WGBy+Tq+aDruvWD7SSUeCMJXuZ6d9al9NqYzvkkG6ugsZ/9b/Uf2LTNUfiSUTi52s5vekMoovqEgKWplUQZujoGOTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PjidECWP; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="PjidECWP"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B994525EF1;
	Sun, 18 May 2025 10:04:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEADBvbzyKv1; Sun, 18 May 2025 10:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747555462; bh=4kTselMSX3qhJVX2g5hVPG/pZaQRbrwMDnvZHbpjioM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PjidECWPLcLc0GdlG+TBd5cd21DiefWYf6ipk8OkSMGg0ZBPFAJ9AvR3tcu24caT4
	 OuIDkj9RvvuLlYW+jWGz2P04OvnhFZjIXJXwYw4h7ukutOs3SVdI2YCBcNnu8+AZyj
	 6QCThavnK+EOBEX3VriR8wh2SFhNCOiiEfUXb73eNtzbKoqXFQ2gHaVyOGcU1/ovyM
	 V8FEdgzOag4GUsBmRTnb8TJ9oxaJKOqvOe2QikaMOEqH21TeK9EuQqEkBMqdN+ovue
	 7ZyunveknSc2iyppREA/fNrOUPvpZplAoMOmzLTm0EsptR7a0DEUfrB1S5SKJwUSHC
	 SrrxeqE5fCcuw==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add CTCISZ Technology Co., LTD.
Date: Sun, 18 May 2025 08:03:53 +0000
Message-ID: <20250518080356.43885-2-ziyao@disroot.org>
In-Reply-To: <20250518080356.43885-1-ziyao@disroot.org>
References: <20250518080356.43885-1-ziyao@disroot.org>
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

