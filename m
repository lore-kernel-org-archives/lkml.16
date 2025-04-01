Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067920FA96;
	Tue,  1 Apr 2025 17:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743528321; cv=none; b=PNnuXEZkQ7KjhoQ4TkpKBp63B1BaUxpav70hjbB2BPnZBbNDvBq7mx0XOOHRjUvv0OEKQECPm5sc/rFIIURCtF0jy+qdKNXmIyek3ql+MJI4hUdpQhcTIrKpH0X2CxckYoZluvIZmRNv9Jh1Uq/b+dgl7nQOwRgtURLIJEsrJ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743528321; c=relaxed/simple;
	bh=34/DWVz3xny62FFtko1B9kiCB28YM6UFyyWMYVeeQig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=me3huKQtMaGrgIfC06jUwuLLfLHdGC+fBnGceksQEeh2EetoTJ5jcqH403eCDT1v8Pis81BD3BDhfQU3yKoPRA52vZnpFcdoS/v3sRzRUG+f4+mDPdjYnt0dBi4p5ms2UqfEQuceX7YlZz7PDKRWmtUflkaiRvzoST1GlWemQoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=0n3w3k1x; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=yKw1lY92; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="0n3w3k1x";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="yKw1lY92"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 8FC6EEC59FC;
	Tue, 01 Apr 2025 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528319; bh=34/DWVz3xny62FFtko1B9kiCB28YM6UFyyWMYVeeQig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0n3w3k1xYwdVRZSlz/Co5xIF215jsdpvvl4PjqqpwaAmb4R1oNi2GtuosqR7h0I15
	 vLOqdD8yasEubHEYZvBVjAK4Re6igpKPSfc2VVw8ie3uLSY3SJYeFdvqwvesWMUilH
	 Vh5THxvLLBhABaqWImTOqLc77Nw17t0D4wxGiqeBmJz+2wLZuezHr0M3ZTP6/Guo29
	 wRrmreuaMlHaHWalBUJqgkVwxLNHPs8zQjDwca7Eliqb1yLDnjYCPlyBrpR23MvY0I
	 FWJRGl22II2zVxYRGetW1P0l7Qn4tiAmJ91JnDOY7RPv6ghKUonq0A+WwfJra9u9xK
	 7ijDNhYFEODjg==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78L11jvBmuvM; Tue,  1 Apr 2025 10:25:18 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 95CDDEC59F9;
	Tue, 01 Apr 2025 10:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528318; bh=34/DWVz3xny62FFtko1B9kiCB28YM6UFyyWMYVeeQig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yKw1lY92V5SLbhmR0TXij6E8ysSSTLOQMUTEn6BbEYML/l+e1vIWu8EaogEntPrAI
	 fzW4XFz2Egr4WfkLcp5ZdXiNCiSupFburyQmdmS/jB0xAgL60sIBF+qzea857cVJuC
	 J010vRFd0AUJkaYKGptzjD9b123zjWJ16FAyJG4M2F7e8ghSH5nsUmTCdDRmSARsr2
	 xR9qREPzi01bX4enCr4nzxr4Nmc777hKTGpLoLqDGb7EgMVrkx0LA8qnegnXPITD35
	 M+hpc1zMeI/Df/yT9sLphTcngxRHA0dXs/PwbnifbJIuvsUOGCKbvYd12ms1BUcMdx
	 rEi2WmFSqVlMA==
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
Subject: [PATCH v6 6/6] riscv: defconfig: enable clock controller unit support for SpacemiT K1
Date: Tue,  1 Apr 2025 17:24:34 +0000
Message-ID: <20250401172434.6774-7-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401172434.6774-1-heylenay@4d2.org>
References: <20250401172434.6774-1-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clock controller unit, or CCU, generates various clocks frequency for
peripherals integrated in SpacemiT K1 SoC and is essential for normal
operation. Let's enable it in defconfig.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0f7dcbe3c45b..011788d16d93 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -252,6 +252,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
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

