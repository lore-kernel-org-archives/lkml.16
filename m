Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3326B7E9
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746893452; cv=none; b=Y6h5ORk4UN6Rn8JbUGpBrlieCaZYOME95HJS9Uybp9G6eznbqCJjwnMtgkmY1tqpF5QYi9ISBX7fV8CKzEowLCT7ql5qeOkI9ug3gd6yE4R7PU7pEdxMSc0iJyWPAVnvtBi2F8GKaWX9tm0PSqh9SMz9UulW72Xo8RoCJYDo4O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746893452; c=relaxed/simple;
	bh=MZ95rc/JkfQUlR1xwovIeI1hhV+dQYghthcbBUsuUq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7vQv6IQwaNIgRqlixX7cwCmkP2SKBAUP/EZMYD3WLhrvdhImVMI0YLifl/ske1P4S8WkW1sjxdvpjiBu71HemWiH9x7TlnfQDPmjHqnN/hvLOQDSiaxtV3BaNO35aKcVZKqv0PmlBNr/ZexRyCW1Orte+4a8ymdDf75EMRQsxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cJ7JUGeG; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cJ7JUGeG"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54AEs54E024452;
	Sat, 10 May 2025 16:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=io72j5KWqDlMmxxN3kxXpKmyUF+Hu
	/PRzmVKu2s//S0=; b=cJ7JUGeG0akJ5DtvlP5odSitWziuvvRP8CI2DdtnxzRge
	aB6P/kC5TUiAOAiRdU/NNSJDNFaRtt6wzbG8Z/NsDHXaYGyQ8Z5godHnd2/YPRXw
	dLfD2SwEFcqxdnZQEPFcy0KyQbkYVTbNVUVppcT9cWtvXgZDBhgN7++CUcYGRDEy
	PG6zNkVd9WBLZCL1qIdR+meXdom5l+EwYzI/lao50UKO5GVOX/J3N3j24BWfdM/f
	RRJc690KRUlDc5VAYFS2bhHXORUDz7qQ+Zq/UAc+Ax9NkscaK0q+SLqdpGeLICNe
	sDa4iik5vGYUhSwO4JqvY1ASePn8Tqd5HfgMXn3Xw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1jng9h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 May 2025 16:10:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54ABhueL015486;
	Sat, 10 May 2025 16:10:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46hw8630au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 May 2025 16:10:46 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54AG6sdj029171;
	Sat, 10 May 2025 16:10:46 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46hw8630ar-1;
	Sat, 10 May 2025 16:10:45 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: cve@kernel.org
Cc: linux-kernel@vger.kernel.org, vegard.nossum@oracle.com,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH] Add vulnerable commits for few CVEs
Date: Sat, 10 May 2025 09:10:43 -0700
Message-ID: <20250510161043.473006-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-10_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505100165
X-Proofpoint-GUID: fyMURB18hRQd7rpR1OAMVbn5kze1TIpZ
X-Authority-Analysis: v=2.4 cv=PeH/hjhd c=1 sm=1 tr=0 ts=681f7a87 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=Dpd_Lz1zSQY-E1fnvBEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEwMDE2NSBTYWx0ZWRfX22j/dS7NLLb1 jkNc3rXCTKG11hjCVxB+FiGJuwQKFY1S++6hqujGvd9LY3SC5INPpsXkuFa77aS2RvabGSILGYp ChqUIdjimhnALXQvLyzLbPtBzKyMUUFcwuQpZMCN0FSqy7f3yopfSk+IQ6wEm1YQ2+ktseIs8DG
 Ns2PM+ITi3u3M0KbCHKh6adrCy9EjuwGkFSJrHEJ3T6w7k5SkLFs2F8KW/eVieShy58hTaeTy5c zGvO7MRIVPRgV45VZeu6A3aySeJznCoyxBUiWC0EG98WV4f0NIV/nq0hC5rjVMP/XlLqgEFB2Db 5wFf5ETk+bmme2LmUNyL1Tj1r7E+n5xA3w6W9eneiKH6FooUk2rWqhLwGC/Iyroz1NhT390gUMb
 rwvro43Fv5SzKSnEd5m4zjjPyLf1ToCMso5A3TEfT9sr4p2MmxE2NV862AjCl3ypScyrGbrk
X-Proofpoint-ORIG-GUID: fyMURB18hRQd7rpR1OAMVbn5kze1TIpZ

CVE-2025-21872: Re-mapping the entire mokvar_table is the problem and
the re-mapping is first done in this Fixes: 58c909022a5a ("efi: Support
for MOK variable config table"), so this is the broken commit

CVE-2025-21833: The fix moves dev_pasid dereference inside
WARN_ON_ONCE() as there is a possibility of dev_pasid being NULL, this
dereference is first introduced while adding debugfs support per file in
Fixes: d87731f60931 ("iommu/vt-d: debugfs: Create/remove debugfs file
per {device, pasid}")

CVE-2025-21832E: The problem is that iov_iter_revert() is done before a
negative return check which was was first added in Fixes: 3e1f941dd9f3
("block: fix DIO handling regressions in blkdev_read_iter()")

Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 cve/published/2025/CVE-2025-21832.vulnerable | 1 +
 cve/published/2025/CVE-2025-21833.vulnerable | 1 +
 cve/published/2025/CVE-2025-21872.vulnerable | 1 +
 3 files changed, 3 insertions(+)
 create mode 100644 cve/published/2025/CVE-2025-21832.vulnerable
 create mode 100644 cve/published/2025/CVE-2025-21833.vulnerable
 create mode 100644 cve/published/2025/CVE-2025-21872.vulnerable

diff --git a/cve/published/2025/CVE-2025-21832.vulnerable b/cve/published/2025/CVE-2025-21832.vulnerable
new file mode 100644
index 000000000000..feb566fe0511
--- /dev/null
+++ b/cve/published/2025/CVE-2025-21832.vulnerable
@@ -0,0 +1 @@
+3e1f941dd9f33776b3df4e30f741fe445ff773f3
diff --git a/cve/published/2025/CVE-2025-21833.vulnerable b/cve/published/2025/CVE-2025-21833.vulnerable
new file mode 100644
index 000000000000..86fa313ab645
--- /dev/null
+++ b/cve/published/2025/CVE-2025-21833.vulnerable
@@ -0,0 +1 @@
+d87731f609318a27e9aa3d01cf97798599d32839
diff --git a/cve/published/2025/CVE-2025-21872.vulnerable b/cve/published/2025/CVE-2025-21872.vulnerable
new file mode 100644
index 000000000000..96c8b40950cc
--- /dev/null
+++ b/cve/published/2025/CVE-2025-21872.vulnerable
@@ -0,0 +1 @@
+58c909022a5a56cd1d9e89c8c5461fd1f6a27bb5
-- 
2.47.1

