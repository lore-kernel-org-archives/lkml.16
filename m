Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6992C031D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466477; cv=none; b=ie8RVS3rAyFWewkXWMRn9ZfmLcl1NcvY57LMbez1s9OQKF+HX+WOSnJK5NHE2ec5+e8vencr4kVT/6Q1RdtSVwojANQFahD6GuP/VegJh107TtCZO7nQucbMmgVbVV/i2bAD5qL/7mDPExsphRmjqzBcnK+cKVzneKWkDY4fm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466477; c=relaxed/simple;
	bh=01R2OLtjIiDGpQmDUeP4wuVqMIm0YMznanbsb2dAoX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kBJSkizt5BVYBIVKzaIhX21CPv/AuqQemCqajPF3zNQsSlMNJ+Ld6+j3gNcK5Ab0RYk5zqb3eFAWOCY3bnQB/lw++ht/oYhFByx/8P+PVCDOU0DrlUgWzxxFHXZpastbWk4O0cSg9YYktiGcNfVCgur3X9oOdULpfhEiEpoCkUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FFU+0Q3O; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FFU+0Q3O"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60ef850d590so1486631eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751466475; x=1752071275; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sB8dp8LL/3knt9eLNmg4+mqjhhit9Ow5MDWrwFdT9Qg=;
        b=FFU+0Q3OBw4B6Amc3ueerUithXxrJQ/fwYrggU0MZjPeRUaAeVRswPzpBhwrKhKhmC
         aY37rGaPNWtFAyzTvPA4678BpdDvoshqKDSis4zBqndGDz8TVxDqJDEZo4qp16qhI25L
         z7pFvznLriIb7ZfPxUetWi9eS+ja0gy9JT9pKBJwOx8idutMJ9ZM+PXfmAVAp1aHLZtf
         A7zEpwP4EhFXTSFZWjJBFqB5gGodF8uI82wgbhVXmCh8PQN+b2i1qoobCGoQ0DwcGoSA
         v6K9X8lV6Hc8unYrK+2nwO/uHXXmt1C5tUIxBRHEc/zfuI6Ue3bi32wkAIJudQL09oJ/
         B5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466475; x=1752071275;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sB8dp8LL/3knt9eLNmg4+mqjhhit9Ow5MDWrwFdT9Qg=;
        b=GuYrrgj9Y7qfI9QcU3wPj11Eh+YLvZn3qkfXjpWT3maT2X6g97HQ7lnKfWawyBmQhC
         Jsd4+igS51l0lTpsECZSDZ9rqqOT5BbHYL9rzjEhcJWKRPpAzENIsX5nNfMgO5pLOQeC
         8Ms/dr7zcPI/ki/zCzvs1UICKL0Innt8JQhIXxS5xBIJVBypjUq2grTbTqvla+y1IbNC
         vaY8NdlGx87ygio90kyW8dhmLym4Nmq4AKxOgEYbTVq2AJ5zIPBmv2yz44qBptz0e2uI
         VFAgGMNFNAI1gXGwGfteZtwH0iw4M19ILL94u+FVkJc5+b16/Yt4x08nC0dTgmq2WC5I
         Ng1g==
X-Forwarded-Encrypted: i=1; AJvYcCU48oVWUkkp6Vm7xROVOBTf9e+MBWvInZG7ccUhULfDoyMMHD4ZBxuiqndj5LuRzDbLuQ5mcyNPWNzB1Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Q7X19SNiaYtkept/msZVc1z2RBrHHAXhDxkCLqbGWNYf1nAh
	y6HtnqX4wZXOZoFBBinaWvhJ/3a7GN4z9zX9TIJJ/Ksoi73OFWqbZ6ve4BT5Pe05MhC7rfiBqeA
	QgkQW2Qc=
X-Gm-Gg: ASbGncvYnILrEv5iaYB0xWK57C2BaIlOnmOlNN+Pi+vtdHgL4P8dxO5UcVqm+LJsSYh
	DdLyg4wxgl7OyNjONeVhQAnlOHonNgRKjnucvhaFs2iQ/GndjFgbfh6M0AYVkUW6uzGIjtH6o3j
	n9Urfx50jir+YnqwiEGEy/A4wrfzQohGPUe4XkDEhO7C4JuYLG/tYBrxT2znZ1L7fnJruI7v4kf
	cg2wCa00OsVisCSZRY42FD9HN54EA+iU4Mw3+J1cYNS/FXJxsWlMcC4fOsPT6CJUf964aQ2dNwW
	LfniZsZlSjN2W4rbtcjjlV8cTSCFc1aVZHpcZancN2KZ2jE37SzP4U+222U+r73uy+XU7xvJ967
	cjoE=
