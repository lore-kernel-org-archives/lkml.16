Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11021091.outbound.protection.outlook.com [40.93.194.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6646B1EFF88;
	Thu, 10 Apr 2025 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308310; cv=fail; b=ZrvG5ekctWPJrpTvWZz8hkzejhGSOq+WnRWJ6wsfyhU3g7pkb1hXJzszaCX0SpCSF5u4QMDou36YIslrIA5KWYeuDfsGGsv1Y9TOsh9zDdpK718EIcm0tbb+VyfBgGpY0mL/xyZsIOYY00u9Xx8puG0hpFDkrP+4htaLzHIfSnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308310; c=relaxed/simple;
	bh=pNWM3RpE+IZFqx44v3IdQjFaAp9cvQ4+2j7yYHtXqY4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jmWFKPueLD8ecza1UZuzrsXcLwcu4CB1wPPQWHll+evAnEU55yw/GHRa/OpLUivthFRiDv8cZRS0gXWD/+Bbtn/maFIcEc08MYEUr1aO2HKsKrmppLSAXJxEaJANb9jtxLqOFz7XxX5J9zCjSHu/Y1AtuVM9c0R9Thsxl+1qnGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=qZQj7TI1; arc=fail smtp.client-ip=40.93.194.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="qZQj7TI1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGi7ldCAybXT4y1/XE8q8SL6HiihbRhHg6dtYO8or6Bx1NnBxK9TeFRyCQjD6BH6GbAxVBaslQdD5GQM7VTsrlWFhzq88QwPBUtlUAG6Z51Wy1qBloPxlGXW+5cl4C3JZL0aMCE27wD3vSe+aiY7fyglI6tJYVls6eKF8Gi/Yr86940KyXKg0FjPdIwyC7LAMFabgMYca1/ft9g/WE7VNCtU0uMgBI5oWGvifZ+bXzRxeQgoK7ZoU+qSKwFmvSr50FY2hPBN67vzBfY588vZAqCW4n5VHWRIIiUopmIbHB2HSlIpIaUp7oC5N+1X5AWJQNE6Hm3OFXacfNFSGaIpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPszzi0Bdt/pye+yPTFbJBijSeM6Rz3jQKxvpow5WNY=;
 b=FEdnxdFR/WQwvYZCaKY6ub08tg41ODvuebYhMTVK+ByKloaKBE3qUhbR+Y0mHd8m92qNasL2AumoOilK7XXcUL487fVnDx7+rkpO8pX1gHcwJcN0+lTPXBjIPjX4egOdYTo99lYABpcFjf88+BGQbzic/ibjgsFwwhCIvIkhacGBFFxsP69RwHOESO5hDCwAK1OrSW+Is2FGTXWzxYyxSAxOb+eeVMMnrg1FkjJtquVO33xgbghbfZcwHbcDvT4A9FSH6wqKi4IsO/0tFxQ0/ExIzS38R9uJg/scF2pr18jqUrIih29fEgl5hruIVrQ71lpt/4aWkiVC3kQeNxkNqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPszzi0Bdt/pye+yPTFbJBijSeM6Rz3jQKxvpow5WNY=;
 b=qZQj7TI1/sbu9HZa8yHKJgCxeoXIJIzp0+bBTOg+EBtBeDPevqFAl8KB/6OrnEJGuf7/lwyUu5LcKB9tbK6ya+ir8Wx9HPqcMlxozr5wxL3fhj+zrBqSda7n1KJpyomS3RpPm6UxWGgIPK2x9+RP5lWSYnSK+tRE3kT7moxDva8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by IA3PR08MB10430.namprd08.prod.outlook.com (2603:10b6:208:505::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 18:05:04 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%7]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 18:05:03 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pwm-fan) disable threaded interrupts
