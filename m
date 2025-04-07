Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0E122A7EA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017294; cv=none; b=gHE+/M9U0+1J9Gas0hFZrs6OhQQXPSYU4u1A0TRt4sDYtmJ5i32b0D1PFJJOI1cKMacxIJQul/brP9MK+RXDArDwnhUAs/uqXajn2ctw3q6nZj/t7CawOYuF4/HraMPSkWYWCtBLdK2xhow6n5IFNBXc6NpNG7mgCCEdbrLLoEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017294; c=relaxed/simple;
	bh=GKM7YNmweXGKd/5T213LHt2OW6BWq3I/9APzmR+Ttlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rTblx5hWBOOjOK4cAxYYPWzNMZfcstX0LzTeohkjX3w3pHrGe4GzUq5HiBggiBkCPnNTKK6UTSDzNcu4NAFtpncxRxFgv+PLwqGlr5H+hrvmzR3m40kx30KK8nadfMb0X6ML606qs+MJeT8Y84uTRKBw0BHz54I6EqNvKt0lbxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ee9J8TND; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ee9J8TND"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744017291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oDx2UQT+oddyJAOWw3fQnxWBa8r2gSho+ZEVDQ9jJsE=;
	b=Ee9J8TNDQLDfej0tyWHFJ8VlW8uYwZsThCVzj0/wT/Gf0axvNd6mhBq/9E2bwb0XD6ntTQ
	/wwWlD6rKb9Vm2RI/CocxEiynM7KWq80OmGE/S7JVeP3iV9VMT3jDwVWfpX8GvelOglqTz
	V4tfJ//xSS2wZ6Rfenq2s8iATLCwjik=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] rocker: Simplify if condition in ofdpa_port_fdb()
Date: Mon,  7 Apr 2025 11:14:42 +0200
Message-ID: <20250407091442.743478-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove the double negation and simplify the if condition.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/net/ethernet/rocker/rocker_ofdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/rocker/rocker_ofdpa.c b/drivers/net/ethernet/rocker/rocker_ofdpa.c
index 826990459fa4..8832bfdd8833 100644
--- a/drivers/net/ethernet/rocker/rocker_ofdpa.c
+++ b/drivers/net/ethernet/rocker/rocker_ofdpa.c
@@ -1933,7 +1933,7 @@ static int ofdpa_port_fdb(struct ofdpa_port *ofdpa_port,
 	spin_unlock_irqrestore(&ofdpa->fdb_tbl_lock, lock_flags);
 
 	/* Check if adding and already exists, or removing and can't find */
-	if (!found != !removing) {
+	if (!found == removing) {
 		kfree(fdb);
 		if (!found && removing)
 			return 0;
