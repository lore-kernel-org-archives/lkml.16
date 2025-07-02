Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA41A5BA4;
	Wed,  2 Jul 2025 07:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751441199; cv=none; b=RlFWgHc7hZYTGvaIxmQ+Ebft45GcBabS412uFYeTtCwwbTaPi0AdcRaPoBExwYflg/JMqlzqcq56MnmSpMW1N5bFHYKzU1IdhqkcNVssHYOFCGilMIy9QKEekv9MOKd15+5RIBTbfVxqZw9bEK9BJDEAlDIe5z5l6+rVMyHO3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751441199; c=relaxed/simple;
	bh=xPH4Dg980CBqcKchGjGg6ihIfDaeksXeD86PHEi8g2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Q9nwpR5HujzjgMuzUuM1Ne3amUypj6R19LgRQ4eM5vh9YXdI92v+1LUSrqGk5PT3vcbT7h6z7T68u97e30PvQ3fZjAdAxckcjAWAFaAg7gBbqo9vjGDyfClENcWf9b11fMH5p6/a84swv5knTISEYZKPsR9ZcuQJgqsdH7/0cGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=E7p5OuCL; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="E7p5OuCL"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C2842A01EB;
	Wed,  2 Jul 2025 09:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=L9mawu75BttQ0R8C0ZKgWcwI6qvXco1im84vXfksbO0=; b=
	E7p5OuCL+Tm2kGTpFi22oIrg11BIW/490a0M3wYYzBlE7oqkHBDTqlJDNZBLeMxt
	EsKeby/UcPKxqV+ZIC4MPMVr+FeEUEd/Nu/0ikiVUntYE9Kcx+Gp+lXr/u/jl21w
	RPJIr2nWPDPejTs9b7D/2sX3vllk8IsdIoCXTq4DXRjNho838srhtBztkcvDSzmL
	pj737mIY/GejPhP8EhmkDpjHOJPycuap7jOgxTM4MO804duewTXOUviIIrY60kqE
	GLU5j8AXOf7JdkJ6I6F4h3aTJSaUD96eZhMaHFDMyOQ9MCofj8aC5cFOb9yEAl2q
	ktCFdCnj9C0XNZgedd0nuFRHCwQqanuf0yN1gpjxj6FH8gJLWGFXR7DXtOYC+L+S
	GqpagFIb5XRkxtKeNzniOmaJMKZM5AW6XY7tt9TPXKNN3r2hTwr7e+YO/A8Bok/q
	wzTeAnXzXf8auzF37U1tKfSmSxegyryu0HO5NGgJGLTyUGFTzh8gNDgLovT3r1+O
	Orgdf943/FA9fPzeXy7y7XQfKYN2JFk6WVgcXMYOY6mZuUCi/NTJFCT10ePun9TM
	h7EGwuYl8vLQinH3VnXeP/L7emLxToanIhCESNk4CjHQLslbFNAx3gYtpp/Gb3nO
	yz4L4lfGM95yh8KyCrkyZeICnhYxPIFq8GvRGkFMMko=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 2 Jul 2025 09:26:30 +0200
Subject: [PATCH] arm: DT: imx6: hummingboard: Replace license text comment
 with SPDX identifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250702-hb-dts-lic-v1-1-bf15c0a74577@prolan.hu>
X-B4-Tracking: v=1; b=H4sIACXfZGgC/x3MTQrCQAxA4auUrA3MD7bgVYqLTBqdgI4lKSKU3
 t3R5bd4bwcXU3G4DDuYvNX11TriaQCu1O6CunRDCukcppCwFlw2x4cyMtEYOMecY4IerCY3/fx
 n87W7kAsWo8b1t3iSb2JwHF+EY3AWdQAAAA==
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Rabeeh Khoury <rabeeh@solid-run.com>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?=
	<csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751441191;VERSION=7994;MC=2363341622;ID=348886;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29BB64155D6C7364

Replace verbatim license text with a `SPDX-License-Identifier`

The comment heades mis-attributes this license to be "X11", but the
license text does not include the last line "Except as contained in this
notice, the name of the X Consortium shall not be used in advertising or
otherwise to promote the sale, use or other dealings in this Software
without prior written authorization from the X Consortium.". Therefore,
this license is actually equivalent to the SPDX "MIT" license (confirmed
by text diffing).

On top, half of the files have the fragment "either version 2 of the
License" for some reason, and not follow up with "or any later version".
So the resulting SPDX license is still "GPL-2.0-only".

Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 .../nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts  | 39 +---------------------
 .../dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts   | 39 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts    | 38 +--------------------
 .../nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts   | 39 +---------------------
 .../dts/nxp/imx/imx6q-hummingboard2-som-v15.dts    | 39 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts  | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts     | 38 +--------------------
 .../dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi    | 39 +---------------------
 .../boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi    | 38 +--------------------
 10 files changed, 10 insertions(+), 375 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
index 80313c13bcdb..71cf5ce84a99 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
@@ -1,45 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on work by Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
index e61ef1156f8b..fed260a9fdc4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
@@ -1,45 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on work by Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
index b12cd87f3f94..4e176db56840 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
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
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts
index 2a3699adbed0..fdced9daec4d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts
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
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
index 1998ebfa0fe0..af458873b893 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
@@ -1,45 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on work by Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
index d3ad7329cd6d..509724df7f82 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
@@ -1,45 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on work by Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
index 5249f53dcdbc..704ba5b91efa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
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
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi
index c3efb001c515..87b41d770e80 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi
@@ -1,44 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
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
- *     restriction, including without limitation the rights to use
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
index 3069e1738ba2..1e41e6fdd5b4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
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
 #include <dt-bindings/sound/fsl-imx-audmux.h>
 

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-hb-dts-lic-caa60c313312

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>


