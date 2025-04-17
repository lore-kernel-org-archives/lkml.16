Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941EE1B87D9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850748; cv=none; b=EfmXs7oYR4MGDufVGKUPWJGxgWUcptv/qHZ6Zbuq9UdTUCk1H2d3K1k2stoL6M31hiJrIzlhsphXb7jh9c/Iw6F5FHX9D5ZfKTjvop3L+0W3rbv2/i0wfHHmIJxYO5KAXyWX5Y+D9pIZ6gGMeRJteiN009nud+MEFO9E89w8ygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850748; c=relaxed/simple;
	bh=BfpNSRi1Uu/jpmaQIwRuJR7O8bLRmM8l//Nz8oq/Em0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEEU7Uo3oCEu9j9fgGBYtm/TT3dNOWKXTIbGKxgQHc8vj3XJF1M/LjDr9gWL/yzaSKfuHwc2xb5QCKhlumvhD93jfLA3u+jEjlocEcnLBLxpr6SsHbQxva0urigzhmBObADoYf8ZPT37trEjCgXdLOPb1UoCt2iR9sys8xnhzDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=kiloKIO+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="kiloKIO+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736b0c68092so150585b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850746; x=1745455546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAKFbJ92CSJHJrxPyaZfvAqvrH9/BDlLmlfyn2taFCM=;
        b=kiloKIO+0+hgp6PM5UZDNTiP+K9kCzEoX62eXPA0xLHKc8/qoHkykLNsx3+SeWK54S
         iVnrLawdNJVDJ8lp73CLs2yRU2ilV8Qx/RoSlYZ7kZmYpZ6Yb8dNGQn7AhWnxeRDb7oF
         3wTfxiJitSaLgavdUYTwPCvOOJ/sutHbYESvzA23Q5qUwsYgQ7nxtDJPghyU2RDZVdyv
         NtRmGlsqKNsdp96NoOZonYsJJR9WvTYVlHYbbBW1ifhBLbmv2N2+ekoHHhIGD6cBKAPH
         LRofmf1hC5X/nuuTBBJKvadHFIhWat22qnsThG5XbhPumWJxDGGl4qNUZOIEH18XazBJ
         Z+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850746; x=1745455546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAKFbJ92CSJHJrxPyaZfvAqvrH9/BDlLmlfyn2taFCM=;
        b=b50Osezws/UTfdlfm4nusBvkLunteMzgjxZBqWKq9qJIUNKvimrHYrVpwfi85FgWVX
         liO72OsNeGIVnj9hbKIHgIHf9X9+fqDN4t8ITBI96iyin6mz9kvuAHo9Ea7xlVk5KQAo
         CS0rl/M6sdlGonQ2lCmxDGXdmr7iXTC9HEDtpmwkcozHboFniSb09fmtEeZXkVZ4EFjR
         zGzG8YHTMqyvDr9jo6U7AT7bTVfcj4e9jYE13o2yZuQFiatZXHu75khVJZan9M0kZ/dk
         nlSB2bncuCnf11sEP6opDsHqNvmtqbh5ztdthplGnpM8mc0luYJBeRIRH7FMQI7N7L5A
         bVxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRmwhE7v2UqnXx+L578zp/svtPnjfPkEpfiVrRJV0VE2PdikVYauAiNpgjGa9fcBBFfmVtrfu7yRbWS7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEPt5wYLrEz8jHvkCYoRCDlAnM87L2HgoZAjqG5IdKF7lxAA6p
	+s17Sb4/v9/3GPiRDT7UltR76bMoR3P51Ijkv7fFqPcUy4TEbI5ZIJpl1eolCw==
