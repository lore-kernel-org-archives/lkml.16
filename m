Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BBC21B185;
	Mon,  7 Apr 2025 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744057082; cv=fail; b=fPROuxfi+alt47xzfzv+KB7gXO5Xzw/NoWcb1X/P2BC4+xMh5lIX/8Ve7Rrve/7G8cHCV/jACsDSKTSFGJ3wslqJwNI1XVNDBzPf+UwxcHLS4YNKFCyjCGO8xuaI/G9ucrEeJnswnISfKHP2aJH8iczG+jfvC1e/TYmDe15U0JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744057082; c=relaxed/simple;
	bh=1xEl9gTk6EbbLkvDKXKTSYsvWZXBEwIFw92j8bzsJX0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XIaydALBPu0GErnOX5fu30xTybX8Puv20whZO7y1WX3ECmNqQ+H4Msl4zcgz1apCEFMiTyZOu1mQG8CqhzYLFC4LTSU9iqDljqqtgwgaViRnb/RDsl8mL/DpnMNC59ncpof9tkjVsvkyiSTE8Vc+vuRz74xwVgUadBtbYvgU2PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nSrNGYZk; arc=fail smtp.client-ip=40.107.236.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nSrNGYZk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDJUOTHo/2PDnZ6iI4tqmWHMLUJjOyT283sWrbEcwzBVfchhcfWfWTW0RQGzAZpb6bwyxW+JC3Nop0dkn4AK2Fnd3RxbMIsZSTTghLNVFh2lFz86PdtB5UVg0MGk35JS3P0bWHDxsih/jZkZQuR46ECJXRRAydt9x/hCSSsjlGFyRF5LciXXAME+8WYjfFnUR7v9Fg0MkbKYaXiadiMSkRaimvmx8ke8tVMx+zUFPL6Ny3GPaJX2GBawLm9Jb1w0FMtxhbXLoW1HSVhl1A9Rd5GkJnWfagKjNImn3CGtx/Jj2iyNO3ILEj1ZiqRTpWAfre3B2dPd+LOg4ZlUKat9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8QkNBys+PZwFWuZs6HQHC9rRMMnRBSjq3NiHemOZxc=;
 b=yXNxvHb9M7lQBvnYUa4CJVySZXOBjDdv05nA0GjTTIh3MZyeA5pP3+NDDpk4+KuHMLJKCOPy/xJCrzFOfiXr4JO8ONhxogI3AQYkdk8Db+97QLq292EFPDtoVeAn/TxiLZrwkChRwVSWNu1eX2DNxfZ6uVCfNGna9yN7cKsXH20/6PAVJfxj0PGJEyrw8YPFCQRMxrk1y0IIjp83VZVLsUnxdPjweB4f7a+Ph4MmG26KtSQvPRGstQ3yRrXmRKobHVcAfZsslTqKfivfAoDyqA80KNm3IAYw9Xsts/pCRF7mlquwznpXzirCRuzzHmv0D17LuGIVyM25i0NaqrwF7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8QkNBys+PZwFWuZs6HQHC9rRMMnRBSjq3NiHemOZxc=;
 b=nSrNGYZkEMfhveDAlaBny/ffTIIN02cgfTG6D/4hLV2lqshnvkIz7boerfEjpoy8PZgswETkxeQhaAxpm1X/fjcetyOS5NG52fX8ga2wLcGUINaYJnuztdDGSakcHh3e4Je6mrh8BUxmtFmpkR0fzFVFa+iYUu+aVgDLUQFD0SI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 20:17:48 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 20:17:48 +0000
Message-ID: <41d612f1-cee1-4682-960d-61ab14d31f89@amd.com>
Date: Mon, 7 Apr 2025 15:17:44 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v3 5/7] x86/resctrl: Add interface to enable/disable
 io_alloc feature
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 jpoimboe@kernel.org, daniel.sneddon@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, sandipan.das@amd.com,
 kai.huang@intel.com, seanjc@google.com, xin3.li@intel.com,
 ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 tan.shaopeng@fujitsu.com, james.morse@arm.com, tony.luck@intel.com,
 peternewman@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, corbet@lwn.net
