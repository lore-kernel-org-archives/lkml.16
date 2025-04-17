Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7395819F13B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850745; cv=none; b=KT8gV2/ePOZp7Bv7M576dcazf2eqH+HY1DYs+yc4CLTGbepykLHPbPwbbLi2v1Dg41GH2eUq3iGHQw+00Kktlv4a601fM08MgStqHhMBDC8s0h0nUAO6nFt54Kc2hWbL1Fj+a1hQ6gLNRp+xWRris2/pH+ys2BJjz5Rve8s+JM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850745; c=relaxed/simple;
	bh=QqdmVMBjXXestRT/55c3oFFTQMW4oNH6hU5VCPGmLuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8UWPbLsGw+trLl5DjTYaOj+DY9JMN3ocjmZYKrrKhWRtuKlbg4F3Oh0yN6pxVQ5vminWweS5zydNXpirAGgRGcELeloGEVVkCtSnYViaF0iGy9bMXogvLKARZCrDbljVPfDbvV7iQUP3mdHRNiXZuvrtnxVonUCLcCBu+tHwhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=lBEIOzP4; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="lBEIOzP4"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso135858a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850742; x=1745455542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egaRPgkryN6OirBXQ08+dhGZADpQp/3XvoNDYXE4JHk=;
        b=lBEIOzP4PKCDmrpp/3ZhRKTymMUY1V1wQ/xdYzegSXzzzPvucHmcgr9XIJTbGl8S5/
         9prTRWz8U/VI16e1JNd+5JaJax4+yPw4QDQuSQrU3HdxbM+vBS4qB67z4IjowbJv0TGM
         o0oaQ+MnBEKU9CKm1G9AcxvArvPi9ptqAwm4JJrk3AghP66MwM/r3aPlCSgSMRzAlZz1
         fS6Oi8xc18v4P1/4YNpZDyA1gI+XWmUnd8ZRih8sNds8LhSARRPyuE4th6BhZpItBP3x
         tvuFGNY8ns6MBz64SSfA4ICp51qXsH4qtHGoCsDsJUfV9tne8F4mKungnu5YfGUzWxJx
         i4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850742; x=1745455542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egaRPgkryN6OirBXQ08+dhGZADpQp/3XvoNDYXE4JHk=;
        b=uN2YSHp8Ruz7s4aCMDSOWPO33EUHxx3HW7k1VfgQFkKBEepKaKrkJDmcAg+LhSD+H5
         DHKK/GNCCP+ExT2B00tNWTbbAnA4G7E3nBOVY9SeJT9sSoHPtYIu5PWEPdFCyRP00cWF
         Rf9KiqWA6Ya9faB9hH2Kh2K18K6XMvbXkdkIR4YGmQDIUid6FMRqCAqeuQNcPtzvI0HE
         DZm83gm56wAZPznOkqCP2t7nrB3rxi2btRcWRiF+7n9CySwImIiwDzHhyg/XxBxjrHCT
         ZHWhfr6wqAV14oDXEfpddm+NPvHSfA4I3StQ4hsMJI4WNme8HCytBoVQ00EFuBhyIYqd
         S1xg==
X-Forwarded-Encrypted: i=1; AJvYcCUySdj9GQt8SUMsOJZR9N70lsJ9abUqdahk8haey3VSneUDU4cOxDjRel+b+9BPXJbkwAPcR/yxGoXtD38=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjAq+abaVAT6eKvr/6tKXvZ8OS/GDjug8KYIpV6uMpM6TXs12s
	pIgClxnGMUcPe1D+Lc1DLTYIfyNrkN5zdCIybBhUyYyt6qEbz/LBS8JVWmQxHw==
X-Gm-Gg: ASbGnctxkKZ9K1eBCl0RaeqYfSqfkv8gKJPko4VHFHi198IezCHRjAHI+5kwTwxm4Ce
	p/b/69agPTwMfhlAHeUFt5PJcT0ueHZi5bJnzKfcaEfL79VzuQs8Eiv4X/6NO2eNB6+B+Cdzzt3
	X/WzhNNpw6B7iGADwE5Df4PH1zzAk/Vm+M5HnzUKKcwjtkfur/Ss23NHYAHb3Jp6n2tpsLXP3AW
	3MbMZ4/EhBo7cYaljetoqwz8Ze6T5oEvyHSqelzecuietbXHrXduCRdqo7bPrjLbcRl7jee4i7D
	DgPaPhr24bCTQ/qlDOtQlzX/xueUShMrzayFHCSCj7Z5wk/8qmnKUAV03UiwPJp/th+6Nk3G4Fa
	aKZ8ysw==
X-Google-Smtp-Source: AGHT+IGuVcnz7+jXBqgLq07oqsDUI4UA6qz+jFAUX9R+nmD0RiWXV8pcR7xhwsWukjR3XaIYG8fMJA==
X-Received: by 2002:a17:90b:3c0c:b0:2fe:7fea:ca34 with SMTP id 98e67ed59e1d1-308641725d2mr4923711a91.32.1744850742509;
        Wed, 16 Apr 2025 17:45:42 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611ef37asm2310367a91.11.2025.04.16.17.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:42 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 04/14] staging: gpib: agilent_82357a: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:23 +0000
Message-ID: <20250417004533.86765-5-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
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
index 9e41fe611264..4728ec85caa8 100644
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
@@ -536,7 +536,7 @@ static int agilent_82357a_read(struct gpib_board *board, uint8_t *buffer, size_t
 }
 
 static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
-					    uint8_t *buffer, size_t length,
+					    u8 *buffer, size_t length,
 					    int send_commands, int send_eoi,
 					    size_t *bytes_written)
 {
@@ -676,13 +676,13 @@ static ssize_t agilent_82357a_generic_write(struct gpib_board *board,
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
@@ -834,7 +834,7 @@ static void agilent_82357a_remote_enable(struct gpib_board *board, int enable)
 	return;// 0;
 }
 
-static int agilent_82357a_enable_eos(struct gpib_board *board, uint8_t eos_byte,
+static int agilent_82357a_enable_eos(struct gpib_board *board, u8 eos_byte,
 				     int compare_8_bits)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
@@ -948,7 +948,7 @@ static int agilent_82357a_secondary_address(struct gpib_board *board,
 	return 0;
 }
 
-static int agilent_82357a_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int agilent_82357a_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
 	struct usb_device *usb_dev;
@@ -990,7 +990,7 @@ static int agilent_82357a_parallel_poll(struct gpib_board *board, uint8_t *resul
 	return 0;
 }
 
-static void agilent_82357a_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void agilent_82357a_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	//board can only be system controller
 	return;// 0;
@@ -1002,13 +1002,13 @@ static void agilent_82357a_parallel_poll_response(struct gpib_board *board, int
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

