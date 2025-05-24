Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020105.outbound.protection.outlook.com [52.101.227.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A265119D8A7;
	Sat, 24 May 2025 10:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081040; cv=fail; b=dmUUiQqjKnamAwFwiHak2wvAPOU9mgA8ccQtIId/4MHZVdr6VVQIUhezL9JQAaLWzz6y8oCCndV0+hmAtTfdrpeRyUf4Lh/tl9ZhOVj2H0JZ7khfNqGzym2eOKi3VfqhDnBaYZt5nffnN229YsRAngezOR/Z/vwdzcAW9nph6us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081040; c=relaxed/simple;
	bh=F2sQyG3W7fvk46VhNl2/WPOa3/HMjMnNCt2zFhtF0uE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SmEMuSEhQqsoJPoQHymFll8pPnqXTPOjIRw8EvAgV4JEcwuB2OXY946QXw5Ok/bvchWAjBLrn0mUx2GyIQUcA/NQ77vBAZb2N89+fo/1deso/0X4iJvJkJ7vAXWng0l3lbis/2V/mYwUQlM9Iiv3xAy/3dCPmT1KHZvgpUIUHN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ED9HOmMhjcdAel20Xr1IZrzbPxYltR8GqnTAZCmjhHWcpc7ikOFHgWn3bQchR0ZSf+fS7GgyuX2zi2Tpe1wzZdxG9xK5s3B25GRuJvxJzmSTLzzQqdc0my63xpeBY7BHWttEzS3LbSK15YnEW/3kzgfSG+4rZEUqlF2jg4hXle/P2plmkdLmac1/DKb8JXYxnUyjVUDOJ6AJ+66g2QeWyVcmE5D7RH5aHuWkn573BxvGngGMRulfNmC4N+9/7YXL+XJHauEumnrIM7666v9m1ZLXfzgweiQ9CvsfKn6lMaOODA4gRISQg+wlz3L+7pH0nBB4JAEG11D79BNz7FtRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKVZTTx8YLa+0rRMzU4hC94paqHxW0dXlB5wiFzFf0c=;
 b=ZJr4stvlPzmj1nD2wIqvxhownpPcgPYrsV9FHLkaFxnjhNA9J58ki05Cu0y7p1UJEKKNrwvjmzt/Af+jOKrni1uPYHcWBop2UXbY83ttYVr/YrA0tuCJo4FQn+lTQYIO7RJ9dnU3qJtPEsS9qtfCl3zuyKTV/roVhQgRz1sDxOX9P1DS1l0AZRF1DGmLmTW+W4FBJLbNW4f+Yc8fQSlo15GLW4xiI+JQJMLa57z4yRAUycLT80OAI9+MG7bjd+JDCW/31Ib3GbtRub1XhcvVQOOkvcjR3tJGTibZSZcV0bo8TyGrsQU+RH/xcecqLy7dfmJcrmBDnx0qCzjKF2ldlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN5P287MB4228.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Sat, 24 May
 2025 10:03:55 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f%7]) with mapi id 15.20.8769.022; Sat, 24 May 2025
 10:03:55 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: alexandre.torgue@foss.st.com,
	amelie.delaunay@foss.st.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	David Jander <david@protonic.nl>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: arm: stm32: add STM32MP157F-DK2 board compatible