References: <cover.1738272037.git.babu.moger@amd.com>
 <aa0898d0e6514568086a87fce83969cd55d5a731.1738272037.git.babu.moger@amd.com>
 <143ff530-ed4c-47c2-abb7-80ddf2adc0de@intel.com>
Content-Language: en-US
In-Reply-To: <143ff530-ed4c-47c2-abb7-80ddf2adc0de@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0193.namprd04.prod.outlook.com
 (2603:10b6:806:126::18) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: db070d36-330d-4bd0-275d-08dd761143e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0pWbGI4Y0xQUGdzVkJ0R3dSalJ5SmZic042cVJRUFVpWGFXUkFnTm0wNHdX?=
 =?utf-8?B?YnpTZ2dBK1JwYnNlSTMycDV4U3JyeUpDWW01dUJ4bUVOU2pNenBNMEJMNE5o?=
 =?utf-8?B?LzNiQlFUT1krS1hmTWNsNUlxYXJpRFJoL05kUjlsVmIvMnpMeXpDUVNmdjhF?=
 =?utf-8?B?Tkc4TXRGNTM3U3NSOVRvMlZicXByS1JjYjNxZitQc1V2OUp5MDVDTjNjK2do?=
 =?utf-8?B?UmZ2TjY3bzE1cWFNeDNZdGFxU0dHWE1mR3BkTlFkU2tVWTlVamw2K0RMY1Jz?=
 =?utf-8?B?T2pSVjlzejZYTVZrSFRNaFdNZ2hNbldVbUhuTnRDV2JsZlJ4WitHa3FFanhL?=
 =?utf-8?B?TFdPa2JMZUU3cUg4V0Eyd2dYOGRHUnhPS2xrWVNnbnU2dXBJbjF1emNra1g1?=
 =?utf-8?B?WkU3RnMrTkVEM3IvaHZHTUswMzRZb3Q0MFJqSFk5cDB4Z3kxM3pyZ0o2RUwv?=
 =?utf-8?B?Z3dhU1FIK0wrdkw2bGxWajBlV2lndTg1YkxSRlpyMmpSNlRFZVhUOWdWNnB0?=
 =?utf-8?B?aEhyU0Zwdk02NTNYOFZWSC9IVVRMVUFjV2NobWJMTW9uazdrRU5BTGRYbi9G?=
 =?utf-8?B?TStyMm92Q0s0MXlDZTNXWC9qVXZSNDltblFrQm9tSGZRL2s2U2E1MlQwMnQ1?=
 =?utf-8?B?TElMUVg3SkZzN0dGNDVqV25jZGdJWHpSRmE5TFRrek1tQ01oRzlHQXU5WkV0?=
 =?utf-8?B?RlVsYkpiZVNadFN1N3VFcTB4VFhPQVlxRXN0L2s3SnNWZHhKUGJiZnlHYTJa?=
 =?utf-8?B?MFc1ZUwwcVlCQUtueGRxOUtxN0E3K0t1d2xRWk0xOS8ySFd5SUlIWGZQOTMv?=
 =?utf-8?B?Y0MreTF1NUhGT2pUVzBDV1hHTmxheENOdlRhb2RzenNmTXN6VFRrSmN0ZkdM?=
 =?utf-8?B?RUIwR01LcnQ2N3ROdDIybC96YjY4N05KbmlYRWNQMVBnZU5pdStoMkVIQXZ0?=
 =?utf-8?B?RGk2ektwUXlWV0ZzRWErS3ZLVjFkSHRKaEZLRFlkei9ac3QzM1ZDajk5eXVy?=
 =?utf-8?B?V016VUpmb1ZVOU04L3hURVpzc2wyeGVJaHA1Qyt5UVQwejB1Q3BQQUJHMUZj?=
 =?utf-8?B?Z1crM0o5a3REQUVxMEVTWkxzY3h3K3lkeEpyVzFCNVhSMUhPc2F6YzFwcDZy?=
 =?utf-8?B?VGJUNkU3bWdOaFhYSERqZmJWSkUyOGNaRm9PLzN5alVpVE9qeWcxWnZFUnhC?=
 =?utf-8?B?WW1OSnlVbjFUcC9HWTE0U2Z6OUpsTVFuMTYxdENUdW9XYzFZZXdSZ2JjcWoy?=
 =?utf-8?B?anI5Ui80bEhmU3U0TkxLTDNSYWVldTZVWEFtN0VOVWJUT1JBY1dOZmhxcy8y?=
 =?utf-8?B?TlJJMnNOR3d1ZmlrVmluaXk1UWNQanBCdEZhS3JMMWZKNFEzV1VNendhS0w3?=
 =?utf-8?B?RHlkb1NoMkRhT0ZNT0p4SUtXK29qNHNqY1hVRXhrNUxETExvN0tTNlN4cU1s?=
 =?utf-8?B?WWtpV0NwQ0g2L2crNVVueFAxc3RoRGFXWDVubWJKeGFlbGFCOFNERjlFRXpr?=
 =?utf-8?B?Nk94T0xLY2FKUlkyR2VjSCt2bjJhemowZlNLUTJScXZYTFU3Y1NMSURZSUtW?=
 =?utf-8?B?MkxPWWhVRysxR0xBWTRHZE1KRnkxRlRMTldJNktiZ1M1RUhUb3NsQTV1R2ox?=
 =?utf-8?B?cGUvcmhJTXloVXRWMEgzblo4c1k0eVpMeHlaN2FzakpEeXdDcmtBaldMM1k4?=
 =?utf-8?B?SGpwbmxEZUV5T3NBaWZVU0VCbWI0bHJnT1dCMTVOY3E2ei82T3NEMEd5QUNC?=
 =?utf-8?B?VHRqejFRaUg2c3JGYUtNUS9PcVUrbC9WNmJlLytmVEp3UXZCT0wxUkIyMmg1?=
 =?utf-8?B?K3hwemc2Wkg0cnhUMGFwcFVGektLQ25pZVRqbGJudm1yeUl3SDVSNVRNYVhz?=
 =?utf-8?Q?HSxSbJXzG7NiR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2dXNGVUQmo5a3p5YnpsaUFLS3FYWXhpazErNEcySll6aWwyY2FDbzNSeWhu?=
 =?utf-8?B?NEhJbU1qSlJMNUZuY09abXVDQnhrZlZVc200c3k0SllnMmdDa1hUclRtMUJa?=
 =?utf-8?B?ZElSQ3hWa2p1YWNNWDVUODFEWDRGYzFrbU5NODlLQjl1dzNJRWxMQmlSYWw2?=
 =?utf-8?B?SW82cVI4MGxmNU9CUWFSSnl1ZVVsdG9lTWVwS3ZDVEdPYkVTV3VSWmdtUktH?=
 =?utf-8?B?aUhhV2RWcnJqaE9zNm04UityamJyT2FwTXpQNngxRCs3QldJdWl2Vk1kOStQ?=
 =?utf-8?B?OE5NZFQ5enJNS0tTWFYySnFXVm1ZcjhJa1pLL2I1UTI0a3ZOTk5JbGczeVVS?=
 =?utf-8?B?aGRsV0U3d1pjRGhRRjF3akxzN0NCV2VZN0tHcmVFNTFYREJBZ0d6TTlGZHF1?=
 =?utf-8?B?SkExeVdxWm5YN2h3VjU3ZjFGbmN6aVc1T1ArMFhZVCtSV3lXdzlKdnN3emlU?=
 =?utf-8?B?V1R3MnlneG9YSFpXVWxxbzdQNzlIUFRSUFdPeUw4aUhiVWw3d2lTVk8wc0Zs?=
 =?utf-8?B?bG5mZmlDQTBiSzlHLzl1TGZpVytpejRjVElaUWlFYzZSYjZOdjlTRzJsamkr?=
 =?utf-8?B?eTFQNFJqZ1d0eitmSEhoTE0wbFVQSCs4UG4rcWRxVkxwdTNpT3Z0Y2xqV0k3?=
 =?utf-8?B?OFVRRWZFTmo4SUJ2VWFsMjlianZZZ0RYZEpRV0QyOWRpMTZERS9CZzd1ZjB6?=
 =?utf-8?B?eUh6Q3k1YnlyQVB6ckdOMGk2SXNqbHg5WEJFcnp4dXdSbnBlRnFkS1NISDJk?=
 =?utf-8?B?UkREWEUxR0pwcytEZUhjdXdLUUE1UnZNMXpLdzZWbzVoTGNWWGNnaUpkOXN6?=
 =?utf-8?B?TE1OYlJpVHRaWUloUWRrWXpJUGova09mTXh1amtRd0hvM0xMbFJJclBDMlkr?=
 =?utf-8?B?endaWkd1eWc1VTRFTUhvNWd5eHQrTUhQQ0JUbFpjWTIvWTg4TnZ5VUtiSmsx?=
 =?utf-8?B?UGlyWGpOb29iR1pSY0cvWGh3UERMc3RLWnQzZE9ZajNHZWNxaE1lWUFZcnhp?=
 =?utf-8?B?WXhKcVhrclJ6R3JpNTlwNWprd2krRlV6YUhLZkhldHNkdkh4OTBMbE92MGpL?=
 =?utf-8?B?M1kvS09LUUFiQnF5WEpDQlk3THdUc3YvSW5xSUtORndNK1Y2bW0zSlR0bS93?=
 =?utf-8?B?Mng1YzZrYjZDcEcxM3NJQ2kyWEp1WkpWZWtqWDAvUXV3dFMrbzFzL0V6RStm?=
 =?utf-8?B?V2E4K2Y5S25rY3dpQmhGQ0VqTkxrWTJKVHFpem4ycEZCZ04vUjE5eHp1ejY4?=
 =?utf-8?B?L09hc1VZb2E1Nnp5c2E1cVRvSnZldy9aTCt0NGRKcld5OEtDdXlic2JtNUU1?=
 =?utf-8?B?anRZR3BRYUx6MVI2ZUpVbnVqNUZ0eWhNaW5XdU1KVE04NElMY2RtRTlzdGNP?=
 =?utf-8?B?ZVovS3hHWkFjK3hnaTRmQlcydG9MejFqOWR3RDlhMnpvc1VJbGZkWUg0UXdB?=
 =?utf-8?B?RFNGeVRvS2RraStmYUNmSkRGOWJrVXdlOXVuSGVIZWdWbC9LQUZRd3RIN2Zk?=
 =?utf-8?B?SXIzcHc1ZHpmaDRDb2VTaVJoZGorQ0IrVW5lTkkrYXFvUi9lRlVveHhwZHMx?=
 =?utf-8?B?ZFM0UnhyTFJEOHdPOHZoNm5vbm5ueTBkKzNsS2VnWGdzeCtkSWI4dW0yMi9s?=
 =?utf-8?B?aExiVnhFNklTVEdXSTF4eER0NGJSMHJVUVdEODZWY0FrUDJyQnlFaEVSR1Vv?=
 =?utf-8?B?dm5jQmFVRjVGRzdlSllsdjRMTEw3b2NIbFU0QVpIME90S1RaWlNVc29zQ09O?=
 =?utf-8?B?NlVmM2gvZGh4U2hpK25yVkFPWDQwcVF2SzJOUFZBQmFEQWFuZFJBVElvdm9s?=
 =?utf-8?B?NWdVWmlDbDBXdldKNnBOWUhKVU1EWkY5VlpEWkRhU25zZVRnVnNtUU5SZS9V?=
 =?utf-8?B?RmcrcytKczAxRXZHdjJkd05YejZLbnZtTE9HMFN1M3NMZThOY1dRbUF5WUJw?=
 =?utf-8?B?aEVTWFo0NGhXdTBUYlJiSTgvdUR3ME9QdXhhNUJvaHZRTGhjV1ZOTnFiVGRR?=
 =?utf-8?B?SlhZb29xYU15ejlUOXdhNHByYnFVLzYxc3RqaTRUNGtKZVoweksrYWZ5UVUx?=
 =?utf-8?B?NzBhQ3JRMWh4d3BHWVJTT0plMnJMYkhVY1B1VnRDZE1hQWhiVnRNYWFlZjcz?=
 =?utf-8?Q?8Ido=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db070d36-330d-4bd0-275d-08dd761143e4
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 20:17:48.3305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfZsf2M9DDIxP4xKn1DdDFzXdHgv4kdwNOTQEfIoZ7qHjuR5YiQ4AczCZRLFEq/O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687

