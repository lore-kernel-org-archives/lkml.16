Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D733E4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750823262; cv=pass; b=U280hu1NByX/qkVFh4Sxm2Dy71Tm0a9ZMSM1qB+Hfw8xBP6LQbYn4pZrisFSVPLuWzReX9YHxAD+Ip5V5bEEP9JpphUN5/SZGlzp9qqrQ08UjBlblbyYyP71oEkOO+1tsynUVVK1vjdOSTWsfzR/6PAWL9pRq7sRyv3gj7je1v0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750823262; c=relaxed/simple;
	bh=JP26mKnlstWQd02lHyws56EmzQCjDY8MetuTGwA3c/M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvhsB8Jtu4Hq4X3XKX0cT5MnsLAW9W9dkgr0fT5KPrcYnYkefabmLUI6t1lCA2GtojHRxawrM4AzH9hMZRfAD9CmiYbhwB8wVoWbTsTeHiP7FnQ+/XvKcy6dQ/PPNEfmHWGRgugN7fNlFOtnDzBzwEMOIxOBHD/fTu2C/fjhw5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=asvfwpn8; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="asvfwpn8"
ARC-Seal: i=1; a=rsa-sha256; t=1750823170; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H6wU9jp5UENsHWc5Zw+/FuQQker8QugDtICeQqdw/2FiPOGcG9p61gGah4q4704C62wmcsOjId5kIJLS6vuB6gP6P+7tKtbbp9CJIMQW1YbiR75BTtfDkqezBtWf3QEs5od79uBgJ8ezu2wlYEiojEZ9b89s3KRPa6aS8KrW03Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750823170; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=RdGgv5ETNd0Zsp1nHqiyPSrLOVxivkC0P66w4cAdGsU=; 
	b=OkCElp4h0yM6T4Hzw0rE0df6JX5z/Rxsf4pnKGNfcYK0XU33wuR1K3yZ9XWtpr7fJgR2Htajv7yE8j7SjX0sZG3rdqD6w+qHifsoGRuuBPHkaOvLnsa0qo74cauO7SM6A2zR4277gE/dghTNE5n6AQXnYMfpAgS1fqgdWpxj9CY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750823170;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=RdGgv5ETNd0Zsp1nHqiyPSrLOVxivkC0P66w4cAdGsU=;
	b=asvfwpn8pbFkG2lF6J5zRtDPlVQNn+8B5WOM/67WgCQnPdVrXUvTTp2RVzEYva4E
	RYDQx4grcyu/s2wf/Na1xWSfVKsnxJorG9NOjA8VNCZss/eSiSWh+8XQyUnNejuUcjZ
	OYCVw0T5ssoKEen/dO7f9j0vbdX+bVkquhy0yTyE=
Received: by mx.zohomail.com with SMTPS id 175082316749596.95391557947278;
	Tue, 24 Jun 2025 20:46:07 -0700 (PDT)
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
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Li Chen <chenl311@chinatelecom.cn>
Subject: [PATCH v3 2/2] x86/smpboot: avoid SMT domain attach/destroy if SMT is not enabled
Date: Wed, 25 Jun 2025 11:45:50 +0800
Message-ID: <20250625034552.42365-3-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625034552.42365-1-me@linux.beauty>
References: <20250625034552.42365-1-me@linux.beauty>
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
cpu_smt_num_threads and remove SMT domain if the SMT domain is not
enabled, and adjust the PKG index accordingly if NUMA-in-package
invalidates that level as well.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
changelog:
v2: fix wording issue as suggested by Thomas [1]
v3: remove pointless memset and adjust PKG index accordingly,
    as suggested by Thomas [2] 

[1]: https://lore.kernel.org/all/87msa2r018.ffs@tglx/
[2]: https://lore.kernel.org/all/875xglntx1.ffs@tglx/

 arch/x86/kernel/smpboot.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 7d202f9785362..4b6daa1545445 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -494,13 +494,29 @@ static struct sched_domain_topology_level x86_topology[] = {
 
 static void __init build_sched_topology(void)
 {
+	bool smt_dropped = false;
+
+	if (cpu_smt_num_threads <= 1) {
+		/*
+		 * SMT level is x86_topology[0].  Shift the array left by one,
+		 */
+		memmove(&x86_topology[0], &x86_topology[1],
+			sizeof(x86_topology) - sizeof(x86_topology[0]));
+		smt_dropped = true;
+	}
+
 	/*
 	 * When there is NUMA topology inside the package invalidate the
 	 * PKG domain since the NUMA domains will auto-magically create the
 	 * right spanning domains based on the SLIT.
 	 */
 	if (x86_has_numa_in_package) {
-		unsigned int pkgdom = ARRAY_SIZE(x86_topology) - 2;
+		unsigned int pkgdom;
+
+		if (smt_dropped)
+			pkgdom = ARRAY_SIZE(x86_topology) - 3;
+		else
+			pkgdom = ARRAY_SIZE(x86_topology) - 2;
 
 		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
 	}
-- 
2.49.0

