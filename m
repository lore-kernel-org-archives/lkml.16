Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AB01D7998
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850751; cv=none; b=WaNy+q7CzM3oG/bSN9bOHBt4KeU72UtBeNE8fP5MaAoGZdNZ3fj86CX9L1SQ4CmgjP7HExnv0MYCoz2KC5e/AdHGScOPfEI1RwDAziFAIXfutB6A0ybhTXta1Y9XdZDxQAwdVNukiikg6jL/4FxdbRhum3QiZqFmdBS2iUAgMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850751; c=relaxed/simple;
	bh=dINICUlUQwKCLuaYFcvZQj0ckrAk0FXSLsUGERu4iAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/tEDVTJINPdCnxMM9iFnjGVw836Vkj/mo8jdDk/g4dO4Ky6kAwjkFq4W/JyVptIbihFnSDdX3V9R4qgDiW/7DZsvsSk/z4b2T521emt2ghxHoos5tORX+Quh4lSHnakNE68G9IpUQdfS3j5HnjX/mdbFM+95tfUJCVuM7FtF2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Dv+qy+vT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Dv+qy+vT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2295d78b433so2519425ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850749; x=1745455549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHmTXYndf5bH9FTsR78jW+NBjJBfXqdxCg1p2ihtcws=;
        b=Dv+qy+vTjx4vXPQyI69P+h6k6wBEb1jmpTAFIqJu7FA6tmicnW16IMzk8YCxpF5zg7
         ar/Y6mVoTGsTuw6f/jzZYwo1EisvgRTSDbdHmGRv7wbG7GRfXZEWv1U1UaSaQ6+AsDKZ
         AHX8nQJSBqM55pQHv1Xqku81Y8t+Fe5KvZJ8Fk4S8rNUw3oAiEy4TixVeHqIlh6zkV6L
         LjDYNBpJ9n+SI03OcQ3xljKRepzf+O7mSe8qVlbIQo1BXgYIQ7XlwVtaBovp/oVTs3U2
         VautymzqkbZyGovyqqvuCcCgS0Y83Y5/Mi7h8Xyj0zsuGHb2pbTHTnsIok0N7O5Ykjye
         5I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850749; x=1745455549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHmTXYndf5bH9FTsR78jW+NBjJBfXqdxCg1p2ihtcws=;
        b=XAg6B92J+ah6N+Y6DcBRBoP0HS3hVmZtpZ4mXt3xdNj32OWIt4GkHklAzvRK5leI8y
         rBm4v1lhJ9VQ1Fd7cHjcPUEj2kg/qO11S/yTNYbFbQD/hl8M11Np+y6idHftx+iZhLGw
         5HCJD0A7R7HkMSLEH5MbiPbck9+tUzQ+FkzKFKXU9RaQDtLD2w3TLDCWKvwMkZVFym03
         YwNHstZ8NmNZK1IKaWzmWFBhZ+WM/q8v2H9JH8AnVUiH1cperxaICz0fhMzS682nn45D
         asCzbyPmqFSPCkUrBw81sNNJQmlZJM/UT6aQaas33osE5UqucM6gZmeA8LUEshYS6lRX
         EHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFz6mraXaXVMiCGSOoS9JdsHQVWOgNBGMaNDujk5mNUkAAa0SXXbHpYB/dGOQJZOkUYFo5OP//77ejNtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGIwn8S5rs8GIKrD9ODSUPZeNLtCoL3Ksg42zb4bBobjWJJxa7
	TAU+1gDICuPkdbnt3TnK9hDYZ0JivFFT6F4ssoF9SaWTMmX8NOKDv1Fih9DBYaGKT5z3J5A77CM
	=
X-Gm-Gg: ASbGncsPnW2PzARN8O+yxiuhZNOSfrCh/4jZMPZTqgRpORokBVN5LmTI0TLt9igwA3/
	VT74sCl9RhLRlDGbW8RpteIl0Cr1kxK/NF5kTqGJouEja57Eql+oc95PiPjvB5YljQKi7oHis/4
	EQPcO8JGlJn0hytlijN2dWY/CyY47MjsP/sVWNyS2Dowc+RWlphgiipgM5KshQVHlgrJ6uJ7LQo
	DQBDRfpQNwQE8E1DeqI8AkppmN7imsDtiycWCUiZHefsIdDx7scq4tFyvIGzXOz/+mCYSKSklYp
	n/o8scmZ15e2oa3vDGM/fNwQv10UdqM2rsWmIpQcdUKxSIjLeMoJLHH0a0Eei9H4pNqCXMMiEM4
	n3wIeoQ==
X-Google-Smtp-Source: AGHT+IH3MhM2hoTiTH/u/6kjUD6KKHoQAem6f3XGNiye6KYVHV/o9gvD0bLkEkhVvZBAs7yhcOL7Lw==
X-Received: by 2002:a17:902:e54b:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22c358c616amr40273245ad.6.1744850749436;
        Wed, 16 Apr 2025 17:45:49 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33faa307sm20904095ad.136.2025.04.16.17.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:49 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 10/14] staging: gpib: ni_usb: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:29 +0000
Message-ID: <20250417004533.86765-11-matchstick@neverthere.org>
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
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index a3d517efca08..d5b281fa8b37 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -589,7 +589,7 @@ static int ni_usb_write_registers(struct ni_usb_priv *ni_priv,
 }
 
 // interface functions
-static int ni_usb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_read(struct gpib_board *board, u8 *buffer, size_t length,
 		       int *end, size_t *bytes_read)
 {
 	int retval, parse_retval;
@@ -720,7 +720,7 @@ static int ni_usb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 	return retval;
 }
 
-static int ni_usb_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_write(struct gpib_board *board, u8 *buffer, size_t length,
 			int send_eoi, size_t *bytes_written)
 {
 	int retval;
@@ -824,7 +824,7 @@ static int ni_usb_write(struct gpib_board *board, uint8_t *buffer, size_t length
 	return retval;
 }
 
-static int ni_usb_command_chunk(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_command_chunk(struct gpib_board *board, u8 *buffer, size_t length,
 				size_t *command_bytes_written)
 {
 	int retval;
@@ -918,7 +918,7 @@ static int ni_usb_command_chunk(struct gpib_board *board, uint8_t *buffer, size_
 	return 0;
 }
 
-static int ni_usb_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_command(struct gpib_board *board, u8 *buffer, size_t length,
 			  size_t *bytes_written)
 {
 	size_t count;
@@ -1182,7 +1182,7 @@ static void ni_usb_remote_enable(struct gpib_board *board, int enable)
 	return;// 0;
 }
 
-static int ni_usb_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int ni_usb_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct ni_usb_priv *ni_priv = board->private_data;
 
@@ -1341,7 +1341,7 @@ static int ni_usb_secondary_address(struct gpib_board *board, unsigned int addre
 	return 0;
 }
 
-static int ni_usb_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int ni_usb_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1396,7 +1396,7 @@ static int ni_usb_parallel_poll(struct gpib_board *board, uint8_t *result)
 	return retval;
 }
 
-static void ni_usb_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void ni_usb_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1474,7 +1474,7 @@ static void ni_usb_serial_poll_response(struct gpib_board *board, u8 status)
 	return;// 0;
 }
 
-static uint8_t ni_usb_serial_poll_status(struct gpib_board *board)
+static u8 ni_usb_serial_poll_status(struct gpib_board *board)
 {
 	return 0;
 }
-- 
2.43.0

