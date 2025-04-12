Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD4645
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744440534; cv=none; b=CS0Dl4pdZLxhRxr6xV+sEYUFRisSUqEJqfGX82MZNdXQ/rs+SBmQYciUMjO1mJWGHF6cJyORrVxw3+o2CChIBKyqhm4xdvD9Mh2lSFYwjHDBdnvr1drfUG8solg9gzgvJaxlBud1DHhJrvS5Fza3z+emKX3OjkYnYKtIMMK4L/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744440534; c=relaxed/simple;
	bh=gb7TDOVl4T+tIy5B2G5Rh/o7V863Z+YPDNbeqDA7o78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLte/NUkUH165bKlDqk3ROZNl62iJJve63geVBxHktjKCH+w9EZpBbfrb87/xU2idfa/U38f/CdDgkT7IQ2xitVXwMCkMMidgtefEJs7mllzFMkL8u+Wp33WhZBZRYjNFfEoSg/0Kov0aaR2nWFus8QSi3OTyw2ZOj3yCkSMDWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=Xm4esHUX; arc=none smtp.client-ip=193.252.22.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="Xm4esHUX"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3Uf9uoeYetvMG3UfDuGx5K; Sat, 12 Apr 2025 08:48:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744440510;
	bh=QlZRUZx+8kKhk8v1urqpIN1u6ZO6v4bCEcVF3PP/e4Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Xm4esHUXJzQZBiIwEe12plDBsiFY95mCGzZFZ1r1fgoG6pApS2Pht7hvZh6/ziP0T
	 Xnb3ttZoUPPcxcLSDmZhoSI6NsQ0r1TpjcG1KLdLA3QxXLvoBO15zvGs8FGWw1BjyL
	 RQoF82QU4WqXpEveYdjdSw2JO+wIsJBEMjStX/26bbgT9Vl92gR3SMTFscDD0vhIp6
	 RZhVLZVGhrqHp5txtSiydJmccjbEMp8kiq+mT75NKw2Ov7vA0tcRoTlQjgwHtX4kiG
	 uWt16S/rCgIrOlKPEBpGzwHgpH1ooD1TgfHqACGvo5LW39gCCLZVaUbwSynTV1ImWK
	 /NIMZR28q3TKw==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:48:29 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/16] staging: gpib: lpvo_usb_gpib: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:48:35 -0700
Message-ID: <7699226216a99b8bf053c4d6017941ebc87cb8e2.1744438358.git.paul.retourne@orange.fr>
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
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 123 +++++++++---------
 1 file changed, 64 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index faf96e9cc4a1..f7dd7e8b0764 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -36,16 +36,16 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for LPVO usb devices");
 
 /*
- *  Table of devices that work with this driver.
+ * Table of devices that work with this driver.
  *
- *  Currently, only one device is known to be used in the
- *  lpvo_usb_gpib adapter (FTDI 0403:6001).
- *  If your adapter uses a different chip, insert a line
- *  in the following table with proper <Vendor-id>, <Product-id>.
+ * Currently, only one device is known to be used in the
+ * lpvo_usb_gpib adapter (FTDI 0403:6001).
+ * If your adapter uses a different chip, insert a line
+ * in the following table with proper <Vendor-id>, <Product-id>.
  *
- *  To have your chip automatically handled by the driver,
- *  update files "/usr/local/etc/modprobe.d/lpvo_usb_gpib.conf"
- *  and /usr/local/etc/udev/rules.d/99-lpvo_usb_gpib.rules.
+ * To have your chip automatically handled by the driver,
+ * update files "/usr/local/etc/modprobe.d/lpvo_usb_gpib.conf"
+ * and /usr/local/etc/udev/rules.d/99-lpvo_usb_gpib.rules.
  *
  */
 
@@ -56,18 +56,18 @@ static const struct usb_device_id skel_table[] = {
 MODULE_DEVICE_TABLE(usb, skel_table);
 
 /*
- *    ***  Diagnostics and Debug  ***
- *  To enable the diagnostic and debug messages either compile with DEBUG set
- *  or control via the dynamic debug mechanisms.
- *  The module parameter "debug" controls the sending of debug messages to
- *  syslog. By default it is set to 0
- *    debug = 0: only attach/detach messages are sent
- *	      1: every action is logged
- *	      2: extended logging; each single exchanged byte is documented
- *		 (about twice the log volume of [1])
- *    To switch debug level:
- *	      At module loading:  modprobe lpvo_usb_gpib debug={0,1,2}
- *	      On the fly: echo {0,1,2} > /sys/modules/lpvo_usb_gpib/parameters/debug
+ *   ***  Diagnostics and Debug  ***
+ * To enable the diagnostic and debug messages either compile with DEBUG set
+ * or control via the dynamic debug mechanisms.
+ * The module parameter "debug" controls the sending of debug messages to
+ * syslog. By default it is set to 0
+ * debug = 0: only attach/detach messages are sent
+ *         1: every action is logged
+ *         2: extended logging; each single exchanged byte is documented
+ *	(about twice the log volume of [1])
+ * To switch debug level:
+ *         At module loading:  modprobe lpvo_usb_gpib debug={0,1,2}
+ *         On the fly: echo {0,1,2} > /sys/modules/lpvo_usb_gpib/parameters/debug
  */
 
 static int debug;
@@ -169,10 +169,10 @@ static void show_status(struct gpib_board *board)
 }
 
 /*
- *  GLOBAL VARIABLES: required for
- *  pairing among gpib minor and usb minor.
- *  MAX_DEV is the max number of usb-gpib adapters; free
- *  to change as you like, but no more than 32
+ * GLOBAL VARIABLES: required for
+ * pairing among gpib minor and usb minor.
+ * MAX_DEV is the max number of usb-gpib adapters; free
+ * to change as you like, but no more than 32
  */
 
 #define MAX_DEV 8
