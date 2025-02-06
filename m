Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08995209F3F;
	Thu,  6 Feb 2025 05:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738820586; cv=none; b=pfs/aeA8+BctqTkGPSmRMiCP5N8tjEBNg/FJMJyxOodcmt+JkOp6gu07KyylqCuzGV71oQN6BcbRe9hdo+RNGtksK2uizx6T/BQLS2Pw4JI1GnbtibLpG88G15Dw/DJ11Sqv+KEQK/SxGuNAJEkVGndrv2WvkN9GK5m0TfjRiuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738820586; c=relaxed/simple;
	bh=9BZe+cEyYou1blzEL+/9tbvtA8C9HEgYEu+jv9YOTGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YRQw8D/LHCWbt70AaWBET4rmXkXMX6zd72lMb6MDK8VtsokcnMAlUWVFZ70yqhdEltL1OwyVaRY3aGLO6n34Rulg1OJKvOFBkIcml+kWkMGbAaqplB4MJmBktCmXyc4NUPk4zl8nAoR3WpYN0lfj4DXlzYtQcCTqeGoxe/VOPe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=T2iOuy0X; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="T2iOuy0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738820541;
	bh=QF38I/tzVHyo4qFvBBwEmSImd2gsUnZ/WmAknAwOxvs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=T2iOuy0XJZXHm356exHiR97MYyzTgNUTtdf0CkhIYf12mwC3CFTgCI3U8R8J+0i/Y
	 rg7Ya25xjVFGiUdDeYwAuk3no5MWXJ/5Z7RBfb/5XQUNsqre4w8YBzkYoLF0k62ztx
	 oP8NcRftnmbk0DYON0TZNbO9+XHbYroVsCRxuyCM=
X-QQ-mid: bizesmtpip4t1738820480tfodjpw
X-QQ-Originating-IP: sg7VSIWw9r0NsVjElq7vwWqxXNOLvBEtzTSj2AbwP5U=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Feb 2025 13:41:18 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2559714310624554631
From: WangYuli <wangyuli@uniontech.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com,
	WangYuli <wangyuli@uniontech.com>,
	Xinwei Zhou <zhouxinwei@uniontech.com>,
	Xu Rao <raoxu@uniontech.com>,
	Yujing Ming <mingyujing@uniontech.com>
Subject: [PATCH] usb-storage: Bypass certain SCSI commands on disks with "use_192_bytes_for_3f" attribute
Date: Thu,  6 Feb 2025 13:41:07 +0800
Message-ID: <AC1BB7F0327EFB9C+20250206054107.9085-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NN51gi9eLBwaclD7ocwpjimzAwSzQsbHtwRR75ZQCv+V3veeHZBxADAm
	RVAWsSBAri17QjfFjIro4wbRD55CxZAWXc2YFIpXXDF7Dy4+IoAi6JX9ZHMtKX0Fttk6vxQ
	cVXzMTipUDGwbp4WdeG+QxADPQuLucoxWiLYUB+XEFAGFxuBJnwK+rnFI/JyKBplI2URnJG
	/jKNkmeUEUsOL7inYy0x38zKpGqOdu4Zc0Etvy65rYcrouJF7ArMjY19OIN3osK1rGmiTIe
	1hRUgQJFLMww8xiTLJrPz4Ufqrg4mrm0+LwwjYPtf4SYbg56MBzWiikt3r8IIMWeP4C8HM/
	oCMU/BQm4RDCZz2ViOrRaSx8PZ9ZSMOb4jaYLuRecUjx4MyNI3DcM4ZGNDy7Qkv2ansljGm
	KC1Kmjw21e0vtUfJeeTZgl0wuykJMczcizzyGL8RcusJcTYtzgwIvdtpF/a3VpYRMoXJeqX
	t+NLzKfnQ/jQ/mM5iK20XMrGf23dzHDBvthtLMlAT+sNQOlSvglw5jGYNVlEznUPO9+pE0I
	Xgu9uKBttSl8NspQbRGiixnJFU4PRYVAa3NAF6AF0YkyIBkzpeQXhzdsveMP5VQxqOxSmqV
	F8VKPsQzlU72+mlhjPDEJ6/Owh9a/c4I1piJ6rXkPTGIrUUFKd24i23InqgoJYyxUfd2xyk
	YnWt5v0AZt15aVzvURcCZ39UzBF4An5s8sv0waOj5OrvAXdRxE5oD68KzmwNBVMV0pfQ0mT
	uC4tSbhnKbT+cFJypPG5ligAmoZODR7xVsV7TZ29tOOCHoVR2rB6jfAuNPU52aS6RGRfCzv
	EQOjD3PxZAHZip2BX4rfHAGYGPfKhdcPmRMbAewzL/MNCaEYNRqywAWi/LI2JI29PoYO2oI
	pGbp7zxEgjPd4pe11NQG9ku6uuApShThuR86P1IbISUUv3RAPzXbCjikkgxcO4S1vhMt7w+
	5b+eMr1R7C+dbUUFhWKRzO6sAOmw7BFhxoCqkv4fipEe5FMJcXdJJNOZ7tLxKuCVK/d09dC
	wIlLJ6MQgnxyQmYE75AOlw8scn2I8=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On some external USB hard drives, mounting can fail if "lshw" is
