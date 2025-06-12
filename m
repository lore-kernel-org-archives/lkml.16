Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3D02F4311
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749727998; cv=none; b=g7xJbcLfxX2oH6gPJnP6cU5JHLhDGC7EgiJ1BqNPQ7UFFNaa6gnDrlALJ2Pdc3g2g+z2lOpVRqG8RLQZd3snXXhWvyWeWeyRabc34AvXonKQ6If8mof8ZXyI6mARPp2rR1te0borlvBOdzSXGKtyveIDY+KuDHdDx8NtFMmRSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749727998; c=relaxed/simple;
	bh=cmheXHHY3CCvCgDZzWI8GvWK38j+1BpPSdl/b6MLP1Q=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=uNYB5xfRkyYKDtS4opytp6WwJyNvAhX+SCTrQPKCp21MMvasGgisE2YZkjgwuEUnTZ5McVfJG87b3ap9dmMe96c+0kuL5bbgDZCLCMZu7CCpsIk82hPNyfq01/OL1LIyulZ1jnwIae9dehfNWLO2TqgxpAcjBuLl6n1WIs3fyk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=s83qHdMd; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="s83qHdMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749727983; bh=/hglJ/7m7c0YYJytZef6CheHK8romBT0XoxTTUpoeTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=s83qHdMdk49VHO6O48REGJKQtdTqLOvj4ZDamggfERAAQUyfYTkUBrIPk+jG5j3xp
	 y0WTwJ1V25fzbEhQMiHJQTAl2ks/ir7E9Ra6KeMNXc8/9rqwBu4KmG03+zF1s04cTf
	 9rCQSx63njKfUAx6aDenUaN/a+oi58x7DWzgPKe4=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 83A28C82; Thu, 12 Jun 2025 19:32:58 +0800
X-QQ-mid: xmsmtpt1749727978tsr14ixam
Message-ID: <tencent_0FCF9E0D8025B30DEE122EDD8FDDA9996B07@qq.com>
X-QQ-XMAILINFO: M3mT1HC7mDCyGo3Ek8Qv0FKiP1u3wWnjLzFS5wr2DyRSsxf8JCCguktHCparTO
	 Qt7Hcwxf8qp8mUCAEYF0/abCybzlyuG4M61Lo1CNCZ6PH+KHLcvsj+99gnOnP+Y/47jg+x7Qmffq
	 5W4KYp6qfYHL7hz3d2blfYdDvMPbF7Vc4SHqyYs9f+R5V0qqjnRaAQhSGR5ekOHyMBU3dXuMhV7q
	 wVoUISI1SgK2ZhtgobMOjW66IHS5w/b+8KeDoAoT91kLfripRobC0hbGKPk/6uGJBJTTMI+ZwJEl
	 7qx6adKjLth0oPwcbsM7hpiczTs/WxNBT60qoujr2t/DjaM98LqzkoFM7v0C5sGA4YQS/Y+klhvV
	 yv8HLAAg5AAe7exo04OfAuZQ/UeDDcGHu7Qrmz2KVQKeKHDm5Dwq7b+pagP813U715p61gAEPN1t
	 EHzQmfIynDkCjfUnP0fUx4GHEVEwJ6h+ezJQe+CqCHGULFc6tEzJysx/EotnZcpAAtP3UdBAd0zX
	 usaBFsIUm7ZAMFjJRmMJPn/7v0yLm05m5uns9Q1eUprZ+OYqcGkrZU/xfOSaCkqbYGR2yqDCXz/l
	 ggHbPsRW8opYs5ZlyvdzKf9Cyyvq0RUN/HCif23M4NrLeHFfm6frPUEU5obf2F9EbPrk3DIiiAh8
	 SdVq4nGbTFjjacFOo9mefO8c88glxu3svVMrxhp2NXekWXNGazv8XiAoW9d4Cqtt9QYOZ7qozc6+
	 6XI/GvIcS1yAzxK3NYQRGOJssvJfVzdHGEBWRSbSsSbFW7ONk+lXptuO+aGNO33UG3anPr4ygDUi
	 vHXrHihFlkg90pCuIoLWJksvgp/ZAuP0KPqrrrkjoexDn01FwMNDMRiRsXMXrZ+1QdOXCONIdqmc
	 iq1vKxByLbtEdiy+mvTrdDzuWnjevqaBTjCcbMSC19wQsehOjOd6n12DrazpariDxs0PjwzdaM
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [overlayfs?] WARNING in ovl_listxattr
Date: Thu, 12 Jun 2025 19:32:58 +0800
X-OQ-MSGID: <20250612113257.2602722-2-eadavis@qq.com>
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
index 8ec5b0204bfd..1f55b98ae275 100644
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
@@ -1498,7 +1501,12 @@ ssize_t simple_xattr_list(struct inode *inode, struct simple_xattrs *xattrs,
 	}
 	read_unlock(&xattrs->lock);
 
-	return err ? err : size - remaining_size;
+	printk("3inode: %p, buf: %s, size: %lu, res: %d, remaining_size: %ld, %s\n", inode, buffer, size, err, remaining_size, __func__);
+	err = err ? err : size - remaining_size;
+	if (err > 0 && err < 24)
+		err = -ERANGE;
+out:
+	return err;
 }
 
 /**