@@ -182,7 +182,7 @@ static int assigned_usb_minors;		   /* mask of filled slots */
 static struct mutex minors_lock;     /* operations on usb_minors are to be protected */
 
 /*
- *  usb-skeleton prototypes
+ * usb-skeleton prototypes
  */
 
 struct usb_skel;
@@ -192,7 +192,7 @@ static int skel_do_open(struct gpib_board *, int);
 static int skel_do_release(struct gpib_board *);
 
 /*
- *   usec_diff : take difference in MICROsec between two 'timespec'
+ *  usec_diff : take difference in MICROsec between two 'timespec'
  *		 (unix time in sec and NANOsec)
  */
 
@@ -203,7 +203,7 @@ static inline int usec_diff(struct timespec64 *a, struct timespec64 *b)
 }
 
 /*
- *   ***  these routines are specific to the usb-gpib adapter  ***
+ *  ***  these routines are specific to the usb-gpib adapter  ***
  */
 
 /**
@@ -262,13 +262,11 @@ static int send_command(struct gpib_board *board, char *msg, int leng)
 }
 
 /*
- *
  * set_control_line() - Set the value of a single gpib control line
  *
  * @board:    the gpib_board_struct data area for this gpib interface
  * @line:     line mask
  * @value:    line new value (0/1)
- *
  */
 
 static int set_control_line(struct gpib_board *board, int line, int value)
@@ -368,7 +366,7 @@ static void set_timeout(struct gpib_board *board)
 }
 
 /*
- *    now the standard interface functions - attach and detach
+ * now the standard interface functions - attach and detach
  */
 
 /**
@@ -464,7 +462,8 @@ static int usb_gpib_attach(struct gpib_board *board, const gpib_board_config_t *
 	if (retval != ACK)
 		return -EIO;
 
-	/* We must setup debug mode because we need the extended instruction
+	/*
+	 * We must setup debug mode because we need the extended instruction
 	 * set to cope with the Core (gpib_common) point of view
 	 */
 
@@ -473,7 +472,8 @@ static int usb_gpib_attach(struct gpib_board *board, const gpib_board_config_t *
 	if (retval != ACK)
 		return -EIO;
 
-	/* We must keep REN off after an IFC because so it is
+	/*
+	 * We must keep REN off after an IFC because so it is
 	 * assumed by the Core
 	 */
 
@@ -654,7 +654,8 @@ static int usb_gpib_line_status(const struct gpib_board *board)
 
 	DIA_LOG(1, "%s\n", "request");
 
-	/* if we are on the wait queue (board->wait), do not hurry
+	/*
+	 * if we are on the wait queue (board->wait), do not hurry
 	 * reading status line; instead, pause a little
 	 */
 
@@ -707,7 +708,8 @@ static int usb_gpib_line_status(const struct gpib_board *board)
 
 static int usb_gpib_parallel_poll(struct gpib_board *board, uint8_t *result)
 {
-	/* request parallel poll asserting ATN | EOI;
+	/*
+	 * request parallel poll asserting ATN | EOI;
 	 * we suppose ATN already asserted
 	 */
 
@@ -1083,13 +1085,13 @@ static gpib_interface_t usb_gpib_interface = {
 };
 
 /*
- *   usb_gpib_init_module(), usb_gpib_exit_module()
+ * usb_gpib_init_module(), usb_gpib_exit_module()
  *
- *   This functions are called every time a new device is detected
- *   and registered or is removed and unregistered.
- *   We must take note of created and destroyed usb minors to be used
- *   when usb_gpib_attach() and usb_gpib_detach() will be called on
- *   request by gpib_config.
+ * This functions are called every time a new device is detected
+ * and registered or is removed and unregistered.
+ * We must take note of created and destroyed usb minors to be used
+ * when usb_gpib_attach() and usb_gpib_detach() will be called on
+ * request by gpib_config.
  */
 
 static int usb_gpib_init_module(struct usb_interface *interface)
@@ -1107,8 +1109,9 @@ static int usb_gpib_init_module(struct usb_interface *interface)
 			goto exit;
 		}
 	} else {
-		/* check if minor is already registered - maybe useless, but if
-		 *  it happens the code is inconsistent somewhere
+		/*
+		 * check if minor is already registered - maybe useless, but if
+		 * it happens the code is inconsistent somewhere
 		 */
 
 		for (j = 0 ; j < MAX_DEV ; j++) {
@@ -1162,12 +1165,11 @@ static void usb_gpib_exit_module(int minor)
 }
 
 /*
- *     Default latency time (16 msec) is too long.
- *     We must use 1 msec (best); anyhow, no more than 5 msec.
- *
- *     Defines and function taken and modified from the kernel tree
- *     (see ftdi_sio.h and ftdi_sio.c).
+ * Default latency time (16 msec) is too long.
+ * We must use 1 msec (best); anyhow, no more than 5 msec.
  *
+ * Defines and function taken and modified from the kernel tree
+ * (see ftdi_sio.h and ftdi_sio.c).
  */
 
 #define FTDI_SIO_SET_LATENCY_TIMER	9 /* Set the latency timer */
@@ -1235,7 +1237,8 @@ static int write_latency_timer(struct usb_device *udev)
 /*   private defines   */
 
 #define MAX_TRANSFER		    (PAGE_SIZE - 512)
-/* MAX_TRANSFER is chosen so that the VM is not stressed by
+/*
+ * MAX_TRANSFER is chosen so that the VM is not stressed by
  * allocations > PAGE_SIZE and the number of packets in a page
  * is an integer 512 is the largest possible packet on EHCI
  */
@@ -1280,7 +1283,7 @@ static void skel_delete(struct kref *kref)
 }
 
 /*
- *   skel_do_open() - to be called by usb_gpib_attach
+ * skel_do_open() - to be called by usb_gpib_attach
  */
 
 static int skel_do_open(struct gpib_board *board, int subminor)
