Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BAD1E833F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178364; cv=none; b=E7R6U3/GHvh7Sdb3zkTSrEqOCiuqy26dnOY+DQyGRhbqWqaeYEJho/LQCZ5LxtwSgWjPJrOCXjhpf78OBZcYQ9vrUZ7mKPcfvvr5KiG0K1/94tFB83gkWBBnZxclpxH1T78euIAmkogG+126UnCxkv6XTfDjHnwvTPQSWTWyLcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178364; c=relaxed/simple;
	bh=DyFt2+uyue0P+cm4YTjmTcgXbSDc0WT/k4eV/cY4q0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyMC3W905XXDRbmGgoJgNmlHLgGrFvRW32lCBBZMTDFIzzP8tpJZzhON0fga/L70A8WOBdfRzrErOp9gf2Bqo9Jujihbs5wAkCH84BWQOCgXwnQW1dF4fXGv5MG2crnfbB5bHpOhUMsFMIrIwxafmxfysUAw4MZP6P01OoIFE+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=BUJQjNyG; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="BUJQjNyG"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af6b02d9e5eso4395833a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178362; x=1744783162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/nJaV/Y7GI363GYCtXUAn1aXn1N+OacFtZoTBjJ5uU=;
        b=BUJQjNyGassQTuP5NFpju3GRgNY+T3/ZWXwSy9G3n3onB4n/vFSaAJoYEBojcBdoQ2
         vBJFPbNA0sqq3eO0LGPGBQYg2jTYuW+xldcY8h4udlSaCh9ZvD8IjtUL1wPSLzaNX0fG
         h73tN1OIKKtzsUp6v7Xv/mKJeUmZvHW3ydoHnGmrdxRk0hXdO4pWIcPslTG5PF6tr1XG
         5A4YMG1xoiIMvlX0pFwEaUfF0E0Lhuwu0kpoe8+3/kR14UpPYJ9aQs+YnRljVUZS//8w
         0s4RSfWTY7HK6tGLcM3MoZ4vO/5eBiH/neZxfUjHdXBIvf3R9JLcn4rxf+i2O79hbRUl
         9FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178362; x=1744783162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/nJaV/Y7GI363GYCtXUAn1aXn1N+OacFtZoTBjJ5uU=;
        b=xGDSQ++ZHImE0bPUEgpLaeAQ3pEdqihyGkYpsBlpDT4mJLMfdrIhYAdTdQdNrDfuUH
         wPTce0YeUfVJtQCELlHpysiaMzDt7I32Xcx/fo9uUTFuonFPZhwcFPriYGcAtT/wrxm4
         BuzDavwbQmEONRre/49sF1cjuugDds2AXRzVFK6wMCEYlAB/4Y+ERXY7giUGzjflSeZE
         gmuXx0AQJAI65mVsl8BwnQe3iOQMGwQq9PVNM2F19X5TS7odxoJfQumCV5Iem6hWWNg5
         WPAlwXb/EJW33RJIu2aEaokxK7+/6cVD9oO2TbbJ826mXo29n+YNupNDi6HuEFzyQlOM
         ASXg==
X-Forwarded-Encrypted: i=1; AJvYcCWvE2+BbxOK1d0dMrcRUR0iTAOmWj6olI757d1yVdj9mh9w8pvhKhh/sFhTFXoyVV5XxAFAWYTbjf/WdHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoVk3ZC/wzFjrgrExMAQAk7/X7iuEnAeJOnGP2Yl4NTSNbrwop
	A4caebELt/UMNEP5CkGNGbrk5S49jDv+ow+MA6Se6c4jjc07q/iwLvMYaVL9hfsw9S5qqoMAAPM
	=
X-Gm-Gg: ASbGncv5bSSDjDo+IqU1clQPgeupm9+/HmnmLq/SmigVc8AkKsYQ+4b/dWq5IPGz3dv
	yRzUjoq7+1kQA9Z6Df0QqGsP3sEU1DqUQsu8almrNlUSBA/EJ63sqoWC3W+feGNladsA8mlnloo
	Lyz0arjgBW4t402f7R0y6x9AJJDtLrbpC74fQ+1giMvONcRwjxVg6dGfWKR1sPUgt4+Oey5roq3
	djPjQdo86vPAX2rwb0zqfSR2ReX1jEeWZZSHSrZRtR1GtiPopwTsJutxq0JgL5KIbl9BMRIkp30
	Pili5FIUziqokbYNP6GTiSZsyx72fGhEF2jCHSWt52tSi3tjNvBlAZU5G+MpPHZZtwJKjaF4IDL
	EOrFAPA==
X-Google-Smtp-Source: AGHT+IGTSYyhxmuxAeXj1ewKl8XgTsU3tZLEhbSXU6xsRIIdS6DmWr47BGlO2BCBnc9TSU/AyWnBKQ==
X-Received: by 2002:a05:6a20:d04e:b0:1f5:9208:3ac7 with SMTP id adf61e73a8af0-2015b00f7b4mr2059829637.41.1744178361921;
        Tue, 08 Apr 2025 22:59:21 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a2b8sm396075a12.58.2025.04.08.22.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:21 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 13/21] staging: gpib: Using struct gpib_pad_ioctl
Date: Wed,  9 Apr 2025 05:58:55 +0000
Message-ID: <20250409055903.321438-14-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_pad_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 3939c85fb533..2fc93a3c4b00 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1438,7 +1438,7 @@ static int line_status_ioctl(struct gpib_board *board, unsigned long arg)
 static int pad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg)
 {
-	pad_ioctl_t cmd;
+	struct gpib_pad_ioctl cmd;
 	int retval;
 	struct gpib_descriptor *desc;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index df428899ba3f..7cb09cac6cd0 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -92,10 +92,10 @@ struct gpib_ppoll_config_ioctl {
 	unsigned clear_ist : 1;
 };
 
-typedef struct {
+struct gpib_pad_ioctl {
 	unsigned int handle;
 	unsigned int pad;
-} pad_ioctl_t;
+};
 
 typedef struct {
 	unsigned int handle;
@@ -134,7 +134,7 @@ enum gpib_ioctl {
 	IBGTS = _IO(GPIB_CODE, 11),
 	IBCAC = _IOW(GPIB_CODE, 12, int),
 	IBLINES = _IOR(GPIB_CODE, 14, short),
-	IBPAD = _IOW(GPIB_CODE, 15, pad_ioctl_t),
+	IBPAD = _IOW(GPIB_CODE, 15, struct gpib_pad_ioctl),
 	IBSAD = _IOW(GPIB_CODE, 16, sad_ioctl_t),
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
-- 
2.43.0

