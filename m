Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158421C9ED
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738705030; cv=none; b=r1aO2+dPbuxSOqyxUyOT6SiKG7SgfikmlnCCkFJJJsRttQMHo0fguJPBusOoeN0qY+85gut21KgJJsmpxAWy8FRzEFyYZLLRGAS/6rika5U0ylhwe6HxUA4mIe8kMl1H8CfcmcNCYsPBPPCw4+Flx7ftxByg2Y4W3IdUc0MmNko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738705030; c=relaxed/simple;
	bh=KmN9Yhyxa1Lnd1aVDGktRiri3LzeMPAmBIXiAg1LHaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ehlX9RQmKzgjM1/Ea2glYwT2dtUsI9ZJJDd9P5LiADpHfnrMELTrQbMpCZqQ5esTaUYKfUNevIscgQyxyick2N5s6IPw1ddVi9BqXO2Z8ra6wSsHgCnjNwWzbNeLjy1m4V/5DhD/QGFdol7bsc0rlbbJIUWkPl3/XRE1g76TFkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c448:5c9f:5d50:ad45])
	by michel.telenet-ops.be with cmsmtp
	id 9Zcy2E0055P95W306ZcyUA; Tue, 04 Feb 2025 22:37:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfQb8-0000000FpgF-0Zjm;
	Tue, 04 Feb 2025 22:36:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfQbK-00000006Dt9-02Sa;
	Tue, 04 Feb 2025 22:36:58 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: "David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH net-next v3] ipv4: ip_gre: Fix set but not used warning in ipgre_err() if IPv4-only
Date: Tue,  4 Feb 2025 22:36:54 +0100
Message-ID: <d09113cfe2bfaca02f3dddf832fb5f48dd20958b.1738704881.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

if CONFIG_NET_IPGRE is enabled, but CONFIG_IPV6 is disabled:

    net/ipv4/ip_gre.c: In function ‘ipgre_err’:
    net/ipv4/ip_gre.c:144:22: error: variable ‘data_len’ set but not used [-Werror=unused-but-set-variable]
      144 |         unsigned int data_len = 0;
	  |                      ^~~~~~~~

Fix this by moving all data_len processing inside the IPV6-only section
that uses its result.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501121007.2GofXmh5-lkp@intel.com/
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Simon Horman <horms@kernel.org>
---
v3:
  - Add Reviewed-by,

v2:
  - Do not use the ternary operator,
  - Target net-next.
---
 net/ipv4/ip_gre.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index ed1b6b44faf8049e..c9f11a046c263005 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -141,7 +141,6 @@ static int ipgre_err(struct sk_buff *skb, u32 info,
 	const struct iphdr *iph;
 	const int type = icmp_hdr(skb)->type;
 	const int code = icmp_hdr(skb)->code;
-	unsigned int data_len = 0;
 	struct ip_tunnel *t;
 
 	if (tpi->proto == htons(ETH_P_TEB))
@@ -182,7 +181,6 @@ static int ipgre_err(struct sk_buff *skb, u32 info,
 	case ICMP_TIME_EXCEEDED:
 		if (code != ICMP_EXC_TTL)
 			return 0;
-		data_len = icmp_hdr(skb)->un.reserved[1] * 4; /* RFC 4884 4.1 */
 		break;
 
 	case ICMP_REDIRECT:
@@ -190,10 +188,16 @@ static int ipgre_err(struct sk_buff *skb, u32 info,
 	}
 
 #if IS_ENABLED(CONFIG_IPV6)
-	if (tpi->proto == htons(ETH_P_IPV6) &&
-	    !ip6_err_gen_icmpv6_unreach(skb, iph->ihl * 4 + tpi->hdr_len,
-					type, data_len))
-		return 0;
+	if (tpi->proto == htons(ETH_P_IPV6)) {
+		unsigned int data_len = 0;
+
+		if (type == ICMP_TIME_EXCEEDED)
+			data_len = icmp_hdr(skb)->un.reserved[1] * 4; /* RFC 4884 4.1 */
+
+		if (!ip6_err_gen_icmpv6_unreach(skb, iph->ihl * 4 + tpi->hdr_len,
+						type, data_len))
+			return 0;
+	}
 #endif
 
 	if (t->parms.iph.daddr == 0 ||
-- 
2.43.0

