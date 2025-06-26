Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB65C2E175E;
	Thu, 26 Jun 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946699; cv=none; b=QQUo1OcUzdUn7P+lAK/FoEm+0jQy5kTwqs3vx2r+Gn72Xa+v/cKirimYAjxJf3GTe7R2C/ETthrNgRcDRzKduJsINW/dehKRzGnwBUyze7OTrg01C1HRwZSlOQqE8E4J99PgnQR9dm354RnhEUg0f4GiO53Qt9PxPgzq7tjcktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946699; c=relaxed/simple;
	bh=yO6H0nVo0zd9GOef/qSf3xhJaxddSooUttJcz+zCMt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/wFX89dqazPhxUFPssdj5lk0MRqVLrp5/T52jQNtAmr4ke812XIobgZtPjgIvM4PV4j+fyIbAIxYcOvGLtVKgf0vNjlCO7GwXg4Z2hZIiqvNPTYYYdM4zMi0kWxH192W/A9zQs8oujDKjUbvIjOXW6yaaO8t4EVHHZF2nHUm7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpXwVgF/; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpXwVgF/"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0d7b32322so135163766b.2;
        Thu, 26 Jun 2025 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946696; x=1751551496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNFuxJyu4lFW1KKh7ZXTdnCioa3olqumEo+f3P6R3ho=;
        b=SpXwVgF/grPisBWydvAlkpQQPXDUzqlOE5QKR6uKSSo3py319jMgABXks7ZBV0u0ia
         fnIloTo+t+UcUz9X2aC7Rhp2la9aevYFyORpjFbs73Bb0eLTaRAy/sXj9zYWwTaUjolM
         yo+UkkaILdEtrbves4i1ij+JQeG4f08M1XMwczs5in3Sy8sIgkiZxkDd/0R1XWnz2A+o
         EDDMDdz9LzXRpv2nhbgMr2rWhNUqVjpCoiaEM85HfVjQFMJgaVkbsXhsWs89SqKMLOvJ
         E8Uec0pFFTTFNAFVxWmAWWjfspH6T3JaVGiG7O3/NfiBa+SOTxX6c9XGy2WGOljjVrYD
         EVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946696; x=1751551496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNFuxJyu4lFW1KKh7ZXTdnCioa3olqumEo+f3P6R3ho=;
        b=s/K2UJgvrRJFGNNV//PLleBhYQNSwkd0g5yuxcCtXcMt6NaOh2S6iEKMAdLj679z1k
         t2LJCVSdm+bW1JkKAJ8KdUVogZYQvdS9xbUeua2JNZFHc/2XxNF+LXqIPOPZn44KBEuJ
         we/xUyLeXuGBBU0jJLIiEymaoegsVl7jwAfmbIxy/MMNwS5Ut+96nhHECPBWhM+VF5fM
         8ni5QA2iQhFw5MXeZ6B9kkXvM34C7piKVOnvj4X3N6gqQ5qBYF56cJ37PbI8QABnKeYL
         +T/rYQpIoIO34ZMns52Or5s+a4kxe/P8NAnhXfKAMtoQl3cIPe2N8Z0ANPlKkryscAR4
         Lkbg==
X-Forwarded-Encrypted: i=1; AJvYcCVk3SRTzoXSrwD/qG9sqcWGuvSuXMHE9ajfK3v+c0TMqvyJgcHWkyvO4yA7ItPlosAqU+8RctWXHgMFvAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHa3emul2n+sNPnrmp1u/cOFt3q44FxQPNoeA/esvxf1kERvo
	C+YOaDLNLztU85vuguQq4vX82RZUhDWchSsG5AE7wfqE6spvlhQwAS5x
X-Gm-Gg: ASbGncsW9GhXCD5WvfL6x3ORZn4hhRtB7+kjDEgiS01FHYBACn49DR/72EUnWlsH4or
	KlBj6nwXt10eijPfsFb/2rR7kr/iZU+ycPoQZZwuP1LsFXlv+P1vQjzJZInk2TVhfPm8GiFK8SM
	cmc3+cbUPCFrhEMHd63wuM83fgwZj5cglblSjNFiqY2bxQlTTB6v5lCBA4EDIK5FHxUpo/8idRf
	JfdCbLtrGJlUp5IRs7INRiepigbR0SqehIWkgV0e4ZIIdptITJOoh+fNauanAsjeNABNA9wR2VS
	+PEQppaU8RPWKzYunqGrZV1YQ8pZea95aONden3Jm/ksMwEjgbNqj5h5xSd0Urd82mYLT90Swuf
	4LCSudxZ1TbaELraf3kmurg==
X-Google-Smtp-Source: AGHT+IFp6DyXdblOU/xvQb9UjfBpjvuHf4IC4x//qSo9Y5vJDwiBZNnXQsyJDow/QrDZH73Gl/yAUw==
X-Received: by 2002:a17:906:f043:b0:ad5:55db:e40d with SMTP id a640c23a62f3a-ae0be9c2452mr641299166b.34.1750946695744;
        Thu, 26 Jun 2025 07:04:55 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:04:55 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 2/5] mfd: khadas-mcu: drop unused nvmem code
Date: Thu, 26 Jun 2025 17:04:29 +0300
Message-ID: <1b421ddfd44d096cd3a979462ced002e2356eb21.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746518265.git.efectn@protonmail.com>
References: <cover.1746518265.git.efectn@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Muhammed Efe Cetin <efectn@protonmail.com>

Drop "khadas-mcu-user-mem" code since it is not used anywhere.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/mfd/khadas-mcu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ba981a788..ca4bd6cf5 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -80,10 +80,6 @@ static struct mfd_cell khadas_mcu_fan_cells[] = {
 	{ .name = "khadas-mcu-fan-ctrl", },
 };
 
-static struct mfd_cell khadas_mcu_cells[] = {
-	{ .name = "khadas-mcu-user-mem", },
-};
-
 static int khadas_mcu_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -105,13 +101,6 @@ static int khadas_mcu_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-				   khadas_mcu_cells,
-				   ARRAY_SIZE(khadas_mcu_cells),
-				   NULL, 0, NULL);
-	if (ret)
-		return ret;
-
 	if (of_property_present(dev->of_node, "#cooling-cells"))
 		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 					    khadas_mcu_fan_cells,
-- 
2.49.0

