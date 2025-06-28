Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B722BCFB
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751133401; cv=none; b=tE/nJ9QIm+M+ObB9+rSGP8/sbY3Ou4ewK7RlwqaHDTBy/2GLlH7frC78AmdU+ivZauxmKQUjfh+w/DFt6XVnUTWWy1h2XJczeAaSq9a6hqkL/33CLotp73DnAinyCTtF5jubKzJe7z9MD/mj0Ypd83b4NGfWjLXjfAUurwxqJCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751133401; c=relaxed/simple;
	bh=JBk9WP0FKE28O1qIszkoqlfNNYdDI52GEXhm+ZF7t5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l2d8FaADB+RAB4SjXYg7dGQuDwSzcNLwBw2Ns4dbJNXZSBBrt5je2qLW9XnKQTSrZ+F6dgRE0qlK1T8sCGLCwR1e4NKHCb501ttUKyO5TIJm6lj4pBsgfl1TMT7Ec3ZPk7pZu7stjBjtzv0kpAuNrW5tFZk4jCdZQZ1kLZG0b3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mzDmSKcz; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mzDmSKcz"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-735b2699d5dso487479a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751133398; x=1751738198; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDxgNkTFcCFOWjUGQJlLAEdJztvw2j09gi80u37qagE=;
        b=mzDmSKcz4AlqFHLB6EZY/B+2qcAP7Oh9UBEqypbQqqkuYSjFnnnEEETdOmhdBtfZtv
         mhmlSRJcX/jyVhLcVHehRANgJLQwpjf5C6PsQaf4BNlUQX6lSWCI81qrALVTBQicWdby
         fvx0oPLemMYBr1lJi2+mIkbV1SHj+ueC3juoI/DCdeITIl1EVmZgznGX5gNjMeFlVfVP
         z6AbORkG6skBwZbdS7rpJEpGOES6wID26nYIe+WtrOv+MYRdTvOJzRi6KXNTDdNmKumq
         /awjxqXI6804QOSTK/VkgQciopkNQpW3a1C3MLYf+zY5VgyssZEijxpumeTHREbw39Se
         qm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751133398; x=1751738198;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDxgNkTFcCFOWjUGQJlLAEdJztvw2j09gi80u37qagE=;
        b=TpY1OHZaDwicyW99l1RsTkihCcHy9j1jl2kxW26AX2bRQrpSVf4YFx3StZUNsWas2L
         8I/y9DMj3zLBK87/OPCJwx4B3VGMyXN2g8iCrWammcqe61oEU4r+9r3CGmw/ixx7Ff7Q
         g0XbCuAnWAWEZhrvW/fL96KQXXJpRmTaKSITVdz4EDO+kfUB1SJ/EyG4lG2D2Y2FGmUS
         RXO9A9FHNmoePA25YDOBmawy7UOnl/r+2Na2KM5iKXsdXspNXfMhhdJu9BMys0i4aTNd
         Iy7oY2FR9+Z4McbJWMz//aRwUij7jLN1PqxhvN369HvGukTVCcCz9LHj8xWGcp8XSCJi
         wtuw==
X-Forwarded-Encrypted: i=1; AJvYcCXQeB2fqc5wHDfT3ou4Mkn4ZZM5OKq4QVIa0sPvp7R16y8zRpmLGMubO+7LSoEgTzIiQBpzP0+DQR3Pp+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2we1BdF+XDyKnphLYjFJUi5bRs5GlLAHzqmyEvjrRCG7FJauo
	b+BP+Pg4OTYxUUtuLT5ktgAH9/hD39RPt5z8rBt6u7icRULw3iKOGuZJASTnJ8xIXwY=
X-Gm-Gg: ASbGncvjC1Om0TwQIcPOks3eO3bd3A4pGMam56dH5SNGOxSCDoFB5esF0AmvTx+fQx9
	ZQplGMP/qc6PGvvVP0VtB4BQNjrZzYvzjR+BCbu3v9qBka4Fc8vtu8/pCsZMpolgoF0UBrom/NV
	XigC5HkvedeszFX7z4Uj9wG+L0op8QdrZesSNc/fIg03SJZOcmYNBUxGRsXiVqkXngbUK1MDuBB
	XfkkUborpZWhEuWQIfJiYq+ErEmwLvsUnQLw8JNcnTQ1E0WVy9TY0epOwfdBywqVg01zlh05dNh
	T6YHgNBVmYkVnpCIqDkbL8uWgO1XExHPKQQQ+fFeI1a0RoX5HP5+sbSqgPorSB+l7xVI
