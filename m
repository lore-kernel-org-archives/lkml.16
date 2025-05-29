Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463622D9FC
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748537635; cv=none; b=rGv1+woirY/1JKF+ANM8klvCAmMlU+3xymut2x5K0wH1k0eNAgW/hkruufGAyCthsgFF/dmmBHuZ0BSZKUnUEUJ9cECuuwKPfxwUYejXIACUMHUV3wqJqjxgZpBd4+BUpuJnPC1yO1NgbBXR2iqo8TDFbUyRL8Eu2BLoGty9GZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748537635; c=relaxed/simple;
	bh=tXN/bUv5GGn68VfUhe3b6vC2z9pHKfDijFpQd04/NLw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qDICEEb8yn7qh7zxDW2rI717ibZTW02ekwDs/zlzq/vlSnob64RwnuUKMj7kLcW4eVDvg/JE7UtadlopoPeSgYLPH79fNSZVgOuYyP+3vxb5nd1Z+8A12J/QDdfOYMZFOb6w5FHWTgGrrqoaHZSZcfUmJnhWAQvYxSJqh7fDlmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Bw+fx9wm; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Bw+fx9wm"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7304efb4b3bso671561a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748537632; x=1749142432; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PxRvSUzHeev+hBLLES5l8w1nd2OHwRLbMnpZSS6PLIU=;
        b=Bw+fx9wmjb6Ymxt1d0h3TOj+qcW1ZmfSsWIZQ3eYpE9aiYlfDQa460FBWpejn33hm2
         1d2jaA5brvHCOZ+LgWLhkArWqKfb2dgiVBMcDIVvhvSFz88XtlnvD0hiqLKkgtcxKssb
         EGooA9wjJOdkkjWik1nCeu4U6BRSh7w1qzxDuAl8HxLF/aRrZkBhL4chD8BHf8FOQLpS
         C619VC8JNQ7JEVM8V1FfC6DENiSPbnIM6H1QTaUx75tvLsP8Se6MwQ2uBT2u+xyxTugD
         MR26xHhWn4wA+/1TpZdr8BWoFjJtYaPia464bbG385eJsAXNVmBUkpYxPH99wGkHzq+i
         EIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748537632; x=1749142432;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxRvSUzHeev+hBLLES5l8w1nd2OHwRLbMnpZSS6PLIU=;
        b=t9E/BOk2E9WFRMvxf8d+Fnxs9M/AoGcIa7rvHTt7YFxeTOfkmHa4TJ5OASbhtHGV4M
         JhCun5wE9NXuahJ4tWn7OMOLmk7kEHUO4P0zXFGBO+IdF/0Zi3Vzm5gxeCQmvceJOJFL
         nKdP/9mVd5RkN/KevKJfNarAzLQsbuq0ARDIOzCYGfZBkyKvQnq/s+VWxowywK4/SbE4
         km5rcGY2erp3FrcKRAfi+AVl2RlkdJqvqKhusVwH0Q9aN8cMRifZqdEvQuxILqOpWMwu
         lAI7kKKEtpXOLwR14fwWnwcSV5AlUW4aaRKmo8vt7MKtaNMvOCrMqg0k9/B2UagVITD0
         90Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWMGvpvBhH2kgEf/kJO0qA14oMPQtH5wTAaOSYYmi2by87ZqzZL5D5r9hZrXhgjsdJFsURXA2MjwP1fDuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjeDgkGw9nwHFxzqFASVwscptBGQtviszIEUuxQFCPnvQ2gsx
	5MHBx3Bap2huUiftGH6GXfzz2ENc+v0HCqVE+lxOEvmMz6+u8X55QDjp/RINPXyeGAa3tp+HByQ
	czCD9
X-Gm-Gg: ASbGncuetG+tu+yevYOpiUi4aehKD5jd7Z/cHnImTjzPVUh1I4Pg1iAXEBAEKEXHUl0
	yX/2ZjTxeKvBKBfcNEcmlUbWwmfLdgx3WlcuwoQJrXUP2Q0TAEdyLN9iHATH8/wrwaRr9G9gOtA
	n45haTz0D3Ewird2xAJF6VRx/eXUTKHulorYTD23gnkZLGJh8GFF/xVGao8toYbGyUReWHugXyO
	pxfeFPjKgget94gImgCEfLE4e6eYOeFvwBxHyV+wY351qBBtm8tgPVxXIaEdSh9Nb75FdOfovZK
	+hr0YaDjTmVuNkDiFziXxFDxrKkHGYjpDjDxDeFKsNoiw0D3GNpr7dfg
