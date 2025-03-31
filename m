Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA221A421
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432023; cv=none; b=iCALcFev0zVQJiR9BWztPigcqjrqnhRYaHzyQsbynVN47n53xcH3pvTC7QANezlelvPEaSThEONFkRLdVuh8WB/1W2Ljo1ZjbSbEz2Oont3bVWdAt3ttAXy0r2LchZvUCU2boUe0SaiO3loHjaD6wdp8+ORPgwcciVB/WAKtma0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432023; c=relaxed/simple;
	bh=IJb8IWCH9o7cFbW60ftPfq+fBkGSLQ5yaN0ANOqKhnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gUeDTQ5uqXUuDgjo+GCrgV8HhYDObaORa+BtiHGbJXfLdlCPDI6xhkMCi1zwzwuq0t++Df035fH924XVHkp4u9hpfGm7lunLcOFLkVKiPbrXgDB7FEe3MMmCsP0lwVluHUajs94ijf3tvQejU1hCZSG5t64clCfek/6J+W3Qi9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lG7RSRxY; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lG7RSRxY"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2c12b7af278so3429288fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743432020; x=1744036820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHv5BRMRChPy40yVuhjAifr6RZgJpamjXVQCNlH2TA4=;
        b=lG7RSRxYm8pejzrsCPx8T9O2e0BPWbRW1LKFGc+t7JcILC+Tmd3lCfXlbom8N+KhrI
         PSaXtvKsp+Mx5T22tnpUDX9IUa69mwg3bo6ExIrW/0B4rizXMafm57HjijmXd/FIKFgX
         MY35JE9qDcs22VGTZ54TKi2Bj0qm6OrrlR3EErDPFv5aTlBBzI+CnttucDrQyCFgs76E
         ZxWtKY/riXn3wpYRAp9Psc/+553/S6QXh5QFUXstt87YO3VXuaUSx3cuJraoBQtjRiWg
         e/c44ZyCGkqXZCfs6WjRgR0RtE76h6RKWOytGdxhEY87M30wWeKhvCjvEvQ/jWk8rJy+
         3sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743432020; x=1744036820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHv5BRMRChPy40yVuhjAifr6RZgJpamjXVQCNlH2TA4=;
        b=TXlQqt4MuS8uH5m+oBEJDrbtC1tWciqnOdQ6bMmUDJWgmyRUbl9u34LuU+qwAMlOF/
         +PjMajCrHonjZ758HwSyI6i7eb7v61dfKs12k9i8G3G5/PMbH/dbuDPlErBhBZ3Vn0yO
         7+BFTyouiivxp7jR+EKJLP7rC7cf4Xp216gHIt9q5+0mD92fkM1HEZ4Rz+J12GF/Ed0u
         MHQxYw70ii316oI2lUxQCZVkqnwF2mtMRkXBRXeYrGDu5NNBZIMNJEu6lvmYWxknSJpv
         IPdHlIcveqCycAxZZkethFydcHjeGUZPlYRafd84q7LiOxlM5LMd8oU9uBe6c8s84lY5
         IjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtjuGZENl18WfY8gmAeI9ToXm890JpV6igrYO81ZGW8IQnyhwcqu4zJWtQ8qZLo4RtufiW93hU9R5wmrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCxUFhQ/wRqGc3HBVDnTleOuK4zzGJo7bWbIhLyYjlw/UlAcs
	uUBBxY6mXDfD9G2kOL7hWbayced7IhGKuTM3Rf2RiRwuLeTwWRQTdNa53O3rxz0=
X-Gm-Gg: ASbGncvN4VDszU5sjdsz69K9P4mBGOhJVt7o92sl2K4TUp7cKkd8mGnMcW/43PuXJuj
	4pVapiYspcxt9Ykrg+7N3hnTIPPa1/3v3cpwygWxIYUmBrapdVvT3uB6RRvA670FgBiw5tTjaSs
	b6OPsVijk5RM4xx3M3IfCeTr8/ciWz4VB9FA2ZbCtA7vHJrTORmMaKSxAWFV/GCKbra6xM+y81B
	+Qgp3ZAgm6iBa0mUU3a7CCEPaMxU0h3Lp1uCX5++ZAD6Dxoa0pH9prbniI6iSxjx6M6ZxtKdvpI
	i6kCKioNwl2aRz5fzYAzDFkkZcQ+wCQnUpMQGuYbg4LoIfh3sY1iljI8vsKfLUu6wlRK8uzMncC
	AsyWsIQQyYwJrzO3HvA==
