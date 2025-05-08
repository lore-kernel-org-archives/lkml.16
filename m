Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058E1155335;
	Thu,  8 May 2025 03:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746675130; cv=none; b=QQKlypiRbtiprTaMYH3G8fNPYxCqi/DntdCawqDDSEaaWemXAXHeP89GCP30qFzfuHs48rCcDmL0cjYMRrVSwsULfbaqzBjmNnFJHggwpFOuUaDq/CQuZdo6C6zQKcBcJBUF3BLFw1qdcv1PCxkr4eSnoqdz5cdziLYaGCAGdRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746675130; c=relaxed/simple;
	bh=2CfUO8LNFdsBkXWfwUCWctX8x6NTN6GOYL2+F+fe2f4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qnipf1xME67FvFD7zkkcUM9Wkpv/pu5l0GF40n2txNeGZTbdlzinXUOb0yiNb/HxgIqqEr95msucU/+wPCo791SV5y8Mla0ro7MK0FgRz1j8dZJdLzppsWoqg6is0VL5jOs/F1IhVP8eCVmT1YBAxnGpYpZZ1BYHQhbAnjtJ4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 00a470f62bbd11f0b29709d653e92f7d-20250508
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:3a67a1a9-df3e-40d6-9115-5533e3256cfd,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:fea10e45fde6cb9dd38a69494230e30c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 00a470f62bbd11f0b29709d653e92f7d-20250508
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 272000526; Thu, 08 May 2025 11:32:00 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 9A88A16003840;
	Thu,  8 May 2025 11:32:00 +0800 (CST)
X-ns-mid: postfix-681C25B0-4612909
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 1889916001CC7;
	Thu,  8 May 2025 03:31:59 +0000 (UTC)
From: Jiayi Li <lijiayi@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lijiayi@kylinos.cn
Subject: [PATCH] usb: quirks: Add NO_LPM quirk for SanDisk Extreme 55AE
Date: Thu,  8 May 2025 11:31:23 +0800
Message-ID: <20250508033123.673964-1-lijiayi@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This device exhibits I/O errors during file transfers due to unstable
link power management (LPM) behavior. The kernel logs show repeated
warm resets and eventual disconnection when LPM is enabled:

[ 3467.810740] hub 2-0:1.0: state 7 ports 6 chg 0000 evt 0020
[ 3467.810740] usb usb2-port5: do warm reset
[ 3467.866444] usb usb2-port5: not warm reset yet, waiting 50ms
[ 3467.907407] sd 0:0:0:0: [sda] tag#12 sense submit err -19
[ 3467.994423] usb usb2-port5: status 02c0, change 0001, 10.0 Gb/s
[ 3467.994453] usb 2-5: USB disconnect, device number 4

The error -19 (ENODEV) occurs when the device disappears during write
operations. Adding USB_QUIRK_NO_LPM disables link power management
for this specific device, resolving the stability issues.

Signed-off-by: Jiayi Li <lijiayi@kylinos.cn>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 36d3df7d040c..2bb70a34d4c5 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -372,6 +372,9 @@ static const struct usb_device_id usb_quirk_list[] =3D=
 {
 	/* SanDisk Corp. SanDisk 3.2Gen1 */
 	{ USB_DEVICE(0x0781, 0x55a3), .driver_info =3D USB_QUIRK_DELAY_INIT },
=20
+	/* SanDisk Extreme 55AE */
+        { USB_DEVICE(0x0781, 0x55ae), .driver_info =3D USB_QUIRK_NO_LPM =
},
+
 	/* Realforce 87U Keyboard */
 	{ USB_DEVICE(0x0853, 0x011b), .driver_info =3D USB_QUIRK_NO_LPM },
=20
--=20
2.47.1

