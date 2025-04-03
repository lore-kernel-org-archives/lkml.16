Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A102E62AE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743718888; cv=none; b=jRpYIhF6O0RHUPH+/ZUmpGY2PEbnRMapeDifeN07pPZ0AyqDeSpSpMBI1A2/GVKQplSlJeg2bC9piTdcNYWj4SQyR9zwZGlpCsQIqlnsK4unlppzQrcSqfPcawg0W4IBVpVAwXzQqw6oUh1iVFW5a71rRJoU7YMnkJ6BNz/2x0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743718888; c=relaxed/simple;
	bh=xZbKHATwgzlto9VB+6ctPn+t/pyRlRiza9WY5y99mjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f2cJLeSKG9fUav51MNTajy8F0jV8VJhIYTJbeX/a5tAxvbpXtxzCiKV4KXbC/EyznCeO+a8P9YcwGvmUJnJ7YakzDBJjRmZuXa8VXUge6p2D9NNto5bK9WetVnok6Rz5SviKmoMGA6pEwdpdTDVihZdmsd+yr/9wBDThh2RKBrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0Sw0-0007zP-Nh; Fri, 04 Apr 2025 00:21:16 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0Svz-003Ad9-29;
	Fri, 04 Apr 2025 00:21:15 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0Svz-004X5f-1x;
	Fri, 04 Apr 2025 00:21:15 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Fri, 04 Apr 2025 00:21:01 +0200
Subject: [PATCH] usb: typec: mux: do not return on EOPNOTSUPP in {mux,
 switch}_set
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-ml-topic-typec-mux-v1-1-22c0526381ba@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAMwJ72cC/x3MQQqAIBBA0avErBvQ0EVdJVqkTjWQJVphRHdPW
 r7F/w8kikwJuuqBSBcn3rcCWVdgl3GbCdkVQyMaLZRQ6Fc89sAWjzuQRX9m1KY1QqpJOuOghCH
 SxPmf9sP7fgGoWc1kAAAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=xZbKHATwgzlto9VB+6ctPn+t/pyRlRiza9WY5y99mjI=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBn7wnbkw5mBibVC8FpLe0vWnFk1fo/DOGTDNl0R
 iE+yLCPMr2JAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZ+8J2wAKCRC/aVhE+XH0
 q7PTEACABzO6rbbad/vQgrwL7mlVSJ+EFD1x7mk5h72i2f6fppE8RXgKwABTOChplCbI3VltZvq
 Jsj8V5dOs0zLaPo3I/SiNnL/P5jH/TjTVEGjVG15wsig4O4Fi2QQZ96x9tdFNL9TXlv5dDbC7lO
 GtPR6lViZL0sSQX6Uo1jOwUyrrUEKk+Ak2yroBqSdCwEo9zmBx1P20QihxYg2+xeHNMaO+UfjYg
 KC5RA4HFF2dwFRs864IOvXH6IEOipQpyBSrlzkvrcimkijrQUvDsgYnbrdYMmOPf6iA+0BsLUy1
 UP+xL7XyEvPV5d7PqQlM6gd/quy8ojm4KBn+V3lxDNItktqmeXHmyQ85yLxpW1VvGNQgw8c3C9R
 1M3sACtB3S9oanpflWFN5tG8jirYz8Zct6VReyem1rIXWs8suAEmDQxLUjFN5IuvegCwh4qNwT9
 46kinrdJNWQufLJMCtxy6xCTuBNyYSRfqZF3T23BmuIoYHU5HqyOdzPSmqaQ7faAhqpEXaba4PW
 sB7oUStKBunv/sX2IFQVNgc1xbkw8mOzUrbFH282/rLvRv9pXqtVF2RImyf6EtldCB6aXW1/cN9
 pS8gMbOVXBXP2H97sg6I9tCeXvcRSCV3NBDq8cNqd/m5ROTMxim9FchHHj1rkhA7EOWJjDZJGTj
 vO4HhnQlAgQoTIg==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Since the typec connectors can have many muxes or switches for different
lanes (sbu, usb2, usb3) going into different modal states (usb2, usb3,
audio, debug) all of them will be called on typec_switch_set and
typec_mux_set. But not all of them will be handling the expected mode.

If one of the mux or switch will come back with EOPTNOSUPP this is no
reason to stop running through the next ones. Therefor we skip this
particular error value and continue calling the next.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/typec/mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 49926d6e72c71..182c902c42f61 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -214,7 +214,7 @@ int typec_switch_set(struct typec_switch *sw,
 		sw_dev = sw->sw_devs[i];
 
 		ret = sw_dev->set(sw_dev, orientation);
-		if (ret)
+		if (ret && ret != -EOPNOTSUPP)
 			return ret;
 	}
 
@@ -378,7 +378,7 @@ int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
 		mux_dev = mux->mux_devs[i];
 
 		ret = mux_dev->set(mux_dev, state);
-		if (ret)
+		if (ret && ret != -EOPNOTSUPP)
 			return ret;
 	}
 

---
base-commit: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
change-id: 20250404-ml-topic-typec-mux-5b9b014f1dbd

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>

