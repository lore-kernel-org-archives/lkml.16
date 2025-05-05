Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CF217A31E;
	Mon,  5 May 2025 00:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746406561; cv=none; b=fyIGvIuu2x/xPFHfbacPhXL/7Fe4Wk6P49QwtF+/EGcpLpcMSIsJbixOePRuSsQyVC++hyT2LNg3BGLYGNpPZ9UbjeIfb5i2PbkvTI5mJ6GRJlGxQGypqOHZllhG8ocykAP6xJMvoNJD4jkNmzh0wQFuqx3RALUHF60J+QdcRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746406561; c=relaxed/simple;
	bh=ImwZpAyK9a06VG5KtpooQqA66DFsHMPgTKcK9ntc8B8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hB44TnTgRC4J0VNCyvlwHA5sgFCJEHrwSYbEjnvRPIC5mtH8IRCBUOTOwO4Fg/tCD2GZqsrCumAFTE8GDNBSGqdWjKJmzM6TvFN9kfm3ae5iXbJTbzOqwhABlusbVud5+u9UsK/O9VKEtKimUQlpX42xePAc3yQSZfHb71jjS3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=rT1wPwvo; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="rT1wPwvo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=8tvb66wwireoDnKEYmAITJ2Fw0oT3tpDZumoZ1GwT2k=; b=rT1wPwvoI+7LCnzp
	rpsR7vIPeZPp5LUGkxTqjP/z8GN4Sp+9XrIuEZ9Q1QhrHc4ZmrYLNJL0yOfpOBOeeKG8P+RoKPIxR
	9C1unYf7fz+KpX/034cO8UPZZPGUgSJvyMJsJcALqdxGZI/C/foVD4PhNIJyBIYBAg94/h6V+TrNX
	aSDuZArjp8MtGmOvhrw/BEjbWUp2foPl5EIiN1rMBRrB5kkG/rnVpz4X0n/Pbw9sS6Trt+iT9Etcp
	Niykg8MYXar8mJoKiYgtFwWYMn8YfiW4JYsKCPUnWH71cDB8+GNTgdHU9sD/EJF8QH0hyaoVc+PUK
	64T+wlEqWWiikwlb/A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uBk7Q-001Lvo-0z;
	Mon, 05 May 2025 00:55:40 +0000
From: linux@treblig.org
To: malattia@linux.it,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: hverkuil@xs4all.nl,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] platform/x86/sony-laptop: Remove unused sony laptop camera code
Date: Mon,  5 May 2025 01:55:39 +0100
Message-ID: <20250505005539.336183-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

commit ba47652ba655 ("media: meye: remove this deprecated driver")
removed the meye driver but left behind the code in sony-laptop.c
which that driver used to call.

Remove the sony_pic_camera_command() function, and the set of
defines (SONY_PIC_COMMAND_*) in a header used for the interface
and the static helpers it called.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 MAINTAINERS                        |   1 -
 drivers/platform/x86/sony-laptop.c | 135 -----------------------------
 include/linux/sony-laptop.h        |  39 ---------
 3 files changed, 175 deletions(-)
 delete mode 100644 include/linux/sony-laptop.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2aed76827090..6c865b5d8fae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22671,7 +22671,6 @@ W:	http://www.linux.it/~malattia/wiki/index.php/Sony_drivers
 F:	Documentation/admin-guide/laptops/sony-laptop.rst
 F:	drivers/char/sonypi.c
 F:	drivers/platform/x86/sony-laptop.c
-F:	include/linux/sony-laptop.h
 
 SOPHGO DEVICETREES and DRIVERS
 M:	Chen Wang <unicorn_wang@outlook.com>
diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index b52390fbd743..4efd0d7031a5 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -48,7 +48,6 @@
 #include <linux/acpi.h>
 #include <linux/slab.h>
 #include <linux/sonypi.h>
-#include <linux/sony-laptop.h>
 #include <linux/rfkill.h>
 #ifdef CONFIG_SONYPI_COMPAT
 #include <linux/poll.h>
@@ -3619,22 +3618,6 @@ static u8 sony_pic_call2(u8 dev, u8 fn)
 	return v1;
 }
 
-static u8 sony_pic_call3(u8 dev, u8 fn, u8 v)
-{
-	u8 v1;
-
-	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2, ITERATIONS_LONG);
-	outb(dev, spic_dev.cur_ioport->io1.minimum + 4);
-	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2, ITERATIONS_LONG);
-	outb(fn, spic_dev.cur_ioport->io1.minimum);
-	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2, ITERATIONS_LONG);
-	outb(v, spic_dev.cur_ioport->io1.minimum);
-	v1 = inb_p(spic_dev.cur_ioport->io1.minimum);
-	dprintk("sony_pic_call3(0x%.2x - 0x%.2x - 0x%.2x): 0x%.4x\n",
-			dev, fn, v, v1);
-	return v1;
-}
-
 /*
  * minidrivers for SPIC models
  */
@@ -3754,124 +3737,6 @@ static void sony_pic_detect_device_type(struct sony_pic_dev *dev)
 #define SONYPI_CAMERA_REVISION 			8
 #define SONYPI_CAMERA_ROMVERSION 		9
 
