Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79021DF756
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193412; cv=none; b=RidY6xT7P7pkG/wICt3cZVB8iP8fpA1Ku2RKxtXjwu8UK4tEOAwDIh7X2/JlDN0pl7s42X7ox0zPdnPtX07Tq9KNhBhfPqHVKQZCSTTre00GxFsn6SkxslJgaZpQSuzdCBAwpz3HoSKLQwfcfcpT3G29C4Niu27FFoDh9CbKBPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193412; c=relaxed/simple;
	bh=yLlsWbHGcGs862ILDzhQ7UrIwDKvcj99xlmQG9eMLZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KDONpAtxji6ZqK017RPOAZeSIUbH1mvebUeyQw7GY6eI3Q3DQZ0wZMGJkn/KjkJChjzO3ZmDPtxv6gKJ7NAgqbfokMTFQ+IAsvIKkMhm0nP2y+jWEPIg7YGnafP3LRn9boj7RITiVP9o4b+1xQAXsGjepNEe9S+bQdUsLlOnMYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 55c9051c42a411f0b29709d653e92f7d-20250606
X-CID-CACHE: Type:Local,Time:202506061458+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d318edd9-629d-47eb-8ebc-8fab7742e99f,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:42937edfc8cb4d78ab6a4ad4c0615c70,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 55c9051c42a411f0b29709d653e92f7d-20250606
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xialonglong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 73034847; Fri, 06 Jun 2025 15:03:22 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id C4EE716001A04;
	Fri,  6 Jun 2025 15:03:22 +0800 (CST)
X-ns-mid: postfix-684292BA-650023363
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id D5D3416001A02;
	Fri,  6 Jun 2025 07:03:20 +0000 (UTC)
From: Longlong Xia <xialonglong@kylinos.cn>
To: akpm@linux-foundation.org,
	david@redhat.com,
	xu.xin16@zte.com.cn
Cc: chengming.zhou@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH 1/1] mm/ksm: add ksm_pages_sharing for each process to calculate profit more accurately
Date: Fri,  6 Jun 2025 15:03:14 +0800
Message-ID: <20250606070314.3028593-1-xialonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The general_profit_show() function only considers ksm_pages_sharing,
while ksm_process_profit() includes both ksm_pages_sharing and
ksm_pages_shared for each process. This leads to a mismatch between
the total profits from ksm_process_profit() and general_profit_show().

Based on my tests, the sum of ksm_process_profit() for all processes
can be up to 20% higher than general_profit_show(), depending on
the size of page_shared. For individual processes, the ratio of
ksm_pages_sharing to ksm_merging_pages is usually not equal to 1.

To resolve this, we suggest introducing ksm_pages_sharing for each
process to accurately calculate its pages_sharing, ensuring
ksm_process_profit() reflects shared memory benefits more accurately.

Add a new proc file named as ksm_pages_sharing both under /proc/<pid>/
and /proc/self/ksm_stat/ to indicate the saved pages of this process.
(not including ksm_zero_pages)

Suggested-by: Xu Xin <xu.xin16@zte.com.cn>
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 Documentation/admin-guide/mm/ksm.rst |  5 +++--
 Documentation/filesystems/proc.rst   |  8 ++++++++
 fs/proc/base.c                       | 18 ++++++++++++++++++
 include/linux/mm_types.h             |  5 +++++
 mm/ksm.c                             | 12 ++++++++----
 5 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-g=
uide/mm/ksm.rst
index ad8e7a41f3b5..0b33ef98930f 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -256,9 +256,10 @@ several times, which are unprofitable memory consume=
d.
 	process_profit =3D~ ksm_saved_pages * sizeof(page) -
 			  ksm_rmap_items * sizeof(rmap_item).
=20
-   where ksm_saved_pages equals to the sum of ``ksm_merging_pages`` and
+   where ksm_saved_pages equals to the sum of ``ksm_pages_sharing`` and
    ``ksm_zero_pages``, both of which are shown under the directory
-   ``/proc/<pid>/ksm_stat``, and ksm_rmap_items is also shown in
+   ``/proc/<pid>/ksm_stat``, ksm_merging_pages and ksm_rmap_items are
+   also shown in
    ``/proc/<pid>/ksm_stat``. The process profit is also shown in
    ``/proc/<pid>/ksm_stat`` as ksm_process_profit.
=20
diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesyste=
ms/proc.rst
index 2a17865dfe39..e14ea8389500 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -2290,6 +2290,7 @@ Example
     / # cat /proc/self/ksm_stat
     ksm_rmap_items 0
     ksm_zero_pages 0
+    ksm_pages_sharing 0
     ksm_merging_pages 0
     ksm_process_profit 0
     ksm_merge_any: no
@@ -2312,6 +2313,13 @@ ksm_zero_pages
 When /sys/kernel/mm/ksm/use_zero_pages is enabled, it represent how many
 empty pages are merged with kernel zero pages by KSM.
=20
+ksm_pages_sharing
+^^^^^^^^^^^^^^^^^
+
+It represents how many pages saved of this process.
+(not including ksm_zero_pages). It is the same with what
+/proc/<pid>/ksm_pages_sharing shows.
+
 ksm_merging_pages
 ^^^^^^^^^^^^^^^^^
=20
diff --git a/fs/proc/base.c b/fs/proc/base.c
index c667702dc69b..327bf82acf54 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -3262,6 +3262,21 @@ static int proc_pid_ksm_merging_pages(struct seq_f=
ile *m, struct pid_namespace *
=20
 	return 0;
 }
