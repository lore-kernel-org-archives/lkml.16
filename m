Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E6F1C1F29
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738323568; cv=none; b=pI3BXodwXoR85lzT4T1Y+GLQ/2ewGaKzworZt2UE6hCCpdO1HK/pGn9uysJbB1guZbhlGupgQgAoGuN/wvYfKpv7TBVZewFq0gXigyNi1rKu4sTgozKItRVH9XFSJMbyCD2vR5i24wR68zu5UjUXkVRsRTOjrikYkhsoCXl5UYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738323568; c=relaxed/simple;
	bh=OCRCYoveJgVA3X6bfiXw7j8vS6cMsbG+0VZlfG/lJi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1Mqvh7mOmEW1ARQwWmBjEAM3GHldcoCiBi+DY6Qu0xOVdoyWw+vEyDJVZipc7DhG+dpZq3wl3wmqXszIJ01E7PuabR6KNt0IJc/DmLniDJwQyv8Q3Nqq9ZBeFV2FQbqDp69iJpc393BY1K+Rq/UGnyCkxu4lxk5LYeWyGgjY+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CK1bwBJ9; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CK1bwBJ9"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V2PHPH032083;
	Fri, 31 Jan 2025 11:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Gx7mYxlvPnxS7ToHW
	ODs2SX8DGIeAEUZzY6poxrEPgA=; b=CK1bwBJ9NZCZdYHwpRGp0VpkRed5KUOwh
	68IXCGU6xEm7E8744ucpt18531Vrj8ozAK4r9xpUDNo49cwGRV4v/56Z/KXo1Iep
	De+sxVITCLMMGxTebAUiNJuBWJO4Duh8z4GWs9mtyo5ioSyf+ctAxss7C5JL5bJR
	wdHxFX9PHhCpFuEGE4EyKZh24J4S+ra4drZZIVGEhRsz3Hd8fk8UWOILM5kreEE6
	kU04Q1rLxl6KGFRpTYrzFZqfBlTUgd6AnG3XFcPb5T25dDc5CUYikO3Nx4I909Hc
	1nY+rT1CWTb3iG8LZEq1rd5FU3syfPN//7nyybiDiwY8Mq6gfDxaA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn5baa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:39:13 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50V8Pwx0017127;
	Fri, 31 Jan 2025 11:39:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44gfaxba9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:39:12 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50VBd8Lx58327330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 11:39:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF47E20105;
	Fri, 31 Jan 2025 11:39:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33F23200FF;
	Fri, 31 Jan 2025 11:39:05 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.16.21])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 11:39:04 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] powerpc: insert System RAM resource to prevent crashkernel conflict
Date: Fri, 31 Jan 2025 17:08:29 +0530
Message-ID: <20250131113830.925179-7-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
References: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -R9X4Yd0hKrSipumwL2ozcTUx-khaS8r
X-Proofpoint-GUID: -R9X4Yd0hKrSipumwL2ozcTUx-khaS8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=725 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310087

The next patch in the series with title "powerpc/crash: use generic
crashkernel reservation" enables powerpc to use generic crashkernel
reservation instead of custom implementation. This leads to exporting
of `Crash Kernel` memory to iomem_resource (/proc/iomem) via
insert_crashkernel_resources():kernel/crash_reserve.c or at another
place in the same file if
HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY is set.

The add_system_ram_resources():arch/powerpc/mm/mem.c adds `System RAM`
to iomem_resource using request_resource(). This creates a conflict with
`Crash Kernel`, which is added by the generic crashkernel reservation
code. As a result, the kernel ultimately fails to add `System RAM` to
iomem_resource. Consequently, it does not appear in /proc/iomem.

There are multiple approches tried to avoid this:

1. Don't add Crash Kernel to iomem_resource:
    - This has two issues.
      First, it requires adding an architecture-specific hook in the
      generic code. There are already two code paths to choose when to
      add `Crash Kernel` to iomem_resource. This adds one more code path
      to skip it.

      Second, what if `Crash Kernel` is required in /proc/iomem in the
      future? Many architectures do export it.

2. Don't add `System RAM` to iomem_resource by reverting commit
   c40dd2f766440 ("powerpc: Add System RAM to /proc/iomem"):
    - It's not ideal to export `System RAM` via /proc/iomem, but since
      it already done ealier and userspace tools like kdump and
      kdump-utils rely on `System RAM` from /proc/iomem, removing it
      will break userspace.

3. Add Crash Kernel along with System RAM to /proc/iomem:

This patch takes the third approach by updating
add_system_ram_resources() to use insert_resource() instead of the
request_resource() API to add the `System RAM` resource to
iomem_resource. insert_resource() allows inserting resources even if
they overlap with existing ones. Since `Crash Kernel` and `System RAM`
resources are added to iomem_resource early in the boot, any other
conflict is not expected.

With the changes introduced here and in the next patch, "powerpc/crash:
use generic crashkernel reservation," /proc/iomem now exports
`System RAM` and `Crash Kernel` as shown below:

$ cat /proc/iomem
00000000-3ffffffff : System RAM
  10000000-4fffffff : Crash kernel

The kdump script is capable of handling `System RAM` and `Crash Kernel`
in the above format. The same format is used in other architectures.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/mm/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index c7708c8fad29..615966d71425 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -376,7 +376,7 @@ static int __init add_system_ram_resources(void)
 			 */
 			res->end = end - 1;
 			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-			WARN_ON(request_resource(&iomem_resource, res) < 0);
+			WARN_ON(insert_resource(&iomem_resource, res) < 0);
 		}
 	}
 
-- 
2.48.1

