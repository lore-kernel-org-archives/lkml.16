Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3531E8336
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431666; cv=none; b=h7UNt/ZTwQ8mS78TYwgwKj0Q7VGRbsN76c2c5bNnJWLB+th+O/SsULQB5E0j+BkEp0cVUZgaEMwJvGX7KBKcvna+wfK8WS8eqET5ZlrOXf3/IanacFYDFGmfmxLKlFSfZ205HFD7e9+06XK63a1it/W0T0obfVk/rS85YkrHfcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431666; c=relaxed/simple;
	bh=9DcyqfGZ6RX6upf8ENBwjsVy5lZthPLmqytnwAyBEX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqdAyODhxvq1s8vBgzLTmXzzWic5/SVdedSbZNBKcV6QUTLlTX9SP+6EEwrwNfMIL0yqk+3K3iqmevOg28GkbxEw+EFWO0OExMrjnj+Ll2Mn0bj/Y2+sqUq0a7B1bcXWXtTxPKv848/WRKizFM8/qhs01c3L093MFi87gheFOs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iW7XEqR4; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iW7XEqR4"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NnXgK009887;
	Mon, 5 May 2025 07:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=OK7cVIxBR3pTlvjS5
	NsZDFZUqX7DAWXhiplm2G+4ffg=; b=iW7XEqR4ajEDb6lihrQ3KKbWS6xkryL+M
	tYHoHiXrUrsrsom/hqzVdfRntS4ul3Y06obOgLiyEloL0sOiRzoF6uYJvlRSrbVa
	N8euPsF6UyRNILZqnIctG3vvUjS1WQSzGHXtKpNQWu3BlyDNXXMvYTZWOXdHunyh
	stAvfStxCZ8COOlWp/EZXmMPfmnI1ccvLUibXxIbaT1WAUxmbZ7KDe9Lq5PB008t
	mMXjzZj2WBFQtnoUiTNYbOwlZ5cNULPFdnd1agVUTMvmLP3OrrEE0HqRe8LoCl/O
	w0kk+zyi8RKWrmcWYb9oaDVuStLbRChBYD9EaTSS3dVGCs5n+ME4A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6ysedf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457p51d010075;
	Mon, 5 May 2025 07:54:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6yseda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5454106u032227;
	Mon, 5 May 2025 07:54:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxymd4f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:08 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457s5Ag53084532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:54:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A0532004D;
	Mon,  5 May 2025 07:54:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E14FF20040;
	Mon,  5 May 2025 07:54:02 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:54:02 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v3 4/6] powerpc: book3s: vas: use lock guard for mutex
Date: Mon,  5 May 2025 13:23:31 +0530
Message-ID: <20250505075333.184463-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250505075333.184463-1-sshegde@linux.ibm.com>
References: <20250505075333.184463-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AHgX7C-qdgG1DTp7Wq3eVJl_X5xsqD_K
X-Authority-Analysis: v=2.4 cv=GKAIEvNK c=1 sm=1 tr=0 ts=68186ea2 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=2UBO4GguT1_OiFKDpwgA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: QqDmYpTXHRza-1ABTq5DZ8LtwC-N1KxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfX23qefl6SUD/f wWWS+cyrIWHMMuxqfKWR5sb+91iumax9aG0xXmPbpS/Nu+0O906ReaUQnvniVLAm3ormCtCHfti tpgQgAZJC1uxZghsTmpx1FGvlQU5W/1hndufsFcCgT+Fo8OMVC8/65wkXZXCXFwGRbvcr6UGYEl
 O+aTSgXIPksT8lHA4fQB8+GGmrotpwLpf/MS1ywZ0y6lQNLWTk/YkM0Ka34WLF0sP040CdRXkw5 eA0O8HY2VwEQ5PYzK0Xy7T3ipVnkS2J+FAXVH0kLCS9f4cdjG4+WAO6FOrwHK5QzC4ZYnwg6Gek yXBe84jcaWNP9/af9PNFqraaPWtgM1SwVcbbQ+JEfAaZZ1kiQ9QBrm/7QS/15Q2jVK2KPxfqPp/
 9XZEojFwF7YgUtlXm09g6ULotjTtkM2sbXPBLssv0UR8g8qdXQL8+TqDXSGOyU5bFk1DdsI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=835 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070

use lock guards for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

This shows the use of both guard and scoped_guard

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 32 ++++++++++---------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 0b6365d85d11..d7462c16d828 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -425,23 +425,22 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 	}
 
-	mutex_lock(&txwin->task_ref.mmap_mutex);
 	/*
 	 * The window may be inactive due to lost credit (Ex: core
 	 * removal with DLPAR). If the window is active again when
 	 * the credit is available, map the new paste address at the
 	 * window virtual address.
 	 */
-	if (txwin->status == VAS_WIN_ACTIVE) {
-		paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
-		if (paste_addr) {
-			fault = vmf_insert_pfn(vma, vma->vm_start,
-					(paste_addr >> PAGE_SHIFT));
-			mutex_unlock(&txwin->task_ref.mmap_mutex);
-			return fault;
+	scoped_guard(mutex, &txwin->task_ref.mmap_mutex) {
+		if (txwin->status == VAS_WIN_ACTIVE) {
+			paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
+			if (paste_addr) {
+				fault = vmf_insert_pfn(vma, vma->vm_start,
+						(paste_addr >> PAGE_SHIFT));
+				return fault;
+			}
 		}
 	}
-	mutex_unlock(&txwin->task_ref.mmap_mutex);
 
 	/*
 	 * Received this fault due to closing the actual window.
@@ -494,9 +493,8 @@ static void vas_mmap_close(struct vm_area_struct *vma)
 		return;
 	}
 
-	mutex_lock(&txwin->task_ref.mmap_mutex);
-	txwin->task_ref.vma = NULL;
-	mutex_unlock(&txwin->task_ref.mmap_mutex);
+	scoped_guard(mutex, &txwin->task_ref.mmap_mutex)
+		txwin->task_ref.vma = NULL;
 }
 
 static const struct vm_operations_struct vas_vm_ops = {
@@ -543,18 +541,16 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	 * close/open event and allows mmap() only when the window is
 	 * active.
 	 */
-	mutex_lock(&txwin->task_ref.mmap_mutex);
+	guard(mutex)(&txwin->task_ref.mmap_mutex);
 	if (txwin->status != VAS_WIN_ACTIVE) {
 		pr_err("Window is not active\n");
-		rc = -EACCES;
-		goto out;
+		return -EACCES;
 	}
 
 	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
 	if (!paste_addr) {
 		pr_err("Window paste address failed\n");
-		rc = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	pfn = paste_addr >> PAGE_SHIFT;
@@ -574,8 +570,6 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	txwin->task_ref.vma = vma;
 	vma->vm_ops = &vas_vm_ops;
 
-out:
-	mutex_unlock(&txwin->task_ref.mmap_mutex);
 	return rc;
 }
 
-- 
2.39.3

