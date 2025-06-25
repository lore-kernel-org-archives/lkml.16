Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn [202.108.3.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44174202983
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835555; cv=none; b=sgJVeba+wbs5N37Fmgx9oOanc5jNH+ay9kQ+whATqe8JT3bDiXN3PJubYd648++CI4r0qrw/zgR4RFp7YhsexRM9KIbi+Cr9Mm851sjrjQVA+uooEy/eO6rgeZuRtA8axnPLMSuzIr6mTsD73bAtkgP+S9c4lxWhDog5FciKoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835555; c=relaxed/simple;
	bh=fTPiYemagY3NggQIiIR4Eb01GqOqqo4ebshoReG0SAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGGnlQ0FZoVgOFw3NOn5YOiNjpPVuQBhODZDoE+WrI6DrNed2/ymKKIO6Uz4KTnyRDi5q2QCdFbvi0fHDtbBA1YeQL0+VpsfUY7Yp+JApzVgvsVbSkR/4ct+FU66rCJIm5pV6GMgGcPLunbssyh1aWeRIPBJDQBh/WuhIH8Sk2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 685BA15200003C74; Wed, 25 Jun 2025 15:12:20 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5304716685279
X-SMAIL-UIID: 3F1343E4D1BB43DD9BE61D2A4B5782C5-20250625-151220-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
Date: Wed, 25 Jun 2025 15:12:07 +0800
Message-ID: <20250625071208.1726-1-hdanton@sina.com>
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
@@ -500,6 +500,7 @@ void rose_rt_device_down(struct net_devi
 			for (i = 0; i < t->count; i++) {
 				if (t->neighbour[i] != s)
 					continue;
+				t->neighbour[i] = NULL;
 
 				t->count--;
 
@@ -689,6 +690,8 @@ struct rose_neigh *rose_get_neigh(rose_a
 	for (node = rose_node_list; node != NULL; node = node->next) {
 		if (rosecmpm(addr, &node->address, node->mask) == 0) {
 			for (i = 0; i < node->count; i++) {
+				if (!node->neighbour[i])
+					continue;
 				if (node->neighbour[i]->restarted) {
 					res = node->neighbour[i];
 					goto out;
@@ -700,6 +703,8 @@ struct rose_neigh *rose_get_neigh(rose_a
 		for (node = rose_node_list; node != NULL; node = node->next) {
 			if (rosecmpm(addr, &node->address, node->mask) == 0) {
 				for (i = 0; i < node->count; i++) {
+					if (!node->neighbour[i])
+						continue;
 					if (!rose_ftimer_running(node->neighbour[i])) {
 						res = node->neighbour[i];
 						goto out;
--
