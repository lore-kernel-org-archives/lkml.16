Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E56C225A47;
	Wed,  2 Jul 2025 20:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751488599; cv=none; b=FhSnGv7zSrxRJFAiDDy3WWuXjW/ZbJyRZgjusVHQ0355WeQC00vx+BsXPshAzBGQahjCir0r4dj+t44yIqJzDk+VUcNDn+1A0blVcr8ZAdffu02v6UOdnPGVp1fSPFthqYaDh6PGfAggydwClkZ/FkDYUgkMjRnDNcUbCOH04c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751488599; c=relaxed/simple;
	bh=UHbg1/UyJzNZ5VbvWRDHl96+t09qk51IhNMHxPIyE14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=O4B1mHikIHuxVhPvod/8bfZN3vHhMtcTpi6bEDOGk4uEYYDlIMjxEoPfnS28zgc8lKIUZ6IkJACyGPoIkqpDLJnGFfY0UrT7t5Phj6FSdFK08tK+43dwnjd1krrNfVt7efBc90KGuVyhXoj/X9yBeg3O4dwHethj9KOBrlDx9d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=hmXmvFwH; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="hmXmvFwH"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 4E0C4A01EB;
	Wed,  2 Jul 2025 22:36:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=JHDXm9BinfGvPYJ4rbFhjhl5QPKB2DM20YHX6OUX4OE=; b=
	hmXmvFwHCpTZMa72KPZpclc5q6OdG7H8H4JJsjzhjR06eyJ5c0bE+tzVtut5QFmb
	n9Ogd6TbMDZHfPQespNg+gL+huZR8NidQwFuH52C0mNQM8Ns4KGYLYKthp9AA0lS
	75Ikrvoxx8mqE0Z4fP694hhUvdJ3PnY99xzQ2fk4sXRKpcZ9GWo+G3vEYPnxMN2D
	NyLEDDSooLwyGqRhmC0FaVV2Rsj8EV7x3Admyap4QsD1jd6LOtF5HC1Kk57SLs6c
	3RbhTvcZLTwN8T9Af5jiC9LWRPoD7DhPoGKZjlbeftiJXxs3wEt4uz1wOvzDYMHr
	z8whP6cYoZzJSCzxN25mpyE4yj0CIY9Uu7sbwwuImeVYkU97ys4VbZM55pDZjunW
	PykzcPySUPyPzwYgXpZK7hzEJbowkcTZHf1rhvs51jVBLupo0/yvdMfcjgbDu5QG
	kqeIe0euikQow2y93jlIdlsIZvnXQBMCZoXyrgoYzIINabKqN8bBcNwas1E0b2OF
	JXz2zYx3DQORoHK2ZwUOxcWeJcbHJ0CYzoe/V+XOKwiDacpkIpDwLq0ejvmiHumW
	ditTdKqVX9rtKMcfMmOSnxzIvGSEPmom5QxaVqzaaNbfcoxwFU8t3ueVxJKQJwJQ
	AViBTallMsmcyYI1w9pTvAZ5eWhrff4RrmR4PvcbasQ=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 2 Jul 2025 22:36:28 +0200
Subject: [PATCH] arm: DT: imx6-litesom: Replace license text comment with
 SPDX identifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250702-litesom-dts-lic-v1-1-401e4d141bf0@prolan.hu>
X-B4-Tracking: v=1; b=H4sIAEuYZWgC/x3M0QrCMAyF4VcZuTZQ66Toq4gXaRNdwHXSFBHG3
 t3Mu/NdnH8Fk6ZicB1WaPJR06U6jocBykT1KajshhjiOaQQ8aVdbJmRu/kuSHxJaZTMcmLw17v
 JQ7//4u3uzmSCuVEt096Zybo02LYf7F9AlXoAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Marcin Niestroj <m.niestroj@grinn-global.com>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751488594;VERSION=7994;MC=2422277437;ID=361087;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
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

Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts | 38 +-------------------------
 arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi  | 38 +-------------------------
 2 files changed, 2 insertions(+), 74 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
index 5e62272acfba..7a4127670a6f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
@@ -1,44 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2016 Grinn
  *
  * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi
index 8d6893210842..c387753f833b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi
@@ -1,44 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2016 Grinn
  *
  * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
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
 
 #include "imx6ul.dtsi"

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-litesom-dts-lic-ad9774ebde3d

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>


