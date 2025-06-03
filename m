Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE222A4F8;
	Tue,  3 Jun 2025 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950007; cv=fail; b=grlSoxzoFudd0FGHqxT19ePZyydr4z27s1P11y2tOvJi+CYFOHPsZOHs4P06V+3yIzIdUzo3u1UV6AfL/viJbkd5now/XiJ9hjYe2PlOluqjskB3FxGkbPgTWkBpW/hyWWMW/mDwuuSTOCivG3w5DYyDufjEKtQlND8t8M0Twiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950007; c=relaxed/simple;
	bh=/15TGuHcIdVuqxPmlFF0OuuChZYGLQ3M+jz6tgV+C8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ezhNNw0pohrxKpBwrt3sv5+ID8+H72CSHD84rpaWLjcxkUGDUyJ5xBL/+FEo5SMM0UPyQDJzHAvJrOIVLhsQ554EYzHTeZYHZbJn3lNIolkVydvFDQt2N5hEU9xESIIHrU9h0TTTLLDpkgbc+xli6+63F8jNMjNLnGLalpk6Gj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ETdlIneg; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ETdlIneg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uenWzZIHp4Bm74oh06CjR5yiJDvTsSe+ySTHnw8MnWBTZ4JzayvXLkUiSMoY/sl77/BPKE8orRgsNd1ukMVt2XwApTyC7bJM6KMGihwSeIrtHZ4jiHCM0n7R2nW6+w+G7/jfh1/P5zm5FRvbTFHE3ZiEk6m4EW+fY+21SC9fojAw6s0nKTzVQ4UDEwPjFhDK0YF9skGU9+W5GaSV8GVPUwsd99m1htXCcrG/qpaO5V4s/9tWQ2Eob0nG315VEqNKMkN9BWdciEPS7h9hDsnQSubi7NrAKng2W+q/S/p7G/sSTXhFI5nawCY/4V/AdJTOJcExkUSnp8RUGpiYuB+7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5fwM/ZimC+eGwrX9lY/fSeZMy+te7BMEVAJXixHb8Y=;
 b=lFQ5r+P/4Lk8TDb4MXUA1J37j0fyDAq2OiXujkPAyyVBL5Qdl3lEK+oMHIlUEBWJq1wNFVpdq9gkeNBZ7dBIsOWHZd4h+9eEDqlriCXMx5z6Z9VbXMPp6Ik7xUzLBqbRx9BOLcRSjB+YRVrdiQcregf8YyuywSyYckHQa6pf2Kdjrm8xxdGryICXtUjAQBEapz4nRXi/wrxlO3OF5LxmLzwcFPD1uBcIQNLK9bxELDCAzaS3SBbovtN7zQiP0KqXD1ZOgsludjeFVLxGkYaxsJZG+yUfa6gxroiHQnUSw+lM0iIi+H7HLzmjbiGc68fTLX+Td0fnzrfG2eR2Wrfntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5fwM/ZimC+eGwrX9lY/fSeZMy+te7BMEVAJXixHb8Y=;
 b=ETdlInegHYJgDcrIEcnrK79Tl7bCE7N69ECyEdaveviHNVpJk8JNGsfI5BsRxOpU4TXzdH1s7v5mPatAumJ2VpGFZMkEgK7poHQkNtRLfIWzDGwaWeWKo8rtnzwxIOjx6zGcmlvgTFixcCjS2J4677B+Q/aqueF+ZikVIn7Mupx60h3wOIFNN7jD61IeXWdrJsubLwH3xagAKsHVtnMTtXQBESHj1oCJw85aEEUBhGMRUfMseGcc54CfBnZoWsOoYmbcHDEs6TYmyosh/6NrOi2WDYw9ziDPVmdZVfYDnEHcisod3RoTfN8r/M20rGp47+602ZMUbcCZJ6GYYxf4rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by GV1PR04MB10079.eurprd04.prod.outlook.com (2603:10a6:150:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 11:26:41 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%4]) with mapi id 15.20.8769.035; Tue, 3 Jun 2025
 11:26:41 +0000
From: florin.leotescu@oss.nxp.com
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com,
	carlos.song@nxp.com,
	daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com
