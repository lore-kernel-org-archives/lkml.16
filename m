Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39E25C83F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340091; cv=none; b=Hob0Dm2XFKDaoFlu51xjtuolIB7JcyQWMU6S8NYHpr0DtUJRKV7sjWiH94wG1FPVJAoucAi9dJ8mht+ookdlgO8jrNEevbev517IGxZE3whdfum2mJL8y4UKkQdRP2grJKDZttgX1dxQOmS8Qsk6EUlaTR/ERokk6iPy4P6Z9QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340091; c=relaxed/simple;
	bh=CKIZW3EachgGJ1sLkSL4h69yq80ir33gZvH+kbjywRk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=La3sMV8rw6QFJzqGjiB65wogJmVb1uzXkGQc/GGxmXvAS6wlL1MsA3fAJOCKUZrMYbTi+4TJRt343MNPZgkCWuyKl9+eQeSv+UVcQbvgg2Zue+9CBkuwjfwUgMhJjqnS9mIergB1EH2C3SweOyRZ9U6Vuex4ByWuulsxWwKbs5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uSFPb-0006RK-JX; Thu, 19 Jun 2025 15:34:39 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uSFPa-004JCY-1W;
	Thu, 19 Jun 2025 15:34:38 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uSFPa-005lCs-1H;
	Thu, 19 Jun 2025 15:34:38 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Subject: [PATCH net-next v1 1/1] phy: micrel: add Signal Quality Indicator (SQI) support for KSZ9477 switch PHYs
Date: Thu, 19 Jun 2025 15:34:37 +0200
Message-Id: <20250619133437.1373087-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

The KSZ9477 family of switch chips integrates PHYs that support a
Signal Quality Indicator (SQI) feature. This feature provides a
relative measure of receive signal quality, which approximates the
signal-to-noise ratio and can help detect degraded cabling or
noisy environments.

This commit implements the .get_sqi callback for these embedded PHYs
in the Micrel PHY driver. It uses the MMD PMA/PMD device registers
(0x01, 0xAC–0xAF) to read raw SQI values from each channel.

According to the KSZ9477S datasheet (DS00002392C), section 4.1.11:
  - SQI registers update every 2 µs.
  - Readings can vary significantly even in stable conditions.
  - Averaging 30–50 samples is recommended for reliable results.

The implementation:
  - Averages 40 samples per channel, with 3 µs delay between reads.
  - Polls only channel A for 100BASE-TX links.
  - Polls all four channels (A–D) for 1000BASE-T links.
  - Returns the *worst* quality (highest raw SQI), inverted to match
    the Linux convention where higher SQI indicates better signal quality.

Since there is no direct MDIO access to the PHYs, communication occurs
via SPI, I2C, or MDIO interfaces with the switch core, which then provides
an emulated MDIO bus to the integrated PHYs. Due to this level of
indirection, and the number of reads required for stable SQI sampling,
read latency becomes noticeable.

For example, on an i.MX8MP platform with a KSZ9893R switch connected
via SPI, invoking `ethtool` to read the link status takes approximately
200 ms when SQI support is enabled.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---

This commit currently focuses on single-channel SQI support due to
budget constraints that prevent immediate extension of the SQI API for
full multichannel functionality. Despite this limitation, the feature
still significantly improves diagnostic capabilities for users, and I
intend to upstream it in its current form.
---
 drivers/net/phy/micrel.c | 112 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index d0429dc8f561..e9cd802ba994 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2173,6 +2173,116 @@ static void kszphy_get_phy_stats(struct phy_device *phydev,
 	stats->rx_errors = priv->phy_stats.rx_err_pkt_cnt;
 }
 
