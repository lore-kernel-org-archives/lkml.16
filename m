Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C4E27A465;
	Wed, 14 May 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230901; cv=none; b=KhJElvqM1+bkzYzz30I4ffCMKTuI0urecsXXPKmfBpqmjJtHBs8jbU/4Xb4tSGrbq+dFq9PawHVZrkjblBpuesGwlsC6rLyHSEqlwBxAFo0CZ3sa6N8Qs2n2ncxxv6sArY+mfWhpZsR/4gN1r4q8SdKkbGoILKcSM1MEDjQGDck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230901; c=relaxed/simple;
	bh=Wt37B1Xcw25zg2r3NantMYnvPFJ2++GMoo1FMzBQxB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPjDNrvAtjBGrym5veTJ5OTzLsjyp3fI6VO085MlHSEeKAMDE5apxaHA+TMk8e24DplDHauXszp++NrFOdMOUalH5XEgR6JKFJ6TXjRr87eccYT6ZfWPe0JB5Izeyff3Py1yBQQoXxYpnreVXRG3hxgOWl9HCpwmV0MAOlD6NJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoqAsDdr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoqAsDdr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22DE1C4CEED;
	Wed, 14 May 2025 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747230901;
	bh=Wt37B1Xcw25zg2r3NantMYnvPFJ2++GMoo1FMzBQxB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BoqAsDdr3EOOJ3DNgTZIOB4AlN2n+KPdYemMkX1lgsYwPbkJiO8CIwyGliOx34wLF
	 WiL4fdGBFfQ65JmLz839+kzqBHzsJsd+d1ERIxgPAeQHlFPnfwbnk/NNjBxtp/+sCm
	 /OKU0LyCoavRVWsnUaC2Di2ujrY+Q3jFTzM7Ysi2Cd8VWMKjwv4X9AqLvaFL2fHmml
	 t1MJw7IWHpgkSn0vIq9QVHeiMBb+29uSk2+V2f+3EaCoMhou7niAQo/vgXiYHKEGtI
	 FJJXHafTZFwmH+zdRqHdwI/B8Mw3F/jqEXKP6WeUU/YUc00/nxddFc8vQ9Wvg0vdRI
	 1xPpAwlLZzfIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1228DC3ABDE;
	Wed, 14 May 2025 13:55:01 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Date: Wed, 14 May 2025 15:54:42 +0200
Subject: [PATCH 2/2] gnss: ubx: add support for the safeboot gpio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-ubx-safeboot-v1-2-1ae771335356@geotab.com>
References: <20250514-ubx-safeboot-v1-0-1ae771335356@geotab.com>
In-Reply-To: <20250514-ubx-safeboot-v1-0-1ae771335356@geotab.com>
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747230900; l=1333;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=b7rVQ595EWL+GpArVm/oRzrPGJVMa9hRhI22PNK/1BQ=;
 b=8SRteBjQGaPBbZxMBkkHQCpbZMPGK48jm7FUm3U0WFuHwV/mmeZE5qh6Tf7FFWfQrShWVx1bh
 r6f2ZELSJa4Dw8MxM13e5/WjBcB3KGY3nKxa+CQLfi4R95f992SC0lE
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

From: Alejandro Enrique <alejandroe1@geotab.com>

U-Blox M8/M9 chip have a pin to start it in safeboot mode, to be used
to recover from situations where the flash content has become
corrupted and needs to be restored. If this pin is asserted at power
up/reset, the receiver starts in safeboot mode and GNSS operation is
disabled.

Deassert the safeboot pin when probing this driver.

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


