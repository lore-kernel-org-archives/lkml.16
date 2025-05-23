Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102751F2C44
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748032479; cv=none; b=EA5TB5rsogBtCmdAoYFvvAY6YKPcRVHkKH5lGoEUaaLezKhWwiBM9Wugad/12XO9ipykcESce+y80QIkkXvCaALVTg2r2a9xZoSSJSgxIinUuSLy3TNrwIOR53F7hpDWRIOtYs6uXAdRsiJKytKTImSEZsMxmIMCH9HlqmUVhHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748032479; c=relaxed/simple;
	bh=BpOPhhUmAooZYi+vtPLF6RqGxViWB1xQigFxs2AIdyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l1+9rugdiCCbwdZdMDQzd2ZKW4q9XeDrgCrSB0anjfZJ6c74HreNDlFNAEFBYnk/9srIQJYx/5BB39WnmxbQS4Tf1QHBrqcjkO95tUoaE19iqS/ByjV7zGQt3cfDFU8YO9wqg4v/6bqu3QUcIt9eZM4ZToyC1r1rylb63eKvP0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VniOmcwR; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VniOmcwR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748032476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9huAoqeTCtycjuquWPGnK4R6jNSfK5c2rVHkBsZ7MU=;
	b=VniOmcwRZ0iaMZxZKjsL6x+F0lRYzj5NhCcx/7tKQD+WJt82pRZdO7VLY2XqNECkSIDl8P
	1kzFEfvTtbOdEUv8ZM6hPlRuZXsPTZu7T6xWEmOgfEal/tryPp5zHTfv26qIEk7BZa9waA
	D70KXP8j923XSGmLLEYbKugTfhtP6aQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Lei Wei <quic_leiwei@quicinc.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Simon Horman <horms@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	linux-kernel@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	UNGLinuxDriver@microchip.com
Subject: [net-next PATCH v5 04/10] net: dsa: ocelot: suppress PHY device scanning on the internal MDIO bus
Date: Fri, 23 May 2025 16:33:33 -0400
Message-Id: <20250523203339.1993685-5-sean.anderson@linux.dev>
In-Reply-To: <20250523203339.1993685-1-sean.anderson@linux.dev>
References: <20250523203339.1993685-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Vladimir Oltean <vladimir.oltean@nxp.com>

This bus contains Lynx PCS devices, and if the lynx-pcs driver ever
decided to call mdio_device_register(), it would fail due to
mdiobus_scan() having created a dummy phydev for the same address
(the PCS responds to standard clause 22 PHY ID registers and can
therefore by autodetected by phylib which thinks it's a PHY).

On the Seville driver, things are a bit more complicated, since bus
creation is handled by mscc_miim_setup() and that is shared with the
dedicated mscc-miim driver. Suppress PHY scanning only for the Seville
internal MDIO bus rather than for the whole mscc-miim driver, since we
know that on NXP T1040, this bus only contains Lynx PCS devices.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 drivers/net/dsa/ocelot/felix_vsc9959.c   | 4 ++++
 drivers/net/dsa/ocelot/seville_vsc9953.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/dsa/ocelot/felix_vsc9959.c b/drivers/net/dsa/ocelot/felix_vsc9959.c
index 7b35d24c38d7..087d368a59e0 100644
--- a/drivers/net/dsa/ocelot/felix_vsc9959.c
+++ b/drivers/net/dsa/ocelot/felix_vsc9959.c
@@ -1001,6 +1001,10 @@ static int vsc9959_mdio_bus_alloc(struct ocelot *ocelot)
 	bus->read_c45 = enetc_mdio_read_c45;
 	bus->write_c45 = enetc_mdio_write_c45;
 	bus->parent = dev;
+	/* Suppress PHY device creation in mdiobus_scan(),
+	 * we have Lynx PCSs
+	 */
+	bus->phy_mask = ~0;
 	mdio_priv = bus->priv;
 	mdio_priv->hw = hw;
 	/* This gets added to imdio_regs, which already maps addresses
diff --git a/drivers/net/dsa/ocelot/seville_vsc9953.c b/drivers/net/dsa/ocelot/seville_vsc9953.c
index eb3944ba2a72..28bcdef34a6c 100644
--- a/drivers/net/dsa/ocelot/seville_vsc9953.c
+++ b/drivers/net/dsa/ocelot/seville_vsc9953.c
@@ -901,6 +901,11 @@ static int vsc9953_mdio_bus_alloc(struct ocelot *ocelot)
 		return rc;
 	}
 
+	/* Suppress PHY device creation in mdiobus_scan(),
+	 * we have Lynx PCSs
+	 */
+	bus->phy_mask = ~0;
+
 	/* Needed in order to initialize the bus mutex lock */
 	rc = devm_of_mdiobus_register(dev, bus, NULL);
 	if (rc < 0) {
-- 
2.35.1.1320.gc452695387.dirty

