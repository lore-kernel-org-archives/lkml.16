Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856526560A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322746; cv=none; b=UQAtnps94JrfwrowRmHNPvEx7AxEO5PoB9dmijM4tuh4liQar7g5qi3BggtvFWiUVDkWwkfbbuDar3D6Z6QLqavThghnQ9TFp6e1tftBW+QfaPk/v1KNCNUH99Wuy2cNyDHqObMcH2zVNk6MquvlXlquXesgUQwfJHKo46cq+AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322746; c=relaxed/simple;
	bh=pZCCuJtMXW+Sk5A05vG608WxmNHl7vWyCGkPb08W+4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R3wket0Ax3RdxHPorIHSlKoW6YRHhsx2f7hglWZpoTi4CTW34EydaEtPuQKmo6a77HLRRRmi3yu7atMdLz/c+WMpQxBz24z8foPoDZBNA2KPlFba2xVFrVPjHm/UOQX9YbYaHwUONJIegCkirvYx7P7tGoL0v+eHVwEtH6Ywkv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ8sXUtf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ8sXUtf"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so795532a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750322743; x=1750927543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvaERkbwLq6kAlzor3nDw/43C+87Vnd9ZfjPg7pUV1M=;
        b=UQ8sXUtfme85oB9C2UM1QGBW4XeFdYvxATDPiWRfZnJ5IhYNn4hqXPF9Tm5Fgu2+pV
         rGNvF5ooVsOVE7rRw36CmP0knVNF9jMQgtPKh+lB0X2yIPkrwXSOQ/QiEk7YkV+VpzR4
         2cWrvHVV7QrPeC9DoldMCqYB2qiSba3XCn1AqH1H1rHxdtO6MYpDesRaRzNLed4/EiLU
         Pp92h07QoPxctcvouSTuNiazJmx/6IHr+ANkEKFysvsH9Wi901pKHFkkhEtd/WDBNZcS
         g7wSaozE2wx/8YGOK3oxiaMxHczgzeXQYIAOgV4VapW4pTXzt5wOEZsEz6M2EcA9uWPv
         eMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322743; x=1750927543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvaERkbwLq6kAlzor3nDw/43C+87Vnd9ZfjPg7pUV1M=;
        b=dnNUJRO9rjYJOpgO5xPETmezo7J4ll5AvY/ni0u54VrTHnpEUUzHkcwJZIez1+NcW8
         zu2vKFVzf35qRECUOM2iwPnX6f21jzF3WuhSMQu7GldMSnd8CPZ+AwCYm/QJsy+8ZB6x
         Als+jMd0caYOgBWHysURlUQYXB+b+M1EDvbSwx6X6QQCg5V4h5/u05BfXeerVmAl1jt8
         4CkPXIssinQHUsPKIeGtSSk0jeI4IYBWTipk/l19OwKxgZbbQntBJCz5W0+SMbrH3DIX
         4cqoe1r11J+DDqtws1VB0KUs197H/y8SseT5YOST+Nw/8cdN+rfPZNNLaA1FcKsPpN1B
         ArIw==
X-Gm-Message-State: AOJu0YxI7AUR4Yd55ElZH4sqUG+oPSOs7LgS2qogb7Wao7tesh+mSCmc
	tk+iNDA3ayqjuigRfA44r7UkSKK1vJ9ypADh5P6dBFARWqzQ8ywN6e1G
X-Gm-Gg: ASbGncta3E9Z67jrSC4I6K/Rxt6s5mIGCzA3FuQG9+IbSReXQekwbhvBRKi30FEctMK
	myowbB/JL2jMkxeR+scUbxkoipoYk1kJ1+RXPpYshyNOyIq1+6zoebxgBsKrUq40iytp2pkbLwa
	+McrvA5D8mPZIy+URZSJhquaNS2xdm5mQyuHW02smFXuRNhJMOKrj8WJfUOHvh8CcXHtKXqlbOH
	TTW1NlBNaVQ19w/IAl5IhTPcuLj3z2QaPQiq0cWfznUioTcxy8G1Vatek9+xp3JlfDpLXI/KC7m
	LmxHeiA5u3UNSVdUcSfIoFg7RWXque13m44s6aghbuYITP9V5r7KVmS6AP56ptNLrfSbp7lLeNF
	2OsCEUw==
