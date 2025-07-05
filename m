Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB741F91E3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 12:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720254; cv=none; b=RJTer5H630ia1L0Nu1JNlF1IetG1aN3uweQADBd5gb3GjNu/k4TSXzGBYtQBz7z4ABLbrDNhMIr2c0eiiYnQJ5LTWp8PGNg1scScvMxQI/C++sFEq9H32RbYnrCJd0Uxtie64zDZxH1u1rtcRc9yMxFdO+aJ09jA04dZ4S9f6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720254; c=relaxed/simple;
	bh=R0OxNT1G3SL6trzh0na7MYaBn55/pd84UqEVeO7FTn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VboRxFNkmdhjONVKrNEBe08aB8mIsy5gWgU1UxqgEOc75nZ5QRGY1JXE6vhCjmkm704C2q8uyo/F5m6h2iUPXHxJhGkx3CcNRy1Ke0bmNxrLJyfXueAxATi+RSNuGKHFQtoDpOO+GUq0Qm22y8xzUZkuhiZaKSgwu4FwR6bODCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=N3/D55zt; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="N3/D55zt"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 864922590A;
	Sat,  5 Jul 2025 14:57:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z97oIdxZVT1l; Sat,  5 Jul 2025 14:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751720247; bh=R0OxNT1G3SL6trzh0na7MYaBn55/pd84UqEVeO7FTn8=;
	h=From:To:Cc:Subject:Date;
	b=N3/D55ztaA4IgW/FmhYIfBxQZnSDfpWh6Rz/AU5QiatlvwdgEo5iZAXPpJ2xaGRid
	 joaBxEIdUvZrEgZ4mMQZFFryTUxfTQ2ZL4fDIY8zK7nr5KFX20b1eBur5/ro6PyHys
	 lYSSu3YzPbEt53NOK0KkvAh7ALCoaBKpi2Lbkkwpn/aC2+pTAhCaSfuB9GyACKf4eV
	 UM7VIEurNQ4J2kauOCnhkaM6UZZ2Bz0Hk3s4wEiZLPQW+BueAAaIEG0bVXYmHIbg3X
	 5NwptVLrcBNdgZQIn1AyEC/ZPmqEdXg8uS7VVurieZQgkOzpAxMeLhQasQPzR0NnwJ
	 ifY3/CdSgURjQ==
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Miaoqian Lin <linmq006@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH] LoongArch: Avoid in-place string operation on FDT content
Date: Sat,  5 Jul 2025 12:57:10 +0000
Message-ID: <20250705125710.59994-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In init_cpu_fullname, a constant pointer to model property is retrieved.
It's later modified by the strsep function, which is illegal and
corrupts kernel's FDT copy. This is shown by dmesg,

	OF: fdt: not creating '/sys/firmware/fdt': CRC check failed

Create a mutable copy of the model property and do in-place operations
on it instead. loongson_sysconf.cpuname lives across the kernel
lifetime, thus manually releasing isn't necessary.

Also move of_node_put() for the root node after the usage of its
property, since of_node_put() decreases the reference counter thus usage
after the call is unsafe.

Fixes: 44a01f1f726a ("LoongArch: Parsing CPU-related information from DTS")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/kernel/env.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 27144de5c5fe..fba141472ab9 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -40,15 +40,18 @@ void __init init_environ(void)
 static int __init init_cpu_fullname(void)
 {
 	struct device_node *root;
+	const char *model;
 	int cpu, ret;
-	char *model;
+	char *tmp;
 
 	/* Parsing cpuname from DTS model property */
 	root = of_find_node_by_path("/");
-	ret = of_property_read_string(root, "model", (const char **)&model);
+	ret = of_property_read_string(root, "model", &model);
+	if (ret == 0) {
+		tmp = kstrdup(model, GFP_KERNEL);
+		loongson_sysconf.cpuname = strsep(&tmp, " ");
+	}
 	of_node_put(root);
-	if (ret == 0)
-		loongson_sysconf.cpuname = strsep(&model, " ");
 
 	if (loongson_sysconf.cpuname && !strncmp(loongson_sysconf.cpuname, "Loongson", 8)) {
 		for (cpu = 0; cpu < NR_CPUS; cpu++)
-- 
2.49.0

