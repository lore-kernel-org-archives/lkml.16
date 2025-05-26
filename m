Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4FF20E717
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748288332; cv=none; b=o+1NfPXHACf9xUaDuQDVvhwOxz7xtBIx8bDFikIc9ODcZawvfiDx6y9JlG5AmoUjor9xgKNOsymTFVqDCinVGfNgUC5bxKWCYGxnAx4DL2Bc2+7uDgYZFALl9B1OBCdZppcTz/YLW9sdRhKut4K/0VQ3ViMEMNMEaNPQv8HwQDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748288332; c=relaxed/simple;
	bh=Sjo/thFOG8Ohswr4yz2Xf19SUKT1PfpAf/odp2Yz+3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rktzycw7JI+yCAJfXAVcdoTCcdj7or61IAJ0PjDg9EDCp9inz3dFYYFjoQWLaXajq0UFJjbrPVr+66Y0NHilg5UoJ7WwlBjqdjHQvu5fC04ZnLVB/8gVA2nTRRe/eolhyuhRCz8pKpl837MZowKzj0EdTYKqpO3vf4hb88jlfX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=YfYiHpis; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="YfYiHpis"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DDFC2240101
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 21:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1748288327; bh=Sjo/thFOG8Ohswr4yz2Xf19SUKT1PfpAf/odp2Yz+3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:From;
	b=YfYiHpisnEuTwy9SiUzxFEBk0XQhcRtW3aNr92kiFYfUQQz+8151bJq6QR9Dwy0H8
	 E8YdyAdjmZ7rgbGlZrn1uT/FA47vPOHHwCOVW39savHadnXzHaaB1+vJBm+LzJYxbl
	 1ZgMQm4r6BuYOrMAfo4+AFQpjaM36OTvwi6tzejVsl/9SH4U97tf4co/QUEVYH1ks4
	 P6y2az57Wmyb8kGdSKvKrYME8wkmCd7dajh3QIjFb+pItR9rf8HPZDBvcLFbKYpr/U
	 5RRGj2EQPsyReb2ZwTNbaAF8fueUp+FV2qSaS+GyLTU+v4D9IDWInye+5RF/IssHft
	 kiGDK+jquTRSg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4b5mKK3bs8z9rxN;
	Mon, 26 May 2025 21:38:45 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
Date: Mon, 26 May 2025 19:38:03 +0000
Subject: [PATCH net] net: tipc: fix refcount warning in tipc_aead_encrypt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-net-tipc-warning-v1-1-472f3aa9dd9f@posteo.net>
X-B4-Tracking: v=1; b=H4sIABrDNGgC/x3MMQqAMAxA0atIZgM1WEGvIg6xRs0SpRUVxLtbH
 N/w/wNJokqCrnggyqlJN8uoygLCyrYI6pQN5Mg7Tw2aHHjoHvDiaGoLjhM75jb4mghytkeZ9f6
 X/fC+HwFa93FiAAAA
X-Change-ID: 20250526-net-tipc-warning-bda0aa9c5422
To: Jon Maloy <jmaloy@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Wang Liang <wangliang74@huawei.com>
Cc: netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, 
 syzbot+f0c4a4aba757549ae26c@syzkaller.appspotmail.com, 
 Charalampos Mitrodimas <charmitro@posteo.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748288321; l=2046;
 i=charmitro@posteo.net; s=20250526; h=from:subject:message-id;
 bh=Sjo/thFOG8Ohswr4yz2Xf19SUKT1PfpAf/odp2Yz+3w=;
 b=dkIjs3P9V7/Xg2U5IQkIFcov6kdG2vNzckHq/dd2QA95UdySHQqd1YCIxHnbreXABcaAk/7XH
 D10pL6x5EPIDH+YTWG73FQU+po5qnniJimXMrn3aqTuH7wo2Et0b9OI
X-Developer-Key: i=charmitro@posteo.net; a=ed25519;
 pk=PNHEh5o1dcr5kfKoZhfwdsfm3CxVfRje7vFYKIW0Mp4=

syzbot reported a refcount warning [1] caused by calling get_net() on
a network namespace that is being destroyed (refcount=0). This happens
when a TIPC discovery timer fires during network namespace cleanup.

The recently added get_net() call in commit e279024617134 ("net/tipc:
fix slab-use-after-free Read in tipc_aead_encrypt_done") attempts to
hold a reference to the network namespace. However, if the namespace
is already being destroyed, its refcount might be zero, leading to the
use-after-free warning.

Replace get_net() with maybe_get_net(), which safely checks if the
refcount is non-zero before incrementing it. If the namespace is being
destroyed, return -ENXIO early, after releasing the bearer reference.

[1]: https://lore.kernel.org/all/68342b55.a70a0220.253bc2.0091.GAE@google.com/T/#m12019cf9ae77e1954f666914640efa36d52704a2

Reported-by: syzbot+f0c4a4aba757549ae26c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/68342b55.a70a0220.253bc2.0091.GAE@google.com/T/#m12019cf9ae77e1954f666914640efa36d52704a2
Fixes: e27902461713 ("net/tipc: fix slab-use-after-free Read in tipc_aead_encrypt_done")
Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>
---
 net/tipc/crypto.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/tipc/crypto.c b/net/tipc/crypto.c
index 8584893b478510dc1ddda321ed06054de327609b..49916f983fe5e1d48477945104fe5fc589257533 100644
--- a/net/tipc/crypto.c
+++ b/net/tipc/crypto.c
@@ -818,7 +818,11 @@ static int tipc_aead_encrypt(struct tipc_aead *aead, struct sk_buff *skb,
 	}
 
 	/* Get net to avoid freed tipc_crypto when delete namespace */
-	get_net(aead->crypto->net);
+	if (!maybe_get_net(aead->crypto->net)) {
+		tipc_bearer_put(b);
+		rc = -ENXIO;
+		goto exit;
+	}
 
 	/* Now, do encrypt */
 	rc = crypto_aead_encrypt(req);

---
base-commit: 49fffac983ac52aea0ab94914be3f56bcf92d5dc
change-id: 20250526-net-tipc-warning-bda0aa9c5422

Best regards,
-- 
Charalampos Mitrodimas <charmitro@posteo.net>

