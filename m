Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6EF22A4FE;
	Fri, 23 May 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997230; cv=none; b=Ly29tv8ySeZfT8b+W4QgHGME5LuWgCE5F8wYweLPehL3UvSDRw0u8LcGnxo+ySQlhV98En4ardzoEXNNexAw8iSn5hVMkiwCsjcWw4a90w9BCi2CgGpEgvfRQ/RqV91gisgwc3qOqcRJUp9LggIHEZfuIqbcnqeq3twb3fgNxi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997230; c=relaxed/simple;
	bh=hVpvRGbKFKtFx1BRcVBUOZPuHWI/E7Qle7Kn2K+uayU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ElrArThAbMRERAzDlS7v3jMQ7WuIgUVCxU2YXJYQ9D1x/3nRDpWImTPysbAoGxWvNQV4eJ19SB0zPftJtCF9JPQ5WAC4uApJOLtDIMiVRy1aYs/udQvATWYy8dpXtE2HIiSSnr4nw2pGmQTv3FMelbzQhvcouLe0L7ezDSEpzUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=elwaSclK; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="elwaSclK"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B323925D10;
	Fri, 23 May 2025 12:47:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-2i_ixPaUTp; Fri, 23 May 2025 12:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747997226; bh=hVpvRGbKFKtFx1BRcVBUOZPuHWI/E7Qle7Kn2K+uayU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=elwaSclKRUoBAVpmD7afVu+YxmFydtX20NeME3zbM4+f1Y0bzP+0KDrf0R9XE3t4U
	 kDu+MZTnxioVA7nVhzt2TIvqf04E3R9Qw5aUFuQ8Xbaoe8dk1UCRgg0Mmb8AKSXojx
	 dgDaZ9fAhDwyWP+gVb4PIeSPqwLRvPCQKxaYoRRCQcQeRSmJVrI+3VG6YrRKGcPfE+
	 f3jRIkriHT/E0DQWNE0YNKGx6Q9TGiP0dkNwYw+YYRWaoRR6NRMshU2bZVA2cken1n
	 iEt2FayBf34eI1qSqtyqG47fuHYOwR5N93PQ2goPDmEWVhUosWALEdOiLN2p0GQXV0
	 PkseRCQzZREwA==
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
Subject: [PATCH 4/8] clk: loongson2: Allow zero divisors for dividers
Date: Fri, 23 May 2025 10:45:48 +0000
Message-ID: <20250523104552.32742-5-ziyao@disroot.org>
In-Reply-To: <20250523104552.32742-1-ziyao@disroot.org>
References: <20250523104552.32742-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Loongson 2K0300 and 2K0500 ship divider clocks which allows zero
divisors, in which case the divider acts the same as one is specified.

Let's pass CLK_DIVIDER_ALLOW_ZERO when registering divider clocks to
prepare for future introduction of these clocks.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/clk-loongson2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index bba97270376c..7a916c7d2718 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -361,7 +361,8 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 							  p->parent_name, 0,
 							  clp->base + p->reg_offset,
 							  p->div_shift, p->div_width,
-							  CLK_DIVIDER_ONE_BASED,
+							  CLK_DIVIDER_ONE_BASED |
+							  CLK_DIVIDER_ALLOW_ZERO,
 							  &clp->clk_lock);
 			break;
 		case CLK_TYPE_GATE:
-- 
2.49.0

