Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C88E2AE6A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 03:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749007091; cv=none; b=sGW3sRNCjJt1pabqxpGkKWSzOxkhopmpbyT9KSC9wfEOcp8tdpcXESK+iKFHzuyXnVHuQVdQZZ6cI19EnLjan6s55VPuROU6Htq/rV6IDlHXDuwRKRszN1UKMFhH0o9REAgA4OMNG36T6C8WwXW4O2SKlzy7y9TcsDhc19pJ2W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749007091; c=relaxed/simple;
	bh=8vPu1JLTppgypZ9PVkTdVO/4c1jM1bySPSp3J65LxLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EqKX39DhDegcmr4aU4FNut/spuhtGmvHoMgOnR+zu2SzsXb1i8mmafeBmTCWaXfX4jdzJbAvru/N+1bpoOm8GEJIkL3VTMK39Xg9x4PdvHpQEcB99Lfjev8dhLoqRU8+9xTJsSSkEu/9Ww5RnXtEI8lwozMuaB0IR3p/4/bltvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8620fc9640f211f0b29709d653e92f7d-20250604
X-CID-CACHE: Type:Local,Time:202506041104+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:7554a784-75bf-49c4-86d3-2d7ceffb29ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:703a7164edea27775e5ee36df04c02ce,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|51,EDM:5,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8620fc9640f211f0b29709d653e92f7d-20250604
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xialonglong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 668851048; Wed, 04 Jun 2025 11:18:02 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 54B6316001CC7;
	Wed,  4 Jun 2025 11:18:02 +0800 (CST)
X-ns-mid: postfix-683FBAE9-963627654
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 960B416001A01;
	Wed,  4 Jun 2025 03:18:01 +0000 (UTC)
From: Longlong Xia <xialonglong@kylinos.cn>
To: akpm@linux-foundation.org,
	xu.xin16@zte.com.cn
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH 2/2] mm/ksm: Rename ksm_merging_pages to ksm_process_sharing
Date: Wed,  4 Jun 2025 11:17:55 +0800
Message-ID: <20250604031758.4150209-3-xialonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250604031758.4150209-1-xialonglong@kylinos.cn>
References: <20250604031758.4150209-1-xialonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Renamed ksm_merging_pages to ksm_process_sharing to better
reflect its role in representing the number of sharing pages
for each process.

Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 Documentation/admin-guide/mm/ksm.rst                   |  6 +++---
 Documentation/filesystems/proc.rst                     |  6 +++---
 .../translations/zh_CN/admin-guide/mm/ksm.rst          |  8 ++++----
 .../translations/zh_TW/admin-guide/mm/ksm.rst          |  8 ++++----
 fs/proc/base.c                                         | 10 +++++-----
 include/linux/mm_types.h                               |  2 +-
 mm/ksm.c                                               |  8 ++++----
 tools/testing/selftests/mm/ksm_functional_tests.c      | 10 +++++-----
 8 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-g=
uide/mm/ksm.rst
index ad8e7a41f3b5..02b165dfba79 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -256,18 +256,18 @@ several times, which are unprofitable memory consum=
ed.
 	process_profit =3D~ ksm_saved_pages * sizeof(page) -
 			  ksm_rmap_items * sizeof(rmap_item).
=20
-   where ksm_saved_pages equals to the sum of ``ksm_merging_pages`` and
+   where ksm_saved_pages equals to the sum of ``ksm_process_sharing`` an=
d
    ``ksm_zero_pages``, both of which are shown under the directory
    ``/proc/<pid>/ksm_stat``, and ksm_rmap_items is also shown in
    ``/proc/<pid>/ksm_stat``. The process profit is also shown in
    ``/proc/<pid>/ksm_stat`` as ksm_process_profit.
=20
 From the perspective of application, a high ratio of ``ksm_rmap_items`` =
to
-``ksm_merging_pages`` means a bad madvise-applied policy, so developers =
or
+``ksm_process_sharing`` means a bad madvise-applied policy, so developer=
s or
 administrators have to rethink how to change madvise policy. Giving an e=
xample
 for reference, a page's size is usually 4K, and the rmap_item's size is
 separately 32B on 32-bit CPU architecture and 64B on 64-bit CPU architec=
