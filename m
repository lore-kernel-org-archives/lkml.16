Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6335427CCC2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222223; cv=none; b=Uxh2F+9TU3DOpCl7L523l4HTw1ewn7ViN0xNoLAFtV8xTrZritLTyq4PPFRyzt9m+wG02gu79JT1/J4Buh5r+02PkZiD4cgk/FS4eiXJ0H1d0bjwGVJ6DK0qDeU8gF/iMNcuHJ0Jfp0oot/nDE2TpVCJk5EiheGXBm9P5XNEWOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222223; c=relaxed/simple;
	bh=08lB9GyRHBGmZQCvI9HEFhzNGWlz+5lYaEIrjpHi2do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gt9r0TGL4fDoCM3mhleeZOVqjGKms7VXZpuEuwu9KtnMhYjRtxsK6dUnr4OPjpFGKeExqHaYgppHYcbgH53UiJVO+ObANu6G025n+bHN5B56WQJ1kQ7AaY68fJY2jIxJySZJNqedHRxrggBTZpXs2gmG9hZBZDj43/dXh4EyoW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=kK8YHF6X; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="kK8YHF6X"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22409077c06so89012155ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222220; x=1744827020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5nuAWwtCCEE0RLHSK/NdiSGSSc8eLrbi7Ma/Uk/fz4=;
        b=kK8YHF6XzYw8qMiGShXIHPUMqFPi47SZUVgAbbcJtfN6Xnj4ILTVRXHIUcQUKlX1ZV
         mZXKxoUzjqgHu2Ohzvhw6Ie6z+fEWlFLBESsMmlXHIFI/zNpOGitFfaDWJAf5IcnUv07
         nsf3fRf3slI+WvKDT+bk1RRD9OL2MQnE/bpUJvmk6Dzr87A9+iL12+Gy4yKfnuKhvl7j
         wJ30TtuncYyrbelHBSsRIDXUUZH0F05BojxGA3OfMm28PAe0SJKCM0QFhfZGcnsD8s8H
         4lrwU8fUV0q+5gqPdZC/y53N1Ifhqw4d35kwjnRYC6/uZecFpswsHXI0OIcXXW2WVlMW
         eNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222220; x=1744827020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5nuAWwtCCEE0RLHSK/NdiSGSSc8eLrbi7Ma/Uk/fz4=;
        b=NinFfS+ezqdpHucjF5f82/MmEKufIsGQRC/d0ARG1tanXV8wKnRIh3KcJvNypNg8TZ
         S+JG29qg3LJwn4Oo9FtCzGbAVfTXnmqWGbQk953oPrSeX3NXbXIFALNKpckq/N/u74mk
         trV532hJYz15IaVaxH7AhLJIOvTvgKDeZBe4RSxQEkj9lybNFpPtENzY7oU7cCX/CiCp
         IHxFfQ2NO9RGib4HtJxB8Lq093NHFhe1TfDuqyzlNqYUaAq8fzZ+vOSU7gc6TLgQoICl
         9acZtyfK4yX2cisXcNUyEIkDLoXb0giXWbhTKeivcFzyDLzXhQz/NNa8lBpgt8yMVeIy
         zyKw==
X-Forwarded-Encrypted: i=1; AJvYcCWIUC+avc5g9RUuzqBJoqfH6J7IAfuY+h7JWddsuXI7MvncK0oBeSIurWGPHOlPOu14bYRSQlZ0DIrJ6pE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/z1ip5nTDWae/18Ado/kHt+LVQrhD6n8gS1lhNxrvmvqBtBa
	bPDwfc7HxH3LHRoehwgelFDsMCEuaQ+M6vnf1OExh67PbXHkN3jZ5qMb8gmdz5ul+iNJ4QgKOLo
	=
X-Gm-Gg: ASbGncvp6BJos58alaf+HFZz359LOT+U6Iv1Hj2zieOAYbDAYX1kTWgq8nNVtJOLA6h
	cKylhEzWqu83oQIINJgak6ctOGUQTht3DuX5bryKiD93w293ASKnNDqU8vu4Y0fl7i8sSZ05ha5
	Hvk6GQsRGX1zsbYRo2ZwWTaH3PZcEPNnQGmCkU0+J14ZOFBKaU4EW8szVfCps4mHEk4YsfXrY75
	12XpbFDf9Pwsz3GxK3TU2JdPPFN7G9cp6sRFCdIPXo5jNIRdqI7k77JyBJOnJStbHgV0dI2kYou
	Q3U70QkONWy+sipYqyiKb5uSc77QLNi4p+s08gerEmK7XA/mL/h1B6L/gaK8kNbRC1iQYWeenFU
	/TSS2gPOJR0qj0BBq
X-Google-Smtp-Source: AGHT+IG+rTI28/aurOt2DO10jR1QoV8by/6UPDQbjTQ6we9GJ4kSeKA6D9OJYaE856pmc42gXqGihA==
X-Received: by 2002:a17:902:d487:b0:223:377f:9795 with SMTP id d9443c01a7336-22ac2856deamr60799025ad.0.1744222219786;
        Wed, 09 Apr 2025 11:10:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e6b98csm1708532b3a.178.2025.04.09.11.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 20/23] staging: gpib: ni_usb: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:50 +0000
Message-ID: <20250409180953.398686-21-matchstick@neverthere.org>
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
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 990926664a20..97815dca97f8 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -586,7 +586,7 @@ static int ni_usb_write_registers(struct ni_usb_priv *ni_priv,
 }
 
 // interface functions
-static int ni_usb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_read(struct gpib_board *board, u8 *buffer, size_t length,
 		       int *end, size_t *bytes_read)
 {
 	int retval, parse_retval;
@@ -716,7 +716,7 @@ static int ni_usb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 	return retval;
 }
 
-static int ni_usb_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_write(struct gpib_board *board, u8 *buffer, size_t length,
 			int send_eoi, size_t *bytes_written)
 {
 	int retval;
@@ -819,7 +819,7 @@ static int ni_usb_write(struct gpib_board *board, uint8_t *buffer, size_t length
 	return retval;
 }
 
-static int ni_usb_command_chunk(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_command_chunk(struct gpib_board *board, u8 *buffer, size_t length,
 				size_t *command_bytes_written)
 {
 	int retval;
@@ -912,7 +912,7 @@ static int ni_usb_command_chunk(struct gpib_board *board, uint8_t *buffer, size_
 	return 0;
 }
 
-static int ni_usb_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_command(struct gpib_board *board, u8 *buffer, size_t length,
 			  size_t *bytes_written)
 {
 	size_t count;
@@ -1176,7 +1176,7 @@ static void ni_usb_remote_enable(struct gpib_board *board, int enable)
 	return;// 0;
 }
 
-static int ni_usb_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int ni_usb_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct ni_usb_priv *ni_priv = board->private_data;
 
@@ -1334,7 +1334,7 @@ static int ni_usb_secondary_address(struct gpib_board *board, unsigned int addre
 	return 0;
 }
 
-static int ni_usb_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int ni_usb_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1389,7 +1389,7 @@ static int ni_usb_parallel_poll(struct gpib_board *board, uint8_t *result)
 	return retval;
 }
 
-static void ni_usb_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void ni_usb_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1467,7 +1467,7 @@ static void ni_usb_serial_poll_response(struct gpib_board *board, u8 status)
 	return;// 0;
 }
 
-static uint8_t ni_usb_serial_poll_status(struct gpib_board *board)
+static u8 ni_usb_serial_poll_status(struct gpib_board *board)
 {
 	return 0;
 }
-- 
2.43.0

