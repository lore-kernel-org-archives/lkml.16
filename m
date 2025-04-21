Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7E31E5B83
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261013; cv=none; b=MTKrO24Tq2DHF9ZNgbgPFqrnX9s3esD0gL+Kx4kzkRHIYyXYchE3UhrYMoFmqMsghJp7xH6pCArWR4ChwNrjVOjB1AFH5L6MuT8vitXUcFNQEAWbEenxCxEO5UqvEsKxV5IWk/ABlBRmMa7boknWghZ6+ZeQbhLeRFFE+sv+ewY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261013; c=relaxed/simple;
	bh=rxhlXqyx5x/2Y6lC6VYb0xiaMox+hPMwmGgaxzDTUmU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z1Ob1tfPIRshJyMAiw4cU75SNYKQ3ctywZM8MidhXfA5cC3ROHtGaWDWtP8wMrRLDazQVxvebezlaUmUkE4xOYaMDrWUXSYiB6jlU2THqlApqFPDv9rRmxYwnMh43+GD7Um+mE1dxuhPVunf/QXNNAsVbWRNzfYV/q4/HHzdIy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7Vusp9B; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7Vusp9B"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499659e669so4667634e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745261010; x=1745865810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZtocP+NkKmjE5uyIOjC9xo3yUt3gITSkl8Dclb55ow=;
        b=j7Vusp9BTvDtqKTvc7X7IDnFHcVBNhlWVAdGut3E7Tf5rprrn4u8eGgnrMgFKYUatQ
         39nBOVXVaIwNPDwqfyVKK0mUfjHr/xlIvAV+LPPgtBCP5vxb84R8l6hiL7g0IBdRxom6
         y472+G/+hp4lGBsilu1q33p1uNBCK4JGoeqJwZzh6EADWKxXzpwWdM6yy/zyhMrs2sCb
         GzgzvJfDMYPXq7DgPFFlpPK68nnC3lwgInzF3ktMiI9t8aQdPJQHNSlm8C9cOLWoj8Rc
         xFKXrWPBJbJYHJx+GEeSqaqP6hSktxlQp2wEpf7ig9X0O+cKU+1tlJZsmEThM87kMRIq
         KYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745261010; x=1745865810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZtocP+NkKmjE5uyIOjC9xo3yUt3gITSkl8Dclb55ow=;
        b=V9jTRF+hl45KZjfAWG2yitN1mwSEo54XA+3n8UKwkmnab//n0SZTIygVIiP9l5pAg4
         3P6VxquujHVoIHuMMGl6QSkLtIsFqPMXaKn2+cWgdEyIJjMalor48qkH7OWWeaPMOj+M
         JWlaRGBYoHClRqnlUbrWf6WfypeyaM1Exqh0XigcyO3ZJGtApw81XAixXVxgICg3TeEI
         3ziTU7zOARGARpVdmFPm0nqnNO85xyuOM8au9IDlqsFuWvJxqr5VdzrQ5aeBp9iHWcFB
         v/Z81cODXb2SX5TGw+5K9USrdKClz3xbE9adqcPIJRvzOTLN6LjmmexK/ksfD5QXai0G
         HjBA==
X-Forwarded-Encrypted: i=1; AJvYcCX4eQ17hIcbb73c4imjUbgfm3Rki42XLLwRtcQFOPndGItuS64+8uNaZsjDzt0pBpiRtYCXHn9MkAL0ffg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5w1/Jvqw+2bZ1NIVLv6i++iNI1l5r3y4aQj6aqkN6BeiGAfwU
	mrEDKkxbN6M6oEkQFkIOLBKskHnNn1ZwRlp00ZoJTqGSgFSD2JnW
X-Gm-Gg: ASbGncuHiZZ18Y2DztJHtFCKMjqOGxZqpJWCUd8w6zlEfDcvyGf6rdbdhp71jIAErht
	O7CROwQX3Rhmez1KlgCWUYeckk5A/JjDXIRi1b6zChrbohRvNAqczxyg1WeOC5ou5SrPEZ5I4aB
	dMaRq4Q23eNQwcO0NeiORNV0y/6/odOkSq6v8NYgUwfU2q7t37D6G2KWZduCqGj5wRyBpKLg0B5
	0APc/9ueSciUGXiXTVZ2sG1FOr/CwF6mV9r8jH8cm/+PXHfEOibM9DTNauebWkG+bMM9qbLzqXh
	bCu5wfT91Rg4uucXVpUQVasbG+OUAat2ofmUtiIfYIs5cEf1m6a+DpYL6rhw5GkuSLnsokJn1/h
	vGLv97x6MndQp4ts=
X-Google-Smtp-Source: AGHT+IEe0pJkek8HMn88o4XZ+AcdWsXyGbn3kvFRTYs1fpCHR6vgtkAsVOOEKwAJQwbVkczNQL8opQ==
X-Received: by 2002:a05:6512:3f28:b0:549:38eb:d694 with SMTP id 2adb3069b0e04-54d6e635b0emr3279125e87.26.1745261009310;
        Mon, 21 Apr 2025 11:43:29 -0700 (PDT)
Received: from localhost.localdomain (c151-177-8-194.bredband.tele2.se. [151.177.8.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cfda6sm1001764e87.126.2025.04.21.11.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 11:43:28 -0700 (PDT)
From: Marwin Hormiz <marwinhormiz@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	matchstick@neverthere.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marwin Hormiz <marwinhormiz@gmail.com>
Subject: [PATCH 1/1] staging: gpib: gpio: Fix memory allocation style in gpib_bitbang.c
Date: Mon, 21 Apr 2025 20:41:44 +0200
Message-Id: <20250421184144.220972-1-marwinhormiz@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change kzalloc() to use sizeof(*variable) instead of sizeof(struct type)
to improve code maintainability. This follows the kernel coding style
recommendation for memory allocations.

Signed-off-by: Marwin Hormiz <marwinhormiz@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 86bdd381472a..28f2f44deb39 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -46,10 +46,10 @@
 			dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
 	while (0)
 
-#define LINVAL gpiod_get_value(DAV),		\
+#define LINVAL (gpiod_get_value(DAV),		\
 		gpiod_get_value(NRFD),		\
 		gpiod_get_value(NDAC),		\
-		gpiod_get_value(SRQ)
+		gpiod_get_value(SRQ))
 #define LINFMT "DAV: %d	 NRFD:%d  NDAC: %d SRQ: %d"
 
 #include "gpibP.h"
@@ -1063,7 +1063,7 @@ static int bb_line_status(const struct gpib_board *board)
 
 static int allocate_private(struct gpib_board *board)
 {
-	board->private_data = kzalloc(sizeof(struct bb_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);
 	if (!board->private_data)
 		return -1;
 	return 0;
-- 
2.34.1

