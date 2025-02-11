Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B082512E3;
	Tue, 11 Feb 2025 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290005; cv=none; b=UTFhmOsRH2l68XguXSJjfxJ4Fxi3gmD1p3BUZf+Pqz4cMIxoy4phD2+azK9tY26HYS38vleluL6erDKlIZ/11+CGaMAv4IxPxdRMG88ru0MexSKtllMu+FhBOfztqvV1/z04ItAC3y1FLwfG7uTFe6Ef8jzjiegazhr/jL0rbW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290005; c=relaxed/simple;
	bh=WeRi7NZFe2sGwOto6fPoXX03nUojRwoQZQBGPKqw3n0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fAzqWnl6tWyaVEsZZrJlwaqojiEleRyr4Da7mcjJDGZGx9vDfB4ZGAQRDoHKZRJPnhMlcSdm01zZbu808rKDeva0Y10niccxpVn4f890Uxlrq/tTlTB7tI2UTo4/UoGHsYm7QP7mbCY4V3UqAJP9lwLnCj1hqxW5fgveKMFWTkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQuTJv/3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQuTJv/3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0773C4CEDD;
	Tue, 11 Feb 2025 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739290004;
	bh=WeRi7NZFe2sGwOto6fPoXX03nUojRwoQZQBGPKqw3n0=;
	h=From:To:Cc:Subject:Date:From;
	b=GQuTJv/34xMDQCcadMB0YBoJ//1CuOmikppa9Jz0b5Q5n3hHZvJcuN4wZzgcroOkS
	 NuL1vUBMx+4UnEJBjPj44VgS9pXCyU65kAj+UVDOUXdaKRJmRNiCG6xRGPqeM2H6ga
	 OQCygPgKFZob215YSSaYw8nve94/hmvvBYzg8tHPMR41HT2hd/xhA2okb8ktPvToKf
	 Gb4VihZhFyygKPph6fmRSLp6sdLIlWsRHRpqQ0EFB3bddQJKJ6CPhB/EVZ8alkqfv2
	 p8259hXqbi+sASQenMwcX3faco3avfpTRZSntFDiffZh3JThQy8ut7iKRjijT+Wr/q
	 Edvj3MxMcQPPQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thsmi-000000003F8-2FnR;
	Tue, 11 Feb 2025 17:06:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: mos7840: drop unused defines
Date: Tue, 11 Feb 2025 17:06:40 +0100
Message-ID: <20250211160640.12435-1-johan@kernel.org>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop some defines that have never (really) been used.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index ca3da79afd23..93710b762893 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -66,29 +66,16 @@
 
 #define MOS_WDR_TIMEOUT		5000	/* default urb timeout */
 
-#define MOS_PORT1       0x0200
-#define MOS_PORT2       0x0300
-#define MOS_VENREG      0x0000
-#define MOS_MAX_PORT	0x02
-#define MOS_WRITE       0x0E
-#define MOS_READ        0x0D
-
 /* Requests */
 #define MCS_RD_RTYPE    0xC0
 #define MCS_WR_RTYPE    0x40
 #define MCS_RDREQ       0x0D
 #define MCS_WRREQ       0x0E
-#define MCS_CTRL_TIMEOUT        500
 #define VENDOR_READ_LENGTH      (0x01)
 
-#define MAX_NAME_LEN    64
-
 #define ZLP_REG1  0x3A		/* Zero_Flag_Reg1    58 */
 #define ZLP_REG5  0x3E		/* Zero_Flag_Reg5    62 */
 
-/* For higher baud Rates use TIOCEXBAUD */
-#define TIOCEXBAUD     0x5462
-
 /*
  * Vendor id and device id defines
  *
-- 
2.45.3

