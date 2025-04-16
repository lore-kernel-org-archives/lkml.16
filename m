Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D891A1F94C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790547; cv=none; b=lqm8DoQ7jg9ITXTGO066PShWEEiR85Lk4Ou4LoZGoVFtZlb1JOz9SLBH82oJBSrEKxs1SNN4PrdcZ5nJgr4dPGKVdI43caBAygyRRQq1pkbxABK5HZFyXUx36lF4wu8tf16m/iFBuuDxPFwRdr8flM4vB+A/5wT0lCkoBorAQEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790547; c=relaxed/simple;
	bh=uqVW/gYL/AfSkfqT2SQ8URY9xseAJkm/A88KX9WkWZ8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=E36JBKWQbEnO3TtyMR/zjMKmAqQfKNmqXcjmoJSiJrUnI5iba+JO2x5YkDBYXTdT71eiH9seeRl/yJEURye9AnsTCOqcJ7Enik1849O9sNeVPsIPartVLhVh7ROta40WDeQTixauXuAr6BDkM01bKk4YMPliIjWjZdOP4PSW/34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=qRRG88RA; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="qRRG88RA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=zbUQzwnf3Lh6GvyJBx
	Lm8uq590tIbXVITPEobS110pE=; b=qRRG88RArkBy/Zq71aSqTYxtjLc7+Tm+N+
	ZBIV54ngD17yvUXrsaVKt0nGEnuFAmpCgT3ReoC5If/H0rDMi19B2G7n/ORTUysW
	XsXlFGhOC51dci/9ji8CuEPLJH3j4AWz8Cq3XWxFvJhRWrQibp9TC/IThcoupSjZ
	V/SQ6KBPI=
Received: from tst4-maikun-dev-1.prod.yiran.com (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnN0FUYP9nDbzrAw--.58958S2;
	Wed, 16 Apr 2025 15:46:32 +0800 (CST)
From: lwk <lwk111111@126.com>
To: davem@davemloft.net
Cc: edumazet@google.com,
	dsahern@kernel.org,
	linux-kernel@vger.kernel.org,
	lwk <lwk111111@126.com>
Subject: [PATCH] net: add synsend and synrecv statistics
Date: Wed, 16 Apr 2025 15:46:26 +0800
Message-Id: <1744789586-4488-1-git-send-email-lwk111111@126.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID:_____wDnN0FUYP9nDbzrAw--.58958S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar18Ww1fCw1xZrW8Ar4Dtwb_yoW5Jr1UpF
	Zxtr4fGr4UG3s7C3s2yFyxXr17Xw48CF1293yUurZI93Z8Gr47Xrs7KryavF10vrsrtr45
	WF9rWrW5G34FvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zizwZxUUUUU=
X-CM-SenderInfo: 5ozniiirrriqqrswhudrp/1tbiFhoxSmf-Tl2NJAABsU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

In some scenarios, it is necessary to know the count of syn
packages sent and syn packages received in order to assist in
troubleshooting issues.

Signed-off-by: lwk <lwk111111@126.com>

	modified:   include/uapi/linux/snmp.h
	modified:   net/ipv4/proc.c
	modified:   net/ipv4/tcp_input.c
	modified:   net/ipv4/tcp_output.c
---
 include/uapi/linux/snmp.h | 2 ++
 net/ipv4/proc.c           | 2 ++
 net/ipv4/tcp_input.c      | 1 +
 net/ipv4/tcp_output.c     | 1 +
 4 files changed, 6 insertions(+)

diff --git a/include/uapi/linux/snmp.h b/include/uapi/linux/snmp.h
index 848c778..3ebf80d 100644
--- a/include/uapi/linux/snmp.h
+++ b/include/uapi/linux/snmp.h
@@ -303,6 +303,8 @@ enum
 	LINUX_MIB_TCPAOKEYNOTFOUND,		/* TCPAOKeyNotFound */
 	LINUX_MIB_TCPAOGOOD,			/* TCPAOGood */
 	LINUX_MIB_TCPAODROPPEDICMPS,		/* TCPAODroppedIcmps */
+	LINUX_MIB_TCPSYNSEND,   /* TCPSynSend */
+	LINUX_MIB_TCPSYNRECV,   /* TCPSynRecv */
 	__LINUX_MIB_MAX
 };
 
diff --git a/net/ipv4/proc.c b/net/ipv4/proc.c
index affd21a..1fb7755 100644
--- a/net/ipv4/proc.c
+++ b/net/ipv4/proc.c
@@ -306,6 +306,8 @@ static int sockstat_seq_show(struct seq_file *seq, void *v)
 	SNMP_MIB_ITEM("TCPAOKeyNotFound", LINUX_MIB_TCPAOKEYNOTFOUND),
 	SNMP_MIB_ITEM("TCPAOGood", LINUX_MIB_TCPAOGOOD),
 	SNMP_MIB_ITEM("TCPAODroppedIcmps", LINUX_MIB_TCPAODROPPEDICMPS),
+	SNMP_MIB_ITEM("TCPSynSend", LINUX_MIB_TCPSYNSEND),
+	SNMP_MIB_ITEM("TCPSynRecv", LINUX_MIB_TCPSYNRECV),
 	SNMP_MIB_SENTINEL
 };
 
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 0cbf81b..a77bf35 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6781,6 +6781,7 @@ enum skb_drop_reason
 			icsk->icsk_af_ops->conn_request(sk, skb);
 			local_bh_enable();
 			rcu_read_unlock();
+			NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPSYNRECV);
 
 			consume_skb(skb);
 			return 0;
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index bc95d2a..821aa63 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -4143,6 +4143,7 @@ int tcp_connect(struct sock *sk)
 	tcp_connect_queue_skb(sk, buff);
 	tcp_ecn_send_syn(sk, buff);
 	tcp_rbtree_insert(&sk->tcp_rtx_queue, buff);
+	NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPSYNSEND);
 
 	/* Send off SYN; include data in Fast Open. */
 	err = tp->fastopen_req ? tcp_send_syn_data(sk, buff) :
-- 
1.8.3.1

