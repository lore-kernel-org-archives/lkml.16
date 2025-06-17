Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB0647;
	Tue, 17 Jun 2025 01:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750125164; cv=none; b=hkWtZY1pxeem4xtfeFUPAQ26TYL/zyoVv/KykWES+zqVfD5+k7YaTGRPO1G+IeAdmzkqGsvDWXQ/RN0qy97T/QSzYFrLELS8oSd3lHugxZvNX1mW4HlhJoqunnuAhKsod4P657vktGPxrfAp2aBiHPGxPKQhMnffpFlefy3wNEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750125164; c=relaxed/simple;
	bh=2vWdDlnUM+1Z4YdX5+KjuwTXw7wsa3h3y+Q03yQxtmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eraOnseGNOrul0mLlofLsnawH8kk69pVUq9bptaF29X2T/vK/+mX8gG0qSJv77YmkFxe9fah4fjr+Lm2WirFrPdVUzhnAMBoKN2CbK4cdelAYRxup9P+7sbdv+kYdKeOUrmyTtGGk1l7qyh4lBcvLTKiDazCDOtw/3qerIVQ3zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eknN8oFI; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eknN8oFI"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso3775035a91.1;
        Mon, 16 Jun 2025 18:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750125162; x=1750729962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+4wRzKmv5gF0vl0DYBtvVGu1v4s1UTEDBSiIWouw9g4=;
        b=eknN8oFI8Ut9SJ5MrcIOcms210pS3mtut+NLZwZ4tK/Qi9nIJgOB8tojRAvDBNYqUK
         77NQvDB/GSyy2aLqnqLqSJn2djkapYea3tQ7wYh+5AAyAcqvNOUbG+9VxJ0qWCAsVLpG
         BvJ/gYsNrG9+hnBRYa4FsJHdEBhDJ075fey2n0Zk7F9SI93YK2ilpTa/vJwg3ipP7dGP
         goRMEmsNpHTgOFwXTvsVMk0e9tKKoXxsCsmNYvJZZs+/irjasFHtqE/sp5siLMwTQYm0
         JJhIJWG9JHmGKJ/IaQ0JK0vRw9wb+T1cuHprBJUpFSyqD/p22uzEorZSn+tZpDzqHu7Y
         XCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750125162; x=1750729962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4wRzKmv5gF0vl0DYBtvVGu1v4s1UTEDBSiIWouw9g4=;
        b=Q9FbPV3ppytgn6YCJn75aUi6Ooiznv+YeCl+i0OQLLocT6SOeH23aeDadFX11BX1Gb
         N5Hidz5/Rtar8FLpIvw9e4NERrYxDF/orNx85e4RieUe6+8gvS1NTNrryPUF451u8iMi
         mXEq25aR3nmuaBezk7L+Oyh/XmPGvP/fAFZPPfhppGDq6ydq61nljzCKjT9LWSaFb+4C
         uKfNijGVpn6tDwYir0H9q5piiZGeXOE15eizQh2XtuSTsGHcxijbkZSTknV+INWMxwKy
         VJMAntk9IjSLY0ZT16LD5PVKO839FqKjuuvuFWxv6Z7RORWkZGLjS6JTGdoZ1CzSXf76
         KFBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzbZfId8ACPJht8lacRJiO8445uanmIb07U+lVPx1KU3mIl0wZLgmEcQ2SQgBRQcsnZm0kdoP/wbw+dng=@vger.kernel.org, AJvYcCV5MbVT0LnEvdWMopnKSdva2ZvS+7Thaf65M4tUCd1qObGXtk6QGrXAfU4k/Bavzz3k3zHSkVcD2L5Bdyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvARQ8eXVmEkFgjuRaddhwxWYztuxys6JLPIrUz+4aTO1UPowk
	vePACGdm9586n32l60FH5aFJFzGDArqOwHLInvXI5mdiopWyEYZdM2/P
X-Gm-Gg: ASbGncu7bcbqYByT0mGJ6TJzh5om/wVTT9ZYC0dUC+Z0hcA30E8WqEnCmIYPS63dZcE
	m+SM36s1hZ0fnD90vDci3CJYDYEyKvlRqsqLezvMyQcLKC/hNKSsZL4b4aK+ReTdUZQqHHlOb2s
	al2kDRxhSaEp+U2VnbikbIIFS36VwXIQGoEKhGxH+Y7dK1K7OM5FPVFlmndWgKow/5/20t8hkoJ
	cG/KyZ1Ig4/8tiUvw1oDC4Bwxsd84kixWbQizeeo86LRYx9Vz3YVkzHuFA2lRSaPLJKt2yxWVhm
	mvzGjJfjQH+6lUc3V8SusGfTCZaiN6N5UfkswzaCdCHmded0SHnTEytE3lGFR1VMUZP8PFXQc4/
	wGiwf0LlvmA==
X-Google-Smtp-Source: AGHT+IHarADlZB0VeHVzCafKF7EmYysDMeWCUlBw75xHY9NURJ8PDhG2WFEJ/Y+jSbgltbFLYTjm9w==
X-Received: by 2002:a17:90b:2dd0:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-313f1d10aaamr20946251a91.33.1750125161888;
        Mon, 16 Jun 2025 18:52:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de7815esm68513345ad.118.2025.06.16.18.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 18:52:41 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	sanyog.r.kale@intel.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: debugfs: initialize ktime_t variables before div_u64
Date: Mon, 16 Jun 2025 22:48:30 -0300
Message-ID: <20250617015230.54981-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The start_t and finish_t variables are not properly initialized
if errors happens over request_firmware actions. This was also detected by smatch:

drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'finish_t'.
drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'start_t'.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-sound/0db6d0bf-7bac-43a7-b624-a00d3d2bf829@stanley.mountain/
Fixes: bb5cb09eedce ("soundwire: debugfs: add interface for BPT/BRA transfers")
---
 drivers/soundwire/debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 3099ea074f10..951fc255e4eb 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -237,8 +237,8 @@ static int cmd_go(void *data, u64 value)
 {
 	const struct firmware *fw = NULL;
 	struct sdw_slave *slave = data;
-	ktime_t start_t;
-	ktime_t finish_t;
+	ktime_t start_t = 0;
+	ktime_t finish_t = 0;
 	int ret;
 
 	if (value != 1)
-- 
2.49.0

