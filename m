Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B1F25745F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151838; cv=none; b=ud16ZLdpgfDMKb37f1jw6/vyG1n7XASwptxASw7ctvXDsDjnaDSFWuJJ6GEy5tX1ZIlvqXt/2/O2s1SZwY6kLWTAyOasN4yh6sHb5DkTd7EnLPGzMxTf4DscajWupMYCSq985E9bud7qTngr0wtRHh7o7CD/CQ4CucIaSJN6AVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151838; c=relaxed/simple;
	bh=PXVgHVPYegdRX7cYC838pfew04kJcnGdwL8MrqFnLUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pc07L8cchwQchboRb4SQp0lGIOBO++OgXUP/WiSLGP3Ubm+5u/RlUYWXNh8aICpHvFIkR80soO23w65f9uynkhQ6OKg2DCWDmGMRhLDCmcxjfPJQoJgBhLIdZnz9Fq4y0ZYFL8q70zSHyKj6+7J33e/bze2TJ0w5h5IAM5KmToU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Q6cn3Ad0; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Q6cn3Ad0"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so130896b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151834; x=1744756634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5psd4uyYELxSqHEi4JcOM6XflshtV89daX4C/MP4ds=;
        b=Q6cn3Ad0cEIdD0Qjb0uHtr+Cj62oQJsgRIdvPStcY5x2Zt1/RQDIGT0yjQmSdgbR9J
         lQisxMMFj67C4gqoCmqbiLWtwrgShqSpKaiM+SoLf52mC32xlZkEFhSjSYTHM9isl96X
         UyI8+eKyUer4IxrUhPiYXW4wiDkxwUo5RyDMdApAoDoo/mu4/Tr2qIORkGCapR1IVyT3
         2apTs9RTMUJGFAfWRqJ9CNL2br34vpaJEduswx3sR31yO9/nZCUodLansydK+Ak76SJN
         P6HjRXQPxrhn8LKykqR7r5zwq88rFHiYwSFr7c1LtY/p8uRXZh5ag3zoa5TZP7IeIfa8
         9myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151834; x=1744756634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5psd4uyYELxSqHEi4JcOM6XflshtV89daX4C/MP4ds=;
        b=jUF0FgBHsDVJ3o7PRFKTh/JRC8xSLv/ndT8pZ9m7r+w2+CGwwm10W6iqinZMc8rROr
         SKRm3SYrvlxTNljf5f5Xuc+n1hrHYlF4R3XJI4q/h2B7atr8LIfUHWrBhA8ZpP0hYHUE
         wMEqBDkpmgOEUMyRKWfKmYWwTgv4x/hrxmermCYt37ccat7pe7FfFpbj9YkWXIBigLgD
         HORHMS+2butZFruRbZ/nh6ey7y9xI0NSR2r/7UWNPZQyEd2+6ddEvIyOpmxwcJWgnG3N
         +A2ojF+3XDPWQJgg34KkCKyxzPfKGopezUCA43c2pFPv0OxFw0l7ss4Mfx/wSPT3JnPi
         GrYw==
X-Forwarded-Encrypted: i=1; AJvYcCWcU/5XYjl6yUNZOJKSfsTi4Pt1ahdygCPM+wJd2Kb7JnBWh52PF7I7CxfKFZZfe8FBK7Re0TEVQu1LF8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNf5M/27n/X2eSbkb+ts7/U5jrBAwuKx4nkIcxQkvDW41RQV8
	H6ElALeMsPPtE/+zIzUwB6cDnAQzvwDmQ7QzfqMSd6W2Gg3Zfuh0ulWZKlf+0R27tVNzNp++QNc
	=
X-Gm-Gg: ASbGncvGiYwSDzQETDRsBwxQtLoxX1nk1SdHpFZ6pciviw0vdZgrD17oqnMokaoRz2l
	fI1Ttb5nytV3ninkSW/bwDDYH8sZ2+AAFAuNiMZM1BL7RoCaUo8NMoKev0DILdZbeQX/HfvLOds
	58K99H4/6wJ/r32ZAuDNve9W4a60qxDlpSrxRLNLc/VPsnnlZcqKERh7xchkHAfdoj5rmB3BMkg
	oiJti7KkvPlxSbInpONnndk3CwVMPyGC5liFf6qMkccLTqGVTElLgygs+Y5KVW/v2hgP5glR5Ez
	yLpY+FD6evfiSsqEBSdrgWc3YeI8Y2oa5JJhDIWcDPCuMsqWlnxoThRCGRHbASzgojjX1rIGg/a
	MOh7BmeAaBr03mumN9166
X-Google-Smtp-Source: AGHT+IH5nHu6Q9oriNtPHT59BEfzZVatsCeFr84A/ulxraBO/exrM7YRAFjTVfIAYkkRu95gUGqlrA==
X-Received: by 2002:a05:6a21:910c:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-20158d9ae12mr1016266637.3.1744151834543;
        Tue, 08 Apr 2025 15:37:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc34eefesm9539344a12.36.2025.04.08.15.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 10/18] staging: gpib: hp_82335: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:50 +0000
Message-ID: <20250408223659.187109-11-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82335/hp82335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 1a93a456f7bd..32b3aba673d9 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -24,7 +24,7 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for HP 82335 interface cards");
 
-static int hp82335_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int hp82335_attach(struct gpib_board *board, const struct gpib_board_config *config);
 static void hp82335_detach(struct gpib_board *board);
 static irqreturn_t hp82335_interrupt(int irq, void *arg);
 
@@ -243,7 +243,7 @@ static void hp82335_clear_interrupt(struct hp82335_priv *hp_priv)
 	writeb(0, tms_priv->mmiobase + HPREG_INTR_CLEAR);
 }
 
-static int hp82335_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int hp82335_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct hp82335_priv *hp_priv;
 	struct tms9914_priv *tms_priv;
-- 
2.43.0

