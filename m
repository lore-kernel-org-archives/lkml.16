Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB0C1DF980
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750974571; cv=none; b=EDm+3vbc00DavrT/ZfWx5eDwse9cPHp6ITHB/zMB9wFrAkedH5VH3Ttp3pQeBOy2xl92cY0YmqU+9w+HKPthN10hPRX1p8lgQoUvMJ7bSTokwB3sCNyXUkFVyZd4khM4DZilq3ZRUt1f8AT+1RIKxZez6woOaKtdIhNWDMnWR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750974571; c=relaxed/simple;
	bh=g6sZmerK8T7Hdv5ZClE3SI2+XK1VoeRXN8e6HZTEhFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsQKx1pix1JVAiNbNdfxCxdFg4hfZXiL5VXDl78afefLluKwVPGsTDegyWGyaB6/mp6Pwh/R+OTeXrhE1T28OI542+BSXBzQLl9Ek45cY3Tas86g1hEA9K1yCf3C1hShICGfWINTDKwam+F/KQNtEGneaBvHfavioeiZH1z7qPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 685DC05800001F9E; Thu, 27 Jun 2025 05:49:14 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3884156685177
X-SMAIL-UIID: 3BB5E0EC7E1043FBB1EBEE19B81E3801-20250627-054914-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
Date: Fri, 27 Jun 2025 05:49:01 +0800
Message-ID: <20250626214902.1880-1-hdanton@sina.com>
In-Reply-To: <685d4c2a.a00a0220.2e5631.028c.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Thu, 26 Jun 2025 06:33:30 -0700
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    09a0fa92e5b4 Merge tag 'selinux-pr-20250107' of git://git...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=122714b0580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7bdfbaac3fbb90d6
> dashboard link: https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17b8db0f980000

#syz test

--- x/net/netrom/nr_route.c
+++ y/net/netrom/nr_route.c
@@ -331,6 +331,7 @@ static int nr_del_node(ax25_address *cal
 		return -EINVAL;
 	}
 
+	spin_lock_bh(&nr_neigh_list_lock);
 	spin_lock_bh(&nr_node_list_lock);
 	nr_node_lock(nr_node);
 	for (i = 0; i < nr_node->count; i++) {
@@ -339,7 +340,7 @@ static int nr_del_node(ax25_address *cal
 			nr_neigh_put(nr_neigh);
 
 			if (nr_neigh->count == 0 && !nr_neigh->locked)
-				nr_remove_neigh(nr_neigh);
+				__nr_remove_neigh(nr_neigh);
 			nr_neigh_put(nr_neigh);
 
 			nr_node->count--;
@@ -361,6 +362,7 @@ static int nr_del_node(ax25_address *cal
 			}
 			nr_node_unlock(nr_node);
 			spin_unlock_bh(&nr_node_list_lock);
+			spin_unlock_bh(&nr_neigh_list_lock);
 
 			return 0;
 		}
@@ -368,6 +370,7 @@ static int nr_del_node(ax25_address *cal
 	nr_neigh_put(nr_neigh);
 	nr_node_unlock(nr_node);
 	spin_unlock_bh(&nr_node_list_lock);
+	spin_unlock_bh(&nr_neigh_list_lock);
 	nr_node_put(nr_node);
 
 	return -EINVAL;
--
