Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602725DAF1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196330; cv=none; b=FXMVeXw67IjDJR2PCC8xG/6LWmOCsZt7wmr2ZNm1XCRQOkHEEbiVqxM4WAdaeAWZcSqP3ZzsaLwqJ91iWvT19BWSwF96+aplYwT/zBScpQtpv3sR8z9pNwnX8Q4/+LSG9pqnE2Hl7mcNpis18i6LjFihqLNrPDOwxio6UcPdQTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196330; c=relaxed/simple;
	bh=Beq6p0A0Aj03j7AtotcrQhblg6FIC8rtviizuSi6oIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kg4CJwAcy3zOZzL9xjgivfmC9b4lu4ncMj4k93f3/5qmfU4cE9ycYF75faUK+xvcdt2kwvJMFZzXKknlB6tK2SjldSL+kwDXayflGO6OjaFfHW4bjN67MizDO79a8okMDyAx6wPe1AKV13f+UV+tLjyVSWkDyvdDTSjuRJAoZyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMIaZK4m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMIaZK4m"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso42896405e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196326; x=1744801126; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiF3hItZ0UAK/f8Cj3X61O/0nheHKx3BwiQHqAtvtCQ=;
        b=KMIaZK4m2AB+tusrYpYso1uIarovmI17rvC5mYPkUTH2fA3gKybefldLMpqUbuuqHQ
         t+k/BH8dVdTIBQUl+jfluK45wdrdc9luf5lRBzt1v4PxUlEPTv3YxE2HMsagh/h7jaDY
         vl3K6BclRbmdSU5BbmJu4hoUDL4CAnmsrO2X3DtvbuHeTTbo8vCG4V0zG5x6PDTjmAhP
         ms1C7HIP2SqAUiw9BH3PgzGGeKdjK0MEDV6YdixiR3p24RtZGoYbTacQVcW2/B/97PpY
         dgu4FUJnHGafQXZc6iAYkHNMhrpBOt8epHuOc9iK57LaG1LSqShoSCoFe3n/xqSR3OL2
         6p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196326; x=1744801126;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IiF3hItZ0UAK/f8Cj3X61O/0nheHKx3BwiQHqAtvtCQ=;
        b=nEOUg8+8xRdFwGDv0Cwmg5X4bMnLBNR71p1S89RNVgdw144xtoMfzo3FqkvMNK6I+L
         U+hHzzJIoBVFYu0XlbBgLaHc7/2r9UDcjurogL6wX67vt301rS19CGvyZ5sOSgiX+JpD
         mba93HQVlhYOSW2tQp3zFu47JO6hoHVd+DCNS23BtnIynIG/3w67YjKZHHvDkKjS9Iej
         seKn01ycim6U2KKG0wLt8WSgB8uvUGavE1hN90c9zbWJ6YI6DSJFxqfoEFIV7zkKK1vK
         BYl0kdWvoC83oZz31xhw/KYF+j3AfLC63/ZAWH3/rD6K9+Ms5SrWXquBK15NUpxjFjPs
         zk3A==
X-Forwarded-Encrypted: i=1; AJvYcCXPYZpdFo2Ikncmq0/CmWuoaTcApnJzkl6paoH4UY3zNBk3PrCfXVMWVsSqwEuZX0YOpQOE2k9i9GVQKqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeHTo8URi7JwpfsDLbK8+Ez2hrm//ztqThA9RJ2L2CEoW0PTKN
	A7ABeiuvFIrki8mUoDvvTl5IfXh+NiSDgnQDC0JFIE0q76Y3g1dafvbEVe4v0lE=
X-Gm-Gg: ASbGncuYKGtn3fx2J+s54qB4RF1CDqccDNFh59hnxzf8dr/Xa8QpoUQOU3a60R0e1rk
	W2NU7qg7UTFayN/+Ret0bbI7+K0wW9BRg0nYg6IQ6T2AwMDXPjI7aTI1Q6dQLnGjjUxz40nKOAK
	Anl3mwV7wYwmJlEkN5j0eJXnFV6+ANeBuc6G18I+7N+ieCsoyC0fyQn1o2GXPayS82U1Y8l1TqP
	icOzUx/0CivdeZRFFGoYX2SR8hFic05OHvaKLCgjX/ayYkxT3AkXBF4VHK2WThjnztNa6KzCE8O
	3e8Cyc+Vbugi0GNQ8vx63fdKb7c77naUkKclgcMLYFFrAw==
X-Google-Smtp-Source: AGHT+IFqdSFJblVZ7boxxxINoAK4ozoRnpThv+xWoaahnbfo9IExrYdlTmE3N6jSm+EyLm0u1m1MSw==
X-Received: by 2002:a5d:6d86:0:b0:39c:310a:f87e with SMTP id ffacd0b85a97d-39d87aa837dmr2381147f8f.16.1744196326323;
        Wed, 09 Apr 2025 03:58:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d89378daasm1308967f8f.38.2025.04.09.03.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:58:45 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:58:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brian Geffon <bgeffon@google.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] zram: Fix uninitialized variable in
 zram_writeback_slots()
Message-ID: <02b8e156-e04f-4ab3-9322-b740c1f95284@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ret" variable is only initialized on errors and not on success.
Initialize it to zero.

Fixes: 4529d2d13fd1 ("zram: modernize writeback interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/block/zram/zram_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 2133488dbfd4..94e6e9b80bf0 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -741,7 +741,7 @@ static int zram_writeback_slots(struct zram *zram, struct zram_pp_ctl *ctl)
 	struct zram_pp_slot *pps;
 	struct bio_vec bio_vec;
 	struct bio bio;
-	int ret, err;
+	int ret = 0, err;
 	u32 index;
 
 	page = alloc_page(GFP_KERNEL);
-- 
2.47.2

