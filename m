Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A04D20B7ED
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602596; cv=none; b=J0S6wuLvHR1HHU6/YIFdYtp01e/V1+WeLarqaQkABxtgKEQuQCspOMnL6hjjbYWBv/J6IPVMyvBWVIJYNoHiEnxDUtxD6t2lV7uPbpfuq/jRjTX10+N4Rc06dUwE9oQjrjBuAUAHuqv1/yeIobIgolNc80zSnAr7Y+ZL8YpUmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602596; c=relaxed/simple;
	bh=SXFqC3GVQkD/2PTYtutR27FxaGFkclss2JtUVCOlaeY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dk0L3YswyogstaMObhGKSCvDgWIZpamwcBWC88rWSr/c4FZdXsrhFSCn70kqZUGYASk5slSaVeYw6wAGmHm/63aDP+2CDsw53KclNx2XEJCBsm9kL4w+zoifoWGy5MesVZaJdgHXaqy07BbuKfk8c8X7k4lfj0rxmb3Zwi65hvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=FAH1Wn6x; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="FAH1Wn6x"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dca4521b95so3188942a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1738602591; x=1739207391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eksEQebHQVa7hAdVv6wfTibFsvEsjwpBHgMoKU8/cxg=;
        b=FAH1Wn6xu9xvEzXRDXzDgiFv8tIQKwBcgeFS6fmKluD/fa9DJluquB9Q85Q3soYuUP
         7H6OUp/aveIfnNjI6so31lJIqCIcoAQ09H0JEmAgceLr6PVDcLvwxK47vNVoOuheFwd1
         JN7WVTRf03CcpGlI8VLwlvJX5wqswWVIMEAe0icbsXY0dkwKVcZMpbwQqH4EgRrsZ/q7
         ea94JNIF0xfkibwHWaGVmOSfziR21CmKNoH1V50soNFbNuhffsBHROAVJzfgIPNaukSG
         oElVh4DJlegDDI0UvY1QD+rdKQvAUaEZM+euWtbh0TxWwaemlqIqGAYD3TbrcR+2IdTh
         TUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602591; x=1739207391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eksEQebHQVa7hAdVv6wfTibFsvEsjwpBHgMoKU8/cxg=;
        b=rNjnQArCfvF4ZvbiroqT/RQay4Tss1RP/Yt2yqUqkZJGUeuTCcoYFbfMUZBC4AOkO+
         sNR3XU+6O4iK+gMzAYYQVdVjL64dljCld+mJ5MMVrWmtA7KH1DIIBKqaaY2DvSGbt1Zu
         Vm3ZcUnvcXGy4aJlm/3vxe+1VdP2A0zjauq/0uoqojWUckHyxfTMG/BGpj82D7Et1RIF
         og8nJdANrtGYvrsFZOd8wZw4E1ecd82wo0juA2ems8AJsvAcqrFn+yo3Cr6E1+Xt9pH4
         HBZme85gO3/RynP7ve6Kb/X+7sRS6LbGeTQb/vpbmkqbYhpuG6NVneNW3BrcihQ+r2up
         wkOw==
X-Forwarded-Encrypted: i=1; AJvYcCU5HGBqJ3H9K3hDkjMgudusMj0qQyvmUGTe1nPWZZkNyzQcTsTAaK0NKA5ZZXnlH4UAbi6IejiHH+z9wdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJv5u3agEWaPtGkksXUBf6xoLfTAtBTp/OwplekzUM0krfJtAj
	xHxIVXYcYgelxts2p3qY4dEw+L98aYE6CqBLqNjkzPE6AwgOiQiEeMF4q+kJ6kY=
X-Gm-Gg: ASbGnctZ1l5wfpuCw01I4J7lge1QPOp2ZIgr/gBH7chagJC6fx1pAM+uOoOcxmGrgUe
	RTF08H18uFiDYjr8BbgArmHQD1EgvYx+G+YbmVbHO2Sf/sbyr1bC9xjyzG0PhVaODwzFZeydpT1
	XQTh8PkdugGKFrEhNTkmxL2PfV3MCNDm3rH2b8CieRJk9wjX61kDONOTyKF9J8ulJEAID5sH1v1
	jmYE27PFKI83S82fguxuVtPi4nekZLgLS6c9dMH2EabvOObJgdQLOm/zpbBLm5WCL8OPqdVQTBR
	vnSZc2o8IttQNjc=
