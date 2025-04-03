Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56C51B4234
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720910; cv=none; b=jQjoiRIWfZ/9ZfZ0mZPimC5V27mfK+uGNC4OULk/+v3mepBsHX3XBXn39AZNh6sAnAu28f5IOgdT0ts4uADbWxku4uEOFVVXyLww0rf6FHp+KN2x6YJEV88Gh1q9R8+3hplo4bkW8p7TzVZ93sh9s5uR7t8GYMj6niTbmvkdLok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720910; c=relaxed/simple;
	bh=rxdjGPNQPV4ImLSYqhaOLvWGgAyBbizNO3i5O71WAvs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fXHxrgvN5bNNj5okl0FWR9Y6GdQtwGIc6XKyCkzI7IFxNQHEkt4kRsqEoae5bCGzIIZ/fjRU7mDcj4qltXZaeumWhv4/EKf+Vt/KCqhWULwC/A/Vxpni3UnpT20/RvOl5qFrVBRjrJPyCpWAHymk+33V7Ovw9EYxy7FzMoXnzbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5P5sTOE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5P5sTOE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so8064695e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 15:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743720907; x=1744325707; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KGa+8ZMdS7gpoRneytTxWRsbp2Z865W9JZsv0w8PVU4=;
        b=D5P5sTOEx6e/7fci4N9reH9Ganp4La+ZQ75ppsXnwFy/a2vOqrBTiLwLiAXuUvkkWW
         y6LowZb4i4SJ30V8L2eQb7G6sb2wr0HxX0d6C+2mF1mIGSRP8BZSyYJJOGi+i/L3iagB
         FpT/O9GMrBAy2klNtQLI25VY78EBBYkyFdOB/tipG8O4fzrZVaMZno0KGhJrA15toDU5
         JbokaSSgQ28tYui3lSgWQDUQxNYi28mTflxY96a4lADIZKfhournz2W8vUXR3UUxamDZ
         kYZlbtPijZ+EIOo1udKq4rShUk9HV+/M766gXFNrGut+aQTeWjOdlSqF6fSeweV68927
         yfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743720907; x=1744325707;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGa+8ZMdS7gpoRneytTxWRsbp2Z865W9JZsv0w8PVU4=;
        b=GZXuyn3RkXzw9E3AbE71udl186UZ8DoKV2ac3Cv4IWF0ad4/EiZrfpFoOFF0Zki5MS
         3iz9+CGX0cYz1hd65yEcDq47Md5oddk635HqluBKIbDlaHPKfTbm9LRM4LmZjuQ8rPrW
         B8nmfmz676xHZoDKgwaH3cAQ8kIHF4C6g+t2MnAzKxYV0RM2DAE+MhVIwKEGvMSQnWy7
         x4Mx3OLHbC9x4xYAJcQXWRNz7+q5OrcGTf3OYv50amt6PZJI3HLzBioEUMFW69722L7w
         elRUMDXYa8Kdtkz66jmCWDMUMQefLpHm1/hBAfLvVHlijBSmGzXSfrbK5G3cXXMFgFQA
         p7zw==
X-Forwarded-Encrypted: i=1; AJvYcCXbV+NyN6WVniDgU1mJEsfaPC/lVoKaN0WpRGw4MFqfLcvkbI0DZGDwa8w5EyJkTkunj2+5AQ+xxvzmG1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu8U7DDiwbfVdhD/35NiMbWZdwzzw1gEknwZfgSZlzzVVsZ/sq
	84Z0fPjHIp35ElSMcP3hFCHTPYwRFy+JTjl4PyGB9SH60W9CtcIJwCLxz2d2J64=
X-Gm-Gg: ASbGncuIgGwWIud0VzY7YaKcGpURG7jT/51IehcfivWOKdKA/vD/uUAVwHz9NJhEEh1
	VlFcJoJGdhYHQLzjsfex7Ok2UWe0OhnJEXJLop6g/wlstdCWcrkZJa8reGTtEC+BGzbdect+Tca
	xnKROUDl/apdEltz3uQlBbFf8h3rBiZ9yH13T1XFs6F06fYEDj1OtflV+4wUBztEQkhPEbqmO/j
	taRq8TilaMQEfpzWvFmtXt7ZRjOADUp9hBPYWw919uAI/xaZWSnLMit38aaq/fh/Hl9uGiTDAv1
	wWVVLPChku82ikgwxLqvzrnEg4U0KbopW2DP8X73Npz1kmTsXEuizKs0bhAy6Kc2TtAooLwRSkW
	AOeqQNCHTOw==
