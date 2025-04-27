Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEE324A07B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745035; cv=none; b=i4krTWeLOJH/j+wW+/vSGcCVk3iEWon6nhnyRsOt5u+lkNPsqneOlt537qMJIjWx2J8lVM730Mdh0dNhAF8uNlnloT6wWk2HcgQEkyADI59QTHo8eVGG8TWP/LBnaMAarH4BT4U4ZdKtD7zi/HluIcJ6/U1I1DBAVGkV3lchfXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745035; c=relaxed/simple;
	bh=RZJdcAjyimd22DywD5wOE1m6XQEmJDAKxoD3ogG2pZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E99o5fCkHsYxmNaU6DqkrRTAyD02jyqxeh5ojgkDL9fSGm0am6B9wtpAJdSr4XHyZbks32FRwKNmPlJoBLUVkAdPbSo2ybvdAP1snv4mP4iu2ufxD1jCrK822pQIExPA+hlUAnnl0M5z+ukQS6U7Bv68YxHPo7P/x1meXDfg1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMc/RuEp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMc/RuEp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso23822525e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745031; x=1746349831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ/nFA68bcSOcsO0RPS+enF9OOXSeic2MUkRaM0A0LA=;
        b=TMc/RuEpjUOph2TGWKRkw5QPyMYfMlbqfHws0VT5oqA0jiJrk/+r+h3gSSnMVaPZA/
         SQfuwx3IUL1lgVc++QIhJqixsOYVQqOLVoNVsheQvyqnCFjGcfz8LTl1gNBcE2YrcRTQ
         +WPGjHDhDcN8S6IsgAU5Ni2lKmkFE6DJp7F0YLV9ewEqLB5JVJnPy2UNkWHuYFw4pP34
         fo4aicqpLqrAh88m0XrOVTtiUjU4HCtgfK6x9HUlvoB1lk4qFQR3bJbFthBq/HS4dMdT
         A8Z2oLSUAuAeoBNJ1OIfoTU/X9tbe1nBImZu0SwcKvtEvFBBZTfDUlo2Bo574bNfS3RG
         7H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745031; x=1746349831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJ/nFA68bcSOcsO0RPS+enF9OOXSeic2MUkRaM0A0LA=;
        b=Gt/xQwpqRGm/l4fpWc1bZ3XPTcjiAEQQbyYSZ5tit0q58J3WCUQut0CnmyoXMjQgc1
         ezUcuU4wUyxAseTE3iMfe5qxCkmZ1XhVGjD/JHiSKUzaMuHP2nPuWrqR2BYQxGKOzs8I
         FZY+8p7P4O3d6qU2Hp5SniomakqBPyTpf5fB2SjbSwqjl2+3zFXzA6JrEvuPajLVVsHX
         QtE+vRPWmopst/f69cvbfxbksX+ie/q8rEH4BgXFSBFcd3SNUCYzyT+XGU8g5DTgWr1E
         aLQ5RxEBS/jtgSWyck09NhM3gMnR9+3mQQ6JIGgFvDg4y6lJT+4vljQ+Cqw8uqvy7gAr
         KCow==
X-Forwarded-Encrypted: i=1; AJvYcCXUlTciMVtze6mr77COPJF81N2KgL5sAEzPdJzDzQBg/pjXy5huMC3APZDgjlm7f6hJ4xJPCFg7mW9SQfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqpB7M4aY+ox8FWcb8lfaqFoM48u0y7EJWwNOKWdVrC3DxpdQ
	5kOETU4+JIkuH8J2mFpnKzxWn0lLMlOv835Y6h/yO8fxf40jJqR+
