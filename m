Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2122.outbound.protection.outlook.com [40.107.249.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8EE1991CD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209541; cv=fail; b=ruP1JBWui+pJVIyDl89ATFTVy1OBsAljniyw9bQwiXNUQ0Rqa+2Irr4+zDKsAkZjN66fWhQs8oGmhcbEqnhWZ7Nhe8bxOpmojeNuPAncbGmZiN/IS72DxNQH9e0lKCXuKjpwDR9rhoexobi52MYYBoDARJbJT6aR1xcQbCe8Mxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209541; c=relaxed/simple;
	bh=Rtrqv4vfN5v3ooiowpkSH7wpX233gRfrZAs2h3vUtzg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=daqfUKpQ1L4AEmEGOsjeqQBAg9gv/HfNpRYTrBz1XWdRtvMICHnFXDpzZ6hN2peOdQbLL4PYoyzLGtHeUMT7IpHo3qmGo1fcbQubKsZqp8JezADgL1l4kxlhObx/zNOElO7QKFrVaHJ7m1FLC1jb3EO6hL12CqVvqORpj1SPlUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=ckX0HBDr; arc=fail smtp.client-ip=40.107.249.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="ckX0HBDr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ak0VzoeNXVmx+7P0XJVTLQKC0TAZZ+5OzTbWcz1MiCzJbMGRDs3A6bzDXPTqQybzkUT/Nhv/ErcQvj4fD1hY46CmAWhncLl41QMYwBwj8F715VcAO/QVKgNewgf9eKIK2ygktV0O36gbih5FONASdWnSm6abSQOeomV0WYSfWt12lMgo3uinA0nzHl6QMN+j7FrSvpjJGXHFfigRVFpdWnrmDcSM0s+/0NAeBrqghscQbfY165IeLLUsmwWBnEYNbudlyGU79j4eakQmdVXaDPyLtY1u/mPhypHACuFVwh2X18A8UpuM5bmOme0ieqSG8qSquPY0e13/NhAaKqDa+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM3BpPNShbb6XYuR41D15qVb1Lr7KN6IMboRbd9ckKs=;
 b=RtDaeCCND4qh1stpRnd6FW2tvT924++MKZ3V3Y6/6KIJk8Wib4LmNz9nmU3aW7ADcpfkylnakY4r1yG6DaCq9FDY2bkR9VTyXf8nKLcOeOdw81eN+4KE4AO4DyI9fxHtBkWIyoat0Hg76V+YShi3AM//XbABpz8L5JwYpfEUr0cowOFfWSH1nZmmg6qrwC3WM76fUekQ0QxUO/dr197qjUZDzbhqFran4Xl4o5cDRcwJBRAQanslAGEz8TS7cjSDbU15qxJt6EiBltCtY38hrGnUYzK2BMUJAWIrWU7oSrhryIN7HvztdAHVosGCSAu5ILqoOmCVc+Rhx45g/4L8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM3BpPNShbb6XYuR41D15qVb1Lr7KN6IMboRbd9ckKs=;
 b=ckX0HBDrwiseDZExN8td6aAtz1grewzbf13ZFcTUGAWUyprANHkqiZAZelalS+3398/LgzoS4HpNMUa3uD140fuO17B8siJcnhRYsi5qCHvi+6WO4Rk+PV53Z2u+HExYPJlDSwbdYTI0D7OYFUCiS+e7LEUjp54wRf9kBbFwSLMCYdztpuYUQw/JVxLOrrrhUyvuq8FYHR3n/bvKLTrL0fRm/g4FNEidcBuVoDFYEgmB+IeHtDm05tuTe0vNPyj1FzfpFFMZBDWbQNpb/tEC88A8RHLaKdKXvvnNvjvcyBEHLmHkctP5KOxuXSTkAarvX07XjcLbVhM9NipzRSweYw==
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com (2603:10a6:10:47f::9)
 by PAWPR09MB6645.eurprd09.prod.outlook.com (2603:10a6:102:389::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 14:38:56 +0000
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95]) by DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 14:38:56 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Aleksandar Rikalo
	<arikalo@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Dragan Mladjenovic
	<Dragan.Mladjenovic@syrmia.com>, linux-kernel <linux-kernel@vger.kernel.org>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: [PATCH v2] Allow for riscv-clock to pick up mmio address.
