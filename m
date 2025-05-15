Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140541FBCB1;
	Thu, 15 May 2025 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318605; cv=none; b=B4yOx8gHwOI3WAsrzIjxQlJbtcTCJqHo0b/MCZfIy9Al0RcTLZ9n/feO5DXVU2jSJ6zu5YanS8VtLex2wDQ7S04bIRrk3/l/OnBg4PQ8sJ97Ra3QRgmCS7UhwqcB2QIKXQm/j4EZ/zcCMfu0npglPjjXvlWCFEaAVxymQK1nn60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318605; c=relaxed/simple;
	bh=7r2n9E5maekIC6E/9ReFUMYNXP68DM7OrhQ/lKISE6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFNoOzyEN4Eruabins+EnQrwYCH7lx0oI2MbWpR9HOOc4lxWEsWxGS4X++70Q5Defafe8QVRsuR9W9oKniwbNGTBU8DE6UAEdGh6n4wrh42/Y9yDViTWP9nTGlDumRQyBdbDePs1+YfvkzpdtTQ0jjBpFsL6zbCSzVMX378KCbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxxTiWZZ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxxTiWZZ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fca2805ca4so1621413a12.1;
        Thu, 15 May 2025 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318600; x=1747923400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/WfdUoQ5QD4GDYBilFtU0HBfo7TFHkHqD8++md7MIY=;
        b=jxxTiWZZhdtNC83k3I37/Fdr62JlIQC91ffOK9k8MoVOvWNQWvWV8ZknaEZHRsKE4i
         iNIsV6M61jKX5bAaScthxyzJoZk9SutDCJwsoq/N5brUxU89IeYX/f2B4anoqAuEJW73
         v4nrQaBjEpzSGpxrHXEm6XNBS1p9Esa58+hm9fTKglInFsRQOWBKqYT7tsyzwdRdz+zY
         TWZ1ZQVEHIhrmdkzw6yFjzriedLvhZREpX/88sQTf4dX1WBRJDiLoN3FYseMpUmlfuy2
         6ejtZ/e+OxIOpyqWyV/QuGPUb68aX5mcKoSsIhOeeZVe8jAEuB6p7Eim4NQL2+3t0D5n
         DSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318600; x=1747923400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/WfdUoQ5QD4GDYBilFtU0HBfo7TFHkHqD8++md7MIY=;
        b=R2ebhYcTFr5TJtKfz8hWcwLXRxM4mzDgWhq3w/KaDd8PbHhhMHkBRsritsI1ZdjDFT
         VUc5IbzP5xnJCaPcgTU4WkHsLGBc7Xb/L7VxB095sDNqp0FZJNOWz47VscnmgYbaNhOY
         dFd7WXTYhZhXAnraCezH9kFbG7awCcEdwUO6dALUOZKC4C7nu89HYylaOTO8WCfqMk5R
         vKYNpm2ssQ3NRF+NmoSYY3y84MOvg4AlIkXBI5thBbn8OMCz86Wm5S0MZANFfc/TMDf/
         4JJUSvb32YSmrM0jWjx4eKfc2coY+cNW/i7WvQ+2j8BCCwXwSYNYHmdIWVUFxo8wjI8j
         xJxg==
X-Forwarded-Encrypted: i=1; AJvYcCVZSnqc2KojxGtgB+aR68mwTQYTqNbX5NWTIgSTvZFsD7ndB9rJddF73cJu5PdrSRdLxGgC8n3TeRKCfLQ3@vger.kernel.org, AJvYcCXRdz+Uh1eUji18OgaBwp3DG+NyPzj2TvvOG+q5BmHTz2OVeOjMjGASUHsgdz9UFyZojP7n4Rdcgw6L@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZiSvW/Si0GbGKefssIV4Q7zR5T1wDN/8yk2jARpaZN1HyyOo
	Ax+Kv+5Irpn9QQCDB1ULlQl/2DjyF39WfeciZEkIGeacCHA4ODK7
X-Gm-Gg: ASbGncsKy8cQQZvd/fTPXw8gk39wacF0p1n9TeummLv0Q9ccf87ZZrI60CK+5/2HHZu
	xvEfV+CS41BgA/8jW8PJ5fZvKhxa2vIiJz3FgCpoQ9Mh+7eFR9G+u9hT0zsppWVTf1hjzkUBoU7
	G5F7SznV9IoZhHnAyTxuDJ5eu186cftgmkHpfP0iAVvHhFRgdD3gbU4yy0a4GZmrwZNdIYDuYKq
	EMfa3SGO7KJ3J6y4oES6bkcFww/nQK4vntXBd4cXc2LTaeM3sSJqmt3Jg6o/0sq4NEOMgZ0gQf3
	3Z8Ggylicr1rT9rvto/KHAAQuIO6G2WtF+fa77IVKbR8XxEcGkR30Cb7VE3sjuNqFJdhFjJuWf0
	xITOsUDS4Ym1EeWfl/ig+tw==
X-Google-Smtp-Source: AGHT+IEhyNkA8VJM9/cJc7DMu/0IOaUkfY0AVt3v1S+4Tfr+/lPZznmy4RVgI8KquchWx9x3Q2hFNQ==
X-Received: by 2002:a17:906:3384:b0:ad5:1bf5:491d with SMTP id a640c23a62f3a-ad51bf553c2mr147419266b.59.1747318600018;
        Thu, 15 May 2025 07:16:40 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:39 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:31 +0200
Subject: [PATCH v9 4/8] mfd: bcm590xx: Add PMU ID/revision parsing function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-4-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=5066;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7r2n9E5maekIC6E/9ReFUMYNXP68DM7OrhQ/lKISE6k=;
 b=C9WPeMJxWx8zoGh32NInJgnukZPwWI+VD16PmrEOepg024tBcuUQMSbekkWl5t1vq4tMF7wFb
 am5HXBF+5R2BGvtJtajlLU6Gkq4Y115SLRB4ozvR1Ceh84fk7YM1c5h
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

Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v9:
- Put params to dev_dbg print on one line

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
 drivers/mfd/bcm590xx.c       | 54 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bcm590xx.h | 14 ++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 4620eed0066fbf1dd691a2e392e967747b4d125b..5a8456bbd63f65b9260f05ef6546c026bf822bae 100644
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
@@ -37,6 +46,47 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
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
+		 id, bcm590xx_names[id], bcm590xx->rev_digital, bcm590xx->rev_analog);
+
+	return 0;
+}
+
 static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 {
 	struct bcm590xx *bcm590xx;
@@ -78,6 +128,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
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

