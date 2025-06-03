Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845D72C325E;
	Tue,  3 Jun 2025 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950004; cv=fail; b=cbIJO2p6b76EuZiy/ITnM8zeGB3UQllpas9uHazFWku3LaQnUuTNeI351D+7I0HHeUybeP2kwhIHF72ZqRx3yW/ViXVMoTqR694aV32Jcq2ALRCg7eZhRBj7/HtT6FYN3pPVj8pZE3mbyrjxXOfrU6xgx9xbu/erB/6gEUSJVp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950004; c=relaxed/simple;
	bh=Y9kWOmbnIo12QO7A83sjYMgUTSveZee4AFMBG9cWp3E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cl5iczdbJbgiHZqS6co3qfdBpHlTaLGDRpsiCJGaIwkorPkZeVGpaS6WdMfmdFbX+dfQLlWLvjMx0AWsRAmxP+7jEjD38C2YliuTFK2LFKU1SOdFn180J62VYR8uylipH1tQAyuUVKFj9uiFlMvBaXeXMonW9GJrIvGryZMYhZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mq+1tKaR; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mq+1tKaR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuxdyTbjOhPXWzVudcbvzAWcTxwsXPAQem926hcvf5OkzGm5VLQExrGfHnU6yCMcvsdMG5BwLk7lzuqad6qkvIJxMmP2PnP+d1577I8Dl/rk94Bcbjci8NHwyQuN2z5mmsYfOft32EoZGUPqgvI/RQX8GO3QgCR03pPvlTCPCGzjJZjl73b+QzgN5MM0N9dB1rwF6CQXvy3tnghFZy9uNCSsTPr/VHp5mQ0SKJ7i28lu8tljEk2jMT6c796JRuSG9tdhi+ZWfqMXs70cqqxuuoQQOqBFQ42oAxqa6oIfC1zYRxjhRJH6QKf3/uGqAu5z2lWHU3W3Z8AbWkefNAWidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QdcYJ3ne7sdoJTilJcLPTS0U4hV+sih7q+EY2hw8dE=;
 b=sVqPoBQdn8jRqmE4RwOmNOlucPgOZ4kig/fEzRI8HTUA3rOGF8PIgcYhUEsi7KRs5d7eNH0M4I4rBOcyC1DIUxHX4Ggw3Y7qBN1n3yZADyNBkZl/J7IaASPxkShJyrF+cFQyjrfEC69WfaxhfHOZizSHavgoL67l7Qrd9PkoX2klFdzgU7/bySGR/Ml+kOOipi+j8AqNmP+yaGZtCsOhCI2sblmGJmmtlTnfAc49awQE2ZP9wCw/mP/Y6Oclc9i9tiwJB/RBLRDgP3/TlT5erAf6GhG8MRmSG4koYMFP4qJThC0F/MCmOxGGQzHB51gpFkbxeYGAJ8Iv0FlBxEQwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QdcYJ3ne7sdoJTilJcLPTS0U4hV+sih7q+EY2hw8dE=;
 b=mq+1tKaRKB9ctzax1GKOtBxPojC6tpaiOkcpEBW7lMe8KavH4rrZiK3AxI6m6VgL+tOAbwzMT3W1GUFsWZef1zAJxn2m25m92q2nP5CeM/lED5O6rMfNoHZI5e46UQnnYXd4GybSKGVqRw/+LhlzMKhFDCCoCMF0jxCwKXzdlnUGGimCVdQaCRgSIQ1X/FuiAZO58oOpJE6hUAd4qQvBka3rRY0qhu58LXcftX6xhxRCaZbcYzL3R5r5YYWwkLikXMUjzwIDgqbUBwcPpRhG9BCb7M9S9l1v7YCQElNsxRuYae2btqYWV5mD+EIQdYrZs3wwiG0BzxrUlHLr3nRyKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM0PR04MB7028.eurprd04.prod.outlook.com (2603:10a6:208:19a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 11:26:39 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%4]) with mapi id 15.20.8769.035; Tue, 3 Jun 2025
 11:26:38 +0000
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
Subject: [PATCH 0/4] Add OF support for Microchip emc2305 fan controller
Date: Tue,  3 Jun 2025 14:31:21 +0300
Message-Id: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0017.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::7) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM0PR04MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dffff57-bce2-417e-4497-08dda291814b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?WsvLb15C4HaMLDnly46ujzOhTXX7Fco2k3wgRpZqyTtRxXoov3RQbZ86Fa?=
 =?iso-8859-1?Q?VQx8UNbU9ExkOc9CdL4LA3rTCSjc7Yhz+E8aO8Gu9vhIIcgqvdcbtO781K?=
 =?iso-8859-1?Q?QY8wBvEi7wQaPdJObV0nEpTGbHhQAu+XmDre/SLR+Cwiv4BmHRlxg/4LFM?=
 =?iso-8859-1?Q?YAj3R9wWsX52IjoOMMaCTluGsRCfFecJ2/ebnvsvCue3L1mgI5tVfX8tRc?=
 =?iso-8859-1?Q?CfP/eaW/0akSsS0/don/xfm1BVpOSdPixagKA6EmeGx53RQLkn51mWISmB?=
 =?iso-8859-1?Q?jCNoQ4keJ2xeBzF2Wm5abmhChvlHmp2DgUb47Gd8SiZCV8xprLVLETv12d?=
 =?iso-8859-1?Q?Qj7fRSuNiwpav/Cnb0/FleQPH4iJgH2hAXET1J7Qpe1JDtM8vtULzgBub+?=
 =?iso-8859-1?Q?G8F5nmPkl2ASujs6XlVqlpG9FQhywxvlo4/f+afesi3RzNm9tg0bv7QxlT?=
 =?iso-8859-1?Q?f8MRQ1ISkXSiB2PnpuA3Gj8AX5+DjGudHNsHxaN0RV1l7jBwxYft10Nujm?=
 =?iso-8859-1?Q?WxrIYb8bqFoJhOzETQC31P1ga9/npX/nn0uyKxaGaL7he47Euccu+ZSeR+?=
 =?iso-8859-1?Q?78mgweJF5vy245/oWLKmwIypLvJ4rNz24Lb6z+VoPpg2AOJAbrBYu99vHR?=
 =?iso-8859-1?Q?UXeMIZSEQVmCWuX4TNvgIBhdK5VR5Sxwb4uNNBIUnmm5KHQ3RuQhqbOVMJ?=
 =?iso-8859-1?Q?SiYOmzuo1wRK95Ux+4Dug+NPxk1HxZadB/dftf0sLIboIOinWG+o7W1nLg?=
 =?iso-8859-1?Q?m60QKuGCwQOEoRNM+5osmjt9rhHkIowHuUhUUg0iGi2jhnTHwKdwX8c3m/?=
 =?iso-8859-1?Q?dTIzbTse7ogxpxsnJRxnrRY72B7f4c9Vfh9b3kNNEWAEzMv/Sc37tV7Vie?=
 =?iso-8859-1?Q?XC5FiUJTB46v62g9PPJbKSYNceOw22IDcwTXJOGCcPe9Ss3fEUKA+A2TKT?=
 =?iso-8859-1?Q?kUv3r96LlhHmexj6XEkommx62e5spSZovAWfWemExH5Qrn5t9dq07j/S9a?=
 =?iso-8859-1?Q?7+FbANUTE6CXSE5JcCFCUpeQVpDSL7cNgg0qhIZlHjSLM2AggjOvBnvOZZ?=
 =?iso-8859-1?Q?FrIFcTkAnLOGNXOMX6Mf3cTpREfXAqTVzicgEd+HRCT7gutAgdxyuqNTU4?=
 =?iso-8859-1?Q?Aix2+a9UwXZQrltpz6+flg/SzoZ2hj14h6oeccAJT2rbEHd2HgsoTotj0X?=
 =?iso-8859-1?Q?sxg4a0dfiW4kRRb4IJVO5Lfj5Yg4INm0IySlPP/7QnRHJu+X/gJ/5hKGwc?=
 =?iso-8859-1?Q?oRDP3RiDxHOYef2Ugelrb0Y4zUJAHOHq+uMvgyYuClFAjfR6et195D6tD+?=
 =?iso-8859-1?Q?SwE31zJL8hFCQz8EATpseKnNyW3DdPHYec0L8upEv6vgh9rAVZabVun/CU?=
 =?iso-8859-1?Q?CEdZtqWlsKG7+7Df9HlXZR8E2k5UMhcmyOoUqQOHqhQ+yHVLEI7fHZR1LW?=
 =?iso-8859-1?Q?Ha/8owf4aDMRPXmlXX8Xwd5AaGSY+BzNbwZ5XfkZjmVguqUfoFIr+W+00G?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zUtou1HEacIF8BjqXTRZ79OyfCOQDXmpsa0xwHAdL9CItM6y3avKFIjKbN?=
 =?iso-8859-1?Q?6bhEHYVgPRCeKgEPkKIsZte2vnZpdMnJXtqJf+sQ1J+Vw5AM2iawX8LonW?=
 =?iso-8859-1?Q?ZR+tdxmoKE1IKJ2XEHSobKmcBnQIN+DUXlPi6WKEj1Jqwr+Z42gKGsbsax?=
 =?iso-8859-1?Q?iD0L7oXX56cCZTB8sDjYl4R6l4uVqNsLtJi7/eaoxE+sEHODMAL2/J7VW3?=
 =?iso-8859-1?Q?x1Oo0Lec5bhMZtlqRgEbupR2bgpmEbjx03sB+rIdJGXt7bcBZh+E9vOQ5m?=
 =?iso-8859-1?Q?SHifGWHh7J7P+brVvvhpjTOWQoe2BCHnkVMnhNrJmpZeVI8fTDP47GaVWi?=
 =?iso-8859-1?Q?rVELs6CiEkKKdwmv4HF4XYY7YUTHtLC4UM/CSH1QLWACM99Oybpk4dfPW5?=
 =?iso-8859-1?Q?ijCb2FKGltszfzeVEcyGlGTjNy9ZZR7is0FgZ45YZkvRGJPZowq+MTMlXp?=
 =?iso-8859-1?Q?encIleafNvV9DYZlnJGOZB4W07vGrxLnnePm4/kAyH21p3LIqI/SacIbsb?=
 =?iso-8859-1?Q?rzgEOKi/AGUVMOy7dtiYyN06+de5BAI4UOvGWPYZVD+6wllWbj6nOiwe93?=
 =?iso-8859-1?Q?3umkGD8H77Y7XfdBXU4vvtiKJQjxjJogHvUDDWzwAcPKss1CC6wgR/9kZB?=
 =?iso-8859-1?Q?VROS3z8EhEIbjNkF4gX39gY57EAyyW8tJ62NEWKZ8r761nvJ2V8zgbvwZM?=
 =?iso-8859-1?Q?pzPrSHoQ0SoKry+l1zw7+8lLGPevAlXSxYxxq9sc0jnl7TbpNk5QbSiqkO?=
 =?iso-8859-1?Q?o59tNYur3xHVNSZqhk4bjFJ+vlpZaDqoZ1jvIC19J/VZUlwoTljM5hLLFs?=
 =?iso-8859-1?Q?SPDHLr/4M6yxu2omhqdl1SUCIjeXHh+V9x6UahvDc0cigkpx9sUsTogKST?=
 =?iso-8859-1?Q?E6lA4Qgm8HOxecM9EgQ8xWhEpFLz+or9tbNJd1cj1+97fhlhpckWYSfRDe?=
 =?iso-8859-1?Q?OuFG2XqT+epu7Mc75umdw3dkOn2AsrIJW70M7MFO9U+IUNlOSWqS07whpC?=
 =?iso-8859-1?Q?9OvDo96mdwY5NpRcRR8GdkHrs9psDnRRC4+QMJhRURHa3R606nIFsD6yRm?=
 =?iso-8859-1?Q?JDB9Zath4HrWfqdoMywZd6ie2SCKd65kQGNQfNKtBWjEDE/k0qbauS51y9?=
 =?iso-8859-1?Q?3bbdXNA4WhtSnlQ0dIFMXWGlVvVa9x8Gn1H9AR2W/Fl2ML1VrdpENOErLb?=
 =?iso-8859-1?Q?XnZoW+TyFTgnknTTolnrcogfCJSHTYDA3vUc06oNyM4uTN9VAUnI8JzsJc?=
 =?iso-8859-1?Q?ySWRDrDu0+No+vJ/gcSmcion0WmexTxbBEm84SzyogYEh9WOBCkmUBFPIZ?=
 =?iso-8859-1?Q?Qv8xOxiNdzoX2QgAVpYM6yHWpUD8ILRyq6nFd+t832ymIVPi+tlL/GBH7g?=
 =?iso-8859-1?Q?wNjl8o9wgZRuJL9Lghmi4UXXsGXcCE49X89ODKrSTftawcD4kARPEMGZsH?=
 =?iso-8859-1?Q?zadiOPVbw2bSU10D1VO9RV5q83NSHdYsPYfP3BgMcWKiEupzt0k/y2Wgwd?=
 =?iso-8859-1?Q?Ln+zDR7JVQC51IXEoYdq9+52gERix+Q9zUidFqkq1imtNxfCtl0hxY2Gvq?=
 =?iso-8859-1?Q?K6FombvRwDcHm721BQLA9+0JA4kmgt4UgeWcIQzao24S5pyEfQmFpUgI6Y?=
 =?iso-8859-1?Q?sIekIDRzDdi4WU8Ucd7dPnNT3oKG7wyL5L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dffff57-bce2-417e-4497-08dda291814b
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:26:38.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27Mha6VNS5KZLiP4HfbYyEk4XwXuGy+F2rlHlJNv83Q8JfnpkXl30Qh6TsOqhn0KfhU8+eibIGlyYrP6/JYCHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7028

