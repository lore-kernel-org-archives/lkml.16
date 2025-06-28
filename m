Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B421A436
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751135053; cv=none; b=j7ueruHq42vUOEEPhKGlMWpujR95OoJ+Eh8AxJe7Lek+KxDK8rMvShXLKghH3YtaqqNL+TNf6Gf7BaqFXsP71t5u93Dz5Dq+WeN/NZLqw49+B+GLMlSJ9PUx3vDaBK8uuSGb8eq8NoJGC5pe9EsLe4THdSI2L/iHlOdQz8niJyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751135053; c=relaxed/simple;
	bh=gOpaFFvBcVRFK1v2PGxkijtRj5a265XWkJQRwynhLR4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GEPDIyWaFy/UadvNLFdpUbf1snGEEGX5sR/IaB4cslpjsgfZIclKvlnaEL0NbuLjj+S6XE4D8VGRyduOfOufTWYB00Q1gu8V84+YxVgi+L9q5dgwmzdjt741LPxmFfxuJw5zjANk5w9ITpRq0sL+SeitDsv7Non26uMZQWSuA1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0OX1+OIZ; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0OX1+OIZ"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-73a8d0e3822so1648884a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751135049; x=1751739849; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E1s9sMYij456vvbKT0E358QK5dyjHY+/6micxnPVYVY=;
        b=0OX1+OIZr+cI4tsjQoyb1KM7x9MpgPuze1PcgiMNlLeygWp63nDapqIRRmwMRNGvN/
         89E20NkJppjw5SZyjCe47GySZl6kYuEgVSgh/ImW6ij+jwCYtoJ1RsEmAGTjBt7RHlm1
         N92zPUDgPm8wsQBU6kEu0ewcVzE7LWvyl0PwNe4N07/R9nyI2B0vwmaQXyyqurpayWfK
         pRPzdX1fivdl+PbNfaXuc9/+SWq9QHgluSBWbKTMFuKm6sH52/Xl1l9OMTa6EiQARMev
         uDCCNsS8Yl927/mdISoXYbndD3G2JrV8ls5N7lfCRERm76RJSa9ksCGjyR/5KUiudExi
         51Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751135049; x=1751739849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1s9sMYij456vvbKT0E358QK5dyjHY+/6micxnPVYVY=;
        b=DQwVL2qOsTbflEa5bIzefBZ8ltKk9YW2fQhEhmMdwx9jT+kTQWIoSW8pdCL93rMdRF
         SvjA1yyNIF7ViQqJi84TS6+aUKEYo9UBsa9cj8s8bqq+4fnx8RuaAyFU+eW/veu7Z1Rs
         9seJjEpr1HAMHAIpDA96/vqS4YhRhNTrHAeRSJTgOg52XMby4aQWfelBEpBVj0XDEHpN
         okyciepSazuV4Ey0oJcnqBxls/vqcwTp9TUXPzvW/RbqVTdv1DV3wVb0YJTwRNeGhwtm
         Oh9BdM1oq7GDipch/wkVKgPCHv2zR+Lj/SaKhi+pqTLpCMHXRDkglgtf+sskNGi84eaY
         2JKw==
X-Forwarded-Encrypted: i=1; AJvYcCWNbUflH60CdTAMsDmnURv0Lh35KLmfreEkA2+Huzht+7bSaFqJXmTRVOyzDA3umnxZxewnfyumoqcaxuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLah+VUDs0JNGf77pXRYo3skj7hEmjAJTC0vo8tmNasKwAj3ZB
	Au9KTG5MUleAY4yl0R6bIFOA/10HepTuqY8dar3L2QP8ChPfsgU2haPUZel9b2vCZVVwOF2tsGm
	6rsBDQs0=
X-Gm-Gg: ASbGncvJWx3Zu6utpoyy10F1K2PJmPjT3MKfYdIQuLDopBf2z5smAc4nrZsy5HlpXjk
	e1wyo9J9MHH3hJN7OqNRVHgWnQ6tTwuhpw2GUPPtcfzxFwlKAd9ImuaQN8vrpJX74LQGnWhkx9G
	+5NOuj+cSiLzjd+OQueagxnqaalSIyGpSX94GgVNWGzUAtizFbkLR5r/6LzoAFx/I4b67dFpwP8
	1U3iVKxSY5zTZPN8/0Jt4j4c8lnXgZNOc0L6XjYpTMww7ilGbHrq/7/ifd7JWTOAyOV84oTL52m
	6q/G1TgKc1bxBGHbtay7DvW/y4l4n4s5MEYAm3xOokXKIuC5w72e1lHCw9os+IJZpY6t
X-Google-Smtp-Source: AGHT+IH5OYz4SKEt3ZBcOmmb9hP2yDRcYRG22h14b6ieh2r1YBWcyczxB4Ki7xB3SIcrrPidDfb3Fg==
X-Received: by 2002:a05:6830:6111:b0:73a:9158:fb7e with SMTP id 46e09a7af769-73afc6b9358mr5829357a34.25.1751135049355;
        Sat, 28 Jun 2025 11:24:09 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afafee682sm902248a34.1.2025.06.28.11.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 11:24:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/2] iio: proximity: vcnl3020: make vcnl3020_property const
Date: Sat, 28 Jun 2025 13:23:47 -0500
Message-Id: <20250628-iio-const-data-25-v1-0-5d99cf17790e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQzYGgC/x3MQQqAIBBA0avIrBuwKaO6SrQwnWo2GhoRRHdPW
 r7F/w9kTsIZRvVA4kuyxFBQVwrcbsPGKL4YSJPRHfUoEtHFkE/09rRIBltDPLSmr5tmgdIdiVe
 5/+c0v+8HpAmQr2MAAAA=
X-Change-ID: 20250628-iio-const-data-25-452e9458133b
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=665; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=gOpaFFvBcVRFK1v2PGxkijtRj5a265XWkJQRwynhLR4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYDM1uyUQKI0+xWGenKc2Eh1OJQY5nLOq6nHdD
 Jm8y9n9eCmJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAzNQAKCRDCzCAB/wGP
 wLqXB/46MakgXfPNFbFgpa0BjxaBu7efCBS0VQWU13WBIBCayUW+x78cwcOOmqsttmDVJPenr1m
 tucl7wAfd30MbQFOJDmhxfAiokuUF0w8+P0VRvQ2PT5SY/q0rudFGWkipteDt9JmghZwxQ0dOUq
 S7PYNhGr2IZjpHxPEe7keXtLj22uspjKEeUmKuB8fwZGM3M6ammhZomES+xNGj4ANh/tM1C22XK
 WXNOkpt+OEsOMPPvT0/rPERF8xiQyWStBYTXUhwNXKCoG1tVNFXOpRYE/EgNzEzEF/l+tPxmXkR
 FX0lm9kdW1h2MT7fYwSa/iugQEJ+cQGbTwDymktuBHfHnXqW
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

We can make const struct vcnl3020_property vcnl3020_led_current_property
const since it is read-only data. For this to really be useful, we also
have another change to pass this struct by pointer instead of by value.

---
David Lechner (2):
      iio: proximity: vcnl3020: pass struct vcnl3020_property by pointer
      iio: proximity: vcnl3020: make vcnl3020_property const

 drivers/iio/proximity/vcnl3020.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-25-452e9458133b

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

