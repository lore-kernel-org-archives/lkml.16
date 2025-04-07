Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69F22C336
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031219; cv=none; b=oUZfPxTJm6covc7C0I6l7KTztGnDRps9R1nbdYiK4HElW0DQjHOLAxd+x6UydbUB1wPI/ZZToA1dq1H0J5N/qW6e8BuZBOgXxzSsnu20OOeOe38BLlsUMud2ucgYIaYPECXK44nbSird2BunujEzoJlxtsUTWpqas0gvoQ+BTCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031219; c=relaxed/simple;
	bh=vr0jEtZFdrPsAy/VXdEI/gqaP7QiRfNc5r74JhFqoBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g9dt1wz+yum6BepPaq7Lqbpj5lsj88IYFp+WVB5BwytVKydtx/VRGf3mbZkOAiKaFWapcE3MLUZZkVRB/Y+kSL8xBg2wry8rlNP236DL7jzk7WMSsH92cR4wXmDoBrRAj9PHRnCgj31j8RCPaxUbTisTmmRPiEpmiJ9uOA8fHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M3+dZQIj; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M3+dZQIj"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1029A4431B;
	Mon,  7 Apr 2025 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744031214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qZzEpXou+AnhtOZHF+fZbUGpxS1z0rrUBz2Hb+aqexE=;
	b=M3+dZQIjgWJUArt1u1Mxl3AJJJXGCow6nahEZWzPUHh090N9DjV8e+ozObJHO3QEHPHY3T
	3INYdCUxVwGxntjjnqoSfScmUSYc/nj1SXnQxZB1LnPzqTMFl9Y2/duDrvt7LF0XWJlyDI
	g9Zw7cxUZSetDgCuRmxIlbBS8yNZAGlomR0m09VKHSSmEhGkd07EUmJI2Mp6XuDlHpGXy3
	0TccT4XdVFSyJhSZSPwfci4pTWk2Hsv5bk+mGW0NBH80xwPLQRSN74tBIv6uhELeKKCdx/
	ZOy7hRcDuuZHUIGIFIvmcFe9EbeEbgJrNyTFSkDw/bWBG51pUx204GcL64bH1Q==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 07 Apr 2025 15:06:49 +0200
Subject: [PATCH RESEND v3] mux: mmio: Add suspend and resume support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mux-mmio-resume-support-v3-1-cb88abc04db7@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOjN82cC/42OMQ+CMBSE/4rp7DOlLUScHGR10NE4tPiQJrYlL
 RAM4b9bujnpeHfvvnszCeg1BnLYzMTjqIN2Ngq+3ZC6lfaJoB9RE0aZoEXGwQwTGKMdeAyDQQh
 D1znfg2i4YpILyZkksa1kQFBe2rpd+4F5WK016jw2ekqjN3KprtX5RO7Rb3XonX+nX8YspT9nx
 wwoiJzlqsmLeCyPyrn+pe2udiZRR/YniUEGuBdlQctSUS6+ScuyfAC4JiQeLQEAAA==
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, 
 richard.genoud@bootlin.com, u-kumar1@ti.com, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Davis <afd@ti.com>, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiveefueeiveffvedvfeetvdfhkeeuudefkeeuffefgfekudelheeiffduveeikeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuhdqkhhumhgrrhdusehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvl
 hesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhgvghnohhuugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvggurgesrgigvghnthhirgdrshgvpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrfhgusehtihdrtghomh
X-GND-Sasl: thomas.richard@bootlin.com

The status of each mux is read during suspend and stored in the private
memory of the mux_chip.
Then the state is restored during the resume.

Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
This is the third version, I just rebased the series on v6.14-rc1.
---
Changes in v3:
- rebased on v6.14-rc1.
- Take Reviewed-by: Andrew Davis. 
- Link to v2: https://lore.kernel.org/r/20240613-mux-mmio-resume-support-v2-1-e8496099b034@bootlin.com

Changes in v2:
- Remove all modifications done in the mux subsystem
- Add a mux_mmio_set()
- Read the status of muxes during suspend and store in the private memory
  of the mux_chip.
- Use this status to restore muxes during resume.
- Link to v1: https://lore.kernel.org/r/20240613-mux-mmio-resume-support-v1-0-4525bf56024a@bootlin.com
---
 drivers/mux/mmio.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 9 deletions(-)

diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
index 30a952c34365..30b84382637f 100644
--- a/drivers/mux/mmio.c
+++ b/drivers/mux/mmio.c
@@ -15,11 +15,25 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 
+struct mux_mmio {
+	struct regmap_field **fields;
+	unsigned int *hardware_states;
+};
+
+static int mux_mmio_get(struct mux_control *mux, int *state)
+{
+	struct mux_mmio *mux_mmio = mux_chip_priv(mux->chip);
+	unsigned int index = mux_control_get_index(mux);
+
+	return regmap_field_read(mux_mmio->fields[index], state);
+}
+
 static int mux_mmio_set(struct mux_control *mux, int state)
 {
-	struct regmap_field **fields = mux_chip_priv(mux->chip);
+	struct mux_mmio *mux_mmio = mux_chip_priv(mux->chip);
+	unsigned int index = mux_control_get_index(mux);
 
-	return regmap_field_write(fields[mux_control_get_index(mux)], state);
+	return regmap_field_write(mux_mmio->fields[index], state);
 }
 
 static const struct mux_control_ops mux_mmio_ops = {
@@ -37,8 +51,8 @@ static int mux_mmio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct regmap_field **fields;
 	struct mux_chip *mux_chip;
+	struct mux_mmio *mux_mmio;
 	struct regmap *regmap;
 	int num_fields;
 	int ret;
@@ -69,12 +83,20 @@ static int mux_mmio_probe(struct platform_device *pdev)
 	}
 	num_fields = ret / 2;
 
-	mux_chip = devm_mux_chip_alloc(dev, num_fields, num_fields *
-				       sizeof(*fields));
+	mux_chip = devm_mux_chip_alloc(dev, num_fields, sizeof(struct mux_mmio));
 	if (IS_ERR(mux_chip))
 		return PTR_ERR(mux_chip);
 
-	fields = mux_chip_priv(mux_chip);
+	mux_mmio = mux_chip_priv(mux_chip);
+
+	mux_mmio->fields = devm_kmalloc(dev, num_fields * sizeof(*mux_mmio->fields), GFP_KERNEL);
+	if (IS_ERR(mux_mmio->fields))
+		return PTR_ERR(mux_mmio->fields);
+
+	mux_mmio->hardware_states = devm_kmalloc(dev, num_fields *
+						 sizeof(*mux_mmio->hardware_states), GFP_KERNEL);
+	if (IS_ERR(mux_mmio->hardware_states))
+		return PTR_ERR(mux_mmio->hardware_states);
 
 	for (i = 0; i < num_fields; i++) {
 		struct mux_control *mux = &mux_chip->mux[i];
@@ -104,9 +126,9 @@ static int mux_mmio_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
-		fields[i] = devm_regmap_field_alloc(dev, regmap, field);
-		if (IS_ERR(fields[i])) {
-			ret = PTR_ERR(fields[i]);
+		mux_mmio->fields[i] = devm_regmap_field_alloc(dev, regmap, field);
+		if (IS_ERR(mux_mmio->fields[i])) {
+			ret = PTR_ERR(mux_mmio->fields[i]);
 			dev_err(dev, "bitfield %d: failed allocate: %d\n",
 				i, ret);
 			return ret;
@@ -130,13 +152,55 @@ static int mux_mmio_probe(struct platform_device *pdev)
 
 	mux_chip->ops = &mux_mmio_ops;
 
+	dev_set_drvdata(dev, mux_chip);
+
 	return devm_mux_chip_register(dev, mux_chip);
 }
 
+static int mux_mmio_suspend_noirq(struct device *dev)
+{
+	struct mux_chip *mux_chip = dev_get_drvdata(dev);
+	struct mux_mmio *mux_mmio = mux_chip_priv(mux_chip);
+	unsigned int state;
+	int ret, i;
+
+	for (i = 0; i < mux_chip->controllers; i++) {
+		ret = mux_mmio_get(&mux_chip->mux[i], &state);
+		if (ret) {
+			dev_err(dev, "control %u: error saving mux: %d\n", i, ret);
+			return ret;
+		}
+
+		mux_mmio->hardware_states[i] = state;
+	}
+
+	return 0;
+}
+
+static int mux_mmio_resume_noirq(struct device *dev)
+{
+	struct mux_chip *mux_chip = dev_get_drvdata(dev);
+	struct mux_mmio *mux_mmio = mux_chip_priv(mux_chip);
+	int ret, i;
+
+	for (i = 0; i < mux_chip->controllers; i++) {
+		ret = mux_mmio_set(&mux_chip->mux[i], mux_mmio->hardware_states[i]);
+		if (ret) {
+			dev_err(dev, "control %u: error restoring mux: %d\n", i, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(mux_mmio_pm_ops, mux_mmio_suspend_noirq, mux_mmio_resume_noirq);
+
 static struct platform_driver mux_mmio_driver = {
 	.driver = {
 		.name = "mmio-mux",
 		.of_match_table	= mux_mmio_dt_ids,
+		.pm = pm_sleep_ptr(&mux_mmio_pm_ops),
 	},
 	.probe = mux_mmio_probe,
 };

---
base-commit: aa1ea32fb8882552bd404d29a021d0e24cab38b1
change-id: 20240613-mux-mmio-resume-support-4f3b2a34a32a

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>

