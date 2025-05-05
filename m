Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD422701A3
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472946; cv=none; b=in1iLoLs3vOZt2rxKbu7VIg7lFlsxHMQlR1LC+lfJhF3/H/g2MROtfO/lomzZ3L9k9T+zKe3SstrasEqQXWS8v0X8gbX1TSksNeIYrxkBi56KF45gf7s+fVrM9VgNNqLTE9DT+nizRPqAcKMoGCBNEBYw16T76XssJDwjrWlkpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472946; c=relaxed/simple;
	bh=UGQcqHdSu34YDZoRD1XVkvJy/yBHv9Lh1BJRlQY0stI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0B5Al7MKh5Lykntxz+ONDdYbWQ9PCS5ny62rJ1WzoJecsPSbxxk/g3Twore+V74tzrmUyTWCu2fVQUsRf4P+d3NSglAbhYkWn1Y+5e2Gm2vLYqXYTrE3yR+CMQ1eqZmaLafk8DKLOxLz0VaqcLubyWQj8mJ5K16TozbME+RQL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=b8UQtFmP; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b8UQtFmP"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c172f1de1so2709739a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472943; x=1747077743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCh/sVhB0DOnRDahlg1cUo0LP2dfGdlpj3b9LEwGq0M=;
        b=b8UQtFmPoVuDz8DuwzaUx9Xj+9NEG2YNIC6GOCcAHY10c+k7C2iNweI+87dsxaz7JV
         GaU11LQxFNrqt/S9wuH5RO3Uy18AzkHyTsqM4lxiT78qg8TForQLj7p7tLEVjQl+0I36
         zlOlfpqmL61u3OQj5ehZmJeDW74AEwnXu9kwpZSZA1myk4AwowKfrmI3y6tPk+I7rLTC
         XGv2uM/CI3PZzSS2uqTh0ZyiZxXDWokBVD+GUGRjtDTpR3osrRhzRlpXR2lLA94D75S6
         TfmhnaP4s2Qh5bLEC4qQG2D3STAMMA8UX9l8EKK94O7SmsPTk3qVbqxyJLZkOABs3ac2
         Nc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472943; x=1747077743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCh/sVhB0DOnRDahlg1cUo0LP2dfGdlpj3b9LEwGq0M=;
        b=v4JUsnQWziM92rPFwdsgF/3ac0MkIS0WMWEuQq/FUJ2IyrHZXOJoqSa84sYboXRz2i
         WW3KOlbE27u2sLsqI5inQ+aQisDfT9pgJoTh6EJkTriahmmDTjOl9hoSW3LVhAw0Okbh
         6m7xvibhknVDm/iQfeNMpUJsUfs/j6HkDzS4oJx9ADFN3BMJ3c55hE+ArVAFqtzZ/qX0
         uPMheX4em3KoTB2YPOuIgYJgyDhethT75I48XCDWO2pEA1ftNM4jRif6BG2w2t6/danH
         tki5pIHv3BFOO1M9DIvOeJlyyDBZ0E6MSDGA4xbsDb7TvJvfd8v7nuNnjgNFxMgfVEW7
         OfhA==
X-Forwarded-Encrypted: i=1; AJvYcCUIM09ZYiQnk2J3GzlJjl4zmYPfuLeNh0aRhhkb1G3QUMlylaSg5R4PsnerUKqWwVN025Z6ig04L0tSOu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvARe6mYNiGJgbRRSPAg4OY4e9uQViBCj0cr+kHxyANHybzjVF
	obLE7yVU8P+lZC5w7T6hm2y3DR3pckKriPlGyg19AqYmGuCSHxaUrqCxMJJ+q8U=
X-Gm-Gg: ASbGncutGK6YcpCBY7ElLv14/TpuBoKBoOUOKDAjm1A+kf9ZhH2nUOQWUfwhNLCfHo4
	3OZeJGULyYqQ/OCS4GH1/u6sWavg0eacS1KnsQD7LmjIBBXGx8Rj+Zjh/x7jHtpVtQabRR27jYP
	qXsp67EmyVQEylJ9QJz5xsVGWNZ+akGRTcb6PK4IBoP4GMJOCIuKhJCAFoDPJiGa8eeU2Y9+pMA
	rzd2plKbdjNPjBjVvq83n3h4A4Bju9J2czEFhEA6D8fk5Zr7NGM1r8WZtOKTxJB56tayufRC9lb
	TUoxgKCAJlExAaKLle0H5/C1SbSgvzgkIl3rx2Kbb56RDg==
