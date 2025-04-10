Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED17280CEE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280709; cv=none; b=KT4fhymmKmhTEuLyCQLetx99htUp5W54a3bPRrZXaua0q1Ua3XgFFZxh0TjCaMVSniP1B4WSUQRFAl0+CexzFF4CiRv3Oni8Ugyvd11ZQ6THba+RWDew8Cfd6PELSbRQl/LLwlhqKWCZY+mmzhz5qkcUYoGCc29YnfwRf7hq66A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280709; c=relaxed/simple;
	bh=ielTtZR3xx01MBPj7eIJpEVIxa/elFoWROV7Rp6I9oA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYe8R58An0vKYUVPbENWEuF+rC6aXhuKcko+GwIO4cX2QYKXulSK1qdcCzqEfU77EFM9ks8wJTpYgLsfY5nz7peldnQZrFRgy3jOI0Tu5WKE2qOKRAy3Ab/waFhnzOO0wGyq9JVna/aIkuyNp83Y553qCllSmtsU+2RFtUSNEGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2p5C-0002DI-5h; Thu, 10 Apr 2025 12:24:30 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2p5A-004Fmy-2s;
	Thu, 10 Apr 2025 12:24:28 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2p5A-002ODU-2N;
	Thu, 10 Apr 2025 12:24:28 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 10 Apr 2025 12:24:29 +0200
Subject: [PATCH wireless-next v6 5/9] wifi: mwifiex: pass adapter to
 mwifiex_dnld_cmd_to_fw()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mwifiex-cleanup-1-v6-5-a6bbd4ac4d37@pengutronix.de>
References: <20250410-mwifiex-cleanup-1-v6-0-a6bbd4ac4d37@pengutronix.de>
In-Reply-To: <20250410-mwifiex-cleanup-1-v6-0-a6bbd4ac4d37@pengutronix.de>
To: Brian Norris <briannorris@chromium.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lin <yu-hao.lin@nxp.com>, 
 kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744280668; l=2163;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=ielTtZR3xx01MBPj7eIJpEVIxa/elFoWROV7Rp6I9oA=;
 b=nmxDcgu1pMnRAfCOP9FUa902cPZcpyGQeoMMr7Iz1BZ9NFTWOy4VCUwokyks5PtOTW5Lmxmf+
 bfnngC8E+YGB7HHhyh/VE3C1rGN1LxMOuC28m1vZZnKXAAcoFZHNx2d
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

priv is not needed in mwifiex_dnld_cmd_to_fw(), so pass the adapter to
it as context pointer.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Acked-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/marvell/mwifiex/cmdevt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 1c8d69190be65..1dca09646be27 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -159,11 +159,9 @@ static int mwifiex_cmd_host_cmd(struct mwifiex_private *priv,
  * sending. Afterwards, it logs the command ID and action for debugging
  * and sets up the command timeout timer.
  */
-static int mwifiex_dnld_cmd_to_fw(struct mwifiex_private *priv,
+static int mwifiex_dnld_cmd_to_fw(struct mwifiex_adapter *adapter,
 				  struct cmd_ctrl_node *cmd_node)
 {
-
-	struct mwifiex_adapter *adapter = priv->adapter;
 	int ret;
 	struct host_cmd_ds_command *host_cmd;
 	uint16_t cmd_code;
@@ -742,7 +740,6 @@ mwifiex_insert_cmd_to_pending_q(struct mwifiex_adapter *adapter,
  */
 int mwifiex_exec_next_cmd(struct mwifiex_adapter *adapter)
 {
-	struct mwifiex_private *priv;
 	struct cmd_ctrl_node *cmd_node;
 	int ret = 0;
 	struct host_cmd_ds_command *host_cmd;
@@ -766,7 +763,6 @@ int mwifiex_exec_next_cmd(struct mwifiex_adapter *adapter)
 				    struct cmd_ctrl_node, list);
 
 	host_cmd = (struct host_cmd_ds_command *) (cmd_node->cmd_skb->data);
-	priv = cmd_node->priv;
 
 	if (adapter->ps_state != PS_STATE_AWAKE) {
 		mwifiex_dbg(adapter, ERROR,
@@ -781,7 +777,7 @@ int mwifiex_exec_next_cmd(struct mwifiex_adapter *adapter)
 	spin_unlock_bh(&adapter->cmd_pending_q_lock);
 
 	spin_unlock_bh(&adapter->mwifiex_cmd_lock);
-	ret = mwifiex_dnld_cmd_to_fw(priv, cmd_node);
+	ret = mwifiex_dnld_cmd_to_fw(adapter, cmd_node);
 
 	/* Any command sent to the firmware when host is in sleep
 	 * mode should de-configure host sleep. We should skip the

-- 
2.39.5

