Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0EA33086
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 03:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749181910; cv=none; b=I/2ogtsWDd/JurGc5A9sYMkl2e54oVDj95sfcoeI+IKeG9NyfqHsfcUmpAnUCcNmeQKBKcqN+6ZJU/tCRbbr9Uj/9r30r5kz555vwrfguVAU/0yC10Db8WrcBpAGh3bFizHmeCgVMCBiEtJWxljqvfKwqdQPy3HKgmmAuPpVhoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749181910; c=relaxed/simple;
	bh=wqUQH/6fTeckUJtz6yrRhOa+hPuJ4xP7uZcApJ5GAlc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QY6U3YfHr365ingW3Q6r4VZMsCmOOgGE9/OuMtyzSoi7gJuNLwm4lSnRD48XvqXQdWSBWGJv9+yArAzKXwU29ZfseMYHiInLYB87STeH3mD0Yr15FFXw7rezOydWUz2keZOW8ZZ5M+p9w1UP8dktqTZyPwGk6Ji57hIKqMv8DuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55619RCS030567;
	Thu, 5 Jun 2025 20:51:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rvxph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 05 Jun 2025 20:51:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 20:51:27 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 20:51:25 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com>
CC: <almaz.alexandrovich@paragon-software.com>, <linux-kernel@vger.kernel.org>,
        <ntfs3@lists.linux.dev>, <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] fs/ntfs3: Add sanity check for file name
Date: Fri, 6 Jun 2025 11:51:24 +0800
Message-ID: <20250606035125.1693536-1-lizhi.xu@windriver.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAzMyBTYWx0ZWRfX3VdOST4Fd02I X76J3/EcImRTL91R20ubRFUwcO078tZnOQQV6sMSeBLZAfMgExhgoSxVimvEhnrtZhyWmh5XrrH 6GtTHNCk1X3exI6oTcFAkbsuRJeUE9LI703COJRU4GA9ehdd58g+3HF4PCfyty6RCTZOu6NGHFp
 WHORXJIWWQKnvClMfv1u7xeAuH+SPxCdyjxpmS2EZ0tWsDt1KOKlOAhQJGnf+h3Ws9Fal9eEE4F 2tAEfIytlicoHF1bzha/gbWASsCRljc0+ftg44PolQHpHgsWSznC19xUYuOrYJHQ4aQfBW6coW1 PO4aWTZKHIVXAIG3Hctj6+bCQmvhvTAs1uj63D8suCmtAgbz9gzeIxIGK4H8aiD0WPMyGuD0sPP
 axKY5OkVNFstLApanQpNMYOuxB3mCl/kYx33d1e0/6p/73O5oyfr163qLauD6vDA7YZdJ4LQ
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=684265c4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8 a=mp8hP4E6WeWH5piVKYsA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: M_s4cCc8yAdV0IDWwTtMUkJMqoFbOjjY
X-Proofpoint-ORIG-GUID: M_s4cCc8yAdV0IDWwTtMUkJMqoFbOjjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=818 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060033

The length of the file name should be smaller than the directory entry size.

Reported-by: syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=598057afa0f49e62bd23
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
 fs/ntfs3/dir.c | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
2.43.0