Thread-Topic: [PATCH v2] Allow for riscv-clock to pick up mmio address.
Thread-Index: AQHbqV0f0XhfF7yqG0aggt+vaqf91A==
Date: Wed, 9 Apr 2025 14:38:55 +0000
Message-ID: <20250409143816.15802-1-aleksa.paunovic@htecgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB6196:EE_|PAWPR09MB6645:EE_
x-ms-office365-filtering-correlation-id: 2d1b1682-6d5c-4736-149c-08dd777441d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YRrBumpv4iFQOhsmZpAubKY6kBG2KwIKo+Pzt+JdDkr/MOlUdcWlOw5uGq?=
 =?iso-8859-1?Q?d6ggrCqBMNR7ry5N+q8wP4DfgubqLTx14tcbZ9p3DFu8pWJ3Ac9NPTl3Ma?=
 =?iso-8859-1?Q?9lo8tXR0q0HvE9Haw0cV9SiIHHlsFxAYpLWIenUEBAB10uO7lM8hkjFneA?=
 =?iso-8859-1?Q?bNZY+9ktB4z8YW3mZWzdOSxUirrJhvO47NSeS/ourXBdSmRoRI5w5xo+ot?=
 =?iso-8859-1?Q?OCHHXKJ0Xa5A6TnavfibAz1/u3XQmzGse/VqV6uVy514AupJSzm4M8ALd5?=
 =?iso-8859-1?Q?dSheJCRfwKvpQdP3vInFZeJqDK+QZZ6EmeY5SVPnmetQeh1od7bQO5xRNw?=
 =?iso-8859-1?Q?8RA+Vt3tX2V1NxA9PquMUbtuKCber8uI9PBnzES9BivKS6UYhk/ZYNRrGd?=
 =?iso-8859-1?Q?MgzB5Cm6Y1V/8sHGIAMz8SmsG4A0UuKXEwiLhqkqatV8hfnl/MfQfulFAp?=
 =?iso-8859-1?Q?c+eVEebI9n5J8FY7WsMSdet3jZo33i3YSo2nd0Y/vdCAK82ETkmjU0rvM9?=
 =?iso-8859-1?Q?rC/DPvoZOvVCsx3u+G689juvkmkvMWTsL3dbgYhtoA/0lwqvJIbMOKBByk?=
 =?iso-8859-1?Q?f1DNlH0v138Ez6hosp2ECH9KMXgO1j766otUtC5xDjmA6Gvl0nwGmqv+YF?=
 =?iso-8859-1?Q?xMTBFDCmDaNw5TT9G8C4RUSOxvYibTi2kN7w3RQA5wdYT6EFWGEXs50GoP?=
 =?iso-8859-1?Q?9LBPAElJ4KpZEUq8iMsaWlv/P55czHxPcDFasndj6jYngC8II2fIS7UssO?=
 =?iso-8859-1?Q?Z1t/CCS1yPSSiDzEreGQj9gMrCXULI5Iz9CZXBFGFijfcsraxFDo/mBNBM?=
 =?iso-8859-1?Q?VVDSSs3fP63I2HBxCddlKh4BytF3gJU+1mfnRldCAUWg5mOa9R0IrQyLgx?=
 =?iso-8859-1?Q?jVvff00V0e0XLd7XBNzcY61V75hOVCR7Gfz6YmX8xqBHV1W5HagBJXvLoB?=
 =?iso-8859-1?Q?syGSeuHRQHSn+sYQVGip4l1/mRcwsJ1xJceEy/nraJ99C1kyDT6PqmSm5y?=
 =?iso-8859-1?Q?v7VAvVDejJF+jAnXk/Ro0ChyBoAvlQSMkUlXq3vVnVH/I2X9kbjPUlfOT0?=
 =?iso-8859-1?Q?Q0MaXrKadxXiS7HzOQQB747QZl3v+E9kQf9yAeHfuah9bY0WwFZIn0jS7v?=
 =?iso-8859-1?Q?cppT0cBNiViZ1pIZRjDl/1fmgOgllHQ9Nb1JBqT+I00rRUUKSz40YUFqsm?=
 =?iso-8859-1?Q?sBdZk97RgVHpMmoUnO4Wa5HYEFnIAKt9RQ3xCZtvPuDAZb6vCStnB5jjru?=
 =?iso-8859-1?Q?ersoCBTGVsNT0emKqBkuXrwzyTF6YcnagVPrEqTdiYo6vczy/dEmvRmPNw?=
 =?iso-8859-1?Q?vU8B9t5L39lnwAr+UFU0aFz6e9oLkGUPWE+OBl9y7Qn8kQxavDIwwsJ05T?=
 =?iso-8859-1?Q?Dm3l9bcIZcnvCvsNeJGwsCl2sex0xfSrDxuXppgPuyvpxc56D59tlYIRed?=
 =?iso-8859-1?Q?crY8ugBf4GwDpk71j1c9G//4HC0FtiKBADhiVCFH0a6o25gLBjw2dPIDbY?=
 =?iso-8859-1?Q?veX+LkKYHHHVJCilqLwxoSnFN5SifAW4a1SaFZnPWKzw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR09MB6196.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hgv7eiahJmk+chhCzakzpbilcpstsq8VvW4TiFkPf1ihYlAM6rinASj9TJ?=
 =?iso-8859-1?Q?kVX/WLEzLa74sCapt+8dBH3vK9zWg/cVS6fcg9Us7n4PdU+lBGQscsxs3L?=
 =?iso-8859-1?Q?BT8fc9cNl5FsDegQMTsw0zc3X2wO5KjesmTa5+fptQ7sJ8DX2+BpEU8GD3?=
 =?iso-8859-1?Q?A668JMqBfNdwxYfOcSHbHZLEMR3Rxg2uvApqOKX2MwOLO9ninpMt1daf7Y?=
 =?iso-8859-1?Q?SjzW3jri0BpzoPoW8NKqY1fivu4+SweRf4WJ4yvMeCzimc11JT6VdW7nzG?=
 =?iso-8859-1?Q?7x+ON71I5l8yIzakeVR2dk7prYDxSAjzSGyAkIajWhTYQ7XkKldMBp8gCk?=
 =?iso-8859-1?Q?7m0YgtT52MSR2buaGG95XXQWFU8P6eAgqx+ONWY7kv9e9HNmqK+uaL4jPR?=
 =?iso-8859-1?Q?CoE3zlCtmFJEJC4H5LKfGg7AyydJu8ZS/8rLyilQIY+N4Kxi3ddSNb40zv?=
 =?iso-8859-1?Q?OnrRTkgjC19F8yFgT889Ce8orh4c3pRXRDIPKq7PudIDLMumP4ijHG45dD?=
 =?iso-8859-1?Q?WMTP/pveAOBGwbiPKKtuRDFysVWweN5Gx4oXerMx+1cs4u4vunCz2+XUBP?=
 =?iso-8859-1?Q?o/0eL2egu28OooZsn3nzKiyRZy50J+we8ZQEJ4FQ6YEEs4vlfj/WOtX0lO?=
 =?iso-8859-1?Q?Pc6mp+8AT+G+anE8DHmEFBgjdapI1TCwU503iEdoj590d7YyqpLnV9oyQr?=
 =?iso-8859-1?Q?mKyhE1E1YcF0JChSgzsmybtQe5Q6LBDhLUL1TzmS2RaHVFO673MipDp+dx?=
 =?iso-8859-1?Q?nFoVprDJDXJfyMzLYcMc6CVv+D5xvF+UlTO6iFfWJywMfW5fqCQK7r4rDN?=
 =?iso-8859-1?Q?cm40vFZ7G7Xl5fip8o9BvI5K2YEHWAieqFqPKNGAgqMpipCm6W3LHyhsAl?=
 =?iso-8859-1?Q?Lx2smxddsbhHT1udvbp/eiLLTOO7CrfPEUaiidKvOSLQlJnFlxL4dQFM00?=
 =?iso-8859-1?Q?uSAgEKe5WzJ4oZNDmSm2jMy+ctH1YlpHxwaPOqtajlFWuF565WWkYo4xI/?=
 =?iso-8859-1?Q?D9GUEOL8kHjgvUaYGZujFLtbJo6xG8fTKMH/ag3iOtJaZOOv+eHOt4rLEQ?=
 =?iso-8859-1?Q?BJYocjf+95qEGzzSyBLryQWvNwlPxLVVJY5B9N0ozEENRrg1kfp2FNobB7?=
 =?iso-8859-1?Q?Yhoj3gbS7ap5hXQC6ltxU2rDV1flT/MFtmfpmafDBI0TckuoQLwOBQNVJi?=
 =?iso-8859-1?Q?NnAF6GXmMIS+XOJ/1lzBOlMvTxo9PpPD5O+tRm9/8oYZKFgDumPHoLmJD/?=
 =?iso-8859-1?Q?fEK+FBSLm1uf5up/HCbWTd9suXmmuyUwbmtVdWzJELO3s4xIpglogFbUbd?=
 =?iso-8859-1?Q?twNAEZkaIyXAiUvLnj0izhmG383Q439wrdPYF2I8hlbqUTJ8RK0FPTCKpL?=
 =?iso-8859-1?Q?rrT1WTvDGjrqroF9hrbXaXJl4I/RjWS5jqskrbnHIt1KdOvZC8rBuoUzzL?=
 =?iso-8859-1?Q?djwxLy8AS0p6mSU7AAcjXmn6241N2/Ninwjp/bi8aMgMw8Bzu/nnJaC78N?=
 =?iso-8859-1?Q?pDXc3XAdjYKPJ1D62PZSU+e3QMGNwHH4fOmNou/ResLnpvvJx1yh6Aw9TA?=
 =?iso-8859-1?Q?WnzF5LNgQKvWHrWGBr2oBkwKRHts7/BydS4xbEQnc0ucFjw5L2bZWU6o6K?=
 =?iso-8859-1?Q?mbsXJRHyPNGKE4GEP6XAY5XpWYOGMVG9R6rQSkb+/FGiN21wKx1AaY+Zux?=
 =?iso-8859-1?Q?/V2D4XJCfP/jGxq49RQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB6196.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1b1682-6d5c-4736-149c-08dd777441d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 14:38:56.0082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LzlWxJ8lPHyaV53/TUhRgEKw45sTB39x59ghzpRba2lCWecUW8ko3oUC5ORBR/oKbTodtpvYd0r+8+afiAmeoq34WfCYzNxEvov0OElS8js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR09MB6645

