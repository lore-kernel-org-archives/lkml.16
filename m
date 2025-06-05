Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08414F9EC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094933; cv=fail; b=uSGBdjQ+lTC8Aj5mbuRff2tk4lA0mnSAQvop+XKNwcuxdDHjA8AaG0LPYfVF/4GY6s0x4uAhcpdiiNcbGfBtxpVAOcOeWe/pn+c5adp5dOdNj0AVLofuMTjh/mZUD85kKBkSUmD9AFY+vWA8PucG8jlRS6prABBBVLwDqLAuM1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094933; c=relaxed/simple;
	bh=1ySWdWnRlRDmMqTply4jDVe704tOdP1F/UERhQCLtuY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KdY5m/MAGtgPIwr80Yfhb8+l1uEFuuBRkbaqrkocQ5MZy6cqkIF5MgYRqStW1hrQxbJlLYETAwvgCkfpmO/lhGytwzDBb9FpHgVAISX4euMiybtSNFvbSLnBxifofBhmRLBo2CWIzFYzjsnonumkxFSQS6WvqOPTSz/oc8BPOp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nqYALxeO; arc=fail smtp.client-ip=40.107.244.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nqYALxeO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEtIDbftz1YS7AlPmS9QqOVatxFm9uVF3EU28QmW6uKpNwKgR3S+w4g3tvW9YD1l0xBIf2Ypd8rjNuwD9i6YwEgNNToabDVYT+A+Yq9+IrfkDBP523PO0P3t59T7ypdYuS9TGYlK9aDeIETRhYutKOSaSDRak7pf52bODLgU/rSOiJ7rOShMJG/v0f0E1R1n6/55+aIZimHXT+6RzjLBRLP3tjs5yYgJaS5dBrKTfwegT72PpNAF0tfNbfCRb/aPrIM/m7M66zb683AIrSj2xJR5q66NYpP+Zp2GpaWWxDGkfp6naNuWGe3hAT6ptzYftsGy9autiIzdQjjyMBKlAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2lYgV0JyLH6PIKspmsAm0XF/O/I/VZ7NC6Wvplr11Y=;
 b=KafkbMXmR2NX9ujYagH5aEz5emTaAzMAFs00Kigq62orpn5uwGf4GM4o+Hq2Ip4bg6wEfrOQyJ1qRWNgm0sSxLIbrqc0FgGxK4g8fB2FPE7DUB03ZXbtfgr11FLtFj7YmtdSDbYsrYoomNb1r0QmjPGLNsCfl0SiaJX3gDjmHq7pg/yyRn1Oy3eySODztH6vS3Q903jq07eoL9U0m1bk/En3f5DNB93tY9dL19BkDzBr96h2xdg9qmk3W3ycnRdUg39jPIWCD7xAhsv6oqVE4DOw+N43oLkcnsR4bdzuoGktUv75j3Gj0YPdY+D8HAYR8lFWUZt2d3IwrMx0S7qfBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2lYgV0JyLH6PIKspmsAm0XF/O/I/VZ7NC6Wvplr11Y=;
 b=nqYALxeOhmuPostcjjfQDqDyvqBYSVHK4ZRAIVse+xXE/dG/x9RZPSuImwuK+i+8GLHIXwUC65ntCMVjvPNy4bZhflhMuyzXK/ghnYwCTOxDzHMCKJqJr5TC6mB2hl/ZJQ1gxUC31VaiP9CQYi/iEffXeqyGw2b6Blt9Vhuy9F0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 03:42:08 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 03:42:08 +0000