@@ -1317,7 +1320,7 @@ static int skel_do_open(struct gpib_board *board, int subminor)
 }
 
 /*
- *   skel_do_release() - to be called by usb_gpib_detach
+ * skel_do_release() - to be called by usb_gpib_detach
  */
 
 static int skel_do_release(struct gpib_board *board)
@@ -1340,7 +1343,7 @@ static int skel_do_release(struct gpib_board *board)
 }
 
 /*
- *   read functions
+ * read functions
  */
 
 static void skel_read_bulk_callback(struct urb *urb)
@@ -1405,7 +1408,7 @@ static int skel_do_read_io(struct usb_skel *dev, size_t count)
 }
 
 /*
- *   skel_do_read() - read operations from lpvo_usb_gpib
+ * skel_do_read() - read operations from lpvo_usb_gpib
  */
 
 static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
@@ -1482,7 +1485,8 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 			 * all data has been used
 			 * actual IO needs to be done
 			 */
-			/* it seems that requests for less than dev->bulk_in_size
+			/*
+			 * it seems that requests for less than dev->bulk_in_size
 			 *  are not accepted
 			 */
 			rv = skel_do_read_io(dev, dev->bulk_in_size);
@@ -1496,7 +1500,8 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 		 * data is available - chunk tells us how much shall be copied
 		 */
 
-		/* Condition dev->bulk_in_copied > 0 maybe will never happen. In case,
+		/*
+		 * Condition dev->bulk_in_copied > 0 maybe will never happen. In case,
 		 * signal the event and copy using the original procedure, i.e., copy
 		 * first two bytes also
 		 */
@@ -1551,7 +1556,7 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 }
 
 /*
- *   write functions
+ * write functions
  */
 
 static void skel_write_bulk_callback(struct urb *urb)
@@ -1581,7 +1586,7 @@ static void skel_write_bulk_callback(struct urb *urb)
 }
 
 /*
- *   skel_do_write() - write operations from lpvo_usb_gpib
+ * skel_do_write() - write operations from lpvo_usb_gpib
  */
 
 static ssize_t skel_do_write(struct usb_skel *dev, const char *buffer, size_t count)
@@ -1686,7 +1691,7 @@ static ssize_t skel_do_write(struct usb_skel *dev, const char *buffer, size_t co
 }
 
 /*
- *   services for the user space devices
+ * services for the user space devices
  */
 
 #if USER_DEVICE	 /* conditional compilation of user space device */
@@ -1771,7 +1776,7 @@ static int skel_release(struct inode *inode, struct file *file)
 }
 
 /*
- *  user space access to read function
+ * user space access to read function
  */
 
 static ssize_t skel_read(struct file *file, char __user *buffer, size_t count,
@@ -1800,7 +1805,7 @@ static ssize_t skel_read(struct file *file, char __user *buffer, size_t count,
 }
 
 /*
- *  user space access to write function
+ * user space access to write function
  */
 
 static ssize_t skel_write(struct file *file, const char __user *user_buffer,
-- 
2.49.0

