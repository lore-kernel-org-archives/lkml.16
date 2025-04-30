Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A54213245
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000361; cv=none; b=tqp1NXTqp6+nX7LkwBTG4xGwqeDij3ydEE/PqzfBVmgHV+hZr2/BVeNYxqX4xWgb4h/sGizo4O171de8GBhGhtvuaKGi0pyofAaL5Fi7HbNQ5hOVc9glGaJyqgrlFPcW4kpODbnqvefyAHljA2qP/OK5FUeYTaEEnkBYu/VRY/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000361; c=relaxed/simple;
	bh=DUHxlAwhz09uoCCY/km3TFaTU24WnD8mv0hKD36WSmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GC5vveeC8DhCfRaT7GygtMbaG9SqsAg3DMfbQXNrnX8JqmIT0KNdunTBCUbcvpCwqwSLOayke9iOoWfUG1hNSCTm6LxeJ8SvZIg034I7qWC+eKquQJegUOwxdOSS5YDl4thf9u8CslHZoqQlFjM7tDcptPwJ1BqROszGLkJ4c7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N2ADUQi6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2ADUQi6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efc4577so3787593f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000358; x=1746605158; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYENxwyZq0Q3qL0QvqAbL/WUtfShupQ9hB5wEZFyU3M=;
        b=N2ADUQi6goI3gno0vTdsktd+qmM83Zti92tW4v1rhLE7Pxvp01Pvx2VUWslsqu0b2t
         kyTrehhvraCsY+oUj/27BfrjWcrtI2wbWatHzY23CWccVzLQNOZkiNmYgRp2wpjwNdfx
         L/+F8yiohNn+i0xQDNSyUiMEziMg6YvFDvOrPefG0cUNQVt4V5+0acXNfDd7HvEnvdms
         YeBJxdmn8b3xZOhphOmx8u1CpoGapuZfBc8iYGriDq7E0UtxnPqUdQai1mUnPa/s8V1S
         24WpBqqcm5qQrcGnyn53+osO6Idn2VMezEwp0j8hq8XJy+2P0P7fNltEgYFigyT4Xc/Y
         61Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000358; x=1746605158;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYENxwyZq0Q3qL0QvqAbL/WUtfShupQ9hB5wEZFyU3M=;
        b=LKyxewosPOVlohQZO8SyEBm+pPJQFZ0vWCGcQqW/XHMk1vV/PtfvAh+SnQ2FgCCsPH
         iPvQsLxJv6/GS2mR0xhRRQbbOUe3tOyIOSUOPECjnDu62YlybJ1W4I+U/fTF2pvT5x8/
         XjF4lUQQEOvouja+wqGVY++/BP9lAodMOK6WRNcKjOQSLwMa8KFWTnDcdB/dv4PSN98L
         Q9q54nOyaM3k3X/yZ6xm5mq/JdBNIfih+czAu+ud5LL+/kCr3HMi62acE/Lhqd7ycKaQ
         tnIRtTQu/NElOHVWM3zwcWj5ZELEorLxYPh9fbOGItr7sppW5th6uVBSwRFPi2kXQJ4x
         gi9g==
X-Forwarded-Encrypted: i=1; AJvYcCWdCtHHVFsMtepGlMkjxB3guWJUqa0FUCM6rHxlLexjl5jVpPld5FWP/qvT5Fq7Evgf+PyPdJR1/bvQXok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwElhjmQSmwtkqZ4FaEOtFfMF8kETYAPCUJDv9Lq0/87wbQNDY2
	cqwGuZkeqheQOeCSHgyrz/vcr/clEl7dwYGPIeM+wN5ySDk5t+PphTPOZZ4S7wE=
X-Gm-Gg: ASbGnct/5oGibi5MxIj7+qM0pJsQLBKOqDYDjfzFMQogot8PbbJQ8jYblkuSYsoXqT7
	wM4B8g+heCeoUuV9Zz82jazaDQBzVgdBae1j/PJFzGuPw1UqOssS94qNTRCglLcjRf/btR9z99Z
	VQ65K6fXMaA/jSIZ+0Tf9cs1AddhDNTP5+Cx+2CXGfLtNK9i+4d7KdJ/FJSjXVRZ+wvhYa53L2A
	e2qgk1V2fCTFzmDZeT0d3aCqFz4paZJKMKNcjeG/jwTyJxM7oVn+hzIF8xVW19cDrwoqtMVw0tw
	ElMfhq+K1FIJ0ij2jHaUqobIzfF788eANcUXKc03t4R3Z4+kfDNxFgYq
X-Google-Smtp-Source: AGHT+IE/vJgkReHfU0yex981z0mRRJKC7iIQUf/5YtQH4VoE02PsQEx8EvbLqs3gYSEqbq0UVxslLw==
X-Received: by 2002:a05:6000:430b:b0:3a0:8429:a2e2 with SMTP id ffacd0b85a97d-3a08f7a2776mr1682112f8f.32.1746000358002;
        Wed, 30 Apr 2025 01:05:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a07a5ed2e0sm13777037f8f.39.2025.04.30.01.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:05:57 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:05:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Satya Tangirala <satyat@google.com>
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Eric Biggers <ebiggers@google.com>, dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dm: add missing unlock on in dm_keyslot_evict()
Message-ID: <aBHZ4puON8GNK0vw@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We need to call dm_put_live_table() even if dm_get_live_table() returns
NULL.

Fixes: 9355a9eb21a5 ("dm: support key eviction from keyslot managers of underlying devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/md/dm-table.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 933e01f3fab4..1a7e2623069b 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1177,7 +1177,7 @@ static int dm_keyslot_evict(struct blk_crypto_profile *profile,
 
 	t = dm_get_live_table(md, &srcu_idx);
 	if (!t)
-		return 0;
+		goto put_live_table;
 
 	for (unsigned int i = 0; i < t->num_targets; i++) {
 		struct dm_target *ti = dm_table_get_target(t, i);
@@ -1188,6 +1188,7 @@ static int dm_keyslot_evict(struct blk_crypto_profile *profile,
 					  (void *)key);
 	}
 
+put_live_table:
 	dm_put_live_table(md, srcu_idx);
 	return 0;
 }
-- 
2.47.2