X-Gm-Gg: ASbGncsylFJ7xd/SEAXl5F6IEK1FCR+xXeir2S04sUC5zuZ8dWfGP+jyGnPwLWTTwOK
	J4I9E8eTjHL1Vv5XL3km0sgD0XrOOwk8UA6JRYKaY1fcRzFVM4uzsHXBw3DkNSZ5YMPE7DhMfEn
	z4neJ7yoLXP7KZbOvY47lzlOA/7RPxhBGR424Kv9+nGU6562Y1ns0H87YnpD8xzw5tmQBs4g5GG
	oXVs8JOzCCbiKKxYk9HD1/q66V58zIAGEE7QLOutMLAXOJtbbtI9nDuus+k1evt/FXiglLMYRjh
	HN4a3R68pq/C9jc6RhyQmxA4x/1cEPUwXdwLaRDREC2ny38SEFp0TjMQVpku7b+ApN1aEqkYUKR
	U
X-Google-Smtp-Source: AGHT+IGSs75kPuYzMHAZpWqKbLRK+mt3FLgd3EU1oSBbmZY+ohj/mrQWCpvjPAbtlsxSD1WAsAiiIQ==
X-Received: by 2002:a05:600c:524f:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-440a65dcddfmr51469585e9.8.1745745031280;
        Sun, 27 Apr 2025 02:10:31 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca557bsm7925805f8f.35.2025.04.27.02.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:10:30 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/3] staging: gpib: Declare driver entry points static
Date: Sun, 27 Apr 2025 11:10:17 +0200
Message-ID: <20250427091018.13705-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427091018.13705-1-dpenkler@gmail.com>
References: <20250427091018.13705-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many of this driver's entry points were unecessarily not declared
static.

Remove the declarations from the include file.
Make the declarations static in the .c file.
Remove an uneccessary forward declaration in the .c file.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ines/ines.h      | 44 -------------
 drivers/staging/gpib/ines/ines_gpib.c | 92 ++++++++++++++-------------
 2 files changed, 47 insertions(+), 89 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index 07b82f790c4b..f0210ce2470d 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -35,45 +35,6 @@ struct ines_priv {
 	u8 extend_mode_bits;
 };
 
-// interface functions
-int ines_read(struct gpib_board *board, u8 *buffer, size_t length,
-	      int *end, size_t *bytes_read);
-int ines_write(struct gpib_board *board, u8 *buffer, size_t length,
-	       int send_eoi, size_t *bytes_written);
-int ines_accel_read(struct gpib_board *board, u8 *buffer, size_t length,
-		    int *end, size_t *bytes_read);
-int ines_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
-		     int send_eoi, size_t *bytes_written);
-int ines_command(struct gpib_board *board, u8 *buffer, size_t length, size_t *bytes_written);
-int ines_take_control(struct gpib_board *board, int synchronous);
-int ines_go_to_standby(struct gpib_board *board);
-int ines_request_system_control(struct gpib_board *board, int request_control);
-void ines_interface_clear(struct gpib_board *board, int assert);
-void ines_remote_enable(struct gpib_board *board, int enable);
-int ines_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits);
-void ines_disable_eos(struct gpib_board *board);
-unsigned int ines_update_status(struct gpib_board *board, unsigned int clear_mask);
-int ines_primary_address(struct gpib_board *board, unsigned int address);
-int ines_secondary_address(struct gpib_board *board, unsigned int address, int enable);
-int ines_parallel_poll(struct gpib_board *board, u8 *result);
-void ines_parallel_poll_configure(struct gpib_board *board, u8 config);
-void ines_parallel_poll_response(struct gpib_board *board, int ist);
-void ines_serial_poll_response(struct gpib_board *board, u8 status);
-u8 ines_serial_poll_status(struct gpib_board *board);
-int ines_line_status(const struct gpib_board *board);
-int ines_t1_delay(struct gpib_board *board, unsigned int nano_sec);
-void ines_return_to_local(struct gpib_board *board);
-
-// interrupt service routines
-irqreturn_t ines_pci_interrupt(int irq, void *arg);
-irqreturn_t ines_interrupt(struct gpib_board *board);
-
-// utility functions
-void ines_free_private(struct gpib_board *board);
-int ines_generic_attach(struct gpib_board *board);
-void ines_online(struct ines_priv *priv, const struct gpib_board *board, int use_accel);
-void ines_set_xfer_counter(struct ines_priv *priv, unsigned int count);
-
 /* inb/outb wrappers */
 static inline unsigned int ines_inb(struct ines_priv *priv, unsigned int register_number)
 {
@@ -88,11 +49,6 @@ static inline void ines_outb(struct ines_priv *priv, unsigned int value,
 	     register_number * priv->nec7210_priv.offset);
 }
 
