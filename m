Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5AE231A55;
	Wed, 16 Apr 2025 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786506; cv=none; b=bp/DOgfBtI5YzAAjVrKMbPvm+ch9aqbMfo4C9fuH/8cH9/nzACS5OvHo6j9OqGgFuzA40tUZaO+afLKQ/S3GSlyYcLXDkXV1CpfKF7GBOpLg+XV0EQpTIe/iMA63H7O9rfHHPSzOdSALSUH6ikcqtgC24+ABvjlMyctVIhCZSJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786506; c=relaxed/simple;
	bh=LdqJZkfsrO3LCmSC/7OtcVJEOkHFEt8gdt49MCebZzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/ir2dyX+RxrZyaO7brlW0ieEjHLVQS4SmiSsn8DJgDjK3GQ2k0UqikLq+HNtI5PUO2yUsQc86hoOR4LddUN9eZMko5jI7gyepDn7OcteW9K60fQiHyjI0y1O1tSdSl1A6VL76Ej2+XLoFxS+RrUm8Og7Iajdlq/3A0C2/jv/RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Nk5GKatR; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Nk5GKatR"
Received: from 2001-b400-e2a9-54f6-6e67-7778-9cb9-7043.emome-ip6.hinet.net (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2A06242463;
	Wed, 16 Apr 2025 06:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744786018;
	bh=sM6chi8lTFnRlrr86zejeakRXpamF60oS2LkgrHrDug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc;
	b=Nk5GKatRHD4qM1Pzl/Hj5YyNwjLh6doA8x+xlD4uX8jilA5dbtS9q6oHQ8fr4vRQL
	 WwfZXJO0syHyGE7LMOavRdCZEUGkMzMK2QmD6S6JTXnTMkgfQmaRH/NBvJ8C8xCIwM
	 SYSwnwyFvCrIbl189vq/IBvSChoo6Yv0+9qf9dWBqDTh9eYsoOannJMTEgagBXvo5E
	 xxGXcU4oujOQ3LyJ+2TJKzKrW5gEcsfFpZr7lG2mwCGM/xNbP4lbmdB7WieBpweueS
	 uUJbA46f5p14R2Ilc9SguDJS9UiQJSX/DonkjCU66YoEtEfOjJ1kH+lCGt5bGdX6fu
	 l1SGqwvlseqGA==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Wed, 16 Apr 2025 14:46:26 +0800
Subject: [PATCH 1/2] hwmon: (spd5118) pass spd5118_data to hwmon callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-1-8b3bcafe9dad@canonical.com>
References: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-0-8b3bcafe9dad@canonical.com>
In-Reply-To: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-0-8b3bcafe9dad@canonical.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=LdqJZkfsrO3LCmSC/7OtcVJEOkHFEt8gdt49MCebZzo=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBn/1JbyttZ5/3ZC32UnKPNvHukuYm+MvtCw75gT
 j6Q751LKUWJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCZ/9SWwAKCRBfF7GWSinu
 hjnUD/wOB4mCzbrbcgGgMPd7cl5EJ2hUIsNRpALZG6OBW84wgEF4JOzAIPm+MiJLLoZQ9vA0pIq
 3tj6QIeqFS8oaAXnvC2lw1hDa89Eewl7cLD2P9nnFzV3GBL8Gw8b66rR4KzGMF62wv3t7Z7cf+q
 LmN7MgT759T07YWlJCZCqFcXdWm+7gLd+jy6+iUG3DqBot4Yr/XMdiSLeQ2+sRrRL6dg6j+BopK
 ehhK2K9/C69dFd+jjh9sAX+06ABH2iYBkXTx2QTK8K+kD9ppVIP68g6i46ZpRXsM/iB8VsnBAEe
 Cjga2s9EnmkLqsBhrkfziRNfHWzzmU7iglHxtZy62ewZfx+TDaHEkEdiJ2COYt+4iAi2vBX4mEi
 rabXZaWZPDAAgwHnYEpjWHhNPiUYGAUyODLtZLttUyunP4ZCaU35ZuZ0xOMdW+y2bwIzV7E+eb3
 F0yWXeNMT4L9bATHOSkvXyrRXnBzqs3aSzyKH00zC4juZ41YLOLGVzmpr32InF6h5d5bHhzQCw0
 DM3u2TYEHl2/VcJm1v++gpVvLSWS1jYosGuPe3COdwwP8+iyFDtfrpGVpfEbFqdtJQqAivdeNc8
 tyBhjF8/crmA8pp6cToAUa4Nc9r7hsiHi4mpMqAB4gGE71fiX8TDfrToiPMHmIGUuDZdRyKww2d
 +caeNwBJQgZBH4g==
X-Developer-Key: i=leo.lin@canonical.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86

Currently only the regcache is passed to the hwmon device. Pass the
whole spd5118_data for better flexibility.

Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
---
 drivers/hwmon/spd5118.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 358152868d96..3cb2eb2e0227 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -174,7 +174,8 @@ static int spd5118_read_enable(struct regmap *regmap, long *val)
 static int spd5118_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 
 	if (type != hwmon_temp)
 		return -EOPNOTSUPP;
@@ -256,7 +257,8 @@ static int spd5118_temp_write(struct regmap *regmap, u32 attr, long val)
 static int spd5118_write(struct device *dev, enum hwmon_sensor_types type,
 			 u32 attr, int channel, long val)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 
 	switch (type) {
 	case hwmon_temp:
@@ -269,6 +271,8 @@ static int spd5118_write(struct device *dev, enum hwmon_sensor_types type,
 static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types type,
 				  u32 attr, int channel)
 {
+	struct spd5118_data *data = (struct spd5118_data *)_data;
+
 	if (type != hwmon_temp)
 		return 0;
 
@@ -611,7 +615,7 @@ static int spd5118_probe(struct i2c_client *client)
 	}
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "spd5118",
-							 regmap, &spd5118_chip_info,
+							 data, &spd5118_chip_info,
 							 NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);

-- 
2.43.0

