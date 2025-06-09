Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C171F258CF8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476391; cv=none; b=IosNicOskxXz7Ph2/u34EZsG8LDnfr5sLjNTpi1EWd6D1GjJTLmhih+r1DfgDFdI4bsQ8SOTzcvDONgykvIjB/ajQ7oL5al5qSTEJxkqQ69zaEpN/2TBpNlW1MDEobDc6e4RofAp5Zp+kPZM5bnSB1qzdFBaskmfakmDkwGR++M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476391; c=relaxed/simple;
	bh=ngc4rDKAh1mJeAbKY/C4Jd8mMnmeejZ3wzvJXkR2sEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g+Ngy3o/Q1iqXWOKNbP+8iHfhDGCGD6Xk4jFWwVSq+m1TjKtWeT/DKbGPJ5HTkhCGRg6YP4SQjo4wyn0yg/CNIlTRGArw3LmxvapMEGusuwgP+ENUa5AxPwQnf2qI3aKiADP9Z6vmoNryybKQ7YLSvCAKAflMDxGvpZbyNY5w+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T2r0IA93; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T2r0IA93"
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE66F433CF;
	Mon,  9 Jun 2025 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749476380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OaVYv2J/xWS/XzgCfKUvOQYxhSGuMuw0rL15cJiAaBU=;
	b=T2r0IA93jbDSwUPPEKJvBhjN0/S8am2u+6+3dEsCM2xzUA/TD/RKd+wue7hPwC2bizr94A
	hD4RJfjN0TII59Yup76TXjpF/hkAB1BlcK0Iupa12yxCUv+TaiCXFDtbXG4VabXxbXPbJE
	sEZLds834bC35Sv/N7zfgQ8rbChC3F1+VpN+hPk2HaiwHzr/pw02BGmPyXwDKdjK6JjX4c
	akQ2O8KHS6zKL8Jd2F2Y3KldElFbnXWJuzz93RwYUrOtFz//X/Y408YdrB9t4lvFQmjgI8
	9BbvacLKDrp0K4IZjW+I0PfdyNKlW1zFU+KfigWGt7zo50ktlQlFkZm7CLgz5Q==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 15:39:35 +0200
Subject: [PATCH v4] mux: mmio: Add suspend and resume support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mux-mmio-resume-support-v4-1-6096277f660e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIABbkRmgC/42OwW7CMBBEfwX53EWOvQlJT/0PxMFrNo2lOo7sJ
 AKh/Ds2EgeEqvY4sztv5iYSR8dJfO5uIvLqkgtjFvixE3Yw4zeDO2ctlFQom0qDXy7gvQsQOS2
 eIS3TFOIM2GtSRqPRyoicJpMYKJrRDiWfVIRildMUuXeXR+nxlPXg0hzi9bFhrYr7d91agQSsV
 U193eRn80UhzD9u3NvgRaGu6p8kBRVwi10ju46kxneSfpJqifLwO0lnkqW2NWQlnunwStq27Q4
 DRtVtbwEAAA==
To: gregkh@linuxfoundation.org, Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, 
 richard.genoud@bootlin.com, u-kumar1@ti.com, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Davis <afd@ti.com>, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiveefueeiveffvedvfeetvdfhkeeuudefkeeuffefgfekudelheeiffduveeikeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehpvggur
 gesrgigvghnthhirgdrshgvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrghgvnhhouhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuhdqkhhumhgrrhdusehtihdrtghomh
X-GND-Sasl: thomas.richard@bootlin.com

The status of each mux is read during suspend and stored in the private
memory of the mux_chip.
Then the state is restored during the resume.

Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
This is the fourth version of this series, I just rebased it on v6.16-rc1.
---
Changes in v4:
- rebased on v6.16-rc1
- Link to v3: https://lore.kernel.org/r/20250407-mux-mmio-resume-support-v3-1-cb88abc04db7@bootlin.com

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
index 9993ce38a818..e4ddb1e61923 100644
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
@@ -43,8 +57,8 @@ static int mux_mmio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct regmap_field **fields;
 	struct mux_chip *mux_chip;
+	struct mux_mmio *mux_mmio;
 	struct regmap *regmap;
 	void __iomem *base;
 	int num_fields;
@@ -80,12 +94,20 @@ static int mux_mmio_probe(struct platform_device *pdev)
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
@@ -115,9 +137,9 @@ static int mux_mmio_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
-		fields[i] = devm_regmap_field_alloc(dev, regmap, field);
-		if (IS_ERR(fields[i])) {
-			ret = PTR_ERR(fields[i]);
+		mux_mmio->fields[i] = devm_regmap_field_alloc(dev, regmap, field);
+		if (IS_ERR(mux_mmio->fields[i])) {
+			ret = PTR_ERR(mux_mmio->fields[i]);
 			dev_err(dev, "bitfield %d: failed to allocate: %d\n",
 				i, ret);
 			return ret;
@@ -141,13 +163,55 @@ static int mux_mmio_probe(struct platform_device *pdev)
 
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
base-commit: bab9b91113672440b9b634c1fadabfd017babe07
change-id: 20240613-mux-mmio-resume-support-4f3b2a34a32a

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>

