Received: from smtp153-162.sina.com.cn (smtp153-162.sina.com.cn [61.135.153.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF8510F9
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750567621; cv=none; b=fSTFIvvfGP3BAmmfC06o0agLtWNRgYo4o/TYO2jjNjQUdfEE5y1453VhfPXwy6iQjLB3cqsHjcn/vYAC2Fwo0a8cjiOXM6bnJWelrS0Han0VzdA/Hw34BOvne64KdmQY8TZcFzHQQkk6NGpUXytI+g6in47mlNQTGiHKUFDdANM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750567621; c=relaxed/simple;
	bh=XTcJ5zzxRNVm3acSexYtBmCiC7vU0kAO1Z0fLH8KI2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZ58f41Ml4YmaTdmcqKTIxIvKYm8iWPgr+qFf9doKKdtPiNSxjCklfnSZfa0RmQq5+vGd7Gdz3199yfbdagJo7hMbOCIe/MCGEfu+ZRPEFp+e9vw17BgNElUIBtndjt3OiDb1Aq9SUlYh9xg0w21DP5m9SDfdmnqBFiHywlgAYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 68578AB20000346C; Sun, 22 Jun 2025 12:46:43 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 056826816234
X-SMAIL-UIID: FDA67900939140799F1B065A97DCCAC2-20250622-124644-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl (3)
Date: Sun, 22 Jun 2025 12:46:31 +0800
Message-ID: <20250622044632.1474-1-hdanton@sina.com>
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 19 Jun 2025 16:57:26 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    08215f5486ec Merge tag 'kbuild-fixes-v6.16' of git://git.k..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=13f7fd70580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=61539536677af51c
> dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17f7fd70580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1485690c580000

#syz test

--- x/drivers/misc/vmw_vmci/vmci_context.c
+++ y/drivers/misc/vmw_vmci/vmci_context.c
@@ -535,6 +535,7 @@ int vmci_ctx_dequeue_datagram(struct vmc
 			 (u32) *max_size);
 		return VMCI_ERROR_NO_MEM;
 	}
+	*max_size = dq_entry->dg_size;
 
 	list_del(list_item);
 	context->pending_datagrams--;
--- x/drivers/misc/vmw_vmci/vmci_host.c
+++ y/drivers/misc/vmw_vmci/vmci_host.c
@@ -435,7 +435,7 @@ static int vmci_host_do_receive_datagram
 
 	if (recv_info.result >= VMCI_SUCCESS) {
 		void __user *ubuf = (void __user *)(uintptr_t)recv_info.addr;
-		retval = copy_to_user(ubuf, dg, VMCI_DG_SIZE(dg));
+		retval = copy_to_user(ubuf, dg, size);
 		kfree(dg);
 		if (retval != 0)
 			return -EFAULT;
--
