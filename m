Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13AC46B5
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747627878; cv=none; b=X6RmQ9aK+Kd6XUM9qnNzevuNEeREl+PCwBuXGE2a9399xTSWkgEm9l8wtfPssc/APeTKeWXFUdmtg7ufJiqlVXqVypagnsUiBj8bUDFX9xx6fUmHOvbsBOdxsNXq4+J5SWYSrohOMjubh2aNTXb2yObJy4TDShss+CndRk0YvAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747627878; c=relaxed/simple;
	bh=btfsI3jCaykKHktOm5Fr8A2O2YdUoV8ztWTJl3kHbKA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qPP/VHcDrmhw0wmoTzZ1nXivSCYtikegKmuPK8Ut3jl4ENJ34Zo/hvRksU3W1hqHF7oR2VyYCknPMCo8Zr8ynN0zNX8r+WwXbc6B1z1kl+B4mtxZrh/4wolQWaGEWNepyH37yvtNMkrNRDkJ+XKSQ2y46Bxs0TmWSUiUcCtIvLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201608.home.langchao.com
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id 202505191211033550;
        Mon, 19 May 2025 12:11:03 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 May 2025 12:11:03 +0800
Received: from locahost.localdomain.com (10.94.15.43) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 May 2025 12:11:02 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <miklos@szeredi.hu>, <amir73il@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] ovl: Fix PTR_ERR zero argument warning
Date: Mon, 19 May 2025 12:11:00 +0800
Message-ID: <20250519041100.7611-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 202551912110382145d54b8f090bedf80c07f8c2b81ad
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

In the ovl_check_origin()  and ovl_index_upper()function, the
PTR_ERR function was potentially passed a null pointer.
To fix this issue, separated the null pointer check and the error
pointer check, ensuring that PTR_ERR is only called with a valid
error pointer.

Fix below smatch warning.
smatch warnings:
fs/overlayfs/namei.c:479 ovl_check_origin() warn: passing zero to 'PTR_ERR'
fs/overlayfs/namei.c:581 ovl_index_upper() warn: passing zero to 'ERR_CAST'

Fixes: ad1d615cec1c ("ovl: use directory index entries for consistency verification")
Fixes: e8f9e5b780b0 ("ovl: verify directory index entries on mount")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 fs/overlayfs/namei.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index 0b8b28392eb7..bc917b56e2b1 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -475,7 +475,9 @@ static int ovl_check_origin(struct ovl_fs *ofs, struct dentry *upperdentry,
 	struct ovl_fh *fh = ovl_get_fh(ofs, upperdentry, OVL_XATTR_ORIGIN);
 	int err;
 
-	if (IS_ERR_OR_NULL(fh))
+	if (!fh)
+		return -ENODATA;
+	else if (IS_ERR(fh))
 		return PTR_ERR(fh);
 
 	err = ovl_check_origin_fh(ofs, fh, false, upperdentry, stackp);
@@ -577,7 +579,9 @@ struct dentry *ovl_index_upper(struct ovl_fs *ofs, struct dentry *index,
 		return dget(index);
 
 	fh = ovl_get_fh(ofs, index, OVL_XATTR_UPPER);
-	if (IS_ERR_OR_NULL(fh))
+	if (!fh)
+		return ERR_PTR(-ENODATA);
+	else if (IS_ERR(fh))
 		return ERR_CAST(fh);
 
 	upper = ovl_decode_real_fh(ofs, fh, ovl_upper_mnt(ofs), connected);
-- 
2.43.0

