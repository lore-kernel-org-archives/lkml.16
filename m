Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DF1253352
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904322; cv=none; b=DafjgT81yNpO+PdkU/Bd217NIsFV/ifOl/biPD36xtBVAPNHATjrLB3C7nwgTZT7ziliH/eJIlF6SwW33ffb1NjUYo6pHk3goy0NL3Y3HC0ZOz6UL9wUhGDx78BOfSeVStNDHitALLKUYJjCTSVbP9Bb8tfdKrpN5ItWE5YO7pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904322; c=relaxed/simple;
	bh=4CmxrQz1pG2CKAvpdKstkQyARIpmzfZ1LOKGQOkWcYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QbzAfdNt9b0wqci7zPFS1gkHJ/5MSxtGiUwXpezCK+szpIC2vcLoMtrcxVV8y8dEonxY1+EcQL2JflL2B8M78WshPYbKpjJAoDE4FgbmkeIE89gmBpHqLTXeGQYEgpi0vD1584/q5hx5SZIamcWSIixkL9s1uYyKbh5gjxwvA48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=dtQ6BtEJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="dtQ6BtEJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22409077c06so14456295ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744904320; x=1745509120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCFGfuy6JO8coiSlMwlp4uAr22QSVYGIY2uQAoexHHg=;
        b=dtQ6BtEJ/STEa9j7HWFe3CBCHyjR1XeIn44KemxNSKSvzmqgNQOo0ABmGHBBZ2suol
         TzrsvWH9i+KHfNgKnVrA8cVoUQUEyEjYQXp3az+z/vEF4M4adTiR8u48gdqWvI1TfnjT
         oBdyltUnbxAIAK2WmeVpxdMhnUomNj4tT6y6K0YW/JwXQDT1GNEDevF0YWBSqzqOJqNC
         q6aiOMt2154EcET7lSrEiB49UlZd/0EhQtV2rhK8e51GABMiQYD9Mb4g5i8GNlSq1PGn
         p+yDJsAN8ZdvVdy4eeZ8+lmlXPach+MU9lt0XLeLTP1Kos8mhWdS/1Fr4RMgpj+XVsP6
         2MvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904320; x=1745509120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCFGfuy6JO8coiSlMwlp4uAr22QSVYGIY2uQAoexHHg=;
        b=JQX2bJGWtWrUwcENY5lhBLyNN8rywpYaaW0t62rVH+B+4OpHL9ItJhbwaW+G+BwjoX
         uc1mBR3OWiv0TiQcWt57+gx7oJwzRHCXR1wXfeOXUeGaPN1BM+RdKp4dhx1ON7x81bJy
         fCU05aX231cgxhGPQszGv3AJ1KjhJDheE9PFzyik7OFII52bjcRuHT6VI5R6gjK+8Drp
         pFoORERCADJHkm78hDPzwRIT/3LufIPUtZQHOiLzGSk6xHPOx8EjWpgnIzraC+BMV8fj
         TVzmf5qdn0CHVIoQM4qzakZO2mfVMWPj9dg3FVyd2i3+4+Pgg1M/ceAR/G9dvu6sSbWY
         NtAw==
X-Forwarded-Encrypted: i=1; AJvYcCVuIyIKtNaNJB+/zw8woLYeJv0yH1ERRS1Vt2FmrwtMzqPXBJlHHr2Mi5+1uYCEhMeAWyTYtb5vdQhEjc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+YKeyMDjrTg7HLUCrulritQO1EJ8wJGJNvrdNMWryA7eVp7Mf
	GXnzjB6Cpk8rmDoMYjSFOy2g+CFCSlWqqg5ubUz3IqDDI6MN0wFZDLrpSpwR6Yok5lHEBGEjROg
	=
X-Gm-Gg: ASbGncvPnYOb6FRzkvk7BxO0vrzjSVJZTQsZmWqhonxhz3DVVZsOQIAPkes8Eh2bW8T
	qQ2gFGrEP5M12V2XFSTW6dqbqf94exgpaZ6q2R4Qdu9cLkpVSTCMAd5X8KR5/xBB7NeDjmpqLzQ
	P8IuYtPtMdTnhYxFI0o/K2Z9rSDPNpTyl8lS5ZcC6jakl3F0El2lJNU01nu8ofIJ9DDIrzeNcwd
	JL0Z720Ke8/a9KWCZiIQ+zBnv89y9cHTaiin1xr5z2PLbLtYd3UgYO89tvAGQdYaM9V6Ky7FIW8
	fKARmRh0gkcDIJRssI3nWa48rOxO3a8ZMVNAFzJOtXzquPGZyZbIJr2wrXw3WeSvCQ/F1HNnr30
	mfzBreQ==
X-Google-Smtp-Source: AGHT+IGPzUqcsg1OrfnfmQdTkvSJAN4C6ee3MKAjTkoPY/+xGNmmw/TfpRhBh3QH4n6tKKGOXDQcIQ==
X-Received: by 2002:a17:902:db03:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22c358e2060mr94206135ad.12.1744904320238;
        Thu, 17 Apr 2025 08:38:40 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd233787asm12880375b3a.173.2025.04.17.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:38:39 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2] staging: gpib: Removing unused function CFGn
Date: Thu, 17 Apr 2025 15:38:37 +0000
Message-ID: <20250417153837.92690-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing CFGn since it is not called by kernel code nor any of the gpib
drivers.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index eaf7399a164a..1cb6b6219e67 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -192,11 +192,6 @@ static inline __u8 PPE_byte(unsigned int dio_line, int sense)
 	return cmd;
 }
 
-static inline __u8 CFGn(unsigned int meters)
-{
-	return 0x6 | (meters & 0xf);
-}
-
 /* mask of bits that actually matter in a command byte */
 enum {
 	gpib_command_mask = 0x7f,
-- 
2.43.0

