Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495E2080D0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043564; cv=none; b=cIAkdT0rKSnle6JWtxjzh+gtnV1fn13jYzjfJGfqSUx84nuLNQ4qowq9S7l4HPG162FAot3A8PSRA0ukHM1MJr8lDUwNIDkS+Drc9VBni8nTmJiCxQrRwCj+oIVsRrgWIh8wkOb61R1kr0D7LjdTtxm/sgIiinnqJ63EuOn2w3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043564; c=relaxed/simple;
	bh=xSsQRKPWDc/QqwRD3gQSqfC0IDJm919uz4MRPJeX4n0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e683ivJagjO5Zc+e5EOzaPqfKw97TRqyY0iloQR1aR5JtN8PLaX0/jl99BSlr1tn3MhdR+UrUtXKyoD20/jA7uN8/RN56bFkqWV+jJvGbgUescjoeLJt3OJEZy0SH/lW2ebNDeOyfS/j5PizlkQsFJhVqPMWWaSfMMCBjyFKwx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l+Re95CM; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l+Re95CM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744043549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cqTOSkdNqpvfGew9xPEfFNrsyXi8l9nrZCegpRUCAOI=;
	b=l+Re95CMh54hZVf39Yz9t3BEULbnxwlTRY8Cu4XeqEJTQmFKCdBRJcKVfdCx2v2BPcvoia
	NaIw7rztRsEsUT+IUXZZ4GzTHCyn2v9COqzSMTUe1Xnlim1KJvwAPVY4zGRlaECgm82sNa
	/KEyNrk2bt0VfL8i/qVwXwgz4PFqYdE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Chao-ying Fu <cfu@wavecomp.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: CPS: Fix potential NULL pointer dereferences in cps_prepare_cpus()
Date: Mon,  7 Apr 2025 18:32:21 +0200
Message-ID: <20250407163224.794608-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Check the return values of kcalloc() and exit early to avoid potential
NULL pointer dereferences.

Compile-tested only.

Cc: stable@vger.kernel.org
Fixes: 75fa6a583882e ("MIPS: CPS: Introduce struct cluster_boot_config")
Fixes: 0856c143e1cd3 ("MIPS: CPS: Boot CPUs in secondary clusters")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/kernel/smp-cps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index e85bd087467e..cc26d56f3ab6 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -332,6 +332,8 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 	mips_cps_cluster_bootcfg = kcalloc(nclusters,
 					   sizeof(*mips_cps_cluster_bootcfg),
 					   GFP_KERNEL);
+	if (!mips_cps_cluster_bootcfg)
+		goto err_out;
 
 	if (nclusters > 1)
 		mips_cm_update_property();
@@ -348,6 +350,8 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 		mips_cps_cluster_bootcfg[cl].core_power =
 			kcalloc(BITS_TO_LONGS(ncores), sizeof(unsigned long),
 				GFP_KERNEL);
+		if (!mips_cps_cluster_bootcfg[cl].core_power)
+			goto err_out;
 
 		/* Allocate VPE boot configuration structs */
 		for (c = 0; c < ncores; c++) {
-- 
2.49.0