-// pcmcia init/cleanup
-
-int ines_pcmcia_init_module(void);
-void ines_pcmcia_cleanup_module(void);
-
 enum ines_regs {
 	// read
 	FIFO_STATUS = 0x8,
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 5168811ee850..a16219c0f7c8 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -25,7 +25,9 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for Ines iGPIB 72010");
 
-int ines_line_status(const struct gpib_board *board)
+static irqreturn_t ines_interrupt(struct gpib_board *board);
+
+static int ines_line_status(const struct gpib_board *board)
 {
 	int status = VALID_ALL;
 	int bcm_bits;
@@ -55,7 +57,7 @@ int ines_line_status(const struct gpib_board *board)
 	return status;
 }
 
-void ines_set_xfer_counter(struct ines_priv *priv, unsigned int count)
+static void ines_set_xfer_counter(struct ines_priv *priv, unsigned int count)
 {
 	if (count > 0xffff) {
 		pr_err("bug! tried to set xfer counter > 0xffff\n");
@@ -65,7 +67,7 @@ void ines_set_xfer_counter(struct ines_priv *priv, unsigned int count)
 	ines_outb(priv, count & 0xff, XFER_COUNT_LOWER);
 }
 
-int ines_t1_delay(struct gpib_board *board, unsigned int nano_sec)
+static int ines_t1_delay(struct gpib_board *board, unsigned int nano_sec)
 {
 	struct ines_priv *ines_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &ines_priv->nec7210_priv;
@@ -133,8 +135,8 @@ static ssize_t pio_read(struct gpib_board *board, struct ines_priv *ines_priv, u
 	return retval;
 }
 
-int ines_accel_read(struct gpib_board *board, u8 *buffer,
-		    size_t length, int *end, size_t *bytes_read)
+static int ines_accel_read(struct gpib_board *board, u8 *buffer,
+			   size_t length, int *end, size_t *bytes_read)
 {
 	ssize_t retval = 0;
 	struct ines_priv *ines_priv = board->private_data;
@@ -213,8 +215,8 @@ static int ines_write_wait(struct gpib_board *board, struct ines_priv *ines_priv
 	return 0;
 }
 
-int ines_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
-		     int send_eoi, size_t *bytes_written)
+static int ines_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
+			    int send_eoi, size_t *bytes_written)
 {
 	size_t count = 0;
 	ssize_t retval = 0;
@@ -264,7 +266,7 @@ int ines_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
 	return retval;
 }
 
-irqreturn_t ines_pci_interrupt(int irq, void *arg)
+static irqreturn_t ines_pci_interrupt(int irq, void *arg)
 {
 	struct gpib_board *board = arg;
 	struct ines_priv *priv = board->private_data;
@@ -281,7 +283,7 @@ irqreturn_t ines_pci_interrupt(int irq, void *arg)
 	return ines_interrupt(board);
 }
 
-irqreturn_t ines_interrupt(struct gpib_board *board)
+static irqreturn_t ines_interrupt(struct gpib_board *board)
 {
 	struct ines_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
@@ -393,8 +395,8 @@ static struct ines_pci_id pci_ids[] = {
 static const int num_pci_chips = ARRAY_SIZE(pci_ids);
 
 // wrappers for interface functions
-int ines_read(struct gpib_board *board, u8 *buffer, size_t length,
-	      int *end, size_t *bytes_read)
+static int ines_read(struct gpib_board *board, u8 *buffer, size_t length,
+		     int *end, size_t *bytes_read)
 {
 	struct ines_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
@@ -412,127 +414,127 @@ int ines_read(struct gpib_board *board, u8 *buffer, size_t length,
 	return retval;
 }
 
-int ines_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
-	       size_t *bytes_written)
+static int ines_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
+		      size_t *bytes_written)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-int ines_command(struct gpib_board *board, u8 *buffer, size_t length, size_t *bytes_written)
+static int ines_command(struct gpib_board *board, u8 *buffer, size_t length, size_t *bytes_written)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_command(board, &priv->nec7210_priv, buffer, length, bytes_written);
 }
 
-int ines_take_control(struct gpib_board *board, int synchronous)
+static int ines_take_control(struct gpib_board *board, int synchronous)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_take_control(board, &priv->nec7210_priv, synchronous);
 }
 
-int ines_go_to_standby(struct gpib_board *board)
+static int ines_go_to_standby(struct gpib_board *board)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-int ines_request_system_control(struct gpib_board *board, int request_control)
+static int ines_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
 }
 
