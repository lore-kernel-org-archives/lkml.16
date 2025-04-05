Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096221DEFFD;
	Sat,  5 Apr 2025 23:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894971; cv=none; b=jjYQmSP4NJadciC+GtPdB5HoJM9JnYiiWZK13IwqqvzIvDNrFQd0VRRBwzAewnCDJqXtszJrK/2xPqwXuOOvBSdcw/gKXYlKNg7Eh4RMMvkAJkjU/zg2e8Y8k7iy8z3aY/Kb5H3/LsONn5uYv3kscARusUWOuYqWMOSiWIzt4k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894971; c=relaxed/simple;
	bh=G51hIuSMcs69fsP3kxPgPSB+sadxSZFQ9IDE7EICSys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IeBTV4lw5wMg0cTdm8E98AFSrt1J9or6P97z8dfDNc0Kv/7vPg4EzVIjvY0KBp4ibKDYrEa/eBccAWTbZ7m1gZRfACYb7oxj9h1CVdSUGWqYlRZFv4Z3IgRlXY1vlazZhrk9QdYE2s2vBLccroN7FLVc7qj6wRIuwge1bBdvsVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ailz/rRF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ailz/rRF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22928d629faso31514275ad.3;
        Sat, 05 Apr 2025 16:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894969; x=1744499769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXyMsWo9eIJUoUgRuYRDp4l/Hr3tALUSH8In3QapG74=;
        b=Ailz/rRF8pvbcvNssQ2+1gVDR1iHMK+TQIOpvbuOYIwQPMMk4ZmY5ua4fzi8D1n7bj
         6tQbh4p5/2QUn2SFMgkLCsAq2vUI//8p86UpHPLUgezf0px+ojUKL2VN/JKWgpNacWfM
         zyfRELN+YuQYUlTD32awJstudZpcY57eFODPqMAWkYzbjTt/wykG9+WJbgDv4wTMlo4R
         rnmtF7pi3yp9Vf2ivgbBZOZCnH/HIPEK7flDjhjOnv7i67ZpXGgAcf3fi6Asl3b/93Xi
         STGWSuTfBwvh3MJKbd0xmrC3V4mFcqLCHTppGyh/P6xKkNQsBSFqikDsLFiymlD3xX4j
         L4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894969; x=1744499769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXyMsWo9eIJUoUgRuYRDp4l/Hr3tALUSH8In3QapG74=;
        b=NlC6f3vCqJfKpXMv8UI1SZunMlJSL7+WnZfq/BtL5ClpLOd7gLFpnjsVzFSxVN2cCH
         dZThxqhyZttyBqOmKxy2FoYDn5ngYJmALd9ZrpqtmtZCYlgQtT5ZByO5JpXcZzCTkUHK
         k4Z2DBymsWBol8ujeqLb5bRbsEO9umsNa9xenhF2gRjzRaOCkcGGvWDLgShHHogQUot/
         5mW05hD/6p3ApmXl1wiX8a6cpNah54qAE3YMBYyEXs4jU9jQ+M73elHMWHEkJmGbjCRP
         TBvZpB/qpKvVEQbOxjG2VM9EEJg1bbyCW/AUPfDyvZmu3A50DDj6DDvuDxeZZTXZtalP
         uHtg==
X-Forwarded-Encrypted: i=1; AJvYcCVMzUbsqafS9yly7/l20XKJ/k0VRtw7XI8Ap+HP4VVWa1x7kAS6VZjBgu+rJZGk6D6uZDJfSVK6dTv610Q=@vger.kernel.org, AJvYcCVPnfgxYy1+E/bmbhCw+1F/xgKfJ0lDq8bHhK3ZKwAWv9LVU2mi8ZIu8eOanhJeokSTFtaecOhqJ7f1KV4=@vger.kernel.org, AJvYcCVmMPa/f6ZQkGI/2gxQ88zh5hWTL0BNTkHGHhZJZ3keoPoi2v32ommXC4oFDf0s6W1IxwQ7j0DMtIw4@vger.kernel.org, AJvYcCXp1UjCk24Lf2IcL9zKGIc/ap0uPxm+T3X5CghQXPgn0XL734DsMDKjxLB1Jh9hxUjKjZDynukiBDPgKAMx@vger.kernel.org
X-Gm-Message-State: AOJu0YwnD5W/vXNu4oQcNS8Tk0eql1+swA1sXhFJWRIXVDt2wCQ2Sf3y
	waAYBr4EHEd+7jmoYu/R7WAigWgu9RRA5QuvL5ea+f6EBh5eQF4j
X-Gm-Gg: ASbGncsd1xkQyLplV+LCHcrUFKbAYBH68sKe+CHjzOsLOhnzP32J+1tVRLvEVJEoXvQ
	95GXsrvZtRuMyQYKawMdT0s1MufVVFbnaFb/o1jq/jlQkEJXP9G2i3KWCX8DxjlGj4N631T/vF1
	WGyNdFiwqh+1+FH8EjGpa6p+o2RE85sjiVS8Fm4Q0QN5sOQLKzvsS+fdNU1Cw7hO+M4YNRvX71X
	nERXa/yAcKnnewrc0xM/8xuoZZVZ7uLjyBxn46In7OyzWgsGsmBGomcM6z7dJTHlPWaDDsRhrxD
	5515B78mx73Y8adNbOQpA1ctGCDurpRKenqxrwpFZMNUpRbsE84/UBPlkPkJWfqHamhTwHqqXtY
	1b11ViE14L4+OQaLUjTJgM75oEC0U34QXfomMjuw=
X-Google-Smtp-Source: AGHT+IGbdDbLX7GMJybw19Iq4WA9iEwsbs7vDxezKzZjWqipK1/2AdnNvQpSyC83p7AGfjOjuLJpLg==
X-Received: by 2002:a17:902:f785:b0:220:e362:9b1a with SMTP id d9443c01a7336-22a8a8739d7mr119941375ad.25.1743894968944;
        Sat, 05 Apr 2025 16:16:08 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:16:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:09 +1000
Subject: [PATCH v5 5/8] ASoC: tas2764: Raise regmap range maximum
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250406-apple-codec-changes-v5-5-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=C804f2ztTqLQ4FxnFPpz1XJ4BtyjpL3h2sURrICRQ10=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3bWd2jotr13VtjPycPyxXG7/ZQ2wY+hPL0HWlr4N
 xWJpP7sKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCJzDzD8FT2wN8RzCuNOFaEJ
 Hx5n3H+ySGLK7T2vtzXsYj3u/6yO15iR4ZDNhbi1MtcvxVqrmMXWdAcZ3axgNcq2nK+ycMHp03o
 l/AA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

TAS2764 has a number of undocumented registers between
page 0xf0 and 0xff. These are used to apply in-silicon
quirks and workarounds at runtime.

Raise the regmap max register to 0xffff to cover any
quirks registers.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index fbfe4d032df7b26b7db0f7c7dcb47661277006d0..718107fce3bcf6ef081f6fced7b89c708518b1a5 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -685,7 +685,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 1 * 128,
+		.range_max = 0xffff,
 		.selector_reg = TAS2764_PAGE,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -715,7 +715,7 @@ static const struct regmap_config tas2764_i2c_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 	.ranges = tas2764_regmap_ranges,
 	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
-	.max_register = 1 * 128,
+	.max_register = 0xffff,
 };
 
 static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)

-- 
2.49.0

