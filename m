Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E04622126D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212420; cv=none; b=f8rwuGTwO9SpyqlEskIhXfSIM/Qy1MUeHfeyAhuEjiqMzPBLb7+XQfSGSLXnI8Ng9h6+rKls05FXCTtC5PWwm3ZMxceDO3m8skb1VYpN48zqO1uRaaMVEN+IbipQsbE86oirh49ICQ41QwUbOcARq00hIK/NftlwXI+xyLXgSKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212420; c=relaxed/simple;
	bh=19KHBXbt415RvGNG/FOhXnqFDA6grEK5lHpBhMq26Lo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FSTbEKz4K5KQoVmLkIgcIRGMQOADFntahHepLXRYCFDyqrMevn6N2vCAsGNYiqozaiudNCB4Fsu2tZbtjr++edHODHTHc5wBb8nCWzY255jc/S6ldm/VvMXmMrjFZVTPXIUxjO/ve1okoNkCsP7UisUbKBsRNhO/6JY3B98xOnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 54E8k4us019735;
	Wed, 14 May 2025 16:46:04 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Zy6MF5Sdpz2NqT3D;
	Wed, 14 May 2025 16:43:53 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Wed, 14 May 2025 16:46:02 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
        <niuzhiguo84@gmail.com>, <zhiguo.niu@unisoc.com>, <ke.wang@unisoc.com>,
        <Hao_hao.Wang@unisoc.com>
Subject: [PATCH 2/2] f2fs: fix to correct check conditions in f2fs_cross_rename
Date: Wed, 14 May 2025 16:45:49 +0800
Message-ID: <1747212349-18425-2-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
References: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL:SHSQR01.spreadtrum.com 54E8k4us019735

Should be "old_dir" here.

Fixes: 5c57132eaf52 ("f2fs: support project quota")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index bb22543..07e333e 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1117,7 +1117,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if ((is_inode_flag_set(new_dir, FI_PROJ_INHERIT) &&
 			!projid_eq(F2FS_I(new_dir)->i_projid,
 			F2FS_I(old_inode)->i_projid)) ||
-	    (is_inode_flag_set(new_dir, FI_PROJ_INHERIT) &&
+	    (is_inode_flag_set(old_dir, FI_PROJ_INHERIT) &&
 			!projid_eq(F2FS_I(old_dir)->i_projid,
 			F2FS_I(new_inode)->i_projid)))
 		return -EXDEV;
-- 
1.9.1

