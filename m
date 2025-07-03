Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ECB293B72;
	Thu,  3 Jul 2025 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524214; cv=none; b=QbwcNjlCAs3ne4FURh48ZB0rtvSI3R00/mLOUxic05pDPIGN+ISKudHvYn8SyoTSrmM6li7d4SwjzuyhsdiJax460P+WRI6fguf6zJs8WQPkRKwXLw3llLP/XRkwcj7ZQUddK3WmGHMmNXfEYA0B+bgi09QtHahOU7IPmEv9Oa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524214; c=relaxed/simple;
	bh=eSXkixHs/0cyzFWPQ0oEqTRjQdv550guFtTqjdoVWBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Q/g72YLEKzE62SUe0Jef8fcPQ37eIlMYD4KRobCq+lENQjtQealdDFb/egUfEq/V/a08MXqrH89ji6Mqc/M4CunveZT5zakSgKSBoZF9unrhsuERS3WgyHH2Me1D5UXT6052VzIEHrKiNvrjVpcdInpRNnyutjzQmdfOW1d8dCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=rojlmlop; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="rojlmlop"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 01429A01EB;
	Thu,  3 Jul 2025 08:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=HV2KoaCWlJPbq6mOG4DYoW84XpdHe7KC1QwY8y5uXjs=; b=
	rojlmlop1aAPybiJ+PsbhaQIeiIfZ4H5wvMyhkf6QEnaxRKaCtNriUsbRHlal7F8
	B+hlvIlphrXNKCeBvs3cbWcspra2hF83D1CLNmKoEvp3i7fwGFaupE2rKWFl6aQU
	biBbNR9WEEu1kFYFl1nhV1cCcqrjlBx6uY0ri0/6Hx4jGl0gl+EqoUTadBrM4HOK
	vsrDPHaij1FcfOGDImaquum/ePawbuA/dPEmSU8EuwNPdJhGbJkMQUJJEFd9zwsk
	2DljS5fVgPCeVsnzPRgkYM6fHavuhaaw58Iwtb4QSnSwrSkdSV1xbWbeSG0mbhBX
	E1oLHimbJ6iog8c9nrsZgcd7hw+ErUT9hm9kPdCgEJQkD4p5B0PR7G+hOjCZks1N
	Pmrq5o8nCLU7HIssn5YFB2gVrjWKylBiMcwMxar4zbVOSYxO1mC8PjjSgDeXYLnb
	q+7HugJv4gknbcyI+k8mHcTj3v2mGOnLCYqOWNaSbe6Q0Hq8I046gJUfxs45hDp7
	mw7ONLgCJ0CET6QGZYLCdDLwIDa2riKzudvM1u5W0Fm68rX0gLjqIyI8e4koyRhL
	Hpm/X71OL2Y6LpTQHcS0tV4CPSFacAxitmzWhFLVSeCNaCm9VvmKGZcybUbUw+jE
	Go9YDVqHP3ZdHyhyU3NC7Rt42/fFWn/vbTwdSdz7aoU=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Thu, 3 Jul 2025 08:30:07 +0200
Subject: [PATCH v2] ARM: dts: imx6-sr-som: Replace license text comment
 with SPDX identifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250703-sr-som-dts-lic-v2-1-0395c9b776d9@prolan.hu>
X-B4-Tracking: v=1; b=H4sIAG4jZmgC/3WNyw6CMBBFf4V07Zi2yiOu+A/Doi2DbQItmUGiI
 fy7hb3Lk5x77iYYKSCLR7EJwjVwSDGDvhTCeRNfCKHPLLTUpaylBibgNEG/MIzBgVXV4OpKls5
 qkUcz4RA+Z/DZZbaGESyZ6PyRmQwvSIfoAy+Jvufxqg7978eqQIHGpmzuWLnmVrczpdHEq3+Lb
 t/3Hxw8LY/FAAAA
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751524207;VERSION=7994;MC=1480077994;ID=225091;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C726A

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
Changes in v2:
- fix message tags
- also patch solidsense files
- Link to v1: https://lore.kernel.org/r/20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu
---
 arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts     | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi  | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi      | 38 +---------------------
 6 files changed, 6 insertions(+), 222 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts b/arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts
index 0e6a325df363..d929f131ff41 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on dt work by Russell King
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
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi
index 60e446ba8f52..d29a60225afc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2021 Russell King <rmk@armlinux.org.uk>
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
 #include <dt-bindings/leds/common.h>
 
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