X-Gm-Gg: ASbGncsqlFQAcSxeIRoKITDP7Z5QlI9ceGZU7uWG6ofRB/X47hrTUGl7wJLZIrH3Gwf
	S2plmnvUuO1fjjvqAhe3gSgBbKGeCB13mv98W2VqeMv3ayt+/b3iYr74mCMdBKKiEne1YT9RxFs
	XGIAAIqznmqX/MmqXVvoQqZXlEddjieH6rR93qH/y90obyOSfQZ36hJUuObU5wbJ6OxZom2o4VK
	T9RTpcN7Pady2JRRSCeLv13Pe4Km20aYpJJW8IKi3gSrGOP4Rb3fNyygk/CDPooOi0MGuUP9bw1
	A7Xtc58Am14EIuDr/w7KpvrxH9+qt4qGY82bTmUAyjFC6BAh3Qa7b5wXeWvtJ3oi2rbKPodLM2M
	EQHqXbA==
X-Google-Smtp-Source: AGHT+IFidBuGN0n+VIOG8CSLHLwCIO25lpQNbrmEyMabU9NWT6sPaBFaUtvwxsYr97qTiXyu8zpE5w==
X-Received: by 2002:aa7:9313:0:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-73c266e1782mr5325800b3a.6.1744850745872;
        Wed, 16 Apr 2025 17:45:45 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198b53sm11094153b3a.21.2025.04.16.17.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:45 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 07/14] staging: gpib: gpib_bitbang: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:26 +0000
Message-ID: <20250417004533.86765-8-matchstick@neverthere.org>
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
 drivers/staging/gpib/gpio/gpib_bitbang.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 443d739c7edf..0da718389182 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -325,7 +325,7 @@ static void set_data_lines(u8 byte);
 static u8 get_data_lines(void);
 static void set_data_lines_input(void);
 static void set_data_lines_output(void);
-static inline int check_for_eos(struct bb_priv *priv, uint8_t byte);
+static inline int check_for_eos(struct bb_priv *priv, u8 byte);
 static void set_atn(struct gpib_board *board, int atn_asserted);
 
 static inline void SET_DIR_WRITE(struct bb_priv *priv);
@@ -354,7 +354,7 @@ static char printable(char x)
  *									   *
  ***************************************************************************/
 
-static int bb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int bb_read(struct gpib_board *board, u8 *buffer, size_t length,
 		   int *end, size_t *bytes_read)
 {
 	struct bb_priv *priv = board->private_data;
@@ -492,7 +492,7 @@ static irqreturn_t bb_DAV_interrupt(int irq, void *arg)
  *									   *
  ***************************************************************************/
 
-static int bb_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int bb_write(struct gpib_board *board, u8 *buffer, size_t length,
 		    int send_eoi, size_t *bytes_written)
 {
 	unsigned long flags;
@@ -729,7 +729,7 @@ static irqreturn_t bb_SRQ_interrupt(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int bb_command(struct gpib_board *board, uint8_t *buffer,
+static int bb_command(struct gpib_board *board, u8 *buffer,
 		      size_t length, size_t *bytes_written)
 {
 	size_t ret;
@@ -921,7 +921,7 @@ static void bb_remote_enable(struct gpib_board *board, int enable)
 	}
 }
 
-static int bb_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int bb_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct bb_priv *priv = board->private_data;
 
@@ -988,12 +988,12 @@ static int bb_secondary_address(struct gpib_board *board, unsigned int address,
 	return 0;
 }
 
-static int bb_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int bb_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	return -ENOENT;
 }
 
-static void bb_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void bb_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 }
 
@@ -1001,11 +1001,11 @@ static void bb_parallel_poll_response(struct gpib_board *board, int ist)
 {
 }
 
-static void bb_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void bb_serial_poll_response(struct gpib_board *board, u8 status)
 {
 }
 
-static uint8_t bb_serial_poll_status(struct gpib_board *board)
+static u8 bb_serial_poll_status(struct gpib_board *board)
 {
 	return 0; // -ENOENT;
 }
@@ -1366,7 +1366,7 @@ inline long usec_diff(struct timespec64 *a, struct timespec64 *b)
 		(a->tv_nsec - b->tv_nsec) / 1000);
 }
 
-static inline int check_for_eos(struct bb_priv *priv, uint8_t byte)
+static inline int check_for_eos(struct bb_priv *priv, u8 byte)
 {
 	if (priv->eos_check)
 		return 0;
-- 
2.43.0

