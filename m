Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550A20B801
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840106; cv=none; b=abu0vdgXR6QILcGc0Wogg/RNLppSg/0FaKedlCaxuptF6JwR/PAL11jm5oQcTbxSL/jMd+NOkV09g4zTOzIstGJp4uISxTyjy/7CusRkGqhLq/HNi+OPD6/NtB6Grl8dElORIQYEhOw+v41JcNcIE4PpHhBSjWv4zeGzn7D3DF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840106; c=relaxed/simple;
	bh=0mJDLkV40J2iXrp5WAHE30a4JDI+jvVCPsCvbKgtivs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdedxWqczR5IRx1x/6kQ2MGe8/eb+g6332Hgzr/rU/jfkhlXXHsSXDkiK4pRLGP+8yV+sKBSOA1Xco/A3pHmGjwyAujyMW+4a4x9CrvOywcs6nBxMnnC1/rw4VN17biLH7p1A29aLZG9O6r6V4TOdiv63Yus+QI510WzBCIy37Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.32) with ESMTP
	id 685BB2FD00001B07; Wed, 25 Jun 2025 16:27:42 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6631114457215
X-SMAIL-UIID: FB1A6DCDB81F4C2CB0AFAA7B29045213-20250625-162742-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
Date: Wed, 25 Jun 2025 16:27:30 +0800
Message-ID: <20250625082730.1756-1-hdanton@sina.com>
In-Reply-To: <6807019a.050a0220.380c13.0001.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Mon, 21 Apr 2025 19:40:26 -0700
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    9d7a0577c9db gcc-15: disable '-Wunterminated-string-initia..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=139b5ccc580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
> dashboard link: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15652c70580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17676c70580000

#syz test upstream master

--- x/net/rose/rose_route.c
+++ y/net/rose/rose_route.c
@@ -500,8 +500,10 @@ void rose_rt_device_down(struct net_devi
 			for (i = 0; i < t->count; i++) {
 				if (t->neighbour[i] != s)
 					continue;
+				t->neighbour[i] = NULL;
 
 				t->count--;
+				continue;
 
 				switch (i) {
 				case 0:
@@ -689,6 +691,8 @@ struct rose_neigh *rose_get_neigh(rose_a
 	for (node = rose_node_list; node != NULL; node = node->next) {
 		if (rosecmpm(addr, &node->address, node->mask) == 0) {
 			for (i = 0; i < node->count; i++) {
+				if (!node->neighbour[i])
+					continue;
 				if (node->neighbour[i]->restarted) {
 					res = node->neighbour[i];
 					goto out;
@@ -700,6 +704,8 @@ struct rose_neigh *rose_get_neigh(rose_a
 		for (node = rose_node_list; node != NULL; node = node->next) {
 			if (rosecmpm(addr, &node->address, node->mask) == 0) {
 				for (i = 0; i < node->count; i++) {
+					if (!node->neighbour[i])
+						continue;
 					if (!rose_ftimer_running(node->neighbour[i])) {
 						res = node->neighbour[i];
 						goto out;
--
