Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275928C010
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638339; cv=none; b=RB0l29uRF9O264x/KejPCNoIUor5xKiwlZCtcUaiqMykU0yX7jpC+nuTCP08ggOjzRwDC0z4QXwN2O29tOAX2EFNxe3YL9PApIz1ZTnMA3PiBaGHaXvKL7oZr/FqmuV2NPZsfFSlQg2pq7yZuWl9p+0s5/WyLrtoiRTjgEVsl/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638339; c=relaxed/simple;
	bh=zF3faO3IU2jde88KWMuQmf5+Q/l8n/LuG6lA+m+zJG0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nV+QE+w5SHeN0y8iBTouNI8lWw892CYF3RYNOBFTdt7DiadZGGUGssFQsN6SANhe4plvRxeQy/7zDSUv5KHg3wgK6col0P4WHmBNML2rfVjLivOzzfrp5B7Q+PDhN7/tjDQ5VubO7wb8fZrD7CBRdc/aTNqxvKUdtAMNb6E0EsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LieKSvHD; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LieKSvHD"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e78eb213900so144098276.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 10:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746638337; x=1747243137; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b9n5cPfDVXl8uppj2xa5Gl/xVZFBnu8YM//f96k1dBI=;
        b=LieKSvHDEsZGiFxD8Kjo1VJIS+JT9iR5NxkSQqfey3o5W2PYzmWDsDMHItcRXxnM+A
         KW+vJyM5wq2gXDWnRpHQ00s1HQeZVtjexIT05h659eOL2x4B0wniP+bNLJSYDDUKGpAz
         +k5t84bQyEZAn7uVtw9dh/dBoCk2QxnDswpxWlTkh4BgRk7Rqa06RwiNG2Kpq/Vkau6a
         NUNXtW1J+jDbhxbBvPja4E0xkT5PoOzmtjarNOfoLBqn1NAxcHzxjFSDOWvVlzSn8Lg/
         vKcMt4c+kIi/yzHEu1O8hH/EPpN/+2FNVLd6v5BQcAn4HBZh1cgxROkmEAntZDYtyaKt
         AjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638337; x=1747243137;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9n5cPfDVXl8uppj2xa5Gl/xVZFBnu8YM//f96k1dBI=;
        b=PCPnKWwOtBlzwwdI+BkioYj6paW0O8v4tKGy9aHUwWRy8mpeBiYfgnfrH97WyND3Qc
         IBhktO3kaPeTXQ40OCjFLnsoYGP+xmw4ytgzj5HJXyiWUkDuJ8UGReniiAnw/KyMs+Ck
         kj/Ch5nejBoyrRiPxToBrqqs1Chn+lm2NAATVdWDso9v05FQfF/SylorHDoPjclh9WSa
         TBnDk+imUkVACpnSXCvJXLQCgiGlefPjw2Sx33CJQCz9fmv5OoB18dJoPK7M8lB24tnt
         25z0uUvCOveGh3xZ9jAzJcVUlSCQ6WVgr2ztlk7nqTmbnyPi8Nk7D/8PbKad/tdK8/AA
         mlUw==
X-Forwarded-Encrypted: i=1; AJvYcCXndZRdvagV7JP0uaIIA3DzPuYwaufSDsy23HNoshWsxkpDDCOB/Cyoye1O7+TgTQqp4GHCvbMs7XfLF5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiLkJipUyw4nh4Z3qajIxCi8c7LFzMdYgK6iDOILK/Ki3W1S9o
	RYTbP6kaJs5GYz+sl4IiMzBMQibglXjpz6TsKpheiarPILlKgeMr413FMWnfY8uEgI66v9Bf4B7
	9p1o4d9tGMC2PrKjAoF/xP9N3ovU=
X-Gm-Gg: ASbGncvhA6Jo8vi3E56+1KXiCNjQGIjZjG/QOxri8WFoQnb54IaQ40hg9mSvc4HnD77
	ErhLZwA2Wy5DUCjrR6aPwBkwqHRaqI4SWk7cXIqZ3VSxkjOS8Cf9Z6F7lww9kIt2QVhUk5JI5QM
	0n9l6t7O4eGdIdLSjoHlWz
X-Google-Smtp-Source: AGHT+IEi8UCQyXy6izOt+S9txk4foE6SJeIXLqYU7Jpt6MhUGFskBtJYKyYfBg021oobJBG026n4Opi8qk5w/Shq1Gg=
X-Received: by 2002:a05:6902:4909:b0:e75:6432:4b26 with SMTP id
 3f1490d57ef6-e7880f8bffcmr6037346276.13.1746638336849; Wed, 07 May 2025
 10:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 7 May 2025 22:48:45 +0530
X-Gm-Features: ATxdqUFrIxLe3S0Qz6iJ5R7Hiy0EoaZxRQ1wavXrU1wOMLUufsELAUMCly03aQQ
Message-ID: <CAG+54Da+jDEXRQMgmXGyCD2EHjNFjA9nS9=ShdJPrC3EKjUgBg@mail.gmail.com>
Subject: [FIRST-PATCH] staging: gpib : gpio : gpib_bitbang.c : fixed
 parentheses error.
To: Dave Penkler <dpenkler@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To pass it as one parameter, wrapped the entire macro expansion in parentheses.
and build it successfully.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c
b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 9670522fe36e..a1f9c99c5ad2 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -47,10 +47,10 @@
                        dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
        while (0)

-#define LINVAL gpiod_get_value(DAV),           \
+#define LINVAL (gpiod_get_value(DAV),          \
                gpiod_get_value(NRFD),          \
                gpiod_get_value(NDAC),          \
-               gpiod_get_value(SRQ)
+               gpiod_get_value(SRQ))
 #define LINFMT "DAV: %d         NRFD:%d  NDAC: %d SRQ: %d"

 #include "gpibP.h"
--
2.43.0
