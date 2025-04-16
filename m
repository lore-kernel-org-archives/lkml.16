Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9CD24A079
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836140; cv=none; b=G2gdw9U7Ix7wmK5YuSeEm4CyzB7YYrFZ1EHwvWqn2POh02TDfS0Car05ET9nafaQrC863hNTo+WtrHfs6rpswV6l7hLnFzV6s5lC7iD2Iqdz0hS5Rj1egbDjtHqgZ4dBvmiml+3luQdEyvFzxGNo6njUmuteXudBnUr4l4CMYsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836140; c=relaxed/simple;
	bh=oZv9J6EAs+La9Yoz4jWDKoBjoVKNXoiy6YS2fSQlpKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNaAOU+qOMKjKRcyf5cyqh7fVNw5efRO8Z0VM2N4OtIKl6Hg3zugbxF+Y8HjsXkhKLUntPlb0IUSaYiznVAjnX0/6i9CcHgjIygmOvLbP8EaqnxLNS8Yxjg1boQQ7ZkDchW6ZAffJ6L6/B86XX4wuWYKtph0x24B5pLADr5x8/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=nC517zMK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="nC517zMK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224341bbc1dso1036015ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836138; x=1745440938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaGk/ulT5DmrCZA9B/47jOByqfYQN8rvXLp/mrP0bU0=;
        b=nC517zMK+f9SHMl9V1jsUwgzuzBezfGmjeX4rVP/GiW5R8sDEUkfJHNqkqZyFM4Are
         7+/adAmAZ+BHnLbOwQRJ27NwPWY/V94R8uU97FTD/3D1ybnLXFxSbkqeePHxiaePfwj3
         vUKKM7ve7+KTZ+mfjnIauL7HhPokWshA3iW2fKe7cInTRZBN785zFDd3lGlaOo1rFf/P
         1SIKRtcHfUsxvkml3ukxNcxddjfpUfvIbUsFi4WcPEXt9Clv/mxQCr6mH3ld323Ae1Jt
         a48+/h9rjV0gjKAH94GVp0Vr1DkC6I+gdnn9ecSC2c+Yxbmwtg6fAEe0FrxuaMEcYRD2
         lahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836138; x=1745440938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaGk/ulT5DmrCZA9B/47jOByqfYQN8rvXLp/mrP0bU0=;
        b=FSAcLS8Igwmx9a+0F/eYCYPSSuijQFbkA58CptXSnqPMYD4+/VVXrpoTOJC+SK0cLD
         FYxWMy6asdFGa1Ze8sj1kWLWh+91qV4hFVxmOMKnYkN8WBmenXSbCH3HQ5rv6sH/0E1+
         DIQFmlWP8qI6k6rJSyp2vIvBJhYm7KH3RekwF4dvTkkjFd+sO/fltFOTfO7G8H2EmGUY
         WorWa+ZOVgFIG4LpicT8//VPZucj4/NDY8zSK2LkbocgbchuZjnkNvx8ijcVscXhLrGU
         hIqtKQlWjR33PAYmwPT1vKOT/SirJkjW6ATHkwZtk3nIV4zk6xbwSKLDYN60uXBjnUu4
         yQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDCHkczYBOM9s9fNQoAold4dJ1ter1LFMn92bdHTbYUKr6ODFyBT2SckNWvywntbX8Q4CCpFRiqZuM+4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqqck/8+Vr19DBxR1pb1dlfrrVon0TusZp6cVahb7/chSNr/lQ
	tIzGBwkJxWpgLm0lvdeJsUaMJexJnBJsfxksiKAHSuf0U1jLePPuNaATb9TqzQ==
X-Gm-Gg: ASbGnctOPYLFOvgBWiBHT8lp42VKoW9/k5qeOzrqpFOtsPLkQPYsky4Y8pRlNzD7QNc
	l4e3td64FFNr2rjCVRtYc8roK+Q60GGRrA7argEHYcO4N2PHXPI9H+vEphsu2ElZaKXPfTY1ONQ
	GJIauZRZaV4eA9Jt+q8s5JnS3Jq/S/8ffcoAx2vQ6m5xe/5gBjnNF5knQzaLDZO8AHQTujSX1vL
	4jL5pdyqYjZcRyT08gGEGMNXnyZ81MleLz4zmiQewKuT72maLFPr4kGlIhmiTs3pE0nUYUyEjmT
	laFbkJCjtbXqBPJbKVJ0j3EgokAfdZjkhBUSd16IOmLLNciMSRXozI7Tn3lf0iIJN/APn28VNKj
	wEUDK4w==
X-Google-Smtp-Source: AGHT+IF0xLStOVVrog4mqNhmnW4YOlgEC/0TphCbwZqL8gsXZoUG+2xj/8FpaIJKuy1Jt0V4UFA0/w==
X-Received: by 2002:a17:902:ccc8:b0:22c:2492:b96b with SMTP id d9443c01a7336-22c358d9c65mr56564125ad.15.1744836138067;
        Wed, 16 Apr 2025 13:42:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc4b96sm18797775ad.174.2025.04.16.13.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:17 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 09/18] staging: gpib: gpio: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:55 +0000
Message-ID: <20250416204204.8009-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 87622ee841c7..443d739c7edf 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1308,7 +1308,7 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 	return retval;
 }
 
-static gpib_interface_t bb_interface = {
+static struct gpib_interface bb_interface = {
 	.name =	NAME,
 	.attach = bb_attach,
 	.detach = bb_detach,
-- 
2.43.0

