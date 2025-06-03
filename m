Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D2122F39B;
	Tue,  3 Jun 2025 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950014; cv=fail; b=HIQeJ1MDXVGNF0d2wAfL+pJg2BlEH18K87AmtTKYEg7HWJ49Y212ReZeeQYQ5cTSacJgUINovGUzlMTL5f43WrpbMeFTH+JAfj1xY/vsC/0Lh0/YwVjieSPD7sJiupoVLzSb4ZQe6DIM39RzMvvLWhJ+PuaicTI2NUJpFQ8K4LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950014; c=relaxed/simple;
	bh=8U4SvROMkSjC4PEXp9i/E8Pp6GcNBWzBoy/s5OFI1PM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bVc3bV5pKyEihqmhWkJW9SUiQvg9gjTWZ8JmTCRLwFCLNstLX29ZFVWS5sLS54pF65PNCQ3AO6MWE23+ATTBNpbTVAIoggsaOHd+64FE1sHQGGzqUAAZANOeNZxPzAWSf/NLnI7vzCRlIZXNdTRnbT5OJ8gnBj+ScmHI4ofNk/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GCSkXgPR; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GCSkXgPR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeOux3KZl0ZTwd61puu+/m8JallQiZRCUX5p8fRiBYbTHkHBgWhIFdCdmMU7LkNIKtydRaP/27lQxBHOr17zDaOmP8ffgKuki1VoOEgr2NNJ5y/APDhDle/8YSxntz+tM4Q84Y6IytWhpLR6FtHgvfEDMDxS6X7A2IVrJySwUcDkYp2cL37H5ml3hBx8Kf568DW0WLZKRl6rYB456CzSBs6GmFaG19DyiRUyfzBdTSwZVdvj8IZ8FSX75wZuqYRlN4c+ATNXKCJgyY8qVbnnx7Veuf4UkRiPpmKr6m+0PM6xAo+ppLUTNgBgyxVzER5H627JPIOl/eMLsOMFhYsc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nm1E+R+L9UnncfifsNBCAzR4xiI/U5o7ho+UPyXbeP8=;
 b=cCwCtJGfJIu9ULib4arvm9KOp1W9VaGwmyhg2jSYnfloLIYnRj9sDYC266m6EUU2GuBAt72Gs5WLtea6MR/BbmEvyu/sjKoVn/USkyZcYOj/P7CYTJeTLf8/co18Q4m9hImXnrBeUkPl/Ub2mK/3Ub76wixXnvdUB9UHFI9xG4WOvTp4vhSo5y3DtWnK4lV14HaiKvDM51QSLLS+mrmkZTz5FIjmvxHWZ5rtOaL367HKfJmtp4+TZhbYOoy5aqEjmI1obUbVlPn13VTndBbgU5xffqhoxTvmOu0r8rril7OntLlXq/sCsseFFpM+aE1hiQsQ2z6cMvbhiQmZuN8aDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm1E+R+L9UnncfifsNBCAzR4xiI/U5o7ho+UPyXbeP8=;
 b=GCSkXgPRsJWFSqDUEG3SETWM1Wbr/i0D6JF329qho/y+REpnAZ+pSxnIbaanzdv4SFRC08WsyUdA2z1c1kOMTsu82qrHkIedqQOePPDgPdbu/TQ/sibm+SHAhH53faDJscWftQhH/ZoCW1F0MWLV/g+ylMuiOM59KRjzHHlUytX2ZLzmcH8O4GWC9Hnn0UV9rRzKfn6InEENpvi7Pdwpyj11TeXhilJSEHHhN3D5uBAe779yst2PhOsB4rX+bi/FzCd98C2lrO5dtjCYg40CZICV7u45GxGIFwwbVeQOiJ2GffHZ/6hyzObb8zWunHtoex6pt+sQw6bVaWDc3auQ8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by GV1PR04MB10079.eurprd04.prod.outlook.com (2603:10a6:150:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 11:26:48 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%4]) with mapi id 15.20.8769.035; Tue, 3 Jun 2025
 11:26:48 +0000
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
Subject: [PATCH 4/4] hwmon: emc2305: Set initial PWM minimum value during probe based on thermal state
Date: Tue,  3 Jun 2025 14:31:25 +0300
Message-Id: <20250603113125.3175103-5-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::26) To DU7PR04MB11163.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: cfe9cb71-aa1c-4dc8-60fa-08dda29186f6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?h8h6kAl10o3XwCyDLin/czJpK9vEJhSdQ3S7VNTYuqwqEUzzkY1H0lNpOa?=
 =?iso-8859-1?Q?KKBybIGHMGvsb6NAmQUNN4D9s+DGy5RFasO7vGdD48/3ZmP4I73AI/ZQD8?=
 =?iso-8859-1?Q?m8Wj8zrrPcX9Q8+qaeY5YXIy3wi/zd2Tsg1N/gbNTlL+HgMPNyqeDLRZ3U?=
 =?iso-8859-1?Q?yVZNCqK62ZWISW61S/e2qUQAy/hto5haIUxghYI5g8sKDYSPm5wAgrWnQI?=
 =?iso-8859-1?Q?4cO50ke365v0P/md761p+JKOh2JfU/0ElCRf8bK6BPx5A1msatFLsXZUpY?=
 =?iso-8859-1?Q?q7Q8JQr+z641naDpdlprynMI3qGjwvTHXnL8BByfiG3In01Y8ZhuRA4n0m?=
 =?iso-8859-1?Q?RDlRtTN0ruXAoWoEMJhUFNlG6pnZrq/c6Vxct93VdAQ7+kmb5TkH/rBnNX?=
 =?iso-8859-1?Q?3S2bH6LNPSf/pDgk4jQ1nqfD48xr7BBNDA2mfFP8AtBuQ0FTisMgra8L/u?=
 =?iso-8859-1?Q?BGftg9UYq+R7Cg2wmglyWx/VUx5/DcKn9Ik/skTPTHTkTdXkhd9bO4wOq4?=
 =?iso-8859-1?Q?3F2mReM6o2Jw84tvuoDR0bT/EoKRsXqIZonA8ANV2JoGuqS1LvBadqZ1nZ?=
 =?iso-8859-1?Q?w4Qbb3sPm9Fl5/67agpzlMMabsgYuI87tVfvvaoQn4KwTPOc7CAyUck8cw?=
 =?iso-8859-1?Q?eQWwQ6owweHm8A+GhF7EWS22l4ydSNQP1BdLIKFhENN0zH3S0gLKv0A9yW?=
 =?iso-8859-1?Q?PSqRixUsG7xNSY6bHwMs94LEJIgnrvIszqrKIHBghIdhV5ewEEjM+LP+kq?=
 =?iso-8859-1?Q?EfgvVR/4tAmxSGHVchGA3ymqgeGkBMxGrQ85CMRabd9Ee4Oymg+DrzBAaW?=
 =?iso-8859-1?Q?Zwoh6E2nN8DmZsEOhQScjWLUW/4SrnTZw1I6wJ4Yt8QMwq74tk3UKfhZYw?=
 =?iso-8859-1?Q?vFXndyLShINspLFvtUEFd6hr4NWX6N11Z+LCI4qFxfongCsuCjpEW00ztA?=
 =?iso-8859-1?Q?EDr2ak8/v2oOJEjDaajrg6wbEVPxYmZ5hOXxo2mlJMVrmTEWZxHulq/4CD?=
 =?iso-8859-1?Q?pTG5XzqA7XiWZaQ4mR1HQKEFUQq6+SesBFhjAAh5qa13BXXslMMRUdNPoH?=
 =?iso-8859-1?Q?u198n8Zx96R6u34M+uKi3v9aRS+rPwWW76Eg5VVkxaIsp/H5zbLmt6YJhe?=
 =?iso-8859-1?Q?5Q37c5urDyW6MhwjiROEcmgqoJdtPXbgiRr75s7V7y71m0QidPlz4k+6vd?=
 =?iso-8859-1?Q?b93oziPStQgTn58WxRZ+yRCtZ29dhp9Ple22E1AXoPJRwcN9d3HeQgkML8?=
 =?iso-8859-1?Q?hGzZIhfY39tegc/JMSiJAPYqLyVZYp/3mrs5vvdO4V/hytdLfIxx2sYiVG?=
 =?iso-8859-1?Q?BH1hKCQXAw6IYbd1eI+dqJKr9FFND6VyAYBV54noPxGZlNob6ZgA/RkKX9?=
 =?iso-8859-1?Q?NAdLpKsILOdTpC+8L2B7FSCJDvXRghnBQJVk8cijXNXmD1NQv2tuFvKiUT?=
 =?iso-8859-1?Q?sctdcK95dqvFn08V/jieUgeSG9qCQd1l3KlS8xH6srb5e3DH3Xyzqfz43q?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0jTEsVnS0g6ssrK1AAGpoeUt0LeoNoj8wegOo1RB0ol3aw1idSfFxdbJMI?=
 =?iso-8859-1?Q?miNP8n+kA4PTDmJeb8T7qnJ+mq/ezRmYf7jGUcQMpdmh1GCLsVV/sl9hKf?=
 =?iso-8859-1?Q?lC3ae8cmD4i0RiRncn+WfjdmVZvU0AQEWC0bkeR20JOOcvMdPm2P992TrE?=
 =?iso-8859-1?Q?z0geyDJP6pi8wHLcigiYPXzNg1QLrWLtjkA9wuepBoS1FcTw/paFIcXvLR?=
 =?iso-8859-1?Q?iplmpGiyNvpldLlGpc5gKNCGmJPqYkyQGpr+uU9YuBOcJvIn7Bex9KcQYz?=
 =?iso-8859-1?Q?WCsRWRmVL0UU/oK79yLVENYCBfb+LalC3fjKoo3egaqy3+8p2E91577Y+5?=
 =?iso-8859-1?Q?Zr2D+0sBDNV2zHIFFrui6inDKnObbXNSEN+RAnFwd6LPqWRZV4TKgTZXRJ?=
 =?iso-8859-1?Q?zkdiA5yhjpREQYNVV2JwQFoLrpDgv0bqpOkLE1qz1zUxnIHaGARJTmGZGW?=
 =?iso-8859-1?Q?rWuFsMqdU1Stwd/x6rG7i+fRma/J2kyICiQa7Ez3bRttMNX+ze0zmDwVss?=
 =?iso-8859-1?Q?ek/Tn6ywZLtIqVIQ8SHrioQGMmAXnbtjfQsKS1g8+pMHYhjOagkQYiiN1R?=
 =?iso-8859-1?Q?9V+20Nw85rjWm1HpOdzOAzpyABFGXrAgjilsbx2dvqfwSE+9jozIoWwo/2?=
 =?iso-8859-1?Q?+iWtn8AwRL3vhTzxnXTywsnpGaOIytFMY2jYR8CI3p3IlWUfg+mIUDOmJs?=
 =?iso-8859-1?Q?dbOGAGDyHcQ0oZ1fcc5/YehTl78l0BQmHqs+RBX61Ye/LkNy91uGTbDujs?=
 =?iso-8859-1?Q?U4LFaiZJMj6fvNDZozpmyivuxnNQwYyGXEQ/NoHBRuj6MADpCY6L/OA/5n?=
 =?iso-8859-1?Q?z3gvRPZqvRZydgHtpK0o/ycsCm1kCOYF+ux6jwPc5MQjhs03fu0LnIXY9V?=
 =?iso-8859-1?Q?DZiZXi1e5kU7yl/9Tu/cy0azSsPXJ0nByYjr/xOpfZuWOHNvlpmAcF8EaT?=
 =?iso-8859-1?Q?GHiTSj6LkyjEcmCF7Rrh0qRAJOhjA/3fYF3VbM/T1jCF+dHkZ9dZjArbCT?=
 =?iso-8859-1?Q?o8BsWDNYnUSWnhNnZPEe5LFgGCqAe9odNovPm686yq3DMA6URvuCI9SzmI?=
 =?iso-8859-1?Q?8iaTrUG4+oJ0dEcOuQtank+ugwc76AVn3VReGkVXZH0I817RmgXgA1pNfm?=
 =?iso-8859-1?Q?9DneOR0iBgPw7GZNeUCPNn1kJZxBOQeH3Yd1ouRc5t2HVoZ+uamMJoRMVH?=
 =?iso-8859-1?Q?TqgRy7XJY1MQl0WxHKH14457nSAoXLQ8wGUdB9CfPtKEun3bMmvlvrvPpx?=
 =?iso-8859-1?Q?xrcHMNvByNhWoX38SbWF9BQqlZE9yf9HFm1YaQSpXU0tlDZuIyb14GxfdI?=
 =?iso-8859-1?Q?lRTmy35GSpg/F96vDq5l0RmC5o0xDJ+YZBaZ9izYxf4OkCXWtro4llATjI?=
 =?iso-8859-1?Q?UC5XuHbbKpPZVpwrIzMjUVCGOsKLDzPsl5DiSOhP54cfweIPcJBlEdaCsC?=
 =?iso-8859-1?Q?/ZZxlmhotWpQXm6awHPNPixxgrzC82A2UFGFId7feGOLNE6oALxzMVUFaj?=
 =?iso-8859-1?Q?mthOrqwZIkwBgRaoNaj3pXjiKK6vROgRJBeysOVSxd1a+z8u1PNVX2/d3b?=
 =?iso-8859-1?Q?FXr9cgt5PNtO5WBCSU4sGl9HQj+rTD5sH28lCTWN2A3yMztUhotUlMxw+8?=
 =?iso-8859-1?Q?uqKNBEOtZcPIVbkT2H32cJFv453lmPme64?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe9cb71-aa1c-4dc8-60fa-08dda29186f6
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:26:47.9538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EOXJ1pL/CG9hvXy9ZdNc20quzoyxnTk8afCuaLL9t8+vrsEDyy1BM65OPdqFN8ey8nTDimsav4OMNCrVmUH0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10079

