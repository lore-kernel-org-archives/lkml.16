Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4DD28C86B;
	Thu, 22 May 2025 19:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747942177; cv=none; b=cpINojRhslIN6tepvcbH8i5Xea0Ji92GHHqL+KfopLV4wZ1u7z7sndg273NcsyQ5opSS+WivLurnuK7xxSgkIIpC4TZlv5ZHckc8AyUiMPJK2Ui8JpAS9kHrzQMQGpIcZbN9SvaLTt+zzRMmYYU9jCMapG0V8PPtxWK4oprc838=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747942177; c=relaxed/simple;
	bh=vXrw/s/Yj4TiwBledl5yF/zCqr97ZjzX5fIsmD9u464=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLenyRKSm6gHW4aej+9FNpOLCVi528UpqgNmN8ihuRixqpeZC2TwZbqVYOX1YUzZ2Asu0V/tmfW217aTOINkge8dSsM9CeAs3Tj37DM33f7lWGNIVykyn3Cp04T+t1A5/qY0lFd5gXfpMgxLstzsio6oggHzvm21AO9mpuQIUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 22 May
 2025 21:24:25 +0200
Received: from lnxdevrm02.prodrive.nl (10.1.1.121) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Thu, 22 May 2025 21:24:25 +0200
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 2/3] dt-bindings: add bindings for NXP PCA9450 PMIC
Date: Thu, 22 May 2025 21:23:23 +0200
Message-ID: <20250522192325.1099680-2-martijn.de.gouw@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
References: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add bindings for the NXP PCA9450 PMIC

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
---
 .../regulator/nxp,pca9450-regulator.h          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/regulator/nxp,pca9450-regulator.h

diff --git a/include/dt-bindings/regulator/nxp,pca9450-regulator.h b/include/dt-bindings/regulator/nxp,pca9450-regulator.h
new file mode 100644
index 0000000000000..08434caef429f
--- /dev/null
+++ b/include/dt-bindings/regulator/nxp,pca9450-regulator.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Device Tree binding constants for the NXP PCA9450A/B/C PMIC regulators
+ */
+
+#ifndef _DT_BINDINGS_REGULATORS_NXP_PCA9450_H
+#define _DT_BINDINGS_REGULATORS_NXP_PCA9450_H
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define PCA9450_BUCK_MODE_AUTO		0
+#define PCA9450_BUCK_MODE_FORCE_PWM	1
+
+#endif
-- 
2.39.2

