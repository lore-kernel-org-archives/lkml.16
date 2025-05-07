Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E5F28003F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622242; cv=none; b=PwKtqnYT4x7WyKekJMO6737C9Vz3IDbYFQX7dDWxEqemnio+cRMUGR2XEhGZbGjmHBl5Y55T616BR4hyVyHfhdw6eQV/fql10t1iBOK7gAeuK/rJ6AGUsQ+prpuTrVl00VVSqiHyoocIGO/4cuYL8Yoi56KPrT6MNh8hhHQQjE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622242; c=relaxed/simple;
	bh=L+7igWmrzB3MXXLwtuLEyjoA6CAq6ItWg62jIUmYSgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBW3MQNav876r9JIMMNENYwwXvlkuQe7evgUR95lOsUQDpBVajQVMTzrU4fHtBmW6JRLUPERON+LZTU6wllvRW+RDFuAHwolbJkt7n9v8LbPoBJVGM/iojo1F81iT/PHMfwQRD3xZPz0wk8t9dgsEVMfM0NPhjZfqxwRZanD5p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LmAJzbDI; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LmAJzbDI"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acbb85ce788so345332166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746622238; x=1747227038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjhb9oVUG8lj7hYYtmkJhzYs0Q2lzrIfIpH+FDRUtb4=;
        b=LmAJzbDIIa6oQleSKu2dT59bkNrULYd7Vie3PIRvVLpls+UNL/P15VzZZKSseq8h7/
         QPIvNEQ5zNylT2yaxv6u9l/mc6Hyqpnjd4x1drItDQbjzqg+FqMokz45VESYtD9zcqEx
         dCDfpOYuLG02nZiqRcXibDAsfU5NHuVu2bqLBMHXK8ZEAPCiUq2bk+BB8cUW3hXHbdN1
         8eRAFkUiVVoGvQOfCPDpnIvlySTK616NkRb1QHdSHRCfjThrhjPcjnXQyhNHE0DrR05r
         9MbuCzB87AGhDWSZ97z1cOVr9OSDXIc3bMOAYsNJGhKUwNcxI8Z/PiKpJr2kozm/nxLg
         rJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622238; x=1747227038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjhb9oVUG8lj7hYYtmkJhzYs0Q2lzrIfIpH+FDRUtb4=;
        b=qfhyGdoEWbUE+MAoKCk023DMSsv0EiXSj4prurTlpgnS3ab8GP8pZb7XUfZvNpU3Ac
         CLXivTxqaOgDjaoS0x5QU1548jWwlBvzgJB1Ic37kNIIchQlHAV0lEr1bLH1sj8FOSwa
         oOwp3IGjK/0W88xLJ5xuxMgLiKXdkhf9X/ea/PiMYpDuST1Pal5K8ZfRl0KpALCVeMQn
         6H2HdWRaTKoUW8ozz4AVwj+6x4Hwd9LdE+jQvpoLGMk/OkMdbA7RcQtJ8WzH8rN+12II
         fz3X/Rh1/3R3p4/YWED3raa2x7v4If0jqbIrZN27z8fkoC86Bg0TTv9lhFL+p8Gc44Me
         0kWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNBc2D77WIlThfUW6a//8Jri/PHTO9KSSbYpXeaOcySOoMja4CdWn6T7+m81MjHPgwE66+WPDPURCyqeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAWq8cXrH1q1gDYHjZWe3s3Xk5YkZuMwZcpXuVdkED2g6aJEOZ
	vqpXnZD103uALzyXyBKVzyenpwggT0jLPRzo7o1j3CaWjIYJdYrrz1xTqdQZIBw=
X-Gm-Gg: ASbGncvaDbTM5B9wlnF4r6XbX3BIRtKO5Sy08+MRHQvV1Mj6nRg47IQA7E0O72/tURp
	c4FWhAWZwCCodVjEP+q97qDWKmSKWis40x0teUNDlzNseGXFjt0Fn9bnv3/Lf5177Z+vwYhFrR6
	N4PTVklsddQLcf2p34gN/+AxeZnQCgl+EeyhLylwSdGJua6onUXjz8aJFsBmZO16+UPFfZDFdpw
	D9wctqdABXBsq98F/7av9LP9w8iVZadEjT8dvtrphnaddY48bJmQ3YMVXIry35mUcHilO7RrDyA
	EA0o2nG0pBRBFCrudl6+HUablwfBoHukB/Yk2yElVQFak11KSifuou4fOqW7O5GZHcZwsWc=
