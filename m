Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E64153801;
	Mon,  3 Feb 2025 20:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614728; cv=none; b=LmlbRXWQ9KaavHOhNm5MMq62Jwsd9U5o2Zbsbw0QM222gOD/G+wsJ3cY/eMez5Cuw8ph710kGeV5hIcVpLdMF89YCpnKwK/5hdh+f7ydMYTcWlYtQH2gg+hxQZUFLkPFFJBWxRFnd70E2ugjrnkbZ1ET35Drta2G+5eGkbcJ8vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614728; c=relaxed/simple;
	bh=NG0T7KFAIKiHL+Zgrx0FfBVniTS7WNZL8+KqlJjo7Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hMbhjY0xNqa7MSrhbhTgXJ9PfHPSC/wUY4phoIPbB0eGuXH/mYsr1HLjC5WQCQigTAoqXkn4ubQpnB6BqOD/p2Gf4CgZPmbPMLLW4iuZgnhowkfKzlyqhBoxvKY35pkdjoSF9gX100kONpoPyfLJVHvEd2n1IIx+voSB5GkiDKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=WGDq/ASr; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="WGDq/ASr"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6297B25BB1;
	Mon,  3 Feb 2025 21:31:57 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptaMgSM_c83N; Mon,  3 Feb 2025 21:31:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614716; bh=NG0T7KFAIKiHL+Zgrx0FfBVniTS7WNZL8+KqlJjo7Po=;
	h=From:Date:Subject:To:Cc;
	b=WGDq/ASrQqHxw2gubMhHnkwd1gCj4KPpSdJZC4wobNs9mo34B39vK0J9plUuDy9Th
	 q0B1S03HCZN08IXx7lxo7lR4cFKggsIDkCSwSqZRdnGbMa7UhRIn8GkYLayqIgkh76
	 INjthtsrtdoFQiOZqNZXNGdFS5+JazWDTV8+9rRNXGDhXMtITp3qQePyep5wGjZ4E0
	 32lImbinTGd6EQlW/ng75jyM3e/dMQVVfUKr9pFadRa7Or9G1lIxeF1DGE+0A3n2qe
	 T3Zy9oQPUASQZcH47D8Blf3rABxa/y/uSlmaVws13futeI4sVsJm+hU/tbxT6SUTXe
	 1cPnNkCVD8F+A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:01:47 +0530
Subject: [PATCH] dt-bindings: soc: samsung,boot-mode: add boot mode
 definitions for exynos7870
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org>
X-B4-Tracking: v=1; b=H4sIALInoWcC/x3MTQ5AMBBA4avIrDUZ9RtXEQvMYBY60ooQcXeN5
 bd474HAXjhAmzzg+ZQg6iKyNIFpHdzCRigaLNoSLeaGr9tpqJsazah6bEpsRmTKq4qKsiCI5e5
 5luu/dv37fv+BJVRlAAAA
X-Change-ID: 20250203-exynos7870-bootmode-b0ed366d454d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614711; l=1291;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=NG0T7KFAIKiHL+Zgrx0FfBVniTS7WNZL8+KqlJjo7Po=;
 b=pTF7S77HJby7HUJ4iEk6iHKCeJ7E+ye74eWzg3gPd89p+XXinFSHi2wQRgvIm5d3pmHMCrD2Z
 msnWGxLDJ65BO8rYc/4RS67vVBqQNfF4ly/5/bv3ZoaD/9JmOvZZ6ZQ
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add bootmode values for bootloader, download, and recovery for
Exynos7870. These values are used by the syscon-reboot-mode driver to
facilitate rebooting in different modes.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
This patch series is a part of Exynos7870 upstreaming.
---
 include/dt-bindings/soc/samsung,boot-mode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/soc/samsung,boot-mode.h b/include/dt-bindings/soc/samsung,boot-mode.h
index 47ef1cdd3916eb33dd729396dfe443ba6a49f22f..effb3d6fa501e28a0a1fe847e5a0fe6906ef4f29 100644
--- a/include/dt-bindings/soc/samsung,boot-mode.h
+++ b/include/dt-bindings/soc/samsung,boot-mode.h
@@ -9,6 +9,12 @@
 #ifndef __DT_BINDINGS_SAMSUNG_BOOT_MODE_H
 #define __DT_BINDINGS_SAMSUNG_BOOT_MODE_H
 
+/* Boot mode definitions for Exynos 7870 SoC */
+
+#define EXYNOS7870_BOOT_DOWNLOAD	0x12345671
+#define EXYNOS7870_BOOT_RECOVERY	0x12345674
+#define EXYNOS7870_BOOT_BOOTLOADER	0x1234567d
+
 /* Boot mode definitions for Exynos Auto v9 SoC */
 
 #define EXYNOSAUTOV9_BOOT_FASTBOOT	0xfa

---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-bootmode-b0ed366d454d

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

