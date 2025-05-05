Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB6F1E9B3B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431669; cv=none; b=cy4NOGdrgtPOFRmi+Vm+owW+TII03k8sr+bj18CfO/mMz9LysmJEiTfWq5PK46/C4IAxdeOoWMlzDRnB3JE+CfEo3oL2cGr7EUV7HDRNHeMqXpcm3thpVClsHzb8mFMYqMpbtd7p5DBErbs0cI8hwAmdPOua0BVfXcPsCGd+fNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431669; c=relaxed/simple;
	bh=pLrj10XVpmvCeQlqS1YDo65wb7GhRdMdufzTrwu5EhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvNWlihSCZLpERCv/lkQlY0OCcmd784rIA6k+Eg3x295rUIPvA39QDP7wHMOjxhBYE/pMeXH8fMU1WrcJL6NZKfkAseH3eYxQVSol2LK/rqjgKcDSzQsPeRmKkEBggL0P+L18WUUc/y0MWxbbPqHM+6MTi6WRbM3TyY0pucfZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hLYZwtdw; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hLYZwtdw"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Lh9VZ008512;
	Mon, 5 May 2025 07:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=g18/V1GPRXjmw65jY
	DlbKsnidaE5pfNS8dR6suKV/iU=; b=hLYZwtdwA1aIJKSvYFEBjM4s1HPaAbbMC
	JwQVqXoeCMy3Nvo1AVatEAKextvF8vX1CVb1LF+ku5pWVCDPKzlSf1XvqCdnP4ZO
	eimhqZaTbi1SrxGJ533ZK9OcnU5c1vI7YZcZ7JBs7FbXxcXDbkmgWoOelZ9M/Dpz
	sEuv0wDDwxP20xCUe9AWJsTrS2tJKO5aF8MtwNGtgya+og1z03Jwzm/rxNRoFkqp
	yz1xY8PkNohnuzXUzFq7RMoFAXzmoe/fYrwNXPNR5+7fcNgFM/ZNzQSd2Mvnm3XY
	4xQNbAdDke5bzxOJEq46FcZ2uUr9/Vw2Mop/HyjU8mtfQqtv1Oq0A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv1pp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:13 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457sCwm009686;
	Mon, 5 May 2025 07:54:12 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv1pp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5455LKUg013765;
	Mon, 5 May 2025 07:54:11 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e0624v9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:11 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457s8rY53412264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:54:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45A1120043;
	Mon,  5 May 2025 07:54:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1985A20040;
	Mon,  5 May 2025 07:54:06 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:54:05 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v3 5/6] powerpc: powernv: ocxl: use lock guard for mutex
Date: Mon,  5 May 2025 13:23:32 +0530
Message-ID: <20250505075333.184463-6-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: nzPlUvyNWAh3fWyh8rGkE3urckNKzglF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfX+XCRoWtFRCXP tMggtIN2qkZfJwJOuG+MMjobjoN+6lCVaLNrKluDYhylrb920YyydpYFKKNYfpuiyrzFPjMFxA5 +IvXaOWVe87WaBHp1aqvO9oVSjnA+oL+GN/QBce7AKBhGzufXZp1mYTWWQ9mFzrLby0sPKz22w+
 UCdgiJHHAZ5cdUqB2QDS9BStST5x5D64xt0tpKgttWszsVa+sYlRohou//zNtXT6qJAtET6x8cY AcLUvIteSGBejxGdLWCqdh5YsxtkXikO4bzdsd+NjS8H6Tnw2dPf41TLHFflp1D8GOLGiMBp6f6 Vzo2/RAKr0p7e832J/KQC8CxjwpdqoUnOS/O3JJUYSz7J9w+Z/+MDDje2/lOgUqk37FoW6WeXNM
 nl035uv8wgKS1C4CfNYIrj5ks992O2+K96sw5PLX52Gryqqv8octXjVHj8or94hNSzMhert7
X-Authority-Analysis: v=2.4 cv=O7k5vA9W c=1 sm=1 tr=0 ts=68186ea5 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=Gcc4__3hugxbekPXFGEA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 81p-2ThKUZcSUOoQVy-dUOe7zEz6sZjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=893
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070

use guard(mutex) for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/ocxl.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 64a9c7125c29..f8139948348e 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -172,12 +172,11 @@ static void pnv_ocxl_fixup_actag(struct pci_dev *dev)
 	if (phb->type != PNV_PHB_NPU_OCAPI)
 		return;
 
-	mutex_lock(&links_list_lock);
+	guard(mutex)(&links_list_lock);
 
 	link = find_link(dev);
 	if (!link) {
 		dev_warn(&dev->dev, "couldn't update actag information\n");
-		mutex_unlock(&links_list_lock);
 		return;
 	}
 
@@ -206,7 +205,6 @@ static void pnv_ocxl_fixup_actag(struct pci_dev *dev)
 	dev_dbg(&dev->dev, "total actags for function: %d\n",
 		link->fn_desired_actags[PCI_FUNC(dev->devfn)]);
 
-	mutex_unlock(&links_list_lock);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pnv_ocxl_fixup_actag);
 
@@ -253,12 +251,11 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
 {
 	struct npu_link *link;
 
-	mutex_lock(&links_list_lock);
+	guard(mutex)(&links_list_lock);
 
 	link = find_link(dev);
 	if (!link) {
 		dev_err(&dev->dev, "actag information not found\n");
-		mutex_unlock(&links_list_lock);
 		return -ENODEV;
 	}
 	/*
@@ -274,7 +271,6 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
 	*enabled   = link->fn_actags[PCI_FUNC(dev->devfn)].count;
 	*supported = link->fn_desired_actags[PCI_FUNC(dev->devfn)];
 
-	mutex_unlock(&links_list_lock);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_get_actag);
@@ -293,12 +289,11 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count)
 	 *
 	 * We only support one AFU-carrying function for now.
 	 */
-	mutex_lock(&links_list_lock);
+	guard(mutex)(&links_list_lock);
 
 	link = find_link(dev);
 	if (!link) {
 		dev_err(&dev->dev, "actag information not found\n");
-		mutex_unlock(&links_list_lock);
 		return -ENODEV;
 	}
 
@@ -309,7 +304,6 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count)
 			break;
 		}
 
-	mutex_unlock(&links_list_lock);
 	dev_dbg(&dev->dev, "%d PASIDs available for function\n",
 		rc ? 0 : *count);
 	return rc;
-- 
2.39.3

