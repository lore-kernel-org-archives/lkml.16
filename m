Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1E8190057;
	Mon, 14 Apr 2025 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634151; cv=fail; b=sPUTORTT/xYVBa0n+s7m/0A+/u73e1JQuh5T9UTNZPVOFkRkRAZkdyc9u0Y7F2x8fsF4/KFl4I9fMC459eMnLTPGPquwgNMYjhen2VnUDtH51osisCfUZlJezIO3BLz3XmPdP/782qBFliw5V1C6zMjRi2wU07NKr581y0IS464=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634151; c=relaxed/simple;
	bh=kyZe/1SNz6L8DOVl/Z0EX/kqnW7gLFI5bwEQ6EWWYxg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=h4e6hOhhX46+OTNWepj9xUVwuFavC+4A5hsHiNTgruxvVqPIYvdGQzPbeQRu/92IiVHp90+ogo5YkcJn8d107ORSgOafub/bTnot0qGzpSKrgFvyss2SR7FzQkKaEBojWkL/Hk0nnLZZbNbe3McQmbaP94yX8DH7Okr9viGDo4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HWiraRkF; arc=fail smtp.client-ip=40.107.21.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HWiraRkF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taqn0uti1m2pLLf7ptY3GMwU7d4RkIUqee2d3ULy3TGlDmATeitXXhYT9pcLovVcC4ASrbXzFNJjyDCVbwehUYCV3CkdP2sPWtwepYWcfJlYUgjv0bNIfDwcHVaShNS6R/7P6B6EZ8JwztrBdR+xOevRyFSB4CdYzgrBjw0iXsxLoJuz7BqaK0bvADHWVqRVmbdVI/28+PCEH+SnhUm6eIQSezHaedKH19/FWv2JU1Vd94LB/lPc6TjbIUr6eFkjLbl3Pc0+aElgyYGEzMxQj67jn2ojvTCZz7s7OxNPjz1ePNKs5e2CWxb1sVbL7XBJl9VMNnI3MxWP/jPYQjtbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Afgn00Z1czRLXMMU0tcPvwOMCz4rgfqO9u93WpD3DDY=;
 b=hOo0ZB1oC/GfHPxDGE7tR/MDDvfQT8L860CMPwBU+hRsIPrEEo6VdC6lADkzvU6xJCMcJOb+n68MagRh+L6pUpk7o8QbGKpFngG73lQDq0L50GBAtMBOMPx+i0cIqsVcoqzQ90CfFaCG35Jcbg9xYUCdGx4eO2XkU5uwnwNDJa3yGAHLbqhXhTIgN4jHzW+OCfouBpwvCF1dFu0eoSThLL4qMKHKbiwrS5M2tkjR3oM/aM4JBKJNXN/Xxi3/t6VydLobizIwIEjndxF4m8e9F3RykdW75J+fNwyf+ei7I5y//VwLucCBFaiwzFEsNrGzDPgN8yddbXeY6cr76N+hjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Afgn00Z1czRLXMMU0tcPvwOMCz4rgfqO9u93WpD3DDY=;
 b=HWiraRkFglSRwJYU162iClio4by4mLEE03uk58PXJNZJxQe5v0CGbMXFxLJLYUFfjGuv6rUBb2KC88FFV92TKuhk7Ze+Vi0xAWBc/Yzz/3Z/8zyh5jxdK/AGmxFiXQuXQ9yItGlUEg+cd5G51LIU0mYx8ZAUC11y69hbQaDFYHD9Fcu1TQvP+K18qlrKB9eymp84BF+fxbq2HiQdNmjv7Ov67wN1tMJPQ8tsMPwLF7frvHgqTHoYdNXpqj0+xUcu8tcInYTXEcOuaFsy3ZAZCmR3RojN+8XoZ0DS4No+nbSbI+clzBYytfIknsPiwE+sAXF5hadp1zeg0/qDhcMTYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI0PR04MB10420.eurprd04.prod.outlook.com (2603:10a6:800:21a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 12:35:43 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 12:35:43 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH] clk: correct clk_set_rate for clocks with CLK_GET_RATE_NOCACHE