-void ines_interface_clear(struct gpib_board *board, int assert)
+static void ines_interface_clear(struct gpib_board *board, int assert)
 {
 	struct ines_priv *priv = board->private_data;
 
 	nec7210_interface_clear(board, &priv->nec7210_priv, assert);
 }
 
-void ines_remote_enable(struct gpib_board *board, int enable)
+static void ines_remote_enable(struct gpib_board *board, int enable)
 {
 	struct ines_priv *priv = board->private_data;
 
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-int ines_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
+static int ines_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_enable_eos(board, &priv->nec7210_priv, eos_byte, compare_8_bits);
 }
 
-void ines_disable_eos(struct gpib_board *board)
+static void ines_disable_eos(struct gpib_board *board)
 {
 	struct ines_priv *priv = board->private_data;
 
 	nec7210_disable_eos(board, &priv->nec7210_priv);
 }
 
-unsigned int ines_update_status(struct gpib_board *board, unsigned int clear_mask)
+static unsigned int ines_update_status(struct gpib_board *board, unsigned int clear_mask)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_update_status(board, &priv->nec7210_priv, clear_mask);
 }
 
-int ines_primary_address(struct gpib_board *board, unsigned int address)
+static int ines_primary_address(struct gpib_board *board, unsigned int address)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_primary_address(board, &priv->nec7210_priv, address);
 }
 
-int ines_secondary_address(struct gpib_board *board, unsigned int address, int enable)
+static int ines_secondary_address(struct gpib_board *board, unsigned int address, int enable)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-int ines_parallel_poll(struct gpib_board *board, u8 *result)
+static int ines_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-void ines_parallel_poll_configure(struct gpib_board *board, u8 config)
+static void ines_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct ines_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_configure(board, &priv->nec7210_priv, config);
 }
 
