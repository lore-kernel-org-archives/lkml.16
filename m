Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A8182BC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750830282; cv=none; b=M40E/H9AVgMWcsfgJOwt5J7yB40ai2Cqq3O1PIFj2coBfq1FyBpMzwonMtUfClhFRW4vVTYppjOilCX1WvHPHZxLs0wGyQ3LW1MWDuvmygUfYt4ounH4XZLSDDSBp7VjlWOFptH8PjCxTTlRr0b0mPr8EMd2r/h7RvPv2bnaRtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750830282; c=relaxed/simple;
	bh=2dPiDDdcbAq+UGJ/79hSoHYe6tZdUBiTiFu1HAqxCzM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bac1VXy6LafTw3gB+EsfCQrCkjSGSy7E4pyg58BDjnSj1hYpaT6/IFl45d8IpqifvfHh0KPGnjB4nn4CtxeTo9Aihn8Qz4HDWBKUcbeL1KoC38ysTHJTzJq11Hr3ZjswqJ8MOtuxZHyY7o9ahDaopxsFuwgOJU59pwcHRhAR7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=B9aI7mqT; arc=none smtp.client-ip=99.78.197.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="B9aI7mqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1750830281; x=1782366281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yde6jupPQm/RgMd748QbHcM7Wl5tJsdp8/0U2yyz4t4=;
  b=B9aI7mqTw1AnXYkENfeuheqkDRKrlb21X9nD7NWdFJWzgW5pXWfn0qHf
   lCbgxRO8wbG57I6+l1D5F2BMVBtkKdm0d6HnbVlB4c/OnZx+B8jx8w5Lo
   nMCaQeUIrPrsAYe+5wIHkmfIp9g1T/my68YA8r1cxwcLHTuwaaIDwRzfV
   2W2pdi+O2okjCI7fVTXIwLuAo1cytrGol5n1qQjf99QfYN+uWRI1Xz0vf
   s8c2/om2xLwVr+Bd1GlRuaNeQM8RUwyMcDuKSdBov3xX5qHWINCyhuyon
   SC3iB17cWjXv0rjlz7/4zyoBfmQTktQo+qLEizJzHkd1S+ghzApMoSBN8
   w==;
X-IronPort-AV: E=Sophos;i="6.16,263,1744070400"; 
   d="scan'208";a="214799481"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:44:39 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:8538]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.100:2525] with esmtp (Farcaster)
 id f34746e1-915e-423a-bf35-6f41265e4ac2; Wed, 25 Jun 2025 05:44:38 +0000 (UTC)
X-Farcaster-Flow-ID: f34746e1-915e-423a-bf35-6f41265e4ac2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 25 Jun 2025 05:44:38 +0000
Received: from b0be8375a521.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 25 Jun 2025 05:44:37 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
Date: Wed, 25 Jun 2025 14:44:19 +0900
Message-ID: <20250625054430.67623-1-enjuk@amazon.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <6807019a.050a0220.380c13.0001.GAE@google.com>
References: <6807019a.050a0220.380c13.0001.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D045UWC004.ant.amazon.com (10.13.139.203) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

#syz test

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 2dd6bd3a3011..a488fd8c4710 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -479,7 +479,7 @@ void rose_rt_device_down(struct net_device *dev)
 {
 	struct rose_neigh *s, *rose_neigh;
 	struct rose_node  *t, *rose_node;
-	int i;
+	int i, j;
 
 	spin_lock_bh(&rose_node_list_lock);
 	spin_lock_bh(&rose_neigh_list_lock);
@@ -497,22 +497,14 @@ void rose_rt_device_down(struct net_device *dev)
 			t         = rose_node;
 			rose_node = rose_node->next;
 
-			for (i = 0; i < t->count; i++) {
+			for (i = t->count - 1; i >= 0; i--) {
 				if (t->neighbour[i] != s)
 					continue;
 
 				t->count--;
 
-				switch (i) {
-				case 0:
-					t->neighbour[0] = t->neighbour[1];
-					fallthrough;
-				case 1:
-					t->neighbour[1] = t->neighbour[2];
-					break;
-				case 2:
-					break;
-				}
+				for (j = i; j < t->count; j++)
+					t->neighbour[j] = t->neighbour[j + 1];
 			}
 
 			if (t->count <= 0)
