Received: from mail78-59.sinamail.sina.com.cn (mail78-59.sinamail.sina.com.cn [219.142.78.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098AE192D8E
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739014536; cv=none; b=iuesDAxx51LnWwG5LwpBUJWTSbsmsmS+CWW9/8Ua2CCyxJrcxt1NuBneBQlDnEcfhG+J1xLQHJPOocQTAIAyY+1KJyC1feu5RkjME1u6n4kgV1/pmclxIwc/4+3kpQFdDIL8pH6I2n2mb/a9jwfgsj+Z/CY/fB1Ji1hZh9qymiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739014536; c=relaxed/simple;
	bh=U1UjTtHluCb5JAU+eC8rDo+o5gMjN4bthn1B1c0nEwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUibiiaeAZ1PClzxH2vSlXpbnhyxIWKUcqq/ktJgkX26De9Bk76ynErP84oR3Z8iEl642iC1hcZUbPlFY5zDgkx4U15x2Tfc3YAWAXOkAW3zw4j9wrO5FyaVoMNn1nXwj9JAhF6Qo3GKEQyR0Mcz7iqbQhfT41UdMN0Fk+EandA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=219.142.78.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.67.230])
	by sina.com (10.185.250.24) with ESMTP
	id 67A7417900004664; Sat, 8 Feb 2025 19:35:22 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 87058410748320
X-SMAIL-UIID: 94FD9BFA3B7240429E7DE6EF8A3A60C6-20250208-193522-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [hams?] possible deadlock in nr_remove_neigh (2)
Date: Sat,  8 Feb 2025 19:35:23 +0800
Message-ID: <20250208113525.2055-1-hdanton@sina.com>
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
 
@@ -245,8 +246,9 @@ static int __must_check nr_add_node(ax25
 				nr_node->routes[2].neighbour->count--;
 				nr_neigh_put(nr_node->routes[2].neighbour);
 
-				if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
-					nr_remove_neigh(nr_node->routes[2].neighbour);
+				if (nr_node->routes[2].neighbour->count == 0 &&
+				    !nr_node->routes[2].neighbour->locked)
+					victim = nr_node->routes[2].neighbour;
 
 				nr_node->routes[2].quality   = quality;
 				nr_node->routes[2].obs_count = obs_count;
@@ -281,6 +283,8 @@ static int __must_check nr_add_node(ax25
 
 	nr_neigh_put(nr_neigh);
 	nr_node_unlock(nr_node);
+	if (victim)
+		nr_remove_neigh(victim);
 	nr_node_put(nr_node);
 	return 0;
 }
--
