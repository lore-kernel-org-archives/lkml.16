Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38241F542E;
	Mon, 23 Jun 2025 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663111; cv=none; b=XKrRocqebBf6K77PEEUuYf48JWZgrUSh/R6zuUoPY4YL47hukcTh9gPfozcuiXWYb7IEBcpW4+fkTRJcPKXLNPWZ/K6LjTezdVcAr2ElyH4D5p4M1ho8eA/pVE+KkPJnM8maWhEEq6C7f+yW1HLx6dcvA7kNMGf5ArgX5/26p6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663111; c=relaxed/simple;
	bh=D6+251s1fV7db7xlToXjbMxK82Iw9fpLuaxsFRGIhI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqhD1t9NtmBin+stOOIWQGpB1n7aflrbal7mHUYxXzmBZ7BQ6Z0EXBjMrCd+3rX0UpyUJJEFZV42Kg071oNfcbqqXsaC1Iw004LWU2e11sycHxQLojIQT2ZF2jaMb41Nw5INaTPztukj2Uux66m/J9Ue8ukxUDfZhcZW4n3pzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyT7L9qy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyT7L9qy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23649faf69fso37511655ad.0;
        Mon, 23 Jun 2025 00:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750663108; x=1751267908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTAlGsyLFuKsCsJi/dgv91hGpi96WJYdyyBaohh5L7U=;
        b=QyT7L9qydJaOyuflbgNCruZ4RqhIwCJib2jUvEemL3TJ+DTLuWiataNZiKH8/WLZGS
         +oKc2oTOxlZ1ZD7JrmpczfwRY4LI92gL8G1fg1N1YcV1/BRehetFW2Al8PmwABuGXnvV
         ETYA5BwHDr4tu7tkN9iXuiyzU7LJueKhYj8mNxShtogSq0N3WHIDmXS3STOayV6qjcDL
         NHRAo8U9yflkxTvaq0n7Gm5siGawmCUJCy8cqQSQPCFkNtbQZIByU7DG3l6yl1mEvGL7
         7DEi2BZV1FmBNW/5jnCCoe0e5K5U9i+zxLFRMYvwoo79FiuvJrZ0vh6rE5dFRcTCIn4s
         543Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663108; x=1751267908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTAlGsyLFuKsCsJi/dgv91hGpi96WJYdyyBaohh5L7U=;
        b=c6nYYtOCmNp2185GS8jZBZtwNgEc5fb044mNPu8AZvQcThBTNJr1qc9USxyMFKZ19B
         jehJRakko7eB2OtA8N7wcClZjhEMISb025FKIhDtFQs+E9rtsE3PQt30YziBylltgp8R
         ZeDmC96pumQo9Q/cB2ZuJKT3dsyx+YE9AfuMlJNeDiTGTlM25gN5HDM3eecTe5HuZ3oi
         TuzcFPkLQ4SoXZyUqNIzwbnlBNl778NArOf6UOXX4cg8UuBGzm8P5Ggu7Z5IViD+KzsU
         1sJN3igpNJ49w9M3Z+pzWIQwin5lYz8C0thMtxYg9Epcx41wl/dOgnSMtRshDrbRJt92
         n/6g==
X-Forwarded-Encrypted: i=1; AJvYcCVNk+j4OXuhhZzodDI4zuyrLNPyDU14/2ShhTRYb3Um72lOXYvxoxotjWFtqhD05ddm1uEghAux01IBg2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH333FfFp2Ew0JLqM8+CupoNtsRr9OOUm5DXJ1UpImJKcAppJ7
	M5klSdyAt/7iilQ0Wh5xRVq7N5x3y77bZaw5YTmK7Vrp5gPZW6OYaIEgfGQwEA==
X-Gm-Gg: ASbGncvOPDzurOrT2rdLStl1kZya3oagmT2RwDNbzJQnkPq10djoN+EbKB7T4SO/pVl
	3ZH3fENqpmw5hlBTtxZ7aQiiuNDu1cHWactXcYfQeYGzew6+VkuIKP2PAm7H5Hh6afEBnUYQrQd
	DzpUY0clGPR52BcVNeJIONzkBuPBEfFn7MNaRWQm9XAIcHrWZ90IxxvYf0IhhijN2orjhzTWoDo
	zYMDje5ZOgxhLj0yIiF5XGuXWwyQCR6I2NovmdtsRKb0zbt3V/yBcblNrorqNKqDGleUQg+PKeT
	o8gvzyb5Ih+gGEERLeVPT86hRU0LS59k2FattG8eGD4Iffx46WP0aAoNIjI8yY17hRpPu6DKvP+
	fkgjd0LOeZkDq26RZTyyLli02b7azByPOy31ke5rxmF3quwB/onqaA8KH8eobPqLqSA==
X-Google-Smtp-Source: AGHT+IFhCN+ZvwWk6Y40wsAU68hVwnW7etNQCS76KLPDlFtq8WZMBgUo9tet0X7c6C+0CpHwfJEFFQ==
X-Received: by 2002:a17:903:2381:b0:234:8c52:1f9b with SMTP id d9443c01a7336-237d9ab0946mr202995425ad.43.1750663107590;
        Mon, 23 Jun 2025 00:18:27 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e358-921b-7902-4a20-67b4-38da.emome-ip6.hinet.net. [2001:b400:e358:921b:7902:4a20:67b4:38da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119e4e8sm7234892a12.26.2025.06.23.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:18:26 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: [PATCH v3 1/1] USB: serial: nct_usb_serial: add support for Nuvoton USB adapter
Date: Mon, 23 Jun 2025 15:17:13 +0800
Message-ID: <20250623071713.12814-2-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623071713.12814-1-syhuang3@nuvoton.com>
References: <2ff4dd60-7579-40ce-a4e5-3ad846659f9c@suse.com>
 <20250623071713.12814-1-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Add support for the Nuvoton USB-to-serial adapter, which provides
multiple serial ports over a single USB interface.

The device exposes one control endpoint, one bulk-in endpoint, and
one bulk-out endpoint for data transfer. Port status is reported via
an interrupt-in or bulk-in endpoint, depending on device configuration.

This driver implements basic TTY operations.

Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
---
 drivers/usb/serial/Kconfig          |   10 +
 drivers/usb/serial/Makefile         |    1 +
 drivers/usb/serial/nct_usb_serial.c | 1553 +++++++++++++++++++++++++++
 3 files changed, 1564 insertions(+)
 create mode 100644 drivers/usb/serial/nct_usb_serial.c

diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
index ef8d1c73c754..3c4871de56f4 100644
--- a/drivers/usb/serial/Kconfig
+++ b/drivers/usb/serial/Kconfig
@@ -112,6 +112,16 @@ config USB_SERIAL_CH341
 	  To compile this driver as a module, choose M here: the
 	  module will be called ch341.
 
+config USB_SERIAL_NUV_MULTI_UART
+	tristate "USB Nuvoton Multi-Ports Serial Driver"
+	depends on USB_SERIAL
+	help
+	Say Y here if you want to use a Nuvoton Multi-Ports USB to
+	serial converter device
+	
+	To compile this driver as a module, choose M here: the
+	module will be called nct_usb_serial.
+
 config USB_SERIAL_WHITEHEAT
 	tristate "USB ConnectTech WhiteHEAT Serial Driver"
 	select USB_EZUSB_FX2
diff --git a/drivers/usb/serial/Makefile b/drivers/usb/serial/Makefile
index c7bb1a88173e..c07919a52076 100644
--- a/drivers/usb/serial/Makefile
+++ b/drivers/usb/serial/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_USB_SERIAL_MOS7720)		+= mos7720.o
 obj-$(CONFIG_USB_SERIAL_MOS7840)		+= mos7840.o
 obj-$(CONFIG_USB_SERIAL_MXUPORT)		+= mxuport.o
 obj-$(CONFIG_USB_SERIAL_NAVMAN)			+= navman.o
+obj-$(CONFIG_USB_SERIAL_NUV_MULTI_UART)		+= nct_usb_serial.o
 obj-$(CONFIG_USB_SERIAL_OMNINET)		+= omninet.o
 obj-$(CONFIG_USB_SERIAL_OPTICON)		+= opticon.o
 obj-$(CONFIG_USB_SERIAL_OPTION)			+= option.o