X-Google-Smtp-Source: AGHT+IH4KzsH5WPvzYfogiCxl6giW42BKk8skAQra1j7TDnbhG+zfDK8NDPvYV+3i/fMPpWMQ+V2zw==
X-Received: by 2002:a05:6830:2c01:b0:739:fae0:73c6 with SMTP id 46e09a7af769-73afc5fcd24mr4223815a34.25.1751133398623;
        Sat, 28 Jun 2025 10:56:38 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb107871sm889691a34.58.2025.06.28.10.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:56:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 12:56:30 -0500
Subject: [PATCH] iio: light: zopt2201: make zopt2201_scale const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-22-v1-1-fc9ebdc5f5c3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAM0sYGgC/x3MQQqAIBBA0avErBvQgcy6SrSwmmo2GhoRiHdPW
 r7F/xkSR+EEY5Mh8iNJgq/QbQPr6fzBKFs1kKJOGbIoEnANPt24udshERpmq3tteOgWqN0VeZf
 3f05zKR8k5s/oYwAAAA==
X-Change-ID: 20250628-iio-const-data-22-6ee81716e95b
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=JBk9WP0FKE28O1qIszkoqlfNNYdDI52GEXhm+ZF7t5Y=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYCzPwNqAPoQUvE1r7WtZsoWIvJpGUwsfveF2r
 rsCsi9t8uaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAszwAKCRDCzCAB/wGP
 wMOyB/9R3isEgTue+yiloDQvOmT+ruI9EQxhn9PjZZTeeF0RLxERC8QR/SOmy9/5FQBFLpbJKXc
 bXM7dG5aZpmqP1Uo0tHcEZW03dE4FsiHnZ0+OZq+S6As78zvqftwpzeVazPjoQpQtvTAXYw+G8s
 Hv4pHOeQ6FIt9JdAwTDzEzcTziNZ5+jiuSlU42ayB9dLautiTDrA1A7FGGrGMhs9eDx6NHCKlOO
 IZHOqQ2Ok5X+jemAysd0h5ACeCtjfXxrXT+aAh4sYpBUsgGCiugAtPEygX0fM3im6tjvsRnH7ao
 d5UtM6kHWOm0s+Jh3c0++SsEUC1DImWYCBOvENjhUxkcK9HO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct zopt2201_scale zopt2201_scale_*[]. This
is read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/zopt2201.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/zopt2201.c b/drivers/iio/light/zopt2201.c
index 1e5e9bf2935f63f9af4cdbf29f825b218ec477be..1dba1b949cc32d2897d8acdd2f981d8a919e7da2 100644
--- a/drivers/iio/light/zopt2201.c
+++ b/drivers/iio/light/zopt2201.c
@@ -119,7 +119,7 @@ struct zopt2201_scale {
 	u8 res; /* resolution register value */
 };
 
-static struct zopt2201_scale zopt2201_scale_als[] = {
+static const struct zopt2201_scale zopt2201_scale_als[] = {
 	{ 19, 200000, 0, 5 },
 	{  6, 400000, 1, 5 },
 	{  3, 200000, 2, 5 },
@@ -144,7 +144,7 @@ static struct zopt2201_scale zopt2201_scale_als[] = {
 	{  0,   8333, 4, 0 },
 };
 
-static struct zopt2201_scale zopt2201_scale_uvb[] = {
+static const struct zopt2201_scale zopt2201_scale_uvb[] = {
 	{ 0, 460800, 0, 5 },
 	{ 0, 153600, 1, 5 },
 	{ 0,  76800, 2, 5 },
@@ -347,7 +347,7 @@ static int zopt2201_set_gain(struct zopt2201_data *data, u8 gain)
 }
 
 static int zopt2201_write_scale_by_idx(struct zopt2201_data *data, int idx,
-				     struct zopt2201_scale *zopt2201_scale_array)
+				       const struct zopt2201_scale *zopt2201_scale_array)
 {
 	int ret;
 

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-22-6ee81716e95b

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

