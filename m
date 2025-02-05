Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68F422F166
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752249; cv=none; b=eS31mhuy5e1D/rFJVS+7EgnCLLC8G9SD8UC4nc74JYhx6XqJYi4Fw2piwGARTM4vJNmufdGUYUELrA1O6Df5f84QE1x8DJhJ4SA2nt8QGYem2Qcfh7pN4a7YihV38hWv/LVgLQTBWYJUjnAMGrz7Tm+6/p8mif/MK7DNN69iTt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752249; c=relaxed/simple;
	bh=PR2Mqk1KrrHehsosHOryC1HwsemOk4FPwadNczvPXkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gVy8wYy5WpiwSYXvXTOel/LfSZFeNGblJ0icRbPFqu63J4lhcr1okoa7lVWyab8lla5lpYzgzQiASwUQirjeo7ZFIc1IcIU1pESF7ABOGNy02hWPs7wmkBQ60I1pipEo9Xl4l5V0ucWtvT5Oldu4ZwcpHlejwC+etHQLRvAQvKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CgyrMiJ1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sT1mIR8t; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CgyrMiJ1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sT1mIR8t"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnrP38rnbLoU6rYXGj+RFE0S1Z4qH6B4BN3FfNJTeTA=;
	b=CgyrMiJ13+nLtuMWnt74N9S0y0ycJytXwtlryVY1Swq4aio5MVDtZ4Q411ARtAvZkfqXgf
	TAnFMu+y/GfuoCa85YmJ0TgZ41BQ7J09DPZcss3hMVN0+mspJgwsVTs11mKIqWnVvvfpnl
	0qm32IW4U7QcOpt6vnNPJLb709qHwGlL+btdo79ybltLuJso+K8LQSld4SFoZ20/oIh1AM
	xdSP//V5LUncPp0cujGA/3a81N6BdLAhZK/7JMcL4HztxfQ2Acx584Xo5bZJBYIDzJCmki
	SFjnq6mm1HpCd9RLyQOZ6CdoDc9681QbXuotnqrwKbLIzJNDMK+31pDEH+ywIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnrP38rnbLoU6rYXGj+RFE0S1Z4qH6B4BN3FfNJTeTA=;
	b=sT1mIR8tuJzH6WhCHbZkOD/MSsqd3rmpjYXDD5+zx7Ylk1IkmhWcLEjYbGTuqvIGDr4vaZ
	ghYlueNAA1WZLfDA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH v2 20/24] wifi: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:40 +0100
Message-Id: <71fbc442aee9a9e892e475f3bbf8f368c6692a55.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Kalle Valo <kvalo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c | 4 ++--
 drivers/net/wireless/virtual/mac80211_hwsim.c         | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c b/driver=
s/net/wireless/mediatek/mt76/mt76x02_usb_core.c
index 0e1ede9314d8..4840d0b500b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c
@@ -264,8 +264,8 @@ void mt76x02u_init_beacon_config(struct mt76x02_dev *de=
v)
 	};
 	dev->beacon_ops =3D &beacon_ops;
=20
-	hrtimer_init(&dev->pre_tbtt_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	dev->pre_tbtt_timer.function =3D mt76x02u_pre_tbtt_interrupt;
+	hrtimer_setup(&dev->pre_tbtt_timer, mt76x02u_pre_tbtt_interrupt, CLOCK_MO=
NOTONIC,
+		      HRTIMER_MODE_REL);
 	INIT_WORK(&dev->pre_tbtt_work, mt76x02u_pre_tbtt_work);
=20
 	mt76x02_init_beacon_config(dev);
diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wi=
reless/virtual/mac80211_hwsim.c
index cf6a331d4042..fb187a9e984e 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -5548,10 +5548,8 @@ static int mac80211_hwsim_new_radio(struct genl_info=
 *info,
 	wiphy_ext_feature_set(hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
=20
 	for (i =3D 0; i < ARRAY_SIZE(data->link_data); i++) {
-		hrtimer_init(&data->link_data[i].beacon_timer, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_ABS_SOFT);
-		data->link_data[i].beacon_timer.function =3D
-			mac80211_hwsim_beacon;
+		hrtimer_setup(&data->link_data[i].beacon_timer, mac80211_hwsim_beacon,
+			      CLOCK_MONOTONIC, HRTIMER_MODE_ABS_SOFT);
 		data->link_data[i].link_id =3D i;
 	}
=20
--=20
2.39.5

