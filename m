Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BF291C25;
	Thu,  3 Jul 2025 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751523993; cv=none; b=rSpzg/1u+q67NcJr9g0kEfdO2N9QkVylXU5ncDTMYcYvh83so+keflSHvPjALS6lpT7D0+IZNb3xDvgedYjrLy/ygJCQjxqqLtmmt9+5oyO/29oCXBBecRVqO8bjdDRFOGaRcRviG/Rq6o0HK4bTP+JHjuqKgQl8udWkTG8a1ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751523993; c=relaxed/simple;
	bh=yolghlH84zNp3z3AnrA7Fl6gSmsC6ahPKxW1suPliIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=X6+uBcW9VPggl8RafHWKldyjFdE9mSZccJ/Ur8hy9jTeDziRRHUYa09/n3P7CpqaUuj+JHAjuhSmDiQ+aQdP9AOB/67HntnDKpRicgoMI+HxLH0438xx/COnsaSx1tWyAN6rWYI8zwwJAYbzMy9oy4bpEeN2TmBjwM/LKr6/Hcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=jebrNMu/; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="jebrNMu/"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0DF21A01EB;
	Thu,  3 Jul 2025 08:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=V653CIHpf+sCA9FsZy5lY5aKTZr7iBRrsViFH9Fa8Ck=; b=
	jebrNMu/DAB3eGxddhmjP6Ftt43ouIkz5H1RlbibUy392ojs1UxQppNX/gxb0V4u
	J+l+0UWZKhnNzPRQKkFplKEmCit2AgAVMLNbaIZ7fFaiUy+EGioKRr0LVb3lyLwD
	3i3PZc/pCnaVdLu+yyb0f00CBmXegNFzefN86kYYJDp+M8tfIGLioU2z6xnuMuwf
	NIWEAN8mjHvPwYQrJp2r9mq1Gmfl0rtWNntJINLpLEfSjI4Er35q+/xOiOaClDUF
	muhIKTlS31LEoug2arqSXxVGR0rTB2Hlop6NpJderdjlhoBl+CpqYitvVFgoq09Y
	BDTBFgmC7vuVM7ZBpOaxLaY1/goVIl+ptBKFGVmRCjWA3Jm8jtbK6VspQMYBw/TA
	MjSoH3SZFbhDK9gyVHC4UuOTVc90IfrNnB8XX2FpC8GRjFo0gT2ne8NxIb5IJeIg
	QObbvljb/ayVDnzTKOa8m4OV8IO04QJQk86vUCvY8RYV8Q51ER4F+66rOI8NuRQH
	ctGtAldZZ1fPVMUVvn6bvDMUzREB64QK+l9Zrib8uxTUWd8j8mwQ/tYnCERnnqGA
	kv7nohsIGAcseq38uK0bpjZpwplq02xPN/wWPKoAgnVBBW8KLmbX8RuWDIMXPxB0
	9iS/70lDSxRLwk4w2bvNNd5J3gYrFsKVg0wo31MB6eA=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Thu, 3 Jul 2025 08:26:16 +0200
Subject: [PATCH] ARM: dts: imx6-compulab: Replace license text comment with
 SPDX identifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250703-clab-dts-lic-v1-1-768cfb78ceda@prolan.hu>
X-B4-Tracking: v=1; b=H4sIAIciZmgC/x3MQQqDQAxA0atI1g2Mikp7FekiEzMasFNJpBTEu
 3fq8i3+P8DFVBwe1QEmH3V954L6VgEvlGdBnYqhCU0XhtAirxRx2h1XZby3Q6pT6lkoQkk2k6T
 fazc+iyO5YDTKvPwnL/JdDM7zBxinAVp3AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Igor
 Grinberg" <grinberg@compulab.co.il>, Ilya Ledvich <ilya@compulab.co.il>,
	Valentin Raevsky <valentin@compulab.co.il>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751523987;VERSION=7994;MC=2198676828;ID=225030;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C726A

Replace verbatim license text with a `SPDX-License-Identifier`.

For imx6q-cm-fx6.dts:

The comment header mis-attributes this license to be "X11", but the
license text does not include the last line "Except as contained in this
notice, the name of the X Consortium shall not be used in advertising or
otherwise to promote the sale, use or other dealings in this Software
without prior written authorization from the X Consortium.". Therefore,
this license is actually equivalent to the SPDX "MIT" license (confirmed
by text diffing).

For the rest:

The header is cut short, there's no mention of either the GPL version,
nor what is meant by the "X11" license. That would mean a SPDX of:

  (GPL-1.0-or-later OR X11)

However, since the header seems to be a truncated version of cm-fx6's,
I'll *assume* that they meant to use the same license, but CompuLab will
have to confirm or deny this.

Cc: Igor Grinberg <grinberg@compulab.co.il>
Cc: Ilya Ledvich <ilya@compulab.co.il>
Cc: Valentin Raevsky <valentin@compulab.co.il>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts      | 38 +------------------------
 arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts |  6 +---
 arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts    |  5 ----
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
index 299106fbe51c..e1161a750d60 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
@@ -1,44 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2013 CompuLab Ltd.
  *
  * Author: Valentin Raevsky <valentin@compulab.co.il>
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts
index 713483c39c9d..a0e73e71ec5d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts
@@ -1,13 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Support for CompuLab CL-SOM-iMX7 System-on-Module
  *
  * Copyright (C) 2015 CompuLab Ltd. - http://www.compulab.co.il/
  * Author: Ilya Ledvich <ilya@compulab.co.il>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts
index f8a868552707..4f989c3b0ef7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts
@@ -3,11 +3,6 @@
  *
  * Copyright (C) 2015 CompuLab Ltd. - http://www.compulab.co.il/
  * Author: Ilya Ledvich <ilya@compulab.co.il>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
  */
 
 #include "imx7d-cl-som-imx7.dts"

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250703-clab-dts-lic-937f1ff6ceab

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>


