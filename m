Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4254115442A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008694; cv=none; b=ZfJNDs7R6nn/q1JtcKswt4NK1Xxw7VnTDHuWMPiTi4IEBjztbUSW4Egu/y1B2Yj0kpnoVuhF7YmbE70p8xBmSfvgZAIWMsAYF7QkDRFsM8LawtUlrHg06pGsa/KXZ8Ub03MqSslQ3EBwhLvVQh5LZjnEvCB8Zy8aDHuI8qIHecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008694; c=relaxed/simple;
	bh=2Fe3ulMLFE47PgdiZW6fQW+jtVST6VMA1a7HPcbAPgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jdoFwyzT95b3qecC75FqDJWlm3fpHVB9N3rePwKsJzPQpmIhtXuOM2w41oCU2OFLLN+N+p3G+LzQoXP1cgX0f4YThjzq2vQ9fE6jnoK7cFY5esGCGb6LLO3mfUop5oF8ndiYwc05BSpWssXV+JAwBJooRHu3JVuyVgSBPxOrYy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=d+djrvSH; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="d+djrvSH"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3fa6c54cdb2so1637674b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745008690; x=1745613490; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64tBS0jidfIHgVu7kwIxl5UwVXxXom1YsPf9oOkqC/8=;
        b=d+djrvSHKPgdKHw3uce83CNJYtpXMr2rdpYZ3swG0Qs9sHNVD8SS+IQ/hSK58x5B19
         hMaf35MN7ByDO7LbUpMSHMtmzCTEHU662R0nOnlQVz94Apa/DdsV1HLAqjkARqVcmTj0
         BvPW44+jNB3azeUkhRquRgamUDYzbyyh15mOiHmjaIov5VwAK9ltiSxY3qXkZsL/zS0F
         ta199FWIpT046PVOR3V0yz1J0HMnbwpaANSW1BMGm0Cn9OS8ldzcstAeZqKMkai2zZjK
         k7EvPG/KsAa17sNDenIkYvydkG4frCNckvXbJFov9sJSepm7m9hwENfpu44NXkQG9YcU
         N6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745008690; x=1745613490;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64tBS0jidfIHgVu7kwIxl5UwVXxXom1YsPf9oOkqC/8=;
        b=pnoxBidsoduZzvCmb+R8QOERlCjrj5gqndwdTSXJwfh3+qG4QamifdF/ol3vZ1KcwO
         kOG7xTaBC8wgUXOyxwlOQg0/RnuSU3WVl+DhdN9XGmzKMNtU4MWMOL7HpvF0K0RH4ROu
         pB2oPKDkrbMwTAVpMmPGGPEGkdtzg20Ad98Ltdv4hgsjEDHl4Kmxj2XS9YfgXn/iRJTE
         ILR6bzENh83Q/xTpG5JjqPicZ2W7fImgUICr3mYlE8xnO4uDy81K+oWOOYg44LGQCtAw
         iITBf7lJWCrtN1pwoucGoxzpC2SPWghj5FIVDTi7TjXntCnNmGl9KdT+Be1tLmQPyiod
         VMNA==
X-Forwarded-Encrypted: i=1; AJvYcCVFA5qmGm5MFu9IKOqNIzw/1RW8J60YWm+Wf5oXLyS8vTo/7RXPhqjoeorGBQV+zfYYyI3MUEIchBjlP7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5URPAnp6mgkw8G1VPw8eCoiFSjAThCK4/1wLbm+VYivwQaHl
	DPUWmwU/GwrIBdSL9bD0Y3VSRSnEY3Vx/pwc96DD98DhE61NYzv5zM4Cfix60EQ=
X-Gm-Gg: ASbGncso7inJvWNGT493mcLwxGd0SdSlRi6iTBodkXzrCm3AaWQU3tUYuAxjrpgXj3t
	45GNy0o4hG6h78w0ZyeqrbhIPyccdxOBXXJXf3r0ksL539T5eLt1JPOp9o6O/oIZwg0as4AwIMZ
	57LlCn7AIJ6zLZbzhImoG34K4xNGCnL1DacswrYV2lrDTsp5HUXXc/IVrL2/gmrSenlH11K41j/
	LcRof5fhasDyxBCBlUaWBxEhLhc4Bd82QtzQKo/2M4jtIY9rZ00fL1GgbbqqLpEbqJOvMEL+9ot
	ACPGbdoth3uyeQ4TAr9gEngzaRAK5tAhddhvOyY+v7cEa4k=
X-Google-Smtp-Source: AGHT+IHJcrS3RxkIdEMS+yjvuEu2aYDzQTY6J2p6HbXI7uaCEkLoA+zUirfwPMd/5LNX3VA8w58fDA==
X-Received: by 2002:a05:6808:318b:b0:3f8:e55c:16ea with SMTP id 5614622812f47-401c0c38fc1mr2081127b6e.24.1745008690111;
        Fri, 18 Apr 2025 13:38:10 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beeee032sm447946b6e.28.2025.04.18.13.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:38:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 15:37:54 -0500
