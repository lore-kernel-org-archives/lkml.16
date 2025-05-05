Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D6211C;
	Mon,  5 May 2025 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445264; cv=fail; b=qKsm95/C0xyRL5EHXZltNzePOx/MktfkgznASAC0nujUrm3Iaeaa75WA+1msvJQ4tzWSH+d6OVpBr6NghddeDp4Q50RejKiC4lOECzm691K+PEbSTUlmdwSAvEFt/78VSI+QCQdKM3Ge+h3AfJSlk9SS0A0+oEG8ZgRE/eBnVSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445264; c=relaxed/simple;
	bh=V4l/I+AoFVha8NcMp4my/vw+SM6y2GMQqPaJLUx1Hmk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dhnUtvYiq5yv/3wMeAqCsTeTGZplGYB44s+WgHEunlNcyM8UedmItXaHsbDLEWA50ZtwXoc9cHh9KS0KEqll1izlGA7G87QdJ+cPpSw5mHGC3jyJR53xwJCriN2j2OyD92SZAyfNoyMMQgPjOS7MT1kCVyAW6sHl4v46OS+xmX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ELrSYP9b; arc=fail smtp.client-ip=52.101.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ELrSYP9b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmiIlA8YO5pMWS3ji/UhOTPTnbdfKINd1IXfPTNNsWQymx30n3HhnplpeKgh3v2xjIxyDweb41izReU9y3wY0xh1h8nA7ELTRCXoyvgIkEqDrWcTKKvNmsxeAMljMX+B5KShQ1+5PNcvfbq0EGMf9pzOS4gQU6lI2hM/RklLx+BiIHtutYp4kzdTa5FtpDn+x0qDyhsCjFIXD44lRg3FQxwaA606Crw4uS0YnuK17o6R4XJ/BWEn7BcVB/iNi429FqIQ6eR5/ox9mbhf5cWNmAqbSgBnpV1Rl7WKWxwC5wnVLNelvDHWnu5QNLOHH7SpdkPW3eYca5oGsDn1TB1JXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8T1j6Reqp01Z3ISjy4/euotw90caqRJMOyPLFutVjg=;
 b=N0pFYgX9J9KtfziXZyVl98Io4wAj3eGJOXyIioz1+G6jkRspirisVu/IWVMG29vt4o/OjWgBxbQkKpDP0lEaUPeri3in/xxDdMmM30VUo5IH5YOnKp92aS+InC0DvSP6YLn/jvyjMj9EyNEDfaGdqBnLu8w9UfSD5o1ufdGomzjJTqejXRu0nPGOFxQpGcxNpHP2EO0e5zLSUQgY4EKAoDgbF5Y+8xTpuQn5/sZQUYgiz3iesSQpJJQGcL6kuT+wpCP/asgSeX+xKI5/DW4nOH3rMXuk6AaiFbehuhu/qRFQ2gGD0n9BeePbK5K9diU+htYEtsSqsJFgjeX53GmCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8T1j6Reqp01Z3ISjy4/euotw90caqRJMOyPLFutVjg=;
 b=ELrSYP9byQYXmnP3S7b7hjok0U3c5XdWMPo7K9LcHvRkpEQ8B1lh0GD8vHQJXy3CZcGO8cucmXz47RzlqchdSXuELb4wySdzz9PVT180Kr77Jsl8d8JX1G5/PLRtqL+ulpCIKFadarF4g/xXqyX6DIB122bTuMmT8XGNbBQeHkrvlAtY94OOtHho01k0DaZ2alff3fcB20FO/ae4V0P7QkOGohUV/PQhPU05o5RbJxZss/NIJ0u+S388PPZ0jgjmRnyUGh4HlXChIE7G2lncm+pshntqSf6xXooDhS/BYJsTyBKRbev0zTLBMElkV1y6cUkjeNJ0HQ5VeJ2nfazi7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA2PR04MB10447.eurprd04.prod.outlook.com (2603:10a6:102:413::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 5 May
 2025 11:40:59 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%3]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 11:40:59 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	kernel@pengutronix.de,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	iuliana.prodan@nxp.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@gmail.com,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: [PATCH] ASoC: SOF: imx8m: Use reset controller API to control the DSP
