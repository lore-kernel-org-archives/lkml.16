Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEB8433CB
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751771418; cv=pass; b=Q1Q4ulzsJOPSe07LjOzC2SHJrzDadeg2SzaQMHs97PZoDbShwGkoW64pTL0+Gvoge0zfIt4YSsk2OY9cIfz1/Diawi8VNcTIY+44rVNBNu0MdLNXtc4xdHi48sYV66wjaX/cKibnONjStLVIfGH8rA4aKKOSDc5JigXJbxZTeZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751771418; c=relaxed/simple;
	bh=53OJ8PDmEs0+UoDAaqw1ewYlM+htiRJKt/mW5JxdAb0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+HyUAD/ShVpv8YshcpurgDzd2AxSVJpVJ1s/HT4R0wgE0ayvk4UT5pjBLsO3XkdVi5NbHDevLMDDYRDV4YFJQW/chyoc5pWg4YQJwhvpbmOfaMemvhS+WpyHYj5jRK3pXQIZt9lsiDWbr77R/i084KAbedtCF/mnzHYB+wtCUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=dYkXmUnv; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="dYkXmUnv"
ARC-Seal: i=1; a=rsa-sha256; t=1751771244; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RtQjnCzLpHF4J64srZJYAIhUI7H4s1CmZskbEFwxopma0KByx8LmRZXPlAFDayW3G9OE8n+PPcqWwIR6x7/9pPLzAI9AJqOs4g//quIVoG1rPRas9PZF6IX9OUZS3FKxu2WkQp6nsD2LfVhdN8expirarIux9MgfYOOxZB+XAxk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751771244; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=msXyCNreV6tVt057JD4kKViyA0dJw9Qv20/D9GHOf6o=; 
	b=Bp6Wg4Auh2B/+NrVrJtpou8kk+2uT3mM0901cZztDB9TVMPVB36U2qpuqwNP0pEHEvCA1piHKJqQN9ZD8fu99qJnbkXJV+ZArwqKzNMdzhNwPVKkFmskuGBZWZ3+1yqv1gSNWSjqLH4lUX0fKT5w/FLflGx90xlLM8BDdaHnhIs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751771244;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=msXyCNreV6tVt057JD4kKViyA0dJw9Qv20/D9GHOf6o=;
	b=dYkXmUnv+1Rj4sABBaEklUEC5VwUN7Ag5RbGPlcO2yVnjRCtWN7FxsX2r5xRwyh7
	WYbOWC7PSvuGfR2QvwaWQpF39uaFCL1g57YT+XBemv561g2U9oUTpVS8DEidW2n0QV4
	uAuXi4EPYhBZDmA07+0CaqRe45CthXA1sqjIHeO8=
Received: by mx.zohomail.com with SMTPS id 175177124224214.037844208890306;
	Sat, 5 Jul 2025 20:07:22 -0700 (PDT)
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
	Sohil Mehta <sohil.mehta@intel.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH v4 4/4] x86/smpboot: avoid SMT domain attach/destroy if SMT is not enabled
Date: Sun,  6 Jul 2025 11:06:32 +0800
Message-ID: <20250706030636.397197-5-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706030636.397197-1-me@linux.beauty>
References: <20250706030636.397197-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

Currently, the SMT domain is added into sched_domain_topology by default.

If cpu_attach_domain() finds that the CPU SMT domain’s cpumask_weight
is just 1, it will destroy it.

On a large machine, such as one with 512 cores, this results in
512 redundant domain attach/destroy operations.

Avoid these unnecessary operations by simply checking
cpu_smt_num_threads and skip SMT domain if the SMT domain is not
enabled.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 arch/x86/kernel/smpboot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index cd70e5322462a..8c1960a455bfb 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -492,6 +492,8 @@ static struct sched_domain_topology_level x86_topology[] = {
 
 static void __init build_sched_topology(void)
 {
+	struct sched_domain_topology_level *topology = x86_topology;
+
 	/*
 	 * When there is NUMA topology inside the package invalidate the
 	 * PKG domain since the NUMA domains will auto-magically create the
@@ -502,7 +504,15 @@ static void __init build_sched_topology(void)
 
 		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
 	}
-	set_sched_topology(x86_topology);
+
+    /*
+     * Drop the SMT domains if there is only one thread per-core
+     * since it'll get degenerated by the scheduler anyways.
+     */
+	if (cpu_smt_num_threads <= 1)
+		++topology;
+
+	set_sched_topology(topology);
 }
 
 void set_cpu_sibling_map(int cpu)
-- 
2.49.0

