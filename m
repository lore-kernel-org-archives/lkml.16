Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DE21DF26B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180752; cv=none; b=FPNNl04ngwCsgL66YUi5BK4r59l8ZtUkwR2PlW6ojVpjPxIdHH3Gc+eq9ktxUpf2sDh53GuCmy3U/aNAUM2aqcBA7v0D9KtZQRWQ5cmhYwBcjDAX0/5rL7e4IDqPOy0bYPESTh2pD3/es8gVxSStEq8by+niJHGRl594f4hGOSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180752; c=relaxed/simple;
	bh=0Q5O7UQsiBVnVsqF7W8yngWVlshFq/17CRN5KnUm60s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=naGJzJ6pjWI1eqfxCSWNWl9YxfnEAw9+xPMBhaKFqYyR+uD2QiA0BQniDfAQTLa5ITqJzKRc5pFdpiRBlEeGTohZL9MMSsIOXJy9X8pBzBt+Zet7NlVZH/lcqCDlLi0+zKhdKFnenRtoPNMkAtyu6H7sE5IfGZMCriMoCOjeHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=jrQPQec0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="jrQPQec0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fb0f619dso64528745ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180750; x=1744785550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mfER+n7/L7idQ+a2wuuFUDMLorTKvXF93KmEre2UXw=;
        b=jrQPQec0aUEzLvukulkBFJQ05hNyIfZWfrhKQfW/vbx9R06/1N0B7sxPAFsBS3B5K1
         yCiVWmfBQxIZla9uGoMU+HrqN96LiTyeMAWETGHhJ8os/bv8+peGY0u/Zmfi9Yai1Jw6
         /ZR95HXDNMimPKYs65585WgqKgb8rp6CPwQt9osG51/BjD1AHWze22fuKJzVnIn0iQOz
         cVe29K5i9BaHqJsVF3mrswrIvzW5K1O0HRB8ZED88eGhtMTQfycxbKPmbTjx4weNls6z
         lma2tLl3MF+BZ6e5mmCyhf03CaarWA8n/gX4gYuaBsQjzdf9AS3dKiBZGBgxSoDkOP1X
         7cDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180750; x=1744785550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mfER+n7/L7idQ+a2wuuFUDMLorTKvXF93KmEre2UXw=;
        b=rKgllPATK9c6R9D+3WeYZGud5BJu3zmMwKZ5Q/4gGIuwfj32K7Ir4h5pZrchHP8Ei6
         2I0RttZrSafhUTxhByRPFQWcE5cuQ6zo4ZXl2gHpFC8fBSm/LkJtCqyaKp00MyddPTwt
         CNxJFwSI8+M+T946m5Vw+cNfhhWx3+cWpBQjExfYk+skBqWS5qMXm4uIcUb90OE4B/ba
         v8NDWCuhk9/iE7K6JpihdHk4SZIjTqzxxbq6xmqgCttB7ZA/gXC+UPjEeoZGK05w25Kg
         Qk5aZnbQaj9l+MqsDcEDS90X5nW5OmQ3AytI08qwRU5N13y2V1iS0E5KO+7smeZ6BYHO
         aWUA==
X-Forwarded-Encrypted: i=1; AJvYcCWNaYdvt92HROmtI+ZfAvbH7sCbPBn0a0MuvBqHynhExOPDs0EaospWgX9f6RIi/OORhaDqm8qcy6raj0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKoXrfkBEqNm9TQwOFNE/CmHrOlUPrc+dXNX4csK2FkBbtgn7
	KczF92JYjf4VTyZgZjGDzYrOlYeViM5nsmXa5HjBbNJB1mKOJuquczogehtnrg==
X-Gm-Gg: ASbGnctLKV/4gE/eUO3R2xbPTyfdWbKxALaguX+HfRXRuq6ryUL8FMqbmoCHDtZK1oj
	CV7hK+/tfeJvuPsIgLtP8LVnhZxaz4GHf1wYTQAmkuZyKLPWjE6gJNHRg086rykEviM0BAvw9mA
	GRdXoOGmu0Mq5xuKYk1waEAVHgc9rmedsU/03e23JtDsPw51xs6mW7zBbpz19bIQsjfwRJ0jdvQ
	v51I3d8HAFpleCSewgEMKUyuEKPq0aZiU0/nR5Spgoch1lf1esyut9mZNksOvVwJV2iQHcnZtsV
	BACYIOdMISKbG3wb8mbAEtxVSjmgBCuu7iuoblnvUX5XWfNIOQzIecRVBv8x6UvtnHgmwE2wv0V
	uDrbxkA==
X-Google-Smtp-Source: AGHT+IFG6f0tP9Ckhmlz6RBcupeUK3SMS1K2wRDayJ25xnQ58PlLcuIL0rV5oPD6wPcsYYrkqQh78A==
X-Received: by 2002:a17:903:1a6b:b0:229:1717:8826 with SMTP id d9443c01a7336-22ac29b0e16mr36695675ad.28.1744180750192;
        Tue, 08 Apr 2025 23:39:10 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c3c1sm4206735ad.60.2025.04.08.23.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 2/6] staging: gpib: Removing function osReset
Date: Wed,  9 Apr 2025 06:39:00 +0000
Message-ID: <20250409063904.342292-3-matchstick@neverthere.org>
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

CHECK: Avoid CamelCase: <osReset>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 43d655ee324a..0b32404d699c 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -8,7 +8,6 @@
 int ibopen(struct inode *inode, struct file *filep);
 int ibclose(struct inode *inode, struct file *file);
 long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg);
-void osReset(void);
 void os_start_timer(struct gpib_board *board, unsigned int usec_timeout);
 void os_remove_timer(struct gpib_board *board);
 void osSendEOI(void);
-- 
2.43.0