Date: Mon,  5 May 2025 14:42:51 +0300
Message-ID: <20250505114251.57018-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0129.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::34) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA2PR04MB10447:EE_
X-MS-Office365-Filtering-Correlation-Id: a79f95b5-9779-44f8-46b5-08dd8bc9b493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Slg2a29zS1U4RDBDSldqd0szLyt0SXp6a0hmMHhkUmZJS05rcmlQZkJlQ1VH?=
 =?utf-8?B?Z0lwRjVpdTBkdXJZUmgvSVRraXFQaUNCclplb0JyOENzRVE3dnE1dVFWR1pO?=
 =?utf-8?B?cTUzaTYwWkQrcEJ4ODJLVnJEN0ZVUDRxeFdvRGhzUnlJd1BPVERQU2R1TkxC?=
 =?utf-8?B?cWViQTVoS1V3c1ZNemdEYW1qREY5Z3NGbno5alhGaXoxNGNHN3lIMjBmbXBC?=
 =?utf-8?B?WE1JTHgzeW9jNHBSejZhRGYrQ2huN0E1aDlwR0NEb2hyaWpUT01YOXo0eFFa?=
 =?utf-8?B?dThvRFdLa2t4eTVUREppSmpZRVJyM0t5OXVQMWQrT2NaWWFTdDgvOTlKdDJW?=
 =?utf-8?B?QW02WkR2TXVvdjl0enJSZ2RXNm1xUm9iSXJML0Q0YTIxUS9RWjZiS2g4WXVl?=
 =?utf-8?B?VnFYL25XYTFDMk1qdzBtYjQ1Vlo2MjFLQ0d3UmdrbFA2YlR0NWVmcTBnSXlD?=
 =?utf-8?B?UFlkb2VRTE1GWFMwV1BrcFkzdzU2MHlySm5WeEQ2YWRQYllWYy93M3h4SzFu?=
 =?utf-8?B?clFUVU9Va1lFNklhNXNYdmwvT21oQnBBRUpmdTRXdjBqYUU2TzE3YzR0NFh0?=
 =?utf-8?B?ZENVa0ZXRm40VjlyaHRTd2dOcXJvWlRoRVc0T25qSi83V1Z2NmNNQmdiOWlK?=
 =?utf-8?B?azZQWHBGQVVsb2E2b0VLVzdqWC9hbGdWQzBQY0hQbkJTeVREcGhsdGdsY0FX?=
 =?utf-8?B?M0hqS1J2ZmQxS1VBWjZzUVNQQU9KWlVHMHZJNlMyY3JQd2FvY2MwTndjYnRE?=
 =?utf-8?B?bnFiVlNleUN2dUNwYnY5cUJ1alhrd1JJLzZ1NitiV3JHR1A1NUI2aDQ1aENt?=
 =?utf-8?B?Y1dvclBXN3gzK2VhY1dBVWxUcUZpVWtVRlFiSmhnKzZleXFJRWJNUG5OQ3VQ?=
 =?utf-8?B?Q3g2eHBTZUNvaUpCb3pUSzVuZGxnSVFMelptWFR1U1JVbUsxazg4RzJ1UEcz?=
 =?utf-8?B?c2xGQjBZOXA1ekJmSDRFQkY5Z2FoMkdEMWk1a2dFQ016NXo5b05zY0haN2ky?=
 =?utf-8?B?U0s4UWlneXROL3U2a1ZhU3VmcXJXdTdEckhVNGQzVHlNSW5HVElVc0dpckY2?=
 =?utf-8?B?OWtHQnlQWXV0eXFUdkx4V2J2bFNSei9MNW8wMHVUSWcvQWw0dGVVREw4eDZq?=
 =?utf-8?B?enVqUnQzQVJ5anB4UVU5Y1JsdTREb1c2aUlWVmxTcUs1WFhkZEt4bnY0OHlX?=
 =?utf-8?B?TXRQZElsVTRvT3EwVmpFdkVGVzdvcFhxK3dUeFlYMG8xZ08xdWFCckRuTlRR?=
 =?utf-8?B?NU5hR3VEcVZ0clZ5RnlKUWpJb1VkR3lTY05aVTJYYjdNVms1dnlHeWFVV2w5?=
 =?utf-8?B?dTd2a0xmWERlUVMzdnJMV2VPUVZXQWQ1Q2szTUxWNWJhVFVzZ2RVVE55blN3?=
 =?utf-8?B?WDRUWENSR1RZTlAwWjJQNnp5SFNyMUVLVW5DdExRdmEyZWQ4VFNMR2NVRzVi?=
 =?utf-8?B?TjI2U0psNnlKQTY1VFluTkVMYzdrdHd2N0t0bU85eUN4VVBHSnM4SDhHVFBy?=
 =?utf-8?B?SkFLR3hsK01iOTFjQ2llY2FXY2V6cVZyZ0FYY2diZkJnOUpiRENORVdrVmFM?=
 =?utf-8?B?MDFXUnYzUHJtTmVpSExPMWZucTUrQncxbHdpOVpsaXRFeEt1WS9QUllNS2NU?=
 =?utf-8?B?enJNU3lQQ1ptaDJXWjB3NHpPbGtaWWJDWW9GVG9iZXBEZEY0bnJ1ZVVuUTQ0?=
 =?utf-8?B?SFhybXdyTmJsRkZpRUlHNmJKdVFWdmpkdjk5dzZ1U3ZMWkpTVW1jdG9BcFRo?=
 =?utf-8?B?TGxzckIyQUxCK1g2NEt1R3NrVEVPZWR3UVVrekhQT1gwdUF6V05vMkhBTjRB?=
 =?utf-8?B?YUsvWmxnVjdPUTdQeGR0OWU5TzJTaHRhSWp6SVk2VjYyTE9YcXY3eUgrSlc4?=
 =?utf-8?B?UFFpNmZlWThJOWFsN1Fock10QlRHSDg0ZUUvUFYzMW8rOFNHSjFkenA2TkN2?=
 =?utf-8?B?WVJuc2ZXQ24wRmNxdWtnS3ZoSTcwNHRuZTdYZTl5YllXNFVnNHIwdjczUnFx?=
 =?utf-8?B?Z2ZqM2dzVTJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09TeHQzVm1uOFNaTzRncEF5bUJEWDZTMTZQbE41TXlIZmMzMTdJaWRUVmdj?=
 =?utf-8?B?VkM2YlV2ckpERFl3eTkxQVF3QXcwY1Y4VzhZWGxzM1BJQTVFU2JGRzZBYzR4?=
 =?utf-8?B?VHUyS2JBRFRjRC9oVWdPL1NDOFcrZFZOUUlMQnZoY1BmRjh5NFFDbW9RYlNZ?=
 =?utf-8?B?T050MENXNkErQ3ZIYW4ycjJkb0RUaGhXNFRNbklIUHR4alpncTltc0Rsb0dC?=
 =?utf-8?B?ZnI1QTZQZ21QOVhQakIxTXIwTE15dGlZcElWdnRMczJOMEVVZ1p3M0NTQktB?=
 =?utf-8?B?MGxyd1VNVFNHL0pVa2Nodkk4LzdEQUh1Z3AzaVBoakZDNlJaTzV6WWZHcE5m?=
 =?utf-8?B?Sy80L1U1SyttZmdReCtXZ2lXa3V0WWVFYzNXcDB0RmNmdEJWcUdKVGlCUlc4?=
 =?utf-8?B?RkxpSHcvemRJQ3Z1L0FvamUydHFVL0dXaSszdmdFaE9idlRicWZkQzlvYWNu?=
 =?utf-8?B?UnJWK0JyVEVQUVBSZmtTL3E0OSswZitlRWYwaWVkVTJlZ3FJNmNUR1lsVmhj?=
 =?utf-8?B?QlY4QUErZGYwVnFUQVl1OWE2RE1NdnZnWDFGeUdPK01CbHBybW42MEpnQVVQ?=
 =?utf-8?B?aU1IMFlmczBNRTh5U2lrTXplRlRpR0pad0RuMEJFenUvZmhzaTdlQW40RzZ0?=
 =?utf-8?B?VXpLRnBmMTFQc3VuUisyZitVZzU2OTVGQ09Qd0lrbnpGRkEvdWVPQzFZQ3pa?=
 =?utf-8?B?Wk9KNDh5Y2I5ODkzK2I2bXNpRmVLZWJJeGFLenl6R1RVdWRoa3FoSWgwWjhF?=
 =?utf-8?B?c3hjWjFKUWRsN0dGVTZrc20xS2NUWGhUNTB2Tlo0d1VaNUhqUFkrSzk5YWNt?=
 =?utf-8?B?WmNGT1U4U0RYNkVuREg4MWxWb0tmek1KWStoYTczR3pRV0l1VVVReVVuVkxG?=
 =?utf-8?B?N0pWZ09vVXl0aU5naXh4M0g2bFQ2YWt1M3l3R3pMUkJseVZhNzg3ejF2RWVa?=
 =?utf-8?B?OTRudUVsd0RkbjUwNTNpcG5kdFgvMUpDUzBKOENrUmRkWUhUM1hWRDVYaXdl?=
 =?utf-8?B?bnhqalkyZjhwN1FZKzBhTjZoVXhVYWFJbGxUbkdtazMyaVJsdW41RXZpT2Nt?=
 =?utf-8?B?ckowR1RaWjI2YTRzOUlSVG4yK3Q3S3lxNnVKenB5SEFKV1htcjRCTXhFNUll?=
 =?utf-8?B?a2xFMzQ5R25qNzMrWCtXSjFWNnZXVzdwNWtXNGZIRHQ0S3ZleVlQczg0c050?=
 =?utf-8?B?My9KMWtUS1AvaDNFSFExd1Z1MEczR1dvVEc4ZXUvT2RVMFl2RDdzUjcvUGRN?=
 =?utf-8?B?eHhFUUVyNkNjMU1hbVBCTnNZS2VwWFVyMCtPRkw3dTRHN2dZdS9NMWV6ZmVs?=
 =?utf-8?B?YklKMndnQlA5SWVBMXYxeHJ1Vi9ZeUlEcU52RFNPbWVNbjNORGp6MSs4ZzBQ?=
 =?utf-8?B?WnhaTmtXNjFDbzYrQnI4aGlidXViajV4bFRtbGpUM0ZXZU5DblRxdUF1RlRq?=
 =?utf-8?B?eUxLeFF6QUc1enhwS2RxTWRUZkFuSStTazV1ZUZNM2wwQy85UFJWaXMyVGJH?=
 =?utf-8?B?Mm44WUlyOGkxMXFGYU1YdlVBc0dQVHdIVlArNWtsaDI3dWhkSFd6Rmpmd09K?=
 =?utf-8?B?U1NQVEZmZThhQVVJWXNBMjBlSE1HQmNTTFphYnJsUVJDVHM3c21MZEN5TFdS?=
 =?utf-8?B?ekxHMkhEQnJET2pHeld4Rlp5c2lJdVU0enpobVd5bUJtVGtJWlNpZDNIOEV1?=
 =?utf-8?B?elp1c2xXNDEyYk03c2RTWHFUK2pTL1lvYUFDNmRuZFBXRitITmYwbTV2cnNU?=
 =?utf-8?B?cStPZGxtUmZENlN3VkdtRCtlZkdWNkphYjIvTDZ2MGh4OGU0dGhJOGIrdC92?=
 =?utf-8?B?QmdJam54dlRsdFBoNTY1c21HalR2L25TMS9lM0xaSk1rZ2loekNQUDdlTldM?=
 =?utf-8?B?ZDZ3ZlBJSTl5bWZaOU5pYXFhamoxZzZyVVpDUkVLcGhaVUFmNVllclQyZlVK?=
 =?utf-8?B?WG1JZGVvQjR1dFRZRVFkcE5KQ0kzcWVkZlZWeGNlNU0xSVdaVHdvVkpZa1BS?=
 =?utf-8?B?MkZWQ01xOXJNWWdFQ3ZVdXphOTcvQjZQSmFLcEpuVUtDbDV1WFRBVFVkdld1?=
 =?utf-8?B?d1RLTCs3T0x2WVU5U3pxM1Q0ZXB2TFRqc0o5UW5OOFJZZ3RkeFlOM2NEYzNu?=
 =?utf-8?Q?nxa5KmDx1cmEZCRK9SSPBBUYT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79f95b5-9779-44f8-46b5-08dd8bc9b493
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 11:40:59.2492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ds1ECxfoWYvmRUl2V3aEz5DbynqcWeSo9cuCr/RSh3LxAZTmZ3RUrcjHDS3OED5ynlhQCnfozwj2resySLR9qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10447

