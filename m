Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA342288D3;
	Fri, 23 May 2025 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997301; cv=none; b=PhGfQtxhZCuTR6D+BCtkJistaf7pS40JLP9RViUSviyT1R0tf+my4V6y5JkEgF22yZEJL9aOHzQQW+lu/GgvH8tzvJMdMPYNHNGPB9lwx6Z2e75TPlZUXWbwo5okKxfo5b2N9CEtli0l30YDlARAj8bsSpo38vL/Y/t0NWZ68WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997301; c=relaxed/simple;
	bh=4FbE9OETQQ7uPyNyavMW6wHUX4plr2tkY6TssAU8IkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zzi4ojx6fv89bA8wZyeRizl5PTH4+ZvTsIxmHtM2/0X7oW5B9YiOUlyxyIihxdSKTO+v4zR4v1ldM2ke3PjJ7BOxk3PkcB75Dnqa4H6bF9DwDhX5YrVpG1i66w04Qj4jIwIJWxQ9f+5HQAeIt6OBpE1NESa1QKsxAj9GWKZ9ZjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XxZJ5qzF; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XxZJ5qzF"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 603AC2607B;
	Fri, 23 May 2025 12:48:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QavgVJNkJmsT; Fri, 23 May 2025 12:48:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747997297; bh=4FbE9OETQQ7uPyNyavMW6wHUX4plr2tkY6TssAU8IkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XxZJ5qzFnmkRMD7TfDTa4kSI2L9tt303ixkBXNlcNYUoidyCxTafv6ToZEnGthSBp
	 trfUs+xroYdKS5efb3uVwJ6OQuWzIovakXzJ23RCsuzE2HvLLPGOtkKMUHN1fHc5QH
	 1hm4RmNrktQBzhfdb7nFA2lkWtB28uIcNG2lnUsYmcpzWergNFcJLDI042L6//ylXd
	 hV2OEKA9l6BbM0akoXlBK/Lt3DvgPS9VM6orLVWXHqbA0rhCc4EN/L8RYvs9aMLWcL
	 3IDjAROueODOOG2ubcxsCkmuLwN7Rjdqneb0EpuX18nHkrKFDKoFTfwwef93Hw5VsV
	 l5RUZjhVWQ8Sg==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 8/8] LoongArch: dts: Remove clock-frquency from UART0 of CTCISZ Forever Pi
Date: Fri, 23 May 2025 10:45:52 +0000
Message-ID: <20250523104552.32742-9-ziyao@disroot.org>
In-Reply-To: <20250523104552.32742-1-ziyao@disroot.org>
References: <20250523104552.32742-1-ziyao@disroot.org>
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

