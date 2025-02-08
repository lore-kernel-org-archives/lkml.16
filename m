Received: from mail115-24.sinamail.sina.com.cn (mail115-24.sinamail.sina.com.cn [218.30.115.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F9243360
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 23:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739058336; cv=none; b=WiN/6i6NLStu6M520czbllOSmt9sQVfW2Y2ZzCFOZFxF1IMYGhEfQu+wQL3OsFFtWZOj7MEXjk8/YXE6qLqogdOamuuyjjICpwPf9kJO53qxEGs05lIe7NadeRgkXwpNtf0MWp1XJ9svGXcYlXniRWfxPD0uqtN0q5lxLhFk12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739058336; c=relaxed/simple;
	bh=lyrJHqCNlazaOXB4GDPy794osXsDBIPgapzh1VWxt3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9WRF7FHji8fg92yQMIBmGQQeSb3HZwx2DSyFBGH0QE58DTxo1szVI+iVw8LL9bl5wD8fWlRSQkGi7IwohLBUlqPF1vMiNipI9WfcOLEpIlPA1CvMUBwVdE5wIohtSHJ6jSt/7W8knJcF3qehxSQrsHf3N6v0zVdUGf4yQGZ3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.65.158])
	by sina.com (10.185.250.22) with ESMTP
	id 67A7EC9600000634; Sat, 9 Feb 2025 07:45:28 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5258107602533
X-SMAIL-UIID: 157DEE025CAA4E75A9BEE6CB8FFCAD5D-20250209-074528-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [hams?] possible deadlock in nr_remove_neigh (2)
Date: Sun,  9 Feb 2025 07:45:10 +0800
Message-ID: <20250208234531.2110-1-hdanton@sina.com>
In-Reply-To: <67a6e55f.050a0220.3d72c.001f.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 07 Feb 2025 21:02:23 -0800
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    7ee983c850b4 Merge tag 'drm-fixes-2025-02-08' of https://g..
> git tree:       upstream
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17148bdf980000

#syz test

--- x/net/netrom/nr_route.c
+++ y/net/netrom/nr_route.c
@@ -100,6 +100,7 @@ static int __must_check nr_add_node(ax25
 {
 	struct nr_node  *nr_node;
 	struct nr_neigh *nr_neigh;
+	struct nr_neigh *victim = NULL;
 	int i, found;
 	struct net_device *odev;
 
@@ -243,10 +244,9 @@ static int __must_check nr_add_node(ax25
 			/* It must be better than the worst */
 			if (quality > nr_node->routes[2].quality) {
 				nr_node->routes[2].neighbour->count--;
-				nr_neigh_put(nr_node->routes[2].neighbour);
 
 				if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
-					nr_remove_neigh(nr_node->routes[2].neighbour);
+					victim = nr_node->routes[2].neighbour;
 
 				nr_node->routes[2].quality   = quality;
 				nr_node->routes[2].obs_count = obs_count;
@@ -281,6 +281,8 @@ static int __must_check nr_add_node(ax25
 
 	nr_neigh_put(nr_neigh);
 	nr_node_unlock(nr_node);
+	if (victim)
+		nr_remove_neigh(victim);
 	nr_node_put(nr_node);
 	return 0;
 }
--
