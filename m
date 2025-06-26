Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A461EE03D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948397; cv=none; b=cbW9XA0L3q7EgJYMqC+amk4V4tzTZsKIGMw0jQ8K8Q/NAAWslbK34vVkWF/T8++dPpy9kEvzJTSXCz4S0ai5wwBucx4IHamYXZD12gXtS1R2xz4FdG4yWtrkNgEBmc7KdHUmnSJrG+Wo9WBZMOX2lHqEU1G4pir367Fwz4EH5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948397; c=relaxed/simple;
	bh=YPAWrQhHj2b2mvwCdsHJtWxdTBpLZOUBtZlYp/c2Bzs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ciobcJFgx2DZEpghTItgHrBinI0QHH3VFkhjCq1Ynzj2ZeOKyM9Z81I8sAwZkLfu0ZHP5+WcJjnuAMrufFlkS1bGUw4qHEGUDnd+cCXMQMDKE6JomHFSC42SK52xlxJO7UDqxOzQv36e9emkuKzpaaFu9gl1/m8qGgl/57Fwre4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EE91GXIW; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EE91GXIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750948384; bh=h+4UoYC/nICB37bc6TKBCVxl4oKTHZHHUe485m7GPoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EE91GXIW12YqZD6CUGRXnthSgmZKDZJJtgNe7pQh05RXCWBTEki4QEEcC2ePQLdvB
	 qmZv/Ra6jJba/dGIx74Hy0gFUsYG08wSYvB3mNenZ5NcvGgXksUV8PoOSRAG6ln8Cu
	 06TcsuyH1aGo3m302MDsY/HztLq6R46Lsu1kVRSw=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 522B5EC0; Thu, 26 Jun 2025 22:20:34 +0800
X-QQ-mid: xmsmtpt1750947634tysug6ggn
Message-ID: <tencent_BE9E321B554B031B9E25CABA09BB2D338B08@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqfmD8Sl9CO6pOVjeJ8IJ5aLIK+6IX/qUz5Wt3wpmvh2QDFUpgK3F
	 Ll1/a6/JiPX9FvIJ76HjQZSoEbHsk6t+vxK/T1Nn6pGCCrHk4ZYGJYSn4ZZ219tPYck648NrMXi8
	 j1t76I68Dv8Oza1Uu4syiwFGYs/v3Hb7c9vbTD5jj2cm2F0vz8g1BPIsPUdQ9WSWfi38pQ5QoGum
	 2ou9/NWzlcnnCwBs8k6Thuli1vRhvsK0Oitin78wmPm8jBnVrZoNluh6HJkGtsBO+2WiniEQsu6W
	 Gu5bIzmVnz8duGdHRYxAIgBVvvu0Qm6FrOT/n6PhyRuH3/5etyAw/rsB+iv6GpAQo0N8rLRVXvB5
	 oDBLG+JiPKHKEoSe1wYXw6PRWl4EXTknQBVWCPB9slTQL4h/Ejzyk4WOxaKXqPFioklyoEmtvEno
	 4Au6Erbn1pJlbQMLCdfTmFEAs2Bf6fXcvIIT9bzoiwyUv5PWNewC8jpNqxzfJXWl0YwMz0AepHWv
	 v3YPSySmUd5xOn5/mzZqzuDkKyX0maeb5ubO2jgAEefI6ce/CiYKkGefuToy44BRTPf3LXdsKDFp
	 gu+WWOS8Jgrh81hM9xlKWEgBcbHnEgj2vSlu9YRS1dcSRB6wXGWrHJOBBggQ97H8cOYjS8l2gqK+
	 hxleUypHfO0gQexSa5bzGckRNvr1bbzwrgHZJIsZW5JF7RapLNY0F4ZQAIACzfzy+doqDy4KZxIn
	 69ienHmzf9TU20tMPN96up7PIrpSEsAz+txvhNsu23aH+57wzW07sbziPvCAkXaVd2z/FbQVtDlo
	 0iwXtrkxwU8sN3yz0DfDvX4yVKZ2lEypccxp5+HRw9O5FA6fuhTxXU8Vp/CuiEZuKFaVJaI01xvi
	 uhbHaOX1JC7skKfmi7JVTtfoMk/QpkemV8WgZqijDuJ9wx6k1tNdiD6kcjaJVLttEslt4Da18Lhf
	 1XejtWpTeAsysJCbbLgl5BXk09pQFzg7IoPCLwq3YjctbexVqKBJHgt/UYXIhk
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
Date: Thu, 26 Jun 2025 22:20:33 +0800
X-OQ-MSGID: <20250626142032.1364958-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <685d4c2a.a00a0220.2e5631.028c.GAE@google.com>
References: <685d4c2a.a00a0220.2e5631.028c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..a9ae329d598e 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -331,7 +331,6 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 		return -EINVAL;
 	}
 
-	spin_lock_bh(&nr_node_list_lock);
 	nr_node_lock(nr_node);
 	for (i = 0; i < nr_node->count; i++) {
 		if (nr_node->routes[i].neighbour == nr_neigh) {
@@ -345,7 +344,9 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 			nr_node->count--;
 
 			if (nr_node->count == 0) {
+				spin_lock_bh(&nr_node_list_lock);
 				nr_remove_node_locked(nr_node);
+				spin_unlock_bh(&nr_node_list_lock);
 			} else {
 				switch (i) {
 				case 0:
@@ -360,14 +361,12 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 				nr_node_put(nr_node);
 			}
 			nr_node_unlock(nr_node);
-			spin_unlock_bh(&nr_node_list_lock);
 
 			return 0;
 		}
 	}
 	nr_neigh_put(nr_neigh);
 	nr_node_unlock(nr_node);
-	spin_unlock_bh(&nr_node_list_lock);
 	nr_node_put(nr_node);
 
 	return -EINVAL;