X-Google-Smtp-Source: AGHT+IGeR56fcf3ibbnLTGP7y2GNB5PTnIKgbVR+VbLAq/tWAyDh+kKlVjb4q2s7LL9nLtMZbmFZAA==
X-Received: by 2002:a17:907:6ea6:b0:ac7:e5c4:1187 with SMTP id a640c23a62f3a-ad1e8bc319emr239738466b.11.1746622237574;
        Wed, 07 May 2025 05:50:37 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fb4sm913182766b.10.2025.05.07.05.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:50:37 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND v3 1/5] phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
Date: Wed,  7 May 2025 15:50:28 +0300
Message-ID: <20250507125032.565017-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

It has been observed on the Renesas RZ/G3S SoC that unbinding and binding
the PHY driver leads to role autodetection failures. This issue occurs when
PHY 3 is the first initialized PHY. PHY 3 does not have an interrupt
associated with the USB2_INT_ENABLE register (as
rcar_gen3_int_enable[3] = 0). As a result, rcar_gen3_init_otg() is called
to initialize OTG without enabling PHY interrupts.

To resolve this, add rcar_gen3_is_any_otg_rphy_initialized() and call it in
role_store(), role_show(), and rcar_gen3_init_otg(). At the same time,
rcar_gen3_init_otg() is only called when initialization for a PHY with
interrupt bits is in progress. As a result, the
struct rcar_gen3_phy::otg_initialized is no longer needed.

Fixes: 549b6b55b005 ("phy: renesas: rcar-gen3-usb2: enable/disable independent irqs")
Cc: stable@vger.kernel.org
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 33 ++++++++++--------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 775f4f973a6c..46afba2fe0dc 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -107,7 +107,6 @@ struct rcar_gen3_phy {
 	struct rcar_gen3_chan *ch;
 	u32 int_enable_bits;
 	bool initialized;
-	bool otg_initialized;
 	bool powered;
 };
 
@@ -320,16 +319,15 @@ static bool rcar_gen3_is_any_rphy_initialized(struct rcar_gen3_chan *ch)
 	return false;
 }
 
-static bool rcar_gen3_needs_init_otg(struct rcar_gen3_chan *ch)
+static bool rcar_gen3_is_any_otg_rphy_initialized(struct rcar_gen3_chan *ch)
 {
-	int i;
-
-	for (i = 0; i < NUM_OF_PHYS; i++) {
-		if (ch->rphys[i].otg_initialized)
-			return false;
+	for (enum rcar_gen3_phy_index i = PHY_INDEX_BOTH_HC; i <= PHY_INDEX_EHCI;
+	     i++) {
+		if (ch->rphys[i].initialized)
+			return true;
 	}
 
-	return true;
+	return false;
 }
 
 static bool rcar_gen3_are_all_rphys_power_off(struct rcar_gen3_chan *ch)
@@ -351,7 +349,7 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	bool is_b_device;
 	enum phy_mode cur_mode, new_mode;
 
-	if (!ch->is_otg_channel || !rcar_gen3_is_any_rphy_initialized(ch))
+	if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized(ch))
 		return -EIO;
 
 	if (sysfs_streq(buf, "host"))
@@ -389,7 +387,7 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
 
-	if (!ch->is_otg_channel || !rcar_gen3_is_any_rphy_initialized(ch))
+	if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized(ch))
 		return -EIO;
 
 	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
@@ -402,6 +400,9 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	void __iomem *usb2_base = ch->base;
 	u32 val;
 
+	if (!ch->is_otg_channel || rcar_gen3_is_any_otg_rphy_initialized(ch))
+		return;
+
 	/* Should not use functions of read-modify-write a register */
 	val = readl(usb2_base + USB2_LINECTRL1);
 	val = (val & ~USB2_LINECTRL1_DP_RPD) | USB2_LINECTRL1_DPRPD_EN |
@@ -465,12 +466,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
 	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
 
-	/* Initialize otg part */
-	if (channel->is_otg_channel) {
-		if (rcar_gen3_needs_init_otg(channel))
-			rcar_gen3_init_otg(channel);
-		rphy->otg_initialized = true;
-	}
+	/* Initialize otg part (only if we initialize a PHY with IRQs). */
+	if (rphy->int_enable_bits)
+		rcar_gen3_init_otg(channel);
 
 	rphy->initialized = true;
 
@@ -486,9 +484,6 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 
 	rphy->initialized = false;
 
-	if (channel->is_otg_channel)
-		rphy->otg_initialized = false;
-
 	val = readl(usb2_base + USB2_INT_ENABLE);
 	val &= ~rphy->int_enable_bits;
 	if (!rcar_gen3_is_any_rphy_initialized(channel))
-- 
2.43.0

