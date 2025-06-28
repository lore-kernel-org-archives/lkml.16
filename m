Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE502222584
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751112269; cv=none; b=FwiLt41UJe1A1jgtMtYIlucNGxLvWq97Oc1MsQSpRxnlNp0qLhkl7RhRpW65ms64SXjI4A+tPnCziqxiB8mfVCRFfzaWhYylFB9rL/t6zSHVSkZnvvJRo5tB9URZbgB2PGuPWyy8qvrKsExXS4cveOpwRuYyC11HfaBQYwdpG68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751112269; c=relaxed/simple;
	bh=LpYKM3S54QzOB//tOQ3iek23SXqzUaYJFEZulK44b5k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/9zohG1Bnp1pVbS7lmL/BmavXYfb2EoKGdVYAZbt9auuZgHveCjFiliCMYh0vTFeHHeVuuAYcnVUum+RNaRWKqonA4B2dQ74Cn15JlIe6ZwLHyoy9dNiD+5hFjRAb2yPE69fT0exinuruv9jxlRLUOEsMwKsVZIdzhZDvkpWgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=d32ZTkp6; arc=none smtp.client-ip=207.171.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="d32ZTkp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1751112268; x=1782648268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3j84Al7zkWlRrSjbPlmgniXKHtcMOq0gwLry3vQv+QA=;
  b=d32ZTkp6UibMIZlrqcEpug6DhxXc181wpDjxHf2gumjL/pr2batJPaXs
   Fx4GewX3NTai57TsVGr1s4fzccBKaSR1l1ID4b+d/JxJy9oHyzjM01ugG
   dRvaZqrvCefubPi67z4twWDoZmTwzbRTRIcI1GPMmrXbzmSFWLRlFiGI+
   NLWm7Vn0YqRzFDUHD/Q2ITYM7EtVMeRqpeXuECZ0IOqmYv91GFkE60qOR
   pUdAAT+4jHLZhDyJXR4APRvLO/RsGx+adciCzSKmD6cLRFt6GK+vqFB4/
   xOI4WLyxN/k+B0D7bH0De1KP2YaZ/mWt/KfSi/XXFvZajA+P02A6RqgBI
   g==;
X-IronPort-AV: E=Sophos;i="6.16,273,1744070400"; 
   d="scan'208";a="838974618"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 12:04:23 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.21.151:32107]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.63:2525] with esmtp (Farcaster)
 id 2f6b15b3-4020-4b41-8b03-7f3eb3f60313; Sat, 28 Jun 2025 12:04:22 +0000 (UTC)
X-Farcaster-Flow-ID: 2f6b15b3-4020-4b41-8b03-7f3eb3f60313
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Sat, 28 Jun 2025 12:04:22 +0000
Received: from b0be8375a521.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Sat, 28 Jun 2025 12:04:20 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>,
	<kohei.enju@gmail.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
Date: Sat, 28 Jun 2025 21:04:03 +0900
Message-ID: <20250628120413.3247-1-enjuk@amazon.com>
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
X-ClientProxiedBy: EX19D043UWC004.ant.amazon.com (10.13.139.206) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

#syz test

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 2dd6bd3a3011..b72bf8a08d48 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -497,22 +497,15 @@ void rose_rt_device_down(struct net_device *dev)
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
+				memmove(&t->neighbour[i], &t->neighbour[i + 1],
+					sizeof(t->neighbour[0]) *
+						(t->count - i));
 			}
 
 			if (t->count <= 0)
