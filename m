Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06CC25EFB0
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293419; cv=none; b=pIuzg7vii+Q6GMKeUh5omkv9XYoQlL50s/Xgnq4i0K2z7kUN+7NnTF09TRz3rtu+0+M1NX32YEWNLfnMafb+dPLwDJ7zwdr/9QzywiySLBiJ7WtRrNaeekQQfBeTHMShN3tLhGTSUCogC0rsO9J/TG4qd/UhQy9Uc/3DzzELfeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293419; c=relaxed/simple;
	bh=LYW0vv1jWtX0lL7jFULpWEAdG0RJMZHQx4oMb1v2F60=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=npYLY8SxOs3D4oUAaXj9uvBPXHDx4lH769e9rHvPdHwgvtxWME41nqrnzCbwzeNoK6ICM1sx4w8mJx3i6YOiGHlZIBbUX01i4vqs9wXYZZdwZnMy0gyK66FU3RVPtkMVM7Wl36+c5b9iO0bYOWJI3B5xTkht6QmlM/gAjG6TD+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xHntbBuR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=veO11Ebz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xHntbBuR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="veO11Ebz"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739293415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dRp7orxxQr05a9e88VKTirgWAyYAbi2CZTRHfeYXBaU=;
	b=xHntbBuRPcyor33ICstkRqXubQQaMhrrwWVbYe0OMcx8TBITEgae37W8BLuDiLGp/JB96N
	uttqxvCUGrJXaboznALLxUy+c1EuvHovvkhZxWD6gi5ljvcAohNLRqMhDsx2edv6CYawFo
	LeGIqV4a83CqvFo+91hfQOnd77zz28x4eudaGJSz9S8p83yLj2hwfv3Ymme/p3cLmlXyB8
	pNen23EPJn4YgraFaD22kidrL5xFZrRgTnO/F+FHbZao5UU6Qtk60W5oajQ+u3ugM1+7h1
	0zEKycS0e2qq92DkebLdo42uucEakjIo3lTXssR5GFi8oRuLnCExgVuSVpjsTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739293415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dRp7orxxQr05a9e88VKTirgWAyYAbi2CZTRHfeYXBaU=;
	b=veO11EbzToyInK0BrRlM5RcryjvGi2T52QIYuVOgdhnqub5nrRYCNnPImtgerbByeyKCX3
	lqAcvd/jCrW24hBA==
Subject: [PATCH 0/2] firmware: cs_dsp: Remove usage of GFP_DMA
Date: Tue, 11 Feb 2025 18:03:27 +0100
Message-Id: <20250211-cs_dsp-gfp_dma-v1-0-afc346363832@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAN+Cq2cC/x3MQQqAIBBA0avIrBNUEKqrRIg5U80iEwciiO6et
 HyL/x8QqkwCo3qg0sXCZ26wnYK0x7yRZmwGZ5w3zlqdJKAUva0l4BG18b1dEM2A6KFFpdLK9z+
 c5vf9AB7NO5tgAAAA
X-Change-ID: 20250211-cs_dsp-gfp_dma-0581bdd09dd5
To: Simon Trimmer <simont@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739293413; l=1009;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LYW0vv1jWtX0lL7jFULpWEAdG0RJMZHQx4oMb1v2F60=;
 b=NnKj/pl+DYlgF7x+MEUCGiDHyC8YT6L1aGTaoBHulcDbOcdIwy4oKt8BLgJFNdwOwSf0Xbp7d
 d6uH8wB4T1KDq/0igNAhNcfqsxiCuyDrU3B8OVXzj1dh/lWdP73ZTWG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Also drop the bounce buffer in cs_dsp_coeff_write_ctrl_raw().

The bounce buffer in cs_dsp_coeff_write_ctrl_raw() could theoretically
also be removed. That would be a functional change as the output may be
modified in error cases.
As I don't know the driver very well I left that part out.

Not tested on real hardware.
This came up while porting kunit to mips64.
Apparently GFP_DMA does not work there, but IMO the usage of GFP_DMA by
cs_dsp is unnecessary in the first place.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (2):
      firmware: cs_dsp: Remove usage of GFP_DMA
      firmware: cs_dsp: Remove bounce buffer in cs_dsp_coeff_write_ctrl_raw()

 drivers/firmware/cirrus/cs_dsp.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-cs_dsp-gfp_dma-0581bdd09dd5

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