Subject: [PATCH v2] iio: amplifiers: ada4250: clean up ada4250_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v2-1-1bf9b033aaf5@baylibre.com>
X-B4-Tracking: v=1; b=H4sIACG4AmgC/6WOQQqDMBREryJZ9xcTY62ueo/i4sf81A9qJLFSE
 e/e1CsUZvNmYGZ2ESkwRdFkuwi0cmQ/JVCXTHQ9Ti8CtomFylWZa3kHZg84zgM7phABLeqUQOT
 T28DigmDezlEAnpJ4gbogY2ShtapLkZrnQI4/5+qzTdxzXHzYzhOr/Ln/7a0SJFRUGXuzaLUqH
 ga3gU2ga+dH0R7H8QU70ZM8+QAAAA==
X-Change-ID: 20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-93ebb1344295
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3495; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=2Fe3ulMLFE47PgdiZW6fQW+jtVST6VMA1a7HPcbAPgY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoArgnxrxzTbtbPD1ltiOhzZ1Cc14HwXa5A2DYb
 hXJH9WaGOqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAK4JwAKCRDCzCAB/wGP
 wCHDB/94qfu1fsSRh9mNWIVPBWIE3H6+q0QT62WShTyUr78vOCJMiPGt2D1GPQb3544JM3+uemn
 mM4xkOtCmI472iItqEFIjn3u+P2fa7jJVis/V4WojucKf4NVCdHcWU3UrZ2yVoLHvt7h1Xs/kdu
 K9mqAR8MtTs6MHAw1DXq1IjlxGh76HdA2U/MBO3L94WKhUQWWGspDL4TMrw2vAKjNo52HQ5VXEP
 o/zlujNZiVpYPGETYNWEjXcz4IEK0+FJF2J1wdrKa1DmB3RqUId0A7IOpd6bBKA4R1oOJycmNSO
 yLYYIBsTW56uB59LAuWC28ALroG1L5IISG6Vw9whd6TZ6H/8
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

There are a few opportunities to simplify the code in ada4250_init():
* Replace local spi variable with dev since spi is not used directly.
* Drop the data variable and use chip_id directly with the regmap bulk
  read (__aligned() and initialization of the data variable were
  unnecessary).
* Don't use get_unaligned_le16() when not needed.
* Use dev_err_probe() instead of dev_err() and return.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
In v1, I though we had a bug, but Andy set me straight. Still, since we
were already looking at this, there is some room for improvement, so I
changed this to a cleanup patch instead.

Changes in v2:
- Totally new patch.
- Link to v1: https://lore.kernel.org/r/20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v1-1-7e7bd6dad423@baylibre.com
---
 drivers/iio/amplifiers/ada4250.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/amplifiers/ada4250.c b/drivers/iio/amplifiers/ada4250.c
index 74f8429d652b17b4d1f38366e23ce6a2b3e9b218..13906e4b4842095717566781ad00cd58f3934510 100644
--- a/drivers/iio/amplifiers/ada4250.c
+++ b/drivers/iio/amplifiers/ada4250.c
@@ -13,8 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
-
-#include <linux/unaligned.h>
+#include <linux/types.h>
 
 /* ADA4250 Register Map */
 #define ADA4250_REG_GAIN_MUX        0x00
@@ -299,25 +298,23 @@ static void ada4250_reg_disable(void *data)
 
 static int ada4250_init(struct ada4250_state *st)
 {
+	struct device *dev = &st->spi->dev;
 	int ret;
-	u16 chip_id;
-	u8 data[2] __aligned(8) = {};
-	struct spi_device *spi = st->spi;
+	__le16 chip_id;
 
-	st->refbuf_en = device_property_read_bool(&spi->dev, "adi,refbuf-enable");
+	st->refbuf_en = device_property_read_bool(dev, "adi,refbuf-enable");
 
-	st->reg = devm_regulator_get(&spi->dev, "avdd");
+	st->reg = devm_regulator_get(dev, "avdd");
 	if (IS_ERR(st->reg))
-		return dev_err_probe(&spi->dev, PTR_ERR(st->reg),
+		return dev_err_probe(dev, PTR_ERR(st->reg),
 				     "failed to get the AVDD voltage\n");
 
 	ret = regulator_enable(st->reg);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable specified AVDD supply\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to enable specified AVDD supply\n");
 
-	ret = devm_add_action_or_reset(&spi->dev, ada4250_reg_disable, st->reg);
+	ret = devm_add_action_or_reset(dev, ada4250_reg_disable, st->reg);
 	if (ret)
 		return ret;
 
@@ -326,16 +323,13 @@ static int ada4250_init(struct ada4250_state *st)
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_read(st->regmap, ADA4250_REG_CHIP_ID, data, 2);
+	ret = regmap_bulk_read(st->regmap, ADA4250_REG_CHIP_ID, &chip_id,
+			       sizeof(chip_id));
 	if (ret)
 		return ret;
 
-	chip_id = get_unaligned_le16(data);
-
-	if (chip_id != ADA4250_CHIP_ID) {
-		dev_err(&spi->dev, "Invalid chip ID.\n");
-		return -EINVAL;
-	}
+	if (le16_to_cpu(chip_id) != ADA4250_CHIP_ID)
+		return dev_err_probe(dev, -EINVAL, "Invalid chip ID.\n");
 
 	return regmap_write(st->regmap, ADA4250_REG_REFBUF_EN,
 			    FIELD_PREP(ADA4250_REFBUF_MSK, st->refbuf_en));

---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-93ebb1344295

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