ture.
-so if the ``ksm_rmap_items/ksm_merging_pages`` ratio exceeds 64 on 64-bi=
t CPU
+so if the ``ksm_rmap_items/ksm_process_sharing`` ratio exceeds 64 on 64-=
bit CPU
 or exceeds 128 on 32-bit CPU, then the app's madvise policy should be dr=
opped,
 because the ksm profit is approximately zero or negative.
=20
diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesyste=
ms/proc.rst
index 2a17865dfe39..08840f027b60 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -2290,7 +2290,7 @@ Example
     / # cat /proc/self/ksm_stat
     ksm_rmap_items 0
     ksm_zero_pages 0
-    ksm_merging_pages 0
+    ksm_process_sharing 0
     ksm_process_profit 0
     ksm_merge_any: no
     ksm_mergeable: no
@@ -2312,12 +2312,12 @@ ksm_zero_pages
 When /sys/kernel/mm/ksm/use_zero_pages is enabled, it represent how many
 empty pages are merged with kernel zero pages by KSM.
=20
-ksm_merging_pages
+ksm_process_sharing
 ^^^^^^^^^^^^^^^^^
=20
 It represents how many pages of this process are involved in KSM merging
 (not including ksm_zero_pages). It is the same with what
-/proc/<pid>/ksm_merging_pages shows.
+/proc/<pid>/ksm_process_sharing shows.
=20
 ksm_process_profit
 ^^^^^^^^^^^^^^^^^^
diff --git a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst b/Do=
cumentation/translations/zh_CN/admin-guide/mm/ksm.rst
index 0029c4fd2201..8fb9e1452954 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
@@ -164,16 +164,16 @@ KSM=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87=E5=90=88=E5=
=B9=B6=E7=9B=B8=E5=90=8C=E7=9A=84=E9=A1=B5=E9=9D=A2=E6=9D=A5=E8=8A=82=E7=9C=
=81=E5=86=85=E5=AD=98=EF=BC=8C=E4=BD=86=E4=B9=9F=E4=BC=9A=E6=B6=88=E8=80=97=
=E9=A2=9D=E5=A4=96=E7=9A=84
=20
 2) =E5=8D=95=E4=B8=80=E8=BF=9B=E7=A8=8B=E4=B8=ADKSM=E7=9A=84=E6=94=B6=E7=
=9B=8A=E4=B9=9F=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87=E4=BB=A5=E4=B8=8B=E8=BF=
=91=E4=BC=BC=E7=9A=84=E8=AE=A1=E7=AE=97=E5=BE=97=E5=88=B0::
=20
-       process_profit =3D~ ksm_merging_pages * sizeof(page) -
+       process_profit =3D~ ksm_process_sharing * sizeof(page) -
                          ksm_rmap_items * sizeof(rmap_item).
=20
-   =E5=85=B6=E4=B8=ADksm_merging_pages=E6=98=BE=E7=A4=BA=E5=9C=A8 ``/pro=
c/<pid>/`` =E7=9B=AE=E5=BD=95=E4=B8=8B=EF=BC=8C=E8=80=8Cksm_rmap_items
+   =E5=85=B6=E4=B8=ADksm_process_sharing=E6=98=BE=E7=A4=BA=E5=9C=A8 ``/p=
roc/<pid>/`` =E7=9B=AE=E5=BD=95=E4=B8=8B=EF=BC=8C=E8=80=8Cksm_rmap_items
    =E6=98=BE=E7=A4=BA=E5=9C=A8 ``/proc/<pid>/ksm_stat`` =E3=80=82
=20
-=E4=BB=8E=E5=BA=94=E7=94=A8=E7=9A=84=E8=A7=92=E5=BA=A6=E6=9D=A5=E7=9C=8B=
=EF=BC=8C ``ksm_rmap_items`` =E5=92=8C ``ksm_merging_pages`` =E7=9A=84=E9=
=AB=98=E6=AF=94=E4=BE=8B=E6=84=8F
+=E4=BB=8E=E5=BA=94=E7=94=A8=E7=9A=84=E8=A7=92=E5=BA=A6=E6=9D=A5=E7=9C=8B=
=EF=BC=8C ``ksm_rmap_items`` =E5=92=8C ``ksm_process_sharing`` =E7=9A=84=E9=
=AB=98=E6=AF=94=E4=BE=8B=E6=84=8F
 =E5=91=B3=E7=9D=80=E4=B8=8D=E5=A5=BD=E7=9A=84madvise-applied=E7=AD=96=E7=
