Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E5AB66E
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746255751; cv=none; b=dZAKMtWSD60Q04SSY2SL6T03WogqBNw/MqgvPgn2pnsle4zDTfvlq3MGJxXFFjNWvsIy7Fju6XATO6/P1dfP08jagdcv/54ECGGgusalAOupP5ic8MvG9wjq1JV0ihYqod4MebOLHgn+3I2Eu5jUwsKWNTNXsdjhX44rN5nF8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746255751; c=relaxed/simple;
	bh=tb/VF1bbbPRtu9l39YPX+TREm2uSAn3ACltiS+FMQHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iv6Ac27vwIxt1gg4yb69hmsxdN5i/sHiur4MneEHmYM5bGMuMe+OVw90X9Z3Je1ujWZekgUmGKo+UHSw1e/ESdogx1OAlAs3j9t2KoQCc8fi5Zb17FcTWn9m87DS1v5+aaHv2jqeJoGY+XxN3T4PhYXKKlj69spfRtIzd6REgTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FYG/vFZ8; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FYG/vFZ8"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433TYKe031628;
	Sat, 3 May 2025 07:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Arx85jD1S6k6qGYwDOaXxlqUKO/cNp9y4mp+3Q/kE
	4s=; b=FYG/vFZ8h7s+2q6RfqM5PDM2Y4YwtxrCPq1C4vrTghOwzDje1mRbiwpPd
	bG1VXkjp5z0XbbTxXReRgJr2WBSSPxi9REtBAvw4BJZ0MhXDbFl0IgWvC57wU6Uc
	R5/wo6SL1jLdGSFJ4hHqsIJSq4uSB6Py1okj1W+z00PpdeVr2N0sNnRLi+M7UT5i
	asL+qDc+m/cluq+MH0hKKrk3B9XIfYrAF6Gic6MySk+vFWz5Y/cgAa53TOwl1CN6
	yuLz2MYpDHtUMyvfY5+Nn79zvStYDlcMK3XL7Q0CjXUFqmD2RyGBs5krt5l1B1OZ
	0Wo1bQE/t6woHvCcMBsbpDu3pqXmw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46d8jr0u2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 07:02:14 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54372EDn003622;
	Sat, 3 May 2025 07:02:14 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46d8jr0u28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 07:02:14 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5434v90E031628;
	Sat, 3 May 2025 07:02:13 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tuncuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 07:02:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5437296e35717840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 07:02:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6710D20043;
	Sat,  3 May 2025 07:02:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FFAB20040;
	Sat,  3 May 2025 07:02:07 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.124.222.98])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  3 May 2025 07:02:06 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org (open list),
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH for-next 1/2] book3s64/radix : Handle error conditions properly in radix_vmemmap_populate
Date: Sat,  3 May 2025 12:31:58 +0530
Message-ID: <e876a700a4caa5610e994b946b84f71d0fe6f919.1746255312.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=TduWtQQh c=1 sm=1 tr=0 ts=6815bf76 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=etVnDyMCg2d6GL2rgLMA:9
X-Proofpoint-GUID: SREoZDCtzzJqD2moqEeD7S9v6LH2RkdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA1NSBTYWx0ZWRfX7f72KTKH8onR WjBtDn5EEMdzOUxtEujwh0IGav1a+Ls0Fl49j+5GvNGogERQLK+R+BtofXWI3jmpouDSeDd56Y1 gAGANeboNMLCmMu1oBYFUXqclnzkgWzilh9FMNDXP6qxW79jut5vaB0w88orpUWIHeuqOllABlX
 Hq2vsK692idXluNopd0Xnx1w0LqnTeq1D8TNUOw4P3b9p0enX86tV5/K29YrBZFGjDa7IaTTlHg itnR/7jhAnpVinssd/L5n5rlpgW7zOdo0rn1sjwOQqIrhPNQIJ+uiIvmGjZocJP37kSpSQDbgob za1jQ4Vv/oxk1vqHmFAyMV5W7tymgUrsG1EjQ+VfpfLEDKK3ctECpZVcW0mZdZFz8O9rXpooJW6
 Roc2EVuiMDPR1HQTUNEAo0MNGfN2H3fhSPHjJIMP7cqLH75sgK1rh5Hm7hLrVh42otgVTlax
X-Proofpoint-ORIG-GUID: 1Zfs-mbhHxFAxEmKCCF2tbqifHFQxiRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 malwarescore=0 mlxlogscore=804 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030055

Error conditions are not handled properly if altmap is not present
and PMD_SIZE vmemmap_alloc_block_buf fails.

In this patch, if vmemmap_alloc_block_buf fails in the non-altmap
case, we will fall back to the base mapping.

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9f764bc42b8c..3d67aee8c8ca 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1173,7 +1173,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 				vmemmap_set_pmd(pmd, p, node, addr, next);
 				pr_debug("PMD_SIZE vmemmap mapping\n");
 				continue;
-			} else if (altmap) {
+			} else {
 				/*
 				 * A vmemmap block allocation can fail due to
 				 * alignment requirements and we trying to align
-- 
2.48.1

