Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA3273812
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344948; cv=none; b=tej8Ji6/mGq65VJ9dnykDnvAIUOpqALH+bO5U9I5G49aCpdgOJ8iDQzLgpX/AD/rR9TzPvs9X61keQdovvgyjiMGusNdBCUYgU+ejxq39elKZhaHf4FebOQdgA+OhUO1RH81pbjHzHZGbCqbW6FI51AsqlSp88un59orwz6xemQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344948; c=relaxed/simple;
	bh=W1L0rO9dU5FFbVfVjwNW8A9US4mbKUKOKfUDHJkMAKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POFnnjWdJFpcAEYtE358NQN1Vxpd1ou/ll/XiCV0fn375ZqAZi+VbRUjXiTXwI4agotoOS8UJEzqLp1PzzbHDtbYCV7IWRcnU5roxOIC2319rVTuyfmoKJY3mbTtBgL5DyVLWOD0qv4GjJaRU+mHEs1h3y1b4VNOKhL6Rn4JlKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zv9cfyM9; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zv9cfyM9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750344944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T2eXgg8AokEwULeJHXyxGHKldGhr0QHsHsoPutM/BV0=;
	b=Zv9cfyM99VUKZo/PGzR9whE6RlDbdLiLSHzex3RDIy4VeDzOk9P17uw8wbvXhh0FwmLVLv
	Nx/aJaQFQY5CiNubNWHsWsvhlPcGBVbxNit/Vn8G8Y9Hby6qUKu8ywJezoEPrnft/0n1ym
	xh3M/B2r2SFP3fUJ8zwNUnDWep9QQQw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] sbus: envctrl: Fix typo in comment
Date: Thu, 19 Jun 2025 16:53:31 +0200
Message-ID: <20250619145336.174298-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/disinguish/distinguish/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/sbus/char/envctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/sbus/char/envctrl.c b/drivers/sbus/char/envctrl.c
index 81918aa67109..69e49da93b8b 100644
--- a/drivers/sbus/char/envctrl.c
+++ b/drivers/sbus/char/envctrl.c
@@ -734,7 +734,7 @@ static void envctrl_set_mon(struct i2c_child_t *pchild,
 {
 	/* Firmware only has temperature type.  It does not distinguish
 	 * different kinds of temperatures.  We use channel description
-	 * to disinguish them.
+	 * to distinguish them.
 	 */
 	if (!(strcmp(chnl_desc,"temp,cpu")) ||
 	    !(strcmp(chnl_desc,"temp,cpu0")) ||
-- 
2.49.0

