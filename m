Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012057.outbound.protection.outlook.com [52.101.71.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3EA29CE8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.57
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155959; cv=fail; b=IQsxhweYt5D6Jz3k4h3O08e+/byIFyIUSX7pFZOtC14VegwtWMBfpR47WHmRkI8IRKi6d0eTk0iWz6FKYdVRpKEIbFHDJ/fQEMEOlg1w9e77awfMzS5luc/o2EsmYjIDmCOuWypYVBXToUhsSvZfWt7L75kSb3xSojHx/rAjUHA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155959; c=relaxed/simple;
	bh=r0We3TaQ5tw4P/U0H6iHu54Ccj0qIZoteStjITkcJl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J3ghacnMCSiuiJ/kskiXTIbs8pESIewGjdAJ9Ch0VSV9ZbbtR2iI2Xy6hCg72aNCer5fd+pyxynVrShQ/8ddwRGwQYSqAjS298DXwJPwWtR7wzcw5+6YiicslpkEnOSCjFCCwDuWl6sAM1KM7A5Lb5t+DxWx92L+OeJ9CIgGFyU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TsBxzJnC; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TsBxzJnC; arc=fail smtp.client-ip=52.101.71.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TsBxzJnC";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TsBxzJnC"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AO2iDPHfQGhdcs+WqrEwksCmvttWPJLubMfRyp3wK1EQ8NGbOdDvuNqeY6MF+VbPDfVuBO77aaZcdGTH7hebVJWjg3CVM2rIjDRetUecpIJizSar7W9nNgBT8zHf8gfeRtzocWs2ZsbuMKx90tMfggyyy6kVonn3vwQ5EtwLo0ig6y1gSAO2n6v4pTrtzmhOe4pNyEVAupWFRI9kjA7x+Q4Khm7DVpFPXntp61MBMq7h6XokH4kC8/+vUhDOSW71tPPidFFjo5gL768hL69UlxHvRT+GTc76KGYw4rSeXSi/8RmEJZCipbYWyc7zMCR1yts/G/ffJjiaOCE0ZlsvxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuXnWyXrjtXJNiGF/lTCGRYJusF6ivkN1HqEeh5+HPY=;
 b=D3JHoufdh92ukznculyrQOYkSsjNqMVjkCCX3awOQzfiA3d6dihJGpJRCa1ZHEzsqRK+uL72KvhBjcxYkUKS7V4I6KMHlGWNxUnqoWMSskhycBRK+Rf185I59mDXANfUu1qSjQaX+7d3BNhWOtLCHYuZZ0WOCXBqfstF2QYGQGO8Yy77QoTtCvDkVED7G32wJWhzwNVsvPOF5/F1lWyJscaTIPyr2gdU8R6MhW4C8XDMVxYXF2XZb0WZu1F2oWAc1kQWxRS0GrugbvuI+q4B1AZuriXxPW0mLnrHgn5kBNB0KiFctrKcXohDjyE4DgTd8ROkHH2BQ67i4vqpg8hbkg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuXnWyXrjtXJNiGF/lTCGRYJusF6ivkN1HqEeh5+HPY=;
 b=TsBxzJnCMhiTyMy6UfYGSZfIZBbHxYNzoSieMGNTON2UlZiM0jWlUtPfiWUGiqrCwybOKKh2nbbB8nAkl8btmZNGCNbP8viTZHxI3qF5kQ0OB2cWZIoBriv9B+SM77Br258yI6ql9PF7n8rvHT7CVqxf/zEINJqsQ460qW6XH0Q=
Received: from DU2PR04CA0158.eurprd04.prod.outlook.com (2603:10a6:10:2b0::13)
 by GV1PR08MB7873.eurprd08.prod.outlook.com (2603:10a6:150:5c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:05:52 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::b5) by DU2PR04CA0158.outlook.office365.com
 (2603:10a6:10:2b0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Tue,
 13 May 2025 17:05:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 13 May 2025 17:05:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJMK9TAmkVye7ZCDbVzglTiL+1p+ZCNqsBPvwIGXwLRx6mX3y1eyl/xhGlNAlV876V4Hc0Ltz6Qz+0xevRw9V0Ac+m1DSeQpOBEUXDyCnELadCgqDQsjvnkOHIigYuAbzL0vVvxu1M1lnvm8Pb/sRZSTQQCIvMg8UXeLI4HN4KpHytqPxf7RUAHVmu/WoMbRQ0+j6EC3LGgkasV4Oo8EQOTvdf/v/U4efrrk7zTijRYrT6qTONBrRn8x+Z2amiqm20aBDJPhEJs7c9I9LW4F4NW4FiruzEelZHiFwLmHYBHwNAa99rSDLD9WCMB2JdfBRdr8tJY3uxJYjZGcVBZpgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuXnWyXrjtXJNiGF/lTCGRYJusF6ivkN1HqEeh5+HPY=;
 b=KZbVUXvgxcsb2OLNeQZAaDc4bIu/ib8uv6os5ryEh/KjCHZaRsh3x1FPSZHgf8V4QhuGes9YYqvCl2fLIt7/wX/SmyR3dxZZ/9AOHDV/zU3bkoV+xeOms7tVyHif7AzqdkXDKOX6ErDJI9wLTL+JMRvy7rCZKKb5bWJ1XFz9KKFMM3h4+OM23Cok1kxat4GP25YLd41/PhuwEr9cPcLVM5VFqp7Ni1a03EEp6gklZ34AkTYsaFrE0HA06n6/mcfbLCvarnPnvMkRqQ9bAKUPArYQtVJ0TqQ/ncfLlvBRmroUUCp5dWrjkSdVyMXAcTyTF5xGCNzslqJrdurdloglkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuXnWyXrjtXJNiGF/lTCGRYJusF6ivkN1HqEeh5+HPY=;
 b=TsBxzJnCMhiTyMy6UfYGSZfIZBbHxYNzoSieMGNTON2UlZiM0jWlUtPfiWUGiqrCwybOKKh2nbbB8nAkl8btmZNGCNbP8viTZHxI3qF5kQ0OB2cWZIoBriv9B+SM77Br258yI6ql9PF7n8rvHT7CVqxf/zEINJqsQ460qW6XH0Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAVPR08MB9138.eurprd08.prod.outlook.com
 (2603:10a6:102:30d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 17:05:17 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:05:17 +0000
Date: Tue, 13 May 2025 18:05:15 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <aCN7y6BSpQThfzI+@e129823.arm.com>
References: <20250324191740.64964-1-yeoreum.yun@arm.com>
 <20250325151803.GD604566@e132581.arm.com>
 <Z+OuATAe31GbcKZ2@e129823.arm.com>
 <20250428162214.GG551819@e132581.arm.com>
 <aBSfqU9ssymM/yC5@e129823.arm.com>
 <20250513103340.GB26114@e132581.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513103340.GB26114@e132581.arm.com>
X-ClientProxiedBy: LNXP265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::22) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PAVPR08MB9138:EE_|DU2PEPF00028CFE:EE_|GV1PR08MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea8b321-c9d3-4ce8-4926-08dd92406a55
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?+Yv2M1AxuMKjO9cl4jpcC+BulZpJQ0SaXBjI4OOEToREbWvGjD3HiNusWj+v?=
 =?us-ascii?Q?yLO8Fpr+19zINDaRwbu6qq6ZHy80Ht95Rv1S7HcGaYWxoGFIebjAwOkkGazR?=
 =?us-ascii?Q?EWb8PdfT/iyfkQ/bexZIrMQHcJS4y+en7KwzeTDKA7p+ujOpvnfUWo9LHkEV?=
 =?us-ascii?Q?wU+LuDKcfwuvcrd+/n/vWMAMBhawKRoXjgXwtSbT0DF217PwPT6jWWh2Xwba?=
 =?us-ascii?Q?UFcmyHcFj5owal+qhbvbbMDL4q5+D3TFMcBSB5Z69UOwEkwtJ0U8u8zRR9Cm?=
 =?us-ascii?Q?6W2LL4BoH99oa2ZdRYTcXIXJOwPjC7Z2YrVxQlNc+oRH2Mm8XXUIr36MbFdT?=
 =?us-ascii?Q?+crSJBUfFCUPsm7ztHlsxwqOdDG9kO/wrqXQupQGDCKSeOW3xPPrUEcXmMjQ?=
 =?us-ascii?Q?hKNJrc+Drc12MQWwXY9cmX4mIF1yzH/OWk0CFisHU5l8ki7TsgXiWiKF90GD?=
 =?us-ascii?Q?9Hm+EmB6R+CDO5U9MKrmqVg3zjq2zi8X42OzRFjH1bmtKQSICqBvlyKckdK6?=
 =?us-ascii?Q?Ibk6bIYWEsanIk1pY1Fz0i1oZ6fbQC1QooMezhAcBoJn00KFLjV1xkQx7emM?=
 =?us-ascii?Q?yZolnUI1yyGEsBETd+lmAenTEkRzqpSd3hi8kBnesZFkSn4l5jYDR/LmpZLY?=
 =?us-ascii?Q?E0yMHpOZ3fwTxTqoG7E/GQk5U1KROsKDDEieZRSWdpyRd6RfkZnIFGkn9HtD?=
 =?us-ascii?Q?gCXeHUkRoKj2GEEMZqVIZ7zwxP6ecXqGfUhyxKgWV49YCdR+O+hkXwkrJsZs?=
 =?us-ascii?Q?0R7fvoAM8XbS3xCIX/DdMMvt6Z3A3NrKNCM/eOr3TtfsEroaQpLuqErUeZ3a?=
 =?us-ascii?Q?X85IOxQFUOddUU4nUayiTO9duyNmtIqjQKWV2VI2ViCgFufUYi8Oupy0MGeJ?=
 =?us-ascii?Q?SRAnVyqU+DVnA3eiQ/YFdAFGl+OgfSBkZmqm6OY5sEXgPEo5kd25BLIe3jN3?=
 =?us-ascii?Q?FqbE9wlhcE5AgijHiDiwW1g0RH8vQy8s5L1oaRtsBDokMUsl2aF5QTM4REOh?=
 =?us-ascii?Q?z7p+CbqpimlGvYvOcWIGrT5TJZUpfNZId/mV+c9Lb9FK4vpSpLrlfFzNTStw?=
 =?us-ascii?Q?RwPrGieI9LR/Ib9lQPofNYblAXHt1rd5QJSviVUT3ua0LrWZ+5OlEJ2Yr48D?=
 =?us-ascii?Q?BAVbhLDgkOnb2aqjb3qyCh2b+Jhq6NPoplh4/X/IFbZpJqvm7lnwRN7uvzsw?=
 =?us-ascii?Q?kgllHLJ/sYepxmBfDynQLM0Tm2z6VA2Qo26bzi2hDBF5XkXoMGI1fHOgweOW?=
 =?us-ascii?Q?vRcpfiTV0r3CTqPozo2JyybihCOiQerstVHL8AXvlumPOUjEI+24u6bM3q45?=
 =?us-ascii?Q?PIfpfARH1uhUDVl0yAORWykJYt6KESSjXYqMhBIN/E4P438/TmAuFXWY2J06?=
 =?us-ascii?Q?bqvTdeP+IP/WD8mJ4LKC4MegbpvgiN8uDCHzQCJID6iMQ/a0eULTwWm7nTla?=
 =?us-ascii?Q?CvrLxydpa7s=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9138
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c5408ab-78a6-47cd-116d-08dd924055e8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|82310400026|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MfYAzriEMHSI5ufGY32JpK19zyjH5UjqebON1fNQ+24xP/F0zvqF1ZjW8+So?=
 =?us-ascii?Q?RTuuIF2Ps3mvtFDWzv401dZ5c9NUK17asH8rIfHVAEt5tGrpwdgxosuo7LPK?=
 =?us-ascii?Q?7RgLcIOrF7aA+QuKhsuFIZmyT1yPROpYSLwMm56n9j5y4Ob8MeJhYoP/Zhxa?=
 =?us-ascii?Q?SMWOUQpVaXiwJ/O5qPoQh9FFG17Cbru0RLpJ14YeWReBHT7PpENz2XNFN4mL?=
 =?us-ascii?Q?10zsa1YWqKWl13m5ldwJ/2q0dkvaA4TzXdRRfmhmPiZPiZaZhl+TwNHy5GEv?=
 =?us-ascii?Q?MEJyI74bQTfLQ/edP5WS/WMFuJIFt3VZyHzsNi15V3U7y2Fk666K2R5PDgfZ?=
 =?us-ascii?Q?Vi2Mx9jaOIPZRUQ5poKhrXEuN9McWiQAolUAa32GHd0gi1PxKWl4OT+h3tAx?=
 =?us-ascii?Q?eZmpLFFVQGxljQH0g/iKD/sTX0EvN5BPtcoQjht17r7u7TvfB/z/46/MC9+v?=
 =?us-ascii?Q?z3bJTcbAxJgMK7K4yoAnqcmtQHJ8F0mROaYaZDESxMYuRnpED1+Z0XeUNI4T?=
 =?us-ascii?Q?gfi5Wvp7/TW+QEnVfgbHnABwR9w3Ba3KBZswo2asKWxp+/fqNY5YwEjV48ff?=
 =?us-ascii?Q?/54XrswL7wgQoIrNqrwi6keTmieHGdoWn4gao37b6P5mp87plLFT5rPAptbe?=
 =?us-ascii?Q?nv8CsFU2bM+JZJOY8ahind2DXyPgKFqT59Skq3VOOXxNH1qZqsG9+/PhfVQs?=
 =?us-ascii?Q?dPNwRAB5/cDhiYbaUl8WnW74KkmKU1M0JHqJzEMpYPmHRB1EHSLWllqIrLov?=
 =?us-ascii?Q?ULWlLObHJO2L8Qk1IOBREQ/PTW0w+uzhuJfqsG+4VdPFMjTukZmtmNEXOLVP?=
 =?us-ascii?Q?nj1SXWCT0ieJg95w92ht9H1KPqzYV0A/dhkyBYAaIwP9So4VfNUGxRJsbxPH?=
 =?us-ascii?Q?OKvZEqXJ6tYfI3oyAASoUVGbNkPZJaa3pA59DB51PHYC2kWf8t1/UMkiRCtg?=
 =?us-ascii?Q?sY1r0jNZjekWjPyb+4EcpqPiMTSCTE5iZjKBmM59Qmk7lhKc7TdYGbKtnxhC?=
 =?us-ascii?Q?jwSaRDs4SWz7KxxMhuaTPAPbFfDqDtaaJNq+FsOqOm1HK2pd0fxd1FZY/Juv?=
 =?us-ascii?Q?Pdy3cNuEAGoPFYaT8abLf73CUt92tokS1WeQy35xns75JTyJa29Y7lAiPjeb?=
 =?us-ascii?Q?/yKLrMrA5chuxEoc8fegM+9Jrd+i9VUQxX64LJ75y77y421TsXCEyIVzipuV?=
 =?us-ascii?Q?HH0nWy5i7b1qpIG4RcgyLG/KQH7g3gS+r93eQNnB5vCcsAES/OREW96GCvvx?=
 =?us-ascii?Q?7yei2TqMVAD8O4TXrCONQ8v4dpzA6j70bww5mZzq0u/EZqSKL2LHHGcltQs9?=
 =?us-ascii?Q?AQarV0qml4PCW4N1Gmo+ATxoQdwznavS1UiDpbtLuGtc0k91EBVSVtz/Mgjs?=
 =?us-ascii?Q?DRhcZeLaAk5gtNL8/HyUAkRBRHQ/tsnj7vr30sLVWp2DZ1Zq14fi1znTPshN?=
 =?us-ascii?Q?TmohWpMD+NJbKAJyxP1eT1U03G26aoh1P60bQBNrJ2tRvzjpPfNmyLqwgBwS?=
 =?us-ascii?Q?1R3o3tCaafBuSyRsCPj6tp5sjzhl/YT2AP5p?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:05:51.5040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea8b321-c9d3-4ce8-4926-08dd92406a55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7873

Hi Leo,

> [...]
>
> > > > > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > > > @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> > > > > >  	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> > > > > >
> > > > > >  	raw_spin_unlock(&drvdata->spinlock);
> > > > > > +
> > > > > > +	cscfg_csdev_disable_active_config(csdev);
> > > > > > +
> > > > >
> > > > > In general, we need to split changes into several patches if each
> > > > > addresses a different issue.  From my understanding, the change above is
> > > > > to fix missing to disable config when disable Sysfs mode.
> > > > >
> > > > > If so, could we use a seperate patch for this change?
> > > > >
> > > >
> > > > It's not a differnt issue. Without this line, the active count wouldn't
> > > > decrese and it raise another issue -- unloadable moudle for active_cnt :(
> > > > So I think it should be included in this patch.
> > >
> > > I read the code again and concluded the change above is not related to
> > > locking and would be a separate issue: when we close a Sysfs session,
> > > we need to disable a config on a CoreSight device.
> > > Could you clarify what is meaning "unloadable moudle for active_cnt"?
> > > I only saw "cscfg_mgr->sys_active_cnt" is used for module unloading,
> > > but have no clue why "active_cnt" impacts module unloading.
> >
> > Yes. but it also related "by this patch".
> > When the load config and "activate" configuration via sysfs,
> > not only the cscfg_mgr->sys_active_cnt is increase but also
> > "individual cscfg->active_cnt".
> > This patch extends the meaning of "cscfg->active_cnt" includes
> > "enable of configuraiton". so that cscfg_config_desc_put() prevent
> > decrease "module reference" while holding individual active_cnt.
> > That's why without this change, the "module reference" couldn't be
> > decreased. The problem before this change is deactivation doesn't
> > chekc cscfg->active_cnt but put module reference whenever it calls.
>
> Thanks for explanation and it makes sense to me.
>
> As we discussed, given this patch is relative big, let us divide into
> three small patches for easier review.
>
> - The first patch is to address that the sysfs interface misses to
>   call cscfg_csdev_disable_active_config() for disabling config.
>
> - The second patch fixes the locking issue for "config_csdev_list".
>   As the "config_csdev_list" is protected by cscfg_csdev_lock, the
>   cscfg_remove_owned_csdev_configs() function should use lock for
>   exclusive operations.
>
> - The third patch is to fix reference counter of a config module.
>   The patch adds cscfg_config_desc_get() and cscfg_config_desc_put()
>   in the config enabling / disabling flow for acquiring module
>   reference counter.
>

Thanks for your review.
I'll separate the patchset according to your suggestion.

--
Sincerely,
Yeoreum Yun
