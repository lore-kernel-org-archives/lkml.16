Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4152125DF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 05:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749186991; cv=none; b=C8maBfPba8hUc4CEkSiQjh7Z8vInxsrlVprZo4WR+WhcWXnnj3eLw7ZKNsSpjyg/Z+NFnf5kfXsEqffc0TecTSOyDpy4Om9M/HjnRI79gnw79rcaz7V9mTzVXfbOffOFZbQXW7L4YIr/mdMKHy0DVpt/+X9RyQ4oh2wju2GqRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749186991; c=relaxed/simple;
	bh=L0hJFyfyZX3FzKinw4N3p4Tp1T8WVYqepfCHeNfvQ9c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p4L0cDQUHAj2oLckHyTfErM+psiEdAKlb6n3dUmY0KxfgLollkK1GfCcNcEYzeeMG8w0PG9Kafk7IlAwGP9jkjIHLoo5Wk0nwQKxA6wH9U12oV6t5cpcBRLSe2ZbYuoxnfaRMMMl64cbF2KWXJX9DnbQ9wOvdysr6GEPe+66EFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5564Nsgi009744;
	Thu, 5 Jun 2025 22:16:20 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rvx6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 05 Jun 2025 22:16:20 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 22:16:19 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 22:16:17 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <viro@zeniv.linux.org.uk>
CC: <almaz.alexandrovich@paragon-software.com>, <linux-kernel@vger.kernel.org>,
        <lizhi.xu@windriver.com>, <ntfs3@lists.linux.dev>,
        <syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH V2] fs/ntfs3: Add sanity check for file name
Date: Fri, 6 Jun 2025 13:16:16 +0800
Message-ID: <20250606051616.2578208-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606042501.GR299672@ZenIV>
References: <20250606042501.GR299672@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4MYwveU8D1-_YS0SPrfol5ZFTO9v0zvx
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=684279a4 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8 a=mp8hP4E6WeWH5piVKYsA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA0NyBTYWx0ZWRfX7+agaZ4Uubs3 oO6Sbz1N7jaHK2lxXPURYWjHsU4iNFkrUjPp2Qa1/ZE0R2HpMSKX3akczmRs2Y2/GmL3gh8dlTC XNiH0FfW5OIghsDik7QJUGZm7v7dhDrx660VrBmA9ojPE8/kFEJowycHBxY23khq+BijLxQe0DZ
 IG8sSUwfLLbjWVxGRX/tF5/hF8Sq+f3OjS7Zq3TMERhZzqpmqvTca+g87iLvfffGgJqnE0dgZYx lHBNSfPydlE91fkbQZfSf43nQLJu1K/UOS78Ll+MPk95xfbyI69YGnRRR5Fm6hFnFDbiFfECJQF FhTgL1EBSTR+TJVTxR5CX9DN+cgxGRn/d5CsMAku4uYQW0+owxF8CdFRK6Xdm/zdNLUCfKsqLGg
 OuhXvfDp0rTTuRjhl8ig906rrMv1YznTEU7GVvsT05YCrYEMWWdP7B5iUR+WK+KW/PeocMNp
X-Proofpoint-ORIG-GUID: 4MYwveU8D1-_YS0SPrfol5ZFTO9v0zvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=785
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060047

The length of the file name should be smaller than the directory entry size.

Reported-by: syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=598057afa0f49e62bd23
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
V1 -> V2: move sizeof to left

 fs/ntfs3/dir.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index b6da80c69ca6..b31bc9cbfa35 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -304,6 +304,9 @@ static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
 	if (sbi->options->nohidden && (fname->dup.fa & FILE_ATTRIBUTE_HIDDEN))
 		return true;
 
+	if (fname->name_len + sizeof(struct NTFS_DE) > le16_to_cpu(e->size))
+		return true;
+
 	name_len = ntfs_utf16_to_nls(sbi, fname->name, fname->name_len, name,
 				     PATH_MAX);
 	if (name_len <= 0) {
-- 
2.43.0

