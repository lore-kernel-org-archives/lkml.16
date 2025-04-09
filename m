Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C30C27CB22
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222221; cv=none; b=PvGTkiZ0H0XV3pp0a04qqwkvqFEjCktNNl6BTHRUO1RKbO6NYCoDMPQLgHS6mcxK8j5VF67Cz9F3/uT5c199xbSMdj+nnRTq8B6GrHgPtINSMsZ/IeoucjZy9xoLBRTIhLavU0Owjqvs7GsjIQQ6BSLW9iaYnbVSR710dgnUmOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222221; c=relaxed/simple;
	bh=naX7kj5CGDv66WljYbqaEwF3sguVoJYmEOAQsEO4f90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=At2Qb3Fkfjtm1Ggue8CQFLoio5V77HznXy7NEPAW7sdEh8CUrpBR9mfbnWrpX9m3MlqT6BTcP5OlRxwj8sFH0ySKrIWxN5vZqKag6xM7VHIQ9LG7PUK5hBWe28hvZBGZo1p0LHvc+5Hd74/zbA/678B+V+AtfgPInBt5Rnyfs+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Lo6kafE0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Lo6kafE0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227a8cdd241so83410445ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222218; x=1744827018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otuu0KVcsZF1FCQM7Wb8tH7tQ3lPKh9p+2insEufIqA=;
        b=Lo6kafE0pEeCIEscbTlh2py6DEWyknRxUkdEpXeNmEt7s+HJcuc7CJWMa+ZQ28zyi8
         8tk60SO/jo6/bO3RjG4OtGfSiLa9tvGYfbRyeB9K9xBEHETP7wCyLPkTy2efto56tVb5
         ExJepddk6VGTlNHdVADyce9iDNTctVz6EJk8a/iDJVCFOkQ7vSddCfkT9CE7zWM4pkts
         L+vag6Ijp+Rli7/j89vcWfgai8O95KrRmBNmjG/M+Cm85PhZOfUOgFD0//KVShQXlFSr
         BZ/HUNMSkdTLDmazUqvWiuELMgBSHGsiq0QlaWhAxZQeNMmjV6Mi9/RjoK06Q1WOOWJW
         d3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222218; x=1744827018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otuu0KVcsZF1FCQM7Wb8tH7tQ3lPKh9p+2insEufIqA=;
        b=Kvii1br2cCzaYS/tyfQps2AWinm7bkKNRPvV72hlmQ29Vvt7gcru0HzCFkgvxbg1Jy
         OIJfh8Ce/mVm88kMWgDFERTwCBeXNT2diQzQRZy+ctfeVvb5I0fDK3W/DWHlu5E/Yme6
         n2ZUVOdHHDoHKmXPVMbmAiIKipRaWvRLEMYdGBeuY4YtP/xZj98sfeoAg1tPjWVOmW/R
         HIgg4oear4hNb1NyRSw696xvkmps14Md8Wc8IlY6ZQhzOHQ6QLRWDvsSt6VTeeaX3zaO
         SVBL6nUYYNQfK1vqBaVw2L3hs31lU7Y9t40ak8SUf6GLz6C1xzD7vFEbfxWqhqkGcv2o
         FgzA==
X-Forwarded-Encrypted: i=1; AJvYcCXagDepRZp6zxg5Wuqv0qy02sAU9iGUyt5mp8+QbjgWlqAzoGYiAGVZZillAWIp4aJLCTHq9TXoxZ/4SLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+iMpe3dhi6dESRQNjkSDN19RyL8ogYi3xlPVioEUxn814Lxz
	1ZZhWPLnYaVD2zZ0qtpN4CMA4CW9Ai3RAtxTUH+7Cnj5u5j2WVpAFCnE5yFfEg==
X-Gm-Gg: ASbGncts855KgkABcnHSM88fiup2Azu8ITc3OxBwirXyMWAJiyjaTNc6tHU12Zu/u6K
	yAfegL9YKNlZ+CaWWzDI135CWITAMe6lyFqtu28RqfzoPv37gOnwi/FlyutfUOi0bPGgvcenZVx
	9gAl+geJzHjYCNfZE5erCAJwETwpN+wlpmTuEQdv+zo7vqjgBKqLS67oTPqj8E9hqmO2LkYQK39
	WBCyO6B6JDPygMQ+LWQMusc/vmG4dmTg9LPgPEvLGNRIJ1Wb7hOIDGTcl4NfgZgtJovjWn9dgg8
	jT9nzDZusI5OZSdI+YOKEzcbyMew12y4OWHEM46f2BWs8Ym0c1Zym/S7qdBlDctTd6UzDxoVT3k
	dnDg0fg==
X-Google-Smtp-Source: AGHT+IE4U7zIV+8dG8B9BPiDBEiOry/0q32rrNWZgASxDz+m6sM7fex6MFO2thwxTkL/N91e3ykndw==
X-Received: by 2002:a17:903:138a:b0:223:6455:8752 with SMTP id d9443c01a7336-22ac2c26682mr62169015ad.43.1744222218559;
        Wed, 09 Apr 2025 11:10:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b29esm15253935ad.81.2025.04.09.11.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 19/23] staging: gpib: lpvo_usb_gpib: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:49 +0000
Message-ID: <20250409180953.398686-20-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index fa185171cc69..4bb2cd31fce5 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -705,7 +705,7 @@ static int usb_gpib_line_status(const struct gpib_board *board)
 
 /* parallel_poll */
 
-static int usb_gpib_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int usb_gpib_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	/* request parallel poll asserting ATN | EOI;
 	 * we suppose ATN already asserted
@@ -997,7 +997,7 @@ static int usb_gpib_write(struct gpib_board *board,
 /* parallel_poll configure */
 
 static void usb_gpib_parallel_poll_configure(struct gpib_board *board,
-					     uint8_t configuration)
+					     u8 configuration)
 {
 }
 
@@ -1031,13 +1031,13 @@ static int usb_gpib_secondary_address(struct gpib_board *board,
 
 /* serial_poll_response */
 
-static void usb_gpib_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void usb_gpib_serial_poll_response(struct gpib_board *board, u8 status)
 {
 }
 
 /* serial_poll_status */
 
-static uint8_t usb_gpib_serial_poll_status(struct gpib_board *board)
+static u8 usb_gpib_serial_poll_status(struct gpib_board *board)
 {
 	return 0;
 }
-- 
2.43.0

