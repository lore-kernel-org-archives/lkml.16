Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6216C27450
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460038; cv=none; b=aeCphbzvjENxNt3lMOdJN8/8FitNQgdniKhjMSnYe7kNfX5EVMfJKCbJi37FweXyGO9FHuKaEV496SfWylHZTTw3SLXIsHzQtzpwc5sjsLrKb4txoCrRxTA2/JHcOhZfWkBWFPX//fGLiig0f4sUIL4qsUHncWiEknpBeaqZjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460038; c=relaxed/simple;
	bh=/qSq/DypDTV2SGPBOtJ2Yr/PLlf1SIYEE6JFdvSS8hE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5kVAJ+7ZEY97as5Flf6E9AvE28UaTs2+4BcAc6vRtAFap/lKuQ5xt5mcBAtTghR3m2UkFzF70B/R74tpXe99IK+mLPFrFKeoFKJUso/N63d4cs3sxpYDFJKDYx0Oh4IGSdoTUsfIUtRSTubuJk7CHfbmQyObEJIlW76ph1YLc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h9wrSDx9; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h9wrSDx9"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SINEuP004624;
	Wed, 28 May 2025 19:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=uRTDmonQFEKWk5vD4Y9d9UFUxG5Gt
	clMThE4+aMwUhw=; b=h9wrSDx9ub82gSFSCOqhWMWRlPjnaEj1MOc5e5K2G8jIb
	SCysd+x9ZyLwQPa03zgxPnxGbRS4hVA0JfpaZ+qHICkjeuLuuCSohQasE5y/3iBa
	K9A8KWTOJw+8bnA2OEbt81Qi+vlsliumif/LCxLgiLYAu813mQ0XYmo6grwrWTFS
	tVGf3qWDvBOj6UfYODCjDG1veR4q0mIpRj7u0Rn7/myYrRYIjQvAWKaGWflW0QBj
	3UgGk3yrXkrL7dBBg0FjuJ1UNnv8KjHHdbv8Nwkjvw/4XKTT6c1By+Ff9B7E1dzI
	tntht3m0b1MptyeqdRDcV8fXKExzkTxS4k9HQXgQA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v46txs97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 19:20:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54SHWjZn023126;
	Wed, 28 May 2025 19:20:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jatb3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 19:20:21 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54SJIufg018422;
	Wed, 28 May 2025 19:20:21 GMT
Received: from sidkumar-mac.us.oracle.com (dhcp-10-43-125-89.usdhcp.oraclecorp.com [10.43.125.89])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 46u4jatayc-1;
	Wed, 28 May 2025 19:20:21 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org,
        muchun.song@linux.dev, osalvador@suse.de,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: [PATCH] mm/hugetlb: convert hugetlb_change_protection() to folios
Date: Wed, 28 May 2025 15:20:13 -0400
Message-ID: <20250528192013.91130-1-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280169
X-Proofpoint-GUID: xbpKQU6oMx0rlWghTGBU6Px5h9m3MYFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OSBTYWx0ZWRfX2ulQxJ7H7joN yyAJx+4xBmM1VBlJ4TMbes+PVshZw9EhThLDQ8zcS/tBF5kNfX3Cf/L2kcokyZGTflyJR55tiz0 VT+y4tS9mkTXVN4JPmHZgCsRL+KsUPMw12LT8mwOG+4mEeLn4GfjagTz+ZpSyT1SfgSCEoe2H6I
 JBnsUy5U15PecO9ObsbLebNU6DsQu9/iQ4ldtJh1HgNV9VVtdApd78mh9DuViW6ALleFFJb7yl1 DEHsQ8HYa3qAoBbrVj7bUhpLRew1YlSKHoOyWrGp89+DkL4M1UgY+ZZEPVQO37CCzOXqtiPvS0f ArJ5ldT7bxP98Fw6G2L80938IhyVgz7MCmEhvvNr4XAOucXUo+zsk0XmFF2v803xbGsjpIp3SUm
 GXysu42QbqUfzhJ4SbPAqh0Vb61kIUiUhez0XCYjr9fTGgkkDvO94vTyqNK720vnN6GWSZNh
X-Authority-Analysis: v=2.4 cv=VskjA/2n c=1 sm=1 tr=0 ts=683761f7 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=kbMZ1xLNKdYXekTpmfsA:9 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: xbpKQU6oMx0rlWghTGBU6Px5h9m3MYFs

The for loop inside hugetlb_change_protection() increments by the huge
page size:

psize = huge_page_size(h);
for (; address < end; address += psize)

so we are operating on the head page of the huge pages between address
and end. We can safely convert the struct page usage to struct folio.

Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 mm/hugetlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index df1759e0b7fe..25d3768c6eca 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7185,11 +7185,11 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 			/* Nothing to do. */
 		} else if (unlikely(is_hugetlb_entry_migration(pte))) {
 			swp_entry_t entry = pte_to_swp_entry(pte);
-			struct page *page = pfn_swap_entry_to_page(entry);
+			struct folio *folio = pfn_swap_entry_folio(entry);
 			pte_t newpte = pte;
 
 			if (is_writable_migration_entry(entry)) {
-				if (PageAnon(page))
+				if (folio_test_anon(folio))
 					entry = make_readable_exclusive_migration_entry(
 								swp_offset(entry));
 				else
-- 
2.43.0


