Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D322571DB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151835; cv=none; b=CZBwfEzbM3MvLnCQFMEfo7WNFbWfUCbKA3hbYbwq6hvbE8uADX4S4/6GWeHmKqhsB7N6GQcKmtPacb4qcWlsXbVvFjDzlYTMOsO/GMj9bV9S3DAe2gDRfza8c0VcMe7KR6f5SH8ATzsObAEGPMgCpqtx8k8l6jkvf54eoEwUSLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151835; c=relaxed/simple;
	bh=q9zf1c2z0k8nf25Gcd0LQ9hAl8FQJe2qwvY1PlNvQ7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fLvOZy4qpk+R3snylhYj6rXdV+a4vORALRJYZLcghJ5R4Jnb7NfKOpCrrscZuqwBp8mDS6CZ8gxcFEow5lMhZqvC31pe/qmxO6xAiZIF0szCixQj2U9iTZ/SR7D1bQAXIH26w9PyveFrXTIxtCX25GmopOkTHFFF/YqMZz9ZYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=JdiBaGX5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="JdiBaGX5"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c1138ae5so6057873b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151833; x=1744756633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjpQj5oY//AbdRKOiO0HjQ1j1RxhGsiWjsuoiFTCEiM=;
        b=JdiBaGX5JVHx1wJqKZrPR//AqecEoZtMhV1ZEipusBYrwiO9e23fMf1CPbeJxugRCz
         q9EF0a/SppA4LTvLqA/NVIPHSosRsB8vL5GWF5ZhCDwfGMC1irXBlzY5dW5MaQwutdS5
         Qe9qAqKiREP+YXMFmwLm13OGLsTkeY/pRQDVOsVAm7YbLHaVKcpzBNtbYMlIWhvEtfWv
         NPZt1ITqg2SVn2Y2FBijL2Fc3wI4caDPguh3kXZwd0Ls0tCoNXW7zSs0QO20Z6/0k5Wy
         xayea4mG7U6uO0iixVmtaDe49OTte5tMAX2sFMvp+4KD32SotET9kmojXwQVlXPtVx6U
         3UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151833; x=1744756633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjpQj5oY//AbdRKOiO0HjQ1j1RxhGsiWjsuoiFTCEiM=;
        b=eMSRJwDnvp2yoz0rzZRN5DxH5wDofR9oV2WsEZxjW/umWV8F3SCCd75542QFJymoTP
         knn/ZOeUvHwQEHeJRVmiqxEn3qtQZz5hPEslxhdQTBAXvphzXZNwO1TS2P5jz4LZWmAT
         ZZvBtwtNd/ZOwBHammjVcVAIOS2SX9MdId8WREE74U90SZll8Bgzy8toW/0Usr2I6FCL
         9TPpI4wFte3rlznSwyZU7aOLPguYpdxYOPsf0N4W+dGYD9zqMCj9CSNm6vAjDa8s7Duk
         FKK6EJ13wnFpFjSvbokaNpzDRqZGfZrC34r5NIdP+bwG4J6OeS/S3qQyJMTNiEHBYyiH
         Mo7g==
X-Forwarded-Encrypted: i=1; AJvYcCXxVz9N+uCukX1R24msewo9njf7ITs/3yad4UXDAtR+KQAkEQrJqEv1wlgN/YxaKvUAI6q4xT4a6YQ/5SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNV1TKBTcdztBcI0Hovnn4YoeoUyR30P+2+Dt4152nTLNZ+8/K
	3v4eXOV8LKirm0SbvAfvcqJwDmQS9K+9dAaTW15V62TO8kqoqgVdxWfuSt+dzA==
X-Gm-Gg: ASbGncutN6soKzrYYlVA9NauEw5aNRe4yJUP4wGqBD7b084CoOr/gnRwIwjsP1Sofwy
	5HhSbAI9Q2cFkLUiIA0aohDMDVgQsGT/gUz0dqrJ9jJ8eQ1wsoXhhtA72pf0f4Xkp45xGa7t+2Z
	sBlG60/l8CBOcYWvqVkF5XJpzjhOkaVnVT5mGZ2TeFOj9ALw6nm99q+Jaw3x4pso+4fPT4WuBzG
	ycfCDQKpvoCRq9FEai5U5bgPncY7qZYfxuudLxy0ywMS63rPv+sq59mFhrh4C6VLowSzIv/xvux
	0vluM/qgzQhBoJs6hHD+2+b/RlJY8SsghKX2syAkNJVFnzAXtgcpUTaIoKkfRZCly0/UQ8aifJi
	fNcWmpcyF7S7I7RRsbFPJ
X-Google-Smtp-Source: AGHT+IHcbqmqqD36HkzOjtk/zQqU6ShjZ7AuFw14mbVyYAOl6TqLnbSExYECmxIE4cpFwf43ts+GVQ==
X-Received: by 2002:a05:6a21:3103:b0:1f5:6a1a:3284 with SMTP id adf61e73a8af0-2015b01ffa4mr230407637.40.1744151833350;
        Tue, 08 Apr 2025 15:37:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea15d6sm11164546b3a.89.2025.04.08.15.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 09/18] staging: gpib: gpio: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:49 +0000
Message-ID: <20250408223659.187109-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 7e85dd29ef93..c586f739c251 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1206,7 +1206,7 @@ static void bb_detach(struct gpib_board *board)
 	free_private(board);
 }
 
-static int bb_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int bb_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct bb_priv *priv;
 	int retval = 0;
-- 
2.43.0