-void ines_parallel_poll_response(struct gpib_board *board, int ist)
+static void ines_parallel_poll_response(struct gpib_board *board, int ist)
 {
 	struct ines_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-void ines_serial_poll_response(struct gpib_board *board, u8 status)
+static void ines_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct ines_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-u8 ines_serial_poll_status(struct gpib_board *board)
+static u8 ines_serial_poll_status(struct gpib_board *board)
 {
 	struct ines_priv *priv = board->private_data;
 
 	return nec7210_serial_poll_status(board, &priv->nec7210_priv);
 }
 
-void ines_return_to_local(struct gpib_board *board)
+static void ines_return_to_local(struct gpib_board *board)
 {
 	struct ines_priv *priv = board->private_data;
 
@@ -664,13 +666,13 @@ static int ines_allocate_private(struct gpib_board *board)
 	return 0;
 }
 
-void ines_free_private(struct gpib_board *board)
+static void ines_free_private(struct gpib_board *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
 }
 
-int ines_generic_attach(struct gpib_board *board)
+static int ines_generic_attach(struct gpib_board *board)
 {
 	struct ines_priv *ines_priv;
 	struct nec7210_priv *nec_priv;
@@ -690,7 +692,7 @@ int ines_generic_attach(struct gpib_board *board)
 	return 0;
 }
 
-void ines_online(struct ines_priv *ines_priv, const struct gpib_board *board, int use_accel)
+static void ines_online(struct ines_priv *ines_priv, const struct gpib_board *board, int use_accel)
 {
 	struct nec7210_priv *nec_priv = &ines_priv->nec7210_priv;
 
@@ -852,7 +854,7 @@ static int ines_common_pci_attach(struct gpib_board *board, const struct gpib_bo
 	return 0;
 }
 
-int ines_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
+static int ines_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -867,7 +869,7 @@ int ines_pci_attach(struct gpib_board *board, const struct gpib_board_config *co
 	return 0;
 }
 
-int ines_pci_accel_attach(struct gpib_board *board, const struct gpib_board_config *config)
+static int ines_pci_accel_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -884,7 +886,7 @@ int ines_pci_accel_attach(struct gpib_board *board, const struct gpib_board_conf
 
 static const int ines_isa_iosize = 0x20;
 
-int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
+static int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	struct nec7210_priv *nec_priv;
@@ -915,7 +917,7 @@ int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *co
 	return 0;
 }
 
-void ines_pci_detach(struct gpib_board *board)
+static void ines_pci_detach(struct gpib_board *board)
 {
 	struct ines_priv *ines_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -949,7 +951,7 @@ void ines_pci_detach(struct gpib_board *board)
 	ines_free_private(board);
 }
 
-void ines_isa_detach(struct gpib_board *board)
+static void ines_isa_detach(struct gpib_board *board)
 {
 	struct ines_priv *ines_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -1005,7 +1007,6 @@ static int ines_pcmcia_attach(struct gpib_board *board, const struct gpib_board_
 static int ines_pcmcia_accel_attach(struct gpib_board *board,
 				    const struct gpib_board_config *config);
 static void ines_pcmcia_detach(struct gpib_board *board);
-static irqreturn_t ines_pcmcia_interrupt(int irq, void *arg);
 static int ines_common_pcmcia_attach(struct gpib_board *board);
 /*
  * A linked list of "instances" of the gpib device.  Each actual
@@ -1213,7 +1214,7 @@ static struct pcmcia_driver ines_gpib_cs_driver = {
 	.resume		= ines_gpib_resume,
 };
 
-void ines_pcmcia_cleanup_module(void)
+static void ines_pcmcia_cleanup_module(void)
 {
 	pcmcia_unregister_driver(&ines_gpib_cs_driver);
 }
@@ -1302,14 +1303,14 @@ static struct gpib_interface ines_pcmcia_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-irqreturn_t ines_pcmcia_interrupt(int irq, void *arg)
+static irqreturn_t ines_pcmcia_interrupt(int irq, void *arg)
 {
 	struct gpib_board *board = arg;
 
 	return ines_interrupt(board);
 }
 
-int ines_common_pcmcia_attach(struct gpib_board *board)
+static int ines_common_pcmcia_attach(struct gpib_board *board)
 {
 	struct ines_priv *ines_priv;
 	struct nec7210_priv *nec_priv;
@@ -1348,7 +1349,7 @@ int ines_common_pcmcia_attach(struct gpib_board *board)
 	return 0;
 }
 
-int ines_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config)
+static int ines_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -1363,7 +1364,8 @@ int ines_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config
 	return 0;
 }
 
-int ines_pcmcia_accel_attach(struct gpib_board *board, const struct gpib_board_config *config)
+static int ines_pcmcia_accel_attach(struct gpib_board *board,
+				    const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -1378,7 +1380,7 @@ int ines_pcmcia_accel_attach(struct gpib_board *board, const struct gpib_board_c
 	return 0;
 }
 
-void ines_pcmcia_detach(struct gpib_board *board)
+static void ines_pcmcia_detach(struct gpib_board *board)
 {
 	struct ines_priv *ines_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
-- 
2.49.0

