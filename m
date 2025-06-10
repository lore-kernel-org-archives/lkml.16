Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2E528F508
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565792; cv=none; b=PMJNRFBi3KZNlZH/fAuaACQvm/+kvtuwdksGJpVIok/HqDR1+WynRwR1pGL3pXxlHWnHyv6J87nUgmTJjV/KyXLDje5FOoH+3I8JzGs4guDr4zYtNee1PXYd9+UUyLBe4eU4YRWhoklXo22hFPm+rlyQPeBBktLqGqIghvqo0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565792; c=relaxed/simple;
	bh=UAkfwZw9spUNUaNEZrnrHExT4X2NKjMnXpIzkUAlzNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCSZO337hZW/sLk263Tl5+98UF6OiahHJ68z3c6SlurFnBnzkJdh5SQo93IFNsa7tiTVykrnHumqgfFUiQIxndzjpSoGvwKM2UGqlv1G+xC0Phdx8ZkGtrIKWzretAmuT4A94iTfsQj+YzG9H+8LgApX9WlZALfH/b+H6XUGizY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnCFbq7R; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnCFbq7R"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a52878d37aso937961f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749565789; x=1750170589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=esEZPNG+RjP7eIdE+H90U4csFlF97uknnEYr/Yzqr4Y=;
        b=TnCFbq7RnH9BYVyod5Pwtv4I1QfSBj2B2yMVHJU7/pgFt7LY5ezLtS56fXEZOKh7K/
         Aug6/DIvRsfVRVOc3F/5vDis0SX0O1l1qDW6b3itg11k5VK0YLQwjP4mYcJN9vo3WS7V
         mx3nqZG/ZRNWmSf6QP8BGE6Z+JCBro+MB7hijaaTkG7UvMF2sQ0Y/SxXzycxc1k2Jb8J
         EX+J3M10xsMwsCEVLgGCiVIu22ZqceyICs2JK+hWZjr/Of5/rcRIelcuhuF2xvaZPfdO
         N+fiukDLvccmm942yruQcFiPEZOKzdCL8S9PThByqlmd60/QkF+iWBzp8ZGbM/QvXrQ1
         xKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749565789; x=1750170589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esEZPNG+RjP7eIdE+H90U4csFlF97uknnEYr/Yzqr4Y=;
        b=h5RsnXbxkpjSlt5EQImwgxyNzQbdTQhjwrFv4c9ozm3qkgVjzU7uKjKR1m2QAdMoyl
         QeoOjAj6rzJ7zKVVamROEqVqvhmxsYUe7i6djMmIWgoYiX8UZeBtnrmrSYEmljjMTrwa
         U+jOSUojL6LiMNHqmC2aOsI6BYmeTEB/DPJQfe/P3GMjfpuzBbUrZd1ol/nEhOn1Zum0
         b4/9nneeYYYYrHjadtQj6qBRqBFwSeWq/ek26wmH9W0A1nsbFkv6Qa9g2ChEHyJOwrIA
         RPlzM1OFlJyCiSrg5JgyM1CJyKIOP3zkgqyGmihZZHe+amPGHJKR6RIwViaDiwj1d3M5
         eznw==
X-Forwarded-Encrypted: i=1; AJvYcCXvd1XcEaJrgY5Vyk+9Ef8F+O6can0WbsKHK6ZayLsNfKkijpaoah5Ecdfdfpv2azAwh17Oj0h1uGSANzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6FAiFu4iMAVOIOxMIB9GGaHHycDJFHXpTMy+Fm/Ijtgn3mON
	xvU+iZMRrW/SfgeRa6uXXIDaSlX/ST2DtN/uEj30aq0BqlEnA6A7dOsC
X-Gm-Gg: ASbGncuoLabZWU6GVqmzo3n46RtRcvcGDTlGb6izU26uqcYeM4yeBGFwRR41luO0oV7
	R3QeL20hurthZemmXUrywdT7dC48UVkB8IdzLzyI5fCGRTy5tb8NK3sBzbvaB7IwiZs0IF/nnFj
	RfuuAHEfhOXAZhUkOqm/Ig7qtiKhESyQ1kLdpCSf0ac+g3HRS95MSwnnOZv35xY7sVk8kqr2ktT
	ldL7MfDRNSa+aUBzT5vgJAABAUeezYMIb0GyyG3it048/wSO5qp0TxjxH5EiQ1rJrbVklQW2SHv
	bkivETE9Y4MHQ8RS6UbbYUdDEEEj1FO2nytUMlL49RkJUpHSQIJ2gVHILers10gom+HWX0Z8B99
	PgC51+s4PXDdVX8o=
X-Google-Smtp-Source: AGHT+IEsEw3VXsZOTaD+aKW25Mfmt5QTfOeNT+U4CyY9HFg2QSr7SIkvRCBKCEAtxjFu1sU2doGYRw==
X-Received: by 2002:a05:600c:4e12:b0:451:dee4:f667 with SMTP id 5b1f17b1804b1-452fe0a41c5mr55546505e9.7.1749565788521;
        Tue, 10 Jun 2025 07:29:48 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:31ff:bbc1:f423:fc85])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53229de53sm12376324f8f.8.2025.06.10.07.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:29:48 -0700 (PDT)
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
Subject: [PATCH v2] (powerpc/512) Fix possible `dma_unmap_single()` on uninitialized pointer
Date: Tue, 10 Jun 2025 16:29:11 +0200
Message-ID: <20250610142918.169540-2-fourier.thomas@gmail.com>
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
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 9668b052cd4b..f251e0f68262 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -240,10 +240,8 @@ static int mpc512x_lpbfifo_kick(void)
 	dma_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	/* Make DMA channel work with LPB FIFO data register */
-	if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
-		ret = -EINVAL;
-		goto err_dma_prep;
-	}
+	if (dma_dev->device_config(lpbfifo.chan, &dma_conf))
+		return -EINVAL;
 
 	sg_init_table(&sg, 1);
 
-- 
2.43.0

