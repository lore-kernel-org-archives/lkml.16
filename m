Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24E2907
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 06:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750573790; cv=none; b=r87SvWX2RCMx3oATwg52FtFxpfFmexzmGS8uiDNUYnRsZlRBlOlfOt2Bc1YgDQCCP0euBlfBWhUMYqRH3oFE5TJp911UrREZHaRHzf8FNkLkuGp1WV8oKDpUyXz94FY7JhZ4aSr/sq8knyXadL4fDQv9aDWyrmkml8KtDjIWZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750573790; c=relaxed/simple;
	bh=yAoHSY4uJgZDBTXET9EKIkNOqZm6MeUNV6m6oTqTcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnfNyxyxfFqvJNySFHUFu3seEAEBSlyr9lxS09sCpxgRH9PUbSSoCpxvrwuM9IXIgpdKxY3y+usm7fVmlW0KgXtEkcUwTL+9PaJUR0c1NxfUq9XRKDshWj9Ilj06QJC2uSYn4Ab82XIxuXaPhg5ax9QdjHSlt+7uOhL6zOP558A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 6857A2A50000704C; Sun, 22 Jun 2025 14:28:55 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6198146685162
X-SMAIL-UIID: F07514CD3F8F4248B21AAA862BDBF099-20250622-142855-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl (3)
Date: Sun, 22 Jun 2025 14:28:43 +0800
Message-ID: <20250622062844.1505-1-hdanton@sina.com>
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
@@ -245,7 +245,7 @@ static int ctx_fire_notification(u32 con
 	array_size = vmci_handle_arr_get_size(subscriber_array);
 	for (i = 0; i < array_size; i++) {
 		int result;
-		struct vmci_event_ctx ev;
+		struct vmci_event_ctx ev = {0};
 
 		ev.msg.hdr.dst = vmci_handle_arr_get_entry(subscriber_array, i);
 		ev.msg.hdr.src = vmci_make_handle(VMCI_HYPERVISOR_CONTEXT_ID,
--