X-Google-Smtp-Source: AGHT+IHA/1NWbtUkfdausmZBFXSAXODHJ10jZDPawbK/nIXnCUx8JEy+nHTTdithVyu6UC/FipDzXw==
X-Received: by 2002:a05:6870:2215:b0:2c2:1c01:c111 with SMTP id 586e51a60fabf-2cbcdc58fbdmr5366834fac.2.1743432019867;
        Mon, 31 Mar 2025 07:40:19 -0700 (PDT)
Received: from fedora.lan (syn-024-180-056-250.res.spectrum.com. [24.180.56.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a3f3710sm1848707fac.2.2025.03.31.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 07:40:19 -0700 (PDT)
From: Joseph Friend <josephangelfriend1@gmail.com>
To: dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Friend <josephangelfriend1@gmail.com>
Subject: [PATCH] staging: gpib: Fixed comments and misaligned code
Date: Mon, 31 Mar 2025 07:39:41 -0700
Message-ID: <20250331143941.758600-1-josephangelfriend1@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed style issues for gpib_bitbang.c on comments.
  for usage of "//" instead of "/* */"
  and for multi-line comments

Fixed misaligned macro backslashes and comments.

Signed-off-by: Joseph Friend <josephangelfriend1@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 142 ++++++++++++-----------
 1 file changed, 72 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 86bdd381472a..b5de8d67b225 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -32,7 +32,8 @@
 #define ENABLE_IRQ(IRQ, TYPE) irq_set_irq_type(IRQ, TYPE)
 #define DISABLE_IRQ(IRQ) irq_set_irq_type(IRQ, IRQ_TYPE_NONE)
 
-/* Debug print levels:
+/*
+ * Debug print levels:
  *  0 = load/unload info and errors that make the driver fail;
  *  1 = + warnings for unforeseen events that may break the current
  *	 operation and lead to a timeout, but do not affect the
@@ -41,8 +42,8 @@
  *  3 = + trace of protocol codes;
  *  4 = + trace of interrupt operation.
  */
-#define dbg_printk(level, frm, ...)					\
-	do { if (debug >= (level))					\
+#define dbg_printk(level, frm, ...)					 \
+	do { if (debug >= (level))					 \
 			dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
 	while (0)
 
@@ -137,13 +138,13 @@ enum lines_t {
 
 DEFINE_LED_TRIGGER(ledtrig_gpib);
 #define ACT_LED_ON do {							\
-		if (ACT_LED)					\
+		if (ACT_LED)						\
 			gpiod_direction_output(ACT_LED, 1);		\
 		else							\
 			led_trigger_event(ledtrig_gpib, LED_FULL); }	\
 	while (0)
 #define ACT_LED_OFF do {						\
-		if (ACT_LED)					\
+		if (ACT_LED)						\
 			gpiod_direction_output(ACT_LED, 0);		\
 		else							\
 			led_trigger_event(ledtrig_gpib, LED_OFF); }	\
@@ -205,14 +206,14 @@ static int gpios_vector[] = {
 /* Lookup table for general GPIOs */
 
 static struct gpiod_lookup_table gpib_gpio_table_1 = {
-	// for bcm2835/6
-	.dev_id = "",	 // device id of board device
+	/* for bcm2835/6 */
+	.dev_id = "",	 /* device id of board device */
 	.table = {
-		GPIO_LOOKUP_IDX("GPIO_GCLK",  U16_MAX, NULL,  4, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO_GCLK",	  U16_MAX, NULL,  4, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO5",	  U16_MAX, NULL,  5, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO6",	  U16_MAX, NULL,  6, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("SPI_CE1_N",  U16_MAX, NULL,  7, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("SPI_CE0_N",  U16_MAX, NULL,  8, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("SPI_CE1_N",	  U16_MAX, NULL,  7, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("SPI_CE0_N",	  U16_MAX, NULL,  8, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("SPI_MISO",	  U16_MAX, NULL,  9, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("SPI_MOSI",	  U16_MAX, NULL, 10, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("SPI_SCLK",	  U16_MAX, NULL, 11, GPIO_ACTIVE_HIGH),
@@ -235,9 +236,9 @@ static struct gpiod_lookup_table gpib_gpio_table_1 = {
 };
 
 static struct gpiod_lookup_table gpib_gpio_table_0 = {
-	.dev_id = "",	 // device id of board device
+	.dev_id = "",	 /* device id of board device */
 	.table = {
-		// for bcm27xx based pis (b b+ 2b 3b 3b+ 4 5)
+		/* for bcm27xx based pis (b b+ 2b 3b 3b+ 4 5) */
 		GPIO_LOOKUP_IDX("GPIO4",  U16_MAX, NULL,  4, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO5",  U16_MAX, NULL,  5, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO6",  U16_MAX, NULL,  6, GPIO_ACTIVE_HIGH),
@@ -282,8 +283,8 @@ struct bb_priv {
 	int ndac_mode;	     /* nrfd interrupt mode 0/1 -> edge/levels */
 	int dav_tx;	     /* keep trace of DAV status while sending */
 	int dav_rx;	     /* keep trace of DAV status while receiving */
-	u8 eos;	     // eos character
-	short eos_flags;     // eos mode
+	u8 eos;		     /* eos character */
+	short eos_flags;     /* eos mode */
 	short eos_check;     /* eos check required in current operation ... */
 	short eos_check_8;   /* ... with byte comparison */
 	short eos_mask_7;    /* ... with 7 bit masked character */
@@ -302,7 +303,7 @@ struct bb_priv {
 	size_t w_cnt;
 	size_t length;
 	u8 *w_buf;
-	spinlock_t rw_lock; // protect mods to rw_lock
+	spinlock_t rw_lock; /* protect mods to rw_lock */
 	int phase;
 	int ndac_idle;
 	int ndac_seq;
@@ -383,7 +384,7 @@ static int bb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 	priv->dav_rx = 1;
 	ENABLE_IRQ(priv->irq_DAV, IRQ_TYPE_LEVEL_LOW);
 	priv->end_flag = 0;
-	gpiod_set_value(NRFD, 1); // ready for data
+	gpiod_set_value(NRFD, 1); /* ready for data */
 	priv->r_busy = 1;
 	priv->phase = 100;
 	spin_unlock_irqrestore(&priv->rw_lock, flags);
@@ -404,7 +405,7 @@ static int bb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 
 	DISABLE_IRQ(priv->irq_DAV);
 	spin_lock_irqsave(&priv->rw_lock, flags);
-	gpiod_set_value(NRFD, 0); // DIR_READ line state
+	gpiod_set_value(NRFD, 0); /* DIR_READ line state */
 	priv->r_busy = 0;
 	spin_unlock_irqrestore(&priv->rw_lock, flags);
 
@@ -460,21 +461,21 @@ static irqreturn_t bb_DAV_interrupt(int irq, void *arg)
 		   irq, val, board->status, priv->direction, priv->r_busy, priv->w_busy);
 
 	if (val == 0) {
-		gpiod_set_value(NRFD, 0); // not ready for data
+		gpiod_set_value(NRFD, 0); /* not ready for data */
 		priv->rbuf[priv->count++] = get_data_lines();
 		priv->end = !gpiod_get_value(EOI);
-		gpiod_set_value(NDAC, 1); // data accepted
+		gpiod_set_value(NDAC, 1); /* data accepted */
 		priv->end |= check_for_eos(priv, priv->rbuf[priv->count - 1]);
 		priv->end_flag = ((priv->count >= priv->request) || priv->end);
 		priv->phase = 210;
 	} else {
-		gpiod_set_value(NDAC, 0);	// data not accepted
+		gpiod_set_value(NDAC, 0);	/* data not accepted */
 		if (priv->end_flag) {
 			priv->r_busy = 0;
 			wake_up_interruptible(&board->wait);
 			priv->phase = 220;
 		} else {
-			gpiod_set_value(NRFD, 1);     // ready for data
+			gpiod_set_value(NRFD, 1);     /* ready for data */
 			priv->phase = 230;
 		}
 	}
@@ -560,8 +561,8 @@ static int bb_write(struct gpib_board *board, uint8_t *buffer, size_t length,
 
 	spin_lock_irqsave(&priv->rw_lock, flags);
 	priv->w_busy = 0;
-	gpiod_set_value(DAV, 1); // DIR_WRITE line state
-	gpiod_set_value(EOI, 1); // De-assert EOI (in case)
+	gpiod_set_value(DAV, 1); /* DIR_WRITE line state */
+	gpiod_set_value(EOI, 1); /* De-assert EOI (in case) */
 	spin_unlock_irqrestore(&priv->rw_lock, flags);
 
 write_end:
@@ -619,7 +620,7 @@ static irqreturn_t bb_NRFD_interrupt(int irq, void *arg)
 		goto nrfd_exit;
 	}
 
-	if (priv->atn_asserted && priv->w_cnt >= priv->length) { // test for end of transfer
+	if (priv->atn_asserted && priv->w_cnt >= priv->length) { /* test for end of transfer */
 		priv->write_done = 1;
 		priv->w_busy = 0;
 		wake_up_interruptible(&board->wait);
@@ -628,14 +629,14 @@ static irqreturn_t bb_NRFD_interrupt(int irq, void *arg)
 
 	dbg_printk(3, "sending %zu\n", priv->w_cnt);
 
-	set_data_lines(priv->w_buf[priv->w_cnt++]); // put the data on the lines
+	set_data_lines(priv->w_buf[priv->w_cnt++]); /* put the data on the lines */
 
 	if (priv->w_cnt == priv->length && priv->end) {
 		dbg_printk(3, "Asserting EOI\n");
-		gpiod_set_value(EOI, 0); // Assert EOI
+		gpiod_set_value(EOI, 0); /* Assert EOI */
 	}
 
-	gpiod_set_value(DAV, 0); // Data available
+	gpiod_set_value(DAV, 0); /* Data available */
 	priv->dav_tx = 0;
 	priv->phase = 410;
 
@@ -691,12 +692,12 @@ static irqreturn_t bb_NDAC_interrupt(int irq, void *arg)
 
 	dbg_printk(3, "accepted %zu\n", priv->w_cnt - 1);
 
-	if (!priv->atn_asserted && priv->w_cnt >= priv->length) { // test for end of transfer
+	if (!priv->atn_asserted && priv->w_cnt >= priv->length) { /* test for end of transfer */
 		priv->write_done = 1;
 		priv->w_busy = 0;
 		wake_up_interruptible(&board->wait);
 	} else {
-		gpiod_set_value(DAV, 1); // Data not available
+		gpiod_set_value(DAV, 1); /* Data not available */
 		priv->dav_tx = 1;
 		priv->phase = 510;
 	}
@@ -741,7 +742,7 @@ static int bb_command(struct gpib_board *board, uint8_t *buffer,
 
 	priv->cmd = 1;
 
-	ret = bb_write(board, buffer, length, 0, bytes_written); // no eoi
+	ret = bb_write(board, buffer, length, 0, bytes_written); /* no eoi */
 
 	for (i = 0; i < length; i++) {
 		if (buffer[i] == UNT) {
@@ -775,38 +776,38 @@ static int bb_command(struct gpib_board *board, uint8_t *buffer,
  ***************************************************************************/
 
 static char *cmd_string[32] = {
-	"",    // 0x00
-	"GTL", // 0x01
-	"",    // 0x02
-	"",    // 0x03
-	"SDC", // 0x04
-	"PPC", // 0x05
-	"",    // 0x06
-	"",    // 0x07
-	"GET", // 0x08
-	"TCT", // 0x09
-	"",    // 0x0a
-	"",    // 0x0b
-	"",    // 0x0c
-	"",    // 0x0d
-	"",    // 0x0e
-	"",    // 0x0f
-	"",    // 0x10
-	"LLO", // 0x11
-	"",    // 0x12
-	"",    // 0x13
-	"DCL", // 0x14
-	"PPU", // 0x15
-	"",    // 0x16
-	"",    // 0x17
-	"SPE", // 0x18
-	"SPD", // 0x19
-	"",    // 0x1a
-	"",    // 0x1b
-	"",    // 0x1c
-	"",    // 0x1d
-	"",    // 0x1e
-	"CFE"  // 0x1f
+	"",    /* 0x00 */
+	"GTL", /* 0x01 */
+	"",    /* 0x02 */
+	"",    /* 0x03 */
+	"SDC", /* 0x04 */
+	"PPC", /* 0x05 */
+	"",    /* 0x06 */
+	"",    /* 0x07 */
+	"GET", /* 0x08 */
+	"TCT", /* 0x09 */
+	"",    /* 0x0a */
+	"",    /* 0x0b */
+	"",    /* 0x0c */
+	"",    /* 0x0d */
+	"",    /* 0x0e */
+	"",    /* 0x0f */
+	"",    /* 0x10 */
+	"LLO", /* 0x11 */
+	"",    /* 0x12 */
+	"",    /* 0x13 */
+	"DCL", /* 0x14 */
+	"PPU", /* 0x15 */
+	"",    /* 0x16 */
+	"",    /* 0x17 */
+	"SPE", /* 0x18 */
+	"SPD", /* 0x19 */
+	"",    /* 0x1a */
+	"",    /* 0x1b */
+	"",    /* 0x1c */
+	"",    /* 0x1d */
+	"",    /* 0x1e */
+	"CFE"  /* 0x1f */
 };
 
 static void bb_buffer_print(struct gpib_board *board, unsigned char *buffer, size_t length,
@@ -858,7 +859,7 @@ static void set_atn(struct gpib_board *board, int atn_asserted)
 	} else {
 		if (priv->listener_state == listener_addressed) {
 			priv->listener_state = listener_active;
-			SET_DIR_READ(priv); // make sure holdoff is active when we unassert ATN
+			SET_DIR_READ(priv); /* make sure holdoff is active when we unassert ATN */
 		}
 		if (priv->talker_state == talker_addressed)
 			priv->talker_state = talker_active;
@@ -887,7 +888,7 @@ static void bb_request_system_control(struct gpib_board *board, int request_cont
 	dbg_printk(2, "%d\n", request_control);
 	if (request_control) {
 		set_bit(CIC_NUM, &board->status);
-		// drive DAV & EOI false, enable NRFD & NDAC irqs
+		/* drive DAV & EOI false, enable NRFD & NDAC irqs */
 		SET_DIR_WRITE(board->private_data);
 	} else {
 		clear_bit(CIC_NUM, &board->status);
@@ -947,7 +948,7 @@ static unsigned int bb_update_status(struct gpib_board *board, unsigned int clea
 
 	board->status &= ~clear_mask;
 
-	if (gpiod_get_value(SRQ))	       /* SRQ asserted low */
+	if (gpiod_get_value(SRQ))			/* SRQ asserted low */
 		clear_bit(SRQI_NUM, &board->status);
 	else
 		set_bit(SRQI_NUM, &board->status);
@@ -1006,7 +1007,7 @@ static void bb_serial_poll_response(struct gpib_board *board, uint8_t status)
 
 static uint8_t bb_serial_poll_status(struct gpib_board *board)
 {
-	return 0; // -ENOENT;
+	return 0; /* -ENOENT; */
 }
 
 static int bb_t1_delay(struct gpib_board *board,  unsigned int nano_sec)
@@ -1171,7 +1172,7 @@ static int allocate_gpios(struct gpib_board *board)
 	}
 	if (lookup_table)
 		gpiod_remove_lookup_table(lookup_table);
-	// Initialize LED trigger
+	/* Initialize LED trigger */
 	led_trigger_register_simple("gpib", &ledtrig_gpib);
 	return retval;
 }
@@ -1256,7 +1257,8 @@ static int bb_attach(struct gpib_board *board, const gpib_board_config_t *config
 	if (allocate_gpios(board))
 		goto bb_attach_fail;
 
-/* Configure SN7516X control lines.
+/*
+ * Configure SN7516X control lines.
  * drive ATN, IFC and REN as outputs only when master
  * i.e. system controller. In this mode can only be the CIC
  * When not master then enable device mode ATN, IFC & REN as inputs
@@ -1464,8 +1466,8 @@ static inline void SET_DIR_READ(struct bb_priv *priv)
 		gpiod_set_value(TE, 0);	 /* set NDAC and NRFD to transmit and DAV to receive */
 	}
 
-	gpiod_direction_output(NRFD, 0);  // hold off the talker
-	gpiod_direction_output(NDAC, 0);  // data not accepted
+	gpiod_direction_output(NRFD, 0);  /* hold off the talker */
+	gpiod_direction_output(NDAC, 0);  /* data not accepted */
 
 	priv->direction = DIR_READ;
 }
-- 
2.49.0