Message-ID: <02751a68-3981-4cc5-886f-a816ae39bf88@amd.com>
Date: Thu, 5 Jun 2025 09:11:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] sched/topology: Add lock guard support
To: Jemmy Wong <jemmywong512@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org
References: <20250604185049.374165-1-jemmywong512@gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250604185049.374165-1-jemmywong512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::7) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|IA1PR12MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: d15c2f44-5ddc-4bbf-da29-08dda3e2ee51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2JKODcyRWpoajJQN0FlZmxPUGRYMktHQVhpWmhQSDkvcHZVd2JMNWdpcUk3?=
 =?utf-8?B?R3Z2U1VzVFlEc0EraE44SHlsc0ZwT0VxV1BFVTZ5cXhQeG5UTHV4YmIzVU84?=
 =?utf-8?B?aE9XSFpOWDI0R1JlRTZGeW95aTB4TGpUcUU2WFk1aEZZOFUxbXBVSnBTSlNi?=
 =?utf-8?B?Zm9xYUVWNy92YzduOUs4bjRFMHRRYjIzQ202eGNGQlN2NDRZczFrdjV6UXNk?=
 =?utf-8?B?Mkp4d1dKZFJLc3FzeENUcDBQdFJRQkVCYmhmVzB4bG5ONHBVS29mOTk3c2g3?=
 =?utf-8?B?Q1ZtbFhybXJ1RzdsS0kyV0lDc3NhcWRrbzRyM2xpSmJaYzdtNlB6QkZqMGdB?=
 =?utf-8?B?alRuZ1Q4MXMrWVBiMXhEdGkxa0JuMkpHdzZCLzQxZUxDb3FYMHdzblVEd3lr?=
 =?utf-8?B?ZTJ2a05SdkQrVDdZQ29YdzlaMlhhcnhzRjI3Z3h4bUJCRzZjN1Vka0hFZkoy?=
 =?utf-8?B?T2xqMDBXT0NTY2hFYlh2U2pMMk81K0FIaGE4M1dmN2lJSnJNNk9SVk1LelEw?=
 =?utf-8?B?MGw5aTdoSUQ3aDZPUHRHWDRjdHFJSmFUZFZaalNpSHQ0anFRZkVBOE9NaXNL?=
 =?utf-8?B?NEVYMlhPN0dIODRDMFFlQkxhUktNdzJ4eTZxdHlHS1JHOStjSFU4VGM4bjZt?=
 =?utf-8?B?WVRuT2IrYXgzQy9tTUdPVnNBSzBEWGNTQlJGZUQwVmFBV2pwOUxBNVB5VWhF?=
 =?utf-8?B?Y004NG5WVHBob2VSUFhQbHBrTlU3cUtQZTJIajZnT1RieUdlVk1ldmlCVEls?=
 =?utf-8?B?UWdXMDF0OExXMmtJd2EzVDJnNmdPVnphbVV5L3RDRFc3WXBxY0hiYWYvMGo3?=
 =?utf-8?B?UXh6NmozVFJVZXFoUDI3ZmN6NEM1bTR5aEcrSUNVWVhDSUFCZXBhK1gwY3Na?=
 =?utf-8?B?STZyR0E0R0dEQTBxYmphbUsyT3VBNHY0NmFPcUQzTDlLSHh3ejFEUklqSkxw?=
 =?utf-8?B?UkkydXNtZEFtMThsTHBHR3QrS0EwdmJ3aDBLTHJ6c3BTNXo1VEhucjYxRU10?=
 =?utf-8?B?U1l5aWtEUXVsYjdod0xHcEd1WEZOL2lpRTBjQ1p2QXBFbmJZeVdPNWhrTDBi?=
 =?utf-8?B?Mlk3aXNXQTJ6ZUZjY2JTaVhJVW9rM2Q1NjJmZ3RhRzFiWmlWUitzU0hQOVhm?=
 =?utf-8?B?ZjU0NElsODNnRmUxNm5qbU41OFY4eTY1eExVdXhLTnZsREljL1ZjYUdWUkJn?=
 =?utf-8?B?ckk3QTVoZnVyWjFZYkExWm85RTVxdkZRU0tncHkzNUxLVzRPWkZTbHJWcFVX?=
 =?utf-8?B?VDhTeXVNRGZieUt0MElTcHRUOU5VNUp2Sm5aRGNISExJaGhweElDVnEwR2RV?=
 =?utf-8?B?MWNLZjA2S0JtN2JLZ0tsSUx6NDZYZWVqRWoreEo0YTIxQWpOUzhDaEpQUWJk?=
 =?utf-8?B?ZGRiNFNoNnA0T3JiOHlJUzgyc2l4MzUxQjk0dXl1MkVOaVFWY1RPb0taODhw?=
 =?utf-8?B?OWR3aTdjN2tMYVF1MnZhRDNXT3ZYTXUvekk1NnJ1UzYzMnMzbkQrRHZ6R2t4?=
 =?utf-8?B?RGYyRitBU0d6UVhmYWdrYS92d0l0eVBVeENWMTV3QkpkMVR2Wkk4M3M4M0tM?=
 =?utf-8?B?UFdlZjV4TFB6OU1CdkFZY0IzKzlMKzR0Qk4rRTZPelh4YUhqM2tYd08rcm02?=
 =?utf-8?B?TU56NCtBUVpMZzRwblpGRExGYVFHSEdQSkNjUER6L2JTcFVqR0RJRS8zdVBz?=
 =?utf-8?B?MGlqRjFCZE5FbzZYUU5HaUx5SmVQMWVxc2MyMjkrNExwemlJV1FMSkNmRVND?=
 =?utf-8?B?VHhFTFJ0VERuSjhOWHRPUkUzMmZGbDJyRSs0S0ltMzRhMHAzRW92UjFtRFpY?=
 =?utf-8?B?MGlZbFZOZ0ZaUnBjL3VVYWF6QjNXM3ppbUtnM2V0VDRPQ1BKMEs0cURWbytT?=
 =?utf-8?B?RWY1dzVxZDVnbG5MWFppamlINExJZDZIcjZDU2tCRm5iRDc1Qnl5Rk44MDJk?=
 =?utf-8?B?a1J5WHNFdjIzMGZkd1FNMVNRMDNrbXZsQnVCdDlVZjVCN2w1Z1Vjb25kTERH?=
 =?utf-8?B?eTlQdXlZaXhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak1qQ2hyWEhMbTN3bDlKRGpiMmwwemNidFErQ3h2cThxYU1qTTFKL0toUFUy?=
 =?utf-8?B?YkZvVjBqZmhUNEFnTTdjbjMwVFdxQnZ0c2ZGVjBSVUxKaHFNVlFiakRGQWZx?=
 =?utf-8?B?Rm83NzAwaHlYenJmTmNURENpK29Bd2Zudm1NQ1BvbGxDSUdFbFM2VFZvSVpz?=
 =?utf-8?B?Tk9QTXlZN01LQjRuZ3FTS200SCt5SXlZVWEyckJXRGozSUJKVTQvSUlwOGdZ?=
 =?utf-8?B?WVJPWGZlV05OYmNuTXkyMDAvRTVNOHdQMjJjQWdFck1IbGx2aEV6YnRvRVVs?=
 =?utf-8?B?MTJvUnVtejFPbzVsa211RkFQZUxaNTdKTlIzbkNaSm1Obm1IeGVwR3duUkdB?=
 =?utf-8?B?RE8rZERwMEY3bmhlRzduZmhqKzR3M1h1VDlLaitLN08ySWRQN09BZmdFeHhm?=
 =?utf-8?B?T1lPcTkyTnYyREczZk93bTR1bktHWG5FTDY1MndtdU9QUEJLVDNQckpGWkRL?=
 =?utf-8?B?UDgvMnJvRmoyMDVIM2ZSc0FxemhydGxlN2JEV0hpdDVlRDNlOERNci9HZFor?=
 =?utf-8?B?aGFrTjJndlExb0g4NU93K3dyWU1IWCtVNnNRSTk2ZTlqMEcvZGxXL1I4ZTN1?=
 =?utf-8?B?b2x4TUU3dnpNa2ZwWGVWOFI1czdvc0dHeTZ5RU5VZm1heXF1SFlEa29WSC9r?=
 =?utf-8?B?QUN3UlgzNGFRd3p5Y1owTld6N0R5MnY5L2hBblZuMVpXZ1VwSXdnU3kxUGpH?=
 =?utf-8?B?VFhGVTlIUU9pdGdGRjkrSlE2NENvUFM0c29kMlQyUFBzR2h6S1hnWGZBQkhr?=
 =?utf-8?B?TEdvVDR1QUVRMmt3U1RodjRrRGMwcUpmemlxQ21aNm1CSFh4UGlTMnJwb3E0?=
 =?utf-8?B?OWc1emw5bDljWkViQ0Qrc005ZjQzOUlwTFdkWkJEcVhtRWZSb2FKT1hNTzNa?=
 =?utf-8?B?anVDMU96dys3ZTZndSt3c3pySi9rZ29mMUdObzUyRDVLeDhwTTFDUU10NmZO?=
 =?utf-8?B?eVRCSU1yMEVVWW8zYVNwQmdtTmh1VjdNYlFVRm9IY1R6QTZLYjJYU3dtQ3Ra?=
 =?utf-8?B?OXl6RDBsdFcxWDFrRER6RnhEZ2FGcmd5U1A1MXVGT054QTZnQnl1MFNSNCtk?=
 =?utf-8?B?R0N2dDluUFJLNGI0KzdPMlFJenNBSVRMZjI3T0NEMHZaVlo2bng3U3B0QWVt?=
 =?utf-8?B?N2pqZDBiU1QwNUUrbHJjVXY1RFloZnlieHI5TytPeUltZ0UwUVM2VUpFZzAv?=
 =?utf-8?B?K0VwRW93TlNZd05uZzBRQy9peDZiREgrTEw4WC9GeVNoMTFHK0ZsNng3MzNk?=
 =?utf-8?B?WG9UbUZSbVFlWFQyZU56SHhtV0ZOazdvUW5NelVNOGx1YVEyVUVNSzkrakQx?=
 =?utf-8?B?Z1FTZG15K1RTeHJLVmQ0UThod1FEZWxLT3pvNDVLNU9RVHBkRStlRTh5aFlq?=
 =?utf-8?B?OEZjbnhickVVMzBKSzV6c3l6T2Vla1F0NnY2eDFHU2VwdHkyNHFlNmo2ZHVp?=
 =?utf-8?B?SUFVMlBieFQzaTFteWdFYmtRUHhLSVlSM0JpamtFbmNHQTVPTDB3VjZ2VTFt?=
 =?utf-8?B?VytYQ0k0MmpCdlBRYUc5QktueUVoS0tJcE9XUnRmK0JQR2pmOTdOTUVGYkpQ?=
 =?utf-8?B?bm0wTENtNlVQa0RZd0RiYWtXSm45eVlvRG02RDV4K1BtQzNIeWIwVU41SmNF?=
 =?utf-8?B?ZjM2U2xmak5XRWlUbWNWOGpsT0o1a05TSm4yOW83OVF0NFN3Z041VTJqZHJF?=
 =?utf-8?B?eE0ydjBxSkFKWGRhKzkvbEFGc2FHUE9zVy9HTUxWWU9xVmtoSUM3ZDNUeUxs?=
 =?utf-8?B?cVNPaExLY0xPNi9XdW9rV2VNY1NtNEs4eHM2U2xHdzZnYU9FcCtLcFJtQjdx?=
 =?utf-8?B?NWk1bUFEcW1ieG11MjNDZGlBNUYybllsOVNIeGlmaWc5akZXZ2h0MVNJeW5D?=
 =?utf-8?B?SW1tYjJJWVJoNE1TZVFnbXNKSzhNc01aVnQ1QXU0SU9STnBDSzBULzMzazRl?=
 =?utf-8?B?cWZTS0wwVjJFS0k5N1d5RXpDNHdqbkxHS3pGcjFrZU1nRmUwUEQyMGJ6TlMv?=
 =?utf-8?B?ajJyOE16UDNDYXJFSWVqd2dhOWtqYVRidGt3UHFJRVJFNlg3S0xOaTAwUytM?=
 =?utf-8?B?MTgzVW5ZTk9QWExpclRlWk45eVBqclV3d1JRU3ZFcmNaeW5rSTNINTM5aFdy?=
 =?utf-8?Q?bvv67r5VVPHfmro0e3qfpyeKA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15c2f44-5ddc-4bbf-da29-08dda3e2ee51
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 03:42:01.7907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxO2QJpI1EVTHmTKnnNaZXIZNY5cPagLagD+3Z7x0gdqOzoIeUVlCCph91YKtdTWpR2qU4CJJ0uZwzpav3bngg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8495