X-Google-Smtp-Source: AGHT+IELS+hG7loPhc/Vw7Ryo09hGdzU1FX0Hl6otVIzbS6UeuyM3wrPyUK6DPm+l3cfGDB550/IyA==
X-Received: by 2002:a05:6830:380c:b0:735:b0a3:e485 with SMTP id 46e09a7af769-73676b88f9bmr33364a34.25.1748537631732;
        Thu, 29 May 2025 09:53:51 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af82d2b8sm303265a34.3.2025.05.29.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 09:53:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 0/3] pwm: axi-pwmgen: add external clock
Date: Thu, 29 May 2025 11:53:17 -0500
Message-Id: <20250529-pwm-axi-pwmgen-add-external-clock-v3-0-5d8809a7da91@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP2QOGgC/43NsQ6CMBDG8VchnT1zFGnAyfcwDuV6QCNQUghCC
 O9uIQ7Gyenyv+H3rWJgb3kQ12gVnic7WNeFSE6RoFp3FYM1oYVEmWIap9C/WtCz3W/FHWhjgOe
 RfacboMbREzBRl7IwZYZ5IYLTey7tfGzcH6FrO4zOL8fkFO/fjy7xD32KAUGRUQkRYkzZrdBLY
 wvPZ3Kt2Acm+Y3Kf1AZUMwU65wVU4k/6LZtb/a6lqIqAQAA
X-Change-ID: 20250515-pwm-axi-pwmgen-add-external-clock-0364fbdf809b
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=tXN/bUv5GGn68VfUhe3b6vC2z9pHKfDijFpQd04/NLw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoOJEEKE70jzqKOf4Xnw34nS2599BQ3qJVqgLc8
 FVzfuLopIGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaDiRBAAKCRDCzCAB/wGP
 wLTFB/wKIgZf+3k4itUkgrYwKeZTnNIMlCRpHzg5K6gqrKGJ6BNnZtZu0q11gI8LNqgUDcUvbaP
 WSPXeHak/8nytkml8SseXHsNxdfFCTu6ZaEwvO6OXY5eu6kENPqr4eZdm7QPB9OAw1rAP7BSJyV
 i3PKemCGTJzozdhKtaMjvZ+0msanPHtH2LPhQwjDhozULjD8of6iQr5r3Y76YWRj2qR5gh/1rid
 R/sMBc2N8z/0BfPEzwv3kQ4ziRlxDYZ3GPH9gFt1e1adiZVe2c0knjDo3KeA9LpW7qdMtYjCv1H
 yyFjiI3dKhv6Am6IKHhr+4QOzNe1E2eL9xPkwsiMZVzQY1Bb
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

When we created the driver for the AXI PWMGEN IP block, we overlooked
the fact that it can optionally be configured to use an external clock
in addition to the AXI bus clock. This is easy to miss in testing
because the bus clock is always on because it is driving other
peripherals as well.

Up to now, users were specifying the external clock if there was one and
the AXI bus clock otherwise. But the proper way to do this is to would
be to always specify the bus clock and only specify the external clock
if the IP block has been configured to use it.

To fix this, we add clock-names to the devicetree bindings and change
clocks to allow 1 or 2 clocks.

---
Changes in v3:
- Fixed clock-names DT property restrictions (was failing dt_binding_check)
- Added Cc: stable
- Picked up trailers
- Link to v2: https://lore.kernel.org/r/20250522-pwm-axi-pwmgen-add-external-clock-v2-0-086ea9e6ecf0@baylibre.com

Changes in v2:
- Consider this a fix rather than a new feature.
- Make clock-names required.
- Simplify the logic in the pwm driver to avoid needing to test if
  clock-names is present in old dtbs that used the broken binding.
- Link to v1: https://lore.kernel.org/r/20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com

---
David Lechner (3):
      dt-bindings: pwm: adi,axi-pwmgen: update documentation link
      dt-bindings: pwm: adi,axi-pwmgen: fix clocks
      pwm: axi-pwmgen: fix missing separate external clock

 .../devicetree/bindings/pwm/adi,axi-pwmgen.yaml    | 15 +++++++++++---
 drivers/pwm/pwm-axi-pwmgen.c                       | 23 +++++++++++++++++++---
 2 files changed, 32 insertions(+), 6 deletions(-)
---
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250515-pwm-axi-pwmgen-add-external-clock-0364fbdf809b

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

