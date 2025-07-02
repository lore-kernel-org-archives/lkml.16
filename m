Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3009118EAB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440405; cv=none; b=csM9Fv+kzkGEdeI2xmIwlBbFEUcCDO16OM+Ywthu9zCAajYCYpCacW3SO9/PU6VUa7TF+6alKwwZAekO0L0tKMhquh1gfymYA3E9vJrdvKU3uvm3WDMA1l1x+ouqYj+Cdj7RIhuzgY+c/9Sen63l9ohHpwG1FXC2kf1/o+HQkis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440405; c=relaxed/simple;
	bh=oYbA4qIalwatWhqVuo31BJpn7kgaIUpb9k17fw5loO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrY4SNuoag6ebZy34LudMAIcOgFXIkiEVU65ePzACGQD1pUM1NUegz2/pz2261d0O84MVbfz6Haif3dpdXMgV+PCI6vQ5gErJbVd7MmQO1kbQVOekTSXlprRWHMepgus3x8cT6lSWNmiZNGZAgbzu9DmDn1vvsUwnbAlaK4R344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lGTe6cOV; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lGTe6cOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gn
	U/xVylm2a5uxAqg+WGN6FxdwmoKubQgA02vztEiMU=; b=lGTe6cOV7mkQFR0Mg3
	suQ9KWC/D83HCyo/c8akwoi9KjyrqI2AogvbE3gtjRTIBm6uBh43mq5e1datYr8H
	XbNDPA8Digve8QPDDqmOxho/bFqk2ATOXZCehk2v63Kcp0bdNWvKXBaFJ5miQ4Pj
	Zh6/DI5ps4SJV8bHEmWT25UHs=
Received: from ly-pc.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wC3fA3l22RovTZYCA--.2725S4;
	Wed, 02 Jul 2025 15:12:42 +0800 (CST)
From: Xuanye Liu <liuqiye2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Xuanye Liu <liuqiye2025@163.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Chris Li <chrisl@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: Fix spelling issue in swap.h
Date: Wed,  2 Jul 2025 15:12:35 +0800
Message-ID: <20250702071235.212794-1-liuqiye2025@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3fA3l22RovTZYCA--.2725S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWkArW5Kr13uFy8XFyfXrb_yoW3Xwb_Aw
	4xJ3yj9r409FWxXayIkFnaqw1fKF4xGr1UZ3Z5Kry7AFn8XFZIy3Z2qr97Xr1UGwsxCFy7
	W3WIgr1fuw15CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUxwIPUUUUU==
X-CM-SenderInfo: 5olx1xd1hsijqv6rljoofrz/xtbBDRB+UGhk1Uql0QAAsU

recliam -> reclaim

Signed-off-by: Xuanye Liu <liuqiye2025@163.com>
---
 include/linux/swap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index dac7ba98783d..95c6061fa1dc 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -415,7 +415,7 @@ extern unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
 #define MIN_SWAPPINESS 0
 #define MAX_SWAPPINESS 200
 
-/* Just recliam from anon folios in proactive memory reclaim */
+/* Just reclaim from anon folios in proactive memory reclaim */
 #define SWAPPINESS_ANON_ONLY (MAX_SWAPPINESS + 1)
 
 extern unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
-- 
2.43.0

