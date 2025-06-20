Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A89A1519BA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434457; cv=none; b=P5aBuXVOGsT2YArw+tkq0KS/0gmduwN3IQVLMy2ohVKfEuI1GAIGvUQEN4YktBfN5f3CL7wCEgGNrHSXzNQBsw3rJDBydTSeiYPkQYMI3a6D2t918qDn0lvBfp8NGM+K8id92XwBY0JBoSNfeiK+Rce7K1d/YVJuT9aR+7Z1vcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434457; c=relaxed/simple;
	bh=wwr/YmNwjPG+rqs2HRZsJp3V7IFN9PO1s2HPPBfwwno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mAiwLp2aLPpEGYAMHV1l8h2X6tjWeLDY3fCWfT4PR4wzMBeCGuKqWcWRogJdnMuTv9m1Ks620pPsLE30YYQ1pkw4i+P//bZWtUZv2W0sCq3EwgGVApNML+jHcrcg44K739+wlVOtBnnrXLut1QUm8eBCdV6a+u9T3pXMz1LcPew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q2WGRp4Z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QkxT30PD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q2WGRp4Z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QkxT30PD"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750434454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfqaj/3WWZBVl1QTBcQ1INc4aDbdWSa9MSU+sxm99vk=;
	b=q2WGRp4Zypz/uauEJSeeL+t/l0B/78EFT1yZxzPC3qNK7bV2+pq4hvwDvKy9+Juts2NYaY
	jDhBT3ZmmvrWliFGCQNIhz2tY5n+zQQvRmibHmKSTV8HpvieYH05a4VR5zLjh1P9Mr9SdE
	nxNOnoZRZL+47e8rlG9pYBc+H3vKKsupw/pTRrpMe8flrVr0P7ZOFTFNsTmv4CdhW1jmyX
	cF+S/zX1yQ11/hNJqbx9xl+Q2BBswt4mttaSpNEgbgTNHvaJxTcypD7kD1VyJB4/o8FMnz
	zb5CCOF3uYLp1mxOn+Q+I7kP5YB23EwJ94L/PS0CbI9R2xZ1Txt32Nxofpt9xA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750434454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfqaj/3WWZBVl1QTBcQ1INc4aDbdWSa9MSU+sxm99vk=;
	b=QkxT30PD+Qb6Ocm5Z+N+FV6UFo2mwWZXmutBYBsIW5BXR/b/V+JmGev/daBRCSuH6gS0mq
	F6z+a89ep4/p20AQ==
To: Li Chen <me@linux.beauty>
Cc: Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86 <x86@kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] x86/smpboot: Decrapify build_sched_topology()
In-Reply-To: <87msa2r018.ffs@tglx>
References: <1965cae22a0.12ab5a70c833868.7155412488566097801@linux.beauty>
 <87msa2r018.ffs@tglx>
Date: Fri, 20 Jun 2025 17:47:33 +0200
Message-ID: <87frfuqusq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The #ifdeffery and the initializers in build_sched_topology() are just
disgusting. The SCHED_SMT #ifdef is also pointless because SCHED_SMT is
unconditionally enabled when SMP is enabled.

Statically initialize the domain levels in the topology array and let
build_sched_topology() invalidate the package domain level when NUMA in
package is available.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
Note: This allows to remove the SMT level with a simple memmove()
---
 arch/x86/kernel/smpboot.c |   45 +++++++++++++++++----------------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

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
 