X-Google-Smtp-Source: AGHT+IF7a/tfS2pIRmAITRw64ldI92ye6wDigYl3F2PvfXXOUZhmxOgZJyC9XOfbzLa7xL9YJfZAKw==
X-Received: by 2002:a05:6808:201e:b0:40b:4208:8602 with SMTP id 5614622812f47-40b8853f92bmr2309678b6e.4.1751466474555;
        Wed, 02 Jul 2025 07:27:54 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32406a64sm2544016b6e.27.2025.07.02.07.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:27:54 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 02 Jul 2025 09:27:45 -0500
Subject: [PATCH] iio: imu: adis16550: rework clock range test
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-iio-imu-adis16550-rework-clock-range-test-v1-1-b45f3a3b0dc1@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOBBZWgC/x2NQQrCQAwAv1JyNpBd2Vj8ingou1FDtStJq0Lp3
 116nMPMrOBiKg7nbgWTj7rWqUE4dJAfw3QX1NIYIsVEJ4qoWlFfCw5FPXBKhCbfaiPmZ80j2u7
 M4jPysQ8sTKnnAq33Nrnpb39drtv2B25XJHJ7AAAA
X-Change-ID: 20250702-iio-imu-adis16550-rework-clock-range-test-63816e60586d
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Robert Budai <robert.budai@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=01R2OLtjIiDGpQmDUeP4wuVqMIm0YMznanbsb2dAoX4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoZUHiObQrIb8ZxMtFlqtUCpRQkLP6UBIRVXZ/8
 fn5mX0DneeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGVB4gAKCRDCzCAB/wGP
 wFj6B/9DkSqVjEpibp8Uk+zgXLKItCusxDXINgyuV93n/2OouYKbZxiqQm8oFAGGbYII4KdUWkq
 /UhcbH4MTbh6+PtK342/WuVX/OJvujLXI51NYw8uWmVsgVn9IsnPvrEjCmffUJae6Lpa4f1Dvqa
 rMRoGE2Ks7axA2zT84nZNOhGo8J1jzo70Yj0KPpfSpshHJDxId0ZzkA8kHo1A0lyUHFXqbZsx6i
 MsMEHn3CySL/Q0VQ01uVncwt68cAfuy+cuBJaUz/b7ICK/bzkk0XA+ocokkDnZxqJCEv/H1QUKZ
 j6gKkvnNJm6fxOzKPeMcoLwkKwaB7bQhm2qvGQ7XoaMAf1aM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Rework the clock rate range test to test if sync_mode_data != NULL
instead of testing if the for loop index variable. This makes it easier
for static analyzers to see that we aren't using an uninitialized
sync_mode_data [1].

Link: https://github.com/analogdevicesinc/linux/pull/2831/files#diff-e60c8024905ba921f6aac624cae67d6f9bd54aa5af5a27ae60a8ca21ef120ddaR950 [1]
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Here is the for loop that comes just before the if statement in the
patch so reviewers don't have to look it up:

	for (i = 0; i < st->info->num_sync; i++) {
		if (st->clk_freq_hz >= st->info->sync_mode[i].min_rate &&
		    st->clk_freq_hz <= st->info->sync_mode[i].max_rate) {
			sync_mode_data = &st->info->sync_mode[i];
			break;
		}
	}

Previously, we were using the index variable `i` to check if we hit
the break or not, but checking if sync_mode_data was assigned is a bit
more straight-forward for machines (and probably some humans too).
---
 drivers/iio/imu/adis16550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/adis16550.c b/drivers/iio/imu/adis16550.c
index 28f0dbd0226cbea67bc6c87d892f7812f21e9304..d733daaa05bcf0b0cfd710330230c671e66feef4 100644
--- a/drivers/iio/imu/adis16550.c
+++ b/drivers/iio/imu/adis16550.c
@@ -909,7 +909,7 @@ static int adis16550_reset(struct adis *adis)
 static int adis16550_config_sync(struct adis16550 *st)
 {
 	struct device *dev = &st->adis.spi->dev;
-	const struct adis16550_sync *sync_mode_data;
+	const struct adis16550_sync *sync_mode_data = NULL;
 	struct clk *clk;
 	int ret, i;
 	u16 mode;
@@ -932,7 +932,7 @@ static int adis16550_config_sync(struct adis16550 *st)
 		}
 	}
 
-	if (i == st->info->num_sync)
+	if (!sync_mode_data)
 		return dev_err_probe(dev, -EINVAL, "Clk rate: %lu not in a valid range",
 				     st->clk_freq_hz);
 

---
base-commit: 6742eff60460e77158d4f1b233f17e0345c9e66a
change-id: 20250702-iio-imu-adis16550-rework-clock-range-test-63816e60586d

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

