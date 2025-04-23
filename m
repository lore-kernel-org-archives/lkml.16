Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C6280A51
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396485; cv=none; b=XHWipP6VG7rq0t1zHKQ3ZW9z9UfXzUE7qcaxp/4WeaMfxNQl44bxcwfD8ALBi4O/YhxyhJ4epAQRgK2VJyHSme2poHkEaxsOMpxT/1e5/MAUD/tvU5zpQYbw9k+aGRdvNuVt6pb7NtnW+dK+HnzukZBLslPr8N417yi9zdUzd78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396485; c=relaxed/simple;
	bh=0XEqfSAxlPY5os2nxDoIwRW/AGhrDkurjFzqdCvEZyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FZ++WKbadHjMqLTKVFkfG8iykjl3kD3L/65feaqFu4uz1rICfX4QhdZfWYSXqo2+8IEEKrQgcUF1V62rrnulWDcDnNUkeK0ToR68oErmDD76xy4GUdTtHRQmjjd3X0/mABrfTEo99QnonMm3b3i4KKa0CZ3z/1g5KsTl3toXMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ozVjPv2E; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozVjPv2E"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so55235105e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396482; x=1746001282; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8gf1/v5lhBj3nTJ7U9oiBRoFIhc/ib+8WshbuHJPe0=;
        b=ozVjPv2EvWvqWbFFDCuonjx+z/Lz6ZvSEDHCzbc5Nvo+TyqVBFmVK+BbmUqi/H3Roe
         8mPR5AVbtjfD26khBXumkCKjd5Yv1A3qg54Ko8heYdQIVHzLZJybbGQTuheMHwEd7Q0l
         NmNyldolTZZOnMFRAZtKu3M7tpiBIOIybRD8GRFeh2H7QoBAHY1UavFQnH0HtiCWdP+P
         /mOdAoGQp7ux3IY0XL46ZC6WYYicT3i2l4cScUfeCWsxl36nF3mDrCVnNMiVQGN56+Qv
         VThP5gs7A8TtKPNPWZem3XjY4fAM0ZZBqEtl91bUCwxLrAFIQo4S6puIRaCg2Enhzvf0
         +B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396482; x=1746001282;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8gf1/v5lhBj3nTJ7U9oiBRoFIhc/ib+8WshbuHJPe0=;
        b=eCnfWvqeCYR7Gyj+Q/SJpovx+G8TPdJo+jKbcNYkyZHmd7zXHvVB5awG8RDaJlDJI9
         yMcWvqsUeC1lWnTeqHQOf37HJVgWagG85PzHQdlOvrAcZuYwkcjSnsxhJqsW/OZSWRzc
         uH9JncHyMzvJ4djUznLtDZ9JV3gDZIPKPREl89h6uFlsfTRdoZ303mIhqtNDmw8Tm4o+
         y7tcHv4VDLs4eyNobCF4Id4gCJQa+YHiEj095kSnhloUuJqTaAOpy47ZAhwE6ySNtisj
         TCBtI5xWH0F37eR5JFSGxeikLuNXnf1yUGtBUfA3e1Q3A8UIurFF8U4FHkP3BhcW1jrY
         3BhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/PZio9IvHFpEpGTobEUCK1bLqi1fvYmi1oN6g+HBI/1xOdQT+yp+MgT4QqICGhRBJf6bJ19mHEqiHgHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKpbJXhrbPEwQ3UDgaS6nEscYu22xNouP9Vfo+hHXXOGh2Lq6
	jJgeQtNTRIcPVftPrlsSifwbZZ5joaQaPeki1v3VaRx65pNVnXxeK1gLcwsDMcI=
X-Gm-Gg: ASbGncsHATxa6kJpbo2Ct833q4GNZNOQTfFmQEQzAbPmZTLQUH2IfPi6pJvhJZCKU+j
	BVFoVidxEjhNgFj4GZG3G7FSda+dHMfm3KbyI3V71gxGPzBcsZoRIkqZFfBFnQr8q+MjBdVrm6q
	MOztYA86rDJN3SJcPb5jJmL0gVl1BCOscau9JYHByzSEGKwDoA0J8p2gJgkZYX6loTsPP9MiGkj
	hBlcIz3+vHD4gktMjw2+5LxOiYaV9FZw0Z8hEEFt3WSfPWq3V5BVzH2chPpyWVjfE22eNBBv0rb
	ec/+Vd9buGp1Wh52kRhGodGTC9KQLHcp8g34ms1r1zFUBw==
X-Google-Smtp-Source: AGHT+IHWYSrmnac2ZIJgkK3CcnsC+6t1hYnQGT7QpTZYVmOgik/OcS5nSxSw/Lh3KD6scYknsYVhAQ==
X-Received: by 2002:a05:600c:3c85:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-4406ab98242mr134584375e9.8.1745396482254;
        Wed, 23 Apr 2025 01:21:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092db2bd5sm16760175e9.26.2025.04.23.01.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:21:21 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:21:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] i2c: Fix end of loop test in
 i2c_atr_find_mapping_by_addr()
Message-ID: <aAii_iawJdptQyCt@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

When the list_for_each_entry_reverse() exits without hitting a break
then the list cursor points to invalid memory.  So this check for
if (c2a->fixed) is checking bogus memory.  Fix it by using a "found"
variable to track if we found what we were looking for or not.

Fixes: c3f55241882b ("i2c: Support dynamic address translation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i2c/i2c-atr.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index d5aa6738370c..1aeaecacc26c 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -240,6 +240,7 @@ i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
 	struct list_head *alias_pairs;
+	bool found = false;
 	u16 alias;
 	int ret;
 
@@ -258,11 +259,14 @@ i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 		if (unlikely(list_empty(alias_pairs)))
 			return NULL;
 
-		list_for_each_entry_reverse(c2a, alias_pairs, node)
-			if (!c2a->fixed)
+		list_for_each_entry_reverse(c2a, alias_pairs, node) {
+			if (!c2a->fixed) {
+				found = true;
 				break;
+			}
+		}
 
-		if (c2a->fixed)
+		if (!found)
 			return NULL;
 
 		atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
-- 
2.47.2

