Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB712D374D;
	Wed,  2 Jul 2025 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751484851; cv=none; b=T4OOo23a3Z2akADKwcjM58XMft0kI4x6GQc6Iind85MlMdSiS3aiakRH3iQXxrRddAwGPF2FJ42fyCwEVtFMOWRoUjyXxugBbBq0qYB961eeX5BNydQnt6D7Hqr7kM5AAGNEN24gKVWvnrgs2ZCxcLAjg2F6VZh9dO6N7lBHsjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751484851; c=relaxed/simple;
	bh=8pnqjpTgm/dY3uJQ/K8gTFLBuTuerdpi72ooNZgSryU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=RW05JKmIGTGrKKScIkMFirmDwomAGbFH2DizKWEuRWTYxHkuKvQFcLLKMkjF5HJsSAiGdxIv53kl/kA+pm6LRR1kyzWO2BYIhWiNGMdyKK1NltpTC6N/+k6nfqX0258QhMOWABOlJObbgv2S6Z3baK9Pu8Fx+GmNwBoN0RF2VII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=eZn8oWSn; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="eZn8oWSn"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 621FCA0BB5;
	Wed,  2 Jul 2025 21:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=+dOny2yXaYYEUCrrYRoGP+TgzGV8/v/+itODD2XxlNI=; b=
	eZn8oWSnz/wocugRyc8b3w6SY/z0CIIaAzpyOC371dqKreQlGQL2FIR++K9IxjOT
	gqjm3yh4EL7rsKt8tUti55ctrPDkNIyQE0uOh8s/yOdEGaWguoe4A4IYqWDj3bLP
	eJn7AeRdUCp1jFmuHjqdbe6zYF4LNlLnQyZCRdsB5TLqnrTpcfaMfcfmaBoWMI2b
	oy4wOueVeHBvkAq0N4TbrB0vVMSWW7YoNDs4sqvV4XT43HRmKE+BtWfxdnPVmEFj
	WFP+TXOLE3JQayfbt1kW7SfiDu0H8YKjLf32mhu4mN8lB9Temf4d/J9mDvZssAx1
	PvXAnt9KSjnXiO+c1mT+v4BUvQpCpb9V+KW0Y16xBLqg2uh5zs9E+gJOAN3WjhwU
	AoQNLrCBtCAaRD4dqV0VfzfaSWsvcRlCX5He4TOhiNjKSByJtxETuoixPw0VzSTS
	HX4G1v9aunBgVltXc/lLqhBDq3t1RYPtSZk/KIuuEveir+qeiwiGuUIteLGWhW/w
	xBz1QJuUbN2aFdMx8kNBmq5iWe8FgCulugk9BjdnCDDUxnPDdfmvJ1tyBDkvYjvd
	EF+qqC1PiLnPRjTp5Tr1FoNTw5rwoFgtn3bA4fQKvFR78TQ1RE0UT2atxSEJhSDS
	xARObhVWYRcb8zd/Dkw2mmNj+kSpisVAuuAYJ5RAJBk=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 2 Jul 2025 21:34:02 +0200
Subject: [PATCH] arm: DT: aristainetos2: Replace license text comment with
 SPDX identifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250702-abb-dts-lic-v1-1-b122fd6d456c@prolan.hu>
X-B4-Tracking: v=1; b=H4sIAKmJZWgC/x3MQQrCQAxA0auUrA1MR6XWq0gXSSbagI6SFBFK7
 +7o8i3+XyHUTQPO3Qqubwt71oZ+14HMVG+KVpohp3xMQ8pIzFiWwLsJFuH9kPpRTuMBWvFyvdr
 nf7tMzUyhyE5V5t/jQbGow7Z9AfohG9p2AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Heiko Schocher" <hs@denx.de>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?=
	<csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751484846;VERSION=7994;MC=1848634841;ID=360775;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29BB64155D6C7260

Replace verbatim license text with a `SPDX-License-Identifier`

The comment heades mis-attributes this license to be "X11", but the
license text does not include the last line "Except as contained in this
notice, the name of the X Consortium shall not be used in advertising or
otherwise to promote the sale, use or other dealings in this Software
without prior written authorization from the X Consortium.". Therefore,
this license is actually equivalent to the SPDX "MIT" license (confirmed
by text diffing).

Cc: Heiko Schocher <hs@denx.de>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 .../boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts    | 38 +---------------------
 .../boot/dts/nxp/imx/imx6dl-aristainetos2_7.dts    | 38 +---------------------
 .../boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi    | 38 +---------------------
 3 files changed, 3 insertions(+), 111 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts
index c9b2ea2b24b2..fc62ba2a4fcb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts
@@ -1,44 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * support for the imx6 based aristainetos2 board
  *
  * Copyright (C) 2015 Heiko Schocher <hs@denx.de>
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
 /dts-v1/;
 #include "imx6dl.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_7.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_7.dts
index 5e15212eaf3a..a7400d42475b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_7.dts
@@ -1,44 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * support for the imx6 based aristainetos2 board
  *
  * Copyright (C) 2015 Heiko Schocher <hs@denx.de>
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
 /dts-v1/;
 #include "imx6dl.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
index 7cc7ae195988..57970f29367d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
@@ -1,44 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * support for the imx6 based aristainetos2 board
  *
  * Copyright (C) 2015 Heiko Schocher <hs@denx.de>
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
 #include <dt-bindings/clock/imx6qdl-clock.h>

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-abb-dts-lic-dcb37019c894

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>