Date: Sat, 24 May 2025 15:33:14 +0530
Message-Id: <20250524100319.22521-3-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::7) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN5P287MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd7ae06-e9d7-47c3-9a47-08dd9aaa4b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6nfZkpHPM0R/sWYVCW2jobxn9cNZMR14OBjqAkES1YxeJ+UbqqzYfjGGDT2J?=
 =?us-ascii?Q?YJwVwrcAJjTFS8Si99Sj/OTJ1lOGexK8yAYUV6NqPl9TCEs9o9Rg5sGo+DgU?=
 =?us-ascii?Q?heY0QOzKa4TyfKeTuYLo7OdQuL53uZkNZNk6vK6EHsmCIKAZKn9aEQbUCvMf?=
 =?us-ascii?Q?NklzST+S28sdrgUYHxZjuGuznAeq1Icr+MDfSIQStcQRXwbZHnMxQMSaFZn6?=
 =?us-ascii?Q?F8dgPNUkV/UL9xswvD4XyTCyTc0yMDGBpxSDL3OomM3TvrXdWjO8GYpmb4aS?=
 =?us-ascii?Q?p8HSrPJmRPiB06JLPRh7Mql/TfS+0mj66Ey3hYzaBfHjerbYzWy9zUUGYfaW?=
 =?us-ascii?Q?2j860Xk7ms81hTXNv49D0rGS1mJlsD2YGQCrtoM66wXjTxlW7EYw2FmqMI50?=
 =?us-ascii?Q?Qo9MWEwPrvwCocJ1UHcMpvb1VoLg7NBgN292pKKCO+fU3c0kUqasmFoBucqC?=
 =?us-ascii?Q?PjCNiv8z92j2a7C4DFLhUnltq2leJg5Bgc4620GW3+bi+PFO4E/LLyKSaFip?=
 =?us-ascii?Q?nUPY94l7GBZ1zDfVFaEiBzgZB2YfliB0VtpywnREvYBUeOezE9xqvg4VNoWp?=
 =?us-ascii?Q?Zm303UhZ6ZF2cFhZayehl0pzpWC6VaZBGlVPhikrF4vsaEQhYaXwtVk6mfz4?=
 =?us-ascii?Q?cL6mwyuK1uLni11+Xl40zIrwol/slavS5QajM8IeeEgrP+CHQAOXdx0gCLKb?=
 =?us-ascii?Q?felXrwDefPMl4FOTWgSoTyqs8dt6aWulB4GZAfwO8V6v0JLfL16yTkcSQkC6?=
 =?us-ascii?Q?wHrfJswPtNfehX/bm+2PqtWVCkGBWlMorg/Dd1SWelO+g2P9YaVcYv0MiIqx?=
 =?us-ascii?Q?/OJOpEaPqysJXnnsNeUlGh5OHndQFOGELIgH0HdRE7FerfMfSfJEAswqK/e0?=
 =?us-ascii?Q?bjKbrTxtH4446NmYD42dEfQDO2UzqyccR1ahsncI3Q04WsiBbDmfGiHBtzOS?=
 =?us-ascii?Q?7qMgp+nq5NlKTASQwmjOcJitu33Lt8I9ONReeKOU2IZjbN+FLRjGLUgUG6hW?=
 =?us-ascii?Q?4GYd5oRzoWF1WrdFM41TZhaFADjqGwDdmh0BuXl6lX+x5WUlXJr6c7Q7/0YN?=
 =?us-ascii?Q?eTYMcoJ1RazNXiDiV9HXwWgFy+7npHynbt/eK4YOkaocxUFyhwpr/g5hMbbr?=
 =?us-ascii?Q?VgxJkrxvBnVjqkVmBwjM0WHJ1+fW2h/yDYOoIOGZL12sWNCJ91dupWSu1ZyN?=
 =?us-ascii?Q?NXrN88SMFIrdq6lJuFaSoXHMDMc1IkUdTD4kXhQYdAdj8M1IBfwkHOB5vTEZ?=
 =?us-ascii?Q?Jyx8AeNhTnNLHtS4OmHIB4Ryq9to+fYj0RzIauQf7XMNnsrVAcYSAPM6dU9X?=
 =?us-ascii?Q?IA1Z42RNlAgdfjXbZXPubv7sAz5v1cOHS9JZ+nmCAeDxlp6rzZco2K6W1+MF?=
 =?us-ascii?Q?yKpt5UjouyyKGXOhggTXcn1t/fDmsBWxkZ4i0skgpN+crSZ7Hb21X0sh9jIg?=
 =?us-ascii?Q?VrzJr0kK0lj6mcaP6RLAN2gNFF3xAiD9OBTfv4A6OrtuMJ4pFYsQ2Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kbb4rzRl5FcGlkeg/6RmxgQC9Beko6S+fqNf81/LWBAtG7GmirSKLTR7cjUC?=
 =?us-ascii?Q?VFZc7VffWj+C06cuDbytn1YcFFaoSjqFb1vypPaLYMoBbvxRJg9RraQcLOy0?=
 =?us-ascii?Q?zlA5+7KBnMOk9jA+Of37UWaOrMYdSF+ANW18n1dITzsOAfRZtS9CUMWo+/wP?=
 =?us-ascii?Q?PFAoTsDFOP20tHj12WT5IYRCNY2jlmDHOQT2XhlQZ09ZPNtYYiZ8EkWCXFcZ?=
 =?us-ascii?Q?tsJ5XiSQngyQ6kreUIUpOs4MIf9wqHp1fsa8pLAS7lbbfbcRNdFz/dictY+6?=
 =?us-ascii?Q?cPScv9X56wh6PgJwdmYB3dUlbpopt3lqZTwadW5BDh1YdTzAaiT3z222Dvs1?=
 =?us-ascii?Q?xHLcD9ZSnouQ8/y7m1OR8PDTBqTcgMuASrL5H39pqY7Av0UZ1lOvTxfxqYtT?=
 =?us-ascii?Q?xUJSQDyBFuAHw0mC1SzqJjPWgdnlvzRIj0gO9lWdTjZHGoPG+juEQNBxgidi?=
 =?us-ascii?Q?SUWlPGTeqVfLYO+BTrOCMpEPJs1eORFFCan5vH/n6tTN6RrZdxR/RohrJSWE?=
 =?us-ascii?Q?PPaji7kt3hjs3boT7zIYpRnmDYCtKhJOD7NjlXfufB2/AYPbWihEF5scpkDr?=
 =?us-ascii?Q?/YywcH7oZEBOKURUxsP/KmxNeF8/LnzmT6tIm0A/uwVosB3UxDiEylQT3igQ?=
 =?us-ascii?Q?gxXpIjPV+lokYTPxmchxmwoW2OycfkNY6XGGEVPp3y3D4pem6Z8YJdCXznKW?=
 =?us-ascii?Q?mODSqE0CqJduMLFtAd0toakarA3KUdEukVRMRqDSnTvSTKVkVgDEaynkbkLW?=
 =?us-ascii?Q?l82emP3lMBPwYQF0AFw6UUgxa3EmewBccber8LRIdE6CchEIwMn0tbo+yFX9?=
 =?us-ascii?Q?c0rTDRll+JU0oVF4F7ABNc9b7xI2FDwaHcxRjBHVktdppOCcx28MKlw78xRJ?=
 =?us-ascii?Q?3PiZU3qA2SRvG7MyRhlYhY8dDfg8g9X7d5NRYEzBJ1vCUK52MNV6d5f622Qx?=
 =?us-ascii?Q?6BxEByNAK1Q5VmZqG4Z7oqZoM47RIxvXfyISOKINeeR0yE1kwkytgfumIVd0?=
 =?us-ascii?Q?GA1tVICPcK2T3AVEIkjKsiw/ZN3DGPwnNAsg64h8of0KVLWlMpT+eL2uIQcv?=
 =?us-ascii?Q?XC4Ix6+g+UzzjVro9Nk/aeBfMt/Gk5ZU1eT/5kodxvc6IVc/wOBkBpxUvZgK?=
 =?us-ascii?Q?mgdZbpDqspA3t4qmkkf7c7bUvaibFyIOJwsacX6e2Mj6fEUIpJaQ35V+Nu0u?=
 =?us-ascii?Q?3Vk4vYlgSsMNRR7AGaDCgskcL7J5y5i7a3PlYsJaWxkO2UyiasTe3XMj9IZw?=
 =?us-ascii?Q?TjbNSza0R4IptVE/o260FMeEHKv+0aluccFwj9/qh3q7FmoTLfbJB4A6hC0u?=
 =?us-ascii?Q?5ufN+ptQaCNI0lRdbHZyWNb500HeCem6mrZRBvHTSZGJO6W+P/2k7WdQgZza?=
 =?us-ascii?Q?PItpsjfedTxCiJKNgTCRb8mXdq+L4IbMSaJKLAt1/ht7ViClY6XT0ajtzmwl?=
 =?us-ascii?Q?ShFcUC5OZ5Rsf/ofY/jfOLj8ZJrTh3Enomjp8s1eg97tJRWX5LGXazMKCZG1?=
 =?us-ascii?Q?L0Jxlye+VDt0e4hTAMg/HeoECnzOeTOMEG6bzwVvKzOabQbbCm+KGiNUyWP4?=
 =?us-ascii?Q?C9bcs+EIJDA2CAhgrZ13GWTj93JIWT7IX4kUCgg8HZIbDqKvWZYcxpPXxzW7?=
 =?us-ascii?Q?U50XBJlRpmixQAcNk76E/3U=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd7ae06-e9d7-47c3-9a47-08dd9aaa4b29
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2025 10:03:55.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgp1ukOUuLTfxARpCOULDczJFjDAmTKyxY9ouY7ivCxxyKPEzFQZeSyybMmSlZK6I1rgydEq5cnYXVTCDDZMeY11JC5RLCIzuapnrN9tM9GjLgTac95xg1gJ2Mrwy7Zb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB4228

Add the "st,stm32mp157f-dk2" compatible string to the STM32 SoC
bindings. The MP157F is functionally similar to the MP157C.

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 5fee2f38ff25..ddc9310e7d26 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -117,6 +117,7 @@ properties:
               - st,stm32mp157a-dk1-scmi
               - st,stm32mp157c-dk2
               - st,stm32mp157c-dk2-scmi
+              - st,stm32mp157f-dk2
           - const: st,stm32mp157
 
       - items:
-- 
2.34.1

