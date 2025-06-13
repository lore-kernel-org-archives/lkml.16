Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8982818DB1A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749783963; cv=none; b=SrkUXrJliXc5++HmlZb8LYKtapmI4bu5Iw3OvTYRZVUV8m/ZajOalMQNWV/UMRpToMPkjL+e7mPeBhI20sQ7UC9CMhoNFeQHftqMUk8oaLJj8ZvXvtrIE6m1/YlMkDfi6r47jORej5i1SXPuI/sbKo0JnH7GLE4ooaoGMcQ1HPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749783963; c=relaxed/simple;
	bh=m4AYh6RU9zuub135XZ1TR4xLpcavkb6EIx5/K0rd8p0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XUg8iwjdz8uS3epNmTMIjX3vUSxOMXp2P+0NWg83X2bKZAePzwGTs83VWNBAp7OvilsswOA33Km3kfuqWNqA906p+azEa3JjLXqIVUtIGh26WRdsq6dG3tw6n9oj3300v0IYcw+ruvioMNNrQT8wDlSPko3lPZW6TBHUbkhDEcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D29EYw003800;
	Thu, 12 Jun 2025 20:05:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm668r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Jun 2025 20:05:38 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 12 Jun 2025 20:05:36 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 20:05:35 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <syzbot+6e516bb515d93230bc7b@syzkaller.appspotmail.com>
CC: <jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
        <shaggy@kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] jfs: truncate good inode pages when hard link is 0
Date: Fri, 13 Jun 2025 11:05:34 +0800
Message-ID: <20250613030534.3839793-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <684abfc1.a00a0220.e7731.0015.GAE@google.com>
References: <684abfc1.a00a0220.e7731.0015.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rpBkP97mikXmUsFQz-CFm1qnQyEayrAh
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684b9582 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8 a=iYHks2O19Bam7npcOOMA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyMiBTYWx0ZWRfX1VlUeqgmaFu0 JR7ghSj0kpQUbvddwLmPIFzFMPScRopH/OsRXGZiAnJ1vOrY+BSyKyYBMJL5KTAgBHMYzOm78bv jT3HPuzPg8Isa9JNMr36CriVJUZdQRKSz0NOiu95ZXxVvQiRIhYzPBnWl2PfWq98d9IvrM4l2k4
 h7gWf6tLc1Fsq76KscpGPVqwrASEz9tRVSSrJvvKiE8OJcGx5+c3C5ej8pGgS2znOBlw1OgMwsi 4gZDHGnh5o5SAqcLkTSe6S8S5Akc/mNoEd4On37rxHcP6scTa7aDn5+m4WcisvX4rpcdKjGzNEn uzF8D9urSZx2jBbte1CrxVANon+1JDXMGUofiyXL4n/fOasNoWpMfyUqResTtEe6FBw31spIPcO
 aqKtt1xvymNRJkbJJWpebOJOK8zifHbEscN0IomUAnEo8rVxxgPhUBF6BAd6HNWPiYFsyB4O
X-Proofpoint-ORIG-GUID: rpBkP97mikXmUsFQz-CFm1qnQyEayrAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=921 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130022

The fileset value of the inode copy from the disk by the reproducer is
AGGR_RESERVED_I. When executing evict, its hard link number is 0, so its
inode pages are not truncated. This causes the bugon to be triggered when
executing clear_inode() because nrpages is greater than 0.

Reported-by: syzbot+6e516bb515d93230bc7b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6e516bb515d93230bc7b
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
 fs/jfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/inode.c b/fs/jfs/inode.c
index 60fc92dee24d..81e6b18e81e1 100644
--- a/fs/jfs/inode.c
+++ b/fs/jfs/inode.c
@@ -145,9 +145,9 @@ void jfs_evict_inode(struct inode *inode)
 	if (!inode->i_nlink && !is_bad_inode(inode)) {
 		dquot_initialize(inode);
 
+		truncate_inode_pages_final(&inode->i_data);
 		if (JFS_IP(inode)->fileset == FILESYSTEM_I) {
 			struct inode *ipimap = JFS_SBI(inode->i_sb)->ipimap;
-			truncate_inode_pages_final(&inode->i_data);
 
 			if (test_cflag(COMMIT_Freewmap, inode))
 				jfs_free_zero_link(inode);
-- 
2.43.0