Hi Reinette,

On 3/21/25 17:58, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/30/25 1:20 PM, Babu Moger wrote:
>> The io_alloc feature in resctrl is a mechanism that enables direct
>> insertion of data from I/O devices into the L3 cache.
>>
>> On AMD systems, io_alloc feature is backed by SDCIAE (L3 Smart Data Cache
>> Injection Allocation Enforcement). When enabled, SDCIAE forces all SDCI
>> lines to be placed into the L3 cache partitions identified by the
>> highest-supported L3_MASK_n register as reported by CPUID
>> Fn0000_0010_EDX_x1.MAX_COS. For example, if MAX_COS=15, SDCI lines will
>> be allocated into the L3 cache partitions determined by the bitmask in
>> the L3_MASK_15 register.
>>
>> When CDP is enabled, io_alloc routes I/O traffic using the highest CLOSID
>> allocated for the instruction cache.
> 
> You can append a "L3CODE" to the above to help provide context on what resource
> is referred to as "instruction cache".

Sure.

> 
>>
>> Introduce interface to enable/disable "io_alloc" feature on user input.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v3: Rewrote the change to make it generic.
>>     Rewrote the documentation in resctrl.rst to be generic and added
>>     AMD feature details in the end.
>>     Added the check to verify if MAX CLOSID availability on the system.
>>     Added CDP check to make sure io_alloc is configured in CDP_CODE.
>>     Added resctrl_io_alloc_closid_free() to free the io_alloc CLOSID.
>>     Added errors in few cases when CLOSID allocation fails.
>>     Fixes splat reported when info/L3/bit_usage is accesed when io_alloc
>>     is enabled.
>>     https://lore.kernel.org/lkml/SJ1PR11MB60837B532254E7B23BC27E84FC052@SJ1PR11MB6083.namprd11.prod.outlook.com/
>>
>> v2: Renamed the feature to "io_alloc".
>>     Added generic texts for the feature in commit log and resctrl.rst doc.
>>     Added resctrl_io_alloc_init_cat() to initialize io_alloc to default
>>     values when enabled.
>>     Fixed io_alloc show functinality to display only on L3 resource.
>> ---
>>  Documentation/arch/x86/resctrl.rst     |  34 ++++++
>>  arch/x86/kernel/cpu/resctrl/core.c     |   2 +
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 144 +++++++++++++++++++++++++
>>  3 files changed, 180 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 6768fc1fad16..1b67e31d626c 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -135,6 +135,40 @@ related to allocation:
>>  			"1":
>>  			      Non-contiguous 1s value in CBM is supported.
>>  
>> +"io_alloc":
>> +		The "io_alloc" feature in resctrl enables system software to
> 
> Since this is already resctrl documentation "feature in resctrl" could be dropped to
> be just:
> 		"io_alloc" enables system software ...

