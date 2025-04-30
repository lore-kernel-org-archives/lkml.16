Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1A1EEA49;
	Wed, 30 Apr 2025 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996845; cv=none; b=j3awS7/XRPJ3nGgUwrpxrbwx+4TYyea43S6i6PQhhP8N16xbtLVcOyFn9k5Ld8uGhkgNLqtZgAOZAMUyyBkQhTuG3v1/jxGVKGIaPXKLWTdEA3+002zv820WKyvSCKGXswIsknTODFcL3rNghrDGf+RQ10c8igq+POCYKjNvGWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996845; c=relaxed/simple;
	bh=oshNtINoRsSFDWTdpPPGeVt4iGXHtOoyizgpkqWGffU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/5Fo6m+ON9adaBdjgVW5yh3BQcnPoFvVfY7A7rYABgRNvR7HGTkvIA/bU/xMh/Kr8Tr5N0J/7510NWvEEN3aIOoehPR6x8KuS0yMiB/hwCa6PG3II7GLt2aOHSrS1et+igZR051bE+Kag5E2RF+Cp1fni7VqY3xsgbxocawsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec9x780f; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec9x780f"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so6707090a12.1;
        Wed, 30 Apr 2025 00:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996842; x=1746601642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cD6ImneTbZLgrwokJknYjihekSDmHnvYNrVpdSfEU20=;
        b=Ec9x780fE/nSfQD17UV17E3ttnBp9utGTXX8obmRSw+xWztwDLKRE1etlM5Mkn1bj8
         q0BAyQWR8udJMFIqEV5vSPdKeG68WO8KIZ4zCsuYrOFKddxevzkv07ef8bx3Kct2cx6C
         6NnvGlnDVKjLuk8ENy/rr+rFROqt1eQ+MMZR2P1kcXxAwK4jsYOxH/QlqFTycWeZ3QIk
         G0W71mVVOdLsu8+gzcn7pf3szhc/wG2UgWSxl8VqNxZkF4rm9L1BUIg0oFAWsASByar3
         ANH6XijNyHfsvxGfuSVDYZLOXLZjYu3uv4uKHvrtiCswAQjt1Kb7Zc4kpgyCnUri42od
         deDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996842; x=1746601642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cD6ImneTbZLgrwokJknYjihekSDmHnvYNrVpdSfEU20=;
        b=bWuqLruDbhNxmdrsINrjkWT91Up2N8g0yCz+2IW0PUJU4iMuGrfHinSzuksurDGooj
         WCv+RwMiV8A4Y7t1/bXJXo6T5Z1b6MWC5LrYHL3a9Njr0Rw4doXq4mXXZtkZeeda29xD
         UX4/YkO1cNJk5qkkRCwAr0ICJPo4ThRQj6+tun5DmGrSY2q0xXP4df1bNhMTtjoiFpDE
         FEa39S3FArtmofW/2ejVG/RsXdjbVIfZnrR836IuoUEiQKmY45j2zji4/edSM+jmmsM4
         oTgdi8YOzoiPgGA8AUt4GOYZxE71G7O47pgns+HAFGnx1gFnxXQNKhQ/rZsjRKvXvS+l
         HayA==
X-Forwarded-Encrypted: i=1; AJvYcCUXtjcETVLq70bKY3acfNzpREq97g50ahdrponTn/CpxQ2na/SIcHseL2iaZjs16uptiveRxz+TqXSR@vger.kernel.org, AJvYcCVo4TryW64ljoJyo6oE78/NgASarHGrthjtTr0SHf82ff/YbN0kaUBmmenMjONf78g/9ir381I+E6RMwCke@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZGINNWz29Q7XLaXxnkdR7VRa7NmlhgiFiNBHSl/cRtJuS4vG
	OU/GpDHesf1GzoO0Lt5an5p7wEGP+A6oqAWg0uzIS5J2Kegcp0MsDF360A==
X-Gm-Gg: ASbGnct8SMd/5waZ8Qayr3GFGCGgTWMPlSGtQsj/u8WSmvLsJCeIaBfBExua0Hg5Z6H
	y9DKkKpRHHbP0SIilTa35KuJRlsMSx5gvm/yjgBu0AcNoV0KHGIau87lgr51YkL8fnx6sLGEyj/
	lgTjabQeHFOC1mmRWh84tvEFf83OCXyUhIcTPjbLxOsctElY/oaI47d0kKbMWeMDny97mes5WW8
	8bV3HJ1FrQyfcBKMJN7O6GXQwOruLKG4VR70tFAF89JaoGRgSbVAGxuxNuYgFkXxezMx8M9r3lu
	+T+ImlrWd6O26lawRht+eLT71YR2xa4Us7SaK1O7HhLsn3iNUpFiQXvvsFZEm4B4pahqlX4j8eb
	u0roQhg6Z/rE=
X-Google-Smtp-Source: AGHT+IGTmonP8lEQxPUe4+oqb7+h22XT+VgaurBIKax7fSsbyEcBfqFkDB+r6vn3YQ8nh6mF4wMIGQ==
X-Received: by 2002:a05:6402:3908:b0:5de:dfd0:9d22 with SMTP id 4fb4d7f45d1cf-5f89be215b0mr1696983a12.22.1745996842190;
        Wed, 30 Apr 2025 00:07:22 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:21 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:09 +0200