+
+static int proc_pid_ksm_pages_sharing(struct seq_file *m, struct pid_nam=
espace *ns,
+				struct pid *pid, struct task_struct *task)
+{
+	struct mm_struct *mm;
+
+	mm =3D get_task_mm(task);
+	if (mm) {
+		seq_printf(m, "%lu\n", mm->ksm_pages_sharing);
+		mmput(mm);
+	}
+
+	return 0;
+}
+
 static int proc_pid_ksm_stat(struct seq_file *m, struct pid_namespace *n=
s,
 				struct pid *pid, struct task_struct *task)
 {
@@ -3272,6 +3287,7 @@ static int proc_pid_ksm_stat(struct seq_file *m, st=
ruct pid_namespace *ns,
 	if (mm) {
 		seq_printf(m, "ksm_rmap_items %lu\n", mm->ksm_rmap_items);
 		seq_printf(m, "ksm_zero_pages %ld\n", mm_ksm_zero_pages(mm));
+		seq_printf(m, "ksm_pages_sharing %lu\n", mm->ksm_pages_sharing);
 		seq_printf(m, "ksm_merging_pages %lu\n", mm->ksm_merging_pages);
 		seq_printf(m, "ksm_process_profit %ld\n", ksm_process_profit(mm));
 		seq_printf(m, "ksm_merge_any: %s\n",
@@ -3421,6 +3437,7 @@ static const struct pid_entry tgid_base_stuff[] =3D=
 {
 	ONE("seccomp_cache", S_IRUSR, proc_pid_seccomp_cache),
 #endif
 #ifdef CONFIG_KSM
+	ONE("ksm_pages_sharing",  S_IRUSR, proc_pid_ksm_pages_sharing),
 	ONE("ksm_merging_pages",  S_IRUSR, proc_pid_ksm_merging_pages),
 	ONE("ksm_stat",  S_IRUSR, proc_pid_ksm_stat),
 #endif
@@ -3758,6 +3775,7 @@ static const struct pid_entry tid_base_stuff[] =3D =
{
 	ONE("seccomp_cache", S_IRUSR, proc_pid_seccomp_cache),
 #endif
 #ifdef CONFIG_KSM
+	ONE("ksm_pages_sharing",  S_IRUSR, proc_pid_ksm_pages_sharing),
 	ONE("ksm_merging_pages",  S_IRUSR, proc_pid_ksm_merging_pages),
 	ONE("ksm_stat",  S_IRUSR, proc_pid_ksm_stat),
 #endif
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index d6b91e8a66d6..d260cb09c10a 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1176,6 +1176,11 @@ struct mm_struct {
 		 * merging (not including ksm_zero_pages).
 		 */
 		unsigned long ksm_merging_pages;
+		/*
+		 * Represents how many pages saved of this process.
+		 * (not including ksm_zero_pages).
+		 */
+		unsigned long ksm_pages_sharing;
 		/*
 		 * Represent how many pages are checked for ksm merging
 		 * including merged and not merged.
diff --git a/mm/ksm.c b/mm/ksm.c
index 8583fb91ef13..c2d85ea07b1c 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -824,6 +824,7 @@ static void remove_node_from_stable_tree(struct ksm_s=
table_node *stable_node)
 	hlist_for_each_entry(rmap_item, &stable_node->hlist, hlist) {
 		if (rmap_item->hlist.next) {
 			ksm_pages_sharing--;
+			rmap_item->mm->ksm_pages_sharing--;
 			trace_ksm_remove_rmap_item(stable_node->kpfn, rmap_item, rmap_item->m=
m);
 		} else {
 			ksm_pages_shared--;
@@ -976,8 +977,10 @@ static void remove_rmap_item_from_tree(struct ksm_rm=
ap_item *rmap_item)
 		folio_unlock(folio);
 		folio_put(folio);
=20
-		if (!hlist_empty(&stable_node->hlist))
+		if (!hlist_empty(&stable_node->hlist)) {
 			ksm_pages_sharing--;
+			rmap_item->mm->ksm_pages_sharing--;
+		}
 		else
 			ksm_pages_shared--;
=20
@@ -2202,9 +2205,10 @@ static void stable_tree_append(struct ksm_rmap_ite=
m *rmap_item,
 	rmap_item->address |=3D STABLE_FLAG;
 	hlist_add_head(&rmap_item->hlist, &stable_node->hlist);
=20
-	if (rmap_item->hlist.next)
+	if (rmap_item->hlist.next) {
 		ksm_pages_sharing++;
-	else
+		rmap_item->mm->ksm_pages_sharing++;
+	} else
 		ksm_pages_shared++;
=20
 	rmap_item->mm->ksm_merging_pages++;
@@ -3290,7 +3294,7 @@ bool ksm_process_mergeable(struct mm_struct *mm)
=20
 long ksm_process_profit(struct mm_struct *mm)
 {
-	return (long)(mm->ksm_merging_pages + mm_ksm_zero_pages(mm)) * PAGE_SIZ=
E -
+	return (long)(mm->ksm_pages_sharing + mm_ksm_zero_pages(mm)) * PAGE_SIZ=
E -
 		mm->ksm_rmap_items * sizeof(struct ksm_rmap_item);
 }
 #endif /* CONFIG_PROC_FS */
--=20
2.43.0