executed during the process.

This occurs because data sent to the device's output endpoint in
certain abnormal scenarios does not receive a response, leading to
a mount timeout.

[ Description of "use_192_bytes_for_3f" in the kernel code: ]
  /*
   * Many disks only accept MODE SENSE transfer lengths of
   * 192 bytes (that's what Windows uses).
   */
   sdev->use_192_bytes_for_3f = 1;

The kernel's SCSI driver, when handling devices with this attribute,
sends commands with a length of 192 bytes like this:
  if (sdp->use_192_bytes_for_3f)
  	res = sd_do_mode_sense(sdp, 0, 0x3F, buffer, 192, &data, NULL);

However, "lshw" disregards the "use_192_bytes_for_3f" attribute and
transmits data with a length of 0xff bytes via ioctl, which can cause
some hard drives to hang and become unusable.

To resolve this issue, prevent commands with a length of 0xff bytes
from being queued via ioctl when it detects the "use_192_bytes_for_3f"
attribute on the device.

The hard drive device identified with the issue is Lenovo USB 17ef:4531.
Tested on HONOR NBLK-WAX9X (C234) Notebook with AMD Ryzen 7 3700U.

[ Kernel logs: ]
  2024-10-31 13:36:11 localhost kernel: [   25.770091] usb 2-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
  2024-10-31 13:36:11 localhost kernel: [   25.798558] usb 2-2: New USB device found, idVendor=17ef, idProduct=4531, bcdDevice= 5.12
  2024-10-31 13:36:11 localhost kernel: [   25.798562] usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  2024-10-31 13:36:11 localhost kernel: [   25.798564] usb 2-2: Product: Lenovo Portable HDD
  2024-10-31 13:36:11 localhost kernel: [   25.798566] usb 2-2: Manufacturer: Lenovo
  2024-10-31 13:36:11 localhost kernel: [   25.798567] usb 2-2: SerialNumber: 000000001E4C
  2024-10-31 13:36:11 localhost kernel: [   25.820244] usb-storage 2-2:1.0: USB Mass Storage device detected
  2024-10-31 13:36:11 localhost kernel: [   25.820457] scsi host0: usb-storage 2-2:1.0
  2024-10-31 13:36:11 localhost kernel: [   25.820633] usbcore: registered new interface driver usb-storage
  2024-10-31 13:36:11 localhost kernel: [   25.825598] usbcore: registered new interface driver uas
  2024-10-31 13:36:14 localhost kernel: [   28.852179] scsi 0:0:0:0: Direct-Access     Lenovo   USB Hard Drive   0006 PQ: 0 ANSI: 2
  2024-10-31 13:36:14 localhost kernel: [   28.852961] sd 0:0:0:0: Attached scsi generic sg0 type 0
  2024-10-31 13:36:14 localhost kernel: [   28.891218] sd 0:0:0:0: [sda] 976773164 512-byte logical blocks: (500 GB/466 GiB)
  2024-10-31 13:36:14 localhost kernel: [   28.906892] sd 0:0:0:0: [sda] Write Protect is off
  2024-10-31 13:36:14 localhost kernel: [   28.906896] sd 0:0:0:0: [sda] Mode Sense: 03 00 00 00
  2024-10-31 13:36:14 localhost kernel: [   28.922606] sd 0:0:0:0: [sda] No Caching mode page found
  2024-10-31 13:36:14 localhost kernel: [   28.922612] sd 0:0:0:0: [sda] Assuming drive cache: write through
  2024-10-31 13:36:14 localhost kernel: [   29.007816]  sda: sda1
  2024-10-31 13:36:15 localhost kernel: [   30.180380] sd 0:0:0:0: [sda] Attached SCSI disk
  2024-10-31 13:36:16 localhost kernel: [   30.722863] snd_hda_codec_realtek hdaudioC1D0: hda_codec_setup_stream: NID=0x3, stream=0x5, channel=0, format=0x4011
  2024-10-31 13:36:16 localhost kernel: [   30.734139] snd_hda_codec_realtek hdaudioC1D0: hda_codec_setup_stream: NID=0x2, stream=0x5, channel=0, format=0x4011
  2024-10-31 13:36:17 localhost kernel: [   31.396011] start_addr=(0x20000), end_addr=(0x40000), buffer_size=(0x20000), smp_number_max=(16384)
  2024-10-31 13:36:18 localhost kernel: [   32.933537] snd_hda_codec_realtek hdaudioC1D0: hda_codec_cleanup_stream: NID=0x3
  2024-10-31 13:36:18 localhost kernel: [   32.933541] snd_hda_codec_realtek hdaudioC1D0: hda_codec_cleanup_stream: NID=0x2
  2024-10-31 13:36:39 localhost kernel: [   54.242220] usb 2-2: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
  2024-10-31 13:36:50 localhost kernel: [   64.408879] start_addr=(0x20000), end_addr=(0x40000), buffer_size=(0x20000), smp_number_max=(16384)
  2024-10-31 13:37:11 localhost kernel: [   85.466479] usb 2-2: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
  2024-10-31 13:37:11 localhost kernel: [   85.490248] sd 0:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_TIME_OUT driverbyte=DRIVER_OK
  2024-10-31 13:37:11 localhost kernel: [   85.490255] sd 0:0:0:0: [sda] tag#0 CDB: Read(10) 28 00 00 00 00 20 00 00 08 00
  2024-10-31 13:37:11 localhost kernel: [   85.490258] print_req_error: I/O error, dev sda, sector 32
  2024-10-31 13:37:33 localhost kernel: [  107.432186] start_addr=(0x20000), end_addr=(0x40000), buffer_size=(0x20000), smp_number_max=(16384)
  2024-10-31 13:37:41 localhost kernel: [  116.194201] usb 2-2: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
  2024-10-31 13:37:49 localhost kernel: [  123.555484] dolphin[7271]: segfault at 10 ip 00007fcccc0d7f76 sp 00007ffe8004b860 error 4 in libKF5CoreAddons.so.5.102.0[7fcccc0a5000+83000]
  2024-10-31 13:37:49 localhost kernel: [  123.555502] Code: d6 90 66 90 41 54 41 89 d4 55 48 89 fd 53 48 89 f3 e8 8e 94 01 00 ba 04 00 00 00 48 89 de 48 89 c7 e8 4e 8f 01 00 84 c0 75 2a <48> 8b 7d 10 48 85 ff 74 21 45 89 e1 48 89 da 48 89 ee 5b 41 b8 01
  2024-10-31 13:38:11 localhost kernel: [  146.229510] usb 2-2: USB disconnect, device number 2
  2024-10-31 13:38:11 localhost kernel: [  146.237993] scsi 0:0:0:0: rejecting I/O to dead device
  2024-10-31 13:38:11 localhost kernel: [  146.238003] print_req_error: I/O error, dev sda, sector 32
  2024-10-31 13:38:11 localhost kernel: [  146.238009] Buffer I/O error on dev sda, logical block 8, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238029] scsi 0:0:0:0: rejecting I/O to dead device
  2024-10-31 13:38:11 localhost kernel: [  146.238030] print_req_error: I/O error, dev sda, sector 36
  2024-10-31 13:38:11 localhost kernel: [  146.238032] Buffer I/O error on dev sda, logical block 9, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238045] scsi 0:0:0:0: rejecting I/O to dead device
  2024-10-31 13:38:11 localhost kernel: [  146.238047] print_req_error: I/O error, dev sda, sector 6291480
  2024-10-31 13:38:11 localhost kernel: [  146.238062] Buffer I/O error on dev sda1, logical block 786431, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238168] Buffer I/O error on dev sda, logical block 8, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238170] Buffer I/O error on dev sda, logical block 9, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238175] Buffer I/O error on dev sda, logical block 8, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238176] Buffer I/O error on dev sda, logical block 9, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238184] Buffer I/O error on dev sda, logical block 8, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238185] Buffer I/O error on dev sda, logical block 9, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238199] Buffer I/O error on dev sda, logical block 40, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238201] Buffer I/O error on dev sda, logical block 41, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238205] Buffer I/O error on dev sda, logical block 8, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238206] Buffer I/O error on dev sda, logical block 9, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238210] Buffer I/O error on dev sda, logical block 8, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238211] Buffer I/O error on dev sda, logical block 9, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238215] Buffer I/O error on dev sda, logical block 8, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238217] Buffer I/O error on dev sda, logical block 9, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238220] Buffer I/O error on dev sda, logical block 8, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238221] Buffer I/O error on dev sda, logical block 9, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238224] Buffer I/O error on dev sda, logical block 8, async page read
  2024-10-31 13:38:11 localhost kernel: [  146.238226] Buffer I/O error on dev sda, logical block 9, async page read
  2024-10-31 13:38:12 localhost kernel: [  146.482007] snd_hda_codec_realtek hdaudioC1D0: hda_codec_setup_stream: NID=0x3, stream=0x5, channel=0, format=0x4011
  2024-10-31 13:38:12 localhost kernel: [  146.494064] snd_hda_codec_realtek hdaudioC1D0: hda_codec_setup_stream: NID=0x2, stream=0x5, channel=0, format=0x4011
  2024-10-31 13:38:15 localhost kernel: [  150.065848] snd_hda_codec_realtek hdaudioC1D0: hda_codec_cleanup_stream: NID=0x3
  2024-10-31 13:38:15 localhost kernel: [  150.065852] snd_hda_codec_realtek hdaudioC1D0: hda_codec_cleanup_stream: NID=0x2
  2024-10-31 13:38:26 localhost kernel: [  160.433037] start_addr=(0x20000), end_addr=(0x40000), buffer_size=(0x20000), smp_number_max=(16384)
  2024-10-31 13:39:29 localhost kernel: [  223.444589] start_addr=(0x20000), end_addr=(0x40000), buffer_size=(0x20000), smp_number_max=(16384)

