Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310827BF6E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222212; cv=none; b=XRnuDE5SMfizMUEXvljnx+H7uG511RPFgnqlBxEwRlphyzOm4niuyDIum9HYNOWhbI5xo8ed4lJHHDOIHC5zEcTlPSHDV4R+Fx51DfCgINsELJMc2+vdh83GHm1E3p+oO0IcGI0wlWxy0r5QAaSmDkEDTNBY8NtuhoS4BLbTi/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222212; c=relaxed/simple;
	bh=Z/9PFyrUgpPd5rVWjXXudWLnGwRK1lzpWznXRZ2vt5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InGmzHShxAeoiereG4zqFi2YreeCJY+dpVDL8SFbl61TqFWo0nYU847D8k9YALxXFf+Gt2VMHU4H84xzVg6z4OOV4PFVdoMah1egsClxMzZoO8h0f5MAjoGmWPl+bm+H7BmthkZ4vnVytjZJ5OPJifYSaPNhm838lxujIrU0csw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=dt3AJH9q; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="dt3AJH9q"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22580c9ee0aso79123085ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222210; x=1744827010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqFta0OAs/A1Mf1ccmkajj8vrVujNWivC2RzSA3YSm8=;
        b=dt3AJH9qe/5bpoPYozmYRhFCzOI7+PzgCgpvXyJjM37pLKDwFm/ULRYp44nNiyVMPU
         HvXE1BWXqG0kfjCp6e2GlAlLPdp9CUeW+9fGmcVUWJOnGm7XUg2/uCGnJfS0UI9GA8zO
         B3EMg95eCdCDdtFlrtXhDEUWMGBEcqzYcjyqy3Hd40Ol7dDR+s1t0LVwgtzxaGCKXSCq
         tTH/TzK3zfvXzTqakW9fex2qydeZjfqnXktEoiPxmClmhWDIoGQoJJFCI6ONhN8D5uwX
         xb5HZv6WSUUJk4ojVIti6TOAElUoWGHPrhpreB1LjOQI6jCmnieEqaAlvFg/mxhVExno
         Q7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222210; x=1744827010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqFta0OAs/A1Mf1ccmkajj8vrVujNWivC2RzSA3YSm8=;
        b=alVgzOC832NjsRDoahRxb442sT8iY70aZ8pLPWcJeTMMnGwkmer+9IzaZtM73R2W4G
         WPQ4ow3FtUNMyOGMIyVuKA4oKT8EuGh6skianfbSDrdfEJHMW7h1xpwGqIT9t6RhtHVo
         mgGqUNP94cwAm/guA5gHA+0je7NEoilAFaOskUmffx+zkRgzTdWmbkK8urdJ+H2JCQGr
         l9WtpZ7Kxi7zn3bcp4wt7ZTmu5Mf9ECw/Yy0QX0LwaEc30dV+tI3yDZrnRwZ1Q8k1esf
         irXPmlttvND8cjrkQ3QJkcaezM9EJrxiUOOSBT1nSVeYZxOZDV249zD4jCWCtil5ort5
         AHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrTr9tmUT7H9jFZ/VtCptTw+pl6FDFH14XEi+Si6aKEQDOaG4ZkaP+x1GDUANOGP+VXf9bRMU7yHWMw3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP3ccYXvzIpSliKiRKmdHoomRHe6T9exF/ZlRXqKD7BC2SGPYa
	bVf0216mq1/AUSE/zHMBXp+l+B+Tz7AVgD0N9XUyb+IQi8TRgAXc7r1oC0E19w==
X-Gm-Gg: ASbGncsbOdugt1iGW0TSjJDIQ7OVCxqA/QS/OI/RlNwLl6+LfzS6hDUtpqaDdTco8fC
	tbVNgKJgRIXH9N1b5aiOKMAmmrtE8qz1DiM2zwmXx0BBknStph502ZBckoBl+AjMAsdItDXfQ+A
	ThO0HrjHAUTtySe5hudgKYXXMgqHLvP0xMPXIi+tqHWzVxx9rKfUMjTmteqdvSFa6nyTfbRNVGq
	gG4G6TrCYUFx32i4i5Vv2b7Yuu+HkUXX/NJlz6oYjCFYrI5Lm9kCL95w2sYqGHHU9uflhLXa+UK
	li78GkjmOlzENLlsW0TDlSZkoNjpLTQO1XiJyM4mkf820+XTB0GkLhH9aZgPbAr6gbG5Q9w/eFr
	a0/1oRg==
