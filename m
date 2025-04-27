Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CE81DE2B5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745746290; cv=none; b=VoWPbP6KO2FSsBXKv8eqCYpJEEGtFxm/Ie3cp/RNYPA5jh1mR3M3HY9yU0xh1h20R1kjPGXv4Kj6nbsPkNr+6J21vT2izeb9EC7tSFaWyqjUeG2EM9CZX2GuWR/RPMJ8qdOSYuO50xIHSW98I4xBEYdEGS5znVgZMv/D8alMtps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745746290; c=relaxed/simple;
	bh=5N+hSozI+ZeQMfPomkR+Uu0oNbUf8g7rTlgBZ0iuMWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7xsk8bUPpG1Oz0OiwKQA0mEr18Eb4Vacpue1cTgwzfFlGzPkKkEFYnyIcDP6qzvA/73KzzHgB+q144bodFm5z9mubTipuPc4WDwz1+w5uh7KUsuvhNkbeDxkfibZbaqWpdSDnWZ68mwnafjdMbCjowf782Ifhsbgq///dBwjkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUw7Enc5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUw7Enc5"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2308832f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745746287; x=1746351087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGSXLlYfTCNyEK1sS+8taaZTIKIMp6RlBt29lDZeXCg=;
        b=XUw7Enc5GTpZoKRsyukdAtxyfos2hoCDh7ASgTx6o9PXhhZ7bFTIdgJe9DyEtxrqFG
         rkPUpFM+7/4u2KW82fTZ2MMGucsnE7i1/GU2tiQn5B+ePc3farO40vZ01o8ldxDddQ4d
         89DkoRTsQ3PXpjAks07PeKRi+rjHKy3TZSM1dFX/i+iARGrzyuPnsFUvzefAtpRDYQRe
         mdKB5KYa6nGPGZXHuLNJxLLqmUirBqmo4kDT90kJtHXPpNqbv0XR4uIT/mR5gN/+Ur4W
         EoN4At3XEz9r5bSSIFSK53hTaIwxyvdYSnmGemyU6q68ZtFHqc/00XIdADfiCn1DAzSX
         8ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745746287; x=1746351087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGSXLlYfTCNyEK1sS+8taaZTIKIMp6RlBt29lDZeXCg=;
        b=XGA1UeN6w6DUlU1/XNdYN4nj69A8vwIWBq+0PLtyOwjIOEj4fQlp7YlrVkf742wz3G
         /CABvvCQrfqDYLEQUloKMmPrcO9ZcrkZh0gTmkVRX/X1uS+LoQ5jN1Md0ofuxADoKvGW
         OC1sE1kIUJwq02qgbwVG77BBgaNF0DS0gtC+9Kvln9VDGzENTljJBMXtsgLuItIMoRLq
         3b60ynPGijxbZro2z8gSXTzMupq22oAjGahjcfmD0i1qHIP4Sfvfzp6Pam8i+OyMbMPq
         83jvyBCj2ExERBDm3xIpSMIs2lNhWlyY/15zh6RrIw1s2/rxEiDM6XQv7qcxbMTip8XU
         V+fg==
X-Forwarded-Encrypted: i=1; AJvYcCWugW8HOTH5Xg4vPUt8HdteAZNFmScDaa40U1aHa8CD+UJmnz/csUydCKWDtKYogfS8ZPvXnP1ocYRroHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyFYl7D7JnI035S5ZwHc7UbBeD8YWLTUEJVQKhcsWWvGtw0JTg
	uCg887wXNxzvPy01jqc20pDP/ucXB3JmUr4bS1y7HG8aIjA13KOzlICGI4Pn
X-Gm-Gg: ASbGnctZMqQ9b8nvbJPUm2t/DtzyF0NZcx8KPHKnz8NMIRPQsSY09tjbK7T612rdBSq
	mBixkKfgG/tawy1+B1UriVNUnjzR+NwikqDtIs/92TmeoKIkDeCrYXunTuhHCcKuDQMKtFcGwBE
	s0CoMTd91bit8RKoqiMkaFBrWXlJo7aRiH9W3sPm11JyXWHRQ3YKiar+Pi/PJ2vEWE8WiWGvUGW
	pit0cJ7RsJyVm1LQemryrWFVsje3HKtwfykDr3WzCy3fRRsc9D2jBG608TrOTR8SkX4eQnpti73
	A1Ut5vTCjubs8yf+IcHHiAAnTJnFO4aQn6LWlTFNnu3WQbqIeB1lw/SMzKyPMghCYg/fPWQ7Ys+
	w
X-Google-Smtp-Source: AGHT+IF1iPGBEhuUkDfpQzYO1sUsCZHS8vfSUjGFEM6LDflYs37IgTMzv6Af/wCGkwLP4sT/88uACA==
X-Received: by 2002:a05:6000:2210:b0:3a0:824f:b552 with SMTP id ffacd0b85a97d-3a0824fb5c9mr832776f8f.10.1745746286740;
        Sun, 27 Apr 2025 02:31:26 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c6a0sm7856212f8f.86.2025.04.27.02.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:31:26 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Avoid unused variable warnings
Date: Sun, 27 Apr 2025 11:31:23 +0200
Message-ID: <20250427093123.18565-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses warnings produced by make W=1 with the configuration
parameter CONFIG_GPIB_PCMCIA=y

cb7210/cb7210.c:1251:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
cb7210/cb7210.c:1250:31: warning: variable 'handle' set but not used [-Wunused-but-set-variable]

Remove the declarations and assignments of the unused variables.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index c686896bb088..298ed306189d 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1247,13 +1247,8 @@ static int cb_gpib_config_iteration(struct pcmcia_device *link, void *priv_data)
 
 static int cb_gpib_config(struct pcmcia_device  *link)
 {
-	struct pcmcia_device *handle;
-	struct local_info *dev;
 	int retval;
 
-	handle = link;
-	dev = link->priv;
-
 	retval = pcmcia_loop_config(link, &cb_gpib_config_iteration, NULL);
 	if (retval) {
 		dev_warn(&link->dev, "no configuration found\n");
-- 
2.49.0

