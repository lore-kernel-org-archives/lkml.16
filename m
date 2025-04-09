Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124FE1DF75D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180753; cv=none; b=LiVR97IDTdksIVNTMXWOQaFWUBEC+XNBpW1bcmpS+rjrW25+tXvkO/92lVGEzHvV+l5/ZhjiaYd64DYjC5e/Bh7kEDvnIjGhQ37JCn3FNY50Gba0GydFHpqoHYnNpiRwhMrPWtUj6zdT67r03bTEroA++bBM9H7lGc7Qu3RLO6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180753; c=relaxed/simple;
	bh=hzUv9CvRtYxTMecAdOzfBzp0m0bU7qGvZIGDWUdgWkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfMAs83pXsxoDayp4RkEc+KTCHF4b2wW9iXlLrQYaQXW1nDfFWN1qPL/DEERAmCfkZ7sgbAMBkxVSSOHgQ64GITZ6fa39wGI55F55IshTHJD6dLQ02bdyF+zXpvGsi8NlYyoSQ24jmJv8K9ByhmbqxvBMBLZxfrStwezs3DVsdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Kh6kbfBL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Kh6kbfBL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227d6b530d8so57468505ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180751; x=1744785551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=embjg21lH98kIjqnvxhQpytstvOIiTckggBWpHLncy8=;
        b=Kh6kbfBLTfrEDNNS+yy+5SuHKegC38DOrgL2efazxXyU/CPib3qiI4vHI7DZTV6Z9V
         2yi/ildl0XBHGpfxo8i9JEB/IASshkCQMQdAfxtcY7B3JqZ+za1PZsZFCTFIAD59kzvO
         4SGT6EdUrNm9DZULY679eiOJSo+itToOX6E6iZgDBfzkLb0U370v6cSYH+WVciOAcZ1f
         m/gbXXN4VrNAqtxn606+QTW+YpTL/V3+oipSUP/BKWUTl4TpNVtvDE6gTBUuL5yrqoN4
         WEhE9LJNKODEX4l3cWBGOlXmSqC0HV1BiP8YOcmZTpBTYbkPOY3kJrHPYNnS9Jb2gM1o
         vcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180751; x=1744785551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=embjg21lH98kIjqnvxhQpytstvOIiTckggBWpHLncy8=;
        b=tYiEL1pEv/J+6vobJVYyP0hbAH7wvWu7xlQV1PKgE3W3NcCkBzoTIHXLq5l4Bp0VLi
         Qld5wad+xQ8EDSiEJVHeSvg32lFy3pryUpHcRmrqZdeW9K32ABcV60pg0/WAOzsaFzpr
         ZlVYk5x73bWUz5BWuLXp3yjH+X2e24XSBcF0KZ9563KLSd7Hp4aDzhYLlXURbnCkeB3P
         YGX8CJje2rVyOiGL1VWZ81P5Bxytd/+cpsdOhGLeObgDmW46uuMcu99tLtZbTln8bvjr
         OHgf9xEdNpbCxzhBJdYH31X1NwZn0WmrgGWAIIJRAs1+CzPKchm5EPsDPvTq4qkHc9lP
         SPNA==
X-Forwarded-Encrypted: i=1; AJvYcCXF1UHnT/fn/9tPmhGMSpzBglbv1L3EwKvrE2zKMwG9LgbYD38zkPN25xYyj56/ulvUVOWNiAhlOnUU6jA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVY/2jWop43Fl2ueqfNxZkLYfY2ip8wHSZMzP5z7KO2dUQFU7
	5QH71fNk20eiTiy5EoauJZiBuDmVr5swIXtqOcydey+PgIe01A2oWTGYbSNo2w==
X-Gm-Gg: ASbGncuMkquDwFhdqo0pVYnUKLDQ7+g1cKFYr917licAPNFgvgYbYhZyBN0JobnFMeF
	gyM6CJqtcwRdq1zKD3mRPRFuehUvOoMz1YQ+yoQi7i3dTBDAhUoRstfivdA3kxMCJCcdq7IpyWR
	yDohFHv30HsDCcUdx78PNfJA1iuUD4yZWH9vRP6pc7Mm5TLXL9QZWGF7NJaZCEYvZNZhCAMngwk
	CSglR46b/IqflQ0FnnWVdj1WkHtbFvrDb4avIq+IedSUgMo+25YPt6bp+Mpn4BvgkzhYuhFXxKY
	V+fBwelmIM/ngpZwk8eWO8V1Ee1vJLucQJj6JscfYTr+nekLp9ZmxVif+DCj0V/81LV0uaavReb
	842D4Yg==
X-Google-Smtp-Source: AGHT+IHs8GdM2MQI8MSzuPqpyJVfub/Cys00WX1AG8COabFMdADIA/94/QJsBLsfGym0k69IiVND3g==
X-Received: by 2002:a17:902:e84b:b0:224:de2:7fd0 with SMTP id d9443c01a7336-22ac29adc6amr30022235ad.25.1744180751339;
        Tue, 08 Apr 2025 23:39:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62ba5sm4213785ad.14.2025.04.08.23.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:11 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 3/6] staging: gpib: Removing function osSendEOI
Date: Wed,  9 Apr 2025 06:39:01 +0000
Message-ID: <20250409063904.342292-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409063904.342292-1-matchstick@neverthere.org>
References: <20250409063904.342292-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl as CamelCase where function is undefined.

CHECK: Avoid CamelCase: <osSendEOI>

Removing undefined function which appears twice.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 0b32404d699c..247a73846cfc 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -10,8 +10,6 @@ int ibclose(struct inode *inode, struct file *file);
 long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg);
 void os_start_timer(struct gpib_board *board, unsigned int usec_timeout);
 void os_remove_timer(struct gpib_board *board);
-void osSendEOI(void);
-void osSendEOI(void);
 void init_gpib_board(struct gpib_board *board);
 static inline unsigned long usec_to_jiffies(unsigned int usec)
 {
-- 
2.43.0

