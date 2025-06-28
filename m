Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47B211276
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126419; cv=none; b=O0lvdc82sbYcauLlKeO3lpWL1PqjWbMPe22UlMZXCJKKfj7vm++cnyVhhcC3CQ1kKJComQu3w23EpQAISyMBIMLDOf93BXX8RIaqMqEMOS4OKTnSC7B4nUF0o5jHOaq0qpVl50wjv5rInnl4MyyL7PIRuIOkYwtJVWVBn8f0lqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126419; c=relaxed/simple;
	bh=IVJGIak5i1lqPUyqPDqlGVJI5zTZBXVeYZ74KjBQj6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bwjO4BUBro0qL5pvwGNXUCOKg7clO3iRurxztlgd75xBEZJ1vNKX3idUNgo903hrwrrUQHLOe/lu6XqYMX5XUynO9co59juN1WrYD1/0JuCuV7pOC2lovEbe+u0X6eWJbkvPSETX5GW8NaChGSIjqzBfR2V9YBJXKnhynmZ1j28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xrAHte3y; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xrAHte3y"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-73a8d0e3822so1608234a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751126416; x=1751731216; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fyLjvDKvqspmdjT3FpklSNY0+sdEyvNzdK0N2B2mPeg=;
        b=xrAHte3yghHyDS4siaK9OdZOQC+3v2plAZJega2/FbRkKxrtkLCXxE1CEWhcLHEe7j
         ab8WhiGu416lGzdBFxzGLHXJ/pD5O3pKOyuVdge1sxfwGpuzUezHx7weB7u3h2UZ5d6j
         l7q0L+csy+M7WiIz3w5a6LfPpn3t1900ebkp5vqE6CVM/0/ojyniIV5ro9x8SFNX0Fqs
         wbeqZxHR3pe/eZEjSuAA/4h/Y7ocdQXzDk0aM9Xk77CubcG+g6+R5YCHIoGr9Pf5wCsN
         JTaedSs2UpWr9pbPklaqncPGBstuV3j2ybuql4kWZYdPeEPxjyYHIsza285GDpauvGcg
         TtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751126416; x=1751731216;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyLjvDKvqspmdjT3FpklSNY0+sdEyvNzdK0N2B2mPeg=;
        b=kjjArDMNDP+Hs2UDSyWbfNx4cQc1YxOcup+ZKLr/2YASwryv6W8TurPbGxfWCfL9vZ
         xgpPIzAJQGl9ysMumZMcK3IUUMGhJu+mfnK4ZnVojGxU8mzkY2piQ8ScOu8X4V1ItKf4
         VEDExW9Bl4K0PiSDTPsC5ck9pnb0n4jfHBH7mI+babpTiSc1uV8h55K0kPlmst6FAjAd
         uRxgil/Uo28BvY9225GgVcZ0QaM5Tyyp41dqtX87eA8kO2Oz6mK9N5LZ7IMW2oE7L3OC
         R2dTv2nMjU+g1TAhlHMGIKCwmPzxbHBIVaMlr4+knS78rgXZLVS2TmZ16wus+NEJHuxY
         zNwA==
X-Forwarded-Encrypted: i=1; AJvYcCXDns8GJutmNLVtzxhZHpw02b0+U0Z3avqprAg5w1X9vv7RexHhHSYFI7uwSLO+8zC3Rm29KafFeV96Uyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9B5yDBOMnqBc318yit321ScMef/OrbVMv0uk6op9k7q6uQvph
	AhphghEO8BkohcTqZyER6MYiAmMn5nxQwV1QvG4V6McN4xDbHO8mI/NgLEEHIq9y9JU=
