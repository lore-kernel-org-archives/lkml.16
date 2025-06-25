Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D3266B41;
	Wed, 25 Jun 2025 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861260; cv=none; b=Dbkna5536mo90OtehQwF3qkdSCg+QxZnn9m+42Td2fKH+fc8173OdnBC+cgrp/Iqoi3POkenPYvuPwcd/SnzA9yfJTBgNJOI6hNTfIY8+3hWMOn5DeytIkIz0TSB95v/kDZ/n1xURu2ikwZ7CJdDph3lmfnmJKQ6QHgLDt9OFWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861260; c=relaxed/simple;
	bh=ekFrZC5Q8HAZmivsKkul5NZgQJY/Ur7Qwq0Ni+Ze2Wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/T2ACV2FNXNjT142+5PVebQnL7RPVKfh+IKVIg/8fcY9f2bI+q7ldvgep/yx+9YuWnTpMv28hUIGFyAplFzOjIZwdL1ZugGJ4iOw0kWyfSudlnv/H93IENf5Gok2j05A3jN9qYyQwbQJT0E0UuPY2UOCEmNWJEVKmFRjnoy7fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKjlndDf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKjlndDf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCA1DC113D0;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=ekFrZC5Q8HAZmivsKkul5NZgQJY/Ur7Qwq0Ni+Ze2Wo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sKjlndDfq6MxaQtVWwjpM2UFDVFv9aVG+aWi320g51XsmRAGUa+nh68dzP1bsD0uQ
	 KF4FtQ9Ar02z5Eb8VY0cT8okQXRWcHAuyVTqYIMJUWDEU77NXD8xq1ttGC60QU6Aak
	 bxnUU4r4h2sU1ij6LANPdsS5RnV+229meHCYZzxP+sA+iZPPSqYG/vP919FdSRvX/Z
	 XIVmGBKVO93O9/xVT+KEoL1A6KwPTZDJmVgRbCzXGGa+tBqdAY1COvjpwtF+G2Gx5M
	 60upm3f37RC3wKnMiWKMpMsFn5lGSo0ibNjxtb917MBPs3rOqDpffq/PCKV/BDK9H1
	 K3ggruSE/8BVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D68C77B7C;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:21:01 +0200
Subject: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
In-Reply-To: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861258; l=1752;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=fl56XWVJR0cTZUk8jRyTT/lTH2lW6qnyqDJH+9PnqIY=;
 b=Mto7g5DhM1M9UonaHroS3dZuhWFPjWkGx378MbcFfXJMl3jVTE46hQiw0X4lreIe3FgNutkbE
 L075sqhpGpaCKa3IvHFij2pGGw2CdOaZ1s0MKYdbLOQsfXKWFHo4R1e
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Use the hwprobe syscall to decide which PAUSE instruction to execute in
userspace code.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
--- a/tools/arch/riscv/include/asm/vdso/processor.h
+++ b/tools/arch/riscv/include/asm/vdso/processor.h
@@ -4,26 +4,33 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/hwprobe.h>
+#include <sys/hwprobe.h>
+#include <asm/vendor/mips.h>
 #include <asm-generic/barrier.h>
 
 static inline void cpu_relax(void)
 {
+	struct riscv_hwprobe pair;
+	bool has_mipspause;
 #ifdef __riscv_muldiv
 	int dummy;
 	/* In lieu of a halt instruction, induce a long-latency stall. */
 	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
 #endif
 
-#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
-	/*
-	 * Reduce instruction retirement.
-	 * This assumes the PC changes.
-	 */
-	__asm__ __volatile__ ("pause");
-#else
-	/* Encoding of the pause instruction */
-	__asm__ __volatile__ (".4byte 0x100000F");
-#endif
+	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
+	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
+	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
+
+	if (has_mipspause) {
+		/* Encoding of the mips pause instruction */
+		__asm__ __volatile__(".4byte 0x00501013");
+	} else {
+		/* Encoding of the pause instruction */
+		__asm__ __volatile__(".4byte 0x100000F");
+	}
+
 	barrier();
 }
 

-- 
2.34.1