Link: https://linux-hardware.org/?id=usb:17ef-4531
Reported-by: Xinwei Zhou <zhouxinwei@uniontech.com>
Co-developed-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
Tested-by: Yujing Ming <mingyujing@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/usb/storage/scsiglue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index d2f476e48d0c..366ab402217c 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -361,6 +361,7 @@ static int queuecommand_lck(struct scsi_cmnd *srb)
 {
 	void (*done)(struct scsi_cmnd *) = scsi_done;
 	struct us_data *us = host_to_us(srb->device->host);
+	struct scsi_device *sdev = srb->device;
 
 	/* check for state-transition errors */
 	if (us->srb != NULL) {
@@ -369,6 +370,13 @@ static int queuecommand_lck(struct scsi_cmnd *srb)
 		return SCSI_MLQUEUE_HOST_BUSY;
 	}
 
+	if (srb->cmnd[0] == MODE_SENSE && sdev->use_192_bytes_for_3f == 1 &&
+		srb->cmnd[2] == 0x3f && srb->cmnd[4] != 192) {
+	   srb->result = DID_ABORT << 16;
+	   done(srb);
+	   return 0;
+	}
+
 	/* fail the command if we are disconnecting */
 	if (test_bit(US_FLIDX_DISCONNECTING, &us->dflags)) {
 		usb_stor_dbg(us, "Fail command during disconnect\n");
-- 
2.47.2

