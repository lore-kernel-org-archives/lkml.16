Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD242F3636;
	Tue, 17 Jun 2025 16:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177630; cv=none; b=mtrwpkbHCgfi2QxEV1M6dlU2cSjkJsD2wbFa0oWBtdR8l71T41DoWJFK+pPXYgnk0bG1slsn0G80FLk99ohf/wYZ2u+vqHAakKKRuu4n1ceVyYkejoUvq5POKCHfat2wgpkwX9Po1WxdDncXONoy5KtzLhdFh8BIj8JcnqlGqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177630; c=relaxed/simple;
	bh=4FbE9OETQQ7uPyNyavMW6wHUX4plr2tkY6TssAU8IkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBwazuLJRDEVBa6uUeqgtZ8iPg3p8DzwIoq9d8hXSACuVUy6emWLbSJ+BW5F2fEvWuhUk44W2cPq9rtCFFrvkqHIeNBjAoh1Ak3bol7Uc6javI2/l1LC2H1asCgUSgIY4try/Ghz4/q0X73sK0/VH0/M7rJrsnCRNZ0N9Wht1wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=loktY2pS; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="loktY2pS"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 73C0E25BB1;
	Tue, 17 Jun 2025 18:27:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y51BXOyX5mqV; Tue, 17 Jun 2025 18:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750177626; bh=4FbE9OETQQ7uPyNyavMW6wHUX4plr2tkY6TssAU8IkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=loktY2pSx23cVg60wH7Lt/zp54BwkUZc+4xFveZpVeM+QYnDSUaWreCFaGXc/dczr
	 cSd9LClTTATrIikHoi+eGQvd6dfq5xNWqxDsVWzOPOUVi5fJBQCT6A35smiL17Tw2H
	 IiyOG+s2ZqduHA65EwNl7mUVgHGLp9xf/Cwob1LOxKawImNMjmewDkIVjePoiEL6QH
	 73KkvN65mRooIzNez7n4YPZOerbvfZ3K6Po9/hMFm5HQcIZUbVEQia+R2O0rTbavLs
	 R+7v136jrw0d9WGSfqb06xZbg8GpC9Lncb3d67CW+nHbjLT6P53OLZMDOBwmjkiMW+
	 HmKwlab6oiSEw==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 8/8] LoongArch: dts: Remove clock-frquency from UART0 of CTCISZ Forever Pi
Date: Tue, 17 Jun 2025 16:24:26 +0000
Message-ID: <20250617162426.12629-9-ziyao@disroot.org>
In-Reply-To: <20250617162426.12629-1-ziyao@disroot.org>
References: <20250617162426.12629-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The property isn't required anymore as the supply clock of UART0 has
been described.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts b/arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts
index a033c086461f..1bdfff7fae92 100644
--- a/arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts
+++ b/arch/loongarch/boot/dts/loongson-2k0300-ctcisz-forever-pi.dts
@@ -40,6 +40,5 @@ linux,cma {
 };
 
 &uart0 {
-	clock-frequency = <100000000>;
 	status = "okay";
 };
-- 
2.49.0