+/* Base register for Signal Quality Indicator (SQI) - Channel A
+ *
+ * MMD Address: MDIO_MMD_PMAPMD (0x01)
+ * Register:    0xAC (Channel A)
+ * Each channel has its own register:
+ *   Channel A: 0xAC
+ *   Channel B: 0xAD
+ *   Channel C: 0xAE
+ *   Channel D: 0xAF
+ */
+#define KSZ9477_MMD_SIGNAL_QUALITY_CHAN_A	0xAC
+
+/* SQI field mask for bits [14:8]
+ *
+ * SQI indicates relative quality of the signal.
+ * A lower value indicates better signal quality.
+ * Use FIELD_GET() to extract the field.
+ */
+#define KSZ9477_MMD_SQI_MASK			GENMASK(14, 8)
+
+/* Maximum raw value of the SQI field (7 bits: bits [14:8]) */
+#define KSZ9477_MMD_SQI_MAX_VALUE		0x7F
+
+/* Delay between consecutive SQI register reads in microseconds.
+ *
+ * Reference: KSZ9477S Datasheet DS00002392C, Section 4.1.11 (page 26)
+ * The register is updated every 2 µs. Use 3 µs to avoid redundant reads.
+ */
+#define KSZ9477_MMD_SQI_READ_DELAY_US		3
+
+/* Number of SQI samples to average for a stable result.
+ *
+ * Reference: KSZ9477S Datasheet DS00002392C, Section 4.1.11 (page 26)
+ * For noisy environments, a minimum of 30–50 readings is recommended.
+ */
+#define KSZ9477_SQI_SAMPLE_COUNT		40
+
+/* Currently only Channel A is supported by the SQI API */
+#define KSZ9477_SQI_MAX_CHANNELS		1
+
+/**
+ * kszphy_get_sqi - Read and average Signal Quality Indicator (SQI)
+ * @phydev: the PHY device
+ *
+ * For 1000BASE-T, all four differential pairs (channels A–D) are polled.
+ * For 100BASE-TX, only channel A is used.
+ *
+ * SQI approximates SNR and varies with cable length, noise, etc.
+ * Lower raw values from hardware = better signal.
+ * This function inverts the value to match Linux convention:
+ * higher SQI = better signal quality.
+ *
+ * Return: SQI value (0–127), or negative errno on failure.
+ */
+static int kszphy_get_sqi(struct phy_device *phydev)
+{
+	int sum[KSZ9477_SQI_MAX_CHANNELS] = {};
+	int avg[KSZ9477_SQI_MAX_CHANNELS] = {};
+	int ch, i, val, sqi;
+	u8 channels;
+
+	/* Determine applicable channels based on link speed */
+	if (phydev->speed == SPEED_1000)
+		/* TODO: current SQI API only supports 1 channel.
+		 * In the future, we can extend it to support all 4 channels.
+		 */
+		channels = 1;
+	else if (phydev->speed == SPEED_100)
+		channels = 1;
+	else
+		return -EOPNOTSUPP;
+
+	/*
+	 * Sample and accumulate SQI readings for each channel.
+	 *
+	 * Reference: KSZ9477S Datasheet DS00002392C, Section 4.1.11 (page 26)
+	 * - The SQI register is updated every 2 µs.
+	 * - Values may fluctuate significantly, even in low-noise environments.
+	 * - For reliable estimation, average a minimum of 30–50 samples
+	 *   (recommended for noisy environments)
+	 * - In noisy environments, individual readings are highly unreliable.
+	 *
+	 * We use 40 samples per channel with a delay of 3 µs between each
+	 * read to ensure new values are captured (2 µs update interval).
+	 */
+	for (i = 0; i < KSZ9477_SQI_SAMPLE_COUNT; i++) {
+		for (ch = 0; ch < channels; ch++) {
+			val = phy_read_mmd(phydev, MDIO_MMD_PMAPMD,
+					   KSZ9477_MMD_SIGNAL_QUALITY_CHAN_A + ch);
+			if (val < 0)
+				return val;
+
+			sqi = FIELD_GET(KSZ9477_MMD_SQI_MASK, val);
+			sum[ch] += sqi;
+		}
+		udelay(KSZ9477_MMD_SQI_READ_DELAY_US);
+	}
+
+	/* Average readings per channel */
+	for (ch = 0; ch < channels; ch++)
+		avg[ch] = sum[ch] / KSZ9477_SQI_SAMPLE_COUNT;
+
+	return avg[0]; /* Return the average for channel A */
+}
+
+static int kszphy_get_sqi_max(struct phy_device *phydev)
+{
+	return KSZ9477_MMD_SQI_MAX_VALUE;
+}
+
 static void kszphy_enable_clk(struct phy_device *phydev)
 {
 	struct kszphy_priv *priv = phydev->priv;
@@ -5801,6 +5911,8 @@ static struct phy_driver ksphy_driver[] = {
 	.update_stats	= kszphy_update_stats,
 	.cable_test_start	= ksz9x31_cable_test_start,
 	.cable_test_get_status	= ksz9x31_cable_test_get_status,
+	.get_sqi	= kszphy_get_sqi,
+	.get_sqi_max	= kszphy_get_sqi_max,
 } };
 
 module_phy_driver(ksphy_driver);
-- 
2.39.5

