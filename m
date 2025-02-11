Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0165F1F0E42
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739267609; cv=none; b=G1i1jz1udBJXo/64R5kWmHwTi9l+5LZkCeqYd+tCnZKEl2Chygz947P82MGxLY77BIe+K9a1d8afM9dCZBKF+PC9ZvKunfvRtKlVu/igmJKiOUVK4+v4QN5lOFxZmCY8jPL9dywqROrNay8iFOXU9dmCyBGo3PhXjtARtzuM7ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739267609; c=relaxed/simple;
	bh=1a7ApAJdAEd4OnMnb4fnAyRo1gknRoFk8afUH4CkMs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVDSbCmRNKCxIfF8tqLTXQ9kQOhT/4HOWY3hFyDU8VsHjHFySf1XBqnPa0F5GKCfhuft7igwrw//JfNWgRyFhBfkfthi3Pf2Ib/Ra9oaBWkoXqWUeyDx7poI6xZLueGjpMhsrccVEb3A99oU4fA2I/HB1Oaa2PxMNdnAIcm7KnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UgZW8/iG; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UgZW8/iG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739267595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p8q1NE03cEUxDGjQx65ZUxEtEWYO5w2XFxoiG7lm7FM=;
	b=UgZW8/iGHDuk7rj1RjfH/qT+9HXyeKh0WgVdSsNnnvdTmH8ZzDnY+8N9KvfPBhoAZC02aT
	7Isynwyt2yMWI8we7Aq1+NYRUv2ARyMEZgmW80c4C9wYyOZbfafgQN6Oe3LN0mg6f273zs
	94bY+SEWWiVRQFj87Qnv4PBjV/3vZ7E=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: aead - use str_yes_no() helper in crypto_aead_show()
Date: Tue, 11 Feb 2025 10:52:54 +0100
Message-ID: <20250211095255.520170-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/aead.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/crypto/aead.c b/crypto/aead.c
index cade532413bf..12f5b42171af 100644
--- a/crypto/aead.c
+++ b/crypto/aead.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/seq_file.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <net/netlink.h>
 
 #include "internal.h"
@@ -156,8 +157,8 @@ static void crypto_aead_show(struct seq_file *m, struct crypto_alg *alg)
 	struct aead_alg *aead = container_of(alg, struct aead_alg, base);
 
 	seq_printf(m, "type         : aead\n");
-	seq_printf(m, "async        : %s\n", alg->cra_flags & CRYPTO_ALG_ASYNC ?
-					     "yes" : "no");
+	seq_printf(m, "async        : %s\n",
+		   str_yes_no(alg->cra_flags & CRYPTO_ALG_ASYNC));
 	seq_printf(m, "blocksize    : %u\n", alg->cra_blocksize);
 	seq_printf(m, "ivsize       : %u\n", aead->ivsize);
 	seq_printf(m, "maxauthsize  : %u\n", aead->maxauthsize);
-- 
2.48.0

