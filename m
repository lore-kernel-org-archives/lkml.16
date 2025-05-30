Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365661898F8;
	Fri, 30 May 2025 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748589538; cv=none; b=NfwJW2Yh5eVjHMLvYtN8ehYN+5pk9bOB4gGaxfqTXAyNJYnnpsqQjBaBwsdeCO36lH2rW2wDAzzeHm8aosyQK4ABkfkjEUTvt/hTu4R+96BqVEcCa33ZfOocTIbTQS1ikQjG4IkI/8Ic1uMNePQKAAJ9M6bhLq23n2XD5uP6EhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748589538; c=relaxed/simple;
	bh=fOAM++u9LTISAq68wmI6g+AZ7z3HPuYZIruMYuRA+eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6ZwyE815heQ4sErSS4unTvMZhIRASrB6TFhe6o3UdT8V2Vm8dcnR/viLT6zHpCsnpoYFqJdktIP5QYUm1PqNG4lPlGu8PffskcY5nx4eaJIiIq523TmIq/bUgyxsMtkP30vbx/EjupGsRzkgGdRSmq7XA5W7LwrQt9Wed4JD/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 539ca1503d2611f0b29709d653e92f7d-20250530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ee96e855-b6fc-499e-a774-5c0bfd2a5ede,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:3f1983991b840bf5a8054f82d285f2e9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 539ca1503d2611f0b29709d653e92f7d-20250530
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1256206541; Fri, 30 May 2025 15:18:46 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id AE87116001A01;
	Fri, 30 May 2025 15:18:46 +0800 (CST)
X-ns-mid: postfix-68395BD6-5408331627
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id CE81116001CC7;
	Fri, 30 May 2025 07:18:45 +0000 (UTC)
From: Jiayi Li <lijiayi@kylinos.cn>
To: gregkh@linuxfoundation.org,
	limiao@kylinos.cn,
	huanglei@kylinos.cn,
	mathias.nyman@linux.intel.com,
	oneukum@suse.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lijiayi@kylinos.cn
Subject: [PATCH v2] usb: quirks: Add NO_LPM quirk for SanDisk Extreme 55AE
Date: Fri, 30 May 2025 15:18:39 +0800
Message-ID: <20250530071839.2110556-1-lijiayi@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508033123.673964-1-lijiayi@kylinos.cn>
References: <20250508033123.673964-1-lijiayi@kylinos.cn>
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
v1 -> v2: modify a format error.
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 36d3df7d040c..53d68d20fb62 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -372,6 +372,9 @@ static const struct usb_device_id usb_quirk_list[] =3D=
 {
 	/* SanDisk Corp. SanDisk 3.2Gen1 */
 	{ USB_DEVICE(0x0781, 0x55a3), .driver_info =3D USB_QUIRK_DELAY_INIT },
=20
+	/* SanDisk Extreme 55AE */
+	{ USB_DEVICE(0x0781, 0x55ae), .driver_info =3D USB_QUIRK_NO_LPM },
+
 	/* Realforce 87U Keyboard */
 	{ USB_DEVICE(0x0853, 0x011b), .driver_info =3D USB_QUIRK_NO_LPM },
=20
--=20
2.47.1

