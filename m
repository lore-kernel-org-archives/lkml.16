Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8CB280CF5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281313; cv=none; b=GSJshijAe57TAQDBXlYSjPRjvkarLh2EwReXppz0RS66xQgDStzjmv1dc+3tjXAjjwrgu+4QmbBCWKN8UiDuCaZ6FFNqF4tKLMoB9heF836p+MpO2r/Im+bEgN1WbjMIN18vA4EWXf62qvP+K+QKrjfZTVRfHObWq9JMye4BnX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281313; c=relaxed/simple;
	bh=N2EUklR/z9JFHYu0b2d1/TXgABpe7LjJhfgZXh/GMyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sODkSl44XUN34C4Iz1J0E7MPFZS6zCMKx82f5GsGYdIB0ab1mIbszcMjFLHq0bvc0/jeuEKAQuARUeqnziE+4uOb3jwFd5VZ33ram7JlwHmwKm33SO+i/gQxMaNeQi6bYtovoqRw0a2yiaHYEVQrv/8bfRBSMmDYd+NshS/Y9OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2pFS-0004gV-AC; Thu, 10 Apr 2025 12:35:06 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2pFR-004Ftr-2i;
	Thu, 10 Apr 2025 12:35:05 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2pFR-002dX6-2S;
	Thu, 10 Apr 2025 12:35:05 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 10 Apr 2025 12:34:56 +0200
Subject: [PATCH v3 1/3] clk: make determine_rate optional for non
 reparenting clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-clk-cdce6214-v3-1-d73cf9ff3d80@pengutronix.de>
References: <20250410-clk-cdce6214-v3-0-d73cf9ff3d80@pengutronix.de>
In-Reply-To: <20250410-clk-cdce6214-v3-0-d73cf9ff3d80@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744281305; l=1101;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=N2EUklR/z9JFHYu0b2d1/TXgABpe7LjJhfgZXh/GMyc=;
 b=xoyIU0D+nTICp7dPf2on/am/N80Yvsb/UhUHllnpsRJ7u2GJjDhU55mo/TJJ6meGVq/YqmMcl
 InizkW3CHypDozNamFk65XE9v/X8utCAQyBLX0rC4AzIsmtD3uKh+0E
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

With 326cc42f9fdc ("clk: Forbid to register a mux without determine_rate")
it became mandatory to provide a determine_rate hook once a set_parent
hook is provided. The determine_rate hook is only needed though when the
clock reparents to set its rate. Clocks which do not reparent during
set_rate do not need a determine_rate hook, so make the hook optional
for clocks with the CLK_SET_RATE_NO_REPARENT flag.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf5..07ae3652df6c1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3937,7 +3937,8 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
-	if (core->ops->set_parent && !core->ops->determine_rate) {
+	if (!(core->flags & CLK_SET_RATE_NO_REPARENT) &&
+	    core->ops->set_parent && !core->ops->determine_rate) {
 		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
 			__func__, core->name);
 		ret = -EINVAL;

-- 
2.39.5