=95=A5=EF=BC=8C=E6=89=80=E4=BB=A5=E5=BC=80=E5=8F=91=E8=80=85=E6=88=96=E7=AE=
=A1=E7=90=86=E5=91=98=E5=BF=85=E9=A1=BB=E9=87=8D=E6=96=B0=E8=80=83=E8=99=91=
=E5=A6=82=E4=BD=95=E6=94=B9=E5=8F=98madvis=E7=AD=96
 =E7=95=A5=E3=80=82=E4=B8=BE=E4=B8=AA=E4=BE=8B=E5=AD=90=E4=BE=9B=E5=8F=82=
=E8=80=83=EF=BC=8C=E4=B8=80=E4=B8=AA=E9=A1=B5=E9=9D=A2=E7=9A=84=E5=A4=A7=E5=
=B0=8F=E9=80=9A=E5=B8=B8=E6=98=AF4K=EF=BC=8C=E8=80=8Crmap_item=E7=9A=84=E5=
=A4=A7=E5=B0=8F=E5=9C=A832=E4=BD=8DCPU=E6=9E=B6=E6=9E=84=E4=B8=8A=E5=88=86
-=E5=88=AB=E6=98=AF32B=EF=BC=8C=E5=9C=A864=E4=BD=8DCPU=E6=9E=B6=E6=9E=84=E4=
=B8=8A=E6=98=AF64B=E3=80=82=E6=89=80=E4=BB=A5=E5=A6=82=E6=9E=9C ``ksm_rma=
p_items/ksm_merging_pages``
+=E5=88=AB=E6=98=AF32B=EF=BC=8C=E5=9C=A864=E4=BD=8DCPU=E6=9E=B6=E6=9E=84=E4=
=B8=8A=E6=98=AF64B=E3=80=82=E6=89=80=E4=BB=A5=E5=A6=82=E6=9E=9C ``ksm_rma=
p_items/ksm_process_sharing``
 =E7=9A=84=E6=AF=94=E4=BE=8B=E5=9C=A864=E4=BD=8DCPU=E4=B8=8A=E8=B6=85=E8=BF=
=8764=EF=BC=8C=E6=88=96=E8=80=85=E5=9C=A832=E4=BD=8DCPU=E4=B8=8A=E8=B6=85=
=E8=BF=87128=EF=BC=8C=E9=82=A3=E4=B9=88=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=
=E7=9A=84madvise=E7=AD=96=E7=95=A5=E5=BA=94
 =E8=AF=A5=E8=A2=AB=E6=94=BE=E5=BC=83=EF=BC=8C=E5=9B=A0=E4=B8=BAksm=E6=94=
=B6=E7=9B=8A=E5=A4=A7=E7=BA=A6=E4=B8=BA=E9=9B=B6=E6=88=96=E8=B4=9F=E5=80=BC=
=E3=80=82
=20
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst b/Do=
cumentation/translations/zh_TW/admin-guide/mm/ksm.rst
index 1b4944b3cf61..3bcefda97827 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
@@ -164,16 +164,16 @@ KSM=E5=8F=AF=E4=BB=A5=E9=80=9A=E9=81=8E=E5=90=88=E4=
=BD=B5=E7=9B=B8=E5=90=8C=E7=9A=84=E9=A0=81=E9=9D=A2=E4=BE=86=E7=AF=80=E7=9C=
=81=E5=85=A7=E5=AD=98=EF=BC=8C=E4=BD=86=E4=B9=9F=E6=9C=83=E6=B6=88=E8=80=97=
=E9=A1=8D=E5=A4=96=E7=9A=84
=20
 2) =E5=96=AE=E4=B8=80=E9=80=B2=E7=A8=8B=E4=B8=ADKSM=E7=9A=84=E6=94=B6=E7=
