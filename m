Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EBD21CFEA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997704; cv=none; b=uGIx2gZdVDLHtIsnO5gMKDjJDWWiAYWj3kJmxMqjC9NwB6gkE52ceY91q6jj1hv26bDLGc2qtPr+7DFkp2QXViPH2T4NTpdb75E9TcwKkbC0ArPrAEd17LajR5iKAr1CmPfJmbYH16zBocKusOdqGOttfewjI8N1G5yA0FTEqaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997704; c=relaxed/simple;
	bh=zbdvaSiXX2oUTDa7WIbY958t9msSvAmj2Lshi5nbldg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P07KGOFieJ8g2s3H00nBBMfgnzQv1NAruGANAlvErc8HPKx9mxU5oDzxwhPUe+CY+AAge0FJdUbD9g0/7i4W7CVFdlF2Uu+YDblP+RYNJnQV3OIEJlIEKKNVLUvOsLmylHm317NvJdYRwbk2NSv3vU6qAI89KASAoZ01MOcycds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXiCQE4c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXiCQE4c"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso16078045e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997701; x=1745602501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lo8NK9cb9305tOCf3KZaXzeHg3jD7BCaFh2Dh35qq4=;
        b=aXiCQE4cLVHQBhOIYdDOOmq4NtyFXNixM9ikyhPvVv3+e6mXDY316DhAHdCAO3keY1
         xX41g3dsvdvzz/vmQ5kQUQAw0XHE7hl/EpqU6dx3SBEtvR6CghaZRPGXbsfDN2BhW00O
         +hjKHKOaMeL3Nf97U3gmeD8+/Y9KwqjfIAGz9Lt46YupNcV5b/FfLdIQVQKEi+mSBx8K
         4rNkKmrIdw2JE0lVIG5ElBdRS6Le3n9Zw7lG18AmkJFZJJN6P9NXiSnq4C93gg21HjwY
         jNz2r3qCfbqzreCWzZZWqayJdUVDQVLT2A0UjNi5MtelXC9Ne1IXTx0aN4A16xEi73Mf
         sXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997701; x=1745602501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lo8NK9cb9305tOCf3KZaXzeHg3jD7BCaFh2Dh35qq4=;
        b=CgzCRh1jziRMKqSKnO1uHBXuV61G7PJtnOqDm0N8NjkM+SmagfbsVe5hIZXMV3QJhF
         9JMlHzw9fcYT25MdRAHq8FHWag94BYl1Uc8BsFdriTjSmzFzs1Es75dnmqX0wI+rxDqS
         C4oQs7l/FOnKK6/9MyUAACi0OzMuTZqIa+I42a9gHUI+E/8WAmhtLZiEgNycNMSeCyMI
         GoCbMdQWTlt1FUelsy5vT359N8RQLNRsBiodsZUGjZT+fwh2+BSnDPuQEscMvCbyNNRI
         gI6Mu/ajjEGNnuYsqZjOajsbzp1uw0JO7Y3cdFIaBobFopUmV9JQls2szTZDfVox4bBO
         z4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDWg6b7pk13inwNQyGIS7XaREjuTuPwh3ny4QxypktqBqCXrlH3kUn9IW04VUZFdFJW8mA0M3Kbn7MxZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5+AWx0iaIMjmLs8tW246C1TEQn9KdS+RRRZK507z593GZJBA+
	z/nmz2p6uQYHR79gGvZcPsKrsHlORDu8uRGN0XnK3fHEbCYhKPmH
X-Gm-Gg: ASbGncvMVw42QaYF0C+IY3BPP1QtriqxRdM/S0yJyftTTKoQ5IIz0nnlcHG1QKhk4nR
	6yoS1ZMlBrt5Kde/SgQfZbYck14/e0jwHiuyU2ji2ir4u20BU+KpwNLHZGdgtPQLujp5H9yYuja
	9BOLimapPqQo4uXQyNOz0Loofhz6s4FakZuw0/u9pdybMxkXi4rP7tW3RVekLBRrvGUaA8rL1qD
	eRpRkw7946K1FqtpYQM/ltLx/ZiHX8xOHkJq0cm30KX5OfYlIBXEV551xSegZr/Vq9s10+VIEZg
	TTr9qa7utj+Gd62erBM4PsPwhCc2QfErqV6gFWk07/faXM6VEDuRuBf8JKOATM80tu/MnKSoqxN
	W
X-Google-Smtp-Source: AGHT+IGycw6PG3LhA4R9z4UXQhejlyXvLsQYTBzDufjRPf307pnkU7s+bMube8/17mGSZ9ymhrWU5A==
X-Received: by 2002:a5d:64e4:0:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39efbaf141amr2577524f8f.52.1744997701027;
        Fri, 18 Apr 2025 10:35:01 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:35:00 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 5/8] staging: gpib: Remove atn_asserted global variable
Date: Fri, 18 Apr 2025 19:34:31 +0200
Message-ID: <20250418173434.2892-6-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atn_asserted was introduced to deal with an issue where certain models
of the Raspberry Pi would lose interrupts under heavy load. Using
a combination of edge and level interrupts the problem was resolved
so the work-around is no longer needed.

This patch removes the work-around.

Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index caa8361da696..1d650cb57cd2 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -306,7 +306,6 @@ struct bb_priv {
 	int dav_seq;
 	long all_irqs;
 	int dav_idle;
-	int atn_asserted;
 
 	enum talker_function_state talker_state;
 	enum listener_function_state listener_state;
@@ -614,7 +613,8 @@ static irqreturn_t bb_NRFD_interrupt(int irq, void *arg)
 		goto nrfd_exit;
 	}
 
-	if (priv->atn_asserted && priv->w_cnt >= priv->length) { // test for end of transfer
+	if (priv->w_cnt >= priv->length) { // test for missed NDAC end of transfer
+		dev_err(board->gpib_dev, "Unexpected NRFD exit\n");
 		priv->write_done = 1;
 		priv->w_busy = 0;
 		wake_up_interruptible(&board->wait);
@@ -686,14 +686,14 @@ static irqreturn_t bb_NDAC_interrupt(int irq, void *arg)
 
 	dbg_printk(3, "accepted %zu\n", priv->w_cnt - 1);
 
-	if (!priv->atn_asserted && priv->w_cnt >= priv->length) { // test for end of transfer
+	gpiod_set_value(DAV, 1); // Data not available
+	priv->dav_tx = 1;
+	priv->phase = 510;
+
+	if (priv->w_cnt >= priv->length) { // test for end of transfer
 		priv->write_done = 1;
 		priv->w_busy = 0;
 		wake_up_interruptible(&board->wait);
-	} else {
-		gpiod_set_value(DAV, 1); // Data not available
-		priv->dav_tx = 1;
-		priv->phase = 510;
 	}
 
 ndac_exit:
@@ -850,6 +850,7 @@ static void set_atn(struct gpib_board *board, int atn_asserted)
 			priv->listener_state = listener_addressed;
 		if (priv->talker_state == talker_active)
 			priv->talker_state = talker_addressed;
+		SET_DIR_WRITE(priv);  // need to be able to read bus NRFD/NDAC
 	} else {
 		if (priv->listener_state == listener_addressed) {
 			priv->listener_state = listener_active;
@@ -859,7 +860,6 @@ static void set_atn(struct gpib_board *board, int atn_asserted)
 			priv->talker_state = talker_active;
 	}
 	gpiod_direction_output(_ATN, !atn_asserted);
-	priv->atn_asserted = atn_asserted;
 }
 
 static int bb_take_control(struct gpib_board *board, int synchronous)
-- 
2.49.0

