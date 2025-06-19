Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225726560A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322739; cv=none; b=n/8498x+tMGpjV/xQfnhz9XieOa0QdIC8ng/wos1VEdrqeMSOC6EZrj70os2HiiIJNEqwYsa+AC+Su4qiGHxdOpiOfhXlPdkJUlVYqbBzIuxN7x6QAAw+HSDv1ajMF9td3GyOuR9VmhoiCi4E/BnazIZ8kFnbn8FKlIYwabufQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322739; c=relaxed/simple;
	bh=dc8b4SqFbL7GbH4/AI1p/bawh7QOopzOKjzeIjY3oEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rO4mA4mJETAcv1OcnwxrJC18BJ/kq9CHr6M1haO2cXjZvH1/Ke+UAJo6xX8gD4RoW/CzG+4jiN0eEZROtKmPda+WA9pHzZ8Ms8dnzetPrZKEpFt4snJa8C26rsep/tx2TRAR+jnOpre2XSE/dj6o7OQlADrSq2CJSq2TjSptgj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3hZoIun; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3hZoIun"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so814212a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750322734; x=1750927534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0wtSbUxRYclW9mGhcArPsdL1jf7GZkXd48YFnMEvgU=;
        b=C3hZoIunlRLh3X3IxLat12SSiT+S6UTZ75IDpSjAxKbFp5uF32qu1X9YsIRvqj4Ase
         t+vfrQTJDEguqAlsI0XFvT0ik+0+OtpcM1T23Zd+j79Up8AwGNCwj5Bo+CbqMW8a5m4b
         hzvKjxCIgcXgRt3ZcBmjxCPg98X/xwTJEtuZOScmyhGCcGzfKVa4KLkAJng90/SVHOy3
         C9T3TWoT+5HWH+t0wPLLu3ZXabKJ3xybbn+eOXLtsMMgdygz6udr4L84oUNHRL6+Bx1F
         6/jYrToOC7yr/vwU56BP/al9sM16WTCaMLkPsEiEndesrtbC1zVvLtTDqMHdz2i6BiqW
         J0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322734; x=1750927534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0wtSbUxRYclW9mGhcArPsdL1jf7GZkXd48YFnMEvgU=;
        b=E7IOwU9SJsRa1JyEsCYxuAWpUaAOKnwvogpAwnmWEBXgSdfaHuMotBREj1jirDIRaz
         ZXK0qe5RU+kz7dtxcgsoX3+1KIGRLTtGLS5IG5Wpg/lQ3dEDza6FxHUcs3aQrzziQ1Kb
         0bM0CI6/1V0GhE+ZF4B+a1WG/ZFEvPsSuz8QEBmbwSgRQN6Gj6l1jrextyNjhN0tpBho
         xChgWWVFsoBPxyG4ScbULtm0Zq8iZ+CwEU7Nt4pLb+CiFPqDiCdhpQosY31M3+nzXdd9
         zitRthe/7Pt6hevTY4T2pmjRcAR0UyqUOQr/4dQdicjRcJOaDbvPPy4GtptHpHd+F7lm
         AtvA==
X-Gm-Message-State: AOJu0Yx/bVkDS1hHT7BWab30OPUmKk4mWNg3Vu/XN067gnplFLxxzaIu
	iczrXis3JNxa6Ok/OYVxXNcFubtBTPsi1nURfqfldiPap260LvoW3dJP
X-Gm-Gg: ASbGnctW892DQUHadBpEXoWh0lwl988dvoVwTBLyvFwvNz9ALLppH4EyWKM3xpm6xdL
	P5Zbq5355LaZJkrlqTFDCYCZWQOuul1SOPNrtLmTltTWWisZFMAMgV2Mu/icqgd+cR7JgScL+B5
	gQiTpkCiRUOyLd1HxojnOHAgc/025s39jywfc9CAl50T0DdJAtEPakSl4uM35eNiYyG9DJSke8M
	vaJljzjNZ87cOHhH4UAam+IONT2mZnt8U+RwDuNDIkaoeF9rJdduWL22tjUwuOhtGDK0uXjHYUC
	w411+9ric0l5Ca1uPQ9L5lAQM83AnuGKHD5uKLzishgSi3OYQhmyfVTZ5FtVquQ6/goEz0dOike
	adendH4pInlOlq8Ps
X-Google-Smtp-Source: AGHT+IGwj1vYRM34MvLwuBy+TO7NC2p5Qze5GzXzAOBX4XqB3oeg9resaDD7r2lfy412opi9HxS22w==
X-Received: by 2002:a05:6402:214d:b0:609:b263:41c9 with SMTP id 4fb4d7f45d1cf-609b26351cbmr5554526a12.32.1750322734545;
        Thu, 19 Jun 2025 01:45:34 -0700 (PDT)
Received: from chimera.vu.local ([145.108.90.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm11276831a12.42.2025.06.19.01.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:45:34 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 3/4 V2] Staging: media: atomisp: i2c: struct definition style
Date: Thu, 19 Jun 2025 10:44:22 +0200
Message-Id: <20250619084420.146151-3-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
References: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder const qualifier in array declaration

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/gc2235.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
index 6c743a17f198..7dd9a676fb98 100644
--- a/drivers/staging/media/atomisp/i2c/gc2235.h
+++ b/drivers/staging/media/atomisp/i2c/gc2235.h
@@ -179,21 +179,21 @@ struct gc2235_write_ctrl {
 	struct gc2235_write_buffer buffer;
 };
 
-static struct gc2235_reg const gc2235_stream_on[] = {
+static const struct gc2235_reg gc2235_stream_on[] = {
 	{ GC2235_8BIT, 0xfe, 0x03}, /* switch to P3 */
 	{ GC2235_8BIT, 0x10, 0x91}, /* start mipi */
 	{ GC2235_8BIT, 0xfe, 0x00}, /* switch to P0 */
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_stream_off[] = {
+static const struct gc2235_reg gc2235_stream_off[] = {
 	{ GC2235_8BIT, 0xfe, 0x03}, /* switch to P3 */
 	{ GC2235_8BIT, 0x10, 0x01}, /* stop mipi */
 	{ GC2235_8BIT, 0xfe, 0x00}, /* switch to P0 */
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_init_settings[] = {
+static const struct gc2235_reg gc2235_init_settings[] = {
 	/* System */
 	{ GC2235_8BIT, 0xfe, 0x80 },
 	{ GC2235_8BIT, 0xfe, 0x80 },
@@ -268,7 +268,7 @@ static struct gc2235_reg const gc2235_init_settings[] = {
  * Register settings for various resolution
  */
 #if ENABLE_NON_PREVIEW
-static struct gc2235_reg const gc2235_1296_736_30fps[] = {
+static const struct gc2235_reg gc2235_1296_736_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -321,7 +321,7 @@ static struct gc2235_reg const gc2235_1296_736_30fps[] = {
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_960_640_30fps[] = {
+static const struct gc2235_reg gc2235_960_640_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -373,7 +373,7 @@ static struct gc2235_reg const gc2235_960_640_30fps[] = {
 };
 #endif
 
-static struct gc2235_reg const gc2235_1600_900_30fps[] = {
+static const struct gc2235_reg gc2235_1600_900_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -418,7 +418,7 @@ static struct gc2235_reg const gc2235_1600_900_30fps[] = {
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_1616_1082_30fps[] = {
+static const struct gc2235_reg gc2235_1616_1082_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -463,7 +463,7 @@ static struct gc2235_reg const gc2235_1616_1082_30fps[] = {
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_1616_1216_30fps[] = {
+static const struct gc2235_reg gc2235_1616_1216_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
-- 
2.34.1

