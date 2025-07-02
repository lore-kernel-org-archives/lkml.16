Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAD2BA2D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495368; cv=none; b=Usiloc4vDg/kJ/Yei6cUpiQwc7paDsjwHpcNtJ5EmzVMm9uo4YMij5eggHlXuzhHDXH2LYGEvjZsqIwvZl9zrnl65fadn9yT1EP6e0JAjMrAOT75v76wlgepkzZblS3I73/k9nn8xK30gk0fivZ0bXeK9ZcAuq3VRsYO1L4sPsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495368; c=relaxed/simple;
	bh=1HjfBJmpquWx0sI3AlG0fpXwHDxN3DSwVGc5PCBebPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrdAc/iOJDO7nbGbnRXIw53FVxaftHYe5PHrXP4YYoHpjTuWAoD5H4DJvDxyjqEs/yqBUgfkwnZe7dhZV/6lSWOIZr0VxNGj6dMqQAFfGT3lb5bQ4TdYo0dcO7Y8s5VUDQMK7kfLtOr9JxPoe+9F7lx1COEH3O2v0oLmnDDZXCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=iNwrVb4X; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="iNwrVb4X"
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250702222916ca624d31c9e36a2c46
        for <linux-kernel@vger.kernel.org>;
        Thu, 03 Jul 2025 00:29:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8K7+NkkI5KyKo1597u2GdjHkWsakhR2KOTTYNF0g4jo=;
 b=iNwrVb4XCXJPMrr8oybFHigri/p2sqZfT7WIqxzZsN+DG/bY4JBpaIFvBJ4ozbz63FZhsN
 EmdDfnpaUS4zhMZWXoCJiPaXS+3bQFd4Gyu5ySQkY+CzuFPCwnzImLLQKGPCheaidMSZV9pU
 1p0mjf8w5t2Q3ABpcQj+m6nolGAzfd3Yikie/Gkg4IEGHj7yK3zsqfDUbJQUnihp0U5iSBkv
 LeeFARkdEfVmLoAPbTwk/L4V8vmGjIfD4gJJT+Dndr+ZUZ3csXmSy8lEFwrZNTpholS8NM6C
 wD53HLQsnr37ty66soqHa+qJrtFkyxMTdWeea/1kRzWaJsIFqE9lvAow==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <mwalle@kernel.org>,
	Hui Wang <hui.wang@canonical.com>
Subject: [PATCH] eeprom: at25: convert to spi-mem API
Date: Thu,  3 Jul 2025 00:28:22 +0200
Message-ID: <20250702222823.864803-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Replace the RAW SPI accesses with spi-mem API. The latter will fall back to
RAW SPI accesses if spi-mem callbacks are not implemented by a controller
driver.

Notable advantages:
- read function now allocates a bounce buffer for SPI DMA compatibility,
  similar to write function;
- the driver can now be used in conjunction with SPI controller drivers
  providing spi-mem API only, e.g. spi-nxp-fspi.
- during the initial probe the driver polls busy/ready status bit for 25ms
  instead of giving up instantly and hoping that the FW didn't write the
  EEPROM

Notes:
- mutex_lock() has been dropped from fm25_aux_read() because the latter is
  only being called in probe phase and therefore cannot race with
  at25_ee_read() or at25_ee_write()

Quick 4KB block size test with CY15B102Q 256KB F-RAM over spi_omap2_mcspi
driver (no spi-mem ops provided, fallback to raw SPI inside spi-mem):

OP	| throughput, KB/s	| change
--------+-----------------------+-------
write	| 1717.847 -> 1656.684	| -3.6%
read	| 1115.868 -> 1059.367	| -5.1%

The lower throughtput probably comes from the 3 messages per SPI transfer
inside spi-mem instead of hand-crafted 2 messages per transfer in the
former at25 code. However, if the raw SPI access is not preserved, then
the driver doesn't grow from the lines-of-code perspective and subjectively
could be considered even a bit simpler.

Higher performance impact on the read operation could be explained by the
newly introduced bounce buffer in read operation. I didn't find any
explanation or guarantee, why would a bounce buffer be not needed on the
read side, so I assume it's a pure luck that nobody read EEPROM into
some variable on stack on an architecture where kernel stack would be
not DMA-able.

