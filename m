Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3388519AD86;
	Sat, 12 Apr 2025 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744443934; cv=none; b=j45BekqFvFOWG7TTZ0qFSrOO4YQ5meeevAros8NfCJjX5fVbloRmCXbLUj3QYylI4x5wjOVIk4+PKxQlcsQqdT5co1Q09nuvUPYD89mAyKuGYQvaplC285lx4XU9lpA8i8jUtTG+RcaDohLB4EyQJfNdlTDZnui0CzHFg/bN/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744443934; c=relaxed/simple;
	bh=aq36glBXKWJ4CyEzsiQJFbDCCtINN6dMSzr4bZ7fo84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCh2H85ZO/Y7xOpc/7WJrSnC8P9oz+pZZgTONHojcMRKIWUm5G0AeNefplO4LX1sFo8Mvjv1VDypWn/mZLZS60I9iRMtAMcx0dnX97HNfKjhZwKaAsh/BWn63jtJxDlXFnbTIGkbnTyfX5O33PmyRapgH92OLdeI2xExe64vOEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=jStz93cd; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=iE5k6MIH; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="jStz93cd";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="iE5k6MIH"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 88B8A12FB432;
	Sat, 12 Apr 2025 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443932; bh=aq36glBXKWJ4CyEzsiQJFbDCCtINN6dMSzr4bZ7fo84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jStz93cd09nE8F8fuJSKE6RIyBQg3hrCisO4exQjxE6PRzGvYRWc3idYEo3SsY3a1
	 hE+3Tkv60KVxqL2KdnT9bj2CT3xjbveBukXcwPMsSQy69Bf831vbLdzJCVaIK5sOax
	 GUqJ4Hw3SQEopfT/7YOkQj3IfXNNIh3VjTzHIlmFtQAfU7q7JpZTxjnUZPClJ7ZIDR
	 8lJf4f1D7KBVwWNQfKveeyhSFkuV7q5ah5X1YT9FV4EVZpQ/PqsHb/byjpjyhAEh7m
	 Q9tCQBT5qllzEzN53h8O72bJsWVBIz74jfJIWoYPs566SiYR2TyKFpm6LeaUGT4Ggu
	 zAcsjvI1K6VcQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVUxCBhjmhLL; Sat, 12 Apr 2025 00:45:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 276E912FB41C;
	Sat, 12 Apr 2025 00:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443931; bh=aq36glBXKWJ4CyEzsiQJFbDCCtINN6dMSzr4bZ7fo84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iE5k6MIHr12bpehFyid4SkLPW+y6Rp5xYeHkjPUeuyLr8zv9Aw6sPzftUKj6EUnci
	 Iq8fvuMFPUTtsYiEabpXUGwVUOI/B2WFWvEzV3+0SMhB6lKWV2B/BdBtUoRcqiEbsZ
	 oHqINh1DXJCNehbV/oNf0R0TDWZ6TpWbrc8P0f8D1WrMT/oNtWj5/Mb504yCf2nmFb
	 A3cxiWxR885auDTIMUoCBUrJE6KqMmB2cjF/QL5cN+2YpbAehFBjJhffQU49+vTj+w
	 Oj5r91CyNH9xBXKxaAua1zCteTFdQdk+59gCh8oW3oRHICN5VuiqKdoZHoGHfnkSKg
	 lO0DTJxznTpiQ==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v7 6/6] riscv: defconfig: spacemit: enable clock controller driver for SpacemiT K1
Date: Sat, 12 Apr 2025 07:44:24 +0000
Message-ID: <20250412074423.38517-8-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412074423.38517-2-heylenay@4d2.org>
References: <20250412074423.38517-2-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clock controller unit, or CCU, generates various clocks frequency for
peripherals integrated in SpacemiT K1 SoC and is essential for normal
operation. Let's enable it as built-in driver in defconfig.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e17..4888529df1d8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -250,6 +250,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
+CONFIG_SPACEMIT_CCU=y
+CONFIG_SPACEMIT_K1_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
-- 
2.49.0