Subject: [PATCH v8 5/9] mfd: bcm590xx: Add PMU ID/revision parsing function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=4951;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oshNtINoRsSFDWTdpPPGeVt4iGXHtOoyizgpkqWGffU=;
 b=NDvp2UQqXb+hpcsJM/1xalrnDkt5HfT8naRR1sH9LrdV5bfruYkKVT+pgO/qdI2Fp9jnpAiJw
 KUHZsQj+6vyBkR2lKABbq+NGQpETqiEjFKp5iHU27TFNrXkBH+6wVl4
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The BCM590xx PMUs have two I2C registers for reading the PMU ID
and revision. The revision is useful for subdevice drivers, since
different revisions may have slight differences in behavior (for
example - BCM59054 has different regulator configurations for
revision A0 and A1).

Check the PMU ID register and make sure it matches the DT compatible.
Fetch the digital and analog revision from the PMUREV register
so that it can be used in subdevice drivers.

Also add some known revision values to bcm590xx.h, for convenience
when writing subdevice drivers.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v8:
- Change PMU ID print from dev_info to dev_dbg
- Unwrap some lines and let them go up to 100 chars
- Drop comment above bcm590xx_parse_version (keep the comments inside
  the function, they make it a bit more clear what's happening since
  it's doing two separate things)

Changes in v7:
- Return -ENODEV on PMU ID mismatch
- Drop "Check your DT compatible" from ID mismatch error message

Changes in v6:
- Adapt to PMUID being passed as device type value
- Rename rev_dig and rev_ana to rev_digital and rev_analog
- Rewrite commit message

Changes in v5:
- Add REG_ prefix to register offset constant names

Changes in v4:
- Added this commit
---
 drivers/mfd/bcm590xx.c       | 55 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bcm590xx.h | 14 +++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 4620eed0066fbf1dd691a2e392e967747b4d125b..12d0db4237e79fcfcb2af4a0d93961b6239a3863 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -17,6 +17,15 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+/* Under primary I2C address: */
+#define BCM590XX_REG_PMUID		0x1e
+
+#define BCM590XX_REG_PMUREV		0x1f
+#define BCM590XX_PMUREV_DIG_MASK	0xF
+#define BCM590XX_PMUREV_DIG_SHIFT	0
+#define BCM590XX_PMUREV_ANA_MASK	0xF0
+#define BCM590XX_PMUREV_ANA_SHIFT	4
+
 static const struct mfd_cell bcm590xx_devs[] = {
 	{
 		.name = "bcm590xx-vregs",
@@ -37,6 +46,48 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+/* Map PMU ID value to model name string */
+static const char * const bcm590xx_names[] = {
+	[BCM590XX_PMUID_BCM59054] = "BCM59054",
+	[BCM590XX_PMUID_BCM59056] = "BCM59056",
+};
+
+static int bcm590xx_parse_version(struct bcm590xx *bcm590xx)
+{
+	unsigned int id, rev;
+	int ret;
+
+	/* Get PMU ID and verify that it matches compatible */
+	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUID, &id);
+	if (ret) {
+		dev_err(bcm590xx->dev, "failed to read PMU ID: %d\n", ret);
+		return ret;
+	}
+
+	if (id != bcm590xx->pmu_id) {
+		dev_err(bcm590xx->dev, "Incorrect ID for %s: expected %x, got %x.\n",
+			bcm590xx_names[bcm590xx->pmu_id], bcm590xx->pmu_id, id);
+		return -ENODEV;
+	}
+
+	/* Get PMU revision and store it in the info struct */
+	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUREV, &rev);
+	if (ret) {
+		dev_err(bcm590xx->dev, "failed to read PMU revision: %d\n", ret);
+		return ret;
+	}
+
+	bcm590xx->rev_digital = (rev & BCM590XX_PMUREV_DIG_MASK) >> BCM590XX_PMUREV_DIG_SHIFT;
+
+	bcm590xx->rev_analog = (rev & BCM590XX_PMUREV_ANA_MASK) >> BCM590XX_PMUREV_ANA_SHIFT;
+
+	dev_dbg(bcm590xx->dev, "PMU ID 0x%x (%s), revision: digital %d, analog %d",
+		 id, bcm590xx_names[id],
+		 bcm590xx->rev_digital, bcm590xx->rev_analog);
+
+	return 0;
+}
+
 static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 {
 	struct bcm590xx *bcm590xx;
@@ -78,6 +129,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 		goto err;
 	}
 
+	ret = bcm590xx_parse_version(bcm590xx);
+	if (ret)
+		goto err;
+
 	ret = devm_mfd_add_devices(&i2c_pri->dev, -1, bcm590xx_devs,
 				   ARRAY_SIZE(bcm590xx_devs), NULL, 0, NULL);
 	if (ret < 0) {
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -17,6 +17,16 @@
 #define BCM590XX_PMUID_BCM59054		0x54
 #define BCM590XX_PMUID_BCM59056		0x56
 
+/* Known chip revision IDs */
+#define BCM59054_REV_DIGITAL_A1		1
+#define BCM59054_REV_ANALOG_A1		2
+
+#define BCM59056_REV_DIGITAL_A0		1
+#define BCM59056_REV_ANALOG_A0		1
+
+#define BCM59056_REV_DIGITAL_B0		2
+#define BCM59056_REV_ANALOG_B0		2
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0
@@ -30,6 +40,10 @@ struct bcm590xx {
 
 	/* PMU ID value; also used as device type */
 	u8 pmu_id;
+
+	/* Chip revision, read from PMUREV reg */
+	u8 rev_digital;
+	u8 rev_analog;
 };
 
 #endif /*  __LINUX_MFD_BCM590XX_H */

-- 
2.49.0

