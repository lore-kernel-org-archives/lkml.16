Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD51B248867
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739355; cv=none; b=APme95KrBgRsGyrnskkZpel9QWkgm2SRei4TNPWIXY1ON4SkTG64F0RuZrOsZnbNl5LxBj0PoMnDNUWyz3TE2cqAb/VuZAwVoqtZruSZaLXwgtY/bev3dc3wmGBmIHUQrSnGPUKtAMk6rkrIQuJrE+eA2QFmwsnA10mSQ8y5MqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739355; c=relaxed/simple;
	bh=DyUPyYKSPutkrhnWKupXTc7jwGYipmVB2DqQ9I24XrI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=kkmHW2r6L5ZSn7Ax3wANfkqacfE0Xhu2+7NWimXxNvIEE37OwBwaqAaR+5zlMPfaR0pxkKyT5OcFfHgpjfmBtb1banFZUkqkuY5cL6ACX+UzSTqdnzAUe9kebMSzYEa7NfUITrheGoropjTfOx3qIoYxlI4j+4HPK1OzntGUBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=NI8f1bka; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="NI8f1bka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749739346; bh=NToeTN6IU0WmTBBtUA+yvRVHRrqzzw7NRPGo0vASSpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NI8f1bkaAj520LZJ2iKFwTwi1b0GeL/GeF7qMjRTHjOJjJoUfItFJ3iPvwHoDiivl
	 m2eKlvguJOtZwt25X3mNFsqMx3fUgk9YFoiMijqYPODdRoMdTY2uG3Cngbn1SGLdRP
	 2nbV4N6HLPvTnpo25JFygAMIGORl6sA4nyNhlvXQ=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 7452329B; Thu, 12 Jun 2025 22:29:05 +0800
X-QQ-mid: xmsmtpt1749738545t1wilvvox
Message-ID: <tencent_AF9E831B6F4B5F1B1A251EBA5ABBBA33E808@qq.com>
X-QQ-XMAILINFO: MmuCfgcSBfHxgqwkTzhmftflY5Sc2yUe5WbRIbDxg6FZ+OtSbwCrmhEUkDzoQB
	 t3Licjb9XzdpB+IDqxpSKrFbB6tdVZxckuVbxsNc/2UOEXtcy286TZkF3VQgXXcq+DeeHDqlom5s
	 KH0GknF9IBOrV1sZ45PTA6pwidVolCim9xI0rdKTzgN7F0GwjelPU+Gs7qeNhX9iioiRn/98D1Sb
	 7u1tNJ/vBF5syR8PypnyVIUAhQ7Gmmm6SJBpLH0wVSfL54RBpw1q8kbe8rUIyck0te5oFpC4mk1j
	 9si8z5IFb6RinFuxTb5nzGFRSfMbj/6mKdk/XZy0jh42cG1hvgM6bSi0ADXeDzGHbHPmVrHcJMsg
	 RL4vZ10kQJrGRprrpp02u2lgu8ISzqSQAbW8eifDDPHDuk5Mg2chSWgSJQ671+c/0JQ19GMGGKzW
	 R3S5XWHPLumKe18lRccj6FIbrxmDKoiFBHAubQ3PFpoNZzPKR5jl2Mh35iPPaV6ukWC/s+RNNNnf
	 fJamFPjWgMFj74DlkrYOGBIBA+qrfMGWPNd0Dz91EEUrg3bYQUDEqWABmMnRuyWS1VwaQag4Z0TQ
	 mDpqsS2vXpL4NclN16H6gxsf7ZW/ZsceKoGXmtUdwcd32nW95o7QBGHx7W2zJpjcH60PNjCifjZE
	 ZzaLIe5Utw71aBn0Kh5G27zlrgFqcl9Mb/WqEjiHo3dJebRER0N69oHfc8Z6O4Nl2KcQBsbjT78w
	 9fZyd1gn8fWhfl3R7C9GZ5Dp6K76ngakVu2HnhyFR33WLw9OEFR9q+7RUWBW6eIHTtFaKQb7ZfU7
	 RvxdGFPLgc2FJPd9YCQ5dQaj6xEAIQ0GxdBsQO2zdrZw+30w3PcI+0fJ3SHPY+ikJAXXeN3vXB27
	 yYqIoaUZz3clka0H6Q7c9ykuSZWU2KEA0WGKOM3OHwvru3Hq5tfvnnGEBx24zseojTVEyrNa7qEd
	 Bzt4VFeV0pIN+s/YNV2eTWoiux+tIIFEDWA72HvOgFa/ysgR1Kpyk+lbj+0j/EVGoKDGV31YT36F
	 WbzhcRcg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [overlayfs?] WARNING in ovl_listxattr
Date: Thu, 12 Jun 2025 22:29:05 +0800
X-OQ-MSGID: <20250612142905.2754914-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6828591c.a00a0220.398d88.0248.GAE@google.com>
References: <6828591c.a00a0220.398d88.0248.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/xattr.c b/fs/xattr.c
index 8ec5b0204bfd..3751c9306274 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -491,6 +491,7 @@ vfs_listxattr(struct dentry *dentry, char *list, size_t size)
 
 	if (inode->i_op->listxattr) {
 		error = inode->i_op->listxattr(dentry, list, size);
+		printk("buf: %s, size: %lu, res: %ld, sb: %s, %s\n", list, size, error, inode->i_sb->s_type->name, __func__);
 	} else {
 		error = security_inode_listsecurity(inode, list, size);
 		if (size && error > size)
@@ -1466,12 +1467,14 @@ ssize_t simple_xattr_list(struct inode *inode, struct simple_xattrs *xattrs,
 	int err = 0;
 
 	err = posix_acl_listxattr(inode, &buffer, &remaining_size);
+	printk("inode: %p, buf: %s, size: %lu, res: %d, remaining_size: %ld, %s\n", inode, buffer, size, err, remaining_size, __func__);
 	if (err)
-		return err;
+		goto out;
 
 	err = security_inode_listsecurity(inode, buffer, remaining_size);
+	printk("2inode: %p, buf: %s, size: %lu, res: %d, remaining_size: %ld, %s\n", inode, buffer, size, err, remaining_size, __func__);
 	if (err < 0)
-		return err;
+		goto out;
 
 	if (buffer) {
 		if (remaining_size < err)
@@ -1479,6 +1482,7 @@ ssize_t simple_xattr_list(struct inode *inode, struct simple_xattrs *xattrs,
 		buffer += err;
 	}
 	remaining_size -= err;
+	err = 0;
 
 	read_lock(&xattrs->lock);
 	for (rbp = rb_first(&xattrs->rb_root); rbp; rbp = rb_next(rbp)) {
@@ -1498,6 +1502,8 @@ ssize_t simple_xattr_list(struct inode *inode, struct simple_xattrs *xattrs,
 	}
 	read_unlock(&xattrs->lock);
 
+	printk("3inode: %p, buf: %s, size: %lu, res: %d, remaining_size: %ld, %s\n", inode, buffer, size, err, remaining_size, __func__);
+out:
 	return err ? err : size - remaining_size;
 }
 