Hello Jammy,

On 6/5/2025 12:20 AM, Jemmy Wong wrote:
> This change replaces manual lock acquisition and release with lock guards
> to improve code robustness and reduce the risk of lock mismanagement.
> No functional changes to the scheduler topology logic are introduced.
> 
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
> 
> ---
>   include/linux/sched.h   |  11 +--
>   kernel/sched/core.c     |   6 +-
>   kernel/sched/debug.c    |  28 ++++---
>   kernel/sched/rt.c       |  46 ++++++------
>   kernel/sched/topology.c | 162 +++++++++++++++++++---------------------
>   5 files changed, 120 insertions(+), 133 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 4f78a64beb52..10a9d6083b72 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -46,6 +46,7 @@
>   #include <linux/rv.h>
>   #include <linux/uidgid_types.h>
>   #include <linux/tracepoint-defs.h>
> +#include <linux/mutex.h>
>   #include <asm/kmap_size.h>
>   
>   /* task_struct member predeclarations (sorted alphabetically): */
> @@ -395,14 +396,14 @@ enum uclamp_id {
>   	UCLAMP_CNT
>   };
>   
> +extern struct mutex sched_domains_mutex;
>   #ifdef CONFIG_SMP
>   extern struct root_domain def_root_domain;
> -extern struct mutex sched_domains_mutex;
> -extern void sched_domains_mutex_lock(void);
> -extern void sched_domains_mutex_unlock(void);
> +DEFINE_LOCK_GUARD_0(sched_domains_mutex,
> +	mutex_lock(&sched_domains_mutex),
> +	mutex_unlock(&sched_domains_mutex))
>   #else
> -static inline void sched_domains_mutex_lock(void) { }
> -static inline void sched_domains_mutex_unlock(void) { }
> +DEFINE_LOCK_GUARD_0(sched_domains_mutex, ,)
>   #endif
>   
>   struct sched_param {
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index dce50fa57471..b2b7a0cae95a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8457,9 +8457,9 @@ void __init sched_init_smp(void)
>   	 * CPU masks are stable and all blatant races in the below code cannot
>   	 * happen.
>   	 */
> -	sched_domains_mutex_lock();
> -	sched_init_domains(cpu_active_mask);
> -	sched_domains_mutex_unlock();
> +	scoped_guard(sched_domains_mutex) {
> +		sched_init_domains(cpu_active_mask);
> +	}
>   
>   	/* Move init over to a non-isolated CPU */
>   	if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_TYPE_DOMAIN)) < 0)
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 9d71baf08075..f56401725ef6 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -294,19 +294,17 @@ static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
>   	bool orig;
>   
>   	cpus_read_lock();

