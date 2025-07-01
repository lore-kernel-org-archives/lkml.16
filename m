Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF20306DBB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405980; cv=none; b=tES/McBySww/noGkU/3jdc4GnZ443OB5Pipntvp4t58Wozvr2mntDMmbxXqlvpkMZHg91SVA2Golt8l4SMMyBuFL8qRM45PgZ7nLOtCOLzGivW52MXXtMadFev1fqSQFx7YrIq4kC3Pwto7MDQ13El3W9N+Rr7DOyxt49lHFdyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405980; c=relaxed/simple;
	bh=1pUnPmEW6s+eLqvk9BXOOUemrGb7ur2APhmFlPgVmmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxNwjvMHQ9CKno8/RyUCgCjvv5jPFG9LRsNTutIl91yyeKeKec+Gb+S35sOhzITRuIPqceeHT/Dode0MbpsNTol6fjNBtnD0WOaKUTi8X63+Hc2hNMI+3a8iZRMPeDwSuY9GblxcoTKTKfxo4hC3uqk5g7e13j6/Elwx7Ax2fLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=d+YvQV3X; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="d+YvQV3X"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-401c43671ecso3040611b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751405977; x=1752010777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHniCqYc2VQTDAA4fWnYCZus3iLgaAx0sPomUMoMA1o=;
        b=d+YvQV3XzqVan+eNfHNMON2ndzk9VxERr5TRJhvsSQlNfzbDdEq6BODmv7lJkrYdew
         B0LhEQiqZLjF4ZwiBcx48SVdlHgiQ3AV9g1HYJxy/iZ46fFukqN042GeGM/5m2hWt9AS
         c5d32WTimJJHbOBinpgehDoKmr99nmDM4EVsIcJpYRP6hbUSOVRiXIHT65/mLSPATJLq
         FJJPxlGRIdEv9tq6ofTraj2HEnWQjgnwJqh7bGaEF7mYZFqOtwaM7EayGlSFbfiSBWa8
         kg7EoIbe9418VyHP6y6cupghwIFck2ptcMVwGbnnxEihVk+cQzZ3c33YMcjc3gLBhHYw
         Ffpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751405977; x=1752010777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHniCqYc2VQTDAA4fWnYCZus3iLgaAx0sPomUMoMA1o=;
        b=WhLGSBktiEZDHlW63SDD0lNF+DxW1vFRR/T7MF1K4yTncIweNbIkQ2uMuS1gs/mBCU
         k4acAyz4sfCW22MUSVoMsWnkD8aUcRAojatINQf+IHv+a38gtYOe7l1c88dRudT6e2M9
         BQhf0gHHZSJ+g5KVk9wfgqrBXf8ZPhHtMZACBk+Nh9zEPwBxE5kqrHO+EfT8XyW+YqOb
         H6on0V8IE+vQ1+4S8ThTzOctR8hsvpKiMaQOqfm1RdBTgChnK1d7OBYLtg3OZ1WnS0h4
         w2ZZWePPTBzYGxcxuPA0CS2+Pql9JC8+HxYRQc4J5eCNZ3svZttml837wnQD3pGWfKu3
         NlYg==
X-Forwarded-Encrypted: i=1; AJvYcCXatqPq22lPUIuPxwSSjXRYeqdMcPYwzy+w2OwrjnD6URCw0gXvTwlCYyAa6VA+kqeJJSHO4BteO7wZK+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYWwsJoIHQ3uBkL1MlH9qoA3Zr0IgsYJMVMBj5DOjGDHPJC8S
	Jr/+VLlEzi1cirZoIQU+2svR8WHKbjBpwZYoQTX5R0Kjnk9KKBfE2H/Tdzd3pO/Qgmo=
X-Gm-Gg: ASbGncsexyh/uB2eXJgdFWhO0GQcYJrNVXtw6J1I9YTrZ60JrlaJTZYa4ymem6iIx7G
	ICfMkCf2b2PbOyvrFH0nIV0rGHXscFk9xqZ6kNr1EUI8fBOz+51i7kvG8pf6Mgg5nVCqjm4Kijf
	KGOjWV+292rjZ0QxUWl1kSy3xyxsZTGvl7PdrQ5amOPHqtgAXQKeSnBeAYLG/PmPZaTbEXlSb6m
	n2oGQ3M55GEImH65EdvQeTnVeq/YPIvUtivGaCn5ZZcVzy9MJFImiPIFW/BEiOpPp5j42nWrWga
	k7EQIQQ9ZoCaL+tGpXC/QOWuAwUaUHdAduqSKAsYY3yAUhtxnu2GodUIwkAUNJifKss/
X-Google-Smtp-Source: AGHT+IG0bhBx3lA01RN18NYfLT0rpHpS0ckfjNDTHVbR/kan8VENJvcoqo8/X2nSGkB61dwgGiAHgA==
X-Received: by 2002:a05:6808:4fc7:b0:40b:1826:34c1 with SMTP id 5614622812f47-40b8999b39fmr191361b6e.6.1751405976599;
        Tue, 01 Jul 2025 14:39:36 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3243deeesm2288335b6e.48.2025.07.01.14.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:39:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Jul 2025 16:37:54 -0500
Subject: [PATCH v3 06/12] iio: adc: ad_sigma_delta: audit included headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-6-42abb83e3dac@baylibre.com>
References: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-0-42abb83e3dac@baylibre.com>
In-Reply-To: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-0-42abb83e3dac@baylibre.com>
To: Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=1pUnPmEW6s+eLqvk9BXOOUemrGb7ur2APhmFlPgVmmE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoZFVh1rpys8PmWV9xj3NC/o49aXlvbxJ3xeDIQ
 1gRRA/KMOiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGRVYQAKCRDCzCAB/wGP
 wLkqB/4oOW2IyFjdlSpnzdKReg/rrMYr109m+uGSKjMXb/6sTXnma00V8PIOaRfWER327KKpQBt
 GuxYElkSh+MVDeQaLlyIoHMXrN45mT6xMTrDtDklY8zEL78amVIp5mw7QmjOJo8pyvbM/TKYOu4
 4+BQwyA3KjzPwolaM7y1TQgDreZZ+G0kOHej5SWm5YwPZgE3JYn69k7FFV2pCjqHd0vbrK84Nsd
 1WNCaJlJL9oXbEPnvQQbP/W+qhS/SHuP5I/r2wvYS/DPdVzhClBDZHdpPY/h6sI/BBohZUtguMx
 31E0mY/KhKjV3d7hJxauINaCfoDSXp1KtDjZ2kh8ad6zSVT3
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Drop linux/iio/sysfs.h since it is unused and replace linux/kernel.h
with more explicit headers. There are a couple of other headers added
weren't covered by kernel.h, like linux/gpio/consumer.h that are added
since the module makes use of those APIs as well.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad_sigma_delta.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index f91f7ae6dfca05cf3ae632a5f19990f3d153b706..b5c66a6cc47ec8e36c458fae87309fd30109c0ec 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -7,21 +7,28 @@
  */
 
 #include <linux/align.h>
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/export.h>
+#include <linux/find.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
 
 #include <linux/iio/adc/ad_sigma_delta.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
-#include <linux/iio/sysfs.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/trigger.h>
 #include <linux/iio/triggered_buffer.h>

-- 
2.43.0

