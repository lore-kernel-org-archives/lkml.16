Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FCE2561BB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744911641; cv=none; b=bYOIn7rjhhVCikLcZbn2mYfka6+MSeDVdPUXaaRDOW5hr+ZJWuqiJf/KBIAtd8t8kW8Z/R1x9YOhTgHK66JlC0gIjXofCaeozQaO1myU2IjK+3mSLmXXmq6Wx2vtAdPv3uPIi4mqIdPT5MfpN5o9dzIKqfZ/LnvA3ULidiW9brg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744911641; c=relaxed/simple;
	bh=KQBKxbaVe63fu/O/4ha9V5nRgofS7Z/e1L61wF48buY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Iko6bRV5a7Pfs8ejwNzwLYUvF7nk3wlLPuJGmva7PBwcjPepmGu0rHhS4/uLsG9kFNTy3GCVntdqTIi388wNYXGsviLpuJK3k9Fk6gbROucHxNgwfUY7rup9BNROC7nwi1pUWJjsy1tXcFqbd5KBj+D/UXmG0ca5PMb9tuLU2h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u5TDv-0006JN-BW; Thu, 17 Apr 2025 19:40:27 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u5TDu-000n0w-1O;
	Thu, 17 Apr 2025 19:40:26 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u5TDu-00198A-1A;
	Thu, 17 Apr 2025 19:40:26 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Thu, 17 Apr 2025 19:40:17 +0200
Subject: [PATCH] usb: dwc2: also exit clock_gating when stopping udc while
 suspended
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-dwc2_clock_gating-v1-1-8ea7c4d53d73@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAA9AWgC/x3M0QpAMBSA4VfRubZiaHgVSevsbE402oSSd7dcf
 hf//0CkwBShzx4IdHLkzSeUeQY4a+9IsEkGWcimqEslzIVywnXDZXL6YO9EozrdKovGdhWkbg9
 k+f6fw/i+H0CLtAFjAAAA
To: Minas Harutyunyan <hminas@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=KQBKxbaVe63fu/O/4ha9V5nRgofS7Z/e1L61wF48buY=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBoAT0J9MbWVW8dLjn/LbXr1wAnJ/DiRji3wFbGA
 sB43PgAqouJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCaAE9CQAKCRC/aVhE+XH0
 qz15EACsplTgm8stnjnf6hPHvNH2VW7uzCctFYkG2IDAit5VFrM2v6VE3N1FbN3AKxPrkXxWWNh
 Za6XRHApz7fYNeVuK1yNEl+vzuAcwC/1vzHxRS6+mKWdLf7GQzDTv4g4mQu2PMgNFiCjiKfT0WJ
 zwhijIM9QmAabIirhwclhnOsTP/mko936jSSL6dkMHOaH/oGQ/6DA7uAxJtJqGnlU2TNQ7dybDe
 48z03U+P0eN/JlVe63yvKWRGO0zKAUZk7LHcYPaflqGSaSRax+nbLAtII+/F5M86d2B9W/hf8Yt
 D2TiOnz1VZXtso+tO9Pk5ESs4b58Bu8B9wnZfydtX/ol/u3en1CSN7I3l9u25m71cwZrU3OmZSl
 sBgAZgkW9sdof4QbBwm8mZTjmba+fz3C1PLMU9w+tc87p3pywgCo8SQM1V2UcZSTORbXWLu5zmv
 fD+6nD++otTfPHW0hbwXPCXfK3aqQlFqAwn/PiJ05GvMx3MRsjppDxJK1BY0F0swMkVwx9MwI6X
 aLRCZRFr3VrdC1w9oHWL/W3Qt0KBIpqyVnvmJVAKJGFujg7/wWg3rzxm9l3QOip1iL+lpukiDDu
 7ESitrWIkkPWxKHdX0XX/ewctS/qPt0nvLzr/9NbAWC207o+iuy+yGqTuBm7Bz0R0tK2d/GLFrR
 KESLDqS2tiG7T3A==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

It is possible that the gadget will be disabled, while the udc is
suspended. When enabling the udc in that case, the clock gating
will not be enabled again. Leaving the phy unclocked. Even when the
udc is not enabled, connecting this powered but not clocked phy leads
to enumeration errors on the host side.

To ensure that the clock gating will be in an valid state, we ensure
that the clock gating will be enabled before stopping the udc.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc2/gadget.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 300ea4969f0cf..f323fb5597b32 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4604,6 +4604,12 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 	if (!hsotg)
 		return -ENODEV;
 
+	/* Exit clock gating when driver is stopped. */
+	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE &&
+	    hsotg->bus_suspended && !hsotg->params.no_clock_gating) {
+		dwc2_gadget_exit_clock_gating(hsotg, 0);
+	}
+
 	/* all endpoints should be shutdown */
 	for (ep = 1; ep < hsotg->num_of_eps; ep++) {
 		if (hsotg->eps_in[ep])

---
base-commit: cfb2e2c57aef75a414c0f18445c7441df5bc13be
change-id: 20250417-dwc2_clock_gating-579a87fcdf93

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>

