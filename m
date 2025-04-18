Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E20F8821
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745000189; cv=none; b=X/3J0nMLZhATTu+9Z1hFRyThud13SOTeVWn/xNYalxydTgvV19dfzWTrgstO+y/CQPbAh4ATwPtye01oJ/kV0v3ipdo5cCXZg88kPXZUE8AgFQOt8D5pYfFDN07ZG7MEcXEk4X627XRLDQs378Xo88NnoUMyAE7jKnCLqCKptcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745000189; c=relaxed/simple;
	bh=Hrwf1aoUO2fKyKpeHM/6WfWnH0OQTd0CdQrP2NqF3dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ngpCNBR9218MQkvUlWRy6Sx9Unc/ub958eYE5RPbzU5dOpw/6WLKgKFTrLqRKukCLIFWJJiB+rvf3ejw9L8PKESTp8CxB2xfhBtlM70bge6aHyPXj4+HB3yskMoH2zxAgJZDiqqp7g9BHqycd4CaIXn1WnaHhBzB08paiELCHaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wqoPHnvg; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wqoPHnvg"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-604ad0347f5so505466eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745000185; x=1745604985; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQglEEV086U9T/4BDha3drx4fl6TCsy6FTdFNCiQyhY=;
        b=wqoPHnvgrgXKV8XiHE/XIY69OiEqMXeUDDDrPw+YYbleKXiiJrSXLYUSEZRB6SYLDo
         xOeSRXp1WYMuGucppLYRwohdGLOtQ0l+S8CC7zARGq/SvVyMqRNThcIsGWUPgr9ykb4l
         LL45uAp11CLzT7k+BVGH6JLQAE8Qg8MsyFbHgrTLGiyrqeV4cL5eqrrJt6M+SSrqeyKP
         2KHJVIqwt4aFoKyUky3J1oBfdYuS/3NhcftTYiK/CHmqkD00FbMZtH4Mq48rkFXcLrK6
         /2jRcQcpQh7D7fB/y7pb8Svaanx+Gj8t46Nn0J8izZBtNmISTLu1C6dH9H5AVa7w71bw
         lXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745000185; x=1745604985;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQglEEV086U9T/4BDha3drx4fl6TCsy6FTdFNCiQyhY=;
        b=eKrMU/5hJJ07gvtLLpd1Dd2kex62aSYdUf2rL9n08+qBtMranE/v1cC+kilWQGrE68
         wYM/8pEo4k78rQm8WcqyuG43oTXjZyVRnSPTvC6QgWquiUvd/XZSsQlt6pnBU9Pfw7kH
         H+YflEjUkPgvM+IAPyPEUB3UEglhHyulZ3LyuSScis9GEw0Oqqy0x5gvod/x+zYVJvFo
         GSKyryqj/3oFvbtq5PIBy8ZXwxs+u5q96TDKR2QyWupijhjfXuV89rz2l0slcCS/oma9
         HkVc3H93qmYusZe3r+S5BnwgdpUjLH5a8wjkIyAtHHYe/ZIXcXTz9SjW9Q0Yc0TDMXs7
         B2FA==
X-Forwarded-Encrypted: i=1; AJvYcCXs0qCPRA8KHuCGFiymR7x3irB0N7XKpfr9aAE65UtoCECRebm+B20vJTaFpXaztQBLriVkNcOrPW16v58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDwm6MQ2iukigBdZC+ARCZxtVJcXixlZpaicFns3yEGDdF8hD
	RzQRVbPy8g5oMzXu31xjBiC0cvYAi2kZSNOG0z+SkeGX52gb0DAujRB8xJW8RSQahg3gVtcaZ7B
	tQEM=
X-Gm-Gg: ASbGncvyTvV6ssNHxL2hdx/ESHwVVyrECuqTNLvPCKnevCXcdC7kvZCDU6U1sXtOlQU
	6dwur4LmRPWB6CfMTKTkir0NTbwiIAuHFhOrupUovU9slnjaX7hjrwudQySs4XAnhl/EpsTQGGm
	FoqW2uqf3qfoLdF5Zl+aj26FKTTC/erlM8D8eHYZvTXyVAF6+35FFcozHVp+bGIylYF/ww5V/uj
	FOHn4ItbM3/nZNx0gI84krHOwsZBiRSfy7owKmSBc+RqBxs+XfccUYHNh1KPjUbbL8IMd1S6rnG
	onRHcN5ohIWEUm/mzXuYtwlVHPD5SEEhwfIMsClGK7upXsg=
