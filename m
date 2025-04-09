Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DDE3D76;
	Wed,  9 Apr 2025 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187565; cv=none; b=M7wpbdYxSAnru2hSSK9V8EFT7XjqhUyTFC7kdoTms+WOzRbCZhktHlINe9g/jN5JmRU5gY6Gq4DFd6fXtBKFS9WZAB/E3sygEtx7nUhUQ6IvFs6PNSnTIjDrWxP8w5JnI0AlgtysWPnljcjA9r2eyR+R3FZNPGtEUeKTT5HOHpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187565; c=relaxed/simple;
	bh=06i03/eW88kNMSyIQpnLFojEQBRVBRiIZ5NKVcOuDbQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b2qM1u3K1xf2XBr663HwvV0oRHMqv8pAfzF9Kbz75BUBYXdyiP4UIcrWYWqP1k7XwxoXn0K3zM08wmPzE0GRWQwC5Nqf8Kdkv4sbKzP2ZdU8Gx5HulsIpS9Xqw7tepiGHP9Wbs5kwg5praLN5MNIYMg62xGVbNTR8IPCJrAX6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53960GmG025473;
	Wed, 9 Apr 2025 01:32:32 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4cxqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 09 Apr 2025 01:32:31 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 9 Apr 2025 01:32:30 -0700
Received: from pek-lpd-ccm5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 9 Apr 2025 01:32:29 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <dianders@chromium.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: fix slab-use-after-free when clk_core_populate_parent_map failed
Date: Wed, 9 Apr 2025 16:32:28 +0800
Message-ID: <20250409083228.2944917-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: coc-3x-werZjsYlDDhKWyece3W9ZaQKf
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f6309f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=eLMzZ2F9_icGV3DWmJ0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: coc-3x-werZjsYlDDhKWyece3W9ZaQKf
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090042

If clk_core_populate_parent_map() fails, core->parents will be immediately
released within clk_core_populate_parent_map(). Therefore it is can't be
released in __clk_release() again.

This fixes the following KASAN reported issue:

==================================================================
BUG: KASAN: slab-use-after-free in __clk_release+0x80/0x160
Read of size 8 at addr ffffff8043fd0980 by task kworker/u6:0/27

CPU: 1 PID: 27 Comm: kworker/u6:0 Tainted: G        W          6.6.69-yocto-standard+ #7
Hardware name: Raspberry Pi 4 Model B (DT)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
 dump_backtrace+0x98/0xf8
 show_stack+0x20/0x38
 dump_stack_lvl+0x48/0x60
 print_report+0xf8/0x5d8
 kasan_report+0xb4/0x100
 __asan_load8+0x9c/0xc0
 __clk_release+0x80/0x160
 __clk_register+0x6dc/0xfb8
 devm_clk_hw_register+0x70/0x108
 bcm2835_register_clock+0x284/0x358
 bcm2835_clk_probe+0x2c4/0x438
 platform_probe+0x98/0x110
 really_probe+0x1e4/0x3e8
 __driver_probe_device+0xc0/0x1a0
 driver_probe_device+0x110/0x1e8
 __device_attach_driver+0xf0/0x1a8
 bus_for_each_drv+0xf8/0x178
 __device_attach+0x120/0x240
 device_initial_probe+0x1c/0x30
 bus_probe_device+0xdc/0xe8
 deferred_probe_work_func+0xe8/0x130
 process_one_work+0x2a4/0x698
 worker_thread+0x53c/0x708
 kthread+0x1b4/0x1c8
 ret_from_fork+0x10/0x20

Allocated by task 27:
 kasan_save_stack+0x3c/0x68
 kasan_set_track+0x2c/0x40
 kasan_save_alloc_info+0x24/0x38
 __kasan_kmalloc+0xd4/0xd8
 __kmalloc+0x74/0x238
 __clk_register+0x718/0xfb8
 devm_clk_hw_register+0x70/0x108
 bcm2835_register_clock+0x284/0x358
 bcm2835_clk_probe+0x2c4/0x438
 platform_probe+0x98/0x110
 really_probe+0x1e4/0x3e8
 __driver_probe_device+0xc0/0x1a0
 driver_probe_device+0x110/0x1e8
 __device_attach_driver+0xf0/0x1a8
 bus_for_each_drv+0xf8/0x178
 __device_attach+0x120/0x240
 device_initial_probe+0x1c/0x30
 bus_probe_device+0xdc/0xe8
 deferred_probe_work_func+0xe8/0x130
 process_one_work+0x2a4/0x698
 worker_thread+0x53c/0x708
 kthread+0x1b4/0x1c8
 ret_from_fork+0x10/0x20

Freed by task 27:
 kasan_save_stack+0x3c/0x68
 kasan_set_track+0x2c/0x40
 kasan_save_free_info+0x38/0x60
 __kasan_slab_free+0x100/0x170
 slab_free_freelist_hook+0xcc/0x218
 __kmem_cache_free+0x158/0x210
 kfree+0x88/0x140
 __clk_register+0x9d0/0xfb8
 devm_clk_hw_register+0x70/0x108
 bcm2835_register_clock+0x284/0x358
 bcm2835_clk_probe+0x2c4/0x438
 platform_probe+0x98/0x110
 really_probe+0x1e4/0x3e8
 __driver_probe_device+0xc0/0x1a0
 driver_probe_device+0x110/0x1e8
 __device_attach_driver+0xf0/0x1a8
 bus_for_each_drv+0xf8/0x178
 __device_attach+0x120/0x240
 device_initial_probe+0x1c/0x30
 bus_probe_device+0xdc/0xe8
 deferred_probe_work_func+0xe8/0x130
 process_one_work+0x2a4/0x698
 worker_thread+0x53c/0x708
 kthread+0x1b4/0x1c8
 ret_from_fork+0x10/0x20

The buggy address belongs to the object at ffffff8043fd0800
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 384 bytes inside of
 freed 512-byte region [ffffff8043fd0800, ffffff8043fd0a00)

The buggy address belongs to the physical page:
page:fffffffe010ff400 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffffff8043fd0e00 pfn:0x43fd0
head:fffffffe010ff400 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x4000000000000840(slab|head|zone=1)
page_type: 0xffffffff()
raw: 4000000000000840 ffffff8040002f40 ffffff8040000a50 ffffff8040000a50
raw: ffffff8043fd0e00 0000000000150002 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffffff8043fd0880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffffff8043fd0900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffffff8043fd0980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffffff8043fd0a00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffffff8043fd0a80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================

Fixes: 9d05ae531c2c ("clk: Initialize struct clk_core kref earlier")
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
 drivers/clk/clk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf..3f89ed51d4a4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4242,7 +4242,6 @@ static int clk_core_populate_parent_map(struct clk_core *core,
 	 * having a cache of names/clk_hw pointers to clk_core pointers.
 	 */
 	parents = kcalloc(num_parents, sizeof(*parents), GFP_KERNEL);
-	core->parents = parents;
 	if (!parents)
 		return -ENOMEM;
 
@@ -4283,6 +4282,8 @@ static int clk_core_populate_parent_map(struct clk_core *core,
 		}
 	}
 
+	core->parents = parents;
+
 	return 0;
 }
 
@@ -4290,7 +4291,7 @@ static void clk_core_free_parent_map(struct clk_core *core)
 {
 	int i = core->num_parents;
 
-	if (!core->num_parents)
+	if (!core->parents)
 		return;
 
 	while (--i >= 0) {
-- 
2.27.0

