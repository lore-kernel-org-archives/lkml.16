Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615821420F
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135045; cv=none; b=CJJwCTroBKBzCHNC5HHL2Da7LEKxglhHbrLPQCGx5rh3n5Ef7j7s31P+xTb6McKiJX2qqN0ie+szNC6r4NwKGkxh2Eb07HNzhV/2U9X9RAKpxpF08QDNvpi8jhwHxcLDCBp0Mc5xIZxZAn4PapemBkYWHkfDzwobYaq7BV/bzlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135045; c=relaxed/simple;
	bh=ydEmKAhDTYh+zHzpkZ3DUp5vHv8ofBoECwVVozEpjek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kla8YEzYTS4Nj9WZhtOG0n1DakwRhZkSeBRSHKu+Djcn4hD/2EoQeBSakGGa10HNMPa8Baz1SFUHBtiwRH7jDf92pC6lbx5ca8yc3nXSSevAvnHs1PdBg231XbK6q/UX84XLBJOlaGmVzd63MHM3U8pvvel2aMUoGOlsRFSoHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZRvaBoZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZRvaBoZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2963dc379so208954566b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135042; x=1746739842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nPoZkrvSe9jLXSHCMvJVVoDrt0UWfhJKy1p6w377cg=;
        b=SZRvaBoZCqjB1sl4UlwnMKJ5J3KHC6hrGf/+XFbPHmqzXKp5rZf0Rhle33Fyf+aw6c
         ddWStck/k8G/GYnct5VeHoN0hMLmsTFxBkqcBnL48DpaIqBfNdngJXYz7DUvd0uk6h5v
         DHeqoxD5wiQ5bhjbTLPp1oqllcmN/C9NPK4gjsWIqy+V181w3BVyrGAMYAhF2ocMuZkh
         AH9ml6AC395JpYR3OcsF2NYiXiXOanr2njcngRgwD1v5GoqO4mNRTIH0zx8eS5dczOaX
         MrLsl0lRtKg5gbMIP/L1L3iq/gO/PTp3FtHXW0GKZGEklIM4c1p+qDpN6asymt74/BIp
         TJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135042; x=1746739842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nPoZkrvSe9jLXSHCMvJVVoDrt0UWfhJKy1p6w377cg=;
        b=td6kpCPyXTxcJMARSv1/r+990Vx15sJTBFLF/cSu2p58x2rZ4ZiPvivkKwAjhnUla2
         X+KLxt3yky51SCTy/UixeC/LFoXi3m7LrFu+kc+OVZe9TS3tSPhgkk886KnDcNeyDK1N
         7/RY+sZIsX2njUY9MIeR27x4/9njrP6JaZJ6ZKVSjQO0clMzUw/1qUCTtlRCy7FcEqDJ
         ivpLYHLpwi7UHccwRHYjtKGLmsjz81YTEPo9TISBbC1puLSk/51k3TasroctnqEumnJA
         /TACdoXNF1ZrpSQQxRR54yI4mziiyqWFm5GCL8vDr/C0a7RrYPcHB7VgzWuk5D39YCwb
         hrCg==
X-Forwarded-Encrypted: i=1; AJvYcCVLGzEyt0kmKF4lEuo9OiZWTtX/x/ulruC7dntlk5w4z5zwd+NwKDD4S/BBP2kPhgAml3qSkTX4qOtN7dM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlXgyVCwcMdDlxThOU2RLu33UMlRiKEgLYKRpC20f0EPloS8xV
	m05Htctpa1dbCSkOJFC/FrYTGeGfcYSh3gyzMsiUxu2NP5NG6UYO
X-Gm-Gg: ASbGncs3UNED06do0N9rTV66uyRPswC+sNZkQ8zuqrfSMfyOHryRgAeVsubXBhHBgvy
	G14S6jiaiYXI/6N0kSD7CH1obo8270WtH1L+MX0vPAP3G1AeQXmIVnf5pmXFQdOzRXa+XVYExYB
	RheyXMMDo5ckzWwWOhmWAFhDuhXmWrDAGc1d/F1uy0G1v9La+03Y4rtCvj2Fliqcoc90/SHoaUi
	y1WNDMwKmwp6SEcSjDtsBeR0K9z4V9LLilEbO2kOs5JKkLG7rhDipKwo3czn5PYhRaoJcf4UOzR
	/3du+QW6QWRlzLCnV9biCM3I1GC5QHkcgWYdrMREzFMnpKPl6i0kB+Vidjd1zlaMU4ZHd6yotw4
	HUJ49U/tz5yyDzhJ5B0qcVPAq52x27GI4NTJnXWnX7O0fXvM65r1zTMNdKGro8cCnPuLebh2p+o
	ozEg==
