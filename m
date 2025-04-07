Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE301CCEF0;
	Mon,  7 Apr 2025 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035435; cv=none; b=UVBvIwo0fbxN4nXWgcdY8zkkhi8HMk+mZp69v7mfm4zVXdcTDbSCePNq1zp8lGPc+JeKUgwgbbLM5ZzoSgmuc9oMNVOcXc+LKOYNlQhX3Pw+yxWS3TIyHMKhBt00K+WA6FDPsBbPCzmLs1cMorhYJeh7mVhBs/Vrl+Jfj+m2o5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035435; c=relaxed/simple;
	bh=6eP8cjtyo3Q8s1Sd2g+u3JRNHnc4nVIEsVfAIGpdbww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUg5E6R5hKf+97ElpPOILKpYl0j51OCHwbbUmUmNys/m5t+0hNLoahnPj81oq+E/wrECoOLsMohjRAg7mSoxJDi7RlQQ3Yyo9QXqIILtcyCaDKxgzpoY1NUP33uXni2wPuD6kfl5MXtjtn1lhXU+gsegHY8AE1iAt7lPSYNMtdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:3b93:9152:d50e:6d45])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 2DC1728D8AF;
	Mon,  7 Apr 2025 14:17:11 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:3b93:9152:d50e:6d45) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: syzbot+29fc8991b0ecb186cf40@syzkaller.appspotmail.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot]
Date: Mon,  7 Apr 2025 16:17:05 +0200
Message-ID: <20250407141705.92770-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67ae3912.050a0220.21dd3.0021.GAE@google.com>
References: <67ae3912.050a0220.21dd3.0021.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174403543168.31791.15923234631150712621@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Author: contact@arnaud-lcm.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 644e99fc3623..520d895acc60 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -506,6 +506,11 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
 	unsigned char *data;
 	int islcp;
 
+	/* Ensure we can safely access protocol field and LCP code */
+	if (!skb || !pskb_may_pull(skb, 3)) {
+		kfree_skb(skb);
+		return NULL;
+	}
 	data  = skb->data;
 	proto = get_unaligned_be16(data);
