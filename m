Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DFF22CBF9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769066; cv=none; b=MQ80x/7c88FDHkAUdcDvrJQ+VOihHxSUMDfzD3ukEKCCUIgY4wogu7oyrMt3O3Mkt4BGx6M4HjOxsSBQJhf31R8fUGceprVEfbyWrFG4KY6+4Kz/MHqG6k+RI5FhNz49CWety8Qc+aV62ZzWWVALg5SuK6ibj72tq5K7jXDzzLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769066; c=relaxed/simple;
	bh=xKH1I/vrL/pyyYmCDEAIIsVLnzWhz3lMqOmryPR161I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I5Rq6N7SvBO5/9DI7OYE4jrX8hWshQ3ln30bu+tPI+I3v8IzzMPdri8ZNqMyhvLfdZOk1lMQZ4HmRFfOsmOXjyvlV7CyuU166plYB6w/Tes6X3uu7IXPel6Sfsl4H98Ai1puwwsRq94GaA5iOt43ZB/6P/cUztvkmG/auYjGB+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=m3S457P9; arc=none smtp.client-ip=99.78.197.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="m3S457P9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1750769065; x=1782305065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XdhYht358jnNIuTVyQjBOMeJxFoewBGgDQ3f9ZJ5D4k=;
  b=m3S457P9Pk1cHQ+XNSirioyikxInwVH5T3Bl9PzJ/J+0HFjDaIyYQ8+9
   SRCXzRkhPLcps7PkNli5V8LPF7hYla0elPrulEIU/NxfKopdIb0hyRCkk
   9yG9GtuSH8l1WpTTVO34y/jArrMANVMhb3tFh3E6mi0auPY4EcwQDbDji
   nYuQbxlTgXhr2UGeyv2j9ScgUgS4u6OXhzZJ0JHJVjgiazu9Zaknf+7m0
   rg+PG5mM87wBBDdB0hKNd9Xo57mRvVbVFOafHJF4ovDawGL28N5eqk/Pe
   nULMMi3EQkchZoKfwEUU7QS7DBfFVXas5Fv2xWgix5hj1i6djGZ9Jd9ze
   g==;
X-IronPort-AV: E=Sophos;i="6.16,261,1744070400"; 
   d="scan'208";a="419451125"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 12:44:22 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:32657]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.28.168:2525] with esmtp (Farcaster)
 id f4877d73-902a-40af-b5b9-7b8e179865b2; Tue, 24 Jun 2025 12:44:21 +0000 (UTC)
X-Farcaster-Flow-ID: f4877d73-902a-40af-b5b9-7b8e179865b2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 24 Jun 2025 12:44:21 +0000
Received: from b0be8375a521.amazon.com (10.37.245.7) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 24 Jun 2025 12:44:20 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
Date: Tue, 24 Jun 2025 21:43:20 +0900
Message-ID: <20250624124408.28785-1-enjuk@amazon.com>
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
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

#syz test

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 2dd6bd3a3011..a85969e2369f 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -480,6 +480,7 @@ void rose_rt_device_down(struct net_device *dev)
 	struct rose_neigh *s, *rose_neigh;
 	struct rose_node  *t, *rose_node;
 	int i;
+	unsigned char old_count;
 
 	spin_lock_bh(&rose_node_list_lock);
 	spin_lock_bh(&rose_neigh_list_lock);
@@ -497,7 +498,8 @@ void rose_rt_device_down(struct net_device *dev)
 			t         = rose_node;
 			rose_node = rose_node->next;
 
-			for (i = 0; i < t->count; i++) {
+			old_count = t->count;
+			for (i = 0; i < old_count; i++) {
 				if (t->neighbour[i] != s)
 					continue;
 
