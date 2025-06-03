Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983426A090;
	Tue,  3 Jun 2025 07:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934680; cv=none; b=fjqEC3QYR4dovcvegzlj8WD2DG1yM5/F50+yhdCrzTGxVC1A/fX24kGec+hIYBGfJZRBvlTMA7Tco/ZnyXpARreg3mp2SPRrWZ+5suAfBCKtVlb9gpbrkYBu/fhZVeC5aV8WiWo05yC3mkQRtFM0SloOaMm74CU8snusUlbcIu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934680; c=relaxed/simple;
	bh=T5FzloFkdjDz21XkTA88CeuvWD9/G/zjwxhersyrBpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jfzsZlZ1pwKtdT3JTOhf1U0Q4SQJngOEsZfbjrFOmKqn0InNUPrjkMqofdnCuLbAZg0EIR5sisLgfNEXE+JWZjySoJDZWfc1PHYEdldhjV+4euys31MqnRLdMAsC2PE/1xx9Oq0ajb6G5xCiNl0esbznRVKB4qhdHEmRgqHLUwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ed8dcd04404911f0b29709d653e92f7d-20250603
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0bf43daa-09d2-4bb4-8b2d-a729f9098f3e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:5c524bdf9dcf0df48ea5a9909c65eb58,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ed8dcd04404911f0b29709d653e92f7d-20250603
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1336641376; Tue, 03 Jun 2025 15:11:11 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id C9CD916001A00;
	Tue,  3 Jun 2025 15:11:10 +0800 (CST)
X-ns-mid: postfix-683EA00E-577194277
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 3209E16001CC7;
	Tue,  3 Jun 2025 07:11:09 +0000 (UTC)
From: Jiayi Li <lijiayi@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lijiayi@kylinos.cn
Subject: [PATCH] usb: core: Add 0x prefix to quirks debug output
Date: Tue,  3 Jun 2025 15:10:45 +0800
Message-ID: <20250603071045.3243699-1-lijiayi@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use "0x%x" format for quirks debug print to clarify it's a hexadecimal
value. Improves readability and consistency with other hex outputs.

Signed-off-by: Jiayi Li <lijiayi@kylinos.cn>
---
 drivers/usb/core/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 53d68d20fb62..6a14d1df8d92 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -735,7 +735,7 @@ void usb_detect_quirks(struct usb_device *udev)
 	udev->quirks ^=3D usb_detect_dynamic_quirks(udev);
=20
 	if (udev->quirks)
-		dev_dbg(&udev->dev, "USB quirks for this device: %x\n",
+		dev_dbg(&udev->dev, "USB quirks for this device: 0x%x\n",
 			udev->quirks);
=20
 #ifdef CONFIG_USB_DEFAULT_PERSIST
--=20
2.47.1

