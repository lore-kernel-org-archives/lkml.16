Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C021FF5D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461489; cv=none; b=OvEGovhVSkHXl5/3MyMENm2VMWYhhRQ+z3pbvkKq7qyfp6DCRRLNDsOfaG1+MIIdAQc69xK6i4EQVKjCehStaGR1xfoKBhc2zntH/a5j1rINHc60umzlWJxzzwndwxMlLmcq5eGufPKQz1iY7Tdho1EmKdIQYwRi2Im4IEo7TW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461489; c=relaxed/simple;
	bh=NsbxytOYWrXE3noj6kwrK97+xlKGqouOO51NUpMV9Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTkifsoY94cH9iltIaXKQN2gcgo7chPlOyTgyyg4sdVJh4Q4fxNkoNrxMNTlzKfqqWjZO3xOvkaijSSpzTgZnihI5iplKT0P9b+S4/cMLT8rdckhGK7bdSmUMfbq+aWYjPhWtOra7kVDamQYnLqxcNwT7AfjMeR91lcv1N0ctnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q2uKJWaW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q2uKJWaW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso23815f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748461486; x=1749066286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT2eARVVBUoBTxUln7TLvVM6HhTKGafXKW8Q+FpQYKY=;
        b=Q2uKJWaWqpwlXVV9H4LBuaBnhELmQ7GsIbl5C/wHeL1lDIOh9Jr+ublYGHOEIqEgYb
         /nKuO3sJuB1jJ1bWxqEOmucALiWrpjRAJCJiJPUrzPIijt+CEHLVAexj2nm8UISGfXFf
         XKgc5PtE8WfUDrKfobFR7zsAKKMO2QcEocrg4U5o3HlQhlcgA4Lp49KdB/uzEElAQKWX
         uA3cJLnsW/nIhKOTIKu04uvF8QGw354kXs0nVLaM1Ng8N51H+HcWiPNPdSIa5nKOr38l
         KbgeAZ66i39rk/283gjSU0cGI21CS4NBaoRSZzx+fZhO980tPaWIAwUpyaRjVeNsuJwS
         rmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461486; x=1749066286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hT2eARVVBUoBTxUln7TLvVM6HhTKGafXKW8Q+FpQYKY=;
        b=FqMhtxV+MVUllJjjXFJIIz1bmZjMzUD8vg66G9JH9d1h6PYAt0YYGtgjqE5MDN3RDR
         JvZrVloZzqSrzn6OoFKEy+iY1FivK9nmpmqsDRGEVCPW7n8MVgNc81J3I7JMBGeMfQqk
         FgEb8ZBFfO9D8OYgoZVT1JNtVBV+NRlnP+/iX6V0vvHR4FV/LGi6/6fhOZ+vtaAwlBOR
         fNVzytVHW6FQbnc94tXW6I9WxX1aSRF+EpsrtBfKQcWdwI26R2lRubqrvDlVInuvTT4a
         Zsyerw+qKPv0/FtK+RhOEfUaIS+ccrdBVbMFgVI2FA9ZixUIiS7vMZ1cxWD9/bWMvEWs
         Mu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWskd6ewzQ3BFnniW5ILG8ivplmhmsN3gAVDYw+Ej9ty4Djan3npYrG2d3FbhZWyCoXoI4cEbWzKq5UtFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnXJBAfR3dzRZ0itXLpNcviiZslZKDhpzrGDasZ18afP8nOuTi
	2Cba+D79RPEphQZJpKJEBdxxNLQkmQzwvmJw6CZNfkJunSea46p00h6ZjKLS2bc3c2aUA+sfcte
	yS4Ar
X-Gm-Gg: ASbGncviTadCRbe6YOGyZ+Bb4BxsqtX+G16PUIu1McNBfzlRdgHqpA7yhZpeCGBs2Ff
	C0ftrDW6zK5+cDuJPQfq7tN+Aq0Fof0Y+MONsQtPxOlmYeSudHtTREqzApyqMAPDP4BKwG/W1TQ
	da18YUHWYJqCvnneurFhLZY8+wYxPc9fJwe0adrJo2o+2X5+Z88LCAN0tbv7y2yaYeK4OK9Y3W1
	C/j/VbrYzYvjPd9ZEzsXhd5r+m/snjfCKAUFPAJG2h5K2kIqYVYP5GHPo/eIde336ytdpFS2QR8
	E/pjLkCijV6rCtztr78l3tJVurOQaYVGEKqHeF8Dgx8KElZsBBpzAxh1qQhH5A==