From: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>

Allows faster rdtime access via GCR.U mtime shadow register on p8700.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/Kconfig                | 10 ++++++
 arch/riscv/include/asm/timex.h    | 59 ++++++++++++++++++++-----------
 drivers/clocksource/timer-riscv.c | 30 ++++++++++++++++
 3 files changed, 79 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b296ebc8c61..3414d419a7cb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -728,6 +728,16 @@ config RISCV_ISA_ZALRSC_ONLY
=20
 	   If you don't know what to do here, say n.
=20
+config RISCV_TIME_MMIO
+	bool "Time mmio support"
+	depends on !RISCV_M_MODE
+	default n
+	help
+	   Access time mmio instead of rdtime.
+	   Some CPUs trap on rdtime or reading the time CSR register.
+
+	   If you don't know what to do here, say n.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.=
h
index a06697846e69..b1956c737513 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -7,31 +7,24 @@
 #define _ASM_RISCV_TIMEX_H
=20
 #include <asm/csr.h>
+#include <asm/mmio.h>
+
+#include <linux/jump_label.h>
=20
 typedef unsigned long cycles_t;
=20
+extern u64 __iomem *riscv_time_val;
+DECLARE_STATIC_KEY_FALSE(riscv_time_mmio_available);
+
+#define riscv_time_val riscv_time_val
+
 #ifdef CONFIG_RISCV_M_MODE
