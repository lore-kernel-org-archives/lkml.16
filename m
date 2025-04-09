Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4CE27BF99
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222215; cv=none; b=lnbp117o0a4rGU2OCtO+tveCcvLOhbCD5apUrKl4pqO1nlzR8RfoMLN8rKmuQBReVRM4IpipzZfXjL3mPzSDjzDBJAUrZWwdOyzi+r+xWEL6rDFy3W3HXQ9G5H9DT4n3tGwa/NH0tDNkKUf4YBbA56jtCOGW4iRHZ/7G0Mt1ZhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222215; c=relaxed/simple;
	bh=UF3Ph7GJtyTErF51igoxP/Xy5CQFL3IB/NvZ0MboohI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUKNEPi3LjNmDz4uQXdYTJLEy3CmO3JR1MOv0sPw3SIKd600fYXqrUgNz0usvZWWPKBMpXvXFIs7bejE6TWv2McIel06QZ7b2gb8+cmU0VH9NXDh2ioURBFGISdTYCw+O/7b++iPS8fqwV1UfAIJQr4MRsKPmTGBVuEs5bJEKEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=j8UrFnmT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="j8UrFnmT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223f4c06e9fso113065ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222211; x=1744827011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX8GXS+GtiD2xY/xkUPG2Y/uCTE9iFOvDsNI6cDVLP0=;
        b=j8UrFnmTVc+nMqiIEA/izOYLB1u/WziUvn6stwn3Dp9mAurQ2HGnju2UPte/v/tCtk
         1R+tf8dzfClqDIju2xrQVGfFjxthvnfnPUkAFMs4v2m3eh1GZEsevffRtSeKv4uiuG6L
         px9IP/UxV3f7+HAc7ploNyhcpG5td8uUsHNK09Uf3Jh2O778qxDl5juEv3582TC9bJ1F
         9UpIiL90bZ75i063TtLfbR3qlEg1GvHyUppiO1biO93H7NvoXSyrvv4XOn2Cg2tGR/7v
         4Eo6FhThG2ipa3TmDEJr8f3NjLyQE8i4O7FdzNIeqWenipeMKGVsbzLZacytGkAVWN5o
         wtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222211; x=1744827011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lX8GXS+GtiD2xY/xkUPG2Y/uCTE9iFOvDsNI6cDVLP0=;
        b=Ng1X9PZM429sfoLoLwbli+7MU4J3TsFPeWXa38qCjjvQZY89BM3aj4Q+/qyz5z20/h
         WuJsimy3q3BzBA8qtzoBC5hJZYwyACDaj78FpZza12mFuM/aRCcvgZVPDyVfusJT9ZFs
         0kd8i6HDIs/MRl4bFLTd7NCGJ6EnHMNIpp9hG342B+Md5d7QydKt89mNZLP1s36ESYoa
         Nu/YQqz8cikPBxdKpoIu1LdLzzCadJpYj8IEO+hCqLTN7bqBlgqjr79u8GG+xD8aq0xw
         6CrI5qQk8vUNrp5gHOOopkkt3Sl0vT9D4FBoi1k79eH9kGQkALne/gOkuThQzZi431Pe
         /D/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDGGheXuOHkjYLWqLDeFIVNkZUsg6TuhLmJJsfYqtnguVrmc1JDpYMv6OEAfhSSRDL674UMLaQg0ClICQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKOF5dxY0w2PjIfsV6cc8sK5mcmjecjolG3CajdR0djMxeEaeC
	5Y4lDs09NfsMHt/UnBUKh4ABT2qE+xdw9CzKOlV5O9IG6ObQWNoAjb1AWJJ+Ng==
