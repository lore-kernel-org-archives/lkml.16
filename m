Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5633E4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443187; cv=none; b=I7F2xxmZPj0YH7KUh2xqP1oXZYVuW1ixG9q2oFKRQ3YilsGbhdcdTydTrFoRRbeHbvB42vVwbsXP0C5KCQAxqTaQUZd68R1s9PAXOgPNu6AXV+5ufL7Sbln1P3J/BoV8XzlMeK8It1uSLpWnItPYbM0RFWp3CY3D9ilexqebPgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443187; c=relaxed/simple;
	bh=Q4MC9uq8B+HOG9jJjlKqzOktfsd+j+Nz19mK29UPkWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VnjEjmmYNPHRzy88EcRTm94bzmMNeoa20GHnCuNmdVm6CJHfGtwMspGO6qbBtaVqR/3awIRwVfM55fxk9L3X2iWS8C5DXhM5LiG/m2rJWoLDCDqJTAKOdwpyQCehA0b12doy0xTvdBYqeqiwZPgbFsooGaU1o8zxOb/6eaUHs0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1uBteO-0001cs-FA; Mon, 05 May 2025 13:06:20 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1uBteN-001DWw-1y;
	Mon, 05 May 2025 13:06:19 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1uBteN-003kn5-1m;
	Mon, 05 May 2025 13:06:19 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Mon, 05 May 2025 13:06:16 +0200
Subject: [PATCH] usb: typec: tcpm: detect orientation in debug acc mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-tcpm-v1-1-e6142985a012@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAKebGGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDINQtSS7I1TUxTDJJSjRPTTRITVYCKi0oSk3LrAAbEx1bWwsAanKAq1Y
 AAAA=
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=Q4MC9uq8B+HOG9jJjlKqzOktfsd+j+Nz19mK29UPkWs=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBoGJurf/Bm1AeGCfK/4gcWTUkox7i0e7RFUTXJY
 NF4t2rwXWSJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCaBibqwAKCRC/aVhE+XH0
 q3LUD/wOgYaJUr6vvJ3EVLNLGjBw9+6kNeNTxYBdCJzKTNpHKJzK3j7sXDllN5BNkgTZibqz7Dx
 EGRxe2c/uf+BIkUs/yxP1yCunbtJSE2FRITDHYsIxB/4Kg3hIDT0tO8IFXWwumefU1fpC8wHepP
 s0aw30Fm7fuoH4wQAk7mDbNMl1EQbIiY6H73XppBkrquCovTeybrz+Mb0HDGyIi3WzS1Dvjf9Wy
 9wkU53CeIARKElORvc770IHhgvmCGkywck+Q93xIJf3Rx+oqfAUfyWCNNgPZg6O/ARcu6yWdISp
 WFBpkYs2EAwb3YJADPXucMDbsTIJzWjE9O16xcfakt5g7IUvet7VxHfzEAfrx8DeNoJg8v0qedN
 6Yb35l/J1SAmTN3YLRuJEohCsc0q5/eTKOGY2V1Dbarugju+x+scddaYvL6rMdYY6PiOzqeG5Q+
 20XhX1uPvM9P70oCYPzJAP62sB/v9pJIoirwjCi9W4mP5pdt7PGkB9p5H4EaC7oS6GgbVrFkm7x
 UGhCyPaGm9tAEqDvMcFmXzh0QFqxpcdQSs/aKH1jjr2A5sduLjzjDsxtHE9hrYEM1x5xCXPHa6r
 aNKyeBXu9oDNpakaU5NgCIGhr7T8IfWvSmwT0TaeR8rBC+K6iok2GPut+Ed31/VaCzQ0QrWYK12
 mpFgn5y2np4oCRg==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

For the debug accessory case, the orientation can be detected by reading
the cc resistor values. The will be TYPEC_CC_RP_DEF and TYPEC_CC_RP_1_5
in sink mode and TYPEC_CC_RA TYPEC_CC_RD in src mode.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/typec/tcpm/tcpm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 784fa23102f90..478e9c80fc8c2 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -611,6 +611,12 @@ static const char * const pd_rev[] = {
 #define tcpm_port_is_sink(port) \
 	(tcpm_cc_is_sink((port)->cc1) || tcpm_cc_is_sink((port)->cc2))
 
+#define tcpm_port_is_debug_pol_cc1(port) \
+	((tcpm_port_is_sink(port) && \
+	 (port->cc2 == TYPEC_CC_RP_DEF && port->cc1 == TYPEC_CC_RP_1_5)) || \
+	 (!tcpm_port_is_sink(port) && \
+	 (port->cc2 == TYPEC_CC_RA && port->cc1 == TYPEC_CC_RD)))
+
 #define tcpm_cc_is_source(cc) ((cc) == TYPEC_CC_RD)
 #define tcpm_cc_is_audio(cc) ((cc) == TYPEC_CC_RA)
 #define tcpm_cc_is_open(cc) ((cc) == TYPEC_CC_OPEN)
@@ -4569,8 +4575,11 @@ static int tcpm_acc_attach(struct tcpm_port *port)
 	if (tcpm_port_is_audio(port))
 		state = TYPEC_MODE_AUDIO;
 
-	if (tcpm_port_is_debug(port))
+	if (tcpm_port_is_debug(port)) {
+		port->polarity = tcpm_port_is_debug_pol_cc1(port) ?
+					TYPEC_POLARITY_CC1 : TYPEC_POLARITY_CC2;
 		state = TYPEC_MODE_DEBUG;
+	}
 
 	ret = tcpm_set_roles(port, true, state, role, data);
 	if (ret < 0)

---
base-commit: 588d032e9e566997db3213dee145dbe3bda297b6
change-id: 20250505-tcpm-41b4ba7ea0ec

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>