=20
 #include <asm/clint.h>
=20
-#ifdef CONFIG_64BIT
-static inline cycles_t get_cycles(void)
-{
-	return readq_relaxed(clint_time_val);
-}
-#else /* !CONFIG_64BIT */
-static inline u32 get_cycles(void)
-{
-	return readl_relaxed(((u32 *)clint_time_val));
-}
-#define get_cycles get_cycles
+#undef riscv_time_val
=20
-static inline u32 get_cycles_hi(void)
-{
-	return readl_relaxed(((u32 *)clint_time_val) + 1);
-}
-#define get_cycles_hi get_cycles_hi
-#endif /* CONFIG_64BIT */
+#define riscv_time_val clint_time_val
=20
 /*
  * Much like MIPS, we may not have a viable counter to use at an early poi=
nt
@@ -46,22 +39,48 @@ static inline unsigned long random_get_entropy(void)
 }
 #define random_get_entropy()	random_get_entropy()
=20
-#else /* CONFIG_RISCV_M_MODE */
+#endif
+
+static inline long use_riscv_time_mmio(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_M_MODE) ||
+		(IS_ENABLED(CONFIG_RISCV_TIME_MMIO) &&
+		 static_branch_unlikely(&riscv_time_mmio_available));
+}
+
+#ifdef CONFIG_64BIT
+static inline cycles_t mmio_get_cycles(void)
+{
+	return readq_relaxed(riscv_time_val);
+}
+#else /* !CONFIG_64BIT */
+static inline cycles_t mmio_get_cycles(void)
+{
+	return readl_relaxed(((u32 *)riscv_time_val));
+}
+#endif /* CONFIG_64BIT */
+
+static inline u32 mmio_get_cycles_hi(void)
+{
+	return readl_relaxed(((u32 *)riscv_time_val) + 1);
+}
=20
 static inline cycles_t get_cycles(void)
 {
+	if (use_riscv_time_mmio())
+		return mmio_get_cycles();
 	return csr_read(CSR_TIME);
 }
 #define get_cycles get_cycles
