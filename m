Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15711AA786;
	Thu, 10 Apr 2025 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314554; cv=none; b=T3Na76UAkEWogyfGvqdO4LceZfxJmzUN0d3pQ19Ud00AdFhl5CRBtyI+b9xZfnJizBazxTuhvk4EbU4EJeke+iGbjHiBhnP09PB1NxlGEM02YD4c4l1RJodGNXp7SswEAzzc2XJ5iBFTpc12tqstuWGMhpAhd5D1eIu+QdhtMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314554; c=relaxed/simple;
	bh=0+WlZOuqbF0bXm7t3MBcReXYYpFdLnP3mku1ztHJfEY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VJEH70TpRfL5gu8U7yCoJTw7u0HSYsROFyoEC4fFrkCwDfQz58027ETzH3eijisg1OFsz2h8WTR63IAYuX3cej7gcUwYncEwuFV4NDymY7zQ5I3+u+RoaJndGuzZc1ABCD+WSzBw/DrUUn1/xUzxtXgniaw2p1j83wkQwqHFcvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moVhvSd1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moVhvSd1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224341bbc1dso12200875ad.3;
        Thu, 10 Apr 2025 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744314552; x=1744919352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PKY2YNNJabaBgf6w79AisfgBJwnfIvkP7se+XQ8iOTw=;
        b=moVhvSd1SYqEuQh4XWD5Prgz1QoP78TaJedgMmkHinT82WdOcP4EPp2qMAFjWNq8Ts
         lU0Z0yJRELvOz/etobyDlFYCYyODQZzuX6ZFd+uFHfhIrdOi5uDxx0SzozjxvozuQ/08
         zW6Na4YSf1MNyGQXbtcfd/kmTzjtklzcfA9HFCqq49D8JbevH3p4Mrtq2k/5ygw1tzOD
         UUVVrnfShfx6f/mHhqP+YZicrXAYyOOWEZzcIB67ZKBnqNZgfDBvj9YChP0oAdwBFpQp
         ADPDtuReUZi/8BN8O3Yz3abHfgbT22W+A4xcDYeKXwriuFdB8koFZJcKEGXgIPZiXZ/L
         QiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744314552; x=1744919352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKY2YNNJabaBgf6w79AisfgBJwnfIvkP7se+XQ8iOTw=;
        b=dLtgWCDf14+1S1eu5wvQio8KkpjK+ruiyEeiPntinw28g/d9r6pGaMMYPh+X69+5U6
         h+6bnpeOa60Q3Nz9tK1m6t6ST8fFXPjuRYD6PtYclK67bQ6HwE5zBxzXKVUdglwkfxss
         Z2Xi0fTle+g3L6f5z6g/qh1R3X1f9F4wFGJGYgBQLmkcrQ4jRHwS3Xt11qyn4CK87ZqK
         jZI2Xm53Y3o+3Q1rYYtq6az4bbTJzhUuAjH5V1ENqypA+SodHWhfKqHQFAax+7GP4DVB
         UggEijgDZadE3VzvVyC+hZjIWT0tHLEHG0y0PuYp282XAYWo6RinYAwXZVGpaHHZonzY
         SENw==
X-Forwarded-Encrypted: i=1; AJvYcCXeMe/FtBqNAI0fA+rz63PbS5X5R8WCwSOS46VokwaznEYU0eDLvTPwiOXHtP/BOaR8hXghCdydFD3ctlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwKQ/JF4H2VQSzgKzd/AvWlcTxSWx9xgtzPRBxNzof3wySvq8a
	wW0xC8TT5JgLpc/Sy8mOJ+mGB8PYM0fluSdclpqZPuvyWTQrmWcf
X-Gm-Gg: ASbGncuiLTrv5L5eQcBMlhYbwDS3r8gR4U1aC1Jlp2m4wKivP9PvHw5oEFKIkQZUWgL
	9TzJ5pDvYRUVdMaaAaFegJLUhrUtDmrFiZ5LZPoo4mBaBeHMxPq7x3X9ycmZZitB3Oh0M75BlSC
	tEC/6JrKh3jZQThG9kjTB26odtflpzzTcM76YVJcrF7cVsGtM+eZ5qWmwWqoyx3qM11dFgw/Im5
	XwqLDAE76JkYPQY99DnDgfBeolD3pGupaE7gZCbXtNbSoiBVR4snDbrm6xk1gQiqD/wrynduf47
	jRYmd54Omf9o44fUoFN+vriDJlME0CrrOwdEBCXJv9w/2iVKMS/WwRVJPYH0iOdn5L5eahb3giU
	UbnJgT4Ggpg==
X-Google-Smtp-Source: AGHT+IEaSY6FBwE2JNJQ6fyN19fcenuhr13rJxJqIq6oVj1MXtuR2q8ugxop0ZMJ5+LofNYQQpen6A==
X-Received: by 2002:a17:903:41c3:b0:220:ea90:191e with SMTP id d9443c01a7336-22bea4956c8mr1427545ad.4.1744314551862;
        Thu, 10 Apr 2025 12:49:11 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:4080:204:a537:70f5:9c3d:61d0:62b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb68e5sm34933235ad.206.2025.04.10.12.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:49:11 -0700 (PDT)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] hwmon: max31827: Fix uninitialized variable lsb_idx in max31827_init_client
Date: Fri, 11 Apr 2025 01:18:33 +0530
Message-Id: <20250410194833.21366-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Fix Smatch-detected issue:
drivers/hwmon/max31827.c:564 max31827_init_client() error:
uninitialized symbol 'lsb_idx'.

​In the max31827_init_client() function, the variable lsb_idx is assigned
a value only when data has exactly one bit set (hweight32(data) == 1).
If this condition isn't met, lsb_idx remains uninitialized, leading to
undefined behavior when it's subsequently used.

Ensure that data is non-zero and has exactly one bit set before
calling __ffs(data) to determine lsb_idx. Additionally, verify that
lsb_idx does not exceed 4. This approach prevents the use of an
uninitialized lsb_idx and resolves the Smatch warning.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 drivers/hwmon/max31827.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
index 48e8f8ba4d05..c62eaf186d9d 100644
--- a/drivers/hwmon/max31827.c
+++ b/drivers/hwmon/max31827.c
@@ -558,10 +558,13 @@ static int max31827_init_client(struct max31827_state *st,
 		/*
 		 * Convert the desired fault queue into register bits.
 		 */
-		if (data != 0)
-			lsb_idx = __ffs(data);
+		if (data == 0 || hweight32(data) != 1) {
+			dev_err(dev, "Invalid data in adi,fault-q\n");
+			return -EINVAL;
+		}
 
-		if (hweight32(data) != 1 || lsb_idx > 4) {
+		lsb_idx = __ffs(data);
+		if (lsb_idx > 4) {
 			dev_err(dev, "Invalid data in adi,fault-q\n");
 			return -EINVAL;
 		}
-- 
2.34.1