Sure.

> 	
> 
>> +		configure the portion of the L3 cache allocated for I/O traffic.
>> +		By directly caching data from I/O devices rather than first storing
>> +		the I/O data in DRAM, reduces the demands on DRAM bandwidth and
>> +		reduces latency to the processor consuming the I/O data.
> 
> hmmm ... looks like "SDCIAE" was deleted from earlier used (marketing?) text and
> resulting text left as-is without re-checking if resulting text is still coherent.
> I do not think it is needed to motivate/market the feature here, perhaps last
> sentence can just be dropped?

Yes. I will drop the last sentence.

> 
>> +
>> +		The feature routes the I/O traffic via specific CLOSID reserved
>> +		for io_alloc feature. By configuring the CBM (Capacity Bit Mask)
>> +		for the CLOSID users can control the L3 portions available for
>> +		I/O traffic. When enabled, CLOSID reserved for the io_alloc will
>> +		not be available to the resctrl group.
> 
> Although the above reflects how SDCIAE is implemented it may not be true for how
> another architecture may support this. hmmm ... this sounds familiar and looking back it
> is the same thing I mentioned in V2 feedback, actually, in V2 I pointed to V1 feedback
> that said this also.
> If you insist on this text then please change the tone that indicates the
> behavior is optional. For example, "An architecture may support io_alloc by reserving
> a CLOSID to configure the ..."

