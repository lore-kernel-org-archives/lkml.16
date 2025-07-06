Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547E187FE8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 03:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751771396; cv=pass; b=k9YkdddMNPPSfVZnyCs/wBUZfPJ9D/jPfnlqq3Uuhv7g2UKNWrBtfC+H7jYIYZxElfLbXs7TBpWCWe4eVGJgEJNMvjo0B6JQdpJrCFW9nVmm5h+1Jv4EfhCmnDxM1Z2xvfh43QDTGMyFD4Bf2dapf64OCC7+qN2SrPrtAqqMtGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751771396; c=relaxed/simple;
	bh=SxZhF0dMdwr/dGfsgaktlQLXk40KKBRB25obt3i6LI0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hl3dm3ZoO3bEsOrjF+oxBriE+zHOIvPh/iMs90F2Aw7hhADfhwgziIaXna6jyJ3hgu3ceiklrL99LiZc3Xmct69gEj9DxX2mKNw/WpmyCax5vAH64UL5jTBHP87eaH+HDj0LlmbVPlaOlzA6xGzzlgTRag8BvaD/TQpo9s7Aw64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=m2/EDRWS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="m2/EDRWS"
ARC-Seal: i=1; a=rsa-sha256; t=1751771236; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kDnup86oQDwej5zb4wajH4G639HusUhNd1xjBGYz26IwoKO0/YksFyq7KAZoLWLDXZBe7z//Mbn5PLD36NXXJVfkTbxhrSr459djLUf9+QBr84TAdtTR5DfPwA/np2TiahSkKZXbSSdAD4T4VDs/0ztQZckMPsGX4pQjRYtZIVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751771236; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=65qbjQ7gfEeyq7t0PjihRrjU0QOq/DRjgNgU6j2clgU=; 
	b=GI9BBr7ONN444UPp4HJoABftGSxv3DdgtT2Z1NjJXfFBo86v90aDJk+9cO93Ppxt61mH2DxSbZwJqKkX30G61NQD1HiQSF0cuLNg3zpCgF1BlZytcx465/YDvZ07MwF5SfgmqvuuJpYzwBcATuTGVN552kCtjD5zJkG9d/SyIQk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751771236;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=65qbjQ7gfEeyq7t0PjihRrjU0QOq/DRjgNgU6j2clgU=;
	b=m2/EDRWSdfrHSSmL12zAbjqdbi3toJv3LpI3P+CLTGJ7XLTlp3Gf8dS0xAI9Uh6Z
	Ilwy9vuZNoPBy2lKbkdpz79hBoC5P67fg4ze9MJQx5OVh95i6CvbmkYGXophOWPZXL7
	1fKE4hvGJ8YmgWvPmKBTm6vvDFwWoLHzM8mjlZDo=
Received: by mx.zohomail.com with SMTPS id 1751771235080189.54884702925767;
	Sat, 5 Jul 2025 20:07:15 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Li Chen  <me@linux.beauty>," Thomas Gleixner "<tglx@linutronix.de>," Ingo Molnar "<mingo@redhat.com>," Borislav Petkov "<bp@alien8.de>," Dave Hansen "<dave.hansen@linux.intel.com>,<x86@kernel.org>," H . Peter Anvin "<hpa@zytor.com>," Rafael J . Wysocki "<rafael.j.wysocki@intel.com>," Peter Zijlstra "<peterz@infradead.org>," Sohil Mehta "<sohil.mehta@intel.com>," Brian Gerst "<brgerst@gmail.com>," Patryk Wlazlyn " <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Li Chen <chenl311@chinatelecom.cn>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>
Subject: [PATCH v4 3/4] x86/smpboot: moves x86_topology to static initialize and truncate
Date: Sun,  6 Jul 2025 11:06:31 +0800
Message-ID: <20250706030636.397197-4-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706030636.397197-1-me@linux.beauty>
References: <20250706030636.397197-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

The #ifdeffery and the initializers in build_sched_topology() are just
disgusting.

Statically initialize the domain levels in the topology array and let
build_sched_topology() invalidate the package domain level when NUMA in
package is available.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 arch/x86/kernel/smpboot.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 6e36306632792..cd70e5322462a 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -478,32 +478,30 @@ static int x86_cluster_flags(void)
  */
 static bool x86_has_numa_in_package;
 
-static struct sched_domain_topology_level x86_topology[6];
-
-static void __init build_sched_topology(void)
-{
-	int i = 0;
-
-	x86_topology[i++] = SDTL(cpu_smt_mask, cpu_smt_flags, SMT);
+static struct sched_domain_topology_level x86_topology[] = {
+	SDTL(cpu_smt_mask, cpu_smt_flags, SMT),
 #ifdef CONFIG_SCHED_CLUSTER
-	x86_topology[i++] = SDTL(cpu_clustergroup_mask, x86_cluster_flags, CLS);
+	SDTL(cpu_clustergroup_mask, x86_cluster_flags, CLS),
 #endif
 #ifdef CONFIG_SCHED_MC
-	x86_topology[i++] = SDTL(cpu_coregroup_mask, x86_core_flags, MC);
+	SDTL(cpu_coregroup_mask, x86_core_flags, MC),
 #endif
-	/*
-	 * When there is NUMA topology inside the package skip the PKG domain
-	 * since the NUMA domains will auto-magically create the right spanning
-	 * domains based on the SLIT.
-	 */
-	if (!x86_has_numa_in_package)
-		x86_topology[i++] = SDTL(cpu_cpu_mask, x86_sched_itmt_flags, PKG);
+	SDTL(cpu_cpu_mask, x86_sched_itmt_flags, PKG),
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
-	BUG_ON(i >= ARRAY_SIZE(x86_topology) - 1);
+	if (x86_has_numa_in_package) {
+		unsigned int pkgdom = ARRAY_SIZE(x86_topology) - 2;
 
+		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
+	}
 	set_sched_topology(x86_topology);
 }
 
-- 
2.49.0

