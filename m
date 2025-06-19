Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC655247283
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750314626; cv=fail; b=Y+77ECQIqzSxIfkZC0r5Tbttm0/2amDU9fmGvOA792qaNl9/2xjZR7lXF7rHnd//YnsPt7VOkuul4Lj+ucer+KpeS3gGPjks1F4qfAnDIEqJennyytK1NNzAj5ziP5Ha2bT17jrWiJ56y1dKe4t0Qcc+FF/bXg1OxRT7Wyv0XWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750314626; c=relaxed/simple;
	bh=Si/7eNTPp0C0hjwm7YsJnh0REyzmoRrcSZs6boMwNZA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jh4M59AmX18mCj4TILo6ZUpOthwlEpFJu9Oz/H5YGSsT27x7Ov8hdcvTJpFARjuoIqemW2v9/7jGkRZiyjFpY0gkabLSgJ7F4JXnSbjqpaGCexsQugzxyG7teckn8XeZjZSaXJvKfL4CFb/nqtjwMeTfB/+tZFSMRsDUZgHXFhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jqrGtmPD; arc=fail smtp.client-ip=40.107.237.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jqrGtmPD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+yqEEtS+qRjn06oj0SxvHU0i+8fgwftyZ81bupt2fRV5skmUM5JAeBlC05MJa+SIO6thAZ+f/RPP3fPoCrPLcKbFIWDSRwKdvuL3b7v2NEq0aL3pmmO0Hl3AFvvASvZHeGJ8mVARh9mpXntN8U3q4bojm/ml3677xp0YS+5cxophxszHwd7wNzttwmVe1U+Hl2e+nlHN9YyKA1+j2DAS8VrOKZ6ezgEM9IgMh5kBObYLfvPrBrxdCIoU3jCiIQ1jddRwbOcVgTCzdEsrAsTmluWA3miPrOOm64QsR+5Fj+7rYwB2njOZL/ZTlJTjz11cj2tPHKK8mCkngWLlgU0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMApPGoQGFqlonnP7syBSY74MUZYLQP0dG7Vdx99rMM=;
 b=KlW/Tr3Yc+J1g1YtO+2ZcvSjEYqSGyQnWLHsI68dyxMKeGWFglxj3XRl87cG8hCiNxIVm1Kno5SCOOXQias7sHaf1p3/kOkHgEAXaOIu+4M7LKtU+WRTPj3pozqV6NiUwHJ6bWryRcpjjaU810sF1ZCcYcLldEM9dketd9p5SUyQ27V5DC91vrX2gasN+Kr/g5TiDQ6zB+i2IhXhzbXlbHLBO7q4KP0BDUj8LpPIUpfjixpQXmwSaR2DeVRTe9QpffKd4aRGyRTlND8XK071w0hrZQgpuf43NckDAUWHCDFbgUOYFJ+GtjWhTOQD+Mg3TOx0sGC4M74Bmk+GnhKTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMApPGoQGFqlonnP7syBSY74MUZYLQP0dG7Vdx99rMM=;
 b=jqrGtmPDA55D8D6paIfr+7ENX28XTIMlYn1XuRVEzRfvGKgh0YgMIwGFYwpQTi6tNP6S6+nJQUWPmjy3mlZZh/H+6niKBYEAUsEz3NDX/tMsruLTvaZ/6HD+z3aAwFme3AWxANl91ILY3Cj94ulECU4QBIDCp+mCZI2/AISaMCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 06:30:18 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Thu, 19 Jun 2025
 06:30:18 +0000