From: Florin Leotescu <florin.leotescu@nxp.com>

Prevent the PWM value from being set to minimum when thermal zone
temperature exceeds any trip point during driver probe. Otherwise, the
PWM fan speed will remains at minimum speed and not respond to
temperature changes.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index db65c3177f29..60809289f816 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -317,6 +317,12 @@ static int emc2305_set_single_tz(struct device *dev, struct device_node *fan_nod
 		dev_err(dev, "Failed to register cooling device %s\n", emc2305_fan_name[idx]);
 		return PTR_ERR(data->cdev_data[cdev_idx].cdev);
 	}
+
+	if (data->cdev_data[cdev_idx].cur_state > 0)
+		/* Update pwm when temperature is above trips */
+		pwm = EMC2305_PWM_STATE2DUTY(data->cdev_data[cdev_idx].cur_state,
+					     data->max_state, EMC2305_FAN_MAX);
+
 	/* Set minimal PWM speed. */
 	if (data->pwm_separate) {
 		ret = emc2305_set_pwm(dev, pwm, cdev_idx);
@@ -330,10 +336,10 @@ static int emc2305_set_single_tz(struct device *dev, struct device_node *fan_nod
 		}
 	}
 	data->cdev_data[cdev_idx].cur_state =
-		EMC2305_PWM_DUTY2STATE(data->pwm_min[cdev_idx], data->max_state,
+		EMC2305_PWM_DUTY2STATE(pwm, data->max_state,
 				       EMC2305_FAN_MAX);
 	data->cdev_data[cdev_idx].last_hwmon_state =
-		EMC2305_PWM_DUTY2STATE(data->pwm_min[cdev_idx], data->max_state,
+		EMC2305_PWM_DUTY2STATE(pwm, data->max_state,
 				       EMC2305_FAN_MAX);
 	return 0;
 }
-- 
2.34.1