Subject: [PATCH 1/4] hwmon: emc2305: Add support for PWM frequency, polarity and output
Date: Tue,  3 Jun 2025 14:31:22 +0300
Message-Id: <20250603113125.3175103-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0019.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::19) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|GV1PR04MB10079:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c588fa-79e0-46a9-bd1b-08dda29182f9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Vg8M3HV/j+FzGy/OQ6nB4VaA2yJC3QB9rSFQ23DjFqXye6gwyB+FhvS5RI?=
 =?iso-8859-1?Q?ig4SGlL2G3m+Yub1C/D0qoXMKOESigEu62HKW5LETUnsgg6EO8OCaqf5Jc?=
 =?iso-8859-1?Q?FFvXsovCJ3JhfVQZoVcezH6v0fLnINWWUKhruiolaqxzAfhgYexTRfNu8K?=
 =?iso-8859-1?Q?SMrHensWh2AHXRI1/rl5u0hWVHcBhUgwbxpaY1KfK2h8t7lKdDJxHN10JT?=
 =?iso-8859-1?Q?5fq7b8YE3g2QN0LnHy7AGBv/9hRopPfobBZTKUZbD9ZhkuvT2SddVGoNmL?=
 =?iso-8859-1?Q?tFrBfO54LOpCfGZy9CNeNXUkcGVxgdPq5D0k6VFnqCrzOyxSA72iOG77dk?=
 =?iso-8859-1?Q?Y4ykpEPk8HmtD6NPlnhOjJfzuWuONqqCldocbvBdIUW+KBpU3AqG3gx/ng?=
 =?iso-8859-1?Q?dqNjS2D2ukJwV1pHqXLF1U9j7Azif2ALCLxWrZHgGBhI22Se1i3sujkHzF?=
 =?iso-8859-1?Q?xlnFNvJcCNLahY5xkZ/XQAglel6lbzxA3nE71Jh1fVZidajNMD3IELZx/d?=
 =?iso-8859-1?Q?JWmAuI7n7h0ZrpZ0jMvczgEhM4lhvBcycezlBQSqVaL23Cbslr/ufWy1F2?=
 =?iso-8859-1?Q?fUC58cEwA0Aj/CfT9FuRRrt1tB94VZgMA5evvPrKxgAnd9T+qku+yIz4xd?=
 =?iso-8859-1?Q?QLQ6vWuDddNcemb9BT8Y5WdlEiCnI2ORG2rsgciw5lX80Habi9rfcCOyfd?=
 =?iso-8859-1?Q?R6lPsPeOt/yMWSvbCyWyLyx+eu9608xwrrR1K0bvDw1jTpq46fd0nHAbGW?=
 =?iso-8859-1?Q?yVK6g8WIfX1Y8BPBgT25soLOk+I5gmP+GjF+VMw9CCIqaaE+vldQne503W?=
 =?iso-8859-1?Q?DmUvCegAPluFh4S0hz7Ec4juSbmOgQvUo9K3CM78Ja3tncD2YTakdKdomQ?=
 =?iso-8859-1?Q?3P/PuK45rSyzjmalraAiJZ+XwZ7aEYEeA9vRBDViUlYx2LKTFC8kG2myur?=
 =?iso-8859-1?Q?HlufMubfGvw8rwPwvf4hImix79UX47ndwPB3G3pfZH+BdZYaLXqh3qKzcY?=
 =?iso-8859-1?Q?I7eSGKHd+fSzr18FX2pZF99Wv5QavpeHLb4r7GQFSoP9buBGH8s4y66MjT?=
 =?iso-8859-1?Q?DeumN9E7wbOq+ZFyHB2az2DhSG30lzmMQC/mzIIlHmWsiiqkY3NlyqOHH0?=
 =?iso-8859-1?Q?mjE+MCfQp8bvUMp1UqiDJb5dLtdkqOFBxOIzYRsKRo7xNN8wWprL2LvgeJ?=
 =?iso-8859-1?Q?IwFqmJBn3MKv4cnRrrBBuNYkSZCttsZupG89n8amH0pRMust7V7jfvX4vl?=
 =?iso-8859-1?Q?tdHqV+kEFnZagQZ+i812wPM+01jEh72LBLdq8Jy+RQyGgrjGcyfYZ+Bb9o?=
 =?iso-8859-1?Q?wjsA5pg1l269NOeYhmXme9aSKoQHj65NqmF3W5dsKWgShIxuk9aBWoSssu?=
 =?iso-8859-1?Q?v7031LSS80G7zDyH6YJnVILKMo8rJNT5jJ6cT29OQzhIWEFXNCi5vQSpMn?=
 =?iso-8859-1?Q?XKo92Hm4QXU5eYXs5AL397FSdRrgNLgAiTm+bztH1xNoDcd5O03x/pcqh3?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Ru/Su2PTwTVp4FIxVFj5piSsLnR4M0uxFDlaFUJRR/5MSpXfsZq/J1C3s7?=
 =?iso-8859-1?Q?OsWIQLipfEi44nmn7hxxGuqRDAB+CikZ3ZCbbo2xaoeiN/lYsDdWO/S6hD?=
 =?iso-8859-1?Q?Q501x3plaQQGOrL5MSL+kBloxjx87c2I7vGf2SWsoR4sjPgjOKWqwa/sKN?=
 =?iso-8859-1?Q?7aD8GZt6ltqpTLXfbXM9nzWuYE+gNR89KXF+u7yI4ey9WSxZl7IZKxTzko?=
 =?iso-8859-1?Q?NVAh7tV2SCoND1IiAiuXZ8fGxI8nf9NDrAusMoSO6bTFxzqqcxdzIBf1ky?=
 =?iso-8859-1?Q?ofYr7ILsxTzAjVfNu82cTcaHhZdU1+oa1P4E9g5HRiCtbmgpmBEpVZUP/f?=
 =?iso-8859-1?Q?qRTzLyuZHn4Wa9sy9IHrKXgFnzu651ACjV/JgseJmlfGVXsTcPZ0lVtWYL?=
 =?iso-8859-1?Q?kmnBNZkhsUVxxHpqqBgaV96+rtf8vOtYKCkQBZzTHc6lqhuJ18vwCxm1u+?=
 =?iso-8859-1?Q?021/6Wm8JZmc/3csJuUlovzPjuhiG/UbiLFhjb+NFG8zx3OzOl9R7lbOEz?=
 =?iso-8859-1?Q?cmLx8Pwe4m4JVK5VpGmrWwwbRreK0Ph41cAtNaYGUOKjrHik8QB0HEAWEK?=
 =?iso-8859-1?Q?jbKq5LWv3lEK2BlbWm/H2YGSWlJrH6Bvby6plBq2uKN0glxvUBXylHQGod?=
 =?iso-8859-1?Q?LMInX/2AYlMIlgyeOoNab+oBScUuzuN0sEd5FoxYadBLmDPiPODvTyUS54?=
 =?iso-8859-1?Q?wJqBxBy9gPWF8wAAnHCC0KW2o7KC2lVD209u0vlvw8aRnrFEo6s1pmmi7E?=
 =?iso-8859-1?Q?/zXh8cR+sfYiJLPi8ppBCeFKvT/fu7cn6N5ozNhKUQUtyaIPbtZiLFqw2F?=
 =?iso-8859-1?Q?Ks9rtTUTYdC2melACWMsAErvVYVnMW0tXrq9dwLFjcUuNein0xYlzhrj5p?=
 =?iso-8859-1?Q?hp88Q3I2esvZcp4EojNv+3gOThO0zaV9ABfJrLQZmnkd3v2+01BHxA/nUa?=
 =?iso-8859-1?Q?P3V0YFxav6VUfY7nntmmxWZu8pZZa5lnyNzwV6WRqzRXO0sX3Hvj+5/egq?=
 =?iso-8859-1?Q?EQfr4EGJK+mjkUo/ATBb4TCNxnL2q51DYX4gjsjoo8wVR2J1NzeB4bb49D?=
 =?iso-8859-1?Q?haDXhIh1pn1aUABmZwDkhr6c1hFHIaYZu3TtbV17L+CSUFUTpEoBGAxuYF?=
 =?iso-8859-1?Q?03QOpJ7NDgCaKowCRLhVPDgDtazQtmEBlSaMLoc7bAo3n+UYi1iU4rRL0r?=
 =?iso-8859-1?Q?tfFi5Huk3OCCS7AGMpxXp8j0YXV2yFwA+h0EJsAZmn1Bgl80cnbLh43xiX?=
 =?iso-8859-1?Q?oO2PVuhrLRuewuOSpHRTzfpbop7V5qxufcpEbBg3znJQd1jwznK/TY/OI+?=
 =?iso-8859-1?Q?ZzvnJcxv+nsESsXikwKhkaE+rvVw8aXd6nT1IyQS5s4liMgjlGSNH6YYeN?=
 =?iso-8859-1?Q?xXaXv6fJKGxC4G+F0TeZEgOsRpwIDXI4nOh9d9Prjtv4VuG1SQQzperlgr?=
 =?iso-8859-1?Q?FevDh4RO3iHrg1diqw3jwKiau3mEVBlJ46RbaLLNfWxkeHzJFtFzY+PWcw?=
 =?iso-8859-1?Q?Oiktxd/bQC3DX6WUesZZfkusnFJWpQvITYHzArX+f3NmiLD3nsXEG+a8+3?=
 =?iso-8859-1?Q?X3RcMZMqJAgNEaWgDPPKdiE/331zw0IPV1+CCmgT82NizPOFldBuHswKF/?=
 =?iso-8859-1?Q?uorODC3CZ5J9pmD+v/Nt7w942UzlfrLM3yEsJGaw/VTWSPGCjuRbw6yw?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c588fa-79e0-46a9-bd1b-08dda29182f9
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:26:41.0849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4E0t6v/nmQB8Ik4kGxUIa3eyE0TZP0+5R74VWPBgdt4Q7sVdGbgY6YVXiC2tGnsavXu2MOhNWgRzWerAxHZ1zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10079

