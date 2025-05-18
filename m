Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB2207A27;
	Sun, 18 May 2025 08:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555473; cv=none; b=N1Yxm7foTQ6cph3nWnbw/vYKtiGhPfMQyOXahumG2dda2iJ9XFL5Vishg5KrWH+LbBxQTxQJjpAlR3HG8KKlKO9W4B3FwgZFjuDO6yL1kpE2/KokCuo+BQqU+DWPLLG2wq0BZ6Gq9BE9MNTVR7J4WXiQDWNoZgjtOarXdqXmJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555473; c=relaxed/simple;
	bh=5KHmBBvl01x1E1rXj0OjY30i7zTUdOxC7pZWcecdwV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3g1uTIEB1ckEDUp7KrJSbU+HGde6RGZh3+kVseDFC/Zjh3EHErxAH8csuIIfeaa6inqYdMW8T+BeM04eaX2ma6nueMVhpgwJosymAITcBjy5Nrc7SeVUBhSetccgBlnQKozbSQK9wQxXuIs8ymIYm9bqHDL0xdU2w8ZwUCxH4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QSejKNCS; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QSejKNCS"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DB38C25FD8;
	Sun, 18 May 2025 10:04:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAc9ptVaQyOZ; Sun, 18 May 2025 10:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747555470; bh=5KHmBBvl01x1E1rXj0OjY30i7zTUdOxC7pZWcecdwV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QSejKNCSHkfp/0OonOyuR1GcPm9InJ9Cpy+eZqtfyI1Znbz+2qkXR6BslY/5c4d7k
	 DpfsSW9KM7sfrz2UpEQJ2TavbK0xgWSZt4IEnr54t5DL713mcCOsnXLT8beTmpC5TY
	 zG2mRPj9pZGP1nLF/vxSoCFSLr4a+Sp+IKzw9JNIwe738HqsB2fe4MABCzrQisCiE1
	 0s8podtDZ/rLgJtfh6o4sHCCK2D7EZutTTHP+gPg7K3bgqAn6Z40QvsoNIVex4D/wS
	 wKFJdmjsdYXIwjQ7LGERjQm/vPBPeOYmt3vbRKwDeLA/HTBLHnQMLMJv7TXYMIR0Yn
	 F5ckVehRSY+Ow==
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
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH v2 2/4] dt-bindings: LoongArch: Add CTCISZ Forever Pi
Date: Sun, 18 May 2025 08:03:54 +0000
Message-ID: <20250518080356.43885-3-ziyao@disroot.org>
In-Reply-To: <20250518080356.43885-1-ziyao@disroot.org>
References: <20250518080356.43885-1-ziyao@disroot.org>
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