Cc: Michael Walle <mwalle@kernel.org>
Cc: Hui Wang <hui.wang@canonical.com>
Link: https://lore.kernel.org/all/28ab8b72afee1af59b628f7389f0d7f5@kernel.org/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/misc/eeprom/Kconfig |   1 +
 drivers/misc/eeprom/at25.c  | 321 ++++++++++++++++++------------------
 2 files changed, 162 insertions(+), 160 deletions(-)

diff --git a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
index cb1c4b8e7fd37..0bef5b93bd6dc 100644
--- a/drivers/misc/eeprom/Kconfig
+++ b/drivers/misc/eeprom/Kconfig
@@ -37,6 +37,7 @@ config EEPROM_AT25
 	depends on SPI && SYSFS
 	select NVMEM
 	select NVMEM_SYSFS
+	select SPI_MEM
 	help
 	  Enable this driver to get read/write support to most SPI EEPROMs
 	  and Cypress FRAMs,
diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 595ceb9a71261..20611320e7152 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -7,8 +7,10 @@
  */
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/property.h>
@@ -17,6 +19,7 @@
 
 #include <linux/spi/eeprom.h>
 #include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
 
 #include <linux/nvmem-provider.h>
 
@@ -35,13 +38,12 @@
 
 struct at25_data {
 	struct spi_eeprom	chip;
-	struct spi_device	*spi;
+	struct spi_mem		*spimem;
 	struct mutex		lock;
 	unsigned		addrlen;
 	struct nvmem_config	nvmem_config;
 	struct nvmem_device	*nvmem;
 	u8 sernum[FM25_SN_LEN];
-	u8 command[EE_MAXADDRLEN + 1];
 };
 
 #define	AT25_WREN	0x06		/* latch the write enable */
