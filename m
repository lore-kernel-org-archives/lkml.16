Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011C120371A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660138; cv=none; b=FkF8Iw1TyuoWLHjiM1NPTnw1bZTniTDkzvRLzWW+XHj0seoj7dJZxx8+DBvSAurh5dtNaAJZeNEn0AwQJTMoSlBYWrQymFNErr20uNcu5hQK/oRR9BUXItA7OG+gqMWuSourDUxyZDQQfYY2OOHoq0vDSnMM9QFqCE9n3RcRGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660138; c=relaxed/simple;
	bh=oIj6NHk2o0Z10kFlfyxGInc7NT6TaaGNjgFU0ut9cGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/vpzxaXYO3aK87TKlTRgKGKhIbZdeS4QOdZVqNDwVAh5gVioMqxtX9O+yzDnl1TiaUlTEaHOa7GOQq/uu2fENxRWBlvUE2sf1GyFYKwTSZmW+7rOMR00bx+mhktgDV/k7Q2k0XNSQIaIViOSFCXdTet+0yACFKntlyqymMmqhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UuiJUAez; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UuiJUAez"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51498gXQ2366333
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 03:08:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738660122;
	bh=0r6hnJHVnupxbe0MROYw/A0MDe0+S6djnJt+Tt5nO9Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UuiJUAezxZg9/Is35F9i0DscLmiPrOUNJ9UM9AsCtvXbi7Fbi9rxvyrpC8TC8ZdeT
	 DllT7f2+9XUrIDezNIqpA1pHUH81/3Dz7NDMCC3omwy8/44BL1unClCKvuJrqsOFAK
	 l0OutkhL1BHoM6e1qmzXoaRijY3rJ9eIzQRoQI+g=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51498gLJ003205
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 03:08:42 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 03:08:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 03:08:42 -0600
Received: from lcpd911.dhcp.ti.com (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51498cbU011268;
	Tue, 4 Feb 2025 03:08:39 -0600
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
Subject: [PATCH] kthread: Fix build warning variable 'ret' set but not used
Date: Tue, 4 Feb 2025 14:38:38 +0530
Message-ID: <20250204090838.214647-1-d-gole@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202501301528.t0cZVbnq-lkp@intel.com>
References: <202501301528.t0cZVbnq-lkp@intel.com>
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
 kernel/kthread.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 4005b13ebd7f..f730b1413d13 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -859,7 +859,6 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 	struct kthread *kthread = to_kthread(p);
 	cpumask_var_t affinity;
 	unsigned long flags;
-	int ret;
 
 	if (!wait_task_inactive(p, TASK_UNINTERRUPTIBLE) || kthread->started) {
 		WARN_ON(1);
@@ -873,7 +872,6 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 
 	kthread->preferred_affinity = kzalloc(sizeof(struct cpumask), GFP_KERNEL);
 	if (!kthread->preferred_affinity) {
-		ret = -ENOMEM;
 		goto out;
 	}
 
-- 
2.34.1