-static int __sony_pic_camera_ready(void)
-{
-	u8 v;
-
-	v = sony_pic_call2(0x8f, SONYPI_CAMERA_STATUS);
-	return (v != 0xff && (v & SONYPI_CAMERA_STATUS_READY));
-}
-
-static int __sony_pic_camera_off(void)
-{
-	if (!camera) {
-		pr_warn("camera control not enabled\n");
-		return -ENODEV;
-	}
-
-	wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_PICTURE,
-				SONYPI_CAMERA_MUTE_MASK),
-			ITERATIONS_SHORT);
-
-	if (spic_dev.camera_power) {
-		sony_pic_call2(0x91, 0);
-		spic_dev.camera_power = 0;
-	}
-	return 0;
-}
-
-static int __sony_pic_camera_on(void)
-{
-	int i, j, x;
-
-	if (!camera) {
-		pr_warn("camera control not enabled\n");
-		return -ENODEV;
-	}
-
-	if (spic_dev.camera_power)
-		return 0;
-
-	for (j = 5; j > 0; j--) {
-
-		for (x = 0; x < 100 && sony_pic_call2(0x91, 0x1); x++)
-			msleep(10);
-		sony_pic_call1(0x93);
-
-		for (i = 400; i > 0; i--) {
-			if (__sony_pic_camera_ready())
-				break;
-			msleep(10);
-		}
-		if (i)
-			break;
-	}
-
-	if (j == 0) {
-		pr_warn("failed to power on camera\n");
-		return -ENODEV;
-	}
-
-	wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_CONTROL,
-				0x5a),
-			ITERATIONS_SHORT);
-
-	spic_dev.camera_power = 1;
-	return 0;
-}
-
-/* External camera command (exported to the motion eye v4l driver) */
-int sony_pic_camera_command(int command, u8 value)
-{
-	if (!camera)
-		return -EIO;
-
-	mutex_lock(&spic_dev.lock);
-
-	switch (command) {
-	case SONY_PIC_COMMAND_SETCAMERA:
-		if (value)
-			__sony_pic_camera_on();
-		else
-			__sony_pic_camera_off();
-		break;
-	case SONY_PIC_COMMAND_SETCAMERABRIGHTNESS:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_BRIGHTNESS, value),
-				ITERATIONS_SHORT);
-		break;
-	case SONY_PIC_COMMAND_SETCAMERACONTRAST:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_CONTRAST, value),
-				ITERATIONS_SHORT);
-		break;
-	case SONY_PIC_COMMAND_SETCAMERAHUE:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_HUE, value),
-				ITERATIONS_SHORT);
-		break;
-	case SONY_PIC_COMMAND_SETCAMERACOLOR:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_COLOR, value),
-				ITERATIONS_SHORT);
-		break;
-	case SONY_PIC_COMMAND_SETCAMERASHARPNESS:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_SHARPNESS, value),
-				ITERATIONS_SHORT);
-		break;
-	case SONY_PIC_COMMAND_SETCAMERAPICTURE:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_PICTURE, value),
-				ITERATIONS_SHORT);
-		break;
-	case SONY_PIC_COMMAND_SETCAMERAAGC:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_AGC, value),
-				ITERATIONS_SHORT);
-		break;
-	default:
-		pr_err("sony_pic_camera_command invalid: %d\n", command);
-		break;
-	}
-	mutex_unlock(&spic_dev.lock);
-	return 0;
-}
-EXPORT_SYMBOL(sony_pic_camera_command);
-
 /* gprs/edge modem (SZ460N and SZ210P), thanks to Joshua Wise */
 static void __sony_pic_set_wwanpower(u8 state)
 {
diff --git a/include/linux/sony-laptop.h b/include/linux/sony-laptop.h
deleted file mode 100644
index 1e3c92feea6e..000000000000
--- a/include/linux/sony-laptop.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _SONYLAPTOP_H_
-#define _SONYLAPTOP_H_
-
-#include <linux/types.h>
-
-#ifdef __KERNEL__
-
-/* used only for communication between v4l and sony-laptop */
-
-#define SONY_PIC_COMMAND_GETCAMERA		 1	/* obsolete */
-#define SONY_PIC_COMMAND_SETCAMERA		 2
-#define SONY_PIC_COMMAND_GETCAMERABRIGHTNESS	 3	/* obsolete */
-#define SONY_PIC_COMMAND_SETCAMERABRIGHTNESS	 4
-#define SONY_PIC_COMMAND_GETCAMERACONTRAST	 5	/* obsolete */
-#define SONY_PIC_COMMAND_SETCAMERACONTRAST	 6
-#define SONY_PIC_COMMAND_GETCAMERAHUE		 7	/* obsolete */
-#define SONY_PIC_COMMAND_SETCAMERAHUE		 8
-#define SONY_PIC_COMMAND_GETCAMERACOLOR		 9	/* obsolete */
-#define SONY_PIC_COMMAND_SETCAMERACOLOR		10
-#define SONY_PIC_COMMAND_GETCAMERASHARPNESS	11	/* obsolete */
-#define SONY_PIC_COMMAND_SETCAMERASHARPNESS	12
-#define SONY_PIC_COMMAND_GETCAMERAPICTURE	13	/* obsolete */
-#define SONY_PIC_COMMAND_SETCAMERAPICTURE	14
-#define SONY_PIC_COMMAND_GETCAMERAAGC		15	/* obsolete */
-#define SONY_PIC_COMMAND_SETCAMERAAGC		16
-#define SONY_PIC_COMMAND_GETCAMERADIRECTION	17	/* obsolete */
-#define SONY_PIC_COMMAND_GETCAMERAROMVERSION	18	/* obsolete */
-#define SONY_PIC_COMMAND_GETCAMERAREVISION	19	/* obsolete */
-
-#if IS_ENABLED(CONFIG_SONY_LAPTOP)
-int sony_pic_camera_command(int command, u8 value);
-#else
-static inline int sony_pic_camera_command(int command, u8 value) { return 0; }
-#endif
-
-#endif	/* __KERNEL__ */
-
-#endif /* _SONYLAPTOP_H_ */
-- 
2.49.0

