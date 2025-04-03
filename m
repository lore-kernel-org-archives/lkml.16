Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C11AC891
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720198; cv=none; b=hckprYkIl5XEjsOA0leXuk8H4klHXfO6mwB9j2iRqbLwKjfzzJkmwb4beZYTKo/CzXAj6p+gS9rDOXdRTZJNBsV/06hB4KW/8/v7O2U7XSL0vIrC4ydU/kIjTIeO5h7I4RE+CclLihv49TNFddj8SH7qQgau/gUJUl4DhLoP11s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720198; c=relaxed/simple;
	bh=LYXJIzRnYdWGQG63lalgRJrJIO4AjB8nfLP/vU6Wr8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlw566icTQrmjGYfeDiVHMlIg34JepX96vUkVG/RP28PBmCxCLDlj2YKnXlffu246rkqnKF6t8IIyLReMNvqBAVPhUknRDxfk+uFX2/5N1mpumH1LMsXO5zn6wXN1rIXIg4hQznpgJru/me9PT2V+UncSD0XjhBkViyLYocmwb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0THG-0000kE-33; Fri, 04 Apr 2025 00:43:14 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0THF-003AjV-15;
	Fri, 04 Apr 2025 00:43:13 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0THF-004aMT-0s;
	Fri, 04 Apr 2025 00:43:13 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Fri, 04 Apr 2025 00:43:05 +0200
Subject: [PATCH 2/3] usb: typec: tcpm: allow sink (ufp) to toggle into
 accessory mode debug
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-ml-topic-tcpm-v1-2-b99f44badce8@pengutronix.de>
References: <20250404-ml-topic-tcpm-v1-0-b99f44badce8@pengutronix.de>
In-Reply-To: <20250404-ml-topic-tcpm-v1-0-b99f44badce8@pengutronix.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3938;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=LYXJIzRnYdWGQG63lalgRJrJIO4AjB8nfLP/vU6Wr8g=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBn7w8ABKLXszu7I3Ym9gFIxPtY8yQ26+DC+WKH7
 yVXdha0y/mJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZ+8PAAAKCRC/aVhE+XH0
 q1WED/wIIiuQbFJy7Qhejvw4D8q9hMOwncUlGZhfLTBTUHqJhWWy3nP+XJFxB5/h2EqkGKWgnA0
 6JsxaGxAwPrQmaZ4CixjbBVSVQq/6UR3YNG5M04uvMGYjKjdDs8tBfsq/XQdYQvO7Vdc3eGf/W3
 IFLVXuQg0cqBujG8EgvTSlr6Zf3Fy86kSNiDtuNWppytEuAirm0sFx+t+/pVfOnQOK4fxkewtd6
 VnnpjB9gBaMTDbcwBXaJnPrNhXMGbIYKPGmcvIDspDxNiT9GhdW55dGYx36iXUSQJK3aXw0/lBi
 6lftkPhaCIYAABzaEMEiLJnD/LYGkBmmZWURMPdrk1WQiYdELZD/Ao9kuKkkmXliV5amzvpYRKP
 63PCZ6EeS4Pr33TxwbcrlCtIjhy5Vrg9YdIpNQ/x26+H9qSu8mtKZLjCChV4Q8/ISVZtbNCcReB
 7jOxZyRJSiEwTfeu56FLeHKhvJfEPOm/rxwRNcMLVkFz24V+hbdFSVaPVsPcFiZpfPydNoFqN3K
 gRnQVD/rHtpiv4jXiB1lmdw4vlgJ0HzpRmEdZmgLxMkaOBf1VKlY3viE/hhkBm+sJ1p40rGEBPd
 1KQuGZZtABjVc7C5Zddcw7V4xDUXxYQtTqvCA+qK+fPaFTHKy+oof/Qh8NIvFZwk8ltyKn0Tu+q
 M3SyYimtBIJe73w==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

This patch extends the is_debug macro to cover the sink case (ufp). It
also handles the transition to access the DEBUG_ACC_ATTACHED state in
the sink case. It also handles the debounce case in which the cc
pins are not immediately valid after the plug event.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/typec/tcpm/tcpm.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 839697c14265e..01714a42f848a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -67,6 +67,7 @@
 						\
 	S(ACC_UNATTACHED),			\
 	S(DEBUG_ACC_ATTACHED),			\
