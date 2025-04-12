Received: from out.smtpout.orange.fr (outm-50.smtpout.orange.fr [193.252.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F2C1862
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744440410; cv=none; b=KabWGX2HCQPnFCkPkM0v93saLk28hjus0AiElLp/0zfH32ze33MDyVsyPdkiejML/DpTfFKJQ3RsR2uPf9o3cXHjZHspqlyRF3g0WWjphr6loADNNtK4zIkcWcN8xT8VK58/Yja1R4GePPqyCbqYmMA4dfj45a0+vLP/yUuJ8sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744440410; c=relaxed/simple;
	bh=qOIvLc6Jo3QX+enzkD1QoTBG99HrID9MKHAd92DD4lU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hwc36WDgrBJSqStaafg0VeEMLhr2UChfHja0evDB+U3+/zSe9gwic8nVo7+Fqq28K8uOZAy7Kq7lML7z0VH6DhNxfAEVkalAa8VOtv6+g2gTneCd2kpK0Pu/qzrQXymuEtZmV9zfYO0xFWYH9PProz4rNAxkgX0qWfpZ/rzyqq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=sd3uzJuu; arc=none smtp.client-ip=193.252.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="sd3uzJuu"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UcNul94nQxp63UcRuFtC3; Sat, 12 Apr 2025 08:45:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744440338;
	bh=kl5hACu3fbUlT4qqCG0brbsgDnD7DKEFvoE5aGuYHiI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=sd3uzJuuO5OgQSyOjtya1viOYcaF8mkKpl2SrZeL5LohadEf+wFkzPDiLeuJT6XM/
	 moftKAW8Ej2NlrwL00YZBzD8pZSuQdscbhe/JjSxuj/rp4cSZdT13tDlzvsbvr7/AO
	 XgCqVdY+QsD6LVCeCmkTbkw1WQDDVmsY9NqupRfkRmeq1FQwM0o5CD5ZsLosCQuz1b
	 R+PWdCUZ6W72nZ1UN2yY11vk4u7xtK7ph6ILZd87MYe13hONuNfxMfPW3CY6NJEr3Q
	 /JfuQWzwAAhU2otBPCdelOf1YNy8zlOKBWbIutm4Xp9JEFbUYIEVJbscl7ULNULaOT
	 tWI5XPAPTStiA==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:45:38 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/16] staging: gpib: include: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:45:22 -0700
Message-ID: <740f5ae0cf149ce9729c9d8288ac4fa20ec4ebb3.1744438358.git.paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744438358.git.paul.retourne@orange.fr>
References: <cover.1744438358.git.paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the style of multiline comments to comply with the linux kernel
coding style.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/gpib/include/gpib_types.h     | 81 ++++++++++++-------
 .../staging/gpib/include/nec7210_registers.h  |  3 +-
 drivers/staging/gpib/include/tms9914.h        |  6 +-
 3 files changed, 60 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2d9b9be683f8..8cea658078e2 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,8 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-/* gpib_interface_t defines the interface
+/*
+ * gpib_interface_t defines the interface
  * between the board-specific details dealt with in the drivers
  * and generic interface provided by gpib-common.
  * This really should be in a different header file.
@@ -37,11 +38,13 @@ typedef struct {
 	unsigned int ibirq;
 	/* dma channel to use for non-pnp cards (set by core, driver should make local copy) */
 	unsigned int ibdma;
-	/* pci bus of card, useful for distinguishing multiple identical pci cards
+	/*
+	 * pci bus of card, useful for distinguishing multiple identical pci cards
 	 * (negative means don't care)
 	 */
 	int pci_bus;
-	/* pci slot of card, useful for distinguishing multiple identical pci cards
+	/*
+	 * pci slot of card, useful for distinguishing multiple identical pci cards
 	 * (negative means don't care)
 	 */
 	int pci_slot;
@@ -58,7 +61,8 @@ struct gpib_interface_struct {
 	int (*attach)(struct gpib_board *board, const gpib_board_config_t *config);
 	/* detach() shuts down board and frees resources */
 	void (*detach)(struct gpib_board *board);
-	/* read() should read at most 'length' bytes from the bus into
+	/*
+	 * read() should read at most 'length' bytes from the bus into
 	 * 'buffer'.  It should return when it fills the buffer or
 	 * encounters an END (EOI and or EOS if appropriate).  It should set 'end'
 	 * to be nonzero if the read was terminated by an END, otherwise 'end'
@@ -70,39 +74,46 @@ struct gpib_interface_struct {
 	 */
 	int (*read)(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
 		    size_t *bytes_read);
-	/* write() should write 'length' bytes from buffer to the bus.
+	/*
+	 * write() should write 'length' bytes from buffer to the bus.
 	 * If the boolean value send_eoi is nonzero, then EOI should
 	 * be sent along with the last byte.  Returns number of bytes
 	 * written or negative value on error.
 	 */
 	int (*write)(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written);
-	/* command() writes the command bytes in 'buffer' to the bus
+	/*
+	 * command() writes the command bytes in 'buffer' to the bus
 	 * Returns zero on success or negative value on error.
 	 */
 	int (*command)(struct gpib_board *board, uint8_t *buffer, size_t length,
 		       size_t *bytes_written);
-	/* Take control (assert ATN).  If 'asyncronous' is nonzero, take
+	/*
+	 * Take control (assert ATN).  If 'asyncronous' is nonzero, take
 	 * control asyncronously (assert ATN immediately without waiting
 	 * for other processes to complete first).  Should not return
 	 * until board becomes controller in charge.  Returns zero no success,
 	 * nonzero on error.
 	 */
 	int (*take_control)(struct gpib_board *board, int asyncronous);
-	/* De-assert ATN.  Returns zero on success, nonzer on error.
+	/*
+	 * De-assert ATN.  Returns zero on success, nonzer on error.
 	 */
 	int (*go_to_standby)(struct gpib_board *board);
 	/* request/release control of the IFC and REN lines (system controller) */
 	void (*request_system_control)(struct gpib_board *board, int request_control);
-	/* Asserts or de-asserts 'interface clear' (IFC) depending on
+	/*
+	 * Asserts or de-asserts 'interface clear' (IFC) depending on
 	 * boolean value of 'assert'
 	 */
 	void (*interface_clear)(struct gpib_board *board, int assert);
-	/* Sends remote enable command if 'enable' is nonzero, disables remote mode
+	/*
+	 * Sends remote enable command if 'enable' is nonzero, disables remote mode
 	 * if 'enable' is zero
 	 */
 	void (*remote_enable)(struct gpib_board *board, int enable);
-	/* enable END for reads, when byte 'eos' is received.  If
+	/*
+	 * enable END for reads, when byte 'eos' is received.  If
 	 * 'compare_8_bits' is nonzero, then all 8 bits are compared
 	 * with the eos bytes.	Otherwise only the 7 least significant
 	 * bits are compared.
@@ -118,26 +129,31 @@ struct gpib_interface_struct {
 	void (*parallel_poll_response)(struct gpib_board *board, int ist);
 	/* select local parallel poll configuration mode PP2 versus remote PP1 */
 	void (*local_parallel_poll_mode)(struct gpib_board *board, int local);
-	/* Returns current status of the bus lines.  Should be set to
+	/*
+	 * Returns current status of the bus lines.  Should be set to
 	 * NULL if your board does not have the ability to query the
 	 * state of the bus lines.
 	 */
 	int (*line_status)(const struct gpib_board *board);
-	/* updates and returns the board's current status.
+	/*
+	 * updates and returns the board's current status.
 	 * The meaning of the bits are specified in gpib_user.h
 	 * in the IBSTA section.  The driver does not need to
 	 * worry about setting the CMPL, END, TIMO, or ERR bits.
 	 */
 	unsigned int (*update_status)(struct gpib_board *board, unsigned int clear_mask);
-	/* Sets primary address 0-30 for gpib interface card.
+	/*
+	 * Sets primary address 0-30 for gpib interface card.
 	 */
 	int (*primary_address)(struct gpib_board *board, unsigned int address);
-	/* Sets and enables, or disables secondary address 0-30
+	/*
+	 * Sets and enables, or disables secondary address 0-30
 	 * for gpib interface card.
 	 */
 	int (*secondary_address)(struct gpib_board *board, unsigned int address,
 				 int enable);
-	/* Sets the byte the board should send in response to a serial poll.
+	/*
+	 * Sets the byte the board should send in response to a serial poll.
 	 * This function should also start or stop requests for service via
 	 * IEEE 488.2 reqt/reqf, based on MSS (bit 6 of the status_byte).
 	 * If the more flexible serial_poll_response2 is implemented by the
@@ -150,7 +166,8 @@ struct gpib_interface_struct {
 	 * STB, reqt, and reqf".
 	 */
 	void (*serial_poll_response)(struct gpib_board *board, uint8_t status_byte);
-	/* Sets the byte the board should send in response to a serial poll.
+	/*
+	 * Sets the byte the board should send in response to a serial poll.
 	 * This function should also request service via IEEE 488.2 reqt/reqf
 	 * based on MSS (bit 6 of the status_byte) and new_reason_for_service.
 	 * reqt should be set true if new_reason_for_service is true,
@@ -166,7 +183,8 @@ struct gpib_interface_struct {
 	 */
 	void (*serial_poll_response2)(struct gpib_board *board, uint8_t status_byte,
 				      int new_reason_for_service);
-	/* returns the byte the board will send in response to a serial poll.
+	/*
+	 * returns the byte the board will send in response to a serial poll.
 	 */
 	uint8_t (*serial_poll_status)(struct gpib_board *board);
 	/* adjust T1 delay */
@@ -216,14 +234,16 @@ typedef struct gpib_interface_list_struct {
 	struct module *module;
 } gpib_interface_list_t;
 
-/* One struct gpib_board is allocated for each physical board in the computer.
+/*
+ * One struct gpib_board is allocated for each physical board in the computer.
  * It provides storage for variables local to each board, and interface
  * functions for performing operations on the board
  */
 struct gpib_board {
 	/* functions used by this board */
 	gpib_interface_t *interface;
-	/* Pointer to module whose use count we should increment when
+	/*
+	 * Pointer to module whose use count we should increment when
 	 * interface is in use
 	 */
 	struct module *provider_module;
@@ -231,20 +251,24 @@ struct gpib_board {
 	u8 *buffer;
 	/* length of buffer */
 	unsigned int buffer_length;
-	/* Used to hold the board's current status (see update_status() above)
+	/*
+	 * Used to hold the board's current status (see update_status() above)
 	 */
 	unsigned long status;
-	/* Driver should only sleep on this wait queue.	 It is special in that the
+	/*
+	 * Driver should only sleep on this wait queue.	 It is special in that the
 	 * core will wake this queue and set the TIMO bit in 'status' when the
 	 * watchdog timer times out.
 	 */
 	wait_queue_head_t wait;
-	/* Lock that only allows one process to access this board at a time.
+	/*
+	 * Lock that only allows one process to access this board at a time.
 	 * Has to be first in any locking order, since it can be locked over
 	 * multiple ioctls.
 	 */
 	struct mutex user_mutex;
-	/* Mutex which compensates for removal of "big kernel lock" from kernel.
+	/*
+	 * Mutex which compensates for removal of "big kernel lock" from kernel.
 	 * Should not be held for extended waits.
 	 */
 	struct mutex big_gpib_mutex;
@@ -259,7 +283,8 @@ struct gpib_board {
 	struct device *dev;
 	/* gpib_common device gpibN */
 	struct device *gpib_dev;
-	/* 'private_data' can be used as seen fit by the driver to
+	/*
+	 * 'private_data' can be used as seen fit by the driver to
 	 * store additional variables for this board
 	 */
 	void *private_data;
@@ -296,7 +321,8 @@ struct gpib_board {
 	unsigned master : 1;
 	/* individual status bit */
 	unsigned ist : 1;
-	/* one means local parallel poll mode ieee 488.1 PP2 (or no parallel poll PP0),
+	/*
+	 * one means local parallel poll mode ieee 488.1 PP2 (or no parallel poll PP0),
 	 * zero means remote parallel poll configuration mode ieee 488.1 PP1
 	 */
 	unsigned local_ppoll_mode : 1;
@@ -308,7 +334,8 @@ typedef struct {
 	short event_type;
 } gpib_event_t;
 
-/* Each board has a list of gpib_status_queue_t to keep track of all open devices
+/*
+ * Each board has a list of gpib_status_queue_t to keep track of all open devices
  * on the bus, so we know what address to poll when we get a service request
  */
 typedef struct {
diff --git a/drivers/staging/gpib/include/nec7210_registers.h b/drivers/staging/gpib/include/nec7210_registers.h
index 888803dd97f9..97c53ac8e805 100644
--- a/drivers/staging/gpib/include/nec7210_registers.h
+++ b/drivers/staging/gpib/include/nec7210_registers.h
@@ -17,7 +17,8 @@ enum nec7210_chipset {
 	TNT5004,	// NI (minor differences to TNT4882)
 };
 
-/* nec7210 register numbers (might need to be multiplied by
+/*
+ * nec7210 register numbers (might need to be multiplied by
  * a board-dependent offset to get actually io address offset)
  */
 // write registers
diff --git a/drivers/staging/gpib/include/tms9914.h b/drivers/staging/gpib/include/tms9914.h
index 424c95ad85c6..11909c3e6bbf 100644
--- a/drivers/staging/gpib/include/tms9914.h
+++ b/drivers/staging/gpib/include/tms9914.h
@@ -86,7 +86,8 @@ int tms9914_write(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *
 int tms9914_command(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *buffer,
 		    size_t length, size_t *bytes_written);
 int tms9914_take_control(struct gpib_board *board, struct tms9914_priv *priv, int syncronous);
-/* alternate version of tms9914_take_control which works around buggy tcs
+/*
+ * alternate version of tms9914_take_control which works around buggy tcs
  * implementation.
  */
 int tms9914_take_control_workaround(struct gpib_board *board, struct tms9914_priv *priv,
@@ -139,7 +140,8 @@ enum {
 	ms9914_num_registers = 8,
 };
 
-/* tms9914 register numbers (might need to be multiplied by
+/*
+ * tms9914 register numbers (might need to be multiplied by
  * a board-dependent offset to get actually io address offset)
  */
 // write registers
-- 
2.49.0

