Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616833E4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750823232; cv=pass; b=LS8FW5VmSk1IoO35MFvh+6FlJOzTVXX66gccEX7QCU2nvbO0Qz7LUAmWPYWZYOIFnb8ltB1JBrpWcoMw74gsvM05kDVplEKzISoekCZX+TePr5cD/8gigAvJFZz6eApCCmAfZYPV5CvGB1xMghTglWo080MO0uQ0O4YbwsQkkk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750823232; c=relaxed/simple;
	bh=oxztMWmBEFZmnk5mzpPOmInc8CJ0XvgSTQhYUnDoiaA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leuma87ApF8JSFrpa9+Vc8Sk9MSY5vY68/i0FrmMWrOXExOUZP7/k7UuopctNhMAiaKj1RgvIlrT7Ag70Pe/30TYct6hA6qKaIawTfn2tNndh0c9tsyBiH1hijOIlSzIt0kikPgrdNMaRgUcSC5U5rmpd2aS6LXsVhjXzPMZ/Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=mVXBi5go; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="mVXBi5go"
ARC-Seal: i=1; a=rsa-sha256; t=1750823164; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b5kp+14EDgl5HAs9oxGnjby9yePAB1wyeMy944iM0L9KpdiTOa8f1jI/z0u16nRWh8P16oEU7LMBsdqh5Z/1MaPRLCPNWcWNSYbF9Q0+nA3VdyaEvhM/9odlJJ20GIP4BidERGpc/dpN/IOUTyoN9XeLuwTNNeepTiQDoPYbHog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750823164; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=inpdI4jjHBay8by/ADyJAX9SBwP0Wlfs/Ocj4U4TvOY=; 
	b=npvQSbvkgBbyxSM63qdTRfR5POqrITaC29SVbqjV8/vxclBW469F+6uRWgZFE2mJ7Y66QKMLgawY2O0nK5lutBk0UArrJMTDB7ZqE5njBYf3Gg9zNIX9QGDtg27x3VJ5xuwidE28jN6eGljuT6vf5MHgDpNu8w/22+PFN5Yxci4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750823164;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=inpdI4jjHBay8by/ADyJAX9SBwP0Wlfs/Ocj4U4TvOY=;
	b=mVXBi5goeuPTyJUdSloaAbSpJMbAifxDJM64jcOr6o7qpckI9gIkvQr+y/c1XNrq
	lbFTqN8XrWjPbl9K2gyRwbj9VkYWWbzxpnQcOq/om6gNPnsy9mJZFghUaXpaGd0PhKI
	31NAce6kTYTcEmCD3IIYrNd1YyttMubrlyAIjWIw=
Received: by mx.zohomail.com with SMTPS id 1750823162759927.9038940040223;
	Tue, 24 Jun 2025 20:46:02 -0700 (PDT)
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
Subject: [PATCH v3 1/2] x86/smpboot: Decrapify build_sched_topology()
Date: Wed, 25 Jun 2025 11:45:49 +0800
Message-ID: <20250625034552.42365-2-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625034552.42365-1-me@linux.beauty>
References: <20250625034552.42365-1-me@linux.beauty>
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