cpus_read_{un}lock() have guards too. You can just have:

	guard(cpus_read_lock)();
	guard(sched_domains_mutex)();

no need for scoped guard. Compiler will take care of unlocking
ordering before return.

> -	sched_domains_mutex_lock();
> -
> -	orig = sched_debug_verbose;
> -	result = debugfs_write_file_bool(filp, ubuf, cnt, ppos);
> -
> -	if (sched_debug_verbose && !orig)
> -		update_sched_domain_debugfs();
> -	else if (!sched_debug_verbose && orig) {
> -		debugfs_remove(sd_dentry);
> -		sd_dentry = NULL;
> +	scoped_guard(sched_domains_mutex) {
> +		orig = sched_debug_verbose;
> +		result = debugfs_write_file_bool(filp, ubuf, cnt, ppos);
> +
> +		if (sched_debug_verbose && !orig)
> +			update_sched_domain_debugfs();
> +		else if (!sched_debug_verbose && orig) {
> +			debugfs_remove(sd_dentry);
> +			sd_dentry = NULL;
> +		}
>   	}
> -
> -	sched_domains_mutex_unlock();
>   	cpus_read_unlock();
>   
>   	return result;

General comment, it is okay to convert the folllowing pattern:

	func()
	{
		...
		lock();
		... /* critical section */
	unlock:
		unlock();

		return ret;
	}

to:
	func()
	{
		...
		guard();
		... /* critical section with s/goto unlock/return ret/ */
		
		return ret;
	}

You don't need a scoped_guard() if the critical section is at the end of
the funtion.

> @@ -517,9 +515,9 @@ static __init int sched_init_debug(void)
>   	debugfs_create_u32("migration_cost_ns", 0644, debugfs_sched, &sysctl_sched_migration_cost);
>   	debugfs_create_u32("nr_migrate", 0644, debugfs_sched, &sysctl_sched_nr_migrate);
>   
> -	sched_domains_mutex_lock();
> -	update_sched_domain_debugfs();
> -	sched_domains_mutex_unlock();
> +	scoped_guard(sched_domains_mutex) {
> +		update_sched_domain_debugfs();
> +	}
>   #endif
>   
>   #ifdef CONFIG_NUMA_BALANCING
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index e40422c37033..3f6f181de387 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2920,36 +2920,36 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
>   	static DEFINE_MUTEX(mutex);
>   	int ret;
>   
> -	mutex_lock(&mutex);
> -	sched_domains_mutex_lock();
> -	old_period = sysctl_sched_rt_period;
> -	old_runtime = sysctl_sched_rt_runtime;
> +	guard(mutex)(&mutex);
>   
> -	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
> +	scoped_guard(sched_domains_mutex) {

No need for scoped guard, "guard(sched_domains_mutex)();" should be
enough.

> +		old_period = sysctl_sched_rt_period;
> +		old_runtime = sysctl_sched_rt_runtime;
>   
> -	if (!ret && write) {
> -		ret = sched_rt_global_validate();
> -		if (ret)
> -			goto undo;
> +		ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>   
> -		ret = sched_dl_global_validate();
> -		if (ret)
> -			goto undo;
> +		if (!ret && write) {
> +			ret = sched_rt_global_validate();
> +			if (ret)
> +				goto undo;
>   
> -		ret = sched_rt_global_constraints();
> -		if (ret)
> -			goto undo;
> +			ret = sched_dl_global_validate();
> +			if (ret)
> +				goto undo;
>   
> -		sched_rt_do_global();
> -		sched_dl_do_global();
> -	}
> -	if (0) {
> +			ret = sched_rt_global_constraints();
> +			if (ret)
> +				goto undo;
> +
> +			sched_rt_do_global();
> +			sched_dl_do_global();
> +		}
> +		if (0) {
>   undo:

On a sidenote, include/linux/cleanup.h has the following comment:

     Lastly, given that the benefit of cleanup helpers is removal of
     "goto", and that the "goto" statement can jump between scopes, the
     expectation is that usage of "goto" and cleanup helpers is never
     mixed in the same function. I.e. for a given routine, convert all
     resources that need a "goto" cleanup to scope-based cleanup, or
     convert none of them.

Although the compiler generates the correct code currently, I think
you should just replicate the undo chunk inplace of "goto undo" just
to be safe like:

	if (ret) {
		sysctl_sched_rt_period = old_period;
		sysctl_sched_rt_runtime = old_runtime;

		return ret;
	}

> -		sysctl_sched_rt_period = old_period;
> -		sysctl_sched_rt_runtime = old_runtime;
> +			sysctl_sched_rt_period = old_period;
> +			sysctl_sched_rt_runtime = old_runtime;
> +		}
>   	}
> -	sched_domains_mutex_unlock();
> -	mutex_unlock(&mutex);
>   
>   	return ret;
>   }
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index b958fe48e020..dac1dd5a6eca 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -6,14 +6,6 @@
>   #include <linux/bsearch.h>
>   
>   DEFINE_MUTEX(sched_domains_mutex);
> -void sched_domains_mutex_lock(void)
> -{
> -	mutex_lock(&sched_domains_mutex);
> -}
> -void sched_domains_mutex_unlock(void)
> -{
> -	mutex_unlock(&sched_domains_mutex);
> -}
>   
>   /* Protected by sched_domains_mutex: */
>   static cpumask_var_t sched_domains_tmpmask;
> @@ -470,44 +462,41 @@ static void free_rootdomain(struct rcu_head *rcu)
>   void rq_attach_root(struct rq *rq, struct root_domain *rd)
>   {
>   	struct root_domain *old_rd = NULL;
> -	struct rq_flags rf;
>   
> -	rq_lock_irqsave(rq, &rf);
> +	scoped_guard(rq_lock_irqsave, rq) {

I'm not a big fan of this added indentation. Perhaps you can move the
rq_lock guarded bit into a separate function?

> +		if (rq->rd) {
> +			old_rd = rq->rd;
>   
> -	if (rq->rd) {
> -		old_rd = rq->rd;
> +			if (cpumask_test_cpu(rq->cpu, old_rd->online))
> +				set_rq_offline(rq);
> +
> +			cpumask_clear_cpu(rq->cpu, old_rd->span);
> +
> +			/*
> +			 * If we don't want to free the old_rd yet then
> +			 * set old_rd to NULL to skip the freeing later
> +			 * in this function:
> +			 */
> +			if (!atomic_dec_and_test(&old_rd->refcount))
> +				old_rd = NULL;
> +		}
>   
> -		if (cpumask_test_cpu(rq->cpu, old_rd->online))
> -			set_rq_offline(rq);
> +		atomic_inc(&rd->refcount);
> +		rq->rd = rd;
>   
> -		cpumask_clear_cpu(rq->cpu, old_rd->span);
> +		cpumask_set_cpu(rq->cpu, rd->span);
> +		if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
> +			set_rq_online(rq);
>   
>   		/*
> -		 * If we don't want to free the old_rd yet then
> -		 * set old_rd to NULL to skip the freeing later
> -		 * in this function:
> +		 * Because the rq is not a task, dl_add_task_root_domain() did not
> +		 * move the fair server bw to the rd if it already started.
> +		 * Add it now.
>   		 */
> -		if (!atomic_dec_and_test(&old_rd->refcount))
> -			old_rd = NULL;
> +		if (rq->fair_server.dl_server)
> +			__dl_server_attach_root(&rq->fair_server, rq);
>   	}
>   
> -	atomic_inc(&rd->refcount);
> -	rq->rd = rd;
> -
> -	cpumask_set_cpu(rq->cpu, rd->span);
> -	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
> -		set_rq_online(rq);
> -
> -	/*
> -	 * Because the rq is not a task, dl_add_task_root_domain() did not
> -	 * move the fair server bw to the rd if it already started.
> -	 * Add it now.
> -	 */
> -	if (rq->fair_server.dl_server)
> -		__dl_server_attach_root(&rq->fair_server, rq);
> -
> -	rq_unlock_irqrestore(rq, &rf);
> -
>   	if (old_rd)
>   		call_rcu(&old_rd->rcu, free_rootdomain);
>   }
> @@ -1809,18 +1798,17 @@ bool find_numa_distance(int distance)
>   	if (distance == node_distance(0, 0))
>   		return true;
>   
> -	rcu_read_lock();
> -	distances = rcu_dereference(sched_domains_numa_distance);
> -	if (!distances)
> -		goto unlock;
> -	for (i = 0; i < sched_domains_numa_levels; i++) {
> -		if (distances[i] == distance) {
> -			found = true;
> +	scoped_guard(rcu) {

guard(rcu)() should be enough. No need for scoped guard. Instead
of breaks, you can "return found" directly ...

> +		distances = rcu_dereference(sched_domains_numa_distance);
> +		if (!distances)
>   			break;
> +		for (i = 0; i < sched_domains_numa_levels; i++) {
> +			if (distances[i] == distance) {
> +				found = true;
> +				break;
> +			}
>   		}
>   	}
> -unlock:
> -	rcu_read_unlock();
>   
>   	return found;
>   }
> @@ -2134,21 +2122,20 @@ int sched_numa_find_closest(const struct cpumask *cpus, int cpu)
>   	int i, j = cpu_to_node(cpu), found = nr_cpu_ids;
>   	struct cpumask ***masks;
>   
> -	rcu_read_lock();
> -	masks = rcu_dereference(sched_domains_numa_masks);
> -	if (!masks)
> -		goto unlock;
> -	for (i = 0; i < sched_domains_numa_levels; i++) {
> -		if (!masks[i][j])
> -			break;
> -		cpu = cpumask_any_and_distribute(cpus, masks[i][j]);
> -		if (cpu < nr_cpu_ids) {
> -			found = cpu;
> +	scoped_guard(rcu) {

Same as last comment, plain guard(rcu)(); should be fine ...

> +		masks = rcu_dereference(sched_domains_numa_masks);
> +		if (!masks)
>   			break;
> +		for (i = 0; i < sched_domains_numa_levels; i++) {
> +			if (!masks[i][j])
> +				break;
> +			cpu = cpumask_any_and_distribute(cpus, masks[i][j]);
> +			if (cpu < nr_cpu_ids) {
> +				found = cpu;
> +				break;
> +			}
>   		}
>   	}
> -unlock:
> -	rcu_read_unlock();
>   
>   	return found;
>   }
> @@ -2201,24 +2188,25 @@ int sched_numa_find_nth_cpu(const struct cpumask *cpus, int cpu, int node)
>   	if (node == NUMA_NO_NODE)
>   		return cpumask_nth_and(cpu, cpus, cpu_online_mask);
>   
> -	rcu_read_lock();
> +	scoped_guard(rcu) {

Same as last comment ...

> +		/* CPU-less node entries are uninitialized in sched_domains_numa_masks */
> +		node = numa_nearest_node(node, N_CPU);
> +		k.node = node;
>   
> -	/* CPU-less node entries are uninitialized in sched_domains_numa_masks */
> -	node = numa_nearest_node(node, N_CPU);
> -	k.node = node;
> +		k.masks = rcu_dereference(sched_domains_numa_masks);
> +		if (!k.masks)
> +			break;
>   
> -	k.masks = rcu_dereference(sched_domains_numa_masks);
> -	if (!k.masks)
> -		goto unlock;
> +		hop_masks = bsearch(&k, k.masks, sched_domains_numa_levels,
> +			sizeof(k.masks[0]), hop_cmp);
> +		hop = hop_masks	- k.masks;
>   
> -	hop_masks = bsearch(&k, k.masks, sched_domains_numa_levels, sizeof(k.masks[0]), hop_cmp);
> -	hop = hop_masks	- k.masks;
> +		ret = hop ?
> +			cpumask_nth_and_andnot(cpu - k.w, cpus, k.masks[hop][node],
> +				k.masks[hop-1][node]) :
> +			cpumask_nth_and(cpu, cpus, k.masks[0][node]);
> +	}
>   
> -	ret = hop ?
> -		cpumask_nth_and_andnot(cpu - k.w, cpus, k.masks[hop][node], k.masks[hop-1][node]) :
> -		cpumask_nth_and(cpu, cpus, k.masks[0][node]);
> -unlock:
> -	rcu_read_unlock();
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(sched_numa_find_nth_cpu);
> @@ -2570,17 +2558,17 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>   	}
>   
>   	/* Attach the domains */
> -	rcu_read_lock();
> -	for_each_cpu(i, cpu_map) {
> -		rq = cpu_rq(i);
> -		sd = *per_cpu_ptr(d.sd, i);
> +	scoped_guard(rcu) {
> +		for_each_cpu(i, cpu_map) {
> +			rq = cpu_rq(i);
> +			sd = *per_cpu_ptr(d.sd, i);
>   
> -		cpu_attach_domain(sd, d.rd, i);
> +			cpu_attach_domain(sd, d.rd, i);
>   
> -		if (lowest_flag_domain(i, SD_CLUSTER))
> -			has_cluster = true;
> +			if (lowest_flag_domain(i, SD_CLUSTER))
> +				has_cluster = true;
> +		}
>   	}
> -	rcu_read_unlock();
>   
>   	if (has_asym)
>   		static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
> @@ -2688,10 +2676,10 @@ static void detach_destroy_domains(const struct cpumask *cpu_map)
>   	if (static_branch_unlikely(&sched_cluster_active))
>   		static_branch_dec_cpuslocked(&sched_cluster_active);
>   
> -	rcu_read_lock();

Same as last comment ...

> -	for_each_cpu(i, cpu_map)
> -		cpu_attach_domain(NULL, &def_root_domain, i);
> -	rcu_read_unlock();
> +	scoped_guard(rcu) {
> +		for_each_cpu(i, cpu_map)
> +			cpu_attach_domain(NULL, &def_root_domain, i);
> +	}
>   }
>   
>   /* handle null as "default" */
> @@ -2836,7 +2824,7 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
>   void partition_sched_domains(int ndoms_new, cpumask_var_t doms_new[],
>   			     struct sched_domain_attr *dattr_new)
>   {
> -	sched_domains_mutex_lock();
> -	partition_sched_domains_locked(ndoms_new, doms_new, dattr_new);
> -	sched_domains_mutex_unlock();
> +	scoped_guard(sched_domains_mutex) {

Similar to lasr comment, plain guard(sched_domains_mutex)(); should be fine.

> +		partition_sched_domains_locked(ndoms_new, doms_new, dattr_new);
> +	}
>   }

-- 
Thanks and Regards,
Prateek