X-Gm-Gg: ASbGncudhRLTmHHeRxFmMQfcMU6o5QamwsApEi5mvHcyj9iQY8PAp36Ce32apMvcNHR
	S7FQ6x46sPv/KQ4wSplgVvz/YlodT+cbGVRIoBKRelSNXooqAwEJY51r90MeG969kS7kvRDyQBV
	ltipChfN3U0j49lMvWTpo/cI455kF7FYKCsbgisqiKLq84xP0LcWFKfXmG9fBPkDZ2FlYYRIbwU
	sP8vfXz8hNpIcqCtpBo80N36BKTxvE8OyzqbypFrV8O5Rm4MYXB4OdGLNX1wnkWTzOI8tJwiw0X
	HAvxUzlSAQ7eRyqhPhm03Wx8Axm+DvsrGQ5mbZFey8VRrxJSI0WmELw7pDjcEFps+7Px
X-Google-Smtp-Source: AGHT+IGCQ29Ecqwd6tMQskL/FRmQkOakxzutOmMQV0OJAEWQqc6XI0yI6ppVmkAzyhHD6J33g8MgQg==
X-Received: by 2002:a05:6830:8104:b0:72b:7a29:d680 with SMTP id 46e09a7af769-73afc5db063mr4086697a34.10.1751126416505;
        Sat, 28 Jun 2025 09:00:16 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb10091esm847348a34.46.2025.06.28.09.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:00:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:00:07 -0500
Subject: [PATCH] iio: accel: mma9553: make mma9553_event_info const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-2-v1-1-a61da3a0941e@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAIYRYGgC/x3MPQqAMAxA4atIZgMaUItXEYf+pJqllbaIULy7x
 fEb3quQOQlnWLsKiW/JEkPD2HdgTx0ORnHNQANNw0wKRSLaGHJBp4tGwsWR9sbw4pWCll2JvTz
 /ctvf9wPc001YYgAAAA==
X-Change-ID: 20250628-iio-const-data-2-7d2afbbe7f88
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=IVJGIak5i1lqPUyqPDqlGVJI5zTZBXVeYZ74KjBQj6s=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDISBNubBC9H31+ozZLN4r5sxuTyXYaym25ME9R6s+SKe
 lhsZuPVTkZjFgZGLgZZMUWWNxI35yXxNV+bcyNjBswgViaQKQxcnAIwkRgB9r/SbR1GVZFnY+93
 5k7ZVq6gJLXqVVPVB6+fdu+Xb3dSPJeRv2WnXKDJc+cOrbgtccLtGVYZPJcnN+oYzF0lWrK1gkP
 ZubBCOMB/rVTU5YYrnBoBTheaX6i3XOpUehIcbv9D4Y3Fa6VnxsJpLxavFfTuYRZ9+f3gwXfpWz
 58F46drn0myrInMOLo2aDnpr1eOWJi5kreE64VBDFV+t1Z4W6QeV9v9ZkWocOPTOZOcrIz2uxkk
 L6AcU/fYtNsn4+z+Bp/rJ34/JHR0ktq/Gl7D5z3yrZOWMpn8dXmaN1qgfuVzjN/iTYo1vIZK4Yt
 VO/alLxY9LTYrB87Ngr8+i92rj/KoFu9RfGT5NGv/gaeAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct mma9553_event_info mma9553_event_info[].
This is read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/accel/mma9553.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/mma9553.c b/drivers/iio/accel/mma9553.c
index ffb0d6ff37124e5f364168c5c4f348a02d28842a..f85384a7908f253f9ed55dae4e0a41a39ae6016b 100644
--- a/drivers/iio/accel/mma9553.c
+++ b/drivers/iio/accel/mma9553.c
@@ -97,7 +97,7 @@ enum activity_level {
 	ACTIVITY_RUNNING,
 };
 
-static struct mma9553_event_info {
+static const struct mma9553_event_info {
 	enum iio_chan_type type;
 	enum iio_modifier mod;
 	enum iio_event_direction dir;
@@ -152,7 +152,7 @@ static struct mma9553_event_info {
 #define MMA9553_EVENTS_INFO_SIZE ARRAY_SIZE(mma9553_events_info)
 
 struct mma9553_event {
-	struct mma9553_event_info *info;
+	const struct mma9553_event_info *info;
 	bool enabled;
 };
 

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-2-7d2afbbe7f88

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

