Received: from out.smtpout.orange.fr (out-13.smtpout.orange.fr [193.252.22.13])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C523026C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744837515; cv=none; b=ATwboLJyyq7PhE26sj38Hz2Cywp02gcKDk97Z4QQsMYgMdKhW6VN7iIBmK3KofvhxWppXHaxtxbcAu9fsRPctlFPygv242MsU0uqdBsFc13gDKMTCIVe6dJCL05cOgEbsysuQNR7ktK5DhpR1XlDEPMaPymiDLYxCBm7+kfiLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744837515; c=relaxed/simple;
	bh=GoA5BixXL8Gx0eX5JAkMe3ImxlGY9OYVv+5YelDFK88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n69ctNDtCzlZSsipV9k2kk59N0dsD2kU3sCfs+DdioWtomUdRIdnrMXqUIZ5jK+1gCHZa8QhrApmmsN91lMCRIVF7fxIaDqxd6YKgINAd8gGDH/FrBaxrd4o3IUPdwFgc06iA1CnXJi8fyOA5cNCjZ1o2F3uSIGGlD3VevYYIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=diSjGVvr; arc=none smtp.client-ip=193.252.22.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="diSjGVvr"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 59wNu2F8mETiN59wRuzzN7; Wed, 16 Apr 2025 23:05:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744837509;
	bh=ApWjiV63hZbpyWpH5ZHXZD1LSL4Rv/fHHit61ZUXWtY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=diSjGVvrP5AN1/+5uoqnI62k7AVrJQqatITyjH8I960AzyzffghHjrtwBwS2Urd3u
	 zsjWUyZN42TzOX2FMmJlwDwrDXECnD+3tmFiCVQOyaemK1kb3D/NhOQFt08iURtgIg
	 5ugCfJo9IqQHwqBZap5Tb2NcbC2yrvmfL5D34WfrRI6Zf0HpSIRGzkgnWK6UFUwyi0
	 ihNbjW7YDd1oOmLGjfcdegTS0WbmuRT0owLblZditFt0fj+Wdm2oZQaQI5q6a3S/iO
	 gaMkvzd6XDqoGrFAMzt+VfnkEmyL9HYfMAmy/lAHf6W6WokXxF0qeemYJXaO2bODop
	 /AB3Bf00HpO+w==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Wed, 16 Apr 2025 23:05:09 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: gpib: include: fixes multiline comments style
Date: Wed, 16 Apr 2025 14:04:09 -0700
Message-ID: <20250416210411.9300-2-paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
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
In v2:
- Keep only the non applied patch
- Rebase on top of staging-testing

 drivers/staging/gpib/include/gpib_types.h     | 81 ++++++++++++-------
 .../staging/gpib/include/nec7210_registers.h  |  3 +-
 drivers/staging/gpib/include/tms9914.h        |  6 +-
 3 files changed, 60 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 71af9e808a76..73a8958e4d9b 100644
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
@@ -37,11 +38,13 @@ struct gpib_board_config {
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
 	int (*attach)(struct gpib_board *board, const struct gpib_board_config *config);
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
 	int (*read)(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 		    size_t *bytes_read);
-	/* write() should write 'length' bytes from buffer to the bus.
+	/*
+	 * write() should write 'length' bytes from buffer to the bus.
 	 * If the boolean value send_eoi is nonzero, then EOI should
 	 * be sent along with the last byte.  Returns number of bytes
 	 * written or negative value on error.
 	 */
 	int (*write)(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written);
-	/* command() writes the command bytes in 'buffer' to the bus
+	/*
+	 * command() writes the command bytes in 'buffer' to the bus
 	 * Returns zero on success or negative value on error.
 	 */
 	int (*command)(struct gpib_board *board, u8 *buffer, size_t length,
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
 	void (*serial_poll_response)(struct gpib_board *board, u8 status_byte);
-	/* Sets the byte the board should send in response to a serial poll.
+	/*
+	 * Sets the byte the board should send in response to a serial poll.
 	 * This function should also request service via IEEE 488.2 reqt/reqf
 	 * based on MSS (bit 6 of the status_byte) and new_reason_for_service.
 	 * reqt should be set true if new_reason_for_service is true,
@@ -166,7 +183,8 @@ struct gpib_interface_struct {
 	 */
 	void (*serial_poll_response2)(struct gpib_board *board, u8 status_byte,
 				      int new_reason_for_service);
-	/* returns the byte the board will send in response to a serial poll.
+	/*
+	 * returns the byte the board will send in response to a serial poll.
 	 */
 	u8 (*serial_poll_status)(struct gpib_board *board);
 	/* adjust T1 delay */
@@ -216,14 +234,16 @@ struct gpib_interface_list {
 	struct module *module;
 };
 
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
@@ -308,7 +334,8 @@ struct gpib_event {
 	short event_type;
 };
 
-/* Each board has a list of gpib_status_queue to keep track of all open devices
+/*
+ * Each board has a list of gpib_status_queue to keep track of all open devices
  * on the bus, so we know what address to poll when we get a service request
  */
 struct gpib_status_queue {
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
index d9ba11426ab1..352fc516fd40 100644
--- a/drivers/staging/gpib/include/tms9914.h
+++ b/drivers/staging/gpib/include/tms9914.h
@@ -86,7 +86,8 @@ int tms9914_write(struct gpib_board *board, struct tms9914_priv *priv, u8 *buffe
 int tms9914_command(struct gpib_board *board, struct tms9914_priv *priv, u8 *buffer,
 		    size_t length, size_t *bytes_written);
 int tms9914_take_control(struct gpib_board *board, struct tms9914_priv *priv, int syncronous);
-/* alternate version of tms9914_take_control which works around buggy tcs
+/*
+ * alternate version of tms9914_take_control which works around buggy tcs
  * implementation.
  */
 int tms9914_take_control_workaround(struct gpib_board *board, struct tms9914_priv *priv,
@@ -140,7 +141,8 @@ enum {
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

