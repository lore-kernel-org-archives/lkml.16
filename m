Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDD51ACEBB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720198; cv=none; b=lFrHcQ6bY2YxKNaS85J6iHRTJ/qf4U2KKuAm2a8N+Rpp//A9I9rhqjJFfRmXfdBATa2IttiTJipdP5HlZ46J34Ir+0GTiT5zEXZlFBl070RqrsOw/BbinmAXInWitCp0U5aS4xBhhMkwoym9NukdLX3b2YyJFT5s9WRLLit/fxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720198; c=relaxed/simple;
	bh=/saiKlT+3nmRcPtPTyQ7Fq6w/dSPk17B+vlnsaZ2f04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkY8R9OIP+R3J86LnFQWQbO/8i4ef8ES+Q+nDOUXRykBSj7lorz6vGiGlInhjLjzJGhBIEJ1MNas+3vGg4EOoWBMZQvHb6SyZXpHCzHEA34UlE+6MlYmBwpMHK4nC6naJHgnEirSJeCchTS/+5VpW61z4Xa6DlavxqROFePCMjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0THG-0000kC-33; Fri, 04 Apr 2025 00:43:14 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0THF-003AjT-12;
	Fri, 04 Apr 2025 00:43:13 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0THF-004aMT-0r;
	Fri, 04 Apr 2025 00:43:13 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Fri, 04 Apr 2025 00:43:04 +0200
Subject: [PATCH 1/3] usb: typec: tcpm: allow to use sink in accessory mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-ml-topic-tcpm-v1-1-b99f44badce8@pengutronix.de>
References: <20250404-ml-topic-tcpm-v1-0-b99f44badce8@pengutronix.de>
In-Reply-To: <20250404-ml-topic-tcpm-v1-0-b99f44badce8@pengutronix.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=/saiKlT+3nmRcPtPTyQ7Fq6w/dSPk17B+vlnsaZ2f04=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBn7w8AB0xtDmVdQ63eqoS/5SMgGMx/cVpi2FNpP
 uJGVRcLnX6JAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZ+8PAAAKCRC/aVhE+XH0
 qw/4D/9VtUPkv0vKOOuv9jvL/8fZLg8Q3h9mwuuT/7980eplpTU+4yhl5MrtTCob/AXEX+EVHn0
 s93le7o29mERLkrPsWcsRRGG58KsDydZZODyU8SVO1r6eqDztEOSbSW5trLl5Vs/Qb0mQP8L5w9
 1xCcCJPQqZJieoRLniMAJ7IkTHxH0RyW0uLuuYcZGM9xVhl2TnPsBNuS8hF4Hgn9aB6BL09p42Y
 m2beP342DermQ96pgJq0irNhgdS7SRHGNrxPy6e6SRNCZGojjqWamdDXw6j7T1APoDu3TVuFN39
 NCU3F0u4BcF//5hl+x2/6uPgvbqu9QUJPf8O6aeB+p4TAcbUcg27sDLX4kPS6IO1zr4/ag7E+pV
 D53lbkijrJ89+DQeuc3wrh/e/CHWFI08iucSOhWH8ayTJSbRTRJQ9JlLwlbmCSWD3t/NgN/ZTY3
 gJnLu4ADqW3CIg1vzDyMDrfoyw6Y6TLJbfasC4T5+k8eOdJU/APJWSrtf9mKV9et3iZwx5K+Le+
 sjvAB18qkpD9kpMLTg9z+twTxAa/ajzuKKf3D6iVuXiiG84bU9HlPz+fyCn3Ul+NrJpXSwQt+Rw
 /XXUXRAOHILTHnIuyH6UAG4xgiP3fdBduRLMknwu1ubkhu1H9GGBWSmoeoG2T49b2JNCGsoMj9Y
 EeJMAsr/sBMbBaw==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Since the function tcpm_acc_attach is not setting the data and role for
for the sink case we extend it to check for it first.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a99db4e025cd0..839697c14265e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4551,12 +4551,17 @@ static void tcpm_snk_detach(struct tcpm_port *port)
 static int tcpm_acc_attach(struct tcpm_port *port)
 {
 	int ret;
+	enum typec_role role;
+	enum typec_data_role data;
 
 	if (port->attached)
 		return 0;
 
-	ret = tcpm_set_roles(port, true, TYPEC_SOURCE,
-			     tcpm_data_role_for_source(port));
+	role = tcpm_port_is_sink(port) ? TYPEC_SINK : TYPEC_SOURCE;
+	data = tcpm_port_is_sink(port) ? tcpm_data_role_for_sink(port)
+				       : tcpm_data_role_for_source(port);
+
+	ret = tcpm_set_roles(port, true, role, data);
 	if (ret < 0)
 		return ret;
 

-- 
2.39.5