@@ -74,20 +76,29 @@ struct at25_data {
 
 #define	io_limit	PAGE_SIZE	/* bytes */
 
+/* Handle the address MSB as part of instruction byte */
+static u8 at25_instr(struct at25_data *at25, u8 instr, unsigned int off)
+{
+	if (!(at25->chip.flags & EE_INSTR_BIT3_IS_ADDR))
+		return instr;
+	if (off < BIT(at25->addrlen * 8))
+		return instr;
+	return instr | AT25_INSTR_BIT3;
+}
+
 static int at25_ee_read(void *priv, unsigned int offset,
 			void *val, size_t count)
 {
+	u8 *bounce __free(kfree) = kmalloc(min(count, io_limit), GFP_KERNEL);
 	struct at25_data *at25 = priv;
 	char *buf = val;
-	size_t max_chunk = spi_max_transfer_size(at25->spi);
 	unsigned int msg_offset = offset;
 	size_t bytes_left = count;
 	size_t segment;
-	u8			*cp;
-	ssize_t			status;
-	struct spi_transfer	t[2];
-	struct spi_message	m;
-	u8			instr;
+	int status;
+
+	if (!bounce)
+		return -ENOMEM;
 
 	if (unlikely(offset >= at25->chip.byte_len))
 		return -EINVAL;
@@ -97,87 +108,67 @@ static int at25_ee_read(void *priv, unsigned int offset,
 		return -EINVAL;
 
 	do {
-		segment = min(bytes_left, max_chunk);
-		cp = at25->command;
+		struct spi_mem_op op;
 
-		instr = AT25_READ;
-		if (at25->chip.flags & EE_INSTR_BIT3_IS_ADDR)
-			if (msg_offset >= BIT(at25->addrlen * 8))
-				instr |= AT25_INSTR_BIT3;
+		segment = min(bytes_left, io_limit);
 
-		mutex_lock(&at25->lock);
+		op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(at25_instr(at25, AT25_READ,
+									     msg_offset), 1),
+						   SPI_MEM_OP_ADDR(at25->addrlen, msg_offset, 1),
+						   SPI_MEM_OP_NO_DUMMY,
+						   SPI_MEM_OP_DATA_IN(segment, bounce, 1));
 
-		*cp++ = instr;
-
-		/* 8/16/24-bit address is written MSB first */
-		switch (at25->addrlen) {
-		default:	/* case 3 */
-			*cp++ = msg_offset >> 16;
-			fallthrough;
-		case 2:
-			*cp++ = msg_offset >> 8;
-			fallthrough;
-		case 1:
-		case 0:	/* can't happen: for better code generation */
-			*cp++ = msg_offset >> 0;
-		}
-
-		spi_message_init(&m);
-		memset(t, 0, sizeof(t));
-
-		t[0].tx_buf = at25->command;
-		t[0].len = at25->addrlen + 1;
-		spi_message_add_tail(&t[0], &m);
-
-		t[1].rx_buf = buf;
-		t[1].len = segment;
-		spi_message_add_tail(&t[1], &m);
-
-		status = spi_sync(at25->spi, &m);
+		status = spi_mem_adjust_op_size(at25->spimem, &op);
+		if (status)
+			return status;
+		segment = op.data.nbytes;
 
+		mutex_lock(&at25->lock);
+		status = spi_mem_exec_op(at25->spimem, &op);
 		mutex_unlock(&at25->lock);
-
 		if (status)
 			return status;
+		memcpy(buf, bounce, segment);
 
 		msg_offset += segment;
 		buf += segment;
 		bytes_left -= segment;
 	} while (bytes_left > 0);
 
-	dev_dbg(&at25->spi->dev, "read %zu bytes at %d\n",
+	dev_dbg(&at25->spimem->spi->dev, "read %zu bytes at %d\n",
 		count, offset);
 	return 0;
 }
 
-/* Read extra registers as ID or serial number */
+/*
+ * Read extra registers as ID or serial number
+ *
+ * Allow for the callers to provide @buf on stack (not necessary DMA-capable)
+ * by allocating a bounce buffer internally.
+ */
 static int fm25_aux_read(struct at25_data *at25, u8 *buf, uint8_t command,
 			 int len)
 {
+	u8 *bounce __free(kfree) = kmalloc(len, GFP_KERNEL);
+	struct spi_mem_op op;
 	int status;
-	struct spi_transfer t[2];
-	struct spi_message m;
-
-	spi_message_init(&m);
-	memset(t, 0, sizeof(t));
 
-	t[0].tx_buf = at25->command;
-	t[0].len = 1;
-	spi_message_add_tail(&t[0], &m);
-
-	t[1].rx_buf = buf;
-	t[1].len = len;
-	spi_message_add_tail(&t[1], &m);
+	if (!bounce)
+		return -ENOMEM;
 
-	mutex_lock(&at25->lock);
+	op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(command, 1),
+					   SPI_MEM_OP_NO_ADDR,
+					   SPI_MEM_OP_NO_DUMMY,
+					   SPI_MEM_OP_DATA_IN(len, bounce, 1));
 
-	at25->command[0] = command;
+	status = spi_mem_exec_op(at25->spimem, &op);
+	dev_dbg(&at25->spimem->spi->dev, "read %d aux bytes --> %d\n", len, status);
+	if (status)
+		return status;
 
-	status = spi_sync(at25->spi, &m);
-	dev_dbg(&at25->spi->dev, "read %d aux bytes --> %d\n", len, status);
+	memcpy(buf, bounce, len);
 
-	mutex_unlock(&at25->lock);
-	return status;
+	return 0;
 }
 
 static ssize_t sernum_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -195,14 +186,47 @@ static struct attribute *sernum_attrs[] = {
 };
 ATTRIBUTE_GROUPS(sernum);
 
+/*
+ * Poll Read Status Register with timeout
+ *
+ * Return:
+ * 0, if the chip is ready
+ * [positive] Status Register value as-is, if the chip is busy
+ * [negative] error code in case of read failure
+ */
+static int at25_wait_ready(struct at25_data *at25)
+{
+	u8 *bounce __free(kfree) = kmalloc(1, GFP_KERNEL);
+	struct spi_mem_op op;
+	int status;
+
+	if (!bounce)
+		return -ENOMEM;
+
+	op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(AT25_RDSR, 1),
+					   SPI_MEM_OP_NO_ADDR,
+					   SPI_MEM_OP_NO_DUMMY,
+					   SPI_MEM_OP_DATA_IN(1, bounce, 1));
+
+	read_poll_timeout(spi_mem_exec_op, status,
+			  status || !(bounce[0] & AT25_SR_nRDY), false,
+			  USEC_PER_MSEC, USEC_PER_MSEC * EE_TIMEOUT,
+			  at25->spimem, &op);
+	if (status < 0)
+		return status;
+	if (!(bounce[0] & AT25_SR_nRDY))
+		return 0;
+
+	return bounce[0];
+}
+
 static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 {
+	u8 *bounce __free(kfree) = kmalloc(min(count, io_limit), GFP_KERNEL);
 	struct at25_data *at25 = priv;
-	size_t maxsz = spi_max_transfer_size(at25->spi);
 	const char *buf = val;
-	int			status = 0;
-	unsigned		buf_size;
-	u8			*bounce;
+	unsigned int buf_size;
+	int status;
 
 	if (unlikely(off >= at25->chip.byte_len))
 		return -EFBIG;
@@ -211,11 +235,8 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 	if (unlikely(!count))
 		return -EINVAL;
 
-	/* Temp buffer starts with command and address */
 	buf_size = at25->chip.page_size;
-	if (buf_size > io_limit)
-		buf_size = io_limit;
-	bounce = kmalloc(buf_size + at25->addrlen + 1, GFP_KERNEL);
+
 	if (!bounce)
 		return -ENOMEM;
 
@@ -223,85 +244,64 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 	 * For write, rollover is within the page ... so we write at
 	 * most one page, then manually roll over to the next page.
 	 */
-	mutex_lock(&at25->lock);
+	guard(mutex)(&at25->lock);
 	do {
-		unsigned long	timeout, retries;
-		unsigned	segment;
-		unsigned	offset = off;
-		u8		*cp = bounce;
-		int		sr;
-		u8		instr;
-
-		*cp = AT25_WREN;
-		status = spi_write(at25->spi, cp, 1);
-		if (status < 0) {
-			dev_dbg(&at25->spi->dev, "WREN --> %d\n", status);
-			break;
-		}
-
-		instr = AT25_WRITE;
-		if (at25->chip.flags & EE_INSTR_BIT3_IS_ADDR)
-			if (offset >= BIT(at25->addrlen * 8))
-				instr |= AT25_INSTR_BIT3;
-		*cp++ = instr;
+		struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(AT25_WREN, 1),
+						  SPI_MEM_OP_NO_ADDR,
+						  SPI_MEM_OP_NO_DUMMY,
+						  SPI_MEM_OP_NO_DATA);
+		unsigned int segment;
 
-		/* 8/16/24-bit address is written MSB first */
-		switch (at25->addrlen) {
-		default:	/* case 3 */
-			*cp++ = offset >> 16;
-			fallthrough;
-		case 2:
-			*cp++ = offset >> 8;
-			fallthrough;
-		case 1:
-		case 0:	/* can't happen: for better code generation */
-			*cp++ = offset >> 0;
+		status = spi_mem_exec_op(at25->spimem, &op);
+		if (status < 0) {
+			dev_dbg(&at25->spimem->spi->dev, "WREN --> %d\n", status);
+			return status;
 		}
 
 		/* Write as much of a page as we can */
-		segment = buf_size - (offset % buf_size);
+		segment = buf_size - (off % buf_size);
 		if (segment > count)
 			segment = count;
-		if (segment > maxsz)
-			segment = maxsz;
-		memcpy(cp, buf, segment);
-		status = spi_write(at25->spi, bounce,
-				segment + at25->addrlen + 1);
-		dev_dbg(&at25->spi->dev, "write %u bytes at %u --> %d\n",
-			segment, offset, status);
-		if (status < 0)
-			break;
+		if (segment > io_limit)
+			segment = io_limit;
+
+		op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(at25_instr(at25, AT25_WRITE, off),
+								  1),
+						   SPI_MEM_OP_ADDR(at25->addrlen, off, 1),
+						   SPI_MEM_OP_NO_DUMMY,
+						   SPI_MEM_OP_DATA_OUT(segment, bounce, 1));
+
+		status = spi_mem_adjust_op_size(at25->spimem, &op);
+		if (status)
+			return status;
+		segment = op.data.nbytes;
+
+		memcpy(bounce, buf, segment);
+
+		status = spi_mem_exec_op(at25->spimem, &op);
+		dev_dbg(&at25->spimem->spi->dev, "write %u bytes at %u --> %d\n",
+			segment, off, status);
+		if (status)
+			return status;
 
 		/*
 		 * REVISIT this should detect (or prevent) failed writes
 		 * to read-only sections of the EEPROM...
 		 */
 
-		/* Wait for non-busy status */
-		timeout = jiffies + msecs_to_jiffies(EE_TIMEOUT);
-		retries = 0;
-		do {
-
-			sr = spi_w8r8(at25->spi, AT25_RDSR);
-			if (sr < 0 || (sr & AT25_SR_nRDY)) {
-				dev_dbg(&at25->spi->dev,
-					"rdsr --> %d (%02x)\n", sr, sr);
-				/* at HZ=100, this is sloooow */
-				msleep(1);
-				continue;
-			}
-			if (!(sr & AT25_SR_nRDY))
-				break;
-		} while (retries++ < 3 || time_before_eq(jiffies, timeout));
-
-		if ((sr < 0) || (sr & AT25_SR_nRDY)) {
-			dev_err(&at25->spi->dev,
+		status = at25_wait_ready(at25);
+		if (status < 0) {
+			dev_err_probe(&at25->spimem->spi->dev, status,
+				      "Read Status Redister command failed\n");
+			return status;
+		}
+		if (status) {
+			dev_dbg(&at25->spimem->spi->dev,
+				"Status %02x\n", status);
+			dev_err(&at25->spimem->spi->dev,
 				"write %u bytes offset %u, timeout after %u msecs\n",
-				segment, offset,
-				jiffies_to_msecs(jiffies -
-					(timeout - EE_TIMEOUT)));
-			status = -ETIMEDOUT;
-			break;
+				segment, off, EE_TIMEOUT);
+			return -ETIMEDOUT;
 		}
 
 		off += segment;
@@ -310,9 +310,6 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 
 	} while (count > 0);
 
-	mutex_unlock(&at25->lock);
-
-	kfree(bounce);
 	return status;
 }
 