Date: Mon, 14 Apr 2025 15:35:40 +0300
Message-ID: <20250414123540.1774593-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::13) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI0PR04MB10420:EE_
X-MS-Office365-Filtering-Correlation-Id: 732594f7-34da-4b86-e0e2-08dd7b50df71
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elZpa3NCK0YwMldLdHk2TDd1S1BaVUtNUkVqbUtpenNxUHR6YVA0OGU3TkMy?=
 =?utf-8?B?Q1c2WFQvT1FJM2taTXJJWmhSdVFBenRxTUtScXNIWXBWVzJtZ1FVbE1nV0xz?=
 =?utf-8?B?ZWFTTWovbXloOW1pY21Kcmp0eTBWZ29EU1Z3cXZvSGJhSEREemg0ak5xNHZX?=
 =?utf-8?B?ckxlVkxKMDlKT0d4SStnamJHRmlqNHZENlplYVYrUlQwdmxZT0JXR3FOYVZP?=
 =?utf-8?B?ekFaTVcvaUt5Z29vQlFzVEk3Wm5RTGtXdThocldUMWVta3lKZEljaDRRd1BU?=
 =?utf-8?B?eDkxK2N3K1BQUHVjVUFaWEdhOVR5WmtydDdscmRyQ1ZtaEVIbU84bUV2bEwy?=
 =?utf-8?B?VDRNVlNuc0pqSHB6akpiY1pEcVd6aFRPOFVvRGVvQVprLzRydFd5bGpEWHRu?=
 =?utf-8?B?cU5PdFJGamVOVUU4T2VtWWZNREttZmJCWVFCMEt1SnJINlU0WWdOSGM0clBR?=
 =?utf-8?B?MHllTnFjdWRCcGFZci93SngvbFFvbDhGSE1UU0JXUUx3QWhZRm4wOVpVRDZn?=
 =?utf-8?B?aWpKRGhZU3cvdy96NEJEa05VajVVVVk3eVZTWEpJSVZnTGJpWU5STHo4ejBU?=
 =?utf-8?B?b2RQUW1rQkFuU3Izeks4dXBDU2ZKTkNuT3ZzTHZPUzZpTXlLNDBEVmNxUTdH?=
 =?utf-8?B?ZEJ5cVFISUJMMW0vdXRGanZRcXV4RktqL3k5Ty8rTlJ0d1JRSXh0Q3F5Sy9G?=
 =?utf-8?B?M0NHVThuK3hwU2tiRnBPRXhZR0dTL1B1YUtsSmhDTFcxQVB1WFpiWFlOVEln?=
 =?utf-8?B?anovT3lEOFVmMDBXd1YxYlNZMHlRUjEydzQ4RUlUakZnVXJNWWxObktTbTlk?=
 =?utf-8?B?S3BIY0pZYkNwNG1IVEV1OGNCQnIwM3gvWlpGVGtISHdGTTR1bU54SHJFWjBH?=
 =?utf-8?B?b3F0UkJCeHJOb0NwN1NNUUNTTXJPVzRSNVExanZFL1ZzeDZzYVlmc3dKL0Zo?=
 =?utf-8?B?OFVvNmtQOHU1UHVyMWwwWnRIN0p2cGtRTWorRllWdGcySW5OMmMvVzJ3aEl5?=
 =?utf-8?B?bWlWQkprV2IwcmVIZ0lBTTdERWIvdk5WV29BRUNTVnRoRnhNbVpzdGgvNmZi?=
 =?utf-8?B?YVJTaWxhdDJWZ2V1QmZSNUFzTWJ0L0piUjdjVmxIWGJPeVFpVTczNUJVOEs2?=
 =?utf-8?B?VnlEa2d1TXltL0Jud05Oa2VHRHRYZ2d1TUhMQmRXUC93cjN2Yk5nY3pDeTBy?=
 =?utf-8?B?d0hkNGtjQ0lOQ2o0MTBlWDFJR2xsSFIxTHN0eEdXcTN1bzgvKzVoNHhOY3BL?=
 =?utf-8?B?ZlJ2aGQ5TXp3enh0bWZkNGdhbXd1Q2tpamsxWDc3ZXpmRzZ0OTR6T3ZUVXkr?=
 =?utf-8?B?K3l4bmpCeDVtcHFrQTkvZk9HK3NZd3ZHckFhNU9hZWljZHc5WURPSmJMVWhF?=
 =?utf-8?B?YndkR0RneHNQVkZMdHNPZEdwNHJiUlZHSkRTeTAxVFdJNEJmeC85ODFLYkRB?=
 =?utf-8?B?N21XekhHSFBCN3k3ZHhHdlBSbG1JQTJVTTgyMHp1cTg3VTlGN1VvL3RabGFI?=
 =?utf-8?B?Qk5pVVV1Sm5DVURDbjQ4SlpuRndYMlBud05oMXF6OHdmRDY4YkV2ck1XWTZX?=
 =?utf-8?B?dFQvWHhSWGJaZnF6NVlPM0liZk9Vc0xYWkF1WnlreThsRzg1cnR0ZlB2eEFw?=
 =?utf-8?B?Q3Mxc05ZelRSUFluTC81ekxxL2U4NFVrT3JjN1pyeVpIbGx3NVNvTHZYY1A4?=
 =?utf-8?B?ZmxYQXBjdERkRzVkbUtnZ1RQQ0p1OThhVHVIelBHUXFpOGFGem9UcERYZWZv?=
 =?utf-8?B?N3V4dklPUlROemhGTjlOZVNMTVFsVDYyQlBVd3R2M0haRXNOL3B6bUlXQ2o0?=
 =?utf-8?B?TlowaWdNS2tWSnlIckUyaFZKMzFxV3BXL0FlOGczZ29yRWZhK1A1SE90QUNo?=
 =?utf-8?B?Snp1amNNQ0wraVZFTWJkOThlRG9MOGM0OCtzZnlmRk55ekF1eXh5OUd2ajZ5?=
 =?utf-8?Q?VyQzio4ElZA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE4wYWV1L3FYaUhPNEZ5cGd2N3BGbWxDVS80b0tTb2xtaWNBemloVGpVNEEx?=
 =?utf-8?B?UDRQS1RFWGpwcFpLTjlidFhEWFdWeFgyZ281SUNNSjdVd05ndXlDN3JEenBT?=
 =?utf-8?B?SSs4M1lmcEhMb2tyZ1N2MDYraldPTmh2a21MOU1LcmM3cXd6QTZKSEljaHk4?=
 =?utf-8?B?akFJZk1HS25ib3o0ZFE4Y3JxZUhoRVFGUy9PdTlQRW5oNVJQaklUSGVvZURY?=
 =?utf-8?B?WVdxUXU5VWdxL3pDOE5ueG5uVlplSkQ3Y2czemJINzF2enBHaldRWldkSGhk?=
 =?utf-8?B?YVlhNEx6dkgzY0lIeDB0Qy9HcTJWVWozRklPU0JVTjJybi9TMDVZK0lHVGZw?=
 =?utf-8?B?ZnYyQ1lIRXMwenhmdnJpR00vMnc0dmVYTndNaWdmTkc0bWFVWlExVXpEZko4?=
 =?utf-8?B?K2dNVHJRa08vQXlhekZoZ3orSzAybGVwQ2dDcDFvTll5UXhWa0xUOHlONGM5?=
 =?utf-8?B?bE5MSW5RUjUvZjZTbHV3akhkeEtvdkNIcVNSQ25oOU1ENUp1Wit5NU80TnJB?=
 =?utf-8?B?TUdmRjlGb3ZJdG8vcndwUW1iUnBvbWEzdjlyeWRxR0Qva0lkWmsxQmFIRTRv?=
 =?utf-8?B?dHdwNXIxNDBtUi9rWjRhbkx5QkNlWUdYZmFaNTJpUlIxc3k1MlN2N2p2OUhY?=
 =?utf-8?B?dGJ4bk5nT3RqTzNyRlpjZVcrbXNiZVVaVHJVbURyTFJhc1lwV3ZIdTNpNFd4?=
 =?utf-8?B?eHh5YzNOSEd6Q09ZdzJXZTU1Y3R3Ui84aEgwTTVwMTdGVk5yb3BPRmY2N1By?=
 =?utf-8?B?M3I0Q1BiYjFRUlVyVVlZTUZaSFVMVWl1SDI5MkdIQU9SMkJnRndWWTNQRStG?=
 =?utf-8?B?aktvc0RRTmVheVpJbkIrNk1sa0JzZEk5T0VyVXlqOXdhSEVVbVFzWFROa3pJ?=
 =?utf-8?B?eHR5eFd4RUNZYlhzajRpM1ZHTE5aZWNYRUNPQ1p3N0Rkc0dnS2tpZDA1dy85?=
 =?utf-8?B?bzJLUGNBNlpXclIzcEJnWE1nV2lSL0prRkhvd2dlZXhyM2JISVpzckVVUk5H?=
 =?utf-8?B?cFR2YWFVUGZXWlgveEFFcTVwNzFQbDFiNCsvSnN5VG1HaG9sd1RJd1BHVzlZ?=
 =?utf-8?B?ZENOSnNSM0huQVZ0WWRzVWIxRlhlWjJhQ3Y2amgrejN0T0NaNW1DcTJjMjRa?=
 =?utf-8?B?OGs5T2pGWWhEYkdYcmIzRTI2MHZvcTBmcWRidWNGTEF3YVA2NVdob0NRc3R6?=
 =?utf-8?B?dkljVUU0Rk56MzdNbjA5czNsOVRLRXFrZkh0dHlxNFJOUUlIVDZ6V3FremZU?=
 =?utf-8?B?MXd6ZGRqT3V0M1VhcGF6MWdDVkh2UWNrRUxyYnVYamRIZisrZEZRWTdvZHBa?=
 =?utf-8?B?Rk1tL0V0SXYwK1pJRk5XbE1xZ1NtaC85d1lpQkxFVUU3VFNZRkZYemsvRVZC?=
 =?utf-8?B?NmM3RzROZTRMUWZmdW1SQ1FLamZFbWZIYVMzMGRKTy84UWFVN3VMSHZFQ3Fw?=
 =?utf-8?B?VEdmNnpsNTg1T3hBT3ZZenN3RWlyd042aEQ1MEk4ZDEwY082VDh0MWhEdWpW?=
 =?utf-8?B?WEpBcVhHWkpFSTlsc2tiYWVUNEErQWlDWGQ2N3A4a2lwZU5nVjdNT0xvSWxP?=
 =?utf-8?B?T3RDNjJ3NTk4aC9QTGRQZFJSbnpHNC81RlB2UGNSeUkzcks2Q1pEcUMyeW9H?=
 =?utf-8?B?U0ZBVFI4aUdnZm81ZDQzdElPTmZjVGgyQUF4U2dCb3ZNa09scHhHYkNCN01k?=
 =?utf-8?B?UVF0cHBCMFEwLzFVemJjN3dPcjhWek10di9RODZSVTBYcWl3VGcyOGgvMUda?=
 =?utf-8?B?a3NaQjNBL0Zydkh2T3FFT0QrNHByNFZYWUF3SDlXRTBYNXZjdldocjhnTFox?=
 =?utf-8?B?V3kwVHhFZUM0cHdFZkFzaENEVDZiOERONzZTTEg5UFIvWFlncEtNS1FhS3lI?=
 =?utf-8?B?clZLU0YzZWtDOTBpNDRvMGVDRWVpQkxYSVdxejNIQXJNR1V2NmxPcENNdGZy?=
 =?utf-8?B?QmErbUQwVGJOb1JHdDZnNURPci9PaVQ4VVJzcmh0UGI3bEFjUS9POVZUZHJx?=
 =?utf-8?B?ZVQyeTJvd01FNlFITTRDRGRQTzNxb1hBZHNEVW9qMXZDMUgwZGNXUTNMTHJa?=
 =?utf-8?B?SmhhQjhySEJpUGtnOUJzS01aWTNJa0hXUmNUU2pkTG1VYkZWREswejlqTjJO?=
 =?utf-8?B?Z0dud3FzK3pwSC9VdU1zN3ZoQ2RmalovQWpkVnZtVjV6V1Y2Um0xZWNXY0Uz?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732594f7-34da-4b86-e0e2-08dd7b50df71
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 12:35:43.6839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXUJIq/i0u46lvUxYw6NGdnU2OYZK1sWZKFNLhbrlCH440AnB1NDyWX7WnyF0Dw3fbY93x+A/jOa/mw87eDEJzf7bdOCS9Ygzy8QRPpSzmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10420

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

According to CLK_GET_RATE_NOCACHE documentation, when this flag is
present, the framework shouldn't use the cached rate of a clock. However,
this doesn't happen during clk_core_set_rate_nolock, part of the
clk_set_rate flow. clk_core_get_rate_nolock was called instead of
clk_core_get_rate_recalc, which should be used to consider the presence of
the CLK_GET_RATE_NOCACHE flag when setting the clock rate.

Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf..d85a6aac0f3c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2530,7 +2530,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	rate = clk_core_req_round_rate_nolock(core, req_rate);
 
 	/* bail early if nothing to do */
-	if (rate == clk_core_get_rate_nolock(core))
+	if (rate == clk_core_get_rate_recalc(core))
 		return 0;
 
 	/* fail on a direct rate set of a protected provider */
-- 
2.45.2

