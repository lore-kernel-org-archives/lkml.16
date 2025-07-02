Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDDD2DE6FF;
	Wed,  2 Jul 2025 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487744; cv=none; b=o9BS9r4Ts9nfOHd6vIX3S+AUw6xPQM4YuLV5l4nAe0AqaLxDnxdCgAwFWgttqCQhZ+ZC8c8DqzyFPYDLZgdXN7mHeP+jugT2T3S+ycybYAE22VHX1Cy6qF4AR3yjsb6zRe0fbPPnjME6ecmH0PsM35uo0tDw/GgrR87md6djDS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487744; c=relaxed/simple;
	bh=ojlYCkWV1CNcr8mi2B4DTDjA9Rgu716dLVHUhTYmCEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=dFR5zLI0lYGMYmxTZXCk1fbZFFV6UE43xWIuyX+v+V+jh6I4bAvo7npo7U3FumoAJ7Na/FP1fLTzEHBoQaQZsmO4hy/NARS5ItRRB1ZVVFecgovtYzf/64w8GFspS3HEcy6ZsUN71pqWXiJdrI1tS1/XHU51ob2ft9jfSBFjmF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=btR66t74; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="btR66t74"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id AC0FFA01EB;
	Wed,  2 Jul 2025 22:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=aEV89sKly0N0mihYE8QkgjofZjv8WtbxsC4LRL3/fa8=; b=
	btR66t74+f+6eLN++dYHOQ3Musxy3oRdTwtRo9upBmod/EdoysQuSfeXhJrNRelK
	Z8Y61tLDYl1Z4gBtRpb3sxJ70S1DXGaW238iBWqtzHwQK0h7MmOqzvlihEusa229
	sKfqQ4OTIPcwEW7yuNh1Sqh6DOgaP86Ys1TyC164YqKZ8SAM2QN9yidbmSgBemm/
	enyDv9H/BsEB8bkPXWAR0ZmhDBrqjHd+eZypeUxWrYLARkl+ImvOWXxG5Gk4WOMI
	oMLZno+UTzen2TSB1Q6uRG7zvAUf7TOwQeij8nolMUwWucftGgRTNk5mPOLV4mVW
	19GO+OZRJSuCqPdhKwrbfsDwTNYpUfdNlZew/KZZjsryxlGfURb41JdS1onfYKl2
	7pyEAvXddYS+5mgGYnigiAdhri+rDuONHIPVVFE183M0OruTxrCoRLPFDrV33srC
	J1J1YNwlRkl+lC4KE6bAJoSrMq65ugp3FKzxB+SulyhFcFKiajbGt67DBCe5/z6w
	gRI6Y0B9+fr81Qk86lHDqcNUK0dn5G/Y60lNd1N3b1/oLpK0p831iHSIZ/KAeHWe
	rYlw7QMWeZq4Z91B93ZKTsmLD3pxpC1JBIl89m43fNrIiyEXiJTuO+MrCp4HwVnA
	RJjYX3L26opvqhaXud9Opjp4SbAFeLsbMY1JrNqRqbk=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 2 Jul 2025 22:22:13 +0200
Subject: [PATCH] arm: DT: imx6-tsx9x0: Replace license text comment with
 SPDX identifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250702-tsx9x0-dts-lic-v1-1-0b5c5be9257d@prolan.hu>
X-B4-Tracking: v=1; b=H4sIAPSUZWgC/x3MQQrCQAxA0auUrA2MI1L1KuIiTVIb0FGSQQZK7
 +7o8i3+XyHUTQMuwwquHwt7lY79bgBeqNwVTbohp3xMY8pYo51bQqmBD2NkUTkJUz7MI/To7Tp
 b+w+vt+6JQnFyKrz8Nk+Kqg7b9gU/RllVeQAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Lucile Quirion <lucile.quirion@savoirfairelinux.com>, Sebastien Bourdelin
	<sebastien.bourdelin@savoirfairelinux.com>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751487737;VERSION=7994;MC=423568003;ID=360865;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29BB64155D6C7260

Replace verbatim license text with a `SPDX-License-Identifier`.

The comment heades mis-attributes this license to be "X11", but the
license text does not include the last line "Except as contained in this
notice, the name of the X Consortium shall not be used in advertising or
otherwise to promote the sale, use or other dealings in this Software
without prior written authorization from the X Consortium.". Therefore,
this license is actually equivalent to the SPDX "MIT" license (confirmed
by text diffing).

Cc: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dts   | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-ts7970.dts   | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dts    | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-ts7970.dts    | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi | 38 +--------------------------
 6 files changed, 6 insertions(+), 222 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dts
index 3d60cc725d9e..d7d6222d95c6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dts
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Technologic Systems
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-ts7970.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-ts7970.dts
index 5da6feba2e66..3a4dce840683 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-ts7970.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-ts7970.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Technologic Systems
  * Copyright 2017 Savoir-faire Linux
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dts b/arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dts
index dce1e8671ebe..6ecf11db1a9a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dts
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Technologic Systems
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-ts7970.dts b/arch/arm/boot/dts/nxp/imx/imx6q-ts7970.dts
index 570bd3c309a6..9e919de968b3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-ts7970.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-ts7970.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Technologic Systems
  * Copyright 2017 Savoir-faire Linux
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi
index f88da757edda..ed602cda9ab4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Technologic Systems
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi
index 11c70431feec..a48c35f80139 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Technologic Systems
  * Copyright 2017 Savoir-Faire Linux
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
change-id: 20250702-tsx9x0-dts-lic-cded8dca23f7

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>