From: Florin Leotescu <florin.leotescu@nxp.com>

This patch series is a complementary follow-up to the previously accepted
patch series that added initial Device Tree (OF) support for the Microchip
EMC2305 fan controller.

https://lore.kernel.org/all/20250321143308.4008623-1-florin.leotescu@oss.nxp.com/ 

This series builds on that foundation and introduces the actual implementation
of PWM channel configuration based on DT properties:

- Adds three new attributes to the driver data structures to support
  PWM frequency, polarity and output configuration.
- Implements parsing of child nodes and 'pwms' phandle arguments from the
  Device Tree and applies the corresponding per-channel configuration.
- Prevents the PWM value from being set to a thermal-state-based minimum
  during driver probe when the temperature exceeds trip points.


Florin Leotescu (4):
  hwmon: emc2305: Add support for PWM frequency, polarity and output
  hwmon: emc2305: Configure PWM channels based on DT properties
  hwmon: emc2305: Enable PWM polarity and output configuration
  hwmon: emc2305: Set initial PWM minimum value during probe based on
    thermal state

 drivers/hwmon/emc2305.c               | 181 ++++++++++++++++++++++----
 include/linux/platform_data/emc2305.h |   6 +
 2 files changed, 163 insertions(+), 24 deletions(-)

-- 
2.34.1