DSP on i.MX8MP doesn't have a direct reset line so according to hardware
design team in order to handle assert/deassert/reset functionality we
need to use a combination of control bits from two modules. Audio block
control module for Run/Stall control of the DSP and DAP module in order
to do software reset.

In a first step, for i.MX8MP we are switching on using the reset
controller API to handle the DSP Run/Stall bits i.MX8MP. This comes with
the advantage of offering a better probe ordering and a more natural way
of abstracting the Audio block control bits.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index ab07512e511d..a40a8047873e 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -11,6 +11,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/firmware/imx/svc/misc.h>
 #include <linux/mfd/syscon.h>
+#include <linux/reset.h>
 
 #include "imx-common.h"
 
@@ -23,13 +24,6 @@
 #define IMX8M_DAP_PWRCTL (0x4000 + 0x3020)
 #define IMX8M_PWRCTL_CORERESET BIT(16)
 
-#define AudioDSP_REG0 0x100
-#define AudioDSP_REG1 0x104
-#define AudioDSP_REG2 0x108
-#define AudioDSP_REG3 0x10c
-
-#define AudioDSP_REG2_RUNSTALL  BIT(5)
-
 /* imx8ulp macros */
 #define FSL_SIP_HIFI_XRDC       0xc200000e
 #define SYSCTRL0                0x8