X-Google-Smtp-Source: AGHT+IFynmiOt/6lJD69mVRMbca518Iljdmmp1RJR24KFqvWoJOzmLG36nlygFLs5qyx1OzjN7Q7gg==
X-Received: by 2002:a05:600c:3595:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-43ecf9c6639mr4969665e9.23.1743720907152;
        Thu, 03 Apr 2025 15:55:07 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b8ae1sm2936829f8f.51.2025.04.03.15.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 15:55:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/2] Import IPU6 ov02e10 sensor driver and enable OF
 usage of it
Date: Thu, 03 Apr 2025 23:55:04 +0100
Message-Id: <20250403-b4-media-comitters-next-25-03-13-ov02e10-v3-0-b30d5693688c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgR72cC/52NQQ6CMBBFr0K6dkzbASyuvIdxAXTASYSaljQYw
 t0trHRnXL6f/PcWEcgzBXHOFuEpcmA3JsBDJtp7PfYEbBMLLXUhUZ2gyWEgyzW0buBpIh9gpHk
 CXYBEUAguSk1KgkYqDcqTLUwlku7pqeN5T11vie8cJudfezmqbf0jEhVIaGyl8xLzxpjq8uCx9
 u7ofC+2StQf5nT/3ayTObcVYt2atuvKL/O6rm+nQVyDOwEAAA==
X-Change-ID: 20250317-b4-media-comitters-next-25-03-13-ov02e10-23e68307d589
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

v3:
- Various newline and indentation fixes - Saraki, Bryan
- to_pixel_rate() left as is:
  Discussed with Sakari and Hans and the current caluclation will do
  unless/until we add in binning.
- Kept cci_write(ov02e10->regmap, OV02E10_REG_COMMAND_UPDATE,
		 OV02E10_COMMAND_HOLD, NULL);
  Experimented by removing and gain broke - Sakari
- Check on v4l2_ctrl_handler_init dropped - Sakari
- Use v4l2_link_freq_to_bitmap - Sakari
- pm_runtime_setu_suspend - took code from ov02c10 - Sakari, Hans
- Fixed various release errors in probe taking fixes from ov02c10 again -
  Sakari, Hans
- Trap and return __v4l2_ctrl_modify_range() error - Sakari
- Trap and return __v4l2_ctrl_s_ctrl() - Sakari
- Switch to v4l2_subdevice with embedded lock pointer
  Dropped incoming mutex - took code from ov02c10 again - Sakari, Hans
- ov02e10_open replaced with ov02e10_init + callback hook - Sakari
- {enable,disable}_streams instead of set_stream
  Sakari suggest, took code from ov02c10 v10 - Sakari, Hans
- Compared ov0c10 v7 and v10 took various fixes from there
  which obviously should apply to ov02e10:
- Use of DEFINE_RUNTIME_DEV_PM_OPS + pm_sleep_ptr
- Reverse Christmas tree init_controls declaration list - Bryan
- Extends properties for orientation and rotation - Bryan

- Link to v2: https://lore.kernel.org/r/20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org

v2:
- Squashes previous progressive series into one patch
- Adds yaml description - bod
- Sets GPIOD_OUT_HIGH on reset line - Hans
- Optionally sets the reset line on power_off only if gpio valid mirroring
  power-on - bod
- Adds Hans, Alan and myself as MODULE_AUTHOR - bod
- Adds a MAINTAINERS entry

This patch has been tested with the x1e8100 Dell Inspiron 14 plus 7441 and
I believe also by Alan Stern on an IPU6 system.

Link working Dell tree:  https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.14-rc6-dell-xps-inspirion14-lenovo-slim7x-t14s-camss-sound-wip?ref_type=heads
Link to v1: https://lore.kernel.org/r/20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org

v1:

Similar to Hans' progressive series on ov02c10 I've picked up via Hans the
IPU6 driver with some additional fixes from Alan Stern.

https://lore.kernel.org/linux-media/20250313184314.91410-1-hdegoede@redhat.com

I've made a number of initial changes to this driver sufficient to get it
working on the Dell Inspiron 14 Plus 7441 with the Qualcomm X Elite
x1e80100 SoC and its CAMSS stack.

link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.14-rc6-inspirion14-slim7x-camss?ref_type=heads

This is a first pass which adds in the minimum to get the sensor going on
the Qualcomm platform. What would be nice would be someone on the IPU6 side
giving it a test.

A big TBD here is the YAML for this file but, I'd like to make sure nothing
has broken for IPU6/IPU7 with the modifications before diving into
Documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (1):
      media: dt-bindings: Add OmniVision OV02E10

Jingjing Xiong (1):
      media: i2c: ov02e10: add OV02E10 image sensor driver

 .../bindings/media/i2c/ovti,ov02e10.yaml           | 113 +++
 MAINTAINERS                                        |   9 +
 drivers/media/i2c/Kconfig                          |  10 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ov02e10.c                        | 970 +++++++++++++++++++++
 5 files changed, 1103 insertions(+)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250317-b4-media-comitters-next-25-03-13-ov02e10-23e68307d589

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