@@ -429,31 +426,33 @@ static const struct spi_device_id at25_spi_ids[] = {
 };
 MODULE_DEVICE_TABLE(spi, at25_spi_ids);
 
-static int at25_probe(struct spi_device *spi)
+static int at25_probe(struct spi_mem *mem)
 {
-	struct at25_data	*at25 = NULL;
-	int			err;
-	int			sr;
+	struct spi_device *spi = mem->spi;
 	struct spi_eeprom *pdata;
+	struct at25_data *at25;
 	bool is_fram;
+	int err;
+
+	at25 = devm_kzalloc(&spi->dev, sizeof(*at25), GFP_KERNEL);
+	if (!at25)
+		return -ENOMEM;
+
+	at25->spimem = mem;
 
 	/*
 	 * Ping the chip ... the status register is pretty portable,
-	 * unlike probing manufacturer IDs. We do expect that system
-	 * firmware didn't write it in the past few milliseconds!
+	 * unlike probing manufacturer IDs.
 	 */
-	sr = spi_w8r8(spi, AT25_RDSR);
-	if (sr < 0 || sr & AT25_SR_nRDY) {
-		dev_dbg(&spi->dev, "rdsr --> %d (%02x)\n", sr, sr);
+	err = at25_wait_ready(at25);
+	if (err < 0)
+		return dev_err_probe(&spi->dev, err, "Read Status Register command failed\n");
+	if (err) {
+		dev_err(&spi->dev, "Not ready (%02x)\n", err);
 		return -ENXIO;
 	}
 
-	at25 = devm_kzalloc(&spi->dev, sizeof(*at25), GFP_KERNEL);
-	if (!at25)
-		return -ENOMEM;
-
 	mutex_init(&at25->lock);
-	at25->spi = spi;
 	spi_set_drvdata(spi, at25);
 
 	is_fram = fwnode_device_is_compatible(dev_fwnode(&spi->dev), "cypress,fm25");
@@ -514,17 +513,19 @@ static int at25_probe(struct spi_device *spi)
 
 /*-------------------------------------------------------------------------*/
 
-static struct spi_driver at25_driver = {
-	.driver = {
-		.name		= "at25",
-		.of_match_table = at25_of_match,
-		.dev_groups	= sernum_groups,
+static struct spi_mem_driver at25_driver = {
+	.spidrv = {
+		.driver = {
+			.name		= "at25",
+			.of_match_table = at25_of_match,
+			.dev_groups	= sernum_groups,
+		},
+		.id_table	= at25_spi_ids,
 	},
 	.probe		= at25_probe,
-	.id_table	= at25_spi_ids,
 };
 
-module_spi_driver(at25_driver);
+module_spi_mem_driver(at25_driver);
 
 MODULE_DESCRIPTION("Driver for most SPI EEPROMs");
 MODULE_AUTHOR("David Brownell");
-- 
2.50.0