X-Gm-Gg: ASbGncsJcYQSIizgYD0oXFF6muR4X43lFG//PYgvCI9hiLk5+WTbWiR3gN820S6vCDv
	hEhMzdC9/R4WgdRvucMNxF4bXkXxYDWpiwlNeAoBnl98jWTF/lBb0s38V7aIzvKVmcSGXVonDd2
	9/wNXkFvSj99JOn1hY/sFt29cdZbSFfJxQIuufEgnT8JNwUKa537QpPLJzmUAOtQXAyQXZZ+aWT
	pu2TmWnaq0/5WX4y+gNzKODBuyWtdTqFgO5xtD4HzlSGYkhTjJXWXDeJJKXGuEUSiV1KX67BKkO
	QsC3AznWy1aOkh7JfL9GhPNWp9RjMbGUn+a2mwcvWyKLXos30UDozonzsypvTKd73EPD+4JuI/D
	kamtA9xjcAgqxomNk
X-Google-Smtp-Source: AGHT+IGLPlZ9WeVKzKGO49wItqhrjqOOsFD5nfPhmYeckXxIffF7CpoWoEPGYXRK60Kll07h9yPdtA==
X-Received: by 2002:a17:902:e742:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22ad0208852mr5228345ad.16.1744222211279;
        Wed, 09 Apr 2025 11:10:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8aea0sm15231015ad.56.2025.04.09.11.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:11 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 13/23] staging: gpib: agilent_82357a: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:43 +0000
Message-ID: <20250409180953.398686-14-matchstick@neverthere.org>
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
 .../gpib/agilent_82357a/agilent_82357a.c      | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 3cf81a909a23..3d6e11ef465e 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -420,10 +420,10 @@ static int agilent_82357a_abort(struct agilent_82357a_priv *a_priv, int flush)
 }
 
 // interface functions
-int agilent_82357a_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+int agilent_82357a_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written);
 
-static int agilent_82357a_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int agilent_82357a_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			       size_t *nbytes)
 {
 	int retval;
@@ -535,7 +535,7 @@ static int agilent_82357a_read(struct gpib_board *board, uint8_t *buffer, size_t
 }
 
 static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
-					    uint8_t *buffer, size_t length,
+					    u8 *buffer, size_t length,
 					    int send_commands, int send_eoi,
 					    size_t *bytes_written)
 {
@@ -675,13 +675,13 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
 	return 0;
 }
 
-static int agilent_82357a_write(struct gpib_board *board, uint8_t *buffer,
+static int agilent_82357a_write(struct gpib_board *board, u8 *buffer,
 				size_t length, int send_eoi, size_t *bytes_written)
 {
 	return agilent_82357a_generic_write(board, buffer, length, 0, send_eoi, bytes_written);
 }
 
-int agilent_82357a_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+int agilent_82357a_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	return agilent_82357a_generic_write(board, buffer, length, 1, 0, bytes_written);
@@ -832,7 +832,7 @@ static void agilent_82357a_remote_enable(struct gpib_board *board, int enable)
 	return;// 0;
 }
 
-static int agilent_82357a_enable_eos(struct gpib_board *board, uint8_t eos_byte,
+static int agilent_82357a_enable_eos(struct gpib_board *board, u8 eos_byte,
 				     int compare_8_bits)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
@@ -946,7 +946,7 @@ static int agilent_82357a_secondary_address(struct gpib_board *board,
 	return 0;
 }
 
-static int agilent_82357a_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int agilent_82357a_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
 	struct usb_device *usb_dev;
@@ -988,7 +988,7 @@ static int agilent_82357a_parallel_poll(struct gpib_board *board, uint8_t *resul
 	return 0;
 }
 
-static void agilent_82357a_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void agilent_82357a_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	//board can only be system controller
 	return;// 0;
@@ -1000,13 +1000,13 @@ static void agilent_82357a_parallel_poll_response(struct gpib_board *board, int
 	return;// 0;
 }
 
-static void agilent_82357a_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void agilent_82357a_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	//board can only be system controller
 	return;// 0;
 }
 
-static uint8_t agilent_82357a_serial_poll_status(struct gpib_board *board)
+static u8 agilent_82357a_serial_poll_status(struct gpib_board *board)
 {
 	//board can only be system controller
 	return 0;
-- 
2.43.0