Message-ID: <4ec144f7-2b07-4d56-93b9-d23dcbe0d6fe@amd.com>
Date: Thu, 19 Jun 2025 12:00:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: allow imbalance between LLCs under NUMA
To: Jianyong Wu <jianyong.wu@outlook.com>, Jianyong Wu <wujianyong@hygon.cn>,
 mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250528070949.723754-1-wujianyong@hygon.cn>
 <e2b79e4e-f964-4fb6-8d23-6b9d9aeb6980@amd.com>
 <SI2PR04MB49310190973DC859BBE05DE2E366A@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <db88ce98-cc24-4697-a744-01c478b7f5c8@amd.com>
 <SI2PR04MB4931A23ABF08616FD8A133D6E370A@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <5216c899-efec-4524-a5a1-1fdcd2834165@amd.com>
 <PUZPR04MB492296C8301DDA9654D7970CE37DA@PUZPR04MB4922.apcprd04.prod.outlook.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <PUZPR04MB492296C8301DDA9654D7970CE37DA@PUZPR04MB4922.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0190.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::19) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|PH8PR12MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: c8092e63-c59f-4cb4-6755-08ddaefac217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mnh1NFpFbjhtWFZRbE9BWHdEWTVKL3Zna0w4NFRWNUZBMlJpTWZma2lxVks0?=
 =?utf-8?B?RDZuemVOVmNxdzFjR3p4YXFscHZ0MWQwa1RNdlRobTRYazNRdEZQbEpGNWtj?=
 =?utf-8?B?UmZPQTF0NXlIdG44WGxDbzJoNlh0c1ZoWEJobmFNMG9xd0xJR1I3MUh2QWQ5?=
 =?utf-8?B?dTdReEVUekZTUmNzR2ZjUUtnRkVRbVp1MTRmTFRPcTFyQjVmOHg4VS9remJm?=
 =?utf-8?B?L0pETlNMcktGMUJldG93VGhIT0FvYlFnUHJneVoxUGtDbjFyc3lPQm1nOWlX?=
 =?utf-8?B?eTlFMzZmV0daQXJKbUMyMkwvc0lYd0hnOXF3SUlzVDBLcFJDYkUwcGZ1SUdy?=
 =?utf-8?B?Y0c4cVBGNjR3SHBVMXlndEpYQitWR0NiTEFDcU5QNkIvaUI5SjZVT1FiRFY1?=
 =?utf-8?B?T1U5TEFGSUVVMXJsb0tNRHAxcUpITk1yYXRuaDdCTHllSGNGSkpzQS8zV3BH?=
 =?utf-8?B?U1ZPUVBrd2VBY0hoY2RsdnhRbW53UjJWRmwxOUpJVEgvRmcvUFdZTHdQbTk1?=
 =?utf-8?B?bjZqcWxSNUZBdEcvblZrYzJla2JjaXZRRTh6WWkxaGtNQmFvMGNFSUg3T3Ru?=
 =?utf-8?B?VGNzNXZ4WFc0WG9xbUJhcGhYMllDRjFONk1mQzJYQ0JVcEhDZ2h5RlN4Zkpl?=
 =?utf-8?B?Y2U0REZCT3RVTGRjMFNzZHYyMUdUcEpYdWR0Y2ttNnRleTAzK1hOMTJOa1FX?=
 =?utf-8?B?Rm52RG5KZEszeHJ1RThrREoyWnpNaklPME9Nc1J2Nk14V1lpR1ZZQjh0aTMw?=
 =?utf-8?B?WHloeGZ3SENrekx5dHFkSjNFVXNYbFpaczFManp0Z0pRN0huSmdSb1h3bVRr?=
 =?utf-8?B?b2djcTF3Zm94MnFuZU5XWFdZQlU4UHNQUXFCdlEvalZmNDNhVGpxY0J6MDBW?=
 =?utf-8?B?cmVGSjFhRkFSUVFMcGpPR1c3NzBwVXFLZVVkU0JDbnd5YVF0RFFBbTg0OWpa?=
 =?utf-8?B?ZlhCWURzODBHNTU5Q3BLTGZ6VWxQaFFSMzNNUHh4MWl1cTkvb2JUQ2p5S3M2?=
 =?utf-8?B?OWZiblRURXcvblgrcnpabVR5SmdMR2dyMU5ETmFrZjhZSnE3Tkl2WDIvWVk4?=
 =?utf-8?B?REdhTU5UZWFQUWdUQWpwK2dQbTJDWnlkNWE5TzhqajRsSFpDTkphOWJ1RG9I?=
 =?utf-8?B?LzJhaFNyUWd6T0ZuTUJLRWU1Z3dJby92cHJvbmZGdlVuL3drbElIdHhpR3I0?=
 =?utf-8?B?bUlBMlY0dm13MklMTk1QZkJtV2xOcWlaaUt5SUI2T2lIYlo1eEZkajFoRmlQ?=
 =?utf-8?B?RXVKSzFPZVVzd2FGakt2QldYaGg0aGxmRDd4dUREVnhvMGVIS2xYODc0SFlZ?=
 =?utf-8?B?cTUzQlBsZ3ZGdjg5TW1QZEp2cExlYWkyVEIrSzlDMXFsUURhMUZWU25WMFlV?=
 =?utf-8?B?R2xuT0JGd21GSXJDTXRYeXVPOGJLbUoyeXc2cXFrcmYwSmN5RTNkVG1PSllW?=
 =?utf-8?B?ZldWTzFpdFdzSURVN21ScVowL0hJZzlzTTI1QThvbmhadlR2MXB6M3ZSQVI5?=
 =?utf-8?B?UFMvZUF4RXNJT3Bab1g4UjhRQ0JxRjB2U0ZqbW5XVjhNbitmbjBscWZLMkRU?=
 =?utf-8?B?SEF2OU9UamU1dmhxQjJuYzFOS1F1dmY0cnJmTW85dmFiNkhhcE85c1gvY2Fz?=
 =?utf-8?B?WU42WThlTmdyaHZoSnRDOVQrZVBzV0ZYTHpXMU13dU9uMEVwZEFIMVBkRytR?=
 =?utf-8?B?cUwrY25xSG5OS2plNDA5UHQ0QmhrK0U4Rk8ydkVTRklLSG1kNFdJNnJIeUE3?=
 =?utf-8?B?R2lIY2FEK2cwaWs5WUhCTXhtUDEyNjZGOHIzLzRNWTJVUm4rVFhWYVA2bmNI?=
 =?utf-8?B?ZU83UUJjUERGWWpuRWpBRHhONWQ3TVhLZDNRaDd1bCtjeURDL0hFM2swcU9a?=
 =?utf-8?B?L0lqVWIzbENOaVNRTVpEODAzbmVDVWc5VEQveE1aSDh6Q2lLdGVEUnJhZHhv?=
 =?utf-8?Q?ifI0evHS6fc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDlpbnBiWVFPYUpuN0lyY1lHcEdONDltdnRybzFYQ2grSENWa1ZGYkNIZHVB?=
 =?utf-8?B?QlFybGZITzc2MWt0WjJhZ0gyTmdwYk1rYTNkV1o0SGFrc0VrUk5OaVFvYzZS?=
 =?utf-8?B?YjBBOTQ4M1pYUi8zeHhNbk1BeXhzM2hJWGRXZWtFaHdna1AvRmJkcDR0R2Vr?=
 =?utf-8?B?OEcxOTVNTW9OMTR0TWRWaWdHbFQzSVFvYllnN2ZVSXRXZ3pQemxxYmxrdVFr?=
 =?utf-8?B?THh5N0ZuamZSSDJWUFFtcHRlSUtXbmJvL3BTaTRWYmdpVUFuN2lXR0I3MVRR?=
 =?utf-8?B?TVkxT3VyekZVYnhHUk82TVkzM3MrUG1nTmFYeW0rWkJQRzBXV1pWUnJKYUJJ?=
 =?utf-8?B?VHkzZkFCNnQwbnlNTWRXc3g3eS84b3d2Ry9rYkJveVBiK0g3SXVNZm9RZzYv?=
 =?utf-8?B?d3pwVitFK1RCUGY4a0dnQnlsdVYrMkViQW1rRXA4c3lkUTduUHlUY084YUhh?=
 =?utf-8?B?S09ld1h4UWFEWkNOc2svUUNzV0NmUDFoa05aQW1DNmZ0VVRmUC9JZGg1NTYy?=
 =?utf-8?B?aUhXL2ZOM0tFU2FPUlRwdWdYakQ0TXhwSHU5ak9MbW9MU2pmK3VvQzFiQ0Z4?=
 =?utf-8?B?emhhOFdSWXRJeE41dEZmVmhodllPdCtDcXNuMTVBcW9CdjBFSWhMLytOTGVj?=
 =?utf-8?B?bHRiYll3ZHVhcmk0Umx1anIwTE1sckMzak9FSlJ0eU0xZFNOZXFzaDdtNG4x?=
 =?utf-8?B?QXVkUUNiMXBETUpQdW9XSmVaM2JBUWp5d2l5K0hRTnNHcEJoOG1WRW9WcitP?=
 =?utf-8?B?MVpuTUdJMEN4aWJIeDdWN0dySHhTNCtvRmd0NnNaSVVkNFY5VThpRXpnbmpQ?=
 =?utf-8?B?ejFMdHFOcUd0MzFSRzE4OFg3djZzTnFNekNrYVFKQlFwMEZ4aWJ5aWNoMGFB?=
 =?utf-8?B?S1h2bFU3dkk1VjZ0U0tIZVFZRlUrc3F1RW1MT2xPSkV1Z0xYdE04Z0lQaFVh?=
 =?utf-8?B?Z01HZXZOUVJpMGVEZVNRVXNxdEozNnNER3dLNmFyWFIwSHNvNnVKOWZNQXpW?=
 =?utf-8?B?dlBNMnVjZ20rckhCQ2U5T1czNHhsck9pWDc3Z2w0YzI5MlJ5K0VjaU9lYS9F?=
 =?utf-8?B?QnoyV3hKcTF6aGloRHl2NzJsS05FMlBRNGxPUGdqOWlmRmlvZ2pKM0FHRmhX?=
 =?utf-8?B?YTIvbVRGanFZSnFQNC9ubVZ0aWt0VlZSQmsyQktMRjdaeGIyTmNRc1psSU1w?=
 =?utf-8?B?VGxnVzh4VmZlbk9YRDAxTVVOV1JNQmhDZkRUL2lzSnI5bjJMNTNqUE11UHRF?=
 =?utf-8?B?b0dGTkMrL0p5NURSdUk0UHVDTkUyWGdQeVY5RG0rQ3RXRWdxTEhBNnorZVJR?=
 =?utf-8?B?OHdnSUVVOUxyUjJZS1ducEJQRUJhbmd0RUFzRzRmMWJ1S0NXbm5tRTB4SXFV?=
 =?utf-8?B?YjJPZDg1L1ppL0tROEdEWnpDaG9qZHlnUWtNM2xONnhSdkxhU2wyUnFFNVly?=
 =?utf-8?B?MFA2TjNkU0VjV1ptNTFML1ZoNTB0OUExdUhNSC80TUw2R0N0RGk3T2pobFdG?=
 =?utf-8?B?Zmt5MXZPUHdacS9zMlRpaEM3KzdrYXp6cW10SkN2U0NrSURWanRRQk1KalpG?=
 =?utf-8?B?R0RtV0V1TTM5TWxzbHlQbE0yazBLM3hmOFV5eWc2OTlKY0JFZHpCaEhTUU5G?=
 =?utf-8?B?cTJQclJQYitZQnNNYmlmNUo2d2ZaK0JtTnVmZ2p4Nyt5NC8yNGt5NFJSd1lX?=
 =?utf-8?B?b3NWU1I4UnFUTi9OVGVGc0J1Qk12RFhteHRWTE44RytKenVpcFFjYk5GTWxV?=
 =?utf-8?B?bUVsUVVNMEJIOUFaNEdIK2xYem5Ecmhyb1BxZ3dnWkxBMCtBWkpNZFFabE5O?=
 =?utf-8?B?NVU4ZWhYRkQ4cnRESnl6Ty9UcStqd1JaclFvb04yeWdONUx1ejAzd21BZnox?=
 =?utf-8?B?QXRvTHlpbVZzRnB6MmFvQTJVdjZ2enJmVXhLa29uajdyS0c2UlhFUHlmQzVz?=
 =?utf-8?B?TS9tVjdpY3d6dHE0RDdjOE5rbTRkZmZmVVlGWmdTUmNQOTFpbVdTZFFRd2F4?=
 =?utf-8?B?akkwbElnRGMzRCtGWW9Nd3E0ZFMvNURRbGo2eHJnZmw5cjNoQ0tCejJOdWRF?=
 =?utf-8?B?WS8veHNkblZhV29FeWVFUXljQlhZOXdNVXNxdERBbk43anVUMFpnblJFVUxo?=
 =?utf-8?Q?zVqb4jfVbdsPMf8I+ryExduj7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8092e63-c59f-4cb4-6755-08ddaefac217
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 06:30:18.1653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nud/tHGZjeO5w/R0FFPAz676POhIKv1kS7dgxy05VlN5Ca92ZtkNeiRKX8mJ2ot5MGA17HVl58bKEIP+xeZpRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7326

Hello Jianyong,

On 6/19/2025 11:38 AM, Jianyong Wu wrote:
> If this change has bad effect for performance, is there any suggestion
> to mitigate the iperf migration issue?

How big of a performance difference are you seeing? I still don't see
any numbers from your testing on the thread.

> Or just leave it there?
  
Ideally, the cache-aware load balancing series [1] should be able to
address these concerns. I suggest testing iperf with those changes and
checking if that solves the issues of excessive migration.

[1] https://lore.kernel.org/lkml/cover.1750268218.git.tim.c.chen@linux.intel.com/

-- 
Thanks and Regards,
Prateek