X-Google-Smtp-Source: AGHT+IGDNKtYUu7kFstcQ1XCNXpXl4n26WpC2nuSu74CpmoGFHN0jVEyVEhzvXUVQR48PgPGl3hTrQ==
X-Received: by 2002:a05:6830:600d:b0:72a:1494:481e with SMTP id 46e09a7af769-731eaafdf96mr6094173a34.0.1746472943440;
        Mon, 05 May 2025 12:22:23 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:23 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:28 -0500
Subject: [PATCH 01/14] iio: adc: ad4030: remove bits_per_word = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-1-341f85fcfe11@baylibre.com>
References: <20250505-iio-remove-bits_per_word-8-v1-0-341f85fcfe11@baylibre.com>
In-Reply-To: <20250505-iio-remove-bits_per_word-8-v1-0-341f85fcfe11@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Esteban Blanc <eblanc@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
 kernel@pengutronix.de, Song Qiang <songqiang1304521@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=UGQcqHdSu34YDZoRD1XVkvJy/yBHv9Lh1BJRlQY0stI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ+MIchi+//nh67cO3B0ZIiSXPAAxLRL9+8xi
 IC4gcksNmuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkPjAAKCRDCzCAB/wGP
 wCmbB/4xNggrGkqqzXFkJQN6zjqHQafctoZSwdwv9YbrbqDC6LkLpdnz/ukX3hrpcn+mYqnp3cb
 f63KOv5PlJUgyY3ObBewAG16iq0aa08OduiNSfPfEBw+8MblQDn78fQDbqX5+on1X59sOViZsGA
 jN82esDp/ypfLSTApr3J/O3nPh24TxvsCJN2K4KCPBGg1ag5KPD7E7jK0nOvcqogfXR5i9T+GAM
 TS6UGkIsExkivskUcSgkPl0pmnVgUm5HyFHy3KR2yy5Gw+RJ9rpTeaPxY0e6CRsh0aZuk0tCEFl
 P6bNzoXH/HK1F/fpjWttqLcmnZuRJEb2/7k3UQ8FiNmux/nM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the ad4030 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4030.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/iio/adc/ad4030.c b/drivers/iio/adc/ad4030.c
index 5aa26dc3a2cefed9bcaec1b9f3cc127d06aff19a..1bc2f9a2247081e166680232aa6d4aebc5f41b89 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -244,7 +244,6 @@ static int ad4030_enter_config_mode(struct ad4030_state *st)
 
 	struct spi_transfer xfer = {
 		.tx_buf = st->tx_data,
-		.bits_per_word = 8,
 		.len = 1,
 		.speed_hz = AD4030_SPI_MAX_REG_XFER_SPEED,
 	};
@@ -260,7 +259,6 @@ static int ad4030_exit_config_mode(struct ad4030_state *st)
 
 	struct spi_transfer xfer = {
 		.tx_buf = st->tx_data,
-		.bits_per_word = 8,
 		.len = 3,
 		.speed_hz = AD4030_SPI_MAX_REG_XFER_SPEED,
 	};
@@ -276,7 +274,6 @@ static int ad4030_spi_read(void *context, const void *reg, size_t reg_size,
 	struct spi_transfer xfer = {
 		.tx_buf = st->tx_data,
 		.rx_buf = st->rx_data.raw,
-		.bits_per_word = 8,
 		.len = reg_size + val_size,
 		.speed_hz = AD4030_SPI_MAX_REG_XFER_SPEED,
 	};
@@ -311,7 +308,6 @@ static int ad4030_spi_write(void *context, const void *data, size_t count)
 			((u8 *)data)[2] == 0x81;
 	struct spi_transfer xfer = {
 		.tx_buf = st->tx_data,
-		.bits_per_word = 8,
 		.len = count,
 		.speed_hz = AD4030_SPI_MAX_REG_XFER_SPEED,
 	};

-- 
2.43.0

