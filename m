Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF543AB7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991690; cv=none; b=R9Vo5h4Rmkz8OZ22Suydr5VXJ/0/qYWHq9Q07TQaU1D9qH/aUDYEzH5P24MYpA2xO11mt5/bM0Uz94ROWQmf86xMpVFQkPBkX2zDmtXx9WqFBQaTwiORTibXina3PYLOUKFTl1CqaPx/42Mie4UUmql10/iNiYYxd2Yl4YLrT84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991690; c=relaxed/simple;
	bh=9ri9iSIqcQWOk96uWK1rt1pGo/XDUmW/mtpjuY6m93k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=thnha6mXkcrusjeKXzhv3l1f8lMIhi1IzfYDs0Lxqz4B3BAL/QhOBDLSCXOiBgoldoH0DPTldpLfMNrLSmv8w/VkelX/Zo0IvCLkQ1Le9bZxY/GMbtsf+qpjjA1MAfUd2LWdjn+sYHdfcdQfvutMmWRCoBAlDqNdnFyjxyfqW8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=SIJc7WqU; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="SIJc7WqU"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4A31C25C08;
	Wed, 30 Apr 2025 07:41:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DysLFJhSKM2; Wed, 30 Apr 2025 07:41:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1745991684; bh=9ri9iSIqcQWOk96uWK1rt1pGo/XDUmW/mtpjuY6m93k=;
	h=From:To:Cc:Subject:Date;
	b=SIJc7WqUAnwNuDR87EFSoCYTz3SUstsnvNKZJ6VTdrXqO58zDWSJ/L07bv3w58aGz
	 oyC1vDFdVWqYBN2VifX9lP9Ih7P3CHXUK2NTOtkvoF6qX/xiMWiKz9yy7NHcIY0aJD
	 KEEKzeJocs3J+248DHbO3voJmzbM7t7DL3gSMy2244pzZMC8brJdxUrtWj+JbkICM1
	 dVIzanakalSyE0bvfGq45ne/kZ4k3kNp7B1uggHTZvwd3MRkn5ujRQh/zkJlh6jO+j
	 OWNa7hx5AedBiwD7Zlz7tBw1f7L4rzTS0vcI6KyLaP1YV+llxdImfMEzSdIY8/2B+y
	 /zPWg92pRab+Q==
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH] LoongArch: Use a fallback CPU model when IOCSR-based model probing fails
Date: Wed, 30 Apr 2025 05:40:43 +0000
Message-ID: <20250430054042.24333-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading vendor and cpuname IOCSRs yields 0x258000fff00 instead of
human-readable model strings on Loongson 2K0300 SoC, which messes up
format of /proc/cpuinfo since it represents as an empty string.

Let's consider IOCSR-based model probing fails if the result model is an
empty string. A fallback model name is set in such cases.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/kernel/cpu-probe.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index fedaa67cde41..785513d43696 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -270,12 +270,13 @@ static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int
 	if (!cpu_has_iocsr)
 		return;
 
-	if (!__cpu_full_name[cpu])
-		__cpu_full_name[cpu] = cpu_full_name;
-
 	*vendor = iocsr_read64(LOONGARCH_IOCSR_VENDOR);
 	*cpuname = iocsr_read64(LOONGARCH_IOCSR_CPUNAME);
 
+	if (!__cpu_full_name[cpu])
+		__cpu_full_name[cpu] = cpu_full_name[0] ? cpu_full_name :
+							  "Loongson-Unknown";
+
 	config = iocsr_read32(LOONGARCH_IOCSR_FEATURES);
 	if (config & IOCSRF_CSRIPI)
 		c->options |= LOONGARCH_CPU_CSRIPI;
-- 
2.49.0

