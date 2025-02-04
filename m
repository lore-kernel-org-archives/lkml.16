Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66572147F7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685382; cv=none; b=rFW4N4dNao0fF7Xbc2hlnZLARzxEIokqVUVtRcqMgNcUJKtHVvssa3tzWwbPUXftvoGEABeEutFVK7P91CNgW+XNG0dkVuGzXymWsBpnl1v3NNFpOMxO2uU4KVkKs6BCv4LUl0yKIR/kFaR0wSunR9DxihICxzqoJ6Qu1bUNwkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685382; c=relaxed/simple;
	bh=aWAJWddD23V5WMWQUZcPJWUhrQa3v7d3yFQBjipOJis=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LfiqiorEckUoWHILMdHNUOe/vCQFfrXg7zKgjTPdm7951BSQoi3tcavtXQjLbEbyhs2FEHG04WhAx+s1a3WG5h4Z9QC5EfM+pykkKy93k7T4L47SNyW03GqUPyrTKqa/ir/Pmx5i40oBK6izru2qC2RIouBfLYe9DPFEIjos9ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GnAtKUbG; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GnAtKUbG"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514G9PpQ3181568
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 10:09:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738685365;
	bh=YepnJQGmn/vtJnIc7O1s+wtpIlCdhAyRFoIqFH0wSSA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GnAtKUbGtyyr3/jl4HDq+CAQHBSengrJEQxd1hkeF7KH4WR2vpIeoekislzjci+/q
	 82rJ9LYYlO1YACtgnNMo5mCFjQIjyMTRn6CxoNTdKNm3NuWRTvBqyQgdJZAV7e2Rye
	 ihKrkAK4zrBKYr1UBGluLyHff3w5QkGDHHFy4WTQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514G9PiG029212
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 10:09:25 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 10:09:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 10:09:25 -0600
Received: from lcpd911.dhcp.ti.com (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514G9Lrg073384;
	Tue, 4 Feb 2025 10:09:22 -0600
From: Dhruva Gole <d-gole@ti.com>
To: Frederic Weisbecker <frederic@kernel.org>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>
CC: Chen Yu <yu.c.chen@intel.com>, <linux-kernel@vger.kernel.org>,
        Kees Cook
	<kees@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
        Dhruva Gole
	<d-gole@ti.com>
Subject: [PATCH V2] kthread: Fix build warning variable 'ret' set but not used
Date: Tue, 4 Feb 2025 21:39:21 +0530
Message-ID: <20250204160921.377178-1-d-gole@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204090838.214647-1-d-gole@ti.com>
References: <20250204090838.214647-1-d-gole@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Fix the following build time warning in kthread:

   kernel/kthread.c: In function 'kthread_affine_preferred':
>> kernel/kthread.c:861:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     861 |         int ret;
         |             ^~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501301528.t0cZVbnq-lkp@intel.com/
Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
Link to v1:
https://lore.kernel.org/lkml/20250204090838.214647-1-d-gole@ti.com/

Changelog:
- Use ret value toward the end return as per Kees' suggestion

---

 kernel/kthread.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 4005b13ebd7f..5dc5b0d7238e 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -859,7 +859,7 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 	struct kthread *kthread = to_kthread(p);
 	cpumask_var_t affinity;
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	if (!wait_task_inactive(p, TASK_UNINTERRUPTIBLE) || kthread->started) {
 		WARN_ON(1);
@@ -892,7 +892,7 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 out:
 	free_cpumask_var(affinity);
 
-	return 0;
+	return ret;
 }
 
 /*

base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
-- 
2.34.1