X-Google-Smtp-Source: AGHT+IHYZLTg9XnpvbLDURUjKOGqQXoCtaLlfY7KFUrdYfthg5IaAU0Z6abNvqwzCraWQ6H6oY93ZA==
X-Received: by 2002:a05:6402:d08:b0:607:f257:ad1e with SMTP id 4fb4d7f45d1cf-608d094bfdbmr20431777a12.22.1750322742884;
        Thu, 19 Jun 2025 01:45:42 -0700 (PDT)
Received: from chimera.vu.local ([145.108.90.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm11276831a12.42.2025.06.19.01.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:45:42 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 4/4 V2] Staging: media: atomisp: i2c: struct definition style
Date: Thu, 19 Jun 2025 10:44:24 +0200
Message-Id: <20250619084420.146151-4-thomas.andreatta2000@gmail.com>
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
 drivers/staging/media/atomisp/i2c/ov2722.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index bc36133f3722..00317d105305 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -236,7 +236,7 @@ struct ov2722_write_ctrl {
  * Register settings for various resolution
  */
 #if 0
-static struct ov2722_reg const ov2722_QVGA_30fps[] = {
+static const struct ov2722_reg ov2722_QVGA_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x0c},
 	{OV2722_8BIT, 0x373a, 0x1c},
@@ -346,7 +346,7 @@ static struct ov2722_reg const ov2722_QVGA_30fps[] = {
 
 };
 
-static struct ov2722_reg const ov2722_480P_30fps[] = {
+static const struct ov2722_reg ov2722_480P_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x18},
 	{OV2722_8BIT, 0x373a, 0x3c},
@@ -455,7 +455,7 @@ static struct ov2722_reg const ov2722_480P_30fps[] = {
 	{OV2722_TOK_TERM, 0, 0},
 };
 
-static struct ov2722_reg const ov2722_VGA_30fps[] = {
+static const struct ov2722_reg ov2722_VGA_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x18},
 	{OV2722_8BIT, 0x373a, 0x3c},
@@ -565,7 +565,7 @@ static struct ov2722_reg const ov2722_VGA_30fps[] = {
 };
 #endif
 
-static struct ov2722_reg const ov2722_1632_1092_30fps[] = {
+static const struct ov2722_reg ov2722_1632_1092_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
 				a whole frame complete.(vblank) */
 	{OV2722_8BIT, 0x3718, 0x10},
@@ -667,7 +667,7 @@ static struct ov2722_reg const ov2722_1632_1092_30fps[] = {
 	{OV2722_TOK_TERM, 0, 0}
 };
 
-static struct ov2722_reg const ov2722_1452_1092_30fps[] = {
+static const struct ov2722_reg ov2722_1452_1092_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
 				a whole frame complete.(vblank) */
 	{OV2722_8BIT, 0x3718, 0x10},
@@ -769,7 +769,7 @@ static struct ov2722_reg const ov2722_1452_1092_30fps[] = {
 };
 
 #if 0
-static struct ov2722_reg const ov2722_1M3_30fps[] = {
+static const struct ov2722_reg ov2722_1M3_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x24},
 	{OV2722_8BIT, 0x373a, 0x60},
@@ -877,7 +877,7 @@ static struct ov2722_reg const ov2722_1M3_30fps[] = {
 };
 #endif
 
-static struct ov2722_reg const ov2722_1080p_30fps[] = {
+static const struct ov2722_reg ov2722_1080p_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for a whole
 					frame complete.(vblank) */
 	{OV2722_8BIT, 0x3718, 0x10},
@@ -983,7 +983,7 @@ static struct ov2722_reg const ov2722_1080p_30fps[] = {
 };
 
 #if 0 /* Currently unused */
-static struct ov2722_reg const ov2722_720p_30fps[] = {
+static const struct ov2722_reg ov2722_720p_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03},
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x24},
-- 
2.34.1

