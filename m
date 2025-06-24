Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8438D2C158B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773754; cv=none; b=gaZmDJhJY6tZpLp2T7aAPc5Gw1OKVFUwL/f/Sn4u9LGqBog75G7r12hbJTii+uZx4wpGw+uL4V+whJBjFa1+832R5LIbol5PFwklVVCXj/Z5tZ0oFGJQX7NFF857b7V2kXMRuB3COBNcrjWjr+Jlcxj9ezkEdVL1689O1GpCVRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773754; c=relaxed/simple;
	bh=F81MkQGwFJzCnvHxH0OXEMF+pgVliNXtH0SLmFjk75c=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=K/B+ge2ETsCBxwqnKey2QxC08zzODuh+ANKaofPi+Xyq2ByDlUMkfRkXikv7nuJOtEkMKcni8nH6buK0qLbHe3kbXVVPfjXKiJsaG8BP36TYAHaYyrI8K/MxdxFaVFn04xnTaAko2UQTp5NsqIOCBoVzgPC8x+jtaQavgFksFhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Y8h1iAiG; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Y8h1iAiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750773741; bh=t60h/E1hMd521+buKWx/qNzgsjnZi8H0bTEIedjzT0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y8h1iAiGLH6BrDLiAhcw/omLO+z6CzN+WZU0m6SDYAOoJKNje07sv+lkvBHglm8/b
	 gijFpofGG3MQKX5N4T7ueGCZzgUmo3lu0jfMYbGATfoZ57QBNe78j9CNqTAZHKBQ8d
	 mjJ2mSyU0ygxk/rfn0qwuVSwSGvt5ZR1GTrQnLTc=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id E0BB2C8C; Tue, 24 Jun 2025 21:56:11 +0800
X-QQ-mid: xmsmtpt1750773371tnfh3idsj
Message-ID: <tencent_86C09604E922EC06CE1479EA6C582EC56C0A@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur93WNAedUAiGvMbVKd9ddk0WL+cXr91gLps5VvHIHXyL8b9iu4PM
	 Jvp7hUj/62Rleh9ZbvhkdYMTDjZnaJ0p33neXFXYTMnoPTXdx6UfXV7Hg6qEWvvMNOe4AmKLOp0q
	 XwwTfHDnKl9p2w7V2LkXl0XPia7LDE/0nFOrPPQUIulCFghNM4ZCAm9R6XgmslCjg864NeV7ybgO
	 8HWR4ld0DTy+V36yvdqcyEPDLoR5XtQaYI9f6phza6o+OG/i4/pNSKbbwDknWqoAAOKHRnwgm/lK
	 TXWB5lacjjEsTtuTDu3j+1DMNhv+pWLLDhG4+6pex0gi9sndJnjliO/iyW1Ix9YtWWKh44t9i770
	 V7Xw8j9NX0pBIdhPAPz0F8RNMLhN9oJeHcUbyGO/apphViixji2jLonlgDctVdvt8QYPZZKsMgWU
	 lFGBp/BaLzpaljDFmINXFkzapqW4YZj5MfnJZQP5C3GvyQtbFzt46D4CWzfrGwk1W9dgNv8+kvUi
	 oSO7eR78tRjpbiTFdjKBxCzYTuDxO2pBRuVaZRWH5nHeKGXD+4uDD3nWqFw0rD1xgHZstxTRWLxZ
	 Q8MlhU093+WSuP8FQbxtxnVw5uKblAcgdSh53OmGBprply6nqdCmgnH73Ch5ObpkXSBaSH4ihsy7
	 ourTExfnHszXNdknQuBb/yydiF2Fe1MFO6OHGK+5YuoGGuOBiGWXM+lAegE0l8zQnUftE4DxPtzf
	 R4F0ypglCRfFuA2HFEZ5FZCIwwHn7iZZVgGpPK/PFFHUS/h4+LFeGT38lxP900SQw/02CjR9I5E5
	 tsjil+xCUke4v8hW4/lTqRJeD/SiNv/0bPxRCoUtBEeUTs/50yjc2CKn1HpBm6f4+lByyiRxJQYp
	 NHGhhd0WWntPLx55Waht26RoFKjP4blY1XBuYEffaP0SEfCpGDUCPAVXVNdoDs/p5ebHsLXHLx
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+fa90fcaa28f5cd4b1fc1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [btrfs?] possible deadlock in btrfs_read_chunk_tree
Date: Tue, 24 Jun 2025 21:56:11 +0800
X-OQ-MSGID: <20250624135610.295300-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <685aa401.050a0220.2303ee.0009.GAE@google.com>
References: <685aa401.050a0220.2303ee.0009.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 237e60b53192..c2ce1eb53ad7 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1864,11 +1864,10 @@ static int btrfs_get_tree_super(struct fs_context *fc)
 	fs_devices = device->fs_devices;
 	fs_info->fs_devices = fs_devices;
 
+	mutex_unlock(&uuid_mutex);
 	sb = sget_fc(fc, btrfs_fc_test_super, set_anon_super_fc);
-	if (IS_ERR(sb)) {
-		mutex_unlock(&uuid_mutex);
+	if (IS_ERR(sb))
 		return PTR_ERR(sb);
-	}
 
 	set_device_specific_options(fs_info);
 
@@ -1887,6 +1886,7 @@ static int btrfs_get_tree_super(struct fs_context *fc)
 		 * But the fs_info->fs_devices is not opened, we should not let
 		 * btrfs_free_fs_context() to close them.
 		 */
+		mutex_lock(&uuid_mutex);
 		fs_info->fs_devices = NULL;
 		mutex_unlock(&uuid_mutex);
 
@@ -1906,6 +1906,7 @@ static int btrfs_get_tree_super(struct fs_context *fc)
 		 */
 		ASSERT(fc->s_fs_info == NULL);
 
+		mutex_lock(&uuid_mutex);
 		ret = btrfs_open_devices(fs_devices, mode, sb);
 		mutex_unlock(&uuid_mutex);
 		if (ret < 0) {

