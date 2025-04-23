Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20279268C66
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392530; cv=none; b=NSn+FNG10x350ysubQJsxMPFNqcnCgO74ORvn2mW4JJ0C9k1lTDhXXtSasNO/zE+8Ex4XwF+hQcst83kP+ob23aKBqG4cQ/pSbRoPsIVGm6/U27ZREddncYUV5hZV8UQG1XogBDbvjBoZyEMri6f7zDiBO+0OnBNTPS18LHeNCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392530; c=relaxed/simple;
	bh=4xkPXOEiCWxWBhxVi73v8vLlxNzuHtWpdec3we/OgAc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyPEu12i2uUAJxLBPIdYMIT58iesqRMwJR/NvB/RMl1uLgi1qHjNc7zuRn5NVAJr/KfDd4QAsF+uz6BmiF7Hhz2pAElveBOq2rBI3S6nLfNJ+RXWr+mu0orFvlcVZ1Kii9A8/bIyWRtIesaMjEsdJ+SjJlr7NZM2znqvbHu/vQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1745391829-086e234cd195e40001-xx1T2L
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id YabMpNHYLRfa8bYB (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Wed, 23 Apr 2025 15:03:49 +0800 (CST)
X-Barracuda-Envelope-From: SilviaZhao-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXSHMBX3.zhaoxin.com (10.28.252.165) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Wed, 23 Apr
 2025 15:03:48 +0800
Received: from ZXSHMBX3.zhaoxin.com ([fe80::8cc5:5bc6:24ec:65f2]) by
 ZXSHMBX3.zhaoxin.com ([fe80::8cc5:5bc6:24ec:65f2%6]) with mapi id
 15.01.2507.044; Wed, 23 Apr 2025 15:03:48 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from silvia-OptiPlex-3010.Zhaoxin.com (10.29.8.50) by
 ZXBJMBX02.zhaoxin.com (10.29.252.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 14:35:10 +0800
From: SilviaZhao-oc <silviazhao-oc@zhaoxin.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <namhyung@kernel.org>, <irogers@google.com>,
	<adrian.hunter@intel.com>, <tglx@linutronix.de>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kan.liang@linux.intel.com>
CC: <ewanhai@zhaoxin.com>, <cobechen@zhaoxin.com>, <louisqi@zhaoxin.com>,
	<silviazhao@zhaoxin.com>, <cooperyan@zhaoxin.com>, SilviaZhao
	<silviazhao-oc@zhaoxin.com>
Subject: [PATCH RESEND 1/3] x86/cpu/zhaoxin: Introduce macros for Zhaoxin family numbers
Date: Wed, 23 Apr 2025 14:35:07 +0800
X-ASG-Orig-Subj: [PATCH RESEND 1/3] x86/cpu/zhaoxin: Introduce macros for Zhaoxin family numbers
Message-ID: <20250423063509.20996-2-silviazhao-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423063509.20996-1-silviazhao-oc@zhaoxin.com>
References: <20250423063509.20996-1-silviazhao-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX02.zhaoxin.com (10.29.252.6)
X-Moderation-Data: 4/23/2025 3:03:47 PM
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1745391829
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1216
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.140368
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

From: SilviaZhao <silviazhao-oc@zhaoxin.com>

Create zhaoxin-family.h to define Zhaoxin family numbers in one header
file. So we can use the macros instead of open-coded model numbers in
other files.

Signed-off-by: SilviaZhao <silviazhao-oc@zhaoxin.com>
---
 arch/x86/include/asm/zhaoxin-family.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/x86/include/asm/zhaoxin-family.h b/arch/x86/include/asm/z=
haoxin-family.h
new file mode 100644
index 000000000000..d54e0112207a
--- /dev/null
+++ b/arch/x86/include/asm/zhaoxin-family.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_ZHAOXIN_FAMILY_H
+#define _ASM_X86_ZHAOXIN_FAMILY_H
+
+/*
+ * The defined symbol names have the following form:
+ *             ZHAOXIN_FAM7{OPTFAMILY}_{MICROARCH}
+ * where:
+ * OPTFAMILY   Describes the family of CPUs that this belongs to. Default
+ *             is assumed to be omitted.
+ * MICROARCH   Is the code name for the micro-architecture for this core.
+ */
+
+
+#define ZHAOXIN_FAM7_WUDAOKOU		0x1B
+#define ZHAOXIN_FAM7_LUJIAZUI		0x3B
+#define ZHAOXIN_FAM7_YONGFENG		0x5B
+
+#endif /* _ASM_X86_ZHAOXIN_FAMILY_H */
--=20
2.34.1

