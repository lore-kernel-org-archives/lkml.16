Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D4F23ABB6;
	Wed,  2 Jul 2025 21:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492523; cv=none; b=V1uKr3FAIRsTHWaRC5xmBUfMCFhSRqwsTtLXCWaTb+g1pY93EvwLYUypvQwDq8tN8O9oWRWb7QTruSmlxfXlGqJw3tkOa45185nNKGTTqrslE8xdup8NkTlJTqCSCs8zfqD/lx9SSTX0YWAaUfcfQc8afjOrdBr4fvRVuxaEVRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492523; c=relaxed/simple;
	bh=FYOSJ6rstKG5kJTz/8invdShgT5FvzKnSwW4R8SFOas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=WtMl0gP7R/cSu3D9KTtXFrdckvhxCM5nSmqhWHW0s4O7daPso/R8YF/4+5u1XF/1kEWtCZL2WSpZASamdGjJkbwn/waI7Jj09G95e6xf+SKPYYoy37Tn0vK+nOXhS5Mfu/haJ/Sv466B5/Nu3cF5Bl5E5ZnHN9APo8+4WatM1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=jEZyiRDh; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="jEZyiRDh"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 28C89A0BB5;
	Wed,  2 Jul 2025 23:41:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=LMptU3Sc5+xY/XVGbDh1B7NKVs+zYhOoavdCfgn5VJc=; b=
	jEZyiRDhZcQDyBv+pSNXxLtnVwa/vsAxwVRW9FQvK+LgSdxfn4+VKviINSueGJHq
	hvsD+4CH2D9RwuUfOZGcUh6sgNBn4h+8p/G8cO0ztBuG9XEbB7EsMX4ZHc6Z2wTb
	+Oz5oMBcIGzTn2e9ZahC2G0vOc24a5/rAHi18NIzpunRFktDHcTTvvpYsKO5c+dV
	b0vB+JeN3BPaPY+wxhKeQwBnkSJ7COjJYGNb4cBwhH751XOWzk/u4J0st+B3wy6F
	O3pzmew+Fq2NfYrA/nq4uF9W1nTIXbTIlEjGnv307DH9BsO69Wk5KY1Hx0d3k9iu
	FPlvE4mXRE6UU/Lz4A1ig6kTGXrQ6Bt2Fz2fTUmBVzFvk0ZpOvZ82Cq4PJc4iXsj
	n/Bmzu2KrwMFaGDH+KDQAJxmTNnbwK9hWTAB57TBGBELJzbfdCbAPr+GuIdHLnnI
	NOsuRCJ+qk2idO+jcrcMfmf0nBVBZJ7A0g7qIbIQ5KUZWZ+sCWJhdSZxNUgCLMft
	UW2RdfISfXf/JazmgnPW2DzUmCsRq5HZvJ1YSq2/cgnLpyfXNlCWZQ2UI8/3dGRs
	wrWpfHADwW2Gs7UzEWRk2xqxcGswfLf12rKW8p3PR/4V6yiZIL6udlH6Cuj6HsIx
	n1wkBCsrxsfqHo6tWp2TrkV1tEFMjDPXmfOxL65NEqA=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 2 Jul 2025 23:41:54 +0200
Subject: [PATCH] arm: DT: imx6-sr-som: Replace license text comment with
 SPDX identifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
X-B4-Tracking: v=1; b=H4sIAKGnZWgC/x3MQQqEMAxA0atI1gZqQQtzlcFFG+M0MFZJRAbEu
 091+Rb/n2Cswgav5gTlQ0zWUtG1DVCO5cMoUzV453sXnEdTtHXBaTf8CmHqhpnC4HpKHmq0Kc/
 ye4bvsTpFY0waC+V7s0TbWeG6/p1qwMZ5AAAA
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751492515;VERSION=7994;MC=3329611887;ID=217464;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C7266

Replace verbatim license text with a `SPDX-License-Identifier`.

The comment heades mis-attributes this license to be "X11", but the
license text does not include the last line "Except as contained in this
notice, the name of the X Consortium shall not be used in advertising or
otherwise to promote the sale, use or other dealings in this Software
without prior written authorization from the X Consortium.". Therefore,
this license is actually equivalent to the SPDX "MIT" license (confirmed
by text diffing).

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi      | 38 +---------------------
 4 files changed, 4 insertions(+), 148 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi
index e491f5c9d455..0d7e14a94305 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2013,2014 Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License
- *     version 2 as published by the Free Software Foundation.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <dt-bindings/gpio/gpio.h>
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi
index ddca24414d26..3053a28c42cd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2013,2014 Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License
- *     version 2 as published by the Free Software Foundation.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
 &iomuxc {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi
index cd1e682f11ad..5a35436bb30a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2013,2014 Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License
- *     version 2 as published by the Free Software Foundation.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi
index 7af74b203e39..6aea7bf06e7a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2013,2014 Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License
- *     version 2 as published by the Free Software Foundation.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <dt-bindings/gpio/gpio.h>
 

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-sr-som-dts-lic-b16fc7605cb2

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>


