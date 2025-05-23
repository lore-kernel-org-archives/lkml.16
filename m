Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0725622B8A4;
	Fri, 23 May 2025 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994091; cv=none; b=WP9a0Ku2QZrBH9QMTR0Q3+DCHM2ErWjR2p2lirsF0LAw3DCERlufUQQZ47G7cKqK7iB4IOtR/D5E8F+GhJrC24o0o6EmXTGZS1ZCmu+8VO2fhiNS2tPFkAGb7K51qQlZlLlTI6mp03eEl1QbiePmiMUkRQOfTtAAcjHu4e+x0rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994091; c=relaxed/simple;
	bh=hRSFkOL2tHma6126XgLKEa3jEbfh8rjzKzgSKNVJvc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBdHCaDvrONcb/h+Kbyl3cVQzeZcSNJQa7ND61JxCHhUwlJaW7PtSQxGjckfyrBgfzrPO88cPjM1JH5ikKgmkLG5vyo59vl6PZrohzsjOowvL9dllV5Bz2oyl5i6+C56kfw6ScaSTz9LziZmkrnMJCsxfliBWWVMH2kghX3Ws6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hy/vlxde; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hy/vlxde"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 88FB226282;
	Fri, 23 May 2025 11:54:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCvei-nVa1yr; Fri, 23 May 2025 11:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747994086; bh=hRSFkOL2tHma6126XgLKEa3jEbfh8rjzKzgSKNVJvc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hy/vlxdeyX+zFtzpnt40EFL6JZbAdvGoBrnoH4JwxJaZ6ovm4gXc0bCBA9t49WVNl
	 l3cEUmgx6L/gfsIsG4sxvVnuAM5jnXP/bjowMJH359NDq9dO30Jb910myyoyEQ7ADc
	 gGAqjeWBI8EJx4oqOovbhdzsp05ctizVdwVWErScM9yZWILzpNnm+Wo9E6UiANYbe3
	 27G1txw0fBqASQXGgBayjhKaays+a7V15aJ2KlXppPV5sPSEd7P51uEOcSUYDPSLnl
	 7Byi+YmDEZWZypkGxfU+YyOBgLWasxKpWlfaHoTDd/MXD5iT6dDbKAPqQF4eZvbU1R
	 JagDMyRkpANdg==
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
Subject: [PATCH v3 2/4] dt-bindings: LoongArch: Add CTCISZ Forever Pi
Date: Fri, 23 May 2025 09:54:06 +0000
Message-ID: <20250523095408.25919-3-ziyao@disroot.org>
In-Reply-To: <20250523095408.25919-1-ziyao@disroot.org>
References: <20250523095408.25919-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Forever Pi is an Loongson 2K0300-based development board produced by
CTCISZ. Features include,

- 512MiB DDR4 RAM
- On-board eMMC storage
- Optional SD Card support
- 2 USB 2.0 Ports (OTG and HOST)
- 1 GbE Ethernet port
- Optional WiFi/BT support
- Audio output through 3.5mm phone connector
- Optional display output through RAW RGB interface

Add compatible string for the board.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
---
 Documentation/devicetree/bindings/loongarch/loongson.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/loongarch/loongson.yaml b/Documentation/devicetree/bindings/loongarch/loongson.yaml
index e1a4a97b7576..2479174ed454 100644
--- a/Documentation/devicetree/bindings/loongarch/loongson.yaml
+++ b/Documentation/devicetree/bindings/loongarch/loongson.yaml
@@ -14,6 +14,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: CTCISZ Forever Pi
+        items:
+          - const: ctcisz,forever-pi
+          - const: loongson,ls2k0300
+
       - description: Loongson-2K0500 processor based boards
         items:
           - const: loongson,ls2k0500-ref
-- 
2.49.0