=20
 static inline u32 get_cycles_hi(void)
 {
+	if (use_riscv_time_mmio())
+		return mmio_get_cycles_hi();
 	return csr_read(CSR_TIMEH);
 }
 #define get_cycles_hi get_cycles_hi
=20
-#endif /* !CONFIG_RISCV_M_MODE */
-
 #ifdef CONFIG_64BIT
 static inline u64 get_cycles64(void)
 {
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-=
riscv.c
index 48ce50c5f5e6..175fb82acb41 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -32,6 +32,13 @@
 static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
 static bool riscv_timer_cannot_wake_cpu;
=20
+#if defined(CONFIG_RISCV_TIME_MMIO)
+DEFINE_STATIC_KEY_FALSE_RO(riscv_time_mmio_available);
+EXPORT_SYMBOL(riscv_time_mmio_available);
+u64 __iomem *riscv_time_val __ro_after_init;
+EXPORT_SYMBOL(riscv_time_val);
+#endif
+
 static void riscv_clock_event_stop(void)
 {
 	if (static_branch_likely(&riscv_sstc_available)) {
@@ -203,6 +210,10 @@ static int __init riscv_timer_init_dt(struct device_no=
de *n)
 	int cpuid, error;
 	unsigned long hartid;
 	struct device_node *child;
+#if defined(CONFIG_RISCV_TIME_MMIO)
+	u64 mmio_addr;
+	struct device_node *gcru;
+#endif
=20
 	error =3D riscv_of_processor_hartid(n, &hartid);
 	if (error < 0) {
@@ -220,6 +231,25 @@ static int __init riscv_timer_init_dt(struct device_no=
de *n)
 	if (cpuid !=3D smp_processor_id())
 		return 0;
=20
+#if defined(CONFIG_RISCV_TIME_MMIO)
+	gcru =3D of_find_compatible_node(NULL, NULL, "mti,p8700-gcru");
+	if (gcru) {
+		if (!of_property_read_u64_index(gcru, "reg", 0, &mmio_addr)) {
+			riscv_time_val =3D ioremap((long)mmio_addr, 8);
+			if (riscv_time_val) {
+				pr_info("Using mmio time register at 0x%llx\n",
+					mmio_addr);
+				static_branch_enable(
+					&riscv_time_mmio_available);
+			} else {
+				pr_warn("Unable to use mmio time at 0x%llx\n",
+					mmio_addr);
+			}
+			of_node_put(gcru);
+		}
+	}
+#endif
+
 	child =3D of_find_compatible_node(NULL, NULL, "riscv,timer");
 	if (child) {
 		riscv_timer_cannot_wake_cpu =3D of_property_read_bool(child,
--=20
2.34.1
