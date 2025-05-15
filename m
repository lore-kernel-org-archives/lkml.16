Received: from outbound.pv.icloud.com (p-west1-cluster3-host2-snip4-10.eps.apple.com [57.103.66.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2234298243
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310601; cv=none; b=DFI7iyAGQKxOjq91xYdjCiN6Ma8Q1gcTvYI8Fxv9dHwrUrpJDg0ABZqMYaYMM+pvhL222x1ybe8I6ti1bo5HW3DE60iXJa8IjcGOm3TpuJPdGvV1ykVsV/1EZIILOWsK6DuwWN95emquidQV3qCYA9I9Qe2lQ2IBEJZI9TqCpGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310601; c=relaxed/simple;
	bh=VN+rP/TpBZWR01nT7uadYb9rVa1pA9l0tbGVPGexQR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hVMA6rR8+sMBaa6KOI7zMdAqUAf4X6xzKtEaOc8imS/+B30Z4BbPBrvoz+xdWNfqj88onvR55CedWKOmRYUiOI+zbAs3TZWYkazWhV4HkCwJcJPXlgJqot71Hbr6FzuLqw7FddibNv6ii+m7c97Joor2JUTPKqNwe2groT02QNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=T5l+0Zmu; arc=none smtp.client-ip=57.103.66.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="T5l+0Zmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=nJEzcKEW3l6yjjgD/Wy3FJqa/nKjlZT8aUvzCNCxMgU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=T5l+0ZmuRfRu6DYJ4U0/R69PnQ3vLZwmGPdGaaJbr4Tu0x718EVSQ17FH1BzALfEa
	 wO1Or6xGQ76pigoJwRBB1p6QttmZHLWkAxbuY2e6BYy6DF1wJpt5eU/qChD4YH20RI
	 lb/IMOZgusae6tO+xwqqCOGWL4TUBZkMG/aGFY0plpWdx4MnA2vF8xuar8ykUs9wyo
	 aUO1nYAHpkosbTlMSzGv0NZq8w39SnsMdRgw/z+ecfyVLymEpiT/fvkV8I2NUvam7e
	 8Q3EDA0hnuThqdOqqX9AqZ3l+X5u+PcvRfwfRZ69opTZkQHr3/H+FU5+mwLAiR+6RG
	 2T5TpIaTQUXQg==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id F221518030B3;
	Thu, 15 May 2025 12:03:14 +0000 (UTC)
Received: from w2lab-server.tailca30d7.ts.net (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id A43361806935;
	Thu, 15 May 2025 12:01:59 +0000 (UTC)
From: caius.zone@icloud.com
To: phillip@squashfs.org.uk
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caius Zone <zone@ai-sast.com>
Subject: [PATCH] squashfs: fix NULL pointer dereference in bio_alloc_clone failure path
Date: Thu, 15 May 2025 20:01:54 +0800
Message-ID: <20250515120154.1658556-1-caius.zone@icloud.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kIeTs-BEyzQSEt4iTGmfAYstEG6TmDoM
X-Proofpoint-GUID: kIeTs-BEyzQSEt4iTGmfAYstEG6TmDoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_05,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503310001 definitions=main-2505150118

From: Caius Zone <zone@ai-sast.com>

bio_alloc_clone() may return NULL under memory pressure. The current code
does not check its return value, which may lead to a NULL pointer dereference
in bio_chain() or other bio operations.

Add a NULL check and return -ENOMEM if allocation fails.

Signed-off-by: Caius Zone <zone@ai-sast.com>
---
 fs/squashfs/block.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 2dc730800f44..b00a71f8933c 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -115,6 +115,9 @@ static int squashfs_bio_read_cached(struct bio *fullbio,
 			struct bio *new = bio_alloc_clone(bdev, fullbio,
 							  GFP_NOIO, &fs_bio_set);
 
+			if (!new)
+				return -ENOMEM;
+
 			if (bio) {
 				bio_trim(bio, start_idx * PAGE_SECTORS,
 					 (end_idx - start_idx) * PAGE_SECTORS);
-- 
2.25.1

