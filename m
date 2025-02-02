Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17001101E6;
	Sun,  2 Feb 2025 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738534500; cv=none; b=iVNnL4R6jNi5LElEmR5gDmasVscnxkC53Qdq9tFp+L0FEGIK69eRouuJZ247pvv6ZJzWKBcLqXMfN3uctqnDv5DUddK0F6OdC8fbf5Cb3NKy+MiggmNsrx8V7Ojv+1Jd8RgfO6cJ7Qte4p2Oj9jn9dnVczWWamtikh+6AvTHBEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738534500; c=relaxed/simple;
	bh=t0btTXTxDYqNqNDaMQam8DdZeMc//oOetyM8hHci/9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LRaUS9pT0dGaU0HgvmvlHdz3TfpVNuxlIQOp+uTN9ajMGQjzSlwcZKhWYQdbhzmaKZrmy8tKN7UCPQmTtpy9XWLO+Zw+15uKeeS7VmnRvIpXhLHgxc7Px0uMtKvFI4KI+qRbec7ekgegSQervUqAss1wIJ22wrMoCv1kQjus2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2mDIJFi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2mDIJFi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so44555075e9.0;
        Sun, 02 Feb 2025 14:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738534497; x=1739139297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/d+6kPbWsXoeRB2D7/hAE4JuKSelsZt/eO8TnxXuCpk=;
        b=m2mDIJFiTzf41NWqt18onB+30n0RSicWUsOA/h2zfy+IO/HB6rUMyJBDq0QUR1HIZQ
         A2P5b8MHnqBlGzg8wNDkXxzQ48L2NmzVkmVU3aMPrUjEA0gfQ7BjxiveTx0/h/64WEn4
         T2RlghuXuocO3FTNcUC865P/F0TxaUzDVOX1ueS+/sW8EJZMkRAc2QtMF4kwJO2zCwqf
         +UBJJTp+XTjGZ0LpJkAmm+caw3uqxfHQ797QP7/60tnoxPHdM+v0oKUJvKXvhWTF9CrW
         aHP7YzvG3rjjdaeiHxeX8R4j9s1iGPI3F1NABaYPDfyJnfmvKCgrnSB8LrnpssRWcBf0
         DJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738534497; x=1739139297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/d+6kPbWsXoeRB2D7/hAE4JuKSelsZt/eO8TnxXuCpk=;
        b=QoJLpyCZs5r9lkRuTDF8sgVC0IZt8tc2rLRrogANDRrr/OyDPjzjgxd/KtltcNJyLe
         f/vLxmQ/iMZI2j7qrubZjaKncvZONBPAgHURkMsuodwQazJxXgq7R7lsBe3xntM35ZS5
         rVxFJOXiF4KpiNmL3lqVqvv9Oh+MfWDBeTkohUufz6vng+x1brOQzkg1JrqYVK/4seKy
         NoDFNnFgbxN6M4GV5qgcVLlwA5Sq583V+E8dHbxoi4gHT8U3BXZeTHEaPt10dt1x9APt
         V1FRwUzXhScF9Pc54hA9o910RAm+kMWGF8yG2aJpzeM6uBA4J33weDX6TKL2q8R4k1Yl
         tLZA==
X-Forwarded-Encrypted: i=1; AJvYcCVn23PmrPQwU+dSst5VoMyy6ucTeVXo6hRTWdXfkzY4DUg0tOC6i+S6xCHItKKcEeGN58srcV35YqOnuws=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKiBvfJNOQ29XaKk4KhB2Zx7GSNPw8qntoV7UrLVSVO60o1pOc
	Z41YGgDGkE9KiYy+KpQDS1TO5BnQlfcfDt3uwLQLV8SUQCz973Li
X-Gm-Gg: ASbGncuIatIsE5RXRZZtoPzZ80nJBMk7via3fc1IF9RVm2x91X5xaecFpAKl7JM7nok
	3u0rp+2m+NKEFjH5fRptUlArjojeqyL3c5+zZhjlOXBNO0OjjK+bn3HJXgYxWja2LOmsXC+CTBJ
	vp4IHGxWWpfVwdclWcFk/WftcmxmI75yvdDO9secdJByeKjUcAgdKRDer+4WjKoPR3gu4Ah2sRE
	hzI9G4fIFU/g5uBHP/EiBEvgOB6cCVpeP2B0rF/4gAczxclV1r5KVnxKGvbb50DmC2sErOhsSVo
	aLamPdxEKv7kT7JD
X-Google-Smtp-Source: AGHT+IHplxqjgEP0dFwLXvJfrL/A1CbJGFKEyQ9oY6WjTEsVIqOplrcFOwDsR1meWL5D4TeYkh8bkg==
X-Received: by 2002:a05:600c:3306:b0:435:294:f1c8 with SMTP id 5b1f17b1804b1-438e018288dmr124323665e9.28.1738534496966;
        Sun, 02 Feb 2025 14:14:56 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c1b51e1sm10974566f8f.77.2025.02.02.14.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:14:56 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915/selftest: Fix spelling mistake "ofset" -> "offset"
Date: Sun,  2 Feb 2025 22:14:31 +0000
Message-ID: <20250202221431.199802-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 5c397a2df70e..3eff0894c26c 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -964,7 +964,7 @@ static int __shrink_hole(struct i915_address_space *vm,
 			break;
 
 		if (igt_timeout(end_time,
-				"%s timed out at ofset %llx [%llx - %llx]\n",
+				"%s timed out at offset %llx [%llx - %llx]\n",
 				__func__, addr, hole_start, hole_end)) {
 			err = -EINTR;
 			break;
-- 
2.47.2

