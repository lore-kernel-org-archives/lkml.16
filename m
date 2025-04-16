Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F311B87E2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815616; cv=none; b=EraGNsV+7YR6IAmxdlowafL34Vzlay73OpEAZyklcXVv0HzRtBQNY4AQYRjEn7sWwgo0MiH+7QDMVErw0ngxPWfUW6ZGBVqMFBc2sR1gFknS5MW2DzL2h3sAEQtdhhRHOBbNLgTueDpQvFbMegUfuglBFAXdLsl8yUzr4fz6hP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815616; c=relaxed/simple;
	bh=8kbxOEODvzFpFE1cl1PwwakG+0bF+4gT1/VdflCZR6U=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=fCbRbwIDEhkE2JKfd8ec4nxwa/vMvPA45PKDLtFMRoF9D+hSuhF+FhmpCaRMFgpxwhNYi+Y6YvKyt+VL7v3ST2Pa2Fv5XK0WGizo1oZjrxITRvJwEIh44B6fhA3hyepR1tyMioiJYevQzzHHDyTB1oxeQDi4f2qwmqD4w/CR9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=eNP6FUgj; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="eNP6FUgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744815610; x=1745420410; i=markus.elfring@web.de;
	bh=JwG+vvXK0gW0CaUyaX5L4N0GIiyWr9E8Vf0rHqz3H7w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eNP6FUgjGeC0+axdEPhi6S1ZctcC0oYZ26ptr3S6FFCXUz3Sr2+TcxQgNSVF3Vyz
	 vK1rYLpbaK8GJ4rNHMVJmpzDbmX9I0PIW2Kp8n0arFp4voBt5mC/bd0rccNf0lKAB
	 eza3fB6kPr7SHrXMEX82bxVpzXTmHcOoDd5mEiGu3/xa/c1FagQCLT4/MeNNQzrJZ
	 bMZT7IqwGaj8fkpbfTGKS8yl+zU5NyrArzfDWR4IfpGuidK2dyjlH1uKMTe4NdBZg
	 OS30xfrRy5DuV0FsMO7eNleXj0Y3jEmxiyxLrSB7FbKbV1SM6YX8VP8HVj4cgxrju
	 6VlgqQlakSXmqX5oXw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M5Qm1-1u3gfX35XB-0093kY; Wed, 16
 Apr 2025 17:00:10 +0200
Message-ID: <81979474-04ac-4712-a28b-3d15b697c97e@web.de>
Date: Wed, 16 Apr 2025 17:00:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mtd@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang
 <chenyuan0y@gmail.com>, Michael Walle <michael@walle.cc>,
 Julia Lawall <julia.lawall@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] mtd: rawnand: pl353: Replace devm_kasprintf() call by
 devm_kstrdup() in pl35x_nand_chip_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GtCprZMrhcdkUfwX51AoGw4EjPScQrmbPVPc33hq8MmD3rlFby9
 Ye50aEmAHcVFdhABGmrWLWuMUhhV6mEH0Q6zP2Q93Jg1rKqV7EJ1bhkamkR2ZpOQFBCAbjA
 u9yBqRAaHH9Sx220Y0VDWxvosFhGJl9W9Z2IR/7b6rKZGBsiGg1oURS0iwwSsd2RQ4wB809
 8T8v3U+bjMAeMhZbXHaSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K/MLVp6BMHo=;nITy5TtiXZJM7oqaDMnbQQOMkD9
 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
 l4rsg1Kq6PtBDSZcaJ5DNwgZffdUshfqEl

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Apr 2025 16:52:04 +0200

Use a devm_kstrdup() call instead of a devm_kasprintf() call
in this function implementation because only a single string
should be copied.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/na=
nd/raw/pl35x-nand-controller.c
index 09440ed4652e..86f684bf8624 100644
=2D-- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1071,8 +1071,8 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *=
nfc,
 	mtd->dev.parent =3D nfc->dev;
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
-		mtd->name =3D devm_kasprintf(nfc->dev, GFP_KERNEL,
-					   "%s", PL35X_NANDC_DRIVER_NAME);
+		mtd->name =3D devm_kstrdup(nfc->dev, PL35X_NANDC_DRIVER_NAME,
+					 GFP_KERNEL);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
 			return -ENOMEM;
=2D-=20
2.49.0

