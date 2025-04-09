Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B021DFFD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225246; cv=none; b=Fuhw1jkfOy3drvePNGlzMbIA5zrbaNSVVCSDBTkxeCxOWxVQBT6hl/K4dar1zXpp++NTQmnZj5oHgbDBNeHdkTsGwKQb708U1M1Ga6lONw/86rgEOdSTLGeX7XbYUjUa1fQX+qsoHa3/yNf3fdy2bDE0RLSEXqkb5zEpOrPDTdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225246; c=relaxed/simple;
	bh=/+cT+cDszlUftBIMhCi8ZGoN2iqUK/hwsPp6Ixj0SRs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsKENJ4rgSiXAPDtrGJ+Bs1QtcpAEd6Cz6yag5HuXVEdATmkUwpAY+IDAyiWkH/vAUs9JPGyX6diVb8DqF7RvDS99OHi/2oJefDnLdkHab5peUWFaBM+AIJ0i770urXhKPVu/1Vrf+KDemCWOC63WeikSQWkBlrmHV2oFBGbAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=SrMcbdKu; arc=none smtp.client-ip=99.78.197.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="SrMcbdKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1744225244; x=1775761244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yUNACYB7ZQ6lX8QcuM3N+m4K+jQ+syftIy3C0OOnZGc=;
  b=SrMcbdKuKTjEMcQqn7/qlRWAIKc+joOAlRTtyTmxO4ur7XjA+/TzWeUE
   P0/S83QicCivRhXhc7GVpRcdgNnsK5etIfNE+X6vSjTxSlN1DRFtg8a6W
   SoKtpCCGF0cswRpKDjWz2lEFSL77o6bmbfymWjCX17if5uGhQGP23/dse
   w=;
X-IronPort-AV: E=Sophos;i="6.15,201,1739836800"; 
   d="scan'208";a="189739463"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 19:00:42 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.7.35:8487]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.21.195:2525] with esmtp (Farcaster)
 id ab1dab9e-4ded-407e-9ade-34655e86e8e0; Wed, 9 Apr 2025 19:00:42 +0000 (UTC)
X-Farcaster-Flow-ID: ab1dab9e-4ded-407e-9ade-34655e86e8e0
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 9 Apr 2025 19:00:41 +0000
Received: from 6c7e67bfbae3.amazon.com (10.187.170.41) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 9 Apr 2025 19:00:39 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <hch@lst.de>
CC: <axboe@kernel.dk>, <kbusch@kernel.org>, <kuni1840@gmail.com>,
	<kuniyu@amazon.com>, <linux-kernel@vger.kernel.org>,
	<linux-nvme@lists.infradead.org>, <sagi@grimberg.me>, <shaopeijie@cestc.cn>
Subject: Re: [PATCH] nvme-tcp: Fix use-after-free of netns by kernel TCP socket.
Date: Wed, 9 Apr 2025 11:59:37 -0700
Message-ID: <20250409190031.38942-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409084446.GA2771@lst.de>
References: <20250409084446.GA2771@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWB004.ant.amazon.com (10.13.138.84) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: Christoph Hellwig <hch@lst.de>
Date: Wed, 9 Apr 2025 10:44:46 +0200
> Thanks, applied to nvme-6.15.

Thanks!

> 
> > To fix such problems, let's hold netns ref by sk_net_refcnt_upgrade().
> > 
> > We had the same issue in CIFS, SMC, etc, and applied the same
> > solution, see commit ef7134c7fc48 ("smb: client: Fix use-after-free
> > of network namespace.") and commit 9744d2bf1976 ("smc: Fix
> > use-after-free in tcp_write_timer_handler().").
> 
> I wish the netns APIs would be a little more robus to prevent these
> bugs from creeping in everywhere..

Can't agree more!

Actually, last year I tried to clean up such APIs to prevent this type
of issue.
https://lore.kernel.org/netdev/20241213092152.14057-1-kuniyu@amazon.com/

I'll revise this in this cycle once the fix reaches net tree.
