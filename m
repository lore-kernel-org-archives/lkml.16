Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA14230996;
	Thu,  1 May 2025 04:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746074626; cv=none; b=QCe4jFZAzgILFDntFwKoqH607rbmx5mPcPiZInClqSkuKeCurPBhz9Gqg+i1/pdRrralQHtZZQwWd76eCMaOkYGXWRIZkhfK/uBv7xECXcOmrZDLPklQVRRDZeEnwn23/Ven72pmns0wRC3k9a0kkPsJHD/6Yr9TzR2sOC4UGEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746074626; c=relaxed/simple;
	bh=RggON0UjwVa+nbqqp6XR8ixRZig/L4ZZxgT1eqqtdto=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgwYyc1RKPwjf+V9/mvlz3r8+9F6NFGDWZpv2/b6szXwRAqVMXdaKACfV+N38jcu6oxqe84+igGPDn5OItt1MWHrrhKRlkmHuzoySA0UIOYZxTlbl2M5PFd/DBtnQfWmJ5Ha5Cc9imKpkpv1+FLHkva4ZiHOJZuTWMCzst9wG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=j7VHJL12; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="j7VHJL12"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8828F25EBC;
	Thu,  1 May 2025 06:43:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtbNEGX4b9kL; Thu,  1 May 2025 06:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746074622; bh=RggON0UjwVa+nbqqp6XR8ixRZig/L4ZZxgT1eqqtdto=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=j7VHJL12eErrouR3BXBI2wHFqjcosCW3XIxpVdDGrE3SGNE2ZUarkVmFy7qNPOzPV
	 Y+UPapI20hv6wr38hlDg7mUT92ExAE8OjF49TsEM6QVotpychccq0lVyZ91DVZX9CW
	 QBtK6x7BudJduElt57coIvFCQHbICnn5uLIBYPVkAp1PdMkpMo8hDXX++ihLpOCi8z
	 hce0Nc+AXaeJ5R189O2CRZVuH7mgWF+dY8ENaNmDuPhD7xIhxCy+HXwp67OhzyPKlo
	 A7+Bo7tS5JH/lDhPV5qMjlQMY6QtbmfqS5VTp52y4Vvk+eCQnbJmCXZQDTFNNjw27Y
	 wnkloDwxdcRUg==
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
Subject: [PATCH 2/4] dt-bindings: LoongArch: Add CTCISZ Ninenine Pi
Date: Thu,  1 May 2025 04:42:38 +0000
Message-ID: <20250501044239.9404-4-ziyao@disroot.org>
In-Reply-To: <20250501044239.9404-2-ziyao@disroot.org>
References: <20250501044239.9404-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ninenine Pi is an Loongson 2K0300-based development board produced by
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
---
 Documentation/devicetree/bindings/loongarch/loongson.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/loongarch/loongson.yaml b/Documentation/devicetree/bindings/loongarch/loongson.yaml
index e1a4a97b7576..aac4af9ee97a 100644
--- a/Documentation/devicetree/bindings/loongarch/loongson.yaml
+++ b/Documentation/devicetree/bindings/loongarch/loongson.yaml
@@ -14,6 +14,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: CTCISZ Ninenine Pi
+        items:
+          - const: ctcisz,ninenine-pi
+          - const: loongson,ls2k0300
+
       - description: Loongson-2K0500 processor based boards
         items:
           - const: loongson,ls2k0500-ref
-- 
2.49.0