Date: Thu, 10 Apr 2025 19:03:57 +0100
Message-ID: <20250410180357.2258822-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0294.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::18) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|IA3PR08MB10430:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5f29f1-0524-4bf9-9407-08dd785a37d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H3MsuIEl1FIM1DIqUO6GjCyOBrWg7j0HGzP5smaRn0zAqHeeMIf+HtdP0cOI?=
 =?us-ascii?Q?0P7m/kiYfZFyF5R1VagqXypVdBbajTqKk1XuoaQKepSFlJhyj+Lz6AQznoSD?=
 =?us-ascii?Q?f6X1cBUDqRQCwEMVKusZB9YrvDi/Vw6oEMqu8Umc4zzJpI7Up5Yy5I0grHTx?=
 =?us-ascii?Q?SkyMIx1LI8la6w1VTOWjSPDJoAFaRuRb+pSH2qTVO67XYM3N6yTTMDU3Sday?=
 =?us-ascii?Q?EksAGo6l9RCDb94CriwIyRV2OKqTswIA1vWemf4aos2x3/X5Q3NPdhwmavWf?=
 =?us-ascii?Q?lRG/ulyBPspreRc+QzlEmSAhydBY9zq8uxZbevmARXcAp3GaLCUWjKTs4WrK?=
 =?us-ascii?Q?WqmiS2qI48Se9FdaB3hn4ZYNItZBtDPdhQQy5C2jHRXXrzp3jQueXPAzxCvl?=
 =?us-ascii?Q?Dh/B70X4KVTbuqRp0LE2bz2GWwHPLWklbj1zJ4JNcHJhOlUtPiZ4RZlL4xJM?=
 =?us-ascii?Q?zOUZhOuScTKz1y2wO6EVqLetZUuPQ+GXvnzxFb20jPWEQnqPBHUDF3MgUFal?=
 =?us-ascii?Q?GY2KsnWuVEKwHfwOoAjGDv2o7zz6AegdqdoGGVpgWcE6dGxoSg04jdhmWNiB?=
 =?us-ascii?Q?8yRSqQrD/fvayiKwagYOV01FRfxw7znNVFO+VsrmmanGAMCTjGiBQx++ePul?=
 =?us-ascii?Q?/WjUOe/4NodjPeoDEFytje/FPD0AiwERGGMGWl7h7xykakx3U+YFpUk0VAQc?=
 =?us-ascii?Q?NScGzViSodBycEX9iZi+glZKTj70Dds0qKYM6rFtGp03ODw2QacCrCaY1zKd?=
 =?us-ascii?Q?NNvvQK1sqSe1OUlcL16k7BIDpaT7q/cGwPiY4qJlOj/h15E1ORecfqNKFj7q?=
 =?us-ascii?Q?RhxbXemNiBNwRtvAy3NMDWY3hI2zK6N03s39BVemz+TiAEiBoabai3u4prPq?=
 =?us-ascii?Q?LVLIZ+4hNQQ/aOa/PO+eUf+UJYJKA19rW0LK++7+uENMGyLEWDDXN6w9eGQF?=
 =?us-ascii?Q?DreO8OYoLChLIns4F5GZAxx13mZ8mcthC3JkkkgEZ++RrSksEUqtzCqWEMZR?=
 =?us-ascii?Q?c7Xe/6fS86unblrIF3tMWyx6ymW1wSvQioweGsEUj67+ZrwIKDrsjkdDsHIK?=
 =?us-ascii?Q?wyksnV62t42/sSOiZhNoXKzDxNC7oI7AwqwYFkD5jshxUySr/6FqgpuNy17A?=
 =?us-ascii?Q?vPW+NBz9qwls1rWCT2tKrZzGasub1prvAMlCFqNzMH/Bc8/4Ag63yLFsbH3m?=
 =?us-ascii?Q?n1mL1vAkQAfCgTV7CWfVDBmT03cVZ52AeG/8TC5C0A711Z6o6wVAp8k3FEUC?=
 =?us-ascii?Q?GvtZX/QxRI9CYpXcXKozpJBf8a6UsCEwiVN4OU9Kd6moApQbkiOq95mzXF7/?=
 =?us-ascii?Q?8dDYC6W7D1O9ER5UQPzyRvH7MhlgOhQNVt17nNOhUvWalms0ob4eFqHeeaa0?=
 =?us-ascii?Q?X9x4CLWHEVBLzwWs8TmqnxdqpiwhQiWO4/8un5O1gH2xub1aG66hwJD8duQx?=
 =?us-ascii?Q?Z/NFcNRfdtyHpyyyApRN2TnX0AhWTENg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ib45xYkANDBl5WMnRY0kFlH4vxUEVMpjWGpPQNOV99RhRU7p5682CzdPRyB?=
 =?us-ascii?Q?0PIeHZblRizXVUsVaYhZORDCwsdlPIwcmVvf9bJ13XPmvlYK4G4LYPDYA7c2?=
 =?us-ascii?Q?eldJFtW5MfMrd5BXuiqUoIBce1pt4tktWVWO6uyHXP+LzNPTRQpHF15M1MxE?=
 =?us-ascii?Q?lRN8ZGs95miZVWn7VRifHtJ1PqOq9I9FOG+elly4yRgCE1K7CJWDZ557M9Tm?=
 =?us-ascii?Q?QsFsCQMx79Kq12GLpPxlFMJRJG4JxNDtWr0+8MZ6c4w9gSxZa0qtRI7qErSw?=
 =?us-ascii?Q?CX5Jyh9c3bU/JK2YJbzVPiuvdxukMmCRuM73+gwelCUTrfZ87mM+MBmAiEhS?=
 =?us-ascii?Q?aV5gSyUD8HuqngbZ+ROuZfZGEDpM7IQU/baCJgy0HtidQESAyxngOMYuhAaC?=
 =?us-ascii?Q?UtR1dgbvz9g2xWpDYg0eCxdsRs5wbdhd9RsUN+M5o4dgzX+8afsS14Ohl0bq?=
 =?us-ascii?Q?RbfjdzRMexO70kqnmuByGXa0PkpZc2YPisbyhAmCv2L2F+7WRWvYUXuurwK5?=
 =?us-ascii?Q?LhcEE4kAC+CG3GJ4PEYXGsuSqvdwQBpKZvDuVgOrFoHBAFpE9bE96P/1x+oa?=
 =?us-ascii?Q?l1gknK+ayAZugUJ4fNe8EiisKAOOeg0fY/h7bcfHwZF74evZNQ8LMJCDchBO?=
 =?us-ascii?Q?YafoQi2a+i0L7GZII2WSmAOIuwXn8K4zdMpml3EYFd5/apUjUbabUmKjQYpt?=
 =?us-ascii?Q?VMshRCGny3OlHXvoCXLBOwzPpBAL4mYps2OpT+ksQiKu+LWLC5Bs8U4DAfAl?=
 =?us-ascii?Q?4rs+oVt24LVhmeTEOLgyI/OFoNeJ8azij9jvq+HFJHX1ws6cWDi1MfKrUUry?=
 =?us-ascii?Q?KN49pNEX0VvmF0zHLCKpwcvwGQOdIS7Suu5GSU1CeQPjlfOhlB+CoP/5mZ+i?=
 =?us-ascii?Q?8CLJ/XbUtQNCOq3Q0av+taE4pI7GLj2AMyKliRX3gN0X+PJb30nwnEfRIIT+?=
 =?us-ascii?Q?uyt/dKuCwVITh/517MiZXEoilcq3XF72wNv0vSrPHrB4iVLfLYG2FhMOkqjX?=
 =?us-ascii?Q?cTB8RKhaSzz3EA8DWnnWcmY1lU9cLx5WloweWDVD9CZMnlPfLiWgcwhgeOZN?=
 =?us-ascii?Q?nfiydiNxf5ITcNDTWunmBCsKOtzXgqeqsIhIvbogpDvWurSp8HlJhMaP5SNy?=
 =?us-ascii?Q?lIcqjp18aHwBDbK5glI13OiokgXeo4MB4Z2cI/0oCXAeBlLWmhexlcsh8V7U?=
 =?us-ascii?Q?UVKBRQykfPEI2t9p/gGS3dcc3DhrpzWdVOEY8LdXXuTNYS93VKPCTqqWSyIn?=
 =?us-ascii?Q?9IdNQ24/Bg+stHkqX7tg47d5pZKFMb/IEquw9BhCYlxLftdJcTCRoqFe18+L?=
 =?us-ascii?Q?yU77N/SgVNAjFKsgC81AhB4ZU0Z/LCdU33CSzFdZo2Btyn7dE00WpG9lSXuJ?=
 =?us-ascii?Q?r6uizvnLCO6dm5g0Fo8Kw0hP+Xv+NFW3bYAVYI4LlPwZ2wE+RFO1yHZ+gJUB?=
 =?us-ascii?Q?jVtsNeVqQBTqJesD2weJy4nKSZCzV/xmUShWVegSJCzvr4sSo39ubxKgUB6U?=
 =?us-ascii?Q?Xj01YFncvuaZk3kjAUnOCql1z5AwVz2ebDZw81XAlDn5PCtf+QLSymvPRV8W?=
 =?us-ascii?Q?DySnrkElYdmW6vtXzexad4U9M+JfmcjDKQwxMnMy0jjKb/+uiNg0jvUadQys?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5f29f1-0524-4bf9-9407-08dd785a37d1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:05:03.8768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfaCjyuzRXS7HECofby/4c9P2t2HSFI8/h30NfADzvMe/n+looIPt6yd4f7LCNwLDhyve3R6e83o46ossEIkDPJCWUx02IGtKZIFYy0olJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR08MB10430

The interrupt handler here just increments an atomic counter, jumping to
a threaded handler risks missing tachometer pulses and is likely to be
more expensive than the simple atomic increment.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/hwmon/pwm-fan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index d506a5e7e033d..2df294793f6ee 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -620,8 +620,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		if (tach->irq == -EPROBE_DEFER)
 			return tach->irq;
 		if (tach->irq > 0) {
-			ret = devm_request_irq(dev, tach->irq, pulse_handler, 0,
-					       pdev->name, tach);
+			ret = devm_request_irq(dev, tach->irq, pulse_handler,
+					       IRQF_NO_THREAD, pdev->name, tach);
 			if (ret) {
 				dev_err(dev,
 					"Failed to request interrupt: %d\n",
-- 
2.49.0