From: Florin Leotescu <florin.leotescu@nxp.com>

Add three new attributes to the driver data structures to support
configuration of PWM frequency, PWM polarity and PWM output config.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c               | 6 ++++++
 include/linux/platform_data/emc2305.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 234c54956a4b..8fc4fcf8a063 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -89,8 +89,11 @@ struct emc2305_cdev_data {
  * @hwmon_dev: hwmon device
  * @max_state: maximum cooling state of the cooling device
  * @pwm_num: number of PWM channels
+ * @pwm_output_mask: PWM output mask
+ * @pwm_polarity_mask: PWM polarity mask
  * @pwm_separate: separate PWM settings for every channel
  * @pwm_min: array of minimum PWM per channel
+ * @pwm_freq: array of PWM frequency per channel
  * @cdev_data: array of cooling devices data
  */
 struct emc2305_data {
@@ -98,8 +101,11 @@ struct emc2305_data {
 	struct device *hwmon_dev;
 	u8 max_state;
 	u8 pwm_num;
+	u8 pwm_output_mask;
+	u8 pwm_polarity_mask;
 	bool pwm_separate;
 	u8 pwm_min[EMC2305_PWM_MAX];
+	u16 pwm_freq[EMC2305_PWM_MAX];
 	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
 };
 
diff --git a/include/linux/platform_data/emc2305.h b/include/linux/platform_data/emc2305.h
index 54d672dd6f7d..76043a97f975 100644
--- a/include/linux/platform_data/emc2305.h
+++ b/include/linux/platform_data/emc2305.h
@@ -9,14 +9,20 @@
  * struct emc2305_platform_data - EMC2305 driver platform data
  * @max_state: maximum cooling state of the cooling device;
  * @pwm_num: number of active channels;
+ * @pwm_output_mask: PWM output mask
+ * @pwm_polarity_mask: PWM polarity mask
  * @pwm_separate: separate PWM settings for every channel;
  * @pwm_min: array of minimum PWM per channel;
+ * @pwm_freq: array of PWM frequency per channel
  */
 struct emc2305_platform_data {
 	u8 max_state;
 	u8 pwm_num;
+	u8 pwm_output_mask;
+	u8 pwm_polarity_mask;
 	bool pwm_separate;
 	u8 pwm_min[EMC2305_PWM_MAX];
+	u16 pwm_freq[EMC2305_PWM_MAX];
 };
 
 #endif
-- 
2.34.1