X-Google-Smtp-Source: AGHT+IGyeYQHk86txvFQjNL/kSzOaC8oxeV3ojClqoAenP1P/ur0pNI6V3/rZlFaCma/DHhesO3K4w==
X-Received: by 2002:a05:600c:511b:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-44c94c246aemr64089155e9.4.1748461486426;
        Wed, 28 May 2025 12:44:46 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc15b6csm382385e9.20.2025.05.28.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:44:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] power: supply: bq25980_charger: Constify reg_default array
Date: Wed, 28 May 2025 21:44:41 +0200
Message-ID: <20250528194439.567263-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528194439.567263-3-krzysztof.kozlowski@linaro.org>
References: <20250528194439.567263-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=NsbxytOYWrXE3noj6kwrK97+xlKGqouOO51NUpMV9Gw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2eo1Kuszup7yhN+GZtOI3JsBm3QYMVHbHabl
 vyKR4N6o6GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdnqAAKCRDBN2bmhouD
 13ilEACG9NlaN5wrc/sjH3QMxeAFQ/kznikD7vfOUfEPVw9qwjJ9uAArQf9fRUonn8RO3dXbp9l
 0qqtybXHkD2clL3Nki30januUHKEKJ898tu6Ky84O1sOo+vJGT4Jo+iDdajbsP2M2USVtOkD00p
 pZIn0DJqLovwakM9OMbno34vGicr7tXGmvH3jrPiAscVX3hwrCPAZuDF5VsjHoH8P8QTMmIwf9g
 Qz4sxkGNOTZNsO4rVJ42pQ8KbR19xnM6u7vh+FrPwVfPgbJJZYljHhb2RZuAJ+5CN8Ahp+6Bxec
 ul7ee+/RSGqxdFEqdRxphy6upvL4Bd+7P9rzQcNpOWKDchO6U/iEN4zBdWkl9YvJL/PIBKXeo5U
 s1hSJKIkD3Ce1rbLZZZSXw3EXPlnXXEQflKKJ2SYn2Ywm7dcRCMlUVTZQ+Ol4zS/cyq0fBMrNmY
 14sel74Q3EHn2oCZv9Zb0IPSPhrYufCF+n1vm7Q0Shgcea+tLmCZEGhR8M7xaLpvIyz+zmVZ0rw
 X2A+bQfNOcJQgPz/FYSw4HrwleYAVvoPs/iwf2MkleDZMX+MdT0hT05t1rzqrjjWyebJ4pwMTrN
 ftOqlUCUMWGdG8AzS4S6vDMZIRTPAJNWnSf7SEzJ7SGb4A1vIMYfu7p56wfgqZnI+sAmN78amsE SgeqHKaaclwMYzQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Static 'struct reg_default' array is not modified so can be changed to
const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/power/supply/bq25980_charger.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/bq25980_charger.c b/drivers/power/supply/bq25980_charger.c
index 4ff76e3dddf6..723858d62d14 100644
--- a/drivers/power/supply/bq25980_charger.c
+++ b/drivers/power/supply/bq25980_charger.c
@@ -104,7 +104,7 @@ struct bq25980_device {
 	int watchdog_timer;
 };
 
-static struct reg_default bq25980_reg_defs[] = {
+static const struct reg_default bq25980_reg_defs[] = {
 	{BQ25980_BATOVP, 0x5A},
 	{BQ25980_BATOVP_ALM, 0x46},
 	{BQ25980_BATOCP, 0x51},
@@ -159,7 +159,7 @@ static struct reg_default bq25980_reg_defs[] = {
 	{BQ25980_CHRGR_CTRL_6, 0x0},
 };
 
-static struct reg_default bq25975_reg_defs[] = {
+static const struct reg_default bq25975_reg_defs[] = {
 	{BQ25980_BATOVP, 0x5A},
 	{BQ25980_BATOVP_ALM, 0x46},
 	{BQ25980_BATOCP, 0x51},
@@ -214,7 +214,7 @@ static struct reg_default bq25975_reg_defs[] = {
 	{BQ25980_CHRGR_CTRL_6, 0x0},
 };
 
-static struct reg_default bq25960_reg_defs[] = {
+static const struct reg_default bq25960_reg_defs[] = {
 	{BQ25980_BATOVP, 0x5A},
 	{BQ25980_BATOVP_ALM, 0x46},
 	{BQ25980_BATOCP, 0x51},
-- 
2.45.2

