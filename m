Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0821207DE5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661591; cv=none; b=TRi7NGeQ4/4WB71dH381eAGruCIWfg/ZDrSLH6BoTPfLi3y7K9EKZrCfL8Cykl1JckCcr04Mey9nsCi864pAJ8IxW+Dp6Qa+LWei1jMXsItfOSvqWIZvyjEWwXoGP3+DY8kET0ltlo9wi7FRgnU8nLXbOTPSk2sdy5mKc2eGt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661591; c=relaxed/simple;
	bh=FkpyYK4m3ip0KNgZFopQBk/J2GYGeLgznE9PS5/pdHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AL4wv4GwJ/VI9EvJ9RLMUjVmwOgbbqc955l0XAys0onvy56Ow8k0SZ1EGlN319I2VdWX71dMfcqeZ8oxcNyjXpMMvNVOYQ/PFl3Md2DW4G1RpnC2+MVaBnSURU+c51gAW90zgJNUpKaSwgqhD2JYJ0me0p3PyUGaDL83qQ98mAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tfFIR-0002hU-5O; Tue, 04 Feb 2025 10:32:43 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tfFIP-003RRn-2x;
	Tue, 04 Feb 2025 10:32:41 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tfFIP-00ABS6-2j;
	Tue, 04 Feb 2025 10:32:41 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v1 1/2] net: phy: Add support for driver-specific next update time
Date: Tue,  4 Feb 2025 10:32:38 +0100
Message-Id: <20250204093239.2427263-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250204093239.2427263-1-o.rempel@pengutronix.de>
References: <20250204093239.2427263-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Introduce the `phy_get_next_update_time` function to allow PHY drivers
to dynamically determine the time (in milliseconds) until the next state
update event. This enables more flexible and adaptive polling intervals
based on the link state or other conditions.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/phy/phy.c | 28 ++++++++++++++++++++++++++--
 include/linux/phy.h   | 13 +++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index d0c1718e2b16..77ed7bfdf200 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1501,6 +1501,25 @@ void phy_free_interrupt(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_free_interrupt);
 
+/**
+ * phy_get_next_update_time - Determine the next PHY update time
+ * @phydev: Pointer to the phy_device structure
+ *
+ * This function queries the PHY driver to get the time for the next polling
+ * event. If the driver does not implement the callback, a default value is used.
+ *
+ * Return: The time for the next polling event in milliseconds
+ */
+static unsigned int phy_get_next_update_time(struct phy_device *phydev)
+{
+	const unsigned int default_time = PHY_STATE_TIME;
+
+	if (phydev->drv && phydev->drv->get_next_update_time)
+		return phydev->drv->get_next_update_time(phydev);
+
+	return default_time;
+}
+
 enum phy_state_work {
 	PHY_STATE_WORK_NONE,
 	PHY_STATE_WORK_ANEG,
@@ -1579,8 +1598,13 @@ static enum phy_state_work _phy_state_machine(struct phy_device *phydev)
 	 * state machine would be pointless and possibly error prone when
 	 * called from phy_disconnect() synchronously.
 	 */
-	if (phy_polling_mode(phydev) && phy_is_started(phydev))
-		phy_queue_state_machine(phydev, PHY_STATE_TIME);
+	if (phy_polling_mode(phydev) && phy_is_started(phydev)) {
+		unsigned int next_update_time =
+			phy_get_next_update_time(phydev);
+
+		phy_queue_state_machine(phydev,
+					msecs_to_jiffies(next_update_time));
+	}
 
 	return state_work;
 }
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 19f076a71f94..d5cf979f4a6b 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1273,6 +1273,19 @@ struct phy_driver {
 	 */
 	int (*led_polarity_set)(struct phy_device *dev, int index,
 				unsigned long modes);
+
+	/**
+	 * @get_next_update_time: Get the time until the next update event
+	 * @dev: PHY device which has the LED
+	 *
+	 * Callback to determine the time (in milliseconds) until the next
+	 * update event for the PHY state  machine. Allows PHY drivers to
+	 * dynamically adjust polling intervals based on link state or other
+	 * conditions.
+	 *
+	 * Returns the time in milliseconds until the next update event.
+	 */
+	unsigned int (*get_next_update_time)(struct phy_device *dev);
 };
 #define to_phy_driver(d) container_of_const(to_mdio_common_driver(d),		\
 				      struct phy_driver, mdiodrv)
-- 
2.39.5

