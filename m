Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4F61DBB0C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 03:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179535; cv=none; b=HAOY99aJC3rGkKDowgpGQT2ZK3mG3Btjfmbry+2EUd95IGnjdZV+r7XXpYLLjKZQHbvOJqERRDnUNczthF/O1sCVLp96BShyHA8Aq8xNogwk/7OOjttXKEPasQ7OcZPfme7cKhXbFcH2CasTWrJJPE7DJ5BjMFF5DbFpIhVh6j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179535; c=relaxed/simple;
	bh=eDjca8dTSlEj/ZUBD4Rl61nUoq7NeCBsjettlVuu8DQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=di5v+pl4SvXETJ3fNA66ex7onblk9UVuiNf+eSzrS2ArfNvTt4KTZP4iPnmQIq2M+wrCSr1iueZyaYSLhqRvpV/xOGUH5xe21jTK22i1ijgvAuwOHWad7OGC+lcEZkopVVS00jdNif+qDkTpv1+fUc7/ZBjmbovEOuSEAfyazlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5562x2Xe029800;
	Thu, 5 Jun 2025 20:12:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rvws1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 05 Jun 2025 20:12:05 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 20:12:04 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 20:12:03 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in ntfs_utf16_to_nls
Date: Fri, 6 Jun 2025 11:12:02 +0800
Message-ID: <20250606031202.732946-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <68407923.a00a0220.d8eae.008f.GAE@google.com>
References: <68407923.a00a0220.d8eae.008f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAyOCBTYWx0ZWRfX0hyor995xGTU CuQNzpmNmtsAVJVstIkLbOnDBFr+qk8eSN69a46zAu1SJ5pQ3zXyIzyDuUzHxn00WiBA1ELXXJQ SsUgD638/AfVXQU63C9e+kD0hjTvH4uXxDntzeFQgN95kPpxcs+l9nLxssRdq760lnbAMlj0F59
 H/3XkxrwEsOpzlu9qsjeMnJfFK00KU5BRmByWp2T1tAT0Wv4LlJ2JT+2Oj9UWsSN1bF9LJ/7Wmz c0YiwsFVSZGYwOvIFFnW6lya2MB9OkOKHK+Wbv2lYqch8zvdM9NdArc90/sePZ5aYFiBnLPJLTj VhDrLcfs5RbuDYpIz+5ePuAShtio3NzxcCfR5AuJ138O6XdEX1O2eUv6qME2mBncpNvZ9K2u+TX
 5uBYq01LVUGznPKsO2VYo9mRMvyvA+TBAVgjGiEwNvqhoZauOygSWnmlENoWkwyH/0f2CjQZ
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68425c85 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=bTAXBUQa7kQJv4M29aMA:9
X-Proofpoint-GUID: bwOhoMKMpm-9oqxXzQozp5nEkCiQO_gW
X-Proofpoint-ORIG-GUID: bwOhoMKMpm-9oqxXzQozp5nEkCiQO_gW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=701 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060028

#syz test

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index b6da80c69ca6..b31bc9cbfa35 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -304,6 +304,9 @@ static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
 	if (sbi->options->nohidden && (fname->dup.fa & FILE_ATTRIBUTE_HIDDEN))
 		return true;
 
+	if (fname->name_len > le16_to_cpu(e->size) - sizeof(struct NTFS_DE))
+		return true;
+
 	name_len = ntfs_utf16_to_nls(sbi, fname->name, fname->name_len, name,
 				     PATH_MAX);
 	if (name_len <= 0) {