X-Google-Smtp-Source: AGHT+IGe/oEO2FDNEKJyCLo/N4egBJ8nsACv4TcQtDgohfoTf4RgTfAbniyGVr1QXaHxO1TEdosMtA==
X-Received: by 2002:a05:6820:2288:b0:603:f973:1b1 with SMTP id 006d021491bc7-606003e8080mr2035983eaf.0.1745000185505;
        Fri, 18 Apr 2025 11:16:25 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff5f7a1dsm436659eaf.20.2025.04.18.11.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:16:24 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 13:16:13 -0500
Subject: [PATCH] iio: amplifiers: ada4250: use DMA-safe memory for
 regmap_bulk_read()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v1-1-7e7bd6dad423@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOyWAmgC/x2NwQqDMBBEf0X23AUTI9T+SulhYzbtQBsl0VIR/
 71BmMubBzM7Fc3QQrdmp6xfFEypgrk0NL4kPZURKpNtbd86c2VgYvnMb0RoLixBXDVccHYbB1m
 E/RqjZkaqwcJDp96bzjk79FSX56wRv/P1/jiOP0wZRluFAAAA
X-Change-ID: 20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-93ebb1344295
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Hrwf1aoUO2fKyKpeHM/6WfWnH0OQTd0CdQrP2NqF3dA=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDKYpr1PVGb7ZHrjghtDqMjJf+ne12wTNuhe/vtX762Iw
 RMpS3/mTkZjFgZGLgZZMUWWNxI35yXxNV+bcyNjBswgViaQKQxcnAIwkcBaDobW22+9P20tOHRp
 N2vLXJ290cvuZsZarfYqmtESv2haYrNolaSmvz9HMMc7YRPV4ltJ5+5rvercp37udSt3QrHOnIN
 qmn4ftIU4+K4sck8yueE8i3/fI8+CMO5rm+39Ivc5FBbbCyQ9EHBrsE35xxzJlFv2O+e98i+uqr
 8bUtmsI/gss9iW+oqYRcwKlfE8Irbkh0as4zP7QwxyL+XdhfQ/xl+4IrXLvtyybetMqb4rKWU7F
 xjfe9DU1byybxlzjPeCyiKZ3NdMWRdiHm381SPvtc4750LdIf/IsOX8fC/M7gRot2z428ok4LTE
 S9D2c/ime2trazPyw6MWCsj0TXyedTs5WUrpzF+LAAsA
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use DMA-safe memory instead of stack-allocated memory for the call to
regmap_bulk_read() in the ada4250_init() function as this could be used
directly by a SPI controller.

Also remove unnecessary use of get_unaligned_le16() and explicitly
include linux/types.h e.g. for __le16 while we are fixing this up.

Fixes: 28b4c30bfa5f ("iio: amplifiers: ada4250: add support for ADA4250")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/amplifiers/ada4250.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/amplifiers/ada4250.c b/drivers/iio/amplifiers/ada4250.c
index 74f8429d652b17b4d1f38366e23ce6a2b3e9b218..f81438460aa51ce30f8f605c60ee5be5c8c251d3 100644
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
@@ -63,6 +62,7 @@ struct ada4250_state {
 	u8			gain;
 	int			offset_uv;
 	bool			refbuf_en;
+	__le16			reg_val_16 __aligned(IIO_DMA_MINALIGN);
 };
 
 /* ADA4250 Current Bias Source Settings: Disabled, Bandgap Reference, AVDD */
@@ -301,7 +301,6 @@ static int ada4250_init(struct ada4250_state *st)
 {
 	int ret;
 	u16 chip_id;
-	u8 data[2] __aligned(8) = {};
 	struct spi_device *spi = st->spi;
 
 	st->refbuf_en = device_property_read_bool(&spi->dev, "adi,refbuf-enable");
@@ -326,11 +325,12 @@ static int ada4250_init(struct ada4250_state *st)
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_read(st->regmap, ADA4250_REG_CHIP_ID, data, 2);
+	ret = regmap_bulk_read(st->regmap, ADA4250_REG_CHIP_ID, &st->reg_val_16,
+			       sizeof(st->reg_val_16));
 	if (ret)
 		return ret;
 
-	chip_id = get_unaligned_le16(data);
+	chip_id = le16_to_cpu(st->reg_val_16);
 
 	if (chip_id != ADA4250_CHIP_ID) {
 		dev_err(&spi->dev, "Invalid chip ID.\n");

---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-93ebb1344295

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

