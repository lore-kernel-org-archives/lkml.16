Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010014.outbound.protection.outlook.com [52.103.66.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717513957E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750259305; cv=fail; b=JUgnboLFRqld4Nt2Dy2h/qyqgHSKwM5mPBXkFrVLTnFUK7BYT9CuitpnNDgTEWGPVOL+nplFMfv1m+RUu2K7wT3/NNCoGJr3Nti9PMokrZ29mThyomO3plYjMYehIPfHfvxKE+pGU3dZjylvZCxYG+ssLqxgtMH7IRyozC7YN2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750259305; c=relaxed/simple;
	bh=ewvZz4dObsmRL1JrkrS5usyDgru15duFlRb98Otg3r0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qBDpueUmABKP0Wnp4VIR2GhRuteZ28dC295IwbUPVwbVrUawM9ME0/z3T9vJPAmZyLDWHOaSIYp8tYLpkRL3F4yF0kVJUf7CWCAXiO/7hQQV4dgeMT901Ka2a+cUnh1OO6m9u7p9YvzbdAE0+pLItlnDvl2n7zoWV44jpLMk7Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dCGbRhjt; arc=fail smtp.client-ip=52.103.66.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dCGbRhjt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9IndmN9IfRWzp3mqq3XMiwCBo05ob/DzWt4CPDRON3u11IFh+Exjl6bjlbdzIEqsWFnlZldwY3irLJ6oyZrplyjLjjGa6gi2G+XL86Pm+5HgJPD76ms1TThiqbM6b0NzrjQ8hJPsEWaJ5XYtIosO12m9ZNJlrqkyG7T3IANjiSKm8sxUsjI32gPPAsNEwyZebb1BEW/hI2SY57I3fkOOApYi2ySGIkAiSL6baz/5qOo443/aNRFaP8HEFdeAhBXgGAk0+fLAmyKj7O/ocGer5JOHm4zXeVmq8GCMpGqP6byChUnQC2NDYJtoWKq/cy0vTtnsARNolSl1K7GegIzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5m9DhIGZIYqNM/noA9ZnmpdjCTI6ZG1eKWdbGbtfsJM=;
 b=wOaaZKF6rvj9sRTGMlPZXyrrJtfNTDUfTi5I4XlX6CLHqpPCvass8Rh+olzsXCFftNuKldUdUiVwdCglqZ12yMfHPZBbBTiCHsvPntOULZEkgzt+GcvZkHjF3q7hzdprIQpNiAs+NjBTcGxn03009f08SKG6k7r1BjyE4tUHzJZAjfGlgwvZiAEmeecgZGRBq9BLfsKSaoLzhVRIhwMpaPeSyevgpfYOUsoOK4Y9Z7sG1YcYtq7yd3ae3bgfe54LyQb1dI1bVIkXtp6GHOPEbYV3HAg0Q+eZIYXTRqtmirry143+oQfsraRNjFicx9KtO1If71Xsa30WOXrnw1s7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5m9DhIGZIYqNM/noA9ZnmpdjCTI6ZG1eKWdbGbtfsJM=;
 b=dCGbRhjt3MHKVVcz2dOaQ/Kw5JXgqMpKkdXuSspVtutBL6os3MT+dNhidravBGilDOOt9HBPd57k0RzqyiBDzNNJQaqkH+ThqtlGH4wPwD8qp2U6RJqj/jctTLxTVEz5eyfnx0F5lMdrMEwxFNUvTMOibFPxiydlz2r36c9Ejdp8iDW6JOykzk23k9Qodl49aBFo+tFTOwGu7OdIOrJB2kyqx57NIdoDFB6nCoT6rb/mORTQZRNaTGrk4Zth9JtcNp7fiuycy5uj9YoEndB25YaHioTsCvD+nY/iSONIUwB8zDxJG1PT6WAX0tf+ra5Pk+tI5W02mOBWdXxkPfF91g==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by TY7PR01MB16078.jpnprd01.prod.outlook.com (2603:1096:405:2ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 15:08:21 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 15:08:21 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] irqchip/ath79-misc: fix missing prototypes warnings
Date: Wed, 18 Jun 2025 23:07:43 +0800
Message-ID:
 <OSBPR01MB167032D2017645200787AAEBBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID:
 <20250618150743.32481-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|TY7PR01MB16078:EE_
X-MS-Office365-Filtering-Correlation-Id: 014f9b67-b59e-4026-f4bb-08ddae79f66d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|41001999006|461199028|7092599006|8060799009|21061999006|19110799006|15080799009|5072599009|3412199025|440099028|53005399003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I1TZKXNNdOPzrIz2uzvO1WWNYs0Zl/9POckbXDr5098f89PUU6y5kk2N2cJT?=
 =?us-ascii?Q?lBliLmDcu8+gUDFSEWCssE91RWNsnbrPlO1awDY7DgtHi+AaEZ9fKh88Bhtr?=
 =?us-ascii?Q?vn3l1I/aS7aLRh3BEItKgnFFpSthVyk04c4wTZMV5WLyi9/pQ1ssjY0Koag8?=
 =?us-ascii?Q?NGFcUISXx0Rb2JqUbIqt2vUCzZhHUP98aw8bCgV0GhQHPEky+3C1d1UhfX8q?=
 =?us-ascii?Q?ACCNqU/rq5siECMfSxlbCUYoVLy+ht5Jl15Pzaue+FKy84KNPpIO0LibB0gn?=
 =?us-ascii?Q?dONIB1hRcKYQNV1hUjkHmkmfaMA7IMYKYDdfquHQ5JiwzXNVcU4+cH1tWdtz?=
 =?us-ascii?Q?tzNpbkSftKOYRmCX4j1jT8h5mNll3TmNzh/pJhMmvhVainZgu96luAinwY9z?=
 =?us-ascii?Q?6/i0S6doWOqN7osT+TapKSWlZqEE48Y2xS9IITEQs181Ptc7mzCiukshUDG9?=
 =?us-ascii?Q?zLIeae0S89NBKMnzyUOchFMwZmK9yFfT/EXaslxYMkm7a+xXv0WaI60vbtFD?=
 =?us-ascii?Q?aeV7j5LiGR3McQoFwXpnwkQFwgOXX/5aFK37TFkWRGNctZWruVW1cd5H0EtI?=
 =?us-ascii?Q?FqffLKCH350JqqB2wiIcaQQTc2lCm7uyZBa5CpwJKDKf6OpzOuk9p/isLjof?=
 =?us-ascii?Q?Fphy2tbqFCKO1EIIxEObxwY9zrCi4kIJgB+I7hj4zmvR+vYMkzMMXo26eYyt?=
 =?us-ascii?Q?XCEXHYQcoYlDBW08SANrlokFglI9h1wycfhPf75yJMakTU7tGfCAIYv/Uc9F?=
 =?us-ascii?Q?G3SDzigyorWEtePj2cX8FZeE4iAlowndPbchkBhRrzFb96NALkKubFEL+wnM?=
 =?us-ascii?Q?xCgFZLUETCKgxKLdyfYEFeGn6ycXmydn4vlBhR0aLQoxJLreMmMlUcvP05It?=
 =?us-ascii?Q?MRPBLwih4whS+uEAmf8O0GRhyEeCiDXxh+zflSC1OAG/TCc4SxyzMsuw9aT7?=
 =?us-ascii?Q?eIoYsBY/Be+hp55Cn0T3yEn/mR18reI/uO9B9F4ZJ6ZwPzQCsKuAWgurz6OY?=
 =?us-ascii?Q?7SivP35AdrjvQRI3py1eAp3290bmPCUP/gimxNup1nhjsdvk8yVSPCjJ669j?=
 =?us-ascii?Q?2XKZ/7oTDIhJe0RF/2HIhRcSPIa3LAN2AB6UWBur0sDqLA64Dd30CiJ6MD4o?=
 =?us-ascii?Q?V4Cunw1y/Zr2urXeLMaXJituFg2R3NZeXUky+ZlCwOZ9BbtLIYeQ7PsYrFVw?=
 =?us-ascii?Q?Ee1jE0i3vhRzDeUckj2Jp2CM1E4AYX/FZys/x+fsD2o8QCL/LQsbW50nfHdN?=
 =?us-ascii?Q?CA7JnCDrsjyvnIMKkc8f1X8fp4r3c1qMOownFbv/CGAX8q33jLcyD1GRWVEn?=
 =?us-ascii?Q?Xus=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n5qoJ0nNwyQ8LmqdyFA/EjR+3zKPLtzwktjX/DQtzu5O7PiTN8HqvmZbZGBT?=
 =?us-ascii?Q?ULou8UMX4vWiKOOc9lZn9zRprNeGnU7Mn1+nszcWIvs5JiIsf7vE4UymbCo2?=
 =?us-ascii?Q?7jJwiP+k7RohxDJxdX0PIMG/4CTJI31h6D/B9SwbS/ZOWyqQAcAQNKYUmbjV?=
 =?us-ascii?Q?VN8pLLJ1IjQpfzGy8NXbKqnOMNvqsEwSSXZf3wwOJV/eMh5k9MiSSO4n25Xh?=
 =?us-ascii?Q?nFhacSCAUI1N2ipEWwLKYGYpaHHIk5JOc1A548EMUNc6rNflYapuS8XnlUJR?=
 =?us-ascii?Q?lTBYnSuk6thSfRynTWIF+FBG8GPsuE0QSlotzMAwnZWscKtzdXdSY4JwqLAY?=
 =?us-ascii?Q?3p30sPjkNuNxY4pSgR3F+EVrNiA69ButAmL4h3cEErxDM7sQum/tnSMyRLna?=
 =?us-ascii?Q?BkqEbpWbxMVrTeP8u0Qt9Re4KnkLyEOxq3zUw1ZN0PJe36m9erqX1ojuyZ7I?=
 =?us-ascii?Q?SqGEKEAmpf49khQTOMmoyUKVAvpq93J9q0XOtfDOHvHEI7MpfBG2IEG0XE1l?=
 =?us-ascii?Q?NlTD2GnEzVbtMjrEeDw0EoEKuzSC7sj/XdWtUFXc8WT0QPYoWicGBFVuwyYS?=
 =?us-ascii?Q?O4LAVkSrnbvn7NOZwnlNKhe6iqX/OWlY7ho9S/4Om2uzQKK+jaucm1hVVkKu?=
 =?us-ascii?Q?kI8/ZExjmti4nP5Fq3CldUrSE0Rl/8A3BWpmPP7krx3OZeuM550kZTn9vvxF?=
 =?us-ascii?Q?WJA1KiBoFDnbcyt8TsGvfzmJdFFp7FU7iIUqrc/7nhfOoPTHumSuEAxAfMLW?=
 =?us-ascii?Q?c6CzZE9svqvFBO3lNue0f2Zl9OSGQ+DhYi1m+6rkZOdSqLswXAZZZCnPfaq8?=
 =?us-ascii?Q?wusQKyuniZE6A2vWhW1mPJ67UKzxjlAalYfV6X3THHEnDpfT0RGY6uwDXDPw?=
 =?us-ascii?Q?GUzjkuJ+fm346V33yqj7MmsgBZ/NZeqqIwiRDsBTm8RdEytlR1QrxEtupJYE?=
 =?us-ascii?Q?DetV/Bold72S6hsIRQ1w8WFtsDXHLjB+Y4Cqk6p7fYEz1rhRhhDqf52aH/+G?=
 =?us-ascii?Q?iRkJk/eAetjOnw726BwjJLr6O7kiEuCSVF2BBWhkOJeByobpcjE07GztAiTM?=
 =?us-ascii?Q?zeQq6nAJ4mjhGmFCBe4oJq3uAF7oWwZX25CReJvq3MjG4GkMk/8EAD1ikJxI?=
 =?us-ascii?Q?BfS+TTNUmNtotwBiLPyGzpPtsNu78p1n/j3WqYO5i+dNPazHJyrVb0nHmezj?=
 =?us-ascii?Q?rPUKFypT9gbm+GK8Jwk4mg+KdN9IOlc8EsoOjR/xVKen79qq5Wk0D/tUea4g?=
 =?us-ascii?Q?mYcjYBq7a0Lb2pBMPh95?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014f9b67-b59e-4026-f4bb-08ddae79f66d
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 15:08:21.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16078

ath79_misc_irq_init() was defined but unused since commit
51fa4f8912c0 ("MIPS: ath79: drop legacy IRQ code"), so it's time
to drop it. This patch also adds the missing header "asm/time.h"
which defines the prototype of get_c0_perfcount_int().

Fix the following warnings:

drivers/irqchip/irq-ath79-misc.c:26:5: error: no previous prototype for 'get_c0_perfcount_int' [-Werror=missing-prototypes]
   26 | int get_c0_perfcount_int(void)
      |     ^~~~~~~~~~~~~~~~~~~~
drivers/irqchip/irq-ath79-misc.c:181:13: error: no previous prototype for 'ath79_misc_irq_init' [-Werror=missing-prototypes]
  181 | void __init ath79_misc_irq_init(void __iomem *regs, int irq,
      |             ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/irqchip/irq-ath79-misc.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 268cc18b7..a476a892e 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -10,6 +10,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
 
+#include <asm/time.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/of_address.h>
@@ -177,21 +178,3 @@ static int __init ar7240_misc_intc_of_init(
 
 IRQCHIP_DECLARE(ar7240_misc_intc, "qca,ar7240-misc-intc",
 		ar7240_misc_intc_of_init);
-
-void __init ath79_misc_irq_init(void __iomem *regs, int irq,
-				int irq_base, bool is_ar71xx)
-{
-	struct irq_domain *domain;
-
-	if (is_ar71xx)
-		ath79_misc_irq_chip.irq_mask_ack = ar71xx_misc_irq_mask;
-	else
-		ath79_misc_irq_chip.irq_ack = ar724x_misc_irq_ack;
-
-	domain = irq_domain_create_legacy(NULL, ATH79_MISC_IRQ_COUNT,
-			irq_base, 0, &misc_irq_domain_ops, regs);
-	if (!domain)
-		panic("Failed to create MISC irqdomain");
-
-	ath79_misc_intc_domain_init(domain, irq);
-}
-- 
2.50.0

