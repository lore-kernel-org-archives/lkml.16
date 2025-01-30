Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07CC1E570A;
	Thu, 30 Jan 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242083; cv=none; b=McXtsZ0B3nARWtnGABkdgnf8SsE279LwMVAYJH1JgU27LA2bDR1PxVFwKrbTa9LuY8/KoZcT6HPYhSo+foMdm5/epqvFlLHGFh8KAoofdV+fgS4+Dxb1jZ+YaU0OJ4TJtsGt+toXj2H/A8DsM1FwG+OLZjoZlJI5eSnCDJ0tsJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242083; c=relaxed/simple;
	bh=rbEchRQ+wV8EaTH4iHJzmbF5axI1EX9sj6LXbyJhTjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QVg/kNovA0YV3S8J9HuiYBAFBWf0XxURmlUtkDZkkRhCDLGLERmszR++bp1ow4Oooebi7hzNjEjsBHTdzFmUbcyxWcfRNaaeemzUZLPm5WVTVJ3610swo3i91xR1Qt7Ny21tlYz+Hgb83+J/69UZ6PDF99nOuB2IPgnv4z4HhQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=nJEp1mt8; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=P9QJefT0 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="nJEp1mt8";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="P9QJefT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738242081; x=1769778081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1qhRbu605zRQmNnQr5f4yNDwmxxb+PPe4g8I5X68vQg=;
  b=nJEp1mt82S6sIausHcrfnAjQo03Sx6NryV01vXfm/H69xpX0FLKRjOgV
   dC0/f+sqDH3lpwEdJS9m3+XdykyS0NSwcYLgsbQYtfWhceZ1CHzMenpG8
   JQX1IcSGGUwiuagDxa582oDAbPuil+IQHr9NbuD/5E6Ijp//KWnzWadWr
   r9SfKMBZY5swjykID2FdGrJvk+qXb+h3Sst8dAKrD8zTLFg8A4v1D8sLE
   6eoMtI3bUO70CFVAnx3f7yjk+IjnIpSp2CVNPtQ41IbOANrYPEAY/mjQR
   OKzsewqdsJd553dpUs7iC4K+iqAp49Q6EeE6sANjJ9ymGEIY3NhmPOMWm
   w==;
X-CSE-ConnectionGUID: JJtIfw3ORCuByqg3pGf1Qg==
X-CSE-MsgGUID: 4kNxiujQRCCAMM/dMkGYkA==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41374603"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 14:01:18 +0100
X-CheckPoint: {679B781E-55-1CE016C0-E589DA3E}
X-MAIL-CPID: 98CB8C2355A9D21FC1577AA8A1651977_1
X-Control-Analysis: str=0001.0A682F1E.679B781F.0017,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 239971675B4;
	Thu, 30 Jan 2025 14:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738242074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qhRbu605zRQmNnQr5f4yNDwmxxb+PPe4g8I5X68vQg=;
	b=P9QJefT0IPrYF3Smx7qjegIOujC1UdIQEbRkT1xuE8bxTOBvLsqHGEeFdzscAwcDJ+gPGb
	KhIWzDI0KjaHF5c5j839jT73xUxiBsm02iB7yk8iUQ9MZ5WkNsGpPW8z3ES3OlYLCJxkuW
	HXffa0F/I1ilKFp1Re9HSa9rEi7YpsFIxQuUPcW97pguod14f+wOP212efR6FeMjeBD753
	TXnXa2unORAgGjIoydKlpc9jGkc7Jr5HImyeJvGzIBtFaT0i8t9E+/HjJ12qYjMkDUKAX8
	wFITMOScrgV+WjGgf6CdSduR2v1THwCDpXYoVWmol7A+MM0toQlPZuLP4xZkdw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] nvmem: imx-ocotp: Sort header alphabetically
Date: Thu, 30 Jan 2025 14:00:59 +0100
Message-Id: <20250130130101.1040824-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Move linux/delay.h to the right position.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/nvmem/imx-ocotp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda03295..c5086a16450ac 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -22,7 +23,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
 
 #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
 					       * OTP Bank0 Word0
-- 
2.34.1

