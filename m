Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B302750F0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141581; cv=none; b=Iy0uAM6hpwzSIYQIjEyvIlPZ7jyTOAPcOqBNkmBL0N8UBTbMaInCJSGJZPs2nJ/Ho9GPzQCtspDT8pcUUpWhJq76QtDWBknWf3ZMSXcSHKQ3tN4WKZu1kDtkoFwwDFtik68NxOuKwZomQtg4UZUeZUuhRRODBre6/61EFy9A3FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141581; c=relaxed/simple;
	bh=RFriP/I3+eC+Mtn8Y9bz27OWriV5nSIZX8Nfpzjwgjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JddYTrYRump1ZqCQKfWdaz+d2bg09VbAPW4C5b6+0HlH6m7CWv6Qa5z9d2ynAWNuBIObr03qB/CHtkWCaH4rs5q7119BMzgGfVziOUHiCIFsHPpIB7R6qUn2ExIiekuH5TITeW1ULq0n4nG5EFR7sM6w0XlXjs26wmzEGpUUSeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6ixj713; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6ixj713"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450d61cc409so1214335e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749141578; x=1749746378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQDRq2J6JVZdzzl58I/TpodvSza3ScCl+sz60fx5X0c=;
        b=O6ixj713xKF3tE1F2Sd1tVRQpNfQU67Ew7pAbzlpMTSQB4/g4WMy2oSDYjPY2ovu5S
         VYG6ZD2wt+O7z4FkdE7eM6/gM9fMxXlkJjnTM+8q1U5XOm8pIAbpBjdERLOFsPlyuzn7
         0zSe3s8vDC199ZFy+wSmfNIsXVOFmStKh/lhlUSQYLgX4ToA6/Q0A4zWyH396QI2P4X9
         wTbhQlfeDKxL6OUihqbqKWEx30j1MYTrs3phEBnxMt8qf9EI55aOazXoyVmgNHCLGcmV
         aD5d4gs/uatKtopUgBoyW5bT1pQEgPqG72iuTgwZaJxfdO7YmrDN8GzSvuhhG8FZwzP+
         Zu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141578; x=1749746378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQDRq2J6JVZdzzl58I/TpodvSza3ScCl+sz60fx5X0c=;
        b=oCz1t0hwzF5puQqst9f4zvnrO5bOmODPRbrtost9v7IN4ZbgFOdMW5Js7BOoEH8Wok
         MT9eTqVzrB+q1NM9x2k1vCTCSo/lnI0t9o4rolk0XIX7ytlVH5lRQ6jXu3al1xPHcuJc
         sZejArkf/1LNEdv1HGl3CujcmcHFlZAcvEu15b9JdIv8s06HfrPXioV9wGoN1Xlx/Y7U
         0LWEE1c/Yn9SoxqSDBQ0VAkHEIkK2W24R/eCM/trCsXctO+D6tyqAVqgwDYqfXfz39DJ
         Jidnv46c0KNqXNOMiTpN+KOkK59Um/J1DUFbhOlHFM5v4RNx1EK4lqyYewTQZZyPr5As
         Z2bA==
X-Forwarded-Encrypted: i=1; AJvYcCX+GW3uesUKTNmxb5VXAb5EGC48zXprJnPUCv7W3v1vQZXTe0RRGyIPMlZ74VfPkkS4Rsg9iGHS/5/OcQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhtI8D4seSJFOEwdqVbtoRu3EatDyjTinyPXSnIp75gBpFCGOl
	5CZK30Qf3LWxmR1jMFcwTruZY8KI1bdsGKK3gXsJ3U454ptln+IXSTyp
X-Gm-Gg: ASbGncuh5/yRNwhbWiShLgX/zaCxAqQ8WKtXKyvL9/SVENu+iPN8RCfB5WNg5StQkkJ
	Y6t9paFpGN8wPR57xjKYmlztAdlMU5rU3YrFSKYWx656kXCE64QlvvasJLgD7Hyo8GID+rJYCTb
	185YAbknoRqkmpdHVr8BcJ9hTKtED9/X0nLzDRotp906HhoESLkYNveOzE3teyj7S/aw4XuOl7h
	h9UaX510YZWxhimkwQN53aqRJzDdaME3DrroS09Lyr66YBc1uu+k1X/YzDZRkdWlhto9xCxeIEo
	6Vlgh88J8w8ZKj+ENQlJagefPP2u8wbDXDOTpdz0K/A1Vk5Gx9Y4mzIzqbSr2xybRywU12k=
X-Google-Smtp-Source: AGHT+IFapntRUB2pslt9OoGnLM+SrlC1B8O0oNVU16LpEOaPAczQ9ZO8r4IU5V0ImeNESiOYiHqvKg==
X-Received: by 2002:a05:6000:2891:b0:3a4:f6e0:c1c6 with SMTP id ffacd0b85a97d-3a51d9236d7mr2791274f8f.6.1749141578411;
        Thu, 05 Jun 2025 09:39:38 -0700 (PDT)
Received: from thomas-precision3591.. ([78.246.169.42])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f009745esm25224425f8f.71.2025.06.05.09.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:39:37 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Anatolij Gustschin <agust@denx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC EMBEDDED MPC5XXX),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] (powerpc/512) Fix possible `dma_unmap_single()` on uninitialized pointer
Date: Thu,  5 Jun 2025 18:37:10 +0200
Message-ID: <20250605163717.18020-1-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device configuration fails (if `dma_dev->device_config()`),
`sg_dma_address(&sg)` is not initialized and the jump to `err_dma_prep`
leads to calling `dma_unmap_single()` on `sg_dma_address(&sg)`.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 9668b052cd4b..ef3be438f914 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -241,8 +241,7 @@ static int mpc512x_lpbfifo_kick(void)
 
 	/* Make DMA channel work with LPB FIFO data register */
 	if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
-		ret = -EINVAL;
-		goto err_dma_prep;
+		return -EINVAL;
 	}
 
 	sg_init_table(&sg, 1);
-- 
2.43.0

