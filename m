Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308818858A;
	Thu, 22 May 2025 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747932698; cv=none; b=eTifGv0Rt2+sxgxnC+E63sauIRRJIDUC8t9FYWK/CyP1Zp7qQdPRMxv9UJFza1NCv2CkEdxAMJOKrICBiulmPl6ERa4kfTho9t1C4Ylvsritxqdd+uWZAjEYCdc83boAPT/+PpTJjsbiRtqnn16uNAH8B8wNGdhEGKG4jfrx42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747932698; c=relaxed/simple;
	bh=ZyjDRlaUljAfi8q455xMtlrqhLM1yrweMT6baGuF55E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BfjTdc4TikjJFLytmr+3OXqKHwkb/7NZmA7Nzpkn5BRKco8gwz/OXO2Njc7bNx3H8GnXBqQQ//VK6KzZkpl4bE5jlprkn7yLXPp37dU9sBhzFM8XL5MMHOjsH6rTHgEtEcKRubosOhvLE0CG8WhTD1tRYVSF5xjq1AiZr2OmBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCR3GzrJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCR3GzrJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8715AC4CEEA;
	Thu, 22 May 2025 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747932697;
	bh=ZyjDRlaUljAfi8q455xMtlrqhLM1yrweMT6baGuF55E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BCR3GzrJbE3IOPpuWHK2h3aU6w5ooQPz+FeVw8i2a354dabQzPqxM8fJoDDagAO7T
	 CM9UEx/bjaxXKSDE8nG1l3HxjFLQcv64ltpxngVI4ynwmSl5gO4xscXoBVDNdvJLWx
	 kAWZgZ4c+jWv6saUeh3hE5SgxrvXE+Hs7be1Ud2TlzG4NBzilWnJP0MVnt7dLPaT1D
	 skgO/lKF29SXtwZyidI7RG77A4wwR90X5oJN9bIWu2kPPxmulzvycNpk+CrZfZWCh1
	 m1hRCE7fJ2At//5npDaarAmCTaRMPqPvE8ObCyOWclmzpexegmUrlWYx3Oc7jOGwBM
	 X8T08J4Lk8o3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E26C54EDA;
	Thu, 22 May 2025 16:51:37 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Date: Thu, 22 May 2025 18:51:05 +0200
Subject: [PATCH v2 2/2] gnss: ubx: add support for the safeboot gpio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-ubx-safeboot-v2-2-08c22378b8c9@geotab.com>
References: <20250522-ubx-safeboot-v2-0-08c22378b8c9@geotab.com>
In-Reply-To: <20250522-ubx-safeboot-v2-0-08c22378b8c9@geotab.com>
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747932696; l=1402;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=5q+UP/BRI1cuC24cDBux+9AkjID15/gPXOINM1Yuf4o=;
 b=5l9yKE0744FlWyjZWyv0I/rGEgSlfrWCWO9JaUxMKa/w2pJIuY/I4S9p741rcGvVtBn4q06gW
 IsojkHvqaFkBsAIEzR0fVQPZzqlLwWKqYHLSHWYahxURpkUliwLnj2L
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

From: Alejandro Enrique <alejandroe1@geotab.com>

U-Blox 8/M8/M9 chip have a pin to start it in safeboot mode, to be
used to recover from situations where the flash content has become
corrupted and needs to be restored. If this pin is asserted at power
up/reset, the receiver starts in safeboot mode and GNSS operation is
disabled.

Deassert the safeboot pin when probing this driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
 drivers/gnss/ubx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gnss/ubx.c b/drivers/gnss/ubx.c
index 92402f6082c415c7b9051338eef5406b09e09455..1d6acace84f76f8d5d2eacdbbf5ab7a934b33486 100644
--- a/drivers/gnss/ubx.c
+++ b/drivers/gnss/ubx.c
@@ -67,6 +67,7 @@ static int ubx_probe(struct serdev_device *serdev)
 {
 	struct gnss_serial *gserial;
 	struct gpio_desc *reset;
+	struct gpio_desc *safeboot;
 	struct ubx_data *data;
 	int ret;
 
@@ -82,6 +83,13 @@ static int ubx_probe(struct serdev_device *serdev)
 
 	data = gnss_serial_get_drvdata(gserial);
 
+	/* Deassert safeboot */
+	safeboot = devm_gpiod_get_optional(&serdev->dev, "safeboot", GPIOD_OUT_LOW);
+	if (IS_ERR(safeboot)) {
+		ret = PTR_ERR(safeboot);
+		goto err_free_gserial;
+	}
+
 	data->vcc = devm_regulator_get(&serdev->dev, "vcc");
 	if (IS_ERR(data->vcc)) {
 		ret = PTR_ERR(data->vcc);

-- 
2.34.1