@@ -43,6 +37,7 @@
 struct imx8m_chip_data {
 	void __iomem *dap;
 	struct regmap *regmap;
+	struct reset_control *run_stall;
 };
 
 /*
@@ -137,8 +132,7 @@ static int imx8m_reset(struct snd_sof_dev *sdev)
 	/* keep reset asserted for 10 cycles */
 	usleep_range(1, 2);
 
-	regmap_update_bits(chip->regmap, AudioDSP_REG2,
-			   AudioDSP_REG2_RUNSTALL, AudioDSP_REG2_RUNSTALL);
+	reset_control_assert(chip->run_stall);
 
 	/* take the DSP out of reset and keep stalled for FW loading */
 	pwrctl = readl(chip->dap + IMX8M_DAP_PWRCTL);
@@ -152,9 +146,7 @@ static int imx8m_run(struct snd_sof_dev *sdev)
 {
 	struct imx8m_chip_data *chip = get_chip_pdata(sdev);
 
-	regmap_update_bits(chip->regmap, AudioDSP_REG2, AudioDSP_REG2_RUNSTALL, 0);
-
-	return 0;
+	return reset_control_deassert(chip->run_stall);
 }
 
 static int imx8m_probe(struct snd_sof_dev *sdev)
@@ -174,10 +166,10 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 		return dev_err_probe(sdev->dev, -ENODEV,
 				     "failed to ioremap DAP\n");
 
-	chip->regmap = syscon_regmap_lookup_by_phandle(sdev->dev->of_node, "fsl,dsp-ctrl");
-	if (IS_ERR(chip->regmap))
-		return dev_err_probe(sdev->dev, PTR_ERR(chip->regmap),
-				     "failed to fetch dsp ctrl regmap\n");
+	chip->run_stall = devm_reset_control_get_exclusive(sdev->dev, "runstall");
+	if (IS_ERR(chip->run_stall))
+		return dev_err_probe(sdev->dev, PTR_ERR(chip->run_stall),
+				     "failed to get dsp runstall reset control\n");
 
 	common->chip_pdata = chip;
 
-- 
2.43.0