X-Google-Smtp-Source: AGHT+IFLyv9CmUbEcdfnl8fz4Fmbrxb1KZDGtW3HewJTA/yvxwPhPX1jbaV/s6Q9U8fXSvOEWj/oMA==
X-Received: by 2002:a17:903:1ce:b0:220:e392:c73 with SMTP id d9443c01a7336-22ac29bf75emr45048045ad.22.1744222209974;
        Wed, 09 Apr 2025 11:10:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b2b6sm15146145ad.65.2025.04.09.11.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 12/23] staging: gpib: agilent_82350b: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:42 +0000
Message-ID: <20250409180953.398686-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 .../gpib/agilent_82350b/agilent_82350b.c      | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 901f7182502b..ce9c88a2b9f5 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -27,10 +27,10 @@ MODULE_DESCRIPTION("GPIB driver for Agilent 82350b");
 static int read_transfer_counter(struct agilent_82350b_priv *a_priv);
 static unsigned short read_and_clear_event_status(struct gpib_board *board);
 static void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count);
-static int agilent_82350b_write(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_write(struct gpib_board *board, u8 *buffer,
 				size_t length, int send_eoi, size_t *bytes_written);
 
-static int agilent_82350b_accel_read(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_accel_read(struct gpib_board *board, u8 *buffer,
 				     size_t length, int *end, size_t *bytes_read)
 
 {
@@ -145,7 +145,7 @@ static int translate_wait_return_value(struct gpib_board *board, int retval)
 	return 0;
 }
 
-static int agilent_82350b_accel_write(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_accel_write(struct gpib_board *board, u8 *buffer,
 				      size_t length, int send_eoi,
 				      size_t *bytes_written)
 {
@@ -297,7 +297,7 @@ static void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count)
 }
 
 // wrappers for interface functions
-static int agilent_82350b_read(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_read(struct gpib_board *board, u8 *buffer,
 			       size_t length, int *end, size_t *bytes_read)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -305,7 +305,7 @@ static int agilent_82350b_read(struct gpib_board *board, uint8_t *buffer,
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int agilent_82350b_write(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_write(struct gpib_board *board, u8 *buffer,
 				size_t length, int send_eoi, size_t *bytes_written)
 
 {
@@ -314,7 +314,7 @@ static int agilent_82350b_write(struct gpib_board *board, uint8_t *buffer,
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int agilent_82350b_command(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82350b_command(struct gpib_board *board, u8 *buffer,
 				  size_t length, size_t *bytes_written)
 
 {
@@ -373,7 +373,7 @@ static void agilent_82350b_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int agilent_82350b_enable_eos(struct gpib_board *board, uint8_t eos_byte,
+static int agilent_82350b_enable_eos(struct gpib_board *board, u8 eos_byte,
 				     int compare_8_bits)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -412,7 +412,7 @@ static int agilent_82350b_secondary_address(struct gpib_board *board,
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-static int agilent_82350b_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int agilent_82350b_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
@@ -420,7 +420,7 @@ static int agilent_82350b_parallel_poll(struct gpib_board *board, uint8_t *resul
 }
 
 static void agilent_82350b_parallel_poll_configure(struct gpib_board *board,
-						   uint8_t config)
+						   u8 config)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
@@ -434,14 +434,14 @@ static void agilent_82350b_parallel_poll_response(struct gpib_board *board, int
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-static void agilent_82350b_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void agilent_82350b_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	tms9914_serial_poll_response(board, &priv->tms9914_priv, status);
 }
 
-static uint8_t agilent_82350b_serial_poll_status(struct gpib_board *board)
+static u8 agilent_82350b_serial_poll_status(struct gpib_board *board)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
-- 
2.43.0