X-Google-Smtp-Source: AGHT+IHm3lvdOVBK08x71NIQ4g8uOHa3z7Flg3SfLzj55T4B2PjV/ugNB/4jIcX7xqSKo29Zb5cA/g==
X-Received: by 2002:a17:907:d30c:b0:ab6:eec5:a7cd with SMTP id a640c23a62f3a-ab6eec5aa1fmr1902610666b.32.1738602591169;
        Mon, 03 Feb 2025 09:09:51 -0800 (PST)
Received: from cobook.home ([2a02:810a:b8b:f900::9891])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47f2071sm778794066b.85.2025.02.03.09.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:09:50 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net-next] net: renesas: rswitch: cleanup max_speed setting
Date: Mon,  3 Feb 2025 18:09:41 +0100
Message-Id: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was observed on spider board that with upstream kernel, PHY
auto-negotiation takes almost 1 second longer than with renesas BSP
kernel. This was tracked down to upstream kernel allowing more PHY modes
than renesas BSP kernel.

To avoid that effect when possible, always set max_speed to not more
than phy_interface allows.

While at this, also ensure that etha->speed always gets a supported
value, even if max_speed in device tree is set to something else.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 48 ++++++++++++++------------
 drivers/net/ethernet/renesas/rswitch.h |  1 +
 2 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 84d09a8973b7..4b4e174e3abb 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1308,37 +1308,41 @@ static struct device_node *rswitch_get_port_node(struct rswitch_device *rdev)
 
 static int rswitch_etha_get_params(struct rswitch_device *rdev)
 {
-	u32 max_speed;
+	struct rswitch_etha *etha = rdev->etha;
 	int err;
 
 	if (!rdev->np_port)
 		return 0;	/* ignored */
 
-	err = of_get_phy_mode(rdev->np_port, &rdev->etha->phy_interface);
+	err = of_get_phy_mode(rdev->np_port, &etha->phy_interface);
 	if (err)
 		return err;
 
-	err = of_property_read_u32(rdev->np_port, "max-speed", &max_speed);
-	if (!err) {
-		rdev->etha->speed = max_speed;
-		return 0;
-	}
-
-	/* if no "max-speed" property, let's use default speed */
-	switch (rdev->etha->phy_interface) {
-	case PHY_INTERFACE_MODE_MII:
-		rdev->etha->speed = SPEED_100;
-		break;
+	switch (etha->phy_interface) {
 	case PHY_INTERFACE_MODE_SGMII:
-		rdev->etha->speed = SPEED_1000;
+		etha->max_speed = SPEED_1000;
 		break;
 	case PHY_INTERFACE_MODE_USXGMII:
-		rdev->etha->speed = SPEED_2500;
+	case PHY_INTERFACE_MODE_5GBASER:
+		etha->max_speed = SPEED_2500;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	/* Allow max_speed override */
+	of_property_read_u32(rdev->np_port, "max-speed", &etha->max_speed);
+
+	/* Set etha->speed to one of values expected by the driver */
+	if (etha->max_speed < SPEED_100)
+		return -EINVAL;
+	else if (etha->max_speed < SPEED_1000)
+		etha->speed = SPEED_100;
+	else if (etha->max_speed < SPEED_2500)
+		etha->speed = SPEED_1000;
+	else
+		etha->speed = SPEED_2500;
+
 	return 0;
 }
 
@@ -1412,6 +1416,13 @@ static void rswitch_adjust_link(struct net_device *ndev)
 static void rswitch_phy_remove_link_mode(struct rswitch_device *rdev,
 					 struct phy_device *phydev)
 {
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
+
+	phy_set_max_speed(phydev, rdev->etha->max_speed);
+
 	if (!rdev->priv->etha_no_runtime_change)
 		return;
 
@@ -1431,8 +1442,6 @@ static void rswitch_phy_remove_link_mode(struct rswitch_device *rdev,
 	default:
 		break;
 	}
-
-	phy_set_max_speed(phydev, rdev->etha->speed);
 }
 
 static int rswitch_phy_device_init(struct rswitch_device *rdev)
@@ -1462,11 +1471,6 @@ static int rswitch_phy_device_init(struct rswitch_device *rdev)
 	if (!phydev)
 		goto out;
 
-	phy_set_max_speed(phydev, SPEED_2500);
-	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
-	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
-	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
-	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
 	rswitch_phy_remove_link_mode(rdev, phydev);
 
 	phy_attached_info(phydev);
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 532192cbca4b..09f5d5e1933e 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -920,6 +920,7 @@ struct rswitch_etha {
 	bool external_phy;
 	struct mii_bus *mii;
 	phy_interface_t phy_interface;
+	u32 max_speed;
 	u32 psmcs;
 	u8 mac_addr[MAX_ADDR_LEN];
 	int link;
-- 
2.39.5

