Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA301F8BCB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751886297; cv=none; b=qNFt4EDGXgq7Q+AbwNvfX9ag6+hyGeYjfW4i2tz3zt0lR2qUiLU0w6jxz2GwD64H/alBX0exVEjFfbV4gU0P5uzXEYIyGwapes1aYE5vGXOhb6bjqNDImKdZX6MBrpRZVwQ/t9rzOOIOSZMSJjbVZJIAr8mbBplpBjqzeSEAyV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751886297; c=relaxed/simple;
	bh=9p8xTo8+z1wX9jIntt/DEWR+55R0l9UvlDWk3HYd5TI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F1kU5NCIynNIl74vJshaS4ljvRGOlndfsCiFH29yOJI9LvsHTclWkEes6JQ4J1HY/JFRvAiHqdx+0Q51ZCexsDIQtYdDbEQyFFqS1jxRnoPCZPi3qtkDrywUMH8vKlSy1oyHTtfQ7ENSKA+mVmy8fClIPaqMbONsZBMHaWrJ5yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bbLtp4FfNz2SSwY;
	Mon,  7 Jul 2025 19:02:58 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6150B1A016C;
	Mon,  7 Jul 2025 19:04:51 +0800 (CST)
Received: from huawei.com (10.67.174.76) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 7 Jul
 2025 19:04:50 +0800
From: Yuntao Liu <liuyuntao12@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <mhocko@suse.com>, <surenb@google.com>, <rppt@kernel.org>,
	<vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <lorenzo.stoakes@oracle.com>,
	<liuyuntao12@huawei.com>, <david@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH -next] mm/memory: fix null pointer dereference in fault_dirty_shared_page
Date: Mon, 7 Jul 2025 10:51:18 +0000
Message-ID: <20250707105118.413056-1-liuyuntao12@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemg500010.china.huawei.com (7.202.181.71)

Page mapping with "VM_READ|VM_WRITE|VM_MAYREAD|VM_MAYWRITE|VM_SHARED",
the first time accessing this address through a write operation will
trigger a do_shared_fault, if mapping is anonymous, it can lead to a
null pointer dereference.

[   23.232336][  T195] Call trace:
[   23.232542][  T195]  file_update_time+0x2c/0xd8
[   23.232801][  T195]  fault_dirty_shared_page+0x1a0/0x220
[   23.233099][  T195]  do_shared_fault+0xe8/0x240
[   23.233374][  T195]  do_fault+0x78/0x240
[   23.233629][  T195]  handle_pte_fault+0x1f0/0x3f0
[   23.233905][  T195]  __handle_mm_fault+0x2b0/0x548
[   23.234186][  T195]  handle_mm_fault+0xd4/0x2f8
[   23.234462][  T195]  do_page_fault+0x2f0/0x5f8
[   23.234727][  T195]  do_translation_fault+0x8c/0xc8
[   23.235021][  T195]  do_mem_abort+0x68/0x100
[   23.235283][  T195]  el0_da+0x4c/0x1a8
[   23.235551][  T195]  el0t_64_sync_handler+0xe4/0x158
[   23.235861][  T195]  el0t_64_sync+0x37c/0x380

Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index eaf98d518289..8106ef8a5036 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3412,7 +3412,7 @@ static vm_fault_t fault_dirty_shared_page(struct vm_fault *vmf)
 	mapping = folio_raw_mapping(folio);
 	folio_unlock(folio);
 
-	if (!page_mkwrite)
+	if (!page_mkwrite && vma->vm_file)
 		file_update_time(vma->vm_file);
 
 	/*
-- 
2.34.1

