Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DBD26982D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113648; cv=none; b=D/h3OLx3Pr+Ouk4rjvuYLzZO2yshBFspx23kCvAZ+oqKe/1+wWTT+zi1YrNU3TVdIGsMjWTl8eB4qz1Tc+hlIKSBvXBIh4fd5X+WW7V9nxKPXxE9LsCrfrxjmifVKjcdrWx6f1pJ8293PecgR8T8bkk7ZL3o5AlwENY4OCD5UsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113648; c=relaxed/simple;
	bh=N2EUklR/z9JFHYu0b2d1/TXgABpe7LjJhfgZXh/GMyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GARreTal1ucr5cSmyNSmJ8nG5k6BFn6dnJigW26rUwQKBrv9LnutxvZQsrLnoeqpW9zmg3NwNwKcz9LD16lpCnGJ+FjRNavk1FlHuCHNLKqpDBChenWVoEJSMhzSZtPD6/tkYcUGOL37cRxTMlRINJCl5pw8EogeT2j7LyHh0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u27d0-0000jq-Eg; Tue, 08 Apr 2025 14:00:30 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u27d0-003vQ0-0A;
	Tue, 08 Apr 2025 14:00:30 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u27cz-00GJS1-35;
	Tue, 08 Apr 2025 14:00:29 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 08 Apr 2025 14:00:22 +0200
Subject: [PATCH 1/3] clk: make determine_rate optional for non reparenting
 clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-clk-cdce6214-v1-1-bd4e7092a91f@pengutronix.de>
References: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
In-Reply-To: <20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744113629; l=1101;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=N2EUklR/z9JFHYu0b2d1/TXgABpe7LjJhfgZXh/GMyc=;
 b=OyyNnA4+AWF+wadTy8EM47z/bGUEFtNJi+4ZkN368kkdNEt8nF3sZvzMqrD6ixkfKkaXCcBao
 8d8OpNU19ItDy5Lvmgn5ohnOqvF58GxuMKbuVXgxnMo6h5TeWQ8tuM1
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