X-Google-Smtp-Source: AGHT+IEl1eaIv3z0uUJRWBTl5Okk+6tnCoAhx7BhiHUPolVhCCDYS0ghrDyB8tO4rXLSRnsbPECoew==
X-Received: by 2002:a17:907:3991:b0:ac8:1126:ac15 with SMTP id a640c23a62f3a-ad17af8f27amr62796066b.41.1746135041414;
        Thu, 01 May 2025 14:30:41 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:40 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 3/8] Staging: gpib: Updated return type for `request_system_control`
Date: Thu,  1 May 2025 23:30:32 +0200
Message-Id: <7aaf821bdfa84f6ba1df0c197e6624f40037aff9.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated the functions used by request_system_control to return int.
Currently there's no possible return errors in the functions due to them
being former void function, for this reason they all return success (0).

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 3 ++-
 drivers/staging/gpib/cb7210/cb7210.c                 | 3 ++-
 drivers/staging/gpib/cec/cec_gpib.c                  | 3 ++-
 drivers/staging/gpib/hp_82335/hp82335.c              | 3 ++-
 drivers/staging/gpib/hp_82341/hp_82341.c             | 3 ++-
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c   | 3 ++-
 drivers/staging/gpib/pc2/pc2_gpib.c                  | 3 ++-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c          | 3 ++-
 8 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 445b9380ff98..ae60bc674a85 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -339,7 +339,7 @@ static int agilent_82350b_go_to_standby(struct gpib_board *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void agilent_82350b_request_system_control(struct gpib_board *board,
+static int agilent_82350b_request_system_control(struct gpib_board *board,
 						  int request_control)
 
 {
@@ -356,6 +356,7 @@ static void agilent_82350b_request_system_control(struct gpib_board *board,
 	}
 	writeb(a_priv->card_mode_bits, a_priv->gpib_base + CARD_MODE_REG);
 	tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
+	return 0;
 }
 
 static void agilent_82350b_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 6b22a33a8c4f..367b70fbb52c 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -578,7 +578,7 @@ static int cb7210_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void cb7210_request_system_control(struct gpib_board *board, int request_control)
+static int cb7210_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct cb7210_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
@@ -590,6 +590,7 @@ static void cb7210_request_system_control(struct gpib_board *board, int request_
 
 	cb7210_write_byte(priv, priv->hs_mode_bits, HS_MODE);
 	nec7210_request_system_control(board, nec_priv, request_control);
+	return 0;
 }
 
 static void cb7210_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index a822fa428cd0..ae05f5205b2f 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -83,11 +83,12 @@ static int cec_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void cec_request_system_control(struct gpib_board *board, int request_control)
+static int cec_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	return 0;
 }
 
 static void cec_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index fd23b1cb80f9..7a47d61cdb2a 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -67,11 +67,12 @@ static int hp82335_go_to_standby(struct gpib_board *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void hp82335_request_system_control(struct gpib_board *board, int request_control)
+static int hp82335_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
+	return 0;
 }
 
 static void hp82335_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index f52e673dc869..fad5cca5238a 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -293,7 +293,7 @@ static int hp_82341_go_to_standby(struct gpib_board *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void hp_82341_request_system_control(struct gpib_board *board, int request_control)
+static int hp_82341_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -303,6 +303,7 @@ static void hp_82341_request_system_control(struct gpib_board *board, int reques
 		priv->mode_control_bits &= ~SYSTEM_CONTROLLER_BIT;
 	outb(priv->mode_control_bits, priv->iobase[0] + MODE_CONTROL_STATUS_REG);
 	tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
+	return 0;
 }
 
 static void hp_82341_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index faf96e9cc4a1..233dcf40be39 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -909,7 +909,7 @@ static void usb_gpib_remote_enable(struct gpib_board *board, int enable)
 
 /* request_system_control */
 
-static void usb_gpib_request_system_control(struct gpib_board *board,
+static int usb_gpib_request_system_control(struct gpib_board *board,
 					    int request_control)
 {
 	if (request_control)
@@ -918,6 +918,7 @@ static void usb_gpib_request_system_control(struct gpib_board *board,
 		clear_bit(CIC_NUM, &board->status);
 
 	DIA_LOG(1, "done with %d -> %lx\n", request_control, board->status);
+	return 0;
 }
 
 /* take_control */
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 96d3c09f2273..324d323b4240 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -127,11 +127,12 @@ static int pc2_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void pc2_request_system_control(struct gpib_board *board, int request_control)
+static int pc2_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	return 0;
 }
 
 static void pc2_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index c35b084b6fd0..62950518fe49 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -642,7 +642,7 @@ static int tnt4882_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void tnt4882_request_system_control(struct gpib_board *board, int request_control)
+static int tnt4882_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -655,6 +655,7 @@ static void tnt4882_request_system_control(struct gpib_board *board, int request
 		tnt_writeb(priv, CLRSC, CMDR);
 		udelay(1);
 	}
+	return 0;
 }
 
 static void tnt4882_interface_clear(struct gpib_board *board, int assert)
-- 
2.34.1

