Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29CF258CEE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151843; cv=none; b=ceLr7/LMBv72J8uEwrrh7b2gaxeXrODIYbZuOAB07aqyWnOxH59Bxah0v1f8WVIr3S6eHUGwM//9bVOS+iS7WIybQjP0c8kl8JmqqxMZ68rmVZxRLdp0AVbGROll6QZ0sc+pwgHX/s3/O5SZVwMdMvm7QQVX16HQUlUbFfsOSI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151843; c=relaxed/simple;
	bh=Wdr5k+Zv79hAW36cz3jZ7Cu4GyzR4W+0t8T3mR5lLAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBRh6njVXNRYKmra2J20/+Q0VVaEJHdpLoZRUBLFUu/j1gInBbv354GBgdeUVHrpxZXLLTqETxuK933jmQKwodMS+Q897d75FsW/neQeeEoSiRp16QmnXUUuTq9dJilFRKirVzy2zUvJ7SWYl8Y4jv7Yys5MfVGr5LoDddUvvOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=l1VvtCb2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="l1VvtCb2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7432149b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151841; x=1744756641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6i6f/xDaRTJj1UsiXR+TSptxMr+Xb9FeptF6tQymOsg=;
        b=l1VvtCb2X0dEYIttL0F8lI24V2hXzSKcLkCidXHnRR7cULoTGq5aOyoQyyNPlidKFw
         gFSfhco31yK71E12wj85u5vMzLAiEORlDadQNXKIy9P0NsO51Y87db3aDIjBFvEddsC1
         jOuWE6nzRbEFaPBJ2rNTe+xisbWokwV8zR+2sEcQ3UIML02Jh3c1CMNQPDtQXc/yCj3y
         XG7B+JlK6lfwrSgBw22TgwqJaypmske+bnX5/0pfDvu5yfs9YGC6VO71X6xgccadeuhv
         m9C4AjT6v/thd+xpoJf0G8Lmw3/WI4vrcMLO0EQE/9MuW6Ozc3xo67j3ea5MwzCrtgR/
         sO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151841; x=1744756641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i6f/xDaRTJj1UsiXR+TSptxMr+Xb9FeptF6tQymOsg=;
        b=AbaPAyJMsU0Z54X4PSZ8HtpbffrBtUOyxiJp6syebx/dsuNzN673r2XQ1ab0Qh3nS3
         T6+Uq7crlOBdd8lhyAPBKWOsJFvIW6XysOQ9RdjqR3rreyyoWEUxrSPVOMW0UgbLyYdt
         qomjSigOCCjWetSdYYp411tJ8Cofn/0oyAK54DuZ513RJ5opM7ei8sEI5tyybET3eVvw
         0en6DySJSi+zblb7FaGSaFZLJ9eFKLVpHU/IxqMndjOJWW+rl+U34DmvtwcWJnETL75I
         Rmd7hWn93kfCBRr1ayFsrdesbv1C2Ct78JhUUDawVaWwCHUaiRwRzTJDWF7IuddojKf4
         Jt1w==
X-Forwarded-Encrypted: i=1; AJvYcCUcGw+5APU2aFgeNvPjp9mf7gTRTLpsrwxOlbXVJwIpCY1p+KahzVdFBB1At0w1SpxnDBjAYnH7YCjJiyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz81q0zDQ5ux7vACQVs9/mNbyznJemabRtm4wRq0hktYOgK/OiI
	mhLnKxgpTO9PIVV6eWQmZE5VPJFk6jn0obUjr0Aq6XlAmFfbildpfr8M2mNkPQ==
X-Gm-Gg: ASbGncsAWoqDEvM3axZbjnV/XrRihkeEqiUGzyiktiQM8LE2gxe1IFHN8bY+K83YL7C
	tkcsncVILHaEHG35dXtkvQiLHwcZstCGONymnSUb05iiT9zlPnJnheVO7QlUHzgyjovNzPVj5E0
	QfHAqhyXt2RNgTsvQeokCG6YbclBNkwqlfKlDX9lGR31O2c+Vyj4ZeJ3ypQxEgleritDYnaWYWK
	zF7yOS6oQRlRKg9Ci8N1NMKaFzqVZ2qNP++5/BXf83Pn1639aR7R7FlhJspKReO2LEzxPJkotJx
	m/C0kSgmuCY+yWjl8ntgZTio4gJT3rdnC/pgAQOxGb1c6/ZHcSIliLnzz3pHsVubqzMuldEddv+
	tO21tb8oFNa17gz0p6IY8
X-Google-Smtp-Source: AGHT+IFoBZxGkWgw7INqwMHfuyYPpHaT2GDl7uvAaPAvZ6mUMh+2oVqoE62mf4cAVTQRTXJT9OpxiA==
X-Received: by 2002:a05:6a21:478a:b0:1f5:a98d:3d8a with SMTP id adf61e73a8af0-201592d96ddmr970106637.40.1744151841276;
        Tue, 08 Apr 2025 15:37:21 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41af71sm7939369a12.75.2025.04.08.15.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:21 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 16/18] staging: gpib: pc2: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:56 +0000
Message-ID: <20250408223659.187109-17-matchstick@neverthere.org>
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
 drivers/staging/gpib/pc2/pc2_gpib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index b0b19e2d4782..a33ebd951e79 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -252,7 +252,7 @@ static void free_private(struct gpib_board *board)
 	board->private_data = NULL;
 }
 
-static int pc2_generic_attach(struct gpib_board *board, const gpib_board_config_t *config,
+static int pc2_generic_attach(struct gpib_board *board, const struct gpib_board_config *config,
 			      enum nec7210_chipset chipset)
 {
 	struct pc2_priv *pc2_priv;
@@ -295,7 +295,7 @@ static int pc2_generic_attach(struct gpib_board *board, const gpib_board_config_
 	return 0;
 }
 
-static int pc2_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int pc2_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int isr_flags = 0;
 	struct pc2_priv *pc2_priv;
@@ -366,7 +366,7 @@ static void pc2_detach(struct gpib_board *board)
 	free_private(board);
 }
 
-static int pc2a_common_attach(struct gpib_board *board, const gpib_board_config_t *config,
+static int pc2a_common_attach(struct gpib_board *board, const struct gpib_board_config *config,
 			      unsigned int num_registers, enum nec7210_chipset chipset)
 {
 	unsigned int i, j;
@@ -460,17 +460,17 @@ static int pc2a_common_attach(struct gpib_board *board, const gpib_board_config_
 	return 0;
 }
 
-static int pc2a_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int pc2a_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return pc2a_common_attach(board, config, pc2a_iosize, NEC7210);
 }
 
-static int pc2a_cb7210_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int pc2a_cb7210_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return pc2a_common_attach(board, config, pc2a_iosize, CB7210);
 }
 
-static int pc2_2a_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int pc2_2a_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return pc2a_common_attach(board, config, pc2_2a_iosize, NAT4882);
 }
-- 
2.43.0