=9B=8A=E4=B9=9F=E5=8F=AF=E4=BB=A5=E9=80=9A=E9=81=8E=E4=BB=A5=E4=B8=8B=E8=BF=
=91=E4=BC=BC=E7=9A=84=E8=A8=88=E7=AE=97=E5=BE=97=E5=88=B0::
=20
-       process_profit =3D~ ksm_merging_pages * sizeof(page) -
+       process_profit =3D~ ksm_process_sharing * sizeof(page) -
                          ksm_rmap_items * sizeof(rmap_item).
=20
-   =E5=85=B6=E4=B8=ADksm_merging_pages=E9=A1=AF=E7=A4=BA=E5=9C=A8 ``/pro=
c/<pid>/`` =E7=9B=AE=E9=8C=84=E4=B8=8B=EF=BC=8C=E8=80=8Cksm_rmap_items
+   =E5=85=B6=E4=B8=ADksm_process_sharing=E9=A1=AF=E7=A4=BA=E5=9C=A8 ``/p=
roc/<pid>/`` =E7=9B=AE=E9=8C=84=E4=B8=8B=EF=BC=8C=E8=80=8Cksm_rmap_items
    =E9=A1=AF=E7=A4=BA=E5=9C=A8 ``/proc/<pid>/ksm_stat`` =E3=80=82
=20
-=E5=BE=9E=E6=87=89=E7=94=A8=E7=9A=84=E8=A7=92=E5=BA=A6=E4=BE=86=E7=9C=8B=
=EF=BC=8C ``ksm_rmap_items`` =E5=92=8C ``ksm_merging_pages`` =E7=9A=84=E9=
=AB=98=E6=AF=94=E4=BE=8B=E6=84=8F
+=E5=BE=9E=E6=87=89=E7=94=A8=E7=9A=84=E8=A7=92=E5=BA=A6=E4=BE=86=E7=9C=8B=
=EF=BC=8C ``ksm_rmap_items`` =E5=92=8C ``ksm_process_sharing`` =E7=9A=84=E9=
=AB=98=E6=AF=94=E4=BE=8B=E6=84=8F
 =E5=91=B3=E7=9D=80=E4=B8=8D=E5=A5=BD=E7=9A=84madvise-applied=E7=AD=96=E7=
=95=A5=EF=BC=8C=E6=89=80=E4=BB=A5=E9=96=8B=E7=99=BC=E8=80=85=E6=88=96=E7=AE=
=A1=E7=90=86=E5=93=A1=E5=BF=85=E9=A0=88=E9=87=8D=E6=96=B0=E8=80=83=E6=85=AE=
=E5=A6=82=E4=BD=95=E6=94=B9=E8=AE=8Amadvis=E7=AD=96
 =E7=95=A5=E3=80=82=E8=88=89=E5=80=8B=E4=BE=8B=E5=AD=90=E4=BE=9B=E5=8F=83=
=E8=80=83=EF=BC=8C=E4=B8=80=E5=80=8B=E9=A0=81=E9=9D=A2=E7=9A=84=E5=A4=A7=E5=
=B0=8F=E9=80=9A=E5=B8=B8=E6=98=AF4K=EF=BC=8C=E8=80=8Crmap_item=E7=9A=84=E5=
=A4=A7=E5=B0=8F=E5=9C=A832=E4=BD=8DCPU=E6=9E=B6=E6=A7=8B=E4=B8=8A=E5=88=86
-=E5=88=A5=E6=98=AF32B=EF=BC=8C=E5=9C=A864=E4=BD=8DCPU=E6=9E=B6=E6=A7=8B=E4=
=B8=8A=E6=98=AF64B=E3=80=82=E6=89=80=E4=BB=A5=E5=A6=82=E6=9E=9C ``ksm_rma=
p_items/ksm_merging_pages``
+=E5=88=A5=E6=98=AF32B=EF=BC=8C=E5=9C=A864=E4=BD=8DCPU=E6=9E=B6=E6=A7=8B=E4=
=B8=8A=E6=98=AF64B=E3=80=82=E6=89=80=E4=BB=A5=E5=A6=82=E6=9E=9C ``ksm_rma=
p_items/ksm_process_sharing``
 =E7=9A=84=E6=AF=94=E4=BE=8B=E5=9C=A864=E4=BD=8DCPU=E4=B8=8A=E8=B6=85=E9=81=
