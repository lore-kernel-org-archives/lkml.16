Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD522A4EF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755432; cv=pass; b=T6N+MabVr6WrsalkxNaNpKzYbMUO0nKoVv1V6ya2tk0ogGmgBN7ap11sh9H+aDGCNEPZX7b1CR1cenVphMtjnSz54/q8eN7n9iFEbS52bpB/xeYcdSNYA0DTrPnbC8CjCe2228M/pY5ry7fZ4MgPOtUOc3TDU6QX0YjU55u963U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755432; c=relaxed/simple;
	bh=nmVLwi1/CTdz2eqx2WEHJ7bQ8fUtwfjpmfF6T8BrT6E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqUgPwBh7IXWXVLNq7jtCHzfs7O7YpeDaSEZmMulGAWc39d/gXE6BJznowquBZo5vv3yznmEmPTsri7e15KjC9t9cCN4mezwEzS795GODtZmGnDKLI7CVvDn1KHZrbJ6NchafYJA/yphwcPtNn6SKcRDb1RRbXbAHy+gtM5sZxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=I7gK4ZWz; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="I7gK4ZWz"
ARC-Seal: i=1; a=rsa-sha256; t=1750755371; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZtzmRAQKk1FqUr8qsAQUjfP51txqx4x4H4FXWZppKzij5pDQ5JeztZ+AeCDvON0zFBMm7xik4HLZA+18OsYsdrCt4/E49N+SEBvD5jt5iVKt26encunqqFf4ff24aprZBGP1K7TdZleFxaia4k0xLvIzSz1tfDCAix4Zw5GPRmU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750755371; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=bc85tfo2Sm8Fs+oMeJAqWaHkWG07JkXoL87FcsQ3zbg=; 
	b=hBGZFa2dZwdudXGkNfQbVYUN0H2WOHO0A/VgCUKJNbN6STwBXid5KYKcZYMXfZ8tmfgRUICzOBMkxi75BCd8uyoyREtMy30cWOUamgzTaY4nSNEZaApH5sJ3ZCpUnA7RKOVwzWxjHOtmBZEv7NA4iT34j3YmRL50Sd8Gxw4kktM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750755371;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=bc85tfo2Sm8Fs+oMeJAqWaHkWG07JkXoL87FcsQ3zbg=;
	b=I7gK4ZWzClbL7Jqpag+MR/NOty1807qpaL8lmsW1xPc4WG7bJEFnvIT+L6ZGqKnm
	xE1eOhLgtUt2R8lmSvhMmIbiBQkjbu0Vc4zWhpAs2xkF/Lr3eQZ4O7elljhJRHR57c3
	/0izoHoFBI5LbkkPSg3+UHaaCW+9n5aYrA0N1Zy8=
Received: by mx.zohomail.com with SMTPS id 175075536939152.530146864584935;
	Tue, 24 Jun 2025 01:56:09 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Li Chen <chenl311@chinatelecom.cn>
Subject: [PATCH V2 1/2] x86/smpboot: Decrapify build_sched_topology()
Date: Tue, 24 Jun 2025 16:55:56 +0800
Message-ID: <20250624085559.69436-2-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624085559.69436-1-me@linux.beauty>
References: <20250624085559.69436-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Thomas Gleixner <tglx@linutronix.de>

The #ifdeffery and the initializers in build_sched_topology() are just
disgusting. The SCHED_SMT #ifdef is also pointless because SCHED_SMT is
unconditionally enabled when SMP is enabled.

Statically initialize the domain levels in the topology array and let
build_sched_topology() invalidate the package domain level when NUMA in
package is available.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
changelog:
v2: fix wording issue as suggested by Thomas [1]

[1]: https://www.spinics.net/lists/kernel/msg5732082.html

 arch/x86/kernel/smpboot.c | 45 +++++++++++++++------------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index fc78c2325fd29..7d202f9785362 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -478,43 +478,32 @@ static int x86_cluster_flags(void)
  */
 static bool x86_has_numa_in_package;
 
-static struct sched_domain_topology_level x86_topology[6];
+#define DOMAIN(maskfn, flagsfn, dname) { .mask = maskfn, .sd_flags = flagsfn, .name = #dname }
 
-static void __init build_sched_topology(void)
-{
-	int i = 0;
-
-#ifdef CONFIG_SCHED_SMT
-	x86_topology[i++] = (struct sched_domain_topology_level){
-		cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
-	};
-#endif
+static struct sched_domain_topology_level x86_topology[] = {
+	DOMAIN(cpu_smt_mask, cpu_smt_flags, SMT),
 #ifdef CONFIG_SCHED_CLUSTER
-	x86_topology[i++] = (struct sched_domain_topology_level){
-		cpu_clustergroup_mask, x86_cluster_flags, SD_INIT_NAME(CLS)
-	};
+	DOMAIN(cpu_clustergroup_mask, x86_cluster_flags, CLS),
 #endif
 #ifdef CONFIG_SCHED_MC
-	x86_topology[i++] = (struct sched_domain_topology_level){
-		cpu_coregroup_mask, x86_core_flags, SD_INIT_NAME(MC)
-	};
+	DOMAIN(cpu_coregroup_mask, x86_core_flags, MC),
 #endif
-	/*
-	 * When there is NUMA topology inside the package skip the PKG domain
-	 * since the NUMA domains will auto-magically create the right spanning
-	 * domains based on the SLIT.
-	 */
-	if (!x86_has_numa_in_package) {
-		x86_topology[i++] = (struct sched_domain_topology_level){
-			cpu_cpu_mask, x86_sched_itmt_flags, SD_INIT_NAME(PKG)
-		};
-	}
+	DOMAIN(cpu_cpu_mask, x86_sched_itmt_flags, PKG),
+	{ NULL },
+};
 
+static void __init build_sched_topology(void)
+{
 	/*
-	 * There must be one trailing NULL entry left.
+	 * When there is NUMA topology inside the package invalidate the
+	 * PKG domain since the NUMA domains will auto-magically create the
+	 * right spanning domains based on the SLIT.
 	 */
-	BUG_ON(i >= ARRAY_SIZE(x86_topology)-1);
+	if (x86_has_numa_in_package) {
+		unsigned int pkgdom = ARRAY_SIZE(x86_topology) - 2;
 
+		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
+	}
 	set_sched_topology(x86_topology);
 }
 
-- 
2.49.0

