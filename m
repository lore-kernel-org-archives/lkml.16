Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F8F1BD9D2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266258; cv=none; b=VkU5tvCAE7FBBNbc7AGG9Aih+fxB+LiF+0LBgI1t/jZIFjqFjDNclgBekql5h0vC39dDAhm7HO8y8zgQ+JNo19q5B9kvIjF/2MJsbtR8uIliaOSY1bPleR+Hgy6/D1XTFQkznfOqcc9JhXaVWZeswPSXqjyL/+J2LlpqkAYz6NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266258; c=relaxed/simple;
	bh=tB9kJkzix8UdmTuptFEyspPiHP1wy3L8TCC/7InfdzE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rlqOcmi40C1zTwr2EGCJcrnrPU+0BjEjwFobixofZK10rjmwPEhsGG4hcZYdhX67SxLL5SOif75kTdS3DnEyBx6LNSc5gaX97j+nC25Htc41Sc+0LHoaGyv41/cKfmbbqpvPTQNVeMoHni7M1PcAyWRUzbIc8HydqTfoUl53n9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JEfEg4O8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JEfEg4O8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4395578be70so2078675e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739266255; x=1739871055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DiHXPgT+3YQYkd4DdSOCTqE0SnmmwoYH/BXg8DEztU=;
        b=JEfEg4O8O74f9t4oygOJEiDUe7JdvANbZL8W6bCbF9kUeWjQsO6xjs4bkmoWLH5USq
         8fBmmHISzjaW9WgD6UaTdvGHM48UW+BVkCEUg5vURxJvSRdtun3qgOB3XsbAVPzEogHW
         oiKatiL7teSKz9DxTZwbCJ7HEp4GA4rhQ1T3WzHUk3R98pCuJQdkU5JOkBtnT60wlsQi
         H5cwh+vcZHp1Xh6KRy21BJxqtHY4hmWI+46rl4CS1RIz6eoVw0Qkrmd8JKO2bp9q8guB
         jjhZnG1N7yuCT9zbgZtyTHfXdT+4MkCEcK4Vse6oG27u3tRyFZDrgTsu5UQiig/ua1po
         RDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266255; x=1739871055;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DiHXPgT+3YQYkd4DdSOCTqE0SnmmwoYH/BXg8DEztU=;
        b=jBxeLMuGcXVo48Q9oIDd0nZwGtmLmR293lAyl+aZEnmUCeFch92sVVSfxenYxKTogT
         7MR+1K6RA39YE3GLDePRJ6FcjzaWE9gy4kX2ZHynG+6rrBHDPYtDpjWlvGIusz33//WV
         cbyxoA9+HBO89dGJkG1rGLksqTbnNxv1czqPZ0OV8iVec/i6xeYb1BA7xPhSEPuEwH1m
         5JIYF90MdaQHD/LIR5E1gF7RuczDY9ZxesfbVbelXN3a+Bmz+abjy3hIHSm4GlezUD7D
         +EOsRA7LdzWV5PXcyn17VBA5BETxzQ69jeCw+OOPBZjc3mJWBFGvc4LtPC0EQRyHbbQ8
         AV1A==
X-Forwarded-Encrypted: i=1; AJvYcCV7EokmUFoo4khzeo8x01FIKlvoI5O87C1AIhbeEVCVXRlIWNw2y0mP3j+WYM2qQBfiFH/2OBIyEhf3Eek=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD1mIjAYfeuwtRnaKFl7f//zNaSVAr8ZXi25WANdPztYuhzW7/
	+5s6zTzGx6fPYAL8vbEGxWprpCxwuQUoWyVDT1BffBQL3CQgk5cjKQVwg9thcQM=
X-Gm-Gg: ASbGncscmnbI9O6Lkrzfl8l5HmreinVgeokSZ6fGObrR2QPza6/NGYHyR6ai7zfDr+/
	0EUpgrVll/N8dnobFCQ6zmVqTWfFmmHgXnhmFwZ0RhLzNi5agA9WmjlFBwfZnCOwFLumpx8zZg3
	rb9yWXUgTPJqpu89qUPwwnJASJpOjOMSwNne6Req/O0vXzp2DJAGGaKPJmXcD1o3kuYV9PPVP4T
	aYXTewx/FuGQzawOcQs2bW9AeEyiNmoOPnZnHxF1YNR6iaXMmzHgE74JgmiRymLIoWEUimnuQN4
	A81qk/Y7d2FgsSGwV0/b9sxhe8j93IoiCLGquIB6UjnCsc2PcMfCfxiGKneHg+jgHp6Xm6Q=
X-Google-Smtp-Source: AGHT+IHvp+X+fSiYRW+1aXlB5+kLhOGzNT0eATn29S+MSUUf1w33k5xR/ZKqHe179dbj9iJ2W/rkEg==
X-Received: by 2002:a5d:59a9:0:b0:38d:e02d:5f4b with SMTP id ffacd0b85a97d-38de02d5fc6mr5082245f8f.32.1739266255437;
        Tue, 11 Feb 2025 01:30:55 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc672b55bsm12591296f8f.79.2025.02.11.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:30:54 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/2] mtd: spi-nor: use scope-based mutex cleanup helpers
Date: Tue, 11 Feb 2025 09:30:52 +0000
Message-Id: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMwYq2cC/x3MMQqAMAxA0atIZgNtUYleRRyKRs1glVSlIN7d4
 viG/x+IrMIRuuIB5Vui7CHDlgWMqw8Lo0zZ4IyrjbMW4yEYdsXl8jrhdp2c0FDbEpGvamogl4f
 yLOm/9sP7fl18TA9lAAAA
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739266254; l=570;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=tB9kJkzix8UdmTuptFEyspPiHP1wy3L8TCC/7InfdzE=;
 b=8OZFGRlWl0hO43G2J3e0yhgCef6e270zFNX+Z0P/s3h8aYFvv5kZR2ZbM5zl8ouz3XewXz7yJ
 JQN6aS7xBWhDwm0dEYxzL+b385Lq+vUgRg+sJLDEgAlTaMd6iMCGdFd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Use scope-based mutex clenup helpers, it reduces the code size.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (2):
      mtd: spi-nor: sort headers alphabetically
      mtd: spi-nor: use scope-based mutex cleanup helpers

 drivers/mtd/spi-nor/core.c | 75 +++++++++++++++-------------------------------
 1 file changed, 24 insertions(+), 51 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250211-spi-nor-guard-mutex-0899888a4586

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

