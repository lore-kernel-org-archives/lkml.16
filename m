Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8327C1DB127
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745549; cv=none; b=r1OY+0Dsbc28KKYs8TMvARAAYQdqfq1v3kZXUADR2MQy8Ub6vEADhWRj6O0aiN1IicLe3KOY6jIPRujslLq26aFD+nxez7wO2DO2t/WiUIdmDpADtJ4owOBh/zsDtS7q8jxcnGS+QjLV5sPu28pLx9QWRj36aes1X3DddHOGS30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745549; c=relaxed/simple;
	bh=DGBpbhXvuQ0xEpNrO0isiwgt3s6etMZ8qjti7C0evdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3nz7pnJVVgcvS5rU23FDCFLXFZ1glc0WsaCwXGF5h5DluQJpb4KXS9sEgRFRC8UWZab7v/g+2zWm3xxkFbnC0SJZ3pJYqd6RHHA70L4BAgnB2J440Q8aytsfUbrQmSp2dQO5ZBFh7uOi4qUO1IJ/II9fcUjq74Eov/e051UaDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0FBTjqX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0FBTjqX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so36175855e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745546; x=1746350346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLe9Nl33nhWrZdDvjcJcQXnden9NZdZx4I15zXBAdL8=;
        b=c0FBTjqXTQ9LX9QNoMgB1Z7sCcqZNqtDc42weXDLeUXDx+dPwuxKBgqmqTRzu9jvcx
         T23JOCRA041i/QXGG7TBrCdaDSjYbmA9+Bz743SzCTi19faK4totptx5BPthy/wCuC+L
         QRqZ2K42KCq2OxuKTJU+Ux75Zwe6Isl+uM5vvMAtHEUWCY0ZefbAALgRtuudoHG4RdSd
         WcTJShAH1MLnaTML0MVmwOumfZ+dL5bOnaBLkm/YgHgKhiv9LHLx9ERPxfpubo3Bg0vh
         NbiaO6ts9RGZJbfU1XKCPUBRxn5GU/30v03MajDtwXrJGM4zhXLrDvIryULkEzrm8YWR
         Wu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745546; x=1746350346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLe9Nl33nhWrZdDvjcJcQXnden9NZdZx4I15zXBAdL8=;
        b=SiZJsAUpVQIZLbyFXepebDCXvZ2X3qGJSiVlggiRbR+SAFbsAJ5pvouq72nPrJUuUQ
         561vqX0eaJBstfbDzrSaiu4TCyM45VRAeGxRlsklP2oXUaB8G1TJ2G/OHmrH0n4lM9gi
         mxrB+E8GxQdJQtrev/0jiGW6imY/nGZbBNdmn3AcyRIkwRmk/xg43ZdlICmiWSe0aO3g
         2iV4/ZUf2683xSJ8Vy6I6olBvbDwudq8rsSHndmGAL4Do49a0qgwoMimmB7EcosWh4wy
         Rnud+lSM4Ak5351jl5o8s8zX/R1MaaPQ1EmE6QnWyZgkSbvq7D8q3ckdAI4jH/1zu37y
         wXZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvPJPyHLux6Y51JmgnPWf9xRo4pWM8CvjYh7kpoYOrSdiiMjXJr+XXlhHBLigfY8kHW/y/CM/hTe6OmtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+8ktZDzpqdyWjWDrFHzbErstAacFH9vJd+mg19TxdDuucGKI
	lDkeHEWWyLxfG2UNUL7UPIE/QhTfiaI5g8BZoNcKbsBV4BIEFFea
X-Gm-Gg: ASbGnct9x90j7dRoqawMQA9RSb17qQjQJFixy4ViWQjBDNJh1yCxxguNsirMrixT49R
	MWJeA5/49G+/hnF5GGn6GZrx5Ee2s/eje9IUY3Cvk2CczJkon9hdg4Ii9R2iBxonbgJllMHCooc
	Gdf9KE06Sa3uIQpU1Fb6mzBI8vejlU6DvY/iF6XNy/V8fgHLgN0W0HxX0tMPHDOgku5GGQmDxKD
	q+tac5MKBGgSv0EcH0g0NA3zjLctshgbXwNTO70N/KCpXy/mr0bwAI6XsBpsK3uV+XMr9D5a81p
	jRJJtLsUHiGSUtST4yWk8DtuCKvuHVcEKRuVq//XtzpTmnCJYJiduhsnwUhErLQuYYvD2fVfB0a
	o
X-Google-Smtp-Source: AGHT+IG917R/W1vcqTTec0X9u5YY6XbXjMGwUWW2UkxaRZJWw0xk7JcR7AOuU4kg2ET7KWpRyWH6AA==
X-Received: by 2002:a05:600c:3b0d:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-440a669994dmr58408145e9.21.1745745545636;
        Sun, 27 Apr 2025 02:19:05 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d04802fsm98730625e9.1.2025.04.27.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:19:04 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/3 V2] staging: gpib: Avoid unused variable warning
Date: Sun, 27 Apr 2025 11:19:02 +0200
Message-ID: <20250427091902.16301-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses a warning produced by make W=1 with the configuration
parameter CONFIG_GPIB_PCMCIA=y

ines/ines_gpib.c:1115:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]

Remove the declaration and assignment of the unused variable.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
V1 -> V2
  Remove the setting of the unused variable and say so in
  the commit message

 drivers/staging/gpib/ines/ines_gpib.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index a16219c0f7c8..c851fd014f48 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1112,12 +1112,9 @@ static int ines_gpib_config_iteration(struct pcmcia_device *link, void *priv_dat
  */
 static int ines_gpib_config(struct pcmcia_device *link)
 {
-	struct local_info *dev;
 	int retval;
 	void __iomem *virt;
 
-	dev = link->priv;
-
 	retval = pcmcia_loop_config(link, &ines_gpib_config_iteration, NULL);
 	if (retval) {
 		dev_warn(&link->dev, "no configuration found\n");
-- 
2.49.0

