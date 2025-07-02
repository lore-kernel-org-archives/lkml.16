Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4862D77F3;
	Wed,  2 Jul 2025 20:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751489783; cv=none; b=MLHUmPhPeY+kM1kKIR/NxMQ8h9Vsw1aITROA9i+fmTEqinXQqflhzkpLLVSx/DZbVDQ/OWfZ2TWmcVgV+Eb0bwD1LTH6o1zOAov8E/iOkB/3e+C/Jn0l7DBFBYpgviYYLra7TFWlDcV5gKsgIYASSxkDBmpBsDJTKYGWJJVV2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751489783; c=relaxed/simple;
	bh=JOV0VuhVDC6mZNe70ZzDphEukvf4rO0jaSyCJMEPmAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=T4lAJirK2I4arjUpyAalMLXkET1xBa9aPbTfnLp14ck7yjYwbGFQd4B89bmSze2HSYuhvN7xrlQshqrxbQNWKxjFyzU02dmVsaU/AGxL2Xa1DvTtXhhmoE3cYl9hO1MwLjffuGGlyZsmK/+fU4Jz6E74+CBFGSwDQyPUs8wZhMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=mRLwgsVW; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="mRLwgsVW"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id B0A0BA01EB;
	Wed,  2 Jul 2025 22:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=h56TH9MwsANX4p1H+NWXa4BQ5Q7QI1tiBtnBxDo3Qg4=; b=
	mRLwgsVWte3DsAcpC6g/iR2Mg6Aj2o0LYOnOmW4PyGK8Fsoh1q26LdqkFfHBdhIi
	2GU+3znuyN+Buo9qye4tK2mfBayGpMQIb+42bsNwe5Hr1QypWdv7k2eujhEPUo+1
	59e50Kcw9h9U9TReFcHRnJyrGUvIctcdvfaQ8Tb1cvR1waZ78F4nEhZLlQVjPRyj
	Jj9uyH9PJR1aIUjTUY6JqUKqRdcE6DFo5bGEfwUqE8l59CqK3zyRuZA0X8E1XmTA
	2Wf313LK5amDYzO1/UezUUDYcEE22/Oc+KmkzyqOLlz7E+7p1QNTs93pjkqsSi2J
	2KJu+30PdA2t13LArZCms3wJgeKugpb0OI1sXr//w9PlQh19crjLgm8xoemzQuY/
	xeTlAAvcldfIgwLVnXYomYnqWk9NEczSUIx43RmpQzAjrZa+NfdebNzc329bOnqk
	I96vsKj5QWIn1ghxmDX3l3E3oIPdA9R/CceWERg8j9ZuHURA3Ap08NkyAWB5Wdpf
	zB5T8pviI1IBei8vjMP1btN26Lu/V4ZGLRx1/zy7VNRav4DkaxfFANw/vG9ivQ9O
	e2PUmypPJ58PytPmAknxpCl5cebifCnhi0MZcdHfkML9vDpQtLectjyDf8ipgUjF
	CbXUM9S+v5nMXRCMcnfCKCoZ5dFKLO/fuixkmsbq2J0=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 2 Jul 2025 22:55:45 +0200
Subject: [PATCH] arm: DT: imx6-bx50v3: Replace license text comment with
 SPDX identifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250702-bx50v3-dts-lic-v1-1-2fe63de3606d@prolan.hu>
X-B4-Tracking: v=1; b=H4sIANCcZWgC/x3MwQrCMAyA4VcZORvIWurAVxEPTZe5gFZJxhiMv
 bt1x+/w/zu4mIrDrdvBZFXXT23oLx2UOdenoI7NECgkGiggb4nWiOPi+NKC14ED9TGScIIWfU0
 m3c7h/dHM2QXZci3zf/POvojBcfwAsh/twHkAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Akshay Bhat <akshay.bhat@timesys.com>, Ian Ray <ian.ray@ge.com>, Jaret Cantu
	<jaret.cantu@timesys.com>, Justin Waters <justin.waters@timesys.com>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751489777;VERSION=7994;MC=762491779;ID=216168;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C7260

Replace verbatim license text with a `SPDX-License-Identifier`.

The comment heades mis-attributes this license to be "X11", but the
license text does not include the last line "Except as contained in this
notice, the name of the X Consortium shall not be used in advertising or
otherwise to promote the sale, use or other dealings in this Software
without prior written authorization from the X Consortium.". Therefore,
this license is actually equivalent to the SPDX "MIT" license (confirmed
by text diffing).

Cc: Akshay Bhat <akshay.bhat@timesys.com>
Cc: Ian Ray <ian.ray@ge.com>
Cc: Jaret Cantu <jaret.cantu@timesys.com>
Cc: Justin Waters <justin.waters@timesys.com>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts  | 38 +----------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts  | 38 +----------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts  | 38 +----------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi | 38 +----------------------------
 4 files changed, 4 insertions(+), 148 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
index d994b32ad825..3dee78302074 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Timesys Corporation.
  * Copyright 2015 General Electric Company
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
index b0d345f5d071..bae85646d2c0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Timesys Corporation.
  * Copyright 2015 General Electric Company
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index cad112e05475..0ececa644681 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Timesys Corporation.
  * Copyright 2015 General Electric Company
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index aa1adcc74019..6920570477dd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2015 Timesys Corporation.
  * Copyright 2015 General Electric Company
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
 
 #include "imx6q-ba16.dtsi"

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-bx50v3-dts-lic-67b201330eb5

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>