diff --git a/drivers/usb/serial/nct_usb_serial.c b/drivers/usb/serial/nct_usb_serial.c
new file mode 100644
index 000000000000..931787d708c0
--- /dev/null
+++ b/drivers/usb/serial/nct_usb_serial.c
@@ -0,0 +1,1553 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024-2025 Nuvoton Corp.
+ * Copyright (C) 2024-2025 Sheng-Yuan Huang <syhuang3@nuvoton.com>
+ *
+ * Nuvoton USB to serial adapter driver
+ *
+ * This device interface consists of one control endpoint for configuration,
+ * one bulk-out endpoint used for transmitting data for all serial ports,
+ * and one bulk-in endpoint for receiving data from all serial ports.
+ * The status of the ports may be reported via either an interrupt endpoint
+ * or the bulk-in endpoint, depending on the device configuration.
+ */
+
+#include <linux/bitops.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/serial.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/tty.h>
+#include <linux/tty_driver.h>
+#include <linux/tty_flip.h>
+#include <linux/uaccess.h>
+#include <linux/usb.h>
+#include <linux/usb/serial.h>
+#include <linux/version.h>
+
+#define NCT_VENDOR_ID			0x0416
+#define NCT_PRODUCT_ID			0x200B
+#define NCT_USB_CLASS			0xFF
+#define NCT_USB_SUBCLASS		0x0
+#define NCT_USB_PROTOCOL		0x1
+
+#define NCT_MAX_VENDOR_READ_SIZE	8
+
+static const struct usb_device_id id_table[] = {
+	{USB_DEVICE_AND_INTERFACE_INFO(NCT_VENDOR_ID, NCT_PRODUCT_ID, NCT_USB_CLASS,
+				       NCT_USB_SUBCLASS, NCT_USB_PROTOCOL)},
+	{} /* Terminating entry */
+};
+
+#define NCT_DRVNAME "nct_mtuart"
+
+MODULE_DEVICE_TABLE(usb, id_table);
+
+#define NCT_MAX_SEND_BULK_SIZE 128
+#define NCT_EMPTY_PORT	0xFF	/* The port does not exist in FW (For device status) */
+
+/*
+ * The max loop count when disconnecting for the
+ * send-work
+ */
+#define NCT_DISCONN_QUEUE_LOOP_CNT	10
+
+/* Hardware configure */
+#define NCT_MAX_NUM_COM_DEVICES		8
+#define NCT_MAX_PACKAGE_SIZE		4096 /* The max size of one writing package */
+#define NCT_MAX_BULK_IN_SIZE		512
+#define NCT_MAX_BULK_OUT_SIZE		512
+
+#define NCT_DEFAULT_BAUD		14 /* 115200 */
+static const unsigned int NCT_BAUD_SUP[] = {
+	/* It should be the same as FW's baud-rate table */
+	B0,	B50,	B75,	B150,	B300,	B600,	B1200,
+	B1800,	B2400,	B4800,	B9600,	B19200,	B38400,	B57600,
+	B115200, B230400, B460800, B921600, B1500000
+};
+
+/* USB request */
+#define NCT_VENDOR_COM_READ_REQUEST_TYPE	0xc0
+#define NCT_VENDOR_COM_WRITE_REQUEST_TYPE	0x40
+#define NCT_VENDOR_COM_READ_REQUEST		0x01
+#define NCT_VENDOR_COM_WRITE_REQUEST		0x01
+/* Index definition */
+#define NCT_VCOM_INDEX_0	0
+#define NCT_VCOM_INDEX_1	1
+#define NCT_VCOM_INDEX_2	2
+#define NCT_VCOM_INDEX_3	3
+#define NCT_VCOM_INDEX_4	4
+#define NCT_VCOM_INDEX_5	5
+#define NCT_VCOM_INDEX_GLOBAL	0xF
+
+/* Command */
+#define NCT_VCOM_GET_NUM_PORTS		0
+#define NCT_VCOM_GET_PORTS_SUPPORT	1
+#define NCT_VCOM_GET_BAUD		2
+#define NCT_VCOM_SET_INIT		3
+#define NCT_VCOM_SET_CONFIG		4
+#define NCT_VCOM_SET_BAUD		5
+#define NCT_VCOM_SET_HCR		6
+#define NCT_VCOM_SET_OPEN_PORT		7
+#define NCT_VCOM_SET_CLOSE_PORT		8
+#define NCT_VCOM_SILENT			9
+/* Use bulk-in status instead of interrupt-in status */
+#define NCT_VCON_SET_BULK_IN_STATUS	10
+
+struct nct_vendor_cmd {
+	__le16 val;	/* bits[3:0]: index, bits[11:4]: cmd, bits[15:12]: reserved */
+};
+
+#define NCT_CMD_INDEX_MASK	0x000F
+#define NCT_CMD_CMD_MASK	0x0FF0
+#define NCT_CMD_CMD_SHIFT	4
+
+static inline __le16 nct_build_cmd(__u8 cmd_code, __u8 index)
+{
+	return cpu_to_le16((cmd_code << NCT_CMD_CMD_SHIFT) | (index & NCT_CMD_INDEX_MASK));
+}
+
+static inline __u8 nct_get_cmd_index(__le16 val)
+{
+	return le16_to_cpu(val) & NCT_CMD_INDEX_MASK;
+}
+
+static inline __u8 nct_get_cmd_cmd(__le16 val)
+{
+	return (le16_to_cpu(val) & NCT_CMD_CMD_MASK) >> NCT_CMD_CMD_SHIFT;
+}
+
+#define NCT_HDR_MAGIC		0xA5
+#define NCT_HDR_MAGIC2		0x5A
+#define NCT_HDR_MAGIC_STATUS	0x5B
+
+struct nct_packet_header {
+	__u8 magic;
+	__u8 magic2;
+	__le16 len_and_idx;  /* bits[3:0]: idx, bits[15:4]: len */
+} __packed;
+
+#define NCT_HDR_IDX_MASK	0x000F
+#define NCT_HDR_LEN_MASK	0xFFF0
+#define NCT_HDR_LEN_SHIFT	4
+
+static inline void nct_set_hdr_idx_len(struct nct_packet_header *hdr, __u8 idx, __u16 len)
+{
+	hdr->len_and_idx = cpu_to_le16((len << NCT_HDR_LEN_SHIFT) | (idx & NCT_HDR_IDX_MASK));
+}
+
+static inline __u8 nct_get_hdr_idx(const struct nct_packet_header *hdr)
+{
+	return le16_to_cpu(hdr->len_and_idx) & NCT_HDR_IDX_MASK;
+}
+
+static inline __u16 nct_get_hdr_len(const struct nct_packet_header *hdr)
+{
+	return (le16_to_cpu(hdr->len_and_idx) & NCT_HDR_LEN_MASK) >> NCT_HDR_LEN_SHIFT;
+}
+
+/* The definitions are for the fields of nct_ctrl_msg */
+#define NCT_VCOM_1_STOP_BIT		0
+#define NCT_VCOM_2_STOP_BITS		1
+#define NCT_VCOM_PARITY_NONE		0
+#define NCT_VCOM_PARITY_ODD		1
+#define NCT_VCOM_PARITY_EVEN		2
+#define NCT_VCOM_DL5			0
+#define NCT_VCOM_DL6			1
+#define NCT_VCOM_DL7			2
+#define NCT_VCOM_DL8			3
+#define NCT_VCOM_DISABLE_FLOW_CTRL	0
+#define NCT_VCOM_XOFF			1
+#define NCT_VCOM_RTS_CTS		2
+
+struct nct_ctrl_msg {
+	__le16 val;
+};
+
+#define NCT_CTRL_STOP_BIT_MASK		0x0001
+#define NCT_CTRL_PARITY_MASK		0x0006
+#define NCT_CTRL_PARITY_SHIFT		1
+#define NCT_CTRL_DATA_LEN_MASK		0x0018
+#define NCT_CTRL_DATA_LEN_SHIFT		3
+#define NCT_CTRL_FLOW_MASK		0x0060
+#define NCT_CTRL_FLOW_SHIFT		5
+#define NCT_CTRL_SPD_MASK		0x0F80
+#define NCT_CTRL_SPD_SHIFT		7
+#define NCT_CTRL_RESERVED_MASK		0xF000
+#define NCT_CTRL_RESERVED_SHIFT		12
+
+static inline __le16 nct_build_ctrl_msg(__u8 stop_bit, __u8 parity, __u8 data_len,
+					__u8 flow, __u8 spd)
+{
+	__u16 val = 0;
+
+	val |= (stop_bit & 0x01);
+	val |= ((parity & 0x03) << NCT_CTRL_PARITY_SHIFT);
+	val |= ((data_len & 0x03) << NCT_CTRL_DATA_LEN_SHIFT);
+	val |= ((flow & 0x03) << NCT_CTRL_FLOW_SHIFT);
+	val |= ((spd & 0x1F) << NCT_CTRL_SPD_SHIFT);
+
+	return cpu_to_le16(val);
+}
+
+static inline __u8 nct_get_ctrl_stop_bit(__le16 val)
+{
+	return le16_to_cpu(val) & NCT_CTRL_STOP_BIT_MASK;
+}
+
+static inline __u8 nct_get_ctrl_parity(__le16 val)
+{
+	return (le16_to_cpu(val) & NCT_CTRL_PARITY_MASK) >> NCT_CTRL_PARITY_SHIFT;
+}
+
+static inline __u8 nct_get_ctrl_data_len(__le16 val)
+{
+	return (le16_to_cpu(val) & NCT_CTRL_DATA_LEN_MASK) >> NCT_CTRL_DATA_LEN_SHIFT;
+}
+
+static inline __u8 nct_get_ctrl_flow(__le16 val)
+{
+	return (le16_to_cpu(val) & NCT_CTRL_FLOW_MASK) >> NCT_CTRL_FLOW_SHIFT;
+}
+
+static inline __u8 nct_get_ctrl_spd(__le16 val)
+{
+	return (le16_to_cpu(val) & NCT_CTRL_SPD_MASK) >> NCT_CTRL_SPD_SHIFT;
+}
+
+static inline __le16 nct_set_ctrl_spd(__le16 val, __u8 spd)
+{
+	__u16 cpu_val = le16_to_cpu(val);
+
+	cpu_val = (cpu_val & ~NCT_CTRL_SPD_MASK) | ((spd & 0x1F) << NCT_CTRL_SPD_SHIFT);
+	return cpu_to_le16(cpu_val);
+}
+
+#define NCT_USR_RDR	0x01
+#define NCT_USR_ORR	0x02
+#define NCT_USR_PBER	0x04
+#define NCT_USR_NSER	0x08
+#define NCT_USR_SBD	0x10
+#define NCT_USR_TBRE	0x20
+#define NCT_USR_TSRE	0x40
+#define NCT_USR_RFEI	0x80
+#define NCT_HSR_TCTS	0x01
+#define NCT_HSR_TDSR	0x02
+#define NCT_HSR_FERI	0x04
+#define NCT_HSR_TDCD	0x08
+#define NCT_HSR_CTS	0x10
+#define NCT_HSR_DSR	0x20
+#define NCT_HSR_RI	0x40
+#define NCT_HSR_DCD	0x80
+#define NCT_HCR_DTR	0x01
+#define NCT_HCR_RTS	0x02
+#define NCT_UART_STATE_MSR_MASK (NCT_HSR_TCTS | NCT_HSR_TDSR | NCT_HSR_TDCD | NCT_HSR_DCD)
+struct nct_port_status {
+	u8 index;
+	u8 usr;
+	u8 hsr;
+	u8 hcr;
+};
+
+struct nct_serial {
+	spinlock_t serial_lock; /* Protects the private data in structure 'usb_serial' */
+	bool device_init;
+
+	/* Reading data information */
+	struct nct_tty_port *cur_port;
+	int cur_len;
+
+	bool status_trans_mode;
+	u8 en_device_mask;
+	u8 last_assigned_hw_idx;
+	struct usb_endpoint_descriptor *bulk_out_ep;
+};
+
+struct nct_tty_port {
+	unsigned long sysrq; /* Sysrq timeout */
+	u8 hw_idx;
+	u8 usr;
+	u8 hsr;
+	u8 hcr;
+	/*
+	 * Flow control - stop writing data to device.
+	 * 0: Write enable, 1: Stop writing
+	 */
+	bool flow_stop_wrt;
+
+	spinlock_t port_lock; /* Protects the port data */
+	bool write_urb_in_use;
+};
+
+/* Functions */
+
+/* Read from USB control pipe */
+static int nct_vendor_read(struct usb_interface *intf, struct nct_vendor_cmd cmd,
+			   unsigned char *buf, int size)
+{
+	struct device *dev = &intf->dev;
+	struct usb_device *udev = interface_to_usbdev(intf);
+	u8 *tmp_buf;
+	int res;
+
+	tmp_buf = kmalloc(NCT_MAX_VENDOR_READ_SIZE, GFP_KERNEL);
+	if (!tmp_buf)
+		return -ENOMEM;
+
+	if (size > NCT_MAX_VENDOR_READ_SIZE) {
+		dev_err(dev, "%s - failed to read [%04x]: over size %d\n",
+			__func__, nct_get_cmd_cmd(cmd.val), size);
+		kfree(tmp_buf);
+		return -EINVAL;
+	}
+
+	res = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
+			      NCT_VENDOR_COM_READ_REQUEST,
+			      NCT_VENDOR_COM_READ_REQUEST_TYPE,
+			      le16_to_cpu(cmd.val),
+			      intf->cur_altsetting->desc.bInterfaceNumber,
+			      tmp_buf, size, 100);
+
+	if (res < 0) {
+		dev_err(dev, "%s - failed to read [%04x]: %d\n", __func__,
+			nct_get_cmd_cmd(cmd.val), res);
+		kfree(tmp_buf);
+		return res;
+	}
+	memcpy(buf, tmp_buf, res);
+	kfree(tmp_buf);
+
+	return res;
+}
+
+static int nct_vendor_write(struct usb_interface *intf, struct nct_vendor_cmd cmd, __u16 val)
+{
+	struct device *dev = &intf->dev;
+	struct usb_device *udev = interface_to_usbdev(intf);
+	int res;
+	__le16 *buf_val;
+
+	buf_val = kmalloc(2, GFP_KERNEL);
+	if (!buf_val)
+		return -ENOMEM;
+
+	*buf_val = cpu_to_le16(val);
+
+	res = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
+			      NCT_VENDOR_COM_WRITE_REQUEST,
+			      NCT_VENDOR_COM_WRITE_REQUEST_TYPE,
+			      le16_to_cpu(cmd.val),
+			      intf->cur_altsetting->desc.bInterfaceNumber,
+			      buf_val,
+			      2,
+			      100);
+	kfree(buf_val);
+	if (res < 0)
+		dev_err(dev, "%s - failed to write [%04x]: %d\n", __func__,
+			nct_get_cmd_cmd(cmd.val), res);
+	else
+		res = 0; /* Set to 0 to align with the design. */
+
+	return res;
+}
+
+static u16 nct_set_baud(struct usb_interface *intf, u16 index, unsigned int cflag, bool *found)
+{
+	struct nct_vendor_cmd cmd;
+	struct nct_ctrl_msg msg;
+	u16 i;
+	u8 spd = NCT_DEFAULT_BAUD;
+
+	*found = false;
+	cmd.val = nct_build_cmd(NCT_VCOM_SET_BAUD, index);
+	dev_dbg(&intf->dev, "tty baud: 0x%X\n", (cflag & CBAUD));
+	for (i = 0; i < ARRAY_SIZE(NCT_BAUD_SUP); i++) {
+		if ((cflag & CBAUD) == NCT_BAUD_SUP[i]) {
+			spd = i;
+			dev_dbg(&intf->dev, "index %d set baud: NCT_BAUD_SUP[%d]=%d\n",
+				index, spd, NCT_BAUD_SUP[i]);
+			/*
+			 * Create control message
+			 * Note: The NCT_VCOM_SET_BAUD only set the baud rate
+			 */
+			msg.val = nct_build_ctrl_msg(0, 0, 0, 0, spd);
+			if (nct_vendor_write(intf, cmd, le16_to_cpu(msg.val)))
+				dev_err(&intf->dev, "%s - Set index: %d speed error\n",
+					__func__, index);
+			else
+				*found = true;
+
+			break;
+		}
+	}
+
+	if (!*found)
+		dev_warn(&intf->dev, "Unsupported baud rate 0x%X requested\n", (cflag & CBAUD));
+
+	return spd;
+}
+
+static void nct_serial_set_termios(struct tty_struct *tty,
+				   struct usb_serial_port *port,
+				   const struct ktermios *old)
+{
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	struct usb_interface *intf = serial->interface;
+	struct ktermios *termios = &tty->termios;
+	struct nct_ctrl_msg msg;
+	struct nct_vendor_cmd cmd;
+	unsigned int cflag = termios->c_cflag;
+	int ret;
+	speed_t baud, old_baud;
+	u8 stop_bit, parity, data_len, flow, spd = 0;
+	bool baud_found;
+
+	baud_found = false;
+	baud = tty_get_baud_rate(tty);
+	if (old && tty_termios_baud_rate(old))
+		old_baud = tty_termios_baud_rate(old);
+	else
+		old_baud = NCT_BAUD_SUP[NCT_DEFAULT_BAUD];
+
+	cmd.val = nct_build_cmd(NCT_VCOM_SET_CONFIG, tport->hw_idx);
+
+	/* Set stop bit */
+	stop_bit = (cflag & CSTOPB) ? (NCT_VCOM_2_STOP_BITS) : (NCT_VCOM_1_STOP_BIT);
+
+	/* Set parity */
+	if (cflag & PARENB)
+		parity = (cflag & PARODD) ? NCT_VCOM_PARITY_ODD : NCT_VCOM_PARITY_EVEN;
+	else
+		parity = NCT_VCOM_PARITY_NONE;
+
+	/* Set data bit length */
+	switch (cflag & CSIZE) {
+	case CS5:
+		data_len = NCT_VCOM_DL5;
+		break;
+	case CS6:
+		data_len = NCT_VCOM_DL6;
+		break;
+	case CS7:
+		data_len = NCT_VCOM_DL7;
+		break;
+	default:
+	case CS8:
+		data_len = NCT_VCOM_DL8;
+		break;
+	}
+
+	/* Set flow control */
+	if (C_CRTSCTS(tty)) {
+		flow = NCT_VCOM_RTS_CTS;
+		/* Flow control - Set flag of RTSCTS */
+		tty_port_set_cts_flow(tty->port, true);
+	} else if (I_IXON(tty)) {
+		flow = NCT_VCOM_XOFF;
+		/* Flow control - Clear flag of RTSCTS */
+		tty_port_set_cts_flow(tty->port, false);
+	} else {
+		flow = NCT_VCOM_DISABLE_FLOW_CTRL;
+		/* Flow control - Clear flag of RTSCTS */
+		tty_port_set_cts_flow(tty->port, false);
+	}
+
+	/* Create control message */
+	msg.val = nct_build_ctrl_msg(stop_bit, parity, data_len, flow, spd);
+
+	ret = nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
+	if (ret)
+		dev_err(&intf->dev,
+			"%s - Set index: %d set configure error\n",
+			__func__, nct_get_cmd_index(cmd.val));
+
+	/*
+	 * Set baud if speed changed
+	 * Note: 'nct_set_baud()' also send the speed to the FW
+	 */
+	if (!old ||
+	    old->c_cflag != termios->c_cflag ||
+	    old->c_ispeed != termios->c_ispeed ||
+	    old->c_ospeed != termios->c_ospeed) {
+		spd = nct_set_baud(intf, tport->hw_idx, cflag, &baud_found);
+	}
+
+	if (baud_found)
+		tty_encode_baud_rate(tty, baud, baud);
+	else
+		tty_encode_baud_rate(tty, old_baud, old_baud);
+}
+
+static int nct_serial_break(struct tty_struct *tty, int break_state)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	struct usb_interface *intf = serial->interface;
+	struct nct_vendor_cmd cmd;
+
+	cmd.val = nct_build_cmd(NCT_VCOM_SILENT, tport->hw_idx);
+
+	return nct_vendor_write(intf, cmd, 0);
+}
+
+static int nct_tiocmset_helper(struct tty_struct *tty, unsigned int set,
+			       unsigned int clear)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	struct usb_interface *intf = serial->interface;
+	struct nct_ctrl_msg msg;
+	struct nct_vendor_cmd cmd;
+	unsigned long flags;
+	u8 hcr = 0;
+
+	if (set & TIOCM_RTS)
+		hcr |= NCT_HCR_RTS;
+	if (set & TIOCM_DTR)
+		hcr |= NCT_HCR_DTR;
+	if (clear & TIOCM_RTS)
+		hcr &= ~NCT_HCR_RTS;
+	if (clear & TIOCM_DTR)
+		hcr &= ~NCT_HCR_DTR;
+
+	cmd.val = nct_build_cmd(NCT_VCOM_SET_HCR, tport->hw_idx);
+	msg.val = cpu_to_le16(hcr);
+
+	spin_lock_irqsave(&tport->port_lock, flags);
+	tport->hcr = hcr;
+	spin_unlock_irqrestore(&tport->port_lock, flags);
+
+	dev_dbg(&intf->dev,
+		"index/cmd/val(hcr)=%X, %X, %X [RTS=%X, DTR=%X]\n",
+		nct_get_cmd_index(cmd.val), nct_get_cmd_cmd(cmd.val),
+		le16_to_cpu(msg.val), hcr & NCT_HCR_RTS, hcr & NCT_HCR_DTR);
+
+	return nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
+}
+
+static int nct_serial_tiocmget(struct tty_struct *tty)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	struct usb_interface *intf = serial->interface;
+
+	unsigned long flags;
+	unsigned int res;
+	u8 hcr, hsr;
+
+	spin_lock_irqsave(&tport->port_lock, flags);
+	hcr = tport->hcr;
+	hsr = tport->hsr;
+	spin_unlock_irqrestore(&tport->port_lock, flags);
+	res = ((hcr & NCT_HCR_DTR) ? TIOCM_DTR : 0) |
+		((hcr & NCT_HCR_RTS) ? TIOCM_RTS : 0) |
+		((hsr & NCT_HSR_CTS) ? TIOCM_CTS : 0) |
+		((hsr & NCT_HSR_DSR) ? TIOCM_DSR : 0) |
+		((hsr & NCT_HSR_TDCD) ? TIOCM_RI : 0) |
+		((hsr & NCT_HSR_DCD) ? TIOCM_CD : 0);
+
+	dev_dbg(&intf->dev, "DTR/RTS/CTS/DSR=%X,%X,%X,%X\n",
+		(hcr & NCT_HCR_DTR), (hcr & NCT_HCR_RTS),
+		(hsr & NCT_HSR_CTS), (hsr & NCT_HSR_DSR));
+
+	return res;
+}
+
+static void nct_rx_throttle(struct tty_struct *tty)
+{
+	/* Handle RTS line for RTS/CTS flow control */
+	if (C_CRTSCTS(tty))
+		nct_tiocmset_helper(tty, 0, TIOCM_RTS);
+}
+
+static void nct_rx_unthrottle(struct tty_struct *tty)
+{
+	/* Handle RTS line for RTS/CTS flow control */
+	if (C_CRTSCTS(tty))
+		nct_tiocmset_helper(tty, TIOCM_RTS, 0);
+}
+
+static int nct_serial_write_data(struct tty_struct *tty, struct usb_serial_port *port,
+				 const unsigned char *buf, int count)
+{
+	int ret;
+	unsigned long flags;
+	struct nct_packet_header hdr;
+	int wr_len;
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+
+	wr_len = min((unsigned int)count, NCT_MAX_SEND_BULK_SIZE - sizeof(hdr));
+
+	if (!wr_len)
+		return 0;
+
+	spin_lock_irqsave(&tport->port_lock, flags);
+
+	if (tport->write_urb_in_use) {
+		spin_unlock_irqrestore(&tport->port_lock, flags);
+		return 0;
+	}
+
+	/* Fill header */
+	hdr.magic = NCT_HDR_MAGIC;
+	hdr.magic2 = NCT_HDR_MAGIC2;
+	nct_set_hdr_idx_len(&hdr, tport->hw_idx, wr_len); /* The 'hw_idx' is based on 1 */
+
+	/* Copy data */
+	memcpy(port->write_urb->transfer_buffer + sizeof(hdr),
+	       (const void *)buf, wr_len);
+
+	/* Filled urb data */
+	memcpy(port->write_urb->transfer_buffer, (const void *)&hdr,
+	       sizeof(hdr)); /* Copy header after filling all other fields */
+
+	/* Set urb length(Total length) */
+	port->write_urb->transfer_buffer_length = wr_len + sizeof(hdr);
+
+	port->write_urb->transfer_flags |= URB_ZERO_PACKET;
+
+	ret = usb_submit_urb(port->write_urb, GFP_ATOMIC);
+	if (ret < 0) {
+		dev_err(&port->dev,
+			"%s: usb_submit_urb failed, ret=%d, hw_idx=%d\n",
+			__func__, ret, tport->hw_idx);
+	} else {
+		tport->write_urb_in_use = true; /* Set it as busy */
+		ret = wr_len + sizeof(hdr);
+	}
+
+	spin_unlock_irqrestore(&tport->port_lock, flags);
+
+	if (ret > sizeof(hdr))
+		ret = ret - sizeof(hdr);
+
+	dev_dbg(&port->dev, "returning %d\n", ret);
+	return ret;
+}
+
+static int nct_serial_write(struct tty_struct *tty, struct usb_serial_port *port,
+			    const unsigned char *buf, int count)
+{
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+
+	if (!port) {
+		pr_err("%s: port is NULL!\n", __func__);
+		return -EIO;
+	}
+	if (!port->write_urb) {
+		dev_err(&port->dev, "%s: write_urb not initialized!\n",	__func__);
+		return -EIO;
+	}
+	if (!port->write_urb->transfer_buffer) {
+		dev_err(&port->dev, "%s: transfer_buffer not initialized!\n", __func__);
+		return -EIO;
+	}
+
+	/* Flow control */
+	if (tty_port_cts_enabled(tty->port))
+		if (tport->flow_stop_wrt)
+			return 0;
+
+	return nct_serial_write_data(tty, port, buf, count);
+}
+
+static void nct_write_bulk_callback(struct urb *urb)
+{
+	struct usb_serial_port *port = urb->context;
+	struct nct_tty_port *tport;
+	unsigned long flags;
+	int status = urb->status;
+
+	/* Port and serial sanity check */
+	if (!port) {
+		pr_err("%s: port is NULL, status=%d\n", __func__, status);
+		return;
+	}
+
+	tport = usb_get_serial_port_data(port);
+	if  (!tport) {
+		dev_err(&port->dev, "%s: port->private is NULL, status=%d\n", __func__, status);
+		return;
+	}
+
+	spin_lock_irqsave(&tport->port_lock, flags);
+	tport->write_urb_in_use = false;
+	spin_unlock_irqrestore(&tport->port_lock, flags);
+
+	tty_port_tty_wakeup(&port->port);
+}
+
+static unsigned int nct_write_room(struct tty_struct *tty)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+	unsigned long flags;
+	unsigned int room;
+
+	spin_lock_irqsave(&tport->port_lock, flags);
+	if (tport->write_urb_in_use)
+		room = 0;
+	else
+		room = NCT_MAX_SEND_BULK_SIZE - sizeof(struct nct_packet_header);
+	spin_unlock_irqrestore(&tport->port_lock, flags);
+
+	dev_dbg(&port->dev, "port=%d, room=%u\n", tport->hw_idx, room);
+	return room;
+}
+
+static unsigned int nct_chars_in_buffer(struct tty_struct *tty)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+	unsigned long flags;
+	unsigned int chars;
+
+	spin_lock_irqsave(&tport->port_lock, flags);
+	if (tport->write_urb_in_use)
+		chars = NCT_MAX_SEND_BULK_SIZE - sizeof(struct nct_packet_header);
+	else
+		chars = 0;
+	spin_unlock_irqrestore(&tport->port_lock, flags);
+
+	dev_dbg(&port->dev, "port=%d, chars=%d\n", tport->hw_idx, chars);
+	return chars;
+}
+
+/*
+ *  Starts reads urb on all ports. It is to avoid potential issues caused by
+ *  multiple ports being opened almost simultaneously.
+ *  It must be called AFTER startup, with urbs initialized.
+ *  Returns 0 if successful, non-zero error otherwise.
+ */
+static int nct_startup_device(struct usb_serial *serial)
+{
+	int ret = 0;
+	struct nct_serial *serial_priv = usb_get_serial_data(serial);
+	struct usb_serial_port *port;
+	unsigned long flags;
+
+	/* Be sure this happens exactly once */
+	spin_lock_irqsave(&serial_priv->serial_lock, flags);
+
+	if (serial_priv->device_init) {
+		spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
+		return 0;
+	}
+	serial_priv->device_init = true;
+	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
+
+	/* Start reading from bulk in endpoint */
+	port = serial->port[0];
+	if (!port->read_urb)
+		dev_dbg(&port->dev, "port->read_urb is null, index=%d\n", 0);
+
+	ret = usb_submit_urb(port->read_urb, GFP_KERNEL);
+	if (ret)
+		dev_err(&port->dev,
+			"%s: usb_submit_urb failed, ret=%d, port=%d\n",
+			__func__, ret, 0);
+
+	/* For getting status from interrupt-in */
+	if (!serial_priv->status_trans_mode) {
+		/* Start reading from interrupt pipe */
+		port = serial->port[0];
+		ret = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
+		if (ret)
+			dev_err(&port->dev,
+				"%s: usb_submit_urb(intr) failed, ret=%d, port=%d\n",
+				__func__, ret, 0);
+	}
+	return ret;
+}
+
+static void nct_serial_port_end(struct usb_serial_port *port)
+{
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	struct usb_interface *intf = serial->interface;
+	struct nct_ctrl_msg msg;
+	struct nct_vendor_cmd cmd;
+
+	/* Send 'Close Port' to the device */
+	cmd.val = nct_build_cmd(NCT_VCOM_SET_CLOSE_PORT, tport->hw_idx);
+	msg.val = cpu_to_le16(0);
+	if (!intf) {
+		pr_err("%s: No intf => do not send 'close' event\n", __func__);
+		return;
+	}
+	nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
+}
+
+static int nct_open(struct tty_struct *tty, struct usb_serial_port *port)
+{
+	struct nct_vendor_cmd cmd;
+	struct nct_ctrl_msg msg;
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	struct nct_serial *serial_priv = usb_get_serial_data(serial);
+	struct usb_interface *intf = serial->interface;
+
+	if (!port->serial)
+		return -ENXIO;
+
+	/* Allocate write_urb */
+	if (!port->write_urb) {
+		port->write_urb = usb_alloc_urb(0, GFP_KERNEL);
+		if (!port->write_urb) {
+			dev_err(&port->dev, "%s: Failed to allocate write URB\n", __func__);
+			return -ENOMEM;
+		}
+	}
+
+	/* Allocate bulk_out_buffer */
+	port->write_urb->transfer_buffer = kmalloc(NCT_MAX_SEND_BULK_SIZE, GFP_KERNEL);
+	if (!port->write_urb->transfer_buffer) {
+		usb_free_urb(port->write_urb);
+		port->write_urb = NULL;
+		return -ENOMEM;
+	}
+
+	/* Clear(init) buffer */
+	memset(port->write_urb->transfer_buffer, 0, NCT_MAX_SEND_BULK_SIZE);
+
+	/* Set write_urb */
+	usb_fill_bulk_urb(port->write_urb, serial->dev,
+			  usb_sndbulkpipe(serial->dev, serial_priv->bulk_out_ep->bEndpointAddress),
+			  port->write_urb->transfer_buffer, NCT_MAX_SEND_BULK_SIZE,
+			  nct_write_bulk_callback, port);
+
+	/* Be sure the device is started up */
+	if (nct_startup_device(port->serial) != 0)
+		return -ENXIO;
+
+	cmd.val = nct_build_cmd(NCT_VCOM_SET_OPEN_PORT, tport->hw_idx);
+	msg.val = cpu_to_le16(0);
+	nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
+	/*
+	 * Delay 1ms for firmware to configure hardware after opening the port.
+	 * (Especially at high speed)
+	 */
+	usleep_range(1000, 2000);
+	return 0;
+}
+
+static void nct_close(struct usb_serial_port *port)
+{
+	struct nct_tty_port *tport = usb_get_serial_port_data(port);
+	unsigned long flags;
+
+	mutex_lock(&port->serial->disc_mutex);
+	/* If disconnected, don't send the close-command to the firmware */
+	if (port->serial->disconnected)
+		goto exit;
+
+	nct_serial_port_end(port);
+
+exit:
+	/* Shutdown any outstanding bulk writes */
+	usb_kill_urb(port->write_urb);
+
+	/* Free transfer_buffer */
+	kfree(port->write_urb->transfer_buffer);
+	port->write_urb->transfer_buffer = NULL;
+
+	if (tport) {
+		spin_lock_irqsave(&tport->port_lock, flags);
+		tport->write_urb_in_use = false;
+		spin_unlock_irqrestore(&tport->port_lock, flags);
+	}
+
+	mutex_unlock(&port->serial->disc_mutex);
+}
+
+static void nct_update_status(struct usb_serial *serial, unsigned char *data)
+{
+	struct nct_port_status *nps = (struct nct_port_status *)data;
+	struct usb_interface *intf = serial->interface;
+	struct nct_tty_port *tport;
+	struct tty_struct *tty;
+	struct usb_serial_port *port;
+	unsigned long flags;
+	bool found;
+	int i;
+
+	if (nps->index >= NCT_MAX_NUM_COM_DEVICES) {
+		if (nps->index != NCT_EMPTY_PORT) /* Un-used port */
+			dev_warn(&intf->dev, "%s: Receive wrong H/W index\n", __func__);
+		return;
+	}
+	if (!(nps->hsr & (NCT_UART_STATE_MSR_MASK | NCT_HSR_CTS)))
+		return; /* No any state changed. */
+	tport = NULL;
+	found = false;
+	for (i = 0; i < serial->type->num_ports; i++) {
+		port = serial->port[i];
+
+		if (!port) {
+			dev_err(&intf->dev, "%s: port[%d] is NULL\n", __func__, i);
+			continue;
+		}
+
+		tport = usb_get_serial_port_data(port);
+
+		if (!tport) {
+			dev_err(&intf->dev, "%s: Get NULL port data for port[%d]\n",
+				__func__, i);
+			continue;
+		}
+
+		if (tport->hw_idx == nps->index) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		dev_err(&intf->dev, "%s: Decode serial packet index failed.\n",	__func__);
+		return;
+	}
+
+	if (!tport) {
+		dev_err(&intf->dev, "%s: Decode serial packet index failed.\n",	__func__);
+		return;
+	}
+
+	spin_lock_irqsave(&tport->port_lock, flags);
+	tport->usr = nps->usr;
+	tport->hsr = nps->hsr;
+	tport->hcr = nps->hcr;
+	tport->sysrq = (tport->sysrq & ~0x01) | (-(nps->usr & NCT_USR_SBD) & 0x01);
+	spin_unlock_irqrestore(&tport->port_lock, flags);
+
+	if (serial->disconnected) {
+		dev_err(&intf->dev, "%s: Device disconnected, skipping update_status\n",
+			__func__);
+		return;
+	}
+
+	tty = tty_port_tty_get(&port->port);
+	if (!tty)
+		return; /* The port has been closed. */
+
+	if (nps->hsr & NCT_UART_STATE_MSR_MASK) {
+		if (nps->hsr & NCT_HSR_DCD) {
+			if (tty) {
+				struct tty_ldisc *ld = tty_ldisc_ref(tty);
+
+				if (ld) {
+					if (ld->ops->dcd_change)
+						ld->ops->dcd_change(tty, 0x01);
+					tty_ldisc_deref(ld);
+				}
+				wake_up_interruptible(&tty->port->open_wait);
+			}
+		}
+	}
+
+	/* Flow control */
+	if (tty_port_cts_enabled(&port->port)) {
+		if ((nps->hsr & NCT_HSR_CTS)) {
+			if (tport->flow_stop_wrt)
+				tport->flow_stop_wrt = false;
+		} else {
+			tport->flow_stop_wrt = true;
+		}
+	}
+
+	tty_kref_put(tty);
+}
+
+static void nct_usb_serial_read(struct urb *urb)
+{
+	struct usb_serial_port *port =  urb->context;
+	struct usb_serial *serial = port->serial;
+	struct usb_interface *intf = serial->interface;
+	struct nct_serial *serial_priv = usb_get_serial_data(serial);
+	struct nct_tty_port *tport;
+	struct nct_packet_header *hdr = NULL;
+	unsigned char *data = urb->transfer_buffer;
+	int i, j;
+	int actual_len = urb->actual_length;
+	int len = 0;
+	struct nct_port_status *nps;
+	unsigned long flags;
+
+	if (!urb->actual_length)
+		return;
+
+again:
+	spin_lock_irqsave(&serial_priv->serial_lock, flags);
+	tport = serial_priv->cur_port;
+	if (!tport) {
+		/*
+		 * Handle a new data package (i.e., it is not
+		 * the remaining data without a header).
+		 * The package does not need to be combined this time.
+		 */
+
+		for (i = 0; i < urb->actual_length; i++) {
+			hdr = (struct nct_packet_header *)data;
+			/* Decode the header */
+
+			if (serial_priv->status_trans_mode) {
+				/*
+				 * Status data is also transmitted via bulk-in
+				 * pipe.
+				 */
+				if (hdr->magic == NCT_HDR_MAGIC &&
+				    hdr->magic2 == NCT_HDR_MAGIC_STATUS &&
+				    nct_get_hdr_len(hdr) == 24 && actual_len >= 28) {
+					/*
+					 * Notice: actual_len will be decreased,
+					 * it is equal to urb->actual_length
+					 * only at the beginning.
+					 */
+
+					/*
+					 * Status report.
+					 * It should be a standalone package in
+					 * one URB
+					 */
+					data += sizeof(struct nct_packet_header);
+					actual_len -= sizeof(struct nct_packet_header);
+
+					nps = (struct nct_port_status *)data;
+
+					for (j = 0; j < actual_len - 4; j++) {
+						nct_update_status(serial, (unsigned char *)nps);
+						nps++;
+					}
+
+					spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
+					return;
+				}
+			}
+
+			if (hdr->magic == NCT_HDR_MAGIC &&
+			    hdr->magic2 == NCT_HDR_MAGIC2 &&
+			    nct_get_hdr_idx(hdr) <= NCT_MAX_NUM_COM_DEVICES &&
+			    nct_get_hdr_len(hdr) <= 512)
+				break;
+
+			data++;
+			actual_len--;
+			if (!actual_len) {
+				dev_err(&intf->dev, "%s: Decode serial packet size failed.\n",
+					__func__);
+				spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
+				return;
+			}
+		}
+		/*
+		 * Search tty port
+		 * Search the tty device by the idx in header, and check if
+		 * it is registered or opened.
+		 * If it is, record them. The record will be used later for
+		 * 2 purposes:
+		 *   (1) If the current data package is incomplete, the following
+		 *       incoming data will not include a header.
+		 *   (2) To determine which device will be used for transmission.
+		 */
+		tport = NULL;
+		for (i = 0; i < serial->type->num_ports; i++) {
+			port = serial->port[i];
+			tport = usb_get_serial_port_data(port);
+			if (tport->hw_idx != nct_get_hdr_idx(hdr))
+				continue;
+
+			break;
+		}
+		if (!tport) {
+			dev_err(&intf->dev, "%s: Decode serial packet index failed.\n",	__func__);
+			spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
+			return;
+		}
+		/*
+		 * Calculate the data length.
+		 * Then, check if the length specified in the header matches
+		 * the data length. If not, it indicates that the data we
+		 * received spans across two (or more) packets.
+		 */
+		actual_len -= sizeof(struct nct_packet_header);
+		data += sizeof(struct nct_packet_header);
+		/* actual_len: the data length of the data we got this time */
+		if (nct_get_hdr_len(hdr) > actual_len) {
+			/*
+			 * It means the length specified in the header (the
+			 * custom header) is greater than the length of the
+			 * data we received.
+			 * Therefore, the data we received this time does not
+			 * span across another packet (i.e. no new header).
+			 */
+			len = actual_len;
+			/*
+			 * cur_len: Record how many data does not handle yet
+			 */
+			serial_priv->cur_len = nct_get_hdr_len(hdr) - len;
+			/*
+			 * Record the current port. When we got remained data of
+			 * the package next time
+			 */
+			serial_priv->cur_port = tport;
+		} else {
+			/*
+			 * The data we got crosses packages(not belong
+			 * to the same header). We only handle data by
+			 * the length in header. And we will handle
+			 * another package when 'goto "again" '.
+			 */
+			len = nct_get_hdr_len(hdr);
+		}
+	} else { /*  Handling the remained data which crosses package */
+		if (serial_priv->cur_len > actual_len) {
+			/*
+			 * The unhandled part of the data exceeds the data we
+			 * received this time. We only handle the data we
+			 * have, expecting more data to be received later.
+			 */
+			len = actual_len;
+		} else {
+			/*
+			 * This means the package has been fully handled.
+			 * Clear 'cur_port' as no additional data needs to be
+			 * attached to the current package.
+			 */
+			len = serial_priv->cur_len;
+			serial_priv->cur_port = NULL;
+		}
+		serial_priv->cur_len -= len;
+	}
+	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
+	/*
+	 * The per-character sysrq handling is too slow for fast devices,
+	 * so we bypass it in the vast majority of cases where the USB serial is
+	 * not a console.
+	 */
+	if (tport->sysrq) {
+		for (i = 0; i < len; i++, data++)
+			tty_insert_flip_char(&port->port, *data, TTY_NORMAL);
+	} else {
+		tty_insert_flip_string(&port->port, data, len);
+		data += len;
+	}
+	/*
+	 * Send data to the tty device (according to the port identified above).
+	 */
+	tty_flip_buffer_push(&port->port);
+	actual_len -= len;
+
+	/*
+	 * It means that the data we received this time contains two or
+	 * more data packages, so it needs to continue processing the next
+	 * data packages.
+	 */
+	if (actual_len > 0)
+		goto again;
+}
+
+static void nct_process_read_bulk(struct urb *urb)
+{
+	struct usb_serial_port *port =  urb->context;
+	bool stopped = false;
+	int status = urb->status;
+	int ret;
+
+	switch (status) {
+	case 0:
+		nct_usb_serial_read(urb);
+		break;
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+		dev_dbg(&port->dev, "urb stopped: %d\n", status);
+		stopped = true;
+		break;
+	case -EPIPE:
+		dev_dbg(&port->dev, "urb stopped: %d\n", status);
+		stopped = true;
+		break;
+	case -ETIME:
+		dev_dbg(&port->dev, "urb ETIME t: %d\n", status);
+		break;
+	case -ETIMEDOUT:
+		dev_dbg(&port->dev, "urb ETIMEDOUT t: %d\n", status);
+		break;
+	default:
+		dev_dbg(&port->dev, "nonzero urb status: %d\n", status);
+		break;
+	}
+
+	if (stopped)
+		return;
+
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret != 0 && ret != -EPERM)
+		dev_err(&port->dev, "%s: failed resubmitting urb, ret=%d\n", __func__, ret);
+}
+
+static void nct_read_bulk_callback(struct urb *urb)
+{
+	struct usb_serial_port *port = urb->context;
+	struct nct_serial *serial_priv;
+
+	/* Port sanity check, do not resubmit if port is not valid */
+	if (urb->status == -ESHUTDOWN)
+		return;
+
+	if (!port) {
+		pr_err("%s: port or serial is NULL, status=%d\n", __func__, urb->status);
+		return;
+	}
+
+	if (!port->serial) {
+		dev_err(&port->dev, "%s: serial is NULL, status=%d\n", __func__, urb->status);
+		return;
+	}
+
+	if (port->serial->disconnected)
+		return;
+
+	serial_priv = usb_get_serial_port_data(port);
+	if (!serial_priv) {
+		dev_err(&port->dev, "%s: port->private is NULL, status=%d\n",
+			__func__, urb->status);
+		return;
+	}
+
+	if (!port->serial) {
+		dev_err(&port->dev, "%s: serial is NULL, status=%d\n", __func__, urb->status);
+		return;
+	}
+
+	serial_priv = usb_get_serial_data(port->serial);
+	if (!serial_priv) {
+		dev_err(&port->dev,
+			"%s: serial->private is NULL, status=%d\n",
+			__func__, urb->status);
+		return;
+	}
+
+	/* Processing data */
+	nct_process_read_bulk(urb);
+}
+
+static int nct_calc_num_ports(struct usb_serial *serial,
+			      struct usb_serial_endpoints *epds)
+{
+	struct nct_vendor_cmd cmd;
+	u8 buf[8];
+	struct nct_serial *serial_priv = usb_get_serial_data(serial);
+	struct usb_interface *intf = serial->interface;
+	int ret;
+	int i;
+	int num_ports;
+
+	//Send init command
+	cmd.val = nct_build_cmd(NCT_VCOM_SET_INIT, NCT_VCOM_INDEX_GLOBAL);
+	ret = nct_vendor_write(intf, cmd, 0);
+	if (ret) {
+		dev_err(&intf->dev, "%s - Set COM init error\n", __func__);
+		return ret;
+	}
+
+	/* Get ports' index supported by the device(/FW) */
+	cmd.val = nct_build_cmd(NCT_VCOM_GET_PORTS_SUPPORT, NCT_VCOM_INDEX_GLOBAL);
+	ret = nct_vendor_read(intf, cmd, buf, 1);
+	if (ret != 1) {
+		dev_err(&intf->dev, "%s - Get COM port index error\n", __func__);
+		return 0;
+	}
+	serial_priv->en_device_mask = buf[0];
+	serial_priv->last_assigned_hw_idx = 0; /* Note: hw_idx is based on 1 */
+	dev_dbg(&intf->dev, "Enabled devices mask:%X\n", buf[0]);
+
+	for (i = 0, num_ports = 0; i < NCT_MAX_NUM_COM_DEVICES; i++) {
+		if ((buf[0] & (1 << i)) == 0)
+			continue;	/* The port is disabled */
+
+		num_ports++;
+	}
+
+	return num_ports;
+}
+
+static int nct_probe(struct usb_serial *serial, const struct usb_device_id *id)
+{
+	struct nct_serial *serial_priv;
+	int i;
+	struct usb_endpoint_descriptor *endpoint;
+	struct usb_interface *intf = serial->interface;
+	struct usb_host_interface *iface_desc;
+
+	serial_priv = kzalloc(sizeof(*serial_priv), GFP_KERNEL);
+	if (!serial_priv)
+		return -ENOMEM;
+
+	spin_lock_init(&serial_priv->serial_lock);
+	usb_set_serial_data(serial, serial_priv);
+
+	iface_desc = intf->cur_altsetting;
+
+	/* For bulk-out */
+	for (i = 0; i < iface_desc->desc.bNumEndpoints; i++) {
+		endpoint = &iface_desc->endpoint[i].desc;
+		if (usb_endpoint_is_bulk_out(endpoint)) {
+			serial_priv->bulk_out_ep = endpoint;
+			break;
+		}
+	}
+
+	/*
+	 * Initialize the mode as 'Status data is transmitted via
+	 * bulk-in pipe'.
+	 */
+	serial_priv->status_trans_mode = true;
+	serial->type->num_interrupt_in = 0;
+	for (i = 0; i < iface_desc->desc.bNumEndpoints; i++) {
+		endpoint = &iface_desc->endpoint[i].desc;
+
+		if (usb_endpoint_is_int_in(endpoint)) {
+			/* Status data is transmitted via interrupt-in pipe. */
+			serial_priv->status_trans_mode = false;
+			serial->type->num_interrupt_in = 1;
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int nct_port_init(struct usb_serial_port *port, unsigned int port_num)
+{
+	struct nct_tty_port *tport;
+	struct usb_serial *serial = port->serial;
+	struct nct_serial *serial_priv = usb_get_serial_data(serial);
+	unsigned long flags;
+	int i;
+
+	tport = kzalloc(sizeof(*tport), GFP_KERNEL);
+	if (!tport)
+		return -ENOMEM;
+
+	/* Assigned the hw_idx */
+	spin_lock_init(&tport->port_lock);
+
+	spin_lock_irqsave(&tport->port_lock, flags);
+	for (i = serial_priv->last_assigned_hw_idx + 1; i < NCT_MAX_NUM_COM_DEVICES; i++) {
+		if ((serial_priv->en_device_mask & (1 << i)) == 0)
+			continue;	/* The port is disabled */
+
+		tport->hw_idx = i;
+		serial_priv->last_assigned_hw_idx = i;
+		break;
+	}
+	spin_unlock_irqrestore(&tport->port_lock, flags);
+
+	usb_set_serial_port_data(port, tport);
+
+	return 0;
+}
+
+static void nct_interrupt_in_callback(struct urb *urb)
+{
+	struct usb_serial_port *port = urb->context;
+	int status = urb->status;
+	struct usb_serial *serial = port->serial;
+
+	unsigned char *data = urb->transfer_buffer;
+	int retval;
+	int i;
+	int actual_len = urb->actual_length;
+	struct nct_port_status *nps;
+
+	switch (status) {
+	case 0:
+		/* Success */
+		if ((actual_len % 4) != 0)
+			return;
+
+		nps = (struct nct_port_status *)data;
+
+		for (i = 0; i < (actual_len / 4); i++) {
+			nct_update_status(serial, (unsigned char *)nps);
+			nps++;
+		}
+		break;
+
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		/* This urb is terminated, clean up */
+		return;
+	default:
+		break;
+	}
+	retval = usb_submit_urb(urb, GFP_ATOMIC);
+	if (retval)
+		dev_err(&port->dev, "%s: Submit intr URB failed, ret=%d\n", __func__, retval);
+}
+
+static void nct_disconnect(struct usb_serial *serial)
+{
+	int i;
+	struct nct_serial *serial_priv = usb_get_serial_data(serial);
+	unsigned long flags;
+
+	/* Reset status */
+	spin_lock_irqsave(&serial_priv->serial_lock, flags);
+	serial_priv->device_init = false;
+	serial_priv->cur_port = NULL;
+	serial_priv->cur_len = 0;
+	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
+
+	/* Stop reads and writes on all ports */
+	for (i = 0; i < serial->type->num_ports; i++) {
+		if (!serial->port[i])
+			continue;
+		usb_kill_urb(serial->port[i]->read_urb);
+		usb_kill_urb(serial->port[i]->write_urb);
+	}
+	if (!serial_priv->status_trans_mode)
+		if (serial->port[0] && serial->port[0]->interrupt_in_urb)
+			usb_kill_urb(serial->port[0]->interrupt_in_urb);
+}
+
+static int nct_port_probe(struct usb_serial_port *port)
+{
+	return nct_port_init(port, port->port_number);
+}
+
+static void nct_port_remove(struct usb_serial_port *port)
+{
+	struct nct_tty_port *priv;
+
+	priv = usb_get_serial_port_data(port);
+	kfree(priv);
+}
+
+static void nct_release(struct usb_serial *serial)
+{
+	struct nct_serial *serial_priv;
+
+	serial_priv = usb_get_serial_data(serial);
+	kfree(serial_priv);
+}
+
+static int nct_suspend(struct usb_serial *serial, pm_message_t message)
+{
+	struct nct_serial *serial_priv = usb_get_serial_data(serial);
+	int i;
+
+	/* Stop all URBs */
+	for (i = 0; i < serial->type->num_ports; i++) {
+		if (serial->port[i]) {
+			usb_kill_urb(serial->port[i]->read_urb);
+			usb_kill_urb(serial->port[i]->write_urb);
+		}
+	}
+
+	if (!serial_priv->status_trans_mode)
+		if (serial->port[0] && serial->port[0]->interrupt_in_urb)
+			usb_kill_urb(serial->port[0]->interrupt_in_urb);
+
+	return 0;
+}
+
+static int nct_resume(struct usb_serial *serial)
+{
+	struct nct_serial *serial_priv = usb_get_serial_data(serial);
+	struct usb_interface *intf = serial->interface;
+	struct usb_host_interface *iface_desc;
+	struct usb_endpoint_descriptor *endpoint;
+	unsigned long flags;
+	int i, ret = 0;
+
+	/* Reacquire endpoint descriptors */
+	iface_desc = intf->cur_altsetting;
+	for (i = 0; i < iface_desc->desc.bNumEndpoints; i++) {
+		endpoint = &iface_desc->endpoint[i].desc;
+		if (usb_endpoint_is_bulk_out(endpoint)) {
+			serial_priv->bulk_out_ep = endpoint;
+			break;
+		}
+	}
+
+	/* Reset driver internal state */
+	spin_lock_irqsave(&serial_priv->serial_lock, flags);
+	serial_priv->cur_port = NULL;
+	serial_priv->cur_len = 0;
+	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
+
+	/* Resubmit URBs */
+	if (serial->port[0] && serial->port[0]->read_urb) {
+		ret = usb_submit_urb(serial->port[0]->read_urb, GFP_KERNEL);
+		if (ret)
+			dev_err(&intf->dev, "%s: Submit read URB failed, ret=%d\n",
+				__func__, ret);
+	}
+
+	if (!serial_priv->status_trans_mode) {
+		if (serial->port[0] && serial->port[0]->interrupt_in_urb) {
+			ret = usb_submit_urb(serial->port[0]->interrupt_in_urb, GFP_KERNEL);
+			if (ret)
+				dev_err(&intf->dev, "%s: Submit interrupt URB failed, ret=%d\n",
+					__func__, ret);
+		}
+	}
+
+	/* Restore status flags */
+	spin_lock_irqsave(&serial_priv->serial_lock, flags);
+	serial_priv->device_init = true;  /* Reset initialization flag */
+	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
+
+	return 0;
+}
+
+static struct usb_serial_driver nct_usb_serial_device = {
+	.driver	= {
+		.name =		NCT_DRVNAME,
+	},
+	.description =		"Nuvoton USB to serial adapter",
+	.id_table =		id_table,
+	.num_ports =		6,
+	.num_bulk_in =		1,
+	.num_bulk_out =		1,
+	.open =			nct_open,
+	.close =		nct_close,
+	.write =		nct_serial_write,
+	.write_room =		nct_write_room,
+	.write_bulk_callback =	nct_write_bulk_callback,
+	.read_bulk_callback =	nct_read_bulk_callback,
+	.read_int_callback =	nct_interrupt_in_callback,
+	.chars_in_buffer =	nct_chars_in_buffer,
+	.throttle =		nct_rx_throttle,
+	.unthrottle =		nct_rx_unthrottle,
+	.probe =		nct_probe,
+	.calc_num_ports =	nct_calc_num_ports,
+	.set_termios =		nct_serial_set_termios,
+	.break_ctl =		nct_serial_break,
+	.tiocmget =		nct_serial_tiocmget,
+	.tiocmset =		nct_tiocmset_helper,
+	.disconnect =		nct_disconnect,
+	.release =		nct_release,
+	.port_probe =		nct_port_probe,
+	.port_remove =		nct_port_remove,
+	.suspend =		nct_suspend,
+	.resume =		nct_resume,
+};
+
+static struct usb_serial_driver * const nct_serial_drivers[] = {
+	&nct_usb_serial_device, NULL
+};
+
+module_usb_serial_driver(nct_serial_drivers, id_table);
+MODULE_DESCRIPTION("Nuvoton USB to serial adaptor driver");
+MODULE_AUTHOR("Sheng-Yuan Huang <syhuang3@nuvoton.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.43.0