=8E64=EF=BC=8C=E6=88=96=E8=80=85=E5=9C=A832=E4=BD=8DCPU=E4=B8=8A=E8=B6=85=
=E9=81=8E128=EF=BC=8C=E9=82=A3=E9=BA=BC=E6=87=89=E7=94=A8=E7=A8=8B=E5=BA=8F=
=E7=9A=84madvise=E7=AD=96=E7=95=A5=E6=87=89
 =E8=A9=B2=E8=A2=AB=E6=94=BE=E6=A3=84=EF=BC=8C=E5=9B=A0=E7=88=B2ksm=E6=94=
=B6=E7=9B=8A=E5=A4=A7=E7=B4=84=E7=88=B2=E9=9B=B6=E6=88=96=E8=B2=A0=E5=80=BC=
=E3=80=82
=20
diff --git a/fs/proc/base.c b/fs/proc/base.c
index c667702dc69b..91582e829818 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -3249,14 +3249,14 @@ static int proc_pid_patch_state(struct seq_file *=
m, struct pid_namespace *ns,
 #endif /* CONFIG_LIVEPATCH */
=20
 #ifdef CONFIG_KSM
-static int proc_pid_ksm_merging_pages(struct seq_file *m, struct pid_nam=
espace *ns,
+static int proc_pid_ksm_process_sharing(struct seq_file *m, struct pid_n=
amespace *ns,
 				struct pid *pid, struct task_struct *task)
 {
 	struct mm_struct *mm;
=20
 	mm =3D get_task_mm(task);
 	if (mm) {
-		seq_printf(m, "%lu\n", mm->ksm_merging_pages);
+		seq_printf(m, "%lu\n", mm->ksm_process_sharing);
 		mmput(mm);
 	}
=20
@@ -3272,7 +3272,7 @@ static int proc_pid_ksm_stat(struct seq_file *m, st=
ruct pid_namespace *ns,
 	if (mm) {
 		seq_printf(m, "ksm_rmap_items %lu\n", mm->ksm_rmap_items);
 		seq_printf(m, "ksm_zero_pages %ld\n", mm_ksm_zero_pages(mm));
-		seq_printf(m, "ksm_merging_pages %lu\n", mm->ksm_merging_pages);
+		seq_printf(m, "ksm_process_sharing %lu\n", mm->ksm_process_sharing);
 		seq_printf(m, "ksm_process_profit %ld\n", ksm_process_profit(mm));
 		seq_printf(m, "ksm_merge_any: %s\n",
 				test_bit(MMF_VM_MERGE_ANY, &mm->flags) ? "yes" : "no");
@@ -3421,7 +3421,7 @@ static const struct pid_entry tgid_base_stuff[] =3D=
 {
 	ONE("seccomp_cache", S_IRUSR, proc_pid_seccomp_cache),
 #endif
 #ifdef CONFIG_KSM
-	ONE("ksm_merging_pages",  S_IRUSR, proc_pid_ksm_merging_pages),
+	ONE("ksm_process_sharing",  S_IRUSR, proc_pid_ksm_process_sharing),
 	ONE("ksm_stat",  S_IRUSR, proc_pid_ksm_stat),
 #endif
 };
@@ -3758,7 +3758,7 @@ static const struct pid_entry tid_base_stuff[] =3D =
{
 	ONE("seccomp_cache", S_IRUSR, proc_pid_seccomp_cache),
 #endif
 #ifdef CONFIG_KSM
-	ONE("ksm_merging_pages",  S_IRUSR, proc_pid_ksm_merging_pages),
+	ONE("ksm_process_sharing",  S_IRUSR, proc_pid_ksm_process_sharing),
 	ONE("ksm_stat",  S_IRUSR, proc_pid_ksm_stat),
 #endif
 };
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index d6b91e8a66d6..c3383701c2a7 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1175,7 +1175,7 @@ struct mm_struct {
 		 * Represent how many pages of this process are involved in KSM
 		 * merging (not including ksm_zero_pages).
 		 */
-		unsigned long ksm_merging_pages;
+		unsigned long ksm_process_sharing;
 		/*
 		 * Represent how many pages are checked for ksm merging
 		 * including merged and not merged.
diff --git a/mm/ksm.c b/mm/ksm.c
index fa4e1618b671..fbcecd0fc1fd 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -824,7 +824,7 @@ static void remove_node_from_stable_tree(struct ksm_s=
table_node *stable_node)
 	hlist_for_each_entry(rmap_item, &stable_node->hlist, hlist) {
 		if (rmap_item->hlist.next) {
 			ksm_pages_sharing--;
-			rmap_item->mm->ksm_merging_pages--;
+			rmap_item->mm->ksm_process_sharing--;
 			trace_ksm_remove_rmap_item(stable_node->kpfn, rmap_item, rmap_item->m=
m);
 		} else
 			ksm_pages_shared--;
@@ -976,7 +976,7 @@ static void remove_rmap_item_from_tree(struct ksm_rma=
p_item *rmap_item)
=20
 		if (!hlist_empty(&stable_node->hlist)) {
 			ksm_pages_sharing--;
-			rmap_item->mm->ksm_merging_pages--;
+			rmap_item->mm->ksm_process_sharing--;
 		} else
 			ksm_pages_shared--;
=20
@@ -2201,7 +2201,7 @@ static void stable_tree_append(struct ksm_rmap_item=
 *rmap_item,
=20
 	if (rmap_item->hlist.next) {
 		ksm_pages_sharing++;
-		rmap_item->mm->ksm_merging_pages++;
+		rmap_item->mm->ksm_process_sharing++;
 	} else
 		ksm_pages_shared++;
 }
@@ -3286,7 +3286,7 @@ bool ksm_process_mergeable(struct mm_struct *mm)
=20
 long ksm_process_profit(struct mm_struct *mm)
 {
-	return (long)(mm->ksm_merging_pages + mm_ksm_zero_pages(mm)) * PAGE_SIZ=
E -
+	return (long)(mm->ksm_process_sharing + mm_ksm_zero_pages(mm)) * PAGE_S=
IZE -
 		mm->ksm_rmap_items * sizeof(struct ksm_rmap_item);
 }
 #endif /* CONFIG_PROC_FS */
diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/te=
sting/selftests/mm/ksm_functional_tests.c
index b61803e36d1c..48037e6cc55d 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -41,7 +41,7 @@ static int mem_fd;
 static int ksm_fd;
 static int ksm_full_scans_fd;
 static int proc_self_ksm_stat_fd;
-static int proc_self_ksm_merging_pages_fd;
+static int proc_self_ksm_process_sharing_fd;
 static int ksm_use_zero_pages_fd;
 static int pagemap_fd;
 static size_t pagesize;
@@ -105,10 +105,10 @@ static long get_my_merging_pages(void)
 	char buf[10];
 	ssize_t ret;
=20
-	if (proc_self_ksm_merging_pages_fd < 0)
-		return proc_self_ksm_merging_pages_fd;
+	if (proc_self_ksm_process_sharing_fd < 0)
+		return proc_self_ksm_process_sharing_fd;
=20
-	ret =3D pread(proc_self_ksm_merging_pages_fd, buf, sizeof(buf) - 1, 0);
+	ret =3D pread(proc_self_ksm_process_sharing_fd, buf, sizeof(buf) - 1, 0=
);
 	if (ret <=3D 0)
 		return -errno;
 	buf[ret] =3D 0;
@@ -671,7 +671,7 @@ static void init_global_file_handles(void)
 	if (pagemap_fd < 0)
 		ksft_exit_skip("open(\"/proc/self/pagemap\") failed\n");
 	proc_self_ksm_stat_fd =3D open("/proc/self/ksm_stat", O_RDONLY);
-	proc_self_ksm_merging_pages_fd =3D open("/proc/self/ksm_merging_pages",
+	proc_self_ksm_process_sharing_fd =3D open("/proc/self/ksm_process_shari=
ng",
 						O_RDONLY);
 	ksm_use_zero_pages_fd =3D open("/sys/kernel/mm/ksm/use_zero_pages", O_R=
DWR);
 }
--=20
2.43.0

