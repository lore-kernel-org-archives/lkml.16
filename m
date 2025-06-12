Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E365353365
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735380; cv=none; b=YbaYHTGvGgEfV5P0SMTxwX02jAAJJrd4CISuRftwxeEVHTP/95GkeymbLSqhZ7gGWWucNH8bQy8i4F58RKALsvkiPGq19aoEKnWPZkxqspHmqXAMxymcRz4m7nVMH8ElysG9wW777u6CjOW/+qWdZVuH8XMIV5OyhgWMfGrNbJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735380; c=relaxed/simple;
	bh=DRjIhuqQoWBRxM9frqFfRrZrQ+BErILZmdmwLEk4x9A=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Z5B0RCgydenVpELZ3FRMorxLfbdlH0hWVVclmVSyM8GUeHCZ37PU4zBTa7QeNbjCAWseTNGQfJfZwduIV+Bjcgas23fxw30vuTKD3tADpF2Qwqva9V7D5CiTEjWI3jYd9/Px/8bPNpFqzZs+7gibRv5PRWNTZ3IVS193FUGVqBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uLtBfARC; arc=none smtp.client-ip=203.205.221.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uLtBfARC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749735367; bh=NEQ6So3oB1C0gsmse1GZHu+m09ttTfpi6U0LaP4Eqzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uLtBfARCqtQG8bJW+/xk+aR3ATMRdXmY9SCkXCz7q4D6mk6PjZB2GOevAgmXJZ2a0
	 SFRH9QSe78PLnPLdAteifjpgNSerFoVWq5TxkCmoSdQdKvZugA0XzQJiDkhPgBBdQV
	 +R7G+ZPm1ilvr79axqRrwE791xXYX7oht7po0AWM=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 8AC21C24; Thu, 12 Jun 2025 21:34:44 +0800
X-QQ-mid: xmsmtpt1749735284tvidcnmjg
Message-ID: <tencent_5E3CDD374E968636024A8A75FD7697660209@qq.com>
X-QQ-XMAILINFO: Mg/0DM1Zd+nH1sGD8QNgTVaSDkZryiWiTsBVuEqZu3sIThrfLE3+rxdSowpX1R
	 BU+b6BWpt2k9nDDxe8hshneaRngEC9kQyvGSPUKIhGS0jsQPP3ICCucrGeP4zWDXkTXhDXKDrmjV
	 RfR42CyXv6nmve0M9dyYKVF+0NBfVlLLxcesfy5/3Q+0b1Q0586Ru0ZaZ++1bLAPtkn0zdi0hGAl
	 8Ed2sxksgvD2mRvJ67ZLv1M4pwTjmStJ6Mru+3Uyk30dD+8pJq+D+rH7IN91SLYtZIvtBLNDJvd7
	 Fyl3IIj3fTGUEQloeIwFjOxpkl5Gnb3Br0+mXwE5Vzf3+L3FXivmRbTdRqIC/FX57jYfx1hv9+8J
	 u7pTSP5LPqk6U4WzP8rgNSuMTdnkkTabJw48GkH7hgirK7bL/eHTbQ0UlEg7Q9LxpBfVcl4gA5PM
	 LeDuUvyYbCrekXOuSVVl7BlbFRf3wLQUpGKxZWq8QYxJcfxPclCzZOWeODLhELkXu/DBC8piSIBw
	 IDINxfWOW3p+tIJxOR2AWc7055lZnGrTwWNQ8x+l5aAH3GlZIhkfoYDTIHiHLPjVaV+yiCdkbu9n
	 Z8avsAkO4gw7jxXDFvvbKMdfJkiZedwiHofJOnjJr3PjkTOWZsGgP2YnkZeg8J+CpBaru8v15WOz
	 qabN81PyJooUOiOUSwlYMSFG1ltEdf6t4+CM0CIF8Y0h+k/VZUTRuLKT7FbSc6ACqzeIxANgYtv/
	 tj5eKHTy+dM0cnbcW0KTHxGulFtWmrxgcjyYMmbMf/ehW+hPZieTve+o9g6/rXL/4NbFzRxoePVv
	 ENNHOA4iJaAiZLefzNpNLGWGKRMyN4OEBljzBO6W07lOm4JYs4MplXuDg7A02mYlkeEY6aH1bWpk
	 AUURYin3SzKdoBt5OvY3WeA3YXNZqAIlw/faXnapa93IeaAK7YYifofr0N3WeA2ijymmROWZpXiS
	 QdFWBytmnS1ptovEF4zw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [overlayfs?] WARNING in ovl_listxattr
Date: Thu, 12 Jun 2025 21:34:44 +0800
X-OQ-MSGID: <20250612133443.2708383-2-eadavis@qq.com>
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
index 8ec5b0204bfd..49bbce356e27 100644
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
+	printk("inode: %p, buf: %s, size: %lu, res: %d, %s\n", inode, buffer, size, err, __func__);
 	if (err)
-		return err;
+		goto out;
 
 	err = security_inode_listsecurity(inode, buffer, remaining_size);
+	printk("2inode: %p, buf: %s, size: %lu, res: %d, %s\n", inode, buffer, size, err, __func__);
 	if (err < 0)
-		return err;
+		goto out;
 
 	if (buffer) {
 		if (remaining_size < err)
@@ -1498,7 +1501,13 @@ ssize_t simple_xattr_list(struct inode *inode, struct simple_xattrs *xattrs,
 	}
 	read_unlock(&xattrs->lock);
 
-	return err ? err : size - remaining_size;
+	printk("3inode: %p, buf: %s, size: %lu, res: %d, remaining_size: %ld, %s\n", inode, buffer, size, err, remaining_size, __func__);
+	if (IS_POSIXACL(inode) && !err && size - remaining_size < 24)
+		;//err = -ERANGE;
+	else
+		err = err ? err : size - remaining_size;
+out:
+	return err;
 }
 
 /**