+	S(DEBUG_ACC_DEBOUNCE),			\
 	S(AUDIO_ACC_ATTACHED),			\
 	S(AUDIO_ACC_DEBOUNCE),			\
 						\
@@ -621,7 +622,8 @@ static const char * const pd_rev[] = {
 	  !tcpm_cc_is_source((port)->cc1)))
 
 #define tcpm_port_is_debug(port) \
-	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
+	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
+	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
 
 #define tcpm_port_is_audio(port) \
 	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
@@ -4969,7 +4971,13 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC);
 		break;
 	case SNK_ATTACH_WAIT:
-		if ((port->cc1 == TYPEC_CC_OPEN &&
+		if (tcpm_port_is_debug(port))
+			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
+				       PD_T_CC_DEBOUNCE);
+		else if (tcpm_port_is_audio(port))
+			tcpm_set_state(port, AUDIO_ACC_ATTACHED,
+				       PD_T_CC_DEBOUNCE);
+		else if ((port->cc1 == TYPEC_CC_OPEN &&
 		     port->cc2 != TYPEC_CC_OPEN) ||
 		    (port->cc1 != TYPEC_CC_OPEN &&
 		     port->cc2 == TYPEC_CC_OPEN))
@@ -4983,6 +4991,12 @@ static void run_state_machine(struct tcpm_port *port)
 		if (tcpm_port_is_disconnected(port))
 			tcpm_set_state(port, SNK_UNATTACHED,
 				       PD_T_PD_DEBOUNCE);
+		else if (tcpm_port_is_debug(port))
+			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
+				       PD_T_CC_DEBOUNCE);
+		else if (tcpm_port_is_audio(port))
+			tcpm_set_state(port, AUDIO_ACC_ATTACHED,
+				       PD_T_CC_DEBOUNCE);
 		else if (port->vbus_present)
 			tcpm_set_state(port,
 				       tcpm_try_src(port) ? SRC_TRY
@@ -5281,7 +5295,10 @@ static void run_state_machine(struct tcpm_port *port)
 	/* Accessory states */
 	case ACC_UNATTACHED:
 		tcpm_acc_detach(port);
-		tcpm_set_state(port, SRC_UNATTACHED, 0);
+		if (port->port_type == TYPEC_PORT_SRC)
+			tcpm_set_state(port, SRC_UNATTACHED, 0);
+		else
+			tcpm_set_state(port, SNK_UNATTACHED, 0);
 		break;
 	case DEBUG_ACC_ATTACHED:
 	case AUDIO_ACC_ATTACHED:
@@ -5289,6 +5306,7 @@ static void run_state_machine(struct tcpm_port *port)
 		if (ret < 0)
 			tcpm_set_state(port, ACC_UNATTACHED, 0);
 		break;
+	case DEBUG_ACC_DEBOUNCE:
 	case AUDIO_ACC_DEBOUNCE:
 		tcpm_set_state(port, ACC_UNATTACHED, port->timings.cc_debounce_time);
 		break;
@@ -5880,7 +5898,8 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 		}
 		break;
 	case SNK_UNATTACHED:
-		if (tcpm_port_is_sink(port))
+		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
+		    tcpm_port_is_sink(port))
 			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
 		break;
 	case SNK_ATTACH_WAIT:
@@ -5943,7 +5962,12 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 
 	case DEBUG_ACC_ATTACHED:
 		if (cc1 == TYPEC_CC_OPEN || cc2 == TYPEC_CC_OPEN)
-			tcpm_set_state(port, ACC_UNATTACHED, 0);
+			tcpm_set_state(port, DEBUG_ACC_DEBOUNCE, 0);
+		break;
+
+	case DEBUG_ACC_DEBOUNCE:
+		if (tcpm_port_is_debug(port))
+			tcpm_set_state(port, DEBUG_ACC_ATTACHED, 0);
 		break;
 
 	case SNK_TRY:

-- 
2.39.5

