Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644973398A;
	Wed, 28 May 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428090; cv=fail; b=iIsFlmnlJvoxBguJGFe2hSRWVrqBu2tQY1Qleazu053Gxsh2w/50WBAokJoB5U7aO3bLYu9zNRpZHw9Chh9kwZVlgFbm9NYfJ50G0IcY0Y6tV9WGxgNFQO6/AjsQBwzGa2ErGzDMqxyqge/JdoSisKIbeZQWdDLMzuSWYUzZR/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428090; c=relaxed/simple;
	bh=TaBmxuT1vDj/cWheJmtriy1OWMOKY4QfDBN4Y+FrX7k=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eFBmi7+9prB4Q2ypWmw+VL883xev+ZBNGf21xryp4VEBJDpattvqDKUlYuaVDP9a58RjDec30vHjz+znrqMi9MjDFCdOw6ZPdS4mnqH7l8ZEq7NKguGR1hjj0V5QIdSVbTH0uS88A06H1DciJXheCgh94BPG3ItNNy2K46YdKtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=QWuEu22m; arc=fail smtp.client-ip=52.101.85.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="QWuEu22m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH1DZzj0NwHNc6e1KYj7EWLD7Ps6FLdC3Ti9b0eXVIDVmBrcQ91mbe1IqAQ59STD7BPGfJuYNEeVHwr6zYjSC/Rur7jL9aohKp+5UbEae9mlEYVcpiHhYyMWNnpQt64bsqZai7RrgfgbiVAzw6z4ZEDh44SpoCThxqCoVZkofMpFrr9C/d62O+NOQtEqT/b+kwGTqiK5Zi/NnsTGOfnh69oH7d7OIBZNkzsColtFGQWvOCj0v9L3i0hyMlayPZyo65utND4sy4EJ2fxqQJGzxtvhx7m5MpEaqZViUZhk9XDdxFbYzlONcfQpokjECgukvoMyOeOANp+XsYCVAEHs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssWFnHgHyycAuwzhntW4yMXjlJoPHlESVcjLoMb9S3g=;
 b=JdYYu0TaKiU4TvbTDPqUJupiCnlLJe3jk1XIO7i8cYBJqjdrn5aFc0mqya3cPNGtiFA0ANCRnlKpDPcwF2FTXSpx352cM2fHcRUgZXhUq/dxp79d5BvkMf/m+MNDROajJP21xx5kl1NB82McIJAV7nzD+2IAItA50QPH82QNrv5RkEwZV5b+4vNW8VTgJ0mrtpV2vNs2vmAze9wYeG37nc0YhdT+4oVxwHUk1QjTQy1dh/FKX3/RWl9DTHcnjUgC5Qb9aoDX2qvI+sU5CVz6Of59wVzmZLkqJEzZ9SJlAMNCyngx7eHnL7Hz1d9kHfcJs8Jt5AOPt3aetgvfvLfb9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssWFnHgHyycAuwzhntW4yMXjlJoPHlESVcjLoMb9S3g=;
 b=QWuEu22mOmO9DVSXrYlijQ59BiN7ib/Z9OqYJ5Qd1jJXsP95uQPZYfWA9VUqQPlN1X8Co2mjDBMAwjX6xQL9jpbfGfr/g6/F1xXtISpVJEcZ8v/3fVadxQNT8D6/xf6ZOg39H78B5kjG4JU3J53jQ1Nqfix8eO8wq0MLVe5PE5q8lo2Z/tEodp3QEBgHzi1ptG/mPX5n7nc5Q5NYASosDNS71t3YBPg1YAwwr1mpk2OjAXfVETfSxeUmXmuHT0hEsgFfSJMUVVvr8g0Jqbd/exMlzheQGvo/zQP4FsAuaFUdi/QXqnR1Kcnph/uLo5/v3ZnsKZVZDmEDH9Af0109Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by DM4PR03MB6176.namprd03.prod.outlook.com (2603:10b6:5:39c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 10:28:05 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 10:28:05 +0000
Message-ID: <5d055750-787e-44e8-a498-47258c7ffe70@altera.com>
Date: Wed, 28 May 2025 15:57:58 +0530
User-Agent: Mozilla Thunderbird
From: Mahesh Rao <mahesh.rao@altera.com>
Subject: Re: [PATCH v3 1/4] firmware: stratix10-svc: Add mutex lock and unlock
 in stratix10 memory allocation/free
To: Krzysztof Kozlowski <krzk@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
 <20250526-sip_svc_upstream-v3-1-6a08a4502de3@altera.com>
 <c9c08142-752a-4ce5-a723-9f50486dddb6@kernel.org>
Content-Language: en-US
In-Reply-To: <c9c08142-752a-4ce5-a723-9f50486dddb6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To BN9PR03MB6201.namprd03.prod.outlook.com
 (2603:10b6:408:11e::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_|DM4PR03MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: a07f2206-2930-4476-0f22-08dd9dd2552b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3BLRlhCYVBxOEtaazJieEh4K2tSakdYc2N3OUthMklpSVJhSURwNGV6N1l2?=
 =?utf-8?B?NlR2QzNVRVBIWmdIanY1aTRjY1M5Y0xVVEkvalhIR0N6Rkw1ZDRvYzFpOGpR?=
 =?utf-8?B?d21ycC9SUVpmTXNRMXcvbUxhcDBFWVo3aFhpMGpRM2FwR3cwMmtDZUplb1VS?=
 =?utf-8?B?SFBSeFVxTnJXVTVyelR6dFZuRDBweXZ4SldhdVdEaVo0b3NqZWN2MUxFVzUr?=
 =?utf-8?B?b296MEx2SURlYll1d1FtUUFpZEdRQnRaek5yeWtDRVBJU3lxSzR4TWUwdWYy?=
 =?utf-8?B?ajVDQjhQU1dpb0lwMW5VZUhCb005SStsd0RYNTgzVmdxbU1hYjJYeGYvUGQ2?=
 =?utf-8?B?ZC9PeUJqbTh5YU9peVR3Tnk5cnowRnMrNXBuSzMvbVppaDFNT1Y1ak8wOHdH?=
 =?utf-8?B?dmxMWVM2a0x4bGFlM3pKMURYZjR1VEJhMmtuVDl2Y01PdzYzdVIzN3duVkd0?=
 =?utf-8?B?WStKYXdKQS9mRlZVbFJFelZIMHB1RW9YQW9TNEM4Z0ZFcWpkTFAzaHlzKzI5?=
 =?utf-8?B?a0FUODZiS0c1OVc3T2I1NU1nbmFEdjJJTHBMWXBMY0tCc0prQ004MVQ3eFpt?=
 =?utf-8?B?MmpPNWVTVDBCakJVWlc5VURMWTJ6T1pHNUVsditKRjBTZTZoUEx5dVBYU3dL?=
 =?utf-8?B?NVZ2RFE4TkdCbTVWZjFvUkJBeFZOQWlZNVpaMXhPNG5nOFNwam9JNEFlMVlL?=
 =?utf-8?B?Q1h6cTk4L3c2dVh2dEQrRmk2bEFSTUFKelBDcWdXVHdoYytVUG9kSUJML1BW?=
 =?utf-8?B?WXhyVDJnQ21TOEsrSTJsajJ2bVByYjVWSEZOZDQ0VWlCKzIxMjlmNlRBMlBY?=
 =?utf-8?B?Q2JmKythaUZLVGdqMzA2QTgxRThMZTZDK2pncFc4SHZ1TU1ZMEF1NnJ3elBZ?=
 =?utf-8?B?TXFxV1FQWG9LZFM2YVI5NldPYVNYczFTYm53M2JlLzJrOWQyRWg5OXFJOEIx?=
 =?utf-8?B?VU1hayt3aFY5eHd5Zy9tT2crOUVZS3YzN1ZDUW1adUpNc21EMUh3OC9ySFRo?=
 =?utf-8?B?QUZ5VyswWUtTM256em1PaG9FQkVrRzFaTDhJaEhqbk9NWUZ0VTBSd01WaVE4?=
 =?utf-8?B?c1dOZEs2UWhqeVpINkFvaWxvQ3Z5RXBkSnd2MXNwUmpRTWhLbEJnZ3BrOGw5?=
 =?utf-8?B?aE1wRFIzVEpGV09saUpTVzRlOHJPMWpDVTJRRlYvMTBSaFZ2WjFpazhmT0lJ?=
 =?utf-8?B?MHV5NnRXdkV0VVk3YzgxYzNDV3RYUDAzMmorQ3RFN3lobWFWWjltaDRvRFVM?=
 =?utf-8?B?dFgzUEtkR1prVlJ4d3U4NzRvZjlOS3JONVFma2Q4Qjl6MGRvSHlwajJETHVF?=
 =?utf-8?B?cm53Y0M1UGxDdG1Qb1p2eXF4cnNLV0RQS2FRcDVjQjhaQ0xUS2hzTlF3Qmp2?=
 =?utf-8?B?VXFHRXg0d0RCYjA5Z0JzV1ZzYnBZYTR5SXlWLzM3dHlHT0hkNUh3NERwU3pF?=
 =?utf-8?B?WXBjWnFuZDNjQ3NDbG8zQjRaVUFCa1loV3phcDRjTGZxdjBTYXZKaTZPdGMz?=
 =?utf-8?B?L3p1S1JHSFJmZVFpcnVNTnNkWVc2SSt6SitRc0ppS0hkSzg5emhzUEppU1Y3?=
 =?utf-8?B?RFl3clJzRHVEQVppd3N0MDlsWWtuTGhSUi82VHNQUzB0bElQa2U0V0VhcE5D?=
 =?utf-8?B?ZTBWT203NC9aeEhCdStjZ1BudFF0YWdiZnIrYk5McUZYVGx5anltRzVkbk1k?=
 =?utf-8?B?cnBNdXZkL0F5em1vNUp5dWdSdnRUdHJla1NxcERjK1hnc041TFFpVVI2YlJO?=
 =?utf-8?B?QjRtdWNtVUU0TTZ5R2FoT2N4YXhvNFBQUHRlUHpFQXZHNE55QkNHTHQ5L0F1?=
 =?utf-8?B?Y1lBbmRlSE9CWlhsM0xBeVkxZlRDcWJVdFBBVXRDUDhxUllLQ0o0NzVTbnZl?=
 =?utf-8?B?aUtXVm5kQitkZUM4eGxBQWZOL0l3RTdLZDBhcjdsUXVORGFUbTRGMnFsa2k5?=
 =?utf-8?Q?Ugao42Wf1ek=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkdaQUQ3aTRQcnBVTmRqaThDSEJPdWZIWGFYNkRJbFRLandkOUQ2emJxOTlO?=
 =?utf-8?B?OUF1Z2JXdjRjQzVFajRTS2NjbkhIa1VQU0tFR2EwSUtkVjl0VlBDTC9lVDVC?=
 =?utf-8?B?RmY0Ykc5aDU1aFUrOVlmQXQxZ0FBT3dwajhJVVM1TWRKZmg0eXdUNU9Tem4z?=
 =?utf-8?B?U1BpbXd6UHJwOHVQcHpobjZkY1dhTDFTY0xpamc1UmFoMHFVaml5a0hFa1Uv?=
 =?utf-8?B?K2hRdGRsOTVmM0tMTWttWUxCSW94bE55SVV6czlGcnlIN0FXTHNWc3U2YTFm?=
 =?utf-8?B?ZFBoUWNXZ0RKVzBXWjlhU3F1LzdMUlZWR3RMNzB4THE4NGo2eW5xcTJrRU9l?=
 =?utf-8?B?YjNlS2psZnVCTEFRb0RoRzhCUFBiOEF5ZVZRUndLNnMrOHA4OUhvUUgzQnNV?=
 =?utf-8?B?WkIwa3lseGNCbi9LcDhCaFl3bldqRm1mUDYzbVJkWkR4aDJ3aFZFUytvaVhJ?=
 =?utf-8?B?UVdiN2ZvRUJtWFVDbVpwcVFmYjJhbGdkdFM4c2hNeVo5cG1MR1BVbklDVnZ6?=
 =?utf-8?B?RkVHYmVDTWp5MjhGVTRrVjRZNGpDTWlQTzRWN2hZamJ6MG82aTJ4TW9KY1Ar?=
 =?utf-8?B?WHQyQnBaemhSdzVVSEtyNHd4K0dTTWdjUTBscFpZUG1EMEFhbDFQbUI2RSt5?=
 =?utf-8?B?ZjVsWXFqOU5lMktwVGNNRjFmV3E4S1ZtbEF1NmJJV0ttdGF4RmhMNE55R05j?=
 =?utf-8?B?UTNtMjBMbm1ZZVFVUmZRN2ZkQ0JZVGppMzR0VjU2Slp1UHVVK1kvQjduKzQ3?=
 =?utf-8?B?MHUrOXZwVmZiVG10M0pSclI4a1N6QUU4OEYyOEE0WVNwOHdnZnlkcG9mdEN1?=
 =?utf-8?B?Q0R6dFhLa1hNRDJOQmM1M2Z0cnJOOG4yWlY1U1JhU1RhbTVsQ1o3a0VoUFJB?=
 =?utf-8?B?ZEd2aUxvMjYvUUU0Y0xRT2F2TXpHSi9rTEJJV29vS0ZsdHRHczcyT3QrVEkw?=
 =?utf-8?B?MkNEVzFEcXlwNmMvM3NzY3VQYjA5c3kvaVBYWk1kL2VUMXlqT2RDcjZzOVNV?=
 =?utf-8?B?S0YxWk5NejAxRkhoSlcxdVBKSWpHcFFYdVk1cEpxVXU4M1NYaEl3QTlTbHRJ?=
 =?utf-8?B?YmRlZFlac01NTGNHQlFjdEVsQ2NiR1lwdGxXT0VYcTlwZXcrWGlIM1dJWnNU?=
 =?utf-8?B?V3BDaFVQQnNZK1l4dlpveEFIVjFKYjBXRjE3Z0labUU4UDVXZktjYUFQWkdk?=
 =?utf-8?B?dEtpN0loSEtDSmxkdzB3LzB1RmxhT1J6azNycWFpUXh5NktWN1lFeDFxb1d0?=
 =?utf-8?B?bk1GaGlhakU0ZnZBL25iVWpsSnV3QWpOWkllT0NSVFlHS2VDV01zYmpDVlho?=
 =?utf-8?B?YkJJeFViNVNhSjdqM3NRdHN0SldKWlVaYTRHOTJwMk5LS3JsaFNlZnJEQS9j?=
 =?utf-8?B?c2p3U1Q4UzIzeHdxYWRPTUFycythMFpvMXY3TFRVcUIvTzF5OWVrTkI0Rjgw?=
 =?utf-8?B?aVRXZ0MvWW1PN0lZTTV6dC8xYXYyZUgxOHlKUGZKZzNiTUNCVW9FbkV4WE1C?=
 =?utf-8?B?RnYreW5CWkhTcU1sRWk4YitTUlpkTk81NCtRNzRCZWcrckg3TU5vd3RVUGx1?=
 =?utf-8?B?SU1QRndwS1FQbkFCOHU2OVJzQktocE1lK3lEVmh3SHBmRXNRRmhKMmlYZ3JE?=
 =?utf-8?B?UFlQRTdwYmZqNFRpUExZQ0dEazFJelVoQnZGUDZTTjBUS0hUZ2x0SHNZRTJ6?=
 =?utf-8?B?K1RSOG9HUEdxRXNuc3VqVlNWR2Rhb3pQYWtvakh2bnpvQmt6aThPYmh0MXZa?=
 =?utf-8?B?cUZIakROdk9qRTBGNUZLSGJVTjRLRXlQUjFBSWRBK1grNkY0SGNZL3ZWVUpG?=
 =?utf-8?B?WVQ5RHF3N0ZQWXFKdEN0WmJmUkE1cFFwbWI3UWZ4aWlVS3Fvd3JtMEQ1Qkpr?=
 =?utf-8?B?dXRoTVhVN0RnRFROcXZOanZrWVFteGVVVXpDd04vckxjaXdSNFJyakdmMU13?=
 =?utf-8?B?c2NibmdGV3BnY1Y0ZE9RUE13N052OE5wQUpkaXVhYTFjaWFFOEFQb3I1Ymo2?=
 =?utf-8?B?b0xiOHowK09XVHlTMDk0TnpsSXN1SjBkbkVvN2RsQllVZFJyWjl0dnNQTCtp?=
 =?utf-8?B?dndraEN4dE51N0lsREdBTHhiS2dOK3REMkRjamxYb1JuMVpTaXIvU1d1bjds?=
 =?utf-8?Q?JKmTzX+4/Mj/HJYireoJe6ZmC?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07f2206-2930-4476-0f22-08dd9dd2552b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 10:28:05.7802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epcnCe3H4SURqm3Gom/uV+ZJDEbwbYigLjL38A/dQAE89zVMAHIKCRxBqpMOLZKiVliDfvAJqAuwDRaIp8Q2jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6176

Hi Krzysztof,
	Thanks for reviewing the code.

On 27-05-2025 02:19 pm, Krzysztof Kozlowski wrote:
> On 26/05/2025 08:25, Mahesh Rao via B4 Relay wrote:
>> From: Mahesh Rao <mahesh.rao@altera.com>
>>
>> This commit adds a mutex lock to stratix10_svc_allocate_memory
>> and stratix10_svc_free_memory functions to ensure
>> thread safety when allocating and freeing memory.
>> This prevents potential race conditions and ensures
>> synchronization.
>>
>> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
>> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
>> ---
>>   drivers/firmware/stratix10-svc.c | 29 ++++++++++++++++++++++-------
>>   1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
>> index e3f990d888d71829f0ab22b8a59aa7af0316bea0..3d42d4b18b7299d0a9e5110159e06253dfeddf88 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>>    * Copyright (C) 2017-2018, Intel Corporation
>> + * Copyright (C) 2025, Altera Corporation
>>    */
>>   
>>   #include <linux/completion.h>
>> @@ -171,6 +172,7 @@ struct stratix10_svc_chan {
>>   
>>   static LIST_HEAD(svc_ctrl);
>>   static LIST_HEAD(svc_data_mem);
>> +static DEFINE_MUTEX(svc_mem_lock);
> 
> You need to document what you are protecting here.

Will make the change

> 
>>   
>>   /**
>>    * svc_pa_to_va() - translate physical address to virtual address
>> @@ -182,14 +184,17 @@ static LIST_HEAD(svc_data_mem);
>>   static void *svc_pa_to_va(unsigned long addr)
>>   {
>>   	struct stratix10_svc_data_mem *pmem;
>> +	void *ret = NULL;
>>   
>>   	pr_debug("claim back P-addr=0x%016x\n", (unsigned int)addr);
>> +	mutex_lock(&svc_mem_lock);
>>   	list_for_each_entry(pmem, &svc_data_mem, node)
>> -		if (pmem->paddr == addr)
>> -			return pmem->vaddr;
>> -
>> -	/* physical address is not found */
>> -	return NULL;
>> +		if (pmem->paddr == addr) {
>> +			/* physical address is found */
>> +			ret = pmem->vaddr;
>> +		}
>> +	mutex_unlock(&svc_mem_lock);
>> +	return ret;
>>   }
>>   
>>   /**
>> @@ -990,13 +995,16 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
>>   			p_data->flag = ct->flags;
>>   		}
>>   	} else {
>> +		mutex_lock(&svc_mem_lock);
>>   		list_for_each_entry(p_mem, &svc_data_mem, node)
>>   			if (p_mem->vaddr == p_msg->payload) {
>>   				p_data->paddr = p_mem->paddr;
>>   				p_data->size = p_msg->payload_length;
>>   				break;
>>   			}
>> +		mutex_unlock(&svc_mem_lock);
>>   		if (p_msg->payload_output) {
>> +			mutex_lock(&svc_mem_lock);
> 
> Especially that this looks odd.

Shall I combine the both lock invocation together?
> 
> 
> 
> Best regards,
> Krzysztof

