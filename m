Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F01EE021
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745661926; cv=none; b=AuqIojZCncu66fLwqiWuBMzwx+/U+L1xN5bW0GbavDl/bVFn/0U8SGerQus6iXgbaQHJJgkG3RfFosMbhZxbESA5fcXDX4Wn505liXWVpKG6SfV6ibrKahUBeobdVkj2u2FFT9vESud+mUVKm0g5lk0Wt60K3EYM/Na4hkBSOfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745661926; c=relaxed/simple;
	bh=h5nDQI4JyGOjMxhPbRkAI1pqnBTIqjl9/FBQRi4VPGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7wzi0zg9tSKNgb1lRbMEBv7Z9pqoqocpzKiMyHzyXIPuU/HeTmcXufav5dhPl5xTb5f1ilmEyGYkd0OKSKgmJEeVVs/t8kj/umjHyOcvfE/bQj1T84AfHhMkabkiOKKCKf357Q2e/3iJeVBe+GbvSmWk4OjHyoIH9Nn6iOj2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nN+8CViK; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nN+8CViK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745661920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tsXNwk53+3Gu5tZw/HRtX0kZWtSs7hie+/fyzm0FRPE=;
	b=nN+8CViKIByaAP4gQ2WEeblprOTXu2XVUZJvsbe6TGuHyxYG9Jc1+A65ihYAS5af8hGlAE
	wQE3TzwNcD9XP6lcmeuoSFLw6UhY+w4BTVfL93SXIypxW0dY3nxjWQVUGmrXzTBsC8lcgh
	5AZ5dlRnpPG3T0hM438QHHSpSeB9d08=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jon Maloy <jmaloy@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] tipc: Replace msecs_to_jiffies() with secs_to_jiffies()
Date: Sat, 26 Apr 2025 12:04:44 +0200
Message-ID: <20250426100445.57221-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use secs_to_jiffies() instead of msecs_to_jiffies() and avoid scaling
'delay' to milliseconds in tipc_crypto_rekeying_sched(). Compared to
msecs_to_jiffies(), secs_to_jiffies() expands to simpler code and
reduces the size of 'tipc.ko'.

Remove unnecessary parentheses around the local variable 'now'.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 net/tipc/crypto.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/tipc/crypto.c b/net/tipc/crypto.c
index c524421ec652..45edb29b6bd7 100644
--- a/net/tipc/crypto.c
+++ b/net/tipc/crypto.c
@@ -41,10 +41,10 @@
 #include "msg.h"
 #include "bcast.h"
 
-#define TIPC_TX_GRACE_PERIOD	msecs_to_jiffies(5000) /* 5s */
-#define TIPC_TX_LASTING_TIME	msecs_to_jiffies(10000) /* 10s */
-#define TIPC_RX_ACTIVE_LIM	msecs_to_jiffies(3000) /* 3s */
-#define TIPC_RX_PASSIVE_LIM	msecs_to_jiffies(15000) /* 15s */
+#define TIPC_TX_GRACE_PERIOD	secs_to_jiffies(5)
+#define TIPC_TX_LASTING_TIME	secs_to_jiffies(10)
+#define TIPC_RX_ACTIVE_LIM	secs_to_jiffies(3)
+#define TIPC_RX_PASSIVE_LIM	secs_to_jiffies(15)
 
 #define TIPC_MAX_TFMS_DEF	10
 #define TIPC_MAX_TFMS_LIM	1000
@@ -2348,7 +2348,7 @@ static void tipc_crypto_work_rx(struct work_struct *work)
 	struct delayed_work *dwork = to_delayed_work(work);
 	struct tipc_crypto *rx = container_of(dwork, struct tipc_crypto, work);
 	struct tipc_crypto *tx = tipc_net(rx->net)->crypto_tx;
-	unsigned long delay = msecs_to_jiffies(5000);
+	unsigned long delay = secs_to_jiffies(5);
 	bool resched = false;
 	u8 key;
 	int rc;
@@ -2418,8 +2418,8 @@ void tipc_crypto_rekeying_sched(struct tipc_crypto *tx, bool changed,
 	}
 
 	if (tx->rekeying_intv || now) {
-		delay = (now) ? 0 : tx->rekeying_intv * 60 * 1000;
-		queue_delayed_work(tx->wq, &tx->work, msecs_to_jiffies(delay));
+		delay = now ? 0 : tx->rekeying_intv * 60;
+		queue_delayed_work(tx->wq, &tx->work, secs_to_jiffies(delay));
 	}
 }
 
-- 
2.49.0

