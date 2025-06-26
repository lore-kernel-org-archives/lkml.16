Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF73442C;
	Thu, 26 Jun 2025 21:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750973800; cv=none; b=YOSML8d/oZotMAE8MwuxbAtlRnkA59sUsnS/gNLPlxcfgOdLzhu+wUSJaVQV8QkpMCh2eqEPoU/XxTAyMDZIvkPlTfjntqXQqwMTtM9EgpsReHiYOi/8xTf4MpyqG+SlfGUXDxv7NFWEt6dtRIvw10gjcCE/OJ+1zl4zkvBWoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750973800; c=relaxed/simple;
	bh=qKsu2noZU/EIGAmtGzAdXhRFiQccwtgUcV+JBtHihDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJvlQLwKh/OoKmS2aZktaSKes0kaXaK6JmuM5ScMFp0WNudvneYdpqj/T7p1Sd3jlhC4mqTadn6Jqs2TgPcJ/rJ0RsZ7665XM7HGLFxOofYDMQY1B61mx4HGaFrhI/u1IeUR0uJAIc3AxWuEsPy1COQlDs0FnkssfTUOOI+rMlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tx2yrzbm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tx2yrzbm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-749068b9b63so1140093b3a.0;
        Thu, 26 Jun 2025 14:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973796; x=1751578596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W+j37i1fQJjEw0H1aSmJvBx2p5eupo53+UaTsk0vY6U=;
        b=Tx2yrzbm9N44snxQDUN1nf54tVQZj9QHogqlKZg7oGVoaghaBnNEPXPHNjzzxXh80O
         LgSlhYIM7CEnYHBB/xbag6t6ZFkzpbpRdc8AsDofZGc1G/DQE320/V5lB7Jie4ohMcYy
         youp/YDDTLhi1wfFiXT90cyix9B5W8rPey3hWBr8963Fb2RQeCZ/IPQY/XYkGrI3ePyu
         VBm8qdu/tBHsvMziqvoX43iwXJJZbScv23ojF1s7nnda4qSUoCHZpD7xt8cMETHrN7pA
         CCpGiixy1rISAAW0aZ5/jfkQCauS53oxVO+3pdATQcy18YS8AwIHjPd/+SS0S6KGcJXI
         7zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973796; x=1751578596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+j37i1fQJjEw0H1aSmJvBx2p5eupo53+UaTsk0vY6U=;
        b=HVY+2Q5DMDsaDjM3KODMmabuwC//EtyYyYU8+j2oAUseac7Yuk2cCKd8KgOTyYKF2J
         jX5K31ZD2fxq5Jr06CxSAkmOBPzdz9Ulp4y16GgdhqxTxU0IpsNCOmSvy20FKZrFp5ZO
         w+LgXsHG737UdkDBtAJ5gb7LZRAuw6ScysRKPemPbcZPpe8a6z2SGHB9kJGvu82dBkTi
         5Y37XEvDJeNBJVZ0GYVVfTh7Nb2VMOukGuHEbqMQUBlu6392oEhq79MPlDTaOLuwmIJC
         M8jxIypylnI+X8qO06iD34uuS8Bvpr7snGGMqGTGiWyx+J1GtpQfNX1oz4KHUFfKUOmU
         17fg==
X-Forwarded-Encrypted: i=1; AJvYcCV9CJjWZX3AZuiW23uF63w7emWgs8lzES/r5Kqsu54LWCt/qddbgBFJTZdu8zgu1MikJxotcfXDzOPXpcQ=@vger.kernel.org, AJvYcCVxttK8b4OO1PfivWAyP4ynw4IpTBWsGDDMpuR6P33CtFAumGLwgqclWaUamzi7COYsFWpmMN4aIrI1OYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykOBLtuP9TPVCVK2axA2kAmhJQCkgiAISMLNd8mLS5g8nnaosU
	2Kv4toRHfMNKhG/a7PPe7M4ryLbxag1LuIp+oGQxxZrY0k48MAx3IaEWgFkSOj5LFVo=
X-Gm-Gg: ASbGnctvl8SGpFrdv9yqDvuo5Jft65AeXY4vINug6nyTE72bCuQCkLDVaA0NPx49JVa
	CBPTsw9e0WACXrWidFixQE9RCGmM4rDFm/+WCZFNR0XimYLa0UeO7o5jw+ZZ2/1wQ5l7+23OB7X
	U2T5WYojV+de3J9XIPmE5FkXYo78RNN0bm4IwWXMjYklzURuW4SBPVD0C13If8ZyiD8GNV5WzwS
	WKwdC6wAF3XT6h9p2DRL6lL1FvbDlY3Mu5KQ+dVjsjKvm7ehpoIyKAAwotDY+D3DqNF1VzSBUhC
	oBCLAa7Nda6HBcuFrQzyIu/LhPGTi2tS4MBbKmtFliffUdJVmXWQYVX7SLkBmqgIcQW6HbjJCWv
	Rru+R8aFUTi992YYD6iw=
X-Google-Smtp-Source: AGHT+IFPc79JkbG4o0IdxkbE02KBcKRJMbsd81LuOuehcXEKd0pKWVQWLlvKM5he1p0S/1+1IZmNKg==
X-Received: by 2002:a05:6a00:1a8f:b0:748:f6a0:7731 with SMTP id d2e1a72fcca58-74af6fcd495mr946707b3a.23.1750973795702;
        Thu, 26 Jun 2025 14:36:35 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:4ff:1626:32b1:712a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ee760sm535661b3a.155.2025.06.26.14.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:36:35 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	sanyog.r.kale@intel.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] soundwire: debugfs: move debug statement outside of error handling
Date: Thu, 26 Jun 2025 18:33:14 -0300
Message-ID: <20250626213628.9575-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The start_t and finish_t variables are not properly initialized
if errors happens over request_firmware actions.
This was also detected by smatch:

drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'finish_t'.
drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'start_t'.

Move the debug statement outside of firmware error handling.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-sound/0db6d0bf-7bac-43a7-b624-a00d3d2bf829@stanley.mountain/
Fixes: bb5cb09eedce ("soundwire: debugfs: add interface for BPT/BRA transfers")
---
Changelog:
v3: removed superfluous initialization of ktime_t vars
v2: https://lore.kernel.org/linux-sound/aF2Em76RGWVpJfg-@vaman/T/#mb875b96a6dc1bd18a939caf1d3288b3b3b5e78c3
v1: https://lore.kernel.org/linux-sound/20250617015230.54981-1-rodrigo.gobbi.7@gmail.com/#t
---
 drivers/soundwire/debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 3099ea074f10..230a51489486 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -291,6 +291,9 @@ static int cmd_go(void *data, u64 value)
 
 	finish_t = ktime_get();
 
+	dev_dbg(&slave->dev, "command completed, num_byte %zu status %d, time %lld ms\n",
+		num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
+
 out:
 	if (fw)
 		release_firmware(fw);
@@ -298,9 +301,6 @@ static int cmd_go(void *data, u64 value)
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put(&slave->dev);
 
-	dev_dbg(&slave->dev, "command completed, num_byte %zu status %d, time %lld ms\n",
-		num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
-
 	return ret;
 }
 DEFINE_DEBUGFS_ATTRIBUTE(cmd_go_fops, NULL,
-- 
2.49.0