Yes. Sure.

> 
>> +		::
>> +
>> +		  # cat /sys/fs/resctrl/info/L3/io_alloc
>> +		  0
> 
> Please refer to cover-letter about proposal to use enabled/disabled/not supported instead.

Yes. Got it.

> 
>> +
>> +		  "0":
>> +		      io_alloc feature is not enabled.
>> +		  "1":
>> +		      io_alloc feature is enabled, allowing users to manage
>> +		      the portions of the L3 cache allocated for the I/O device.
>> +
>> +		Feature can be enabled/disabled by writing to the interface.
>> +		Example::
>> +
>> +			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
>> +
>> +		On AMD systems, the io_alloc feature is supported by the L3 Smart
>> +		Data Cache Injection Allocation Enforcement (SDCIAE). The CLOSID for
>> +		io_alloc is determined by the highest CLOSID supported by the resource.
>> +		When CDP is enabled, io_alloc routes I/O traffic using the highest
>> +		CLOSID allocated for the instruction cache.
>> +
>>  Memory bandwidth(MB) subdirectory contains the following files
>>  with respect to allocation:
>>  
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index 1ebdb2dcc009..88bc95c14ea8 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -309,6 +309,8 @@ static void rdt_get_cdp_config(int level)
>>  static void rdt_set_io_alloc_capable(struct rdt_resource *r)
>>  {
>>  	r->cache.io_alloc_capable = true;
>> +	resctrl_file_fflags_init("io_alloc",
>> +				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
>>  }
> 
> Some MPAM changes landed since you created this work. After the fs/arch split the
> architecture code should have no insight into the resctrl file flags. Please refer to
> the MPAM changes on how this can be managed. You can refer to thread_throttle_mode_init()
> and similar to that resctrl can use the io_alloc_capable flag to make the files visible.

Yes. This needs change.

> 
>>  
>>  static void rdt_get_cdp_l3_config(void)
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index c5a0a31c3a85..37295dd14abe 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -62,6 +62,7 @@ static char last_cmd_status_buf[512];
>>  
>>  static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
>>  static void rdtgroup_destroy_root(void);
>> +static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid);
>>  
>>  struct dentry *debugfs_resctrl;
>>  
>> @@ -180,6 +181,19 @@ void closid_free(int closid)
>>  	__set_bit(closid, &closid_free_map);
>>  }
>>  
>> +static int resctrl_io_alloc_closid_alloc(u32 io_alloc_closid)
>> +{
>> +	if (__test_and_clear_bit(io_alloc_closid, &closid_free_map))
>> +		return io_alloc_closid;
>> +	else
>> +		return -ENOSPC;
>> +}
>> +
>> +static void resctrl_io_alloc_closid_free(u32 io_alloc_closid)
>> +{
>> +	closid_free(io_alloc_closid);
>> +}
>> +
>>  /**
>>   * closid_allocated - test if provided closid is in use
>>   * @closid: closid to be tested
>> @@ -995,6 +1009,33 @@ static int rdt_shareable_bits_show(struct kernfs_open_file *of,
>>  	return 0;
>>  }
>>  
>> +/*
>> + * io_alloc feature uses max CLOSID to route the IO traffic.
>> + * Get the max CLOSID and verify if the CLOSID is available.
>> + */
>> +static int resctrl_io_alloc_closid_get(struct rdt_resource *r,
>> +				       struct resctrl_schema *s)
>> +{
>> +	int num_closids = resctrl_arch_get_num_closid(r);
>> +
>> +	/*
>> +	 * The number of CLOSIDs is determined based on the minimum
>> +	 * supported across all resources (in closid_init). It is stored
> 
> closid_init -> closid_init()

Sure.

> 
>> +	 * in s->num_closids. Also, if CDP is enabled number of CLOSIDs
>> +	 * are halved. To enable io_alloc feature, the number of CLOSIDs
>> +	 * must match the maximum CLOSID supported by the resource.
>> +	 */
>> +	if (resctrl_arch_get_cdp_enabled(r->rid))
>> +		num_closids /= 2;
>> +
>> +	if (s->num_closid != num_closids) {
> 
> Considering from schemata_list_add():
> 	s->num_closid = resctrl_arch_get_num_closid(r);
> 
> ... the above "if (s->num_closid != num_closids)" just compares the value to itself, no?
> 
> This function does not actually take all resources into account with the above
> comparison. I think what you may need here is a comparison with closid_free_map_len?

Yea. I need to change the logic here.

The max supported CLOSID on the resource and closid_free_map_len should
match. Will fix it.


> 
> As I understand it is still possible to use io_alloc when the resource's max CLOSID
> is not within closid_free_map, this is just not done simplify implementation.

That is correct.

> 
>> +		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
>> +		return -ENOSPC;
>> +	}
>> +
>> +	return num_closids - 1;
>> +}
>> +
>>  /*
>>   * rdt_bit_usage_show - Display current usage of resources
>>   *
>> @@ -1038,6 +1079,14 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
>>  		for (i = 0; i < closids_supported(); i++) {
>>  			if (!closid_allocated(i))
>>  				continue;
>> +			/*
>> +			 * If io_alloc is enabled, the CLOSID will be
>> +			 * allocated but will not be associated with any
>> +			 * groups. Skip in that case.
> 
> This defeats the purpose of "bit_usage" that gives insight to user space
> on how the cache is allocated. Instead of ignoring portions of cache
> used for I/O this should display to the user that these portions are
> used by/shared with hardware.

Yes. Will change it.

> 
>> +			 */
>> +			if (i == resctrl_io_alloc_closid_get(r, s) &&
>> +			    resctrl_arch_get_io_alloc_enabled(r))
>> +				continue;
>>  			ctrl_val = resctrl_arch_get_config(r, dom, i,
>>  							   s->conf_type);
>>  			mode = rdtgroup_mode_by_closid(i);
>> @@ -1830,6 +1879,94 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>>  	return 0;
>>  }
>>  
>> +static int resctrl_io_alloc_show(struct kernfs_open_file *of,
>> +				 struct seq_file *seq, void *v)
>> +{
>> +	struct resctrl_schema *s = of->kn->parent->priv;
>> +	struct rdt_resource *r = s->res;
>> +
>> +	seq_printf(seq, "%x\n", resctrl_arch_get_io_alloc_enabled(r));
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Initialize io_alloc CLOSID cache resource with default CBM values.
>> + */
>> +static int resctrl_io_alloc_init_cat(struct rdt_resource *r,
>> +				     struct resctrl_schema *s, u32 closid)
>> +{
>> +	int ret;
>> +
>> +	rdt_staged_configs_clear();
>> +
>> +	ret = rdtgroup_init_cat(s, closid);
>> +	if (ret < 0)
>> +		goto out_init_cat;
>> +
>> +	ret = resctrl_arch_update_domains(r, closid);
>> +
>> +out_init_cat:
>> +	rdt_staged_configs_clear();
>> +	return ret;
>> +}
>> +
>> +static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
>> +				      size_t nbytes, loff_t off)
>> +{
>> +	struct resctrl_schema *s = of->kn->parent->priv;
>> +	struct rdt_resource *r = s->res;
>> +	u32 io_alloc_closid;
>> +	bool enable;
>> +	int ret;
>> +
>> +	if (!r->cache.io_alloc_capable || s->conf_type == CDP_DATA) {
>> +		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
> 
> rdt_last_cmd_puts() starts with lockdep_assert_held(&rdtgroup_mutex), also expect
> rdt_last_cmd_clear() before first use.

Yes.

> 
> 
>> +		return -EINVAL;
> 
> Could ENODEV be used instead?

Sure.

> 
>> +	}
>> +
>> +	ret = kstrtobool(buf, &enable);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
>> +	if (io_alloc_closid < 0) {
> 
> Could you please add an informative message in last_cmd_status? It may be
> possible for user to remedy this and retry.

Yes.

> 
>> +		ret = -EINVAL;
>> +		goto out_io_alloc;
>> +	}
>> +
>> +	if (resctrl_arch_get_io_alloc_enabled(r) != enable) {
>> +		if (enable) {
>> +			ret = resctrl_io_alloc_closid_alloc(io_alloc_closid);
>> +			if (ret < 0) {
>> +				rdt_last_cmd_puts("CLOSID for io_alloc is not available\n");
> 
> If the CLOSID is not available then it may be possible for the user to remedy this by
> removing a resource group and retry this operation. Since CLOSID is not useful to user space
> (and x86 architecture specific) this could  be improved to give guidance to user
> space about which resource group (by name, not CLOSID) is preventing this from succeeding.

Sure.

> 
> (this sounded familiar, looks like I provided the same feedback to V2, to which you
> responded "Yes. We can do that.")

Yes. Clearly, I missed that.

> 
>> +				goto out_io_alloc;
>> +			}
>> +			ret = resctrl_io_alloc_init_cat(r, s, io_alloc_closid);
>> +			if (ret) {
>> +				rdt_last_cmd_puts("Failed to initialize io_alloc allocations\n");
>> +				resctrl_io_alloc_closid_free(io_alloc_closid);
>> +				goto out_io_alloc;
>> +			}
>> +
>> +		} else {
>> +			resctrl_io_alloc_closid_free(io_alloc_closid);
>> +		}
>> +
>> +		ret = resctrl_arch_io_alloc_enable(r, enable);
>> +	}
>> +
>> +out_io_alloc:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret ?: nbytes;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> @@ -1982,6 +2119,13 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= rdtgroup_schemata_show,
>>  		.fflags		= RFTYPE_CTRL_BASE,
>>  	},
>> +	{
>> +		.name		= "io_alloc",
>> +		.mode		= 0644,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= resctrl_io_alloc_show,
>> +		.write		= resctrl_io_alloc_write,
>> +	},
>>  	{
>>  		.name		= "mba_MBps_event",
>>  		.mode		= 0644,
> 
> Reinette
> 

-- 
Thanks
Babu Moger
