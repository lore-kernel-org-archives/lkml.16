Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2429264A77
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746466368; cv=none; b=mFhl6sQf9RH1YiuLLVYwBTFOYavD+MhM3m2Oi+bEztvUTRKrAUzHIUkuVBLPWqLE8rPCal2qizxMMgeCr48tlyBXQvT+Hctd4E3RGwmJcC9eNSTb/r4fmYhptd7U2ps1oVRkOGmLtPzrwn5VNxlqZXtUoQEhZVXuKWWzcP+jKWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746466368; c=relaxed/simple;
	bh=uXxAR8n0fPcQeh48F1sLbPqGN+YK5mxQPIrLZmz4/4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fSiqbqvWpd7q9xdc+XFozEukGymijh6ylLRpfCrB0qgysiz9qmyAygOL89Vt//XRJoo2mI1IC6f1MCORqHvz+JZIDgPxf9I26Ivlx0rPG+Mi/hZRh0mY0PuJQZ96kMfW9k0zsLPeKdnnzvQWouODljT+vCU1JmtZ12Bv81oqCD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1uBzgH-00059P-JL; Mon, 05 May 2025 19:32:41 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1uBzgG-001GRL-2G;
	Mon, 05 May 2025 19:32:40 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1uBzgG-00CHb5-21;
	Mon, 05 May 2025 19:32:40 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Mon, 05 May 2025 19:32:38 +0200
Subject: [PATCH v2] usb: typec: tcpm: detect orientation in debug acc mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-tcpm-v2-1-71c6a21596b4@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIADX2GGgC/12MOw7DIBAFr2JtHSIW4fyq3CNygfHG3iKAgCBHF
 ncPcRm9ap5Gs0GiyJTg1m0QqXBi7xqoQwd2MW4mwVNjUFL1sk1kG15C46hHcyYjyUJTQ6Qnr3v
 mMTReOGUfP3u14O/9CxQUKOiEWl0vvZGo7oHc/M7RO16PE8FQa/0CHmYoX50AAAA=
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=uXxAR8n0fPcQeh48F1sLbPqGN+YK5mxQPIrLZmz4/4k=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBoGPY4bKHqX7zhgErbDMFYIQyl/qA4Ts8N+ZDqF
 AipRFT94sGJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCaBj2OAAKCRC/aVhE+XH0
 q9dfEACAVRII2DIau5ppoZOTWIIdr49h+Eii3K9VOKE/M+7ZfsjyV9pd3hei2g3+/W3qONFs/Cr
 BLPc5GwQNN/vwuwy6XZBBFhlU707/7lZAuSbM0oCQzvHQ981fdfuPgKzX/XAxk3eJGn/+seYxLm
 yIBK/0H/O+7GNkzhkCGiqdG1KOt50Q6PU6URJVxqm1Q6zMNPCkJcISRC+c4awZlwrJCJwz9pF8x
 /8bgdYYWIrIh094ka7YtxI3vwMzSOwWrLRxj59CjQdO8s/vZwhA+hGGG/qZdbtuwlfX3OTS+Q/2
 i994uxCHeZRy0Jj/iAbj8rhwjSffp2l7Ye8+RJ9VIDNvwkZVYFc69Nn8ZlgRfBOTUb/sQM3fGAP
 roq0KwG7sUfgZNBtG6x7fqnkHIgvUjzLm3q4sokFEITYWp/TZLxOCnqzvLcTKkwlR+4PuymeR9n
 L8UX1rne9hCTx7zCxKn8dq7LQCu8RomFW/4rf3bIoYD+NCo3ta3VpY7Fb+/vCOQx6p6CHm0UpTA
 S1zKFbJ45mAVh/3iJTBOab6zgayY0j+xN8T5hIE3z8waGeyKKadKIMBLFbNLnsdTBFFQfqGAF58
 rLBCQs8dV3wQ+Xou71xPnQGwUorOhCyUHM//F1uDaRYT4EdJODXcIR+2QAW/TJZ9iWSWDVNHk5F
 PYS/if1/EpnnaBg==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

For the debug accessory case, the orientation can be detected by reading
the cc resistor values. The will be TYPEC_CC_RP_DEF and TYPEC_CC_RP_1_5
in sink mode and TYPEC_CC_RA TYPEC_CC_RD in src mode.

Fixes: 64843d0ba96 ('usb: typec: tcpm: allow to use sink in accessory mode')
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
Changes in v2:
- Added fixes tag as suggested by gregkh
- Link to v1: https://lore.kernel.org/r/20250505-tcpm-v1-1-e6142985a012@pengutronix.de
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

