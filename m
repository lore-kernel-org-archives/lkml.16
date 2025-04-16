Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5C2356C8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836141; cv=none; b=nMR+9KwlsehJ389vN18bY2I7IxTjBp0eptoJdri8Pmx3z21FOZFveN1pt85BvP0gY7MPpmF4Thn7oZ74v1mV5XPITzWOQ0cJASWSGFxCA6szy5zRSE+OTBTFF/bADUDf9lLdABI8FCrDT3JqW/whQSihAgC7PCZxjLOVW68Xd44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836141; c=relaxed/simple;
	bh=sm89KN7M+N+cjb4kBf0tDv/avTft4wb53ORjh52ocFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOkkUnAhCgaoY4o+R1YkIlF9PqPcGfuIkqKypo7ajhPHmCuuyYg30uCuPaex0KUtiPvjSKpRDeilUK2qwYjnTeuBbPqOLrGEs7Zl0LRF98j0swbTIWs5A/jLLA7VufnEDTLR2+ysUCiFZsJOiWqIVzuIZ1h+TVR+myr7poPxDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=BSd/pluP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="BSd/pluP"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224171d6826so1472185ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836139; x=1745440939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vov0toR1t8IP8gbJNzk0Bz9HIkssufBqsXHpZDgzbTg=;
        b=BSd/pluPrqFLFfD82CK3D07YSH+S2MFIZ+2b9KVlWh3FrtYFZTnIRZv6Pszc8l3Xw5
         yLiNJDCryKP2qLMJJLmYkYKEHUOCXgJ/5RFBYlS6G/yVRz40eI8hhlL0dmBpeytUnRO8
         vpJc3iJty20Zxw8t3apRIOtYNhmuwx6Le7hDW1/Q1SelE55VIR1CfUbUFuxjI0XA5tCf
         Gj3lDPFqw/Ddtqf+Qaq87E7WWk/fpkC0DyxqWHUTJDE2TrE0jlJ9Lh7CoQGUN4ElX6xQ
         /3sppG+VI6T8wSsikCmaf5Su4wjOlpIvXBvuNL3OckUM8CSyHf7vizMaT+kNRFweGVig
         ZhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836139; x=1745440939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vov0toR1t8IP8gbJNzk0Bz9HIkssufBqsXHpZDgzbTg=;
        b=cEowGjcBFjluSjtDrECLh32EWUMKaQQeBTg77UfX7P0H8L+lLA9EXS8EBrre9EwzYw
         53Ecq+YgF8rgYRcuW7Lk94aYWEQlC15p8B/Cn0XwHzlWLz1SSvrlnrkqALXyFfdEQ9fk
         jjps61UZMPdYvk7epq3rY5eY9O2kVzzLIoj5/17y6iXgwic8X0G8/h/koTbO/jO+Yuiq
         XM/2EdVLOnlZnz2q73usv5J9HjbD6DP0gz8Xouct+nP0iPqKFvt2yReLVZK5p5HwnV1o
         43PwZvlS3wOr0G8T6dEJURtVdOsqYrEI1n3h7IW7yvftHlXeHkZG+mLmuMXRqNtg4lE9
         Kn5g==
X-Forwarded-Encrypted: i=1; AJvYcCVREOBZtQyl9d8e7Y38gng6ydCsE4T+AEx9Ye2/KOo8vFdOWVK+2Zt4a7xH+LXmC9XLRCV4YrOUvHRDP9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLrZMmDDg9cHV3FVjKN+zOoFKo8LSA/NsbR/PiyBoBARNrWIzG
	whe77IuA500Eh76Tn2jDDG+4DSAe2BB/ix0YCmv+NunRxgNtG0lMehZUJNwFTw==
X-Gm-Gg: ASbGncvARDHbT6mRPJtk5qsUfX8P00T1IutgKRQ6MZ/whAa68YNxDnHn+LTIQXseBfZ
	rJWGoIelvaRhP/biZdisVVTVhZxCNwXlYKab3Ew49XecqCMSjgH0yzJrBL+BmR/jii63RpDlThq
	NbVQMyJQ8b3NhnIuvGYnKhfmCkSVnA5Q5jldaWxLI9k57rUXwqURpTb588zy68MqhvFsyfGLb7G
	Ptwv/9dz2kdJPJ7tQ8lce4RO9CU8p+uQN7ScBtOtcxoyWBQgQaBfZPDt5dQxWpixNMsKXosR0TC
	yfiREkRGo8TPxt5ebuOG5D/cVbQQsx5nDvRG4uFz8x0KODgmfvyFnZvHjRdKpIXM/2jy7IQWlIX
	cf+dQBg==
X-Google-Smtp-Source: AGHT+IEC1UkYosCEAC/j7pcT9vJEGJ6m1/2mfcIOPpw/u+A+HsK9Ra6AWSZTeSi34DA/3N/4QvxGwQ==
X-Received: by 2002:a17:902:ce91:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-22c358c543amr44393225ad.1.1744836139287;
        Wed, 16 Apr 2025 13:42:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33faac7asm18797245ad.137.2025.04.16.13.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 10/18] staging: gpib: hp_82335: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:56 +0000
Message-ID: <20250416204204.8009-11-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 319b7f6e35ec..7f14ecb46026 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -180,7 +180,7 @@ static void hp82335_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp82335_interface = {
+static struct gpib_interface hp82335_interface = {
 	.name = "hp82335",
 	.attach = hp82335_attach,
 	.detach = hp82335_detach,
-- 
2.43.0

