Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D068F66
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739088455; cv=none; b=UrQithzcm4a5SA/pw+gmJzo2CsuO/6w6rcUw/irGO12F+8wd/1+xMvE2sMd75PKNmpbYiEHXFarNSxTltvZvESnaBbN9FbQ5GPWPDZTLVMJlLMgZrZW6pgUfulkLD+pUgfZcYWHRST5mxOrHna4Tjn0FX1xzJc7WThQl28kVwXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739088455; c=relaxed/simple;
	bh=Krp0hRcnkmO9FVzzmnUG7JaNepHi3MNQIk7r1KS5hT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1JZd++Ciq3hh7SxK6mSxDMB1PeD0cm8AO9SFKjhrcrx9YJCNMJCV2yDwbWaEufhPIKFrt31oAvJv84RodGQdbBUhP4K+yzA5s+x232gDbNbF/3EGiIrZSFHyOSvDpO2fFDKkVXDOGQw5Nf4p35NfXxpnE1PpO8VgNlaABXFKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rDTwijON; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rDTwijON"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739088442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hwQtXwdz+nRfwMkoG537Y+tMlAkJ6gBqNuVsZ/4bXk8=;
	b=rDTwijONDAkBnML239wgHYwVogiI46yI+jm8wzaVaDhiHPq2CoZj6R0TK88mAGetKmmoaX
	6KGAWawILCekqHs1c4FKLqkyMHn//fEIlk1R1WTrLo/7bhTCfeN0jFKtCC0ZMX5J4MCesp
	nN//kR49C/6EmCJX/oPPKbmcLWo3zw8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ovl: Use str_on_off() helper in ovl_show_options()
Date: Sun,  9 Feb 2025 09:06:17 +0100
Message-ID: <20250209080616.1480-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_on_off() helper function.

Acked-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/overlayfs/params.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
index 1115c22deca0..8a8bb336b40f 100644
--- a/fs/overlayfs/params.c
+++ b/fs/overlayfs/params.c
@@ -1053,17 +1053,16 @@ int ovl_show_options(struct seq_file *m, struct dentry *dentry)
 		seq_printf(m, ",redirect_dir=%s",
 			   ovl_redirect_mode(&ofs->config));
 	if (ofs->config.index != ovl_index_def)
-		seq_printf(m, ",index=%s", ofs->config.index ? "on" : "off");
+		seq_printf(m, ",index=%s", str_on_off(ofs->config.index));
 	if (ofs->config.uuid != ovl_uuid_def())
 		seq_printf(m, ",uuid=%s", ovl_uuid_mode(&ofs->config));
 	if (ofs->config.nfs_export != ovl_nfs_export_def)
-		seq_printf(m, ",nfs_export=%s", ofs->config.nfs_export ?
-						"on" : "off");
+		seq_printf(m, ",nfs_export=%s",
+			   str_on_off(ofs->config.nfs_export));
 	if (ofs->config.xino != ovl_xino_def() && !ovl_same_fs(ofs))
 		seq_printf(m, ",xino=%s", ovl_xino_mode(&ofs->config));
 	if (ofs->config.metacopy != ovl_metacopy_def)
-		seq_printf(m, ",metacopy=%s",
-			   ofs->config.metacopy ? "on" : "off");
+		seq_printf(m, ",metacopy=%s", str_on_off(ofs->config.metacopy));
 	if (ofs->config.ovl_volatile)
 		seq_puts(m, ",volatile");
 	if (ofs->config.userxattr)
-- 
2.48.1

