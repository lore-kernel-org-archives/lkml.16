Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83884156678;
	Mon, 30 Jun 2025 20:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317115; cv=fail; b=GV7rpyvzZa+W9GyfFsIpusDCFsm3K0iZXpqskGeuoBgvgkHddXCoApBOMmlFSZJ0o55MAp/E1gmaf9HD0hpwT6y+sZ7RTHSiBNAsjrVRyCi4ODHrTqBq2Ve5n0yuQUppXDj+KmNJhKdF231HcLsGlR2HUkhYWERj3mDt9XfVDDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317115; c=relaxed/simple;
	bh=WCm8njcepux03LKT/proMzfkEwohPDx7dbUzqLM2u6c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=swPgYRKoPEblXFSxE8pDWtBNoemr1ReG9a+grADn/dKzETwzE3oPRLHd1AlgoKSyUjL59tRSnW9Db14eh4Td5TohtdhbsJtNyXbW/dyh0q73pCuWrXDFdMhOIaCZeoxFSYKK8N1xF1SDDVm5VBPPwoSGmE50xS5/7v3/Fg21ob8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=05tT/N3g; arc=fail smtp.client-ip=40.107.94.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="05tT/N3g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTSPj85CKDE0ZhpYVmj8RSC89/LgiqDBFvwcT/G9YWz64k5E46EISdddnwSXxXZz74/zGOAt4R40KBm6xQkkJprfBg8FqF0Yoe6S9grsV1ZX5KQ3aN+a7l90OJsZqDgHFnfjbnbgBUkV5vZu6jmQ0xwiVeIB7mjKWOX+YjaCGLL5iwhXvbZrrqVA24mHWUf5VYTRLdNyeshiHWJfXS6Bg2DzR0h8KJUSgS0hVP4JcaDL0K6ECr61/1vTo4HINNge/qtPcwnUOUa3UtYXDXsIWjH08p1bEQmJxTkxBw3q/7IXaVMmkC1gkdUFojFWS+6qu+5VbNY4C6T8M9UXywNqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqaQ8MygrHaOxSf/2+kijxuS2Qw1RwozJq7EDVkUbM0=;
 b=I0s2EUuyTTUP97lH2H4KGZcNw44oWRgAsOe11odPk3DcuSj3YdVNVGOXPKzyMjNDE5ioVDEfa+OMAiKBv/QvNYKLDvpvj4Kd2DHps/8L5pA9ZBAtM4jXg4QqtOjcg1cRlT36Q5Xk6zwHDpQvkj4Rw0i0h3kwhR1LOo+jonswk+QPetariZ6AvPLmf3hpzEQn0DLNi6374hXThWlCbtl2PTm4UV9fwrmhizfaa5Mhx/NDhwSjr0V6mBkuHL8tflkMW7w0/M0wud0DZbhU+Y/7xl37QTiloE7xRUyzmkpjZsgQa0Lqc9AK27e8NaWacwFH0aC60E0B5w4QIpdlvmYK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqaQ8MygrHaOxSf/2+kijxuS2Qw1RwozJq7EDVkUbM0=;
 b=05tT/N3g4atFJnua3pn6iVpjdKJbnySQjzgOe2g5koWNWWp+ZiseUNOZjMzsrc2pyBjYq3+8ZWoWBU0URdKOwVOs7+QfataiE79A+khAaMbffkCCjvYV2a31M43vCSK4Dy9HkwqDgfmH/xk0tGsCejVvgWoRv2TIO/dUpYBAmw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Mon, 30 Jun
 2025 20:58:29 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 20:58:29 +0000
Message-ID: <f80f254c-af8b-4d7a-96cc-e8aa569b6d45@amd.com>
Date: Mon, 30 Jun 2025 15:58:25 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 21/32] fs/resctrl: Pass entire struct rdtgroup rather
 than passing individual members
To: Reinette Chatre <reinette.chatre@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "tony.luck@intel.com"
 <tony.luck@intel.com>, "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "thuth@redhat.com" <thuth@redhat.com>, "ardb@kernel.org" <ardb@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "Shukla, Manali" <Manali.Shukla@amd.com>, "Yuan, Perry"
 <Perry.Yuan@amd.com>, "kai.huang@intel.com" <kai.huang@intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "xiaoyao.li@intel.com" <xiaoyao.li@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "xin3.li@intel.com" <xin3.li@intel.com>,
 "Shenoy, Gautham Ranjal" <gautham.shenoy@amd.com>,
 "xin@zytor.com" <xin@zytor.com>,
 "chang.seok.bae@intel.com" <chang.seok.bae@intel.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "maciej.wieczor-retman@intel.com" <maciej.wieczor-retman@intel.com>,
 "eranian@google.com" <eranian@google.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <84e5cffb2b3f8088f77781babe89b0cab513ed79.1749848715.git.babu.moger@amd.com>
 <918e2679-9778-44ea-9755-270658578f76@intel.com>
 <ac378dff-3eb1-498c-8b01-b7c5146c96bd@amd.com>
 <f8e15067-401c-4644-89a3-fd00cd59d58d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <f8e15067-401c-4644-89a3-fd00cd59d58d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0156.namprd04.prod.outlook.com
 (2603:10b6:806:125::11) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a21c95-a849-4ff0-188e-08ddb818dd9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUtqVFVYa0lqTTQyK1U1NXJrU2Jyblo4NHZKNU8zYzRXcXZwalVSLzlYZ05r?=
 =?utf-8?B?NHZBM1lsQ21jc3NmdGQwNXpTQ05hcEIzR3BqTitPM25IRGJzbjVuOFQwd2I0?=
 =?utf-8?B?V1pneDJCWENIc05oeGxYWTVaTjlRRjkxZ0VncTd1N0Y0Q01yblRNamU0c1VO?=
 =?utf-8?B?QWUzTXJmc2JSaktqcHlUZ3NuN2xxbGtBMG0wdWlNYm1JRWVpelhoL0JJcUd0?=
 =?utf-8?B?TENjcXdBQzBkRzVyOTNJWitma3hnUXBNdTJWRzZxUk15TFlUTVNDUW9OKzhu?=
 =?utf-8?B?QjhJeEFPUlVQeUQvSkVJOG1TYkRha2tjbzlTVXREd1dWakw5UHkwRnJRSWg4?=
 =?utf-8?B?TWFFK0M1VGRDNjhRbEJPSG40b1VJOEgzcjBjcFEweHZKNS9MZTRzeXlzNlly?=
 =?utf-8?B?TjE3b0hKdEZDcVd4REp3Uk9tZ1pZUFJJYkc1VUljTVFoRGVaa3Fua1JPaWcy?=
 =?utf-8?B?eGlHZmlGRElyb0c3dmhmdE9sbGRzRUlkdDh1NkNvNTFMT1B6Qkw4cTBiWXE1?=
 =?utf-8?B?NUh4dk1CZi9ud1NnMGtXK3A0OVltNlk1YlJwZ2VnMm9aak1kMm1HbitqYjBy?=
 =?utf-8?B?d2wyS1F3bEswTUVtRnBtamh1NTRxUGJhTDl4ek4vcWdUcGpUYXlKTlJmM0l6?=
 =?utf-8?B?VGs0OElYeHdRZEU4NTVPSVZBc2VFRXgyalZkQkROQnVGRGJCR1RiblRhMjZB?=
 =?utf-8?B?TTFoRUE4QUpScFArVWg0TFY1TkJPeGNneWt6VTFUTmZiL1dTbjQzZUJvQThJ?=
 =?utf-8?B?Undxc08rMjU1T3lFb0lBaCtSZE5xd1B3Wm1uZnpZSENJOW9XNm1qSFVKTUFL?=
 =?utf-8?B?NDBJTTJIWjZJejlERStUTzR1N2tZakJsSlBFbDFpTFgwUlpwUHgvQmMzTnBE?=
 =?utf-8?B?ZkpEaXVHMkgwOHZBb2dsK2lXY1V6blpDbjhhdmorNnFFeGswSkRhQ2Viei85?=
 =?utf-8?B?WFQzR0lscUQwelEzWWVaaEtiWTVJSlhGR21sZ1Y0RytuMXg4TzR1OC8vYTNX?=
 =?utf-8?B?NzM0Nzhmai9YOG5PTVJLa2pZSGdsaXgzWFB1U2ErTWgzLzlpalNON2F5ekk4?=
 =?utf-8?B?VU9hTW10bFViREJIVDRoTWNFNHNPSm9ZVVYwNlNQRXFPcDJVTmFMS3NSdUY4?=
 =?utf-8?B?QlJoc1FwWnQxZktsT0FpdklETW5JQ0ExczdKRkhOZ3Ryd0pSbVp2Nmo4bkJv?=
 =?utf-8?B?bW0zUzN1dkJ4YU9USGswQjJQbFM3bFdWWDFtbW1iVDJjckNFZlU2Q1VRT1p1?=
 =?utf-8?B?NjkvVjZCZ3lvZkhKVlhiMjU4clM1REY1RGJSaXNtVkR4YkpEWnVXRnNUWmZ0?=
 =?utf-8?B?ZStFTjlsM0lFWDZMVkZodStITWhlb2p2NkRmZTNsRXVMRFdVM1ZqU0dVQkZE?=
 =?utf-8?B?ckJKZnBTTm94TmZMdXd4a25HWlFJSGluY2xUV3doeDVCRXZVc2hWa1VKWUcr?=
 =?utf-8?B?ZXJDdVdURU11Szc3YWkvTTcvV1dIR3lsd3pmTkNGakhZWlhHaVNMRE1yWkU5?=
 =?utf-8?B?dmdmcmFJSTVKS1g4NWNGT092Z0NDbVdZL29qRm9JQjFWbmpHQXM0ZG9QRTZ0?=
 =?utf-8?B?QVZ2M2YvNUFmZ3BFQlpIRmRxc1BldDJ4bkRtSXhPeHRGSlRnQTJZNC9Mbkcz?=
 =?utf-8?B?ZlJLL1I3bkxPdzk0RFI2TWkxZTRXZnExZkpON3E5NVpXSGlPZHpRM1VYR241?=
 =?utf-8?B?MEYxUXhSeXVLRXNzUGNjTVBTTHdXQ2wxZmM2UDA5ZHZ4enFMSzhWbE1NZC82?=
 =?utf-8?B?Nmx5aStTWmlFWElueUdRdWo1Rnl1NmdGbjBnd255eGw0WG9OZUxpemhsMUt6?=
 =?utf-8?B?T215UWczNlV3dEl0clRxL1JHR1BwQnlkNlNQdWFRUmp5WnBGMnNQQWhYaGU2?=
 =?utf-8?B?cVNZRFF1ekwreE5QZkpUSkUrR2Zvc1dEWkNTb21KTmlGenVqd1o5ekw3aFN3?=
 =?utf-8?Q?6pqKUXG54wc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVdTMWo4WVE4K0lBMjlUQ2lLSi9tYUxVNi8zeXhzWmxsbC91ZTN0Tzd6aGVU?=
 =?utf-8?B?UmFVRDJoVThRWGV1aFVYNHBneWVsRk5mczVEcktEMHJpTnFsQlBaRXNQL2Z1?=
 =?utf-8?B?RUkvZ3ZGcnFrUDNTRFlXKzlHb29sdlprZ2tQWmFQbjlPdUJ6NXJ6N1J2Uith?=
 =?utf-8?B?Y3BYNmZ2eEMrRU9zUjBTcWVrMU9Uc1JlT01ZU2tGQUFUTTVINkI3SVVFcndv?=
 =?utf-8?B?RWRIeVFad3hiQmhyQVZhRCthN1FtNWlEYkZQYUlKb0c3RmpyY0IzdnFHakFR?=
 =?utf-8?B?SEhuVDYraC9mSTNzc2tTQkJWYngzUTV4VGVEellxejkzaVdrSjNSMDQwd2dC?=
 =?utf-8?B?My85dFBHYld2cWlTTUkyTDhDeFpCQzY4cHdkdGZqS0pYVE9ZcVBJSTI0dU9n?=
 =?utf-8?B?dGFuRVU1M2dyWXF0Z2FQMmVCVjJzWlp0TmgrNklBU1puNkJJRmpia3Rwc1Z2?=
 =?utf-8?B?UXhCVzd4d2xoMWh0RVV4M25oTkJ6SUtEMXNpT2RzMTBOTzJIZVFLRDl4ZEth?=
 =?utf-8?B?RnJ5TmJ1ZTZhOHZOUis2eTNYZlI0S1ZOWE15T08ySHl0Q1lGY0FoUGZYK2o3?=
 =?utf-8?B?cmttb1FjQXBIeENnZzB6SDZaSllIdEU1SFk4YndNRzl0ZDZGKzFXUU4xdFZJ?=
 =?utf-8?B?dDZmTUZPaWlzTy9DeFNjOVBsUlpRNUQ5djI5aWQrdVhRWExPazhZSUZKV2dt?=
 =?utf-8?B?eEdRSVdPY2V3WVlIcTExTS9HV2hCTCtqSW9KTG0vQVhOSjFVWE1qL25qaWJC?=
 =?utf-8?B?c0ZJMGppN21ncmVMMHVCbzY0aXByMEpKVGJjR0d2L2pPY0h3SVdmQzZOdmZt?=
 =?utf-8?B?eS9tWndGV0FzbGowc2YxQ3ExL3dCYmxkNjJWQVZIenI3RmpvS2l6WFY4aWVE?=
 =?utf-8?B?SUpsbjJ4aVhzUDZpZCttbFVCNklXYnJWZGcxRjZiOFVETDUzdEhZVXVCQ3Mv?=
 =?utf-8?B?eXc5SHpZZFd0OVBkREpheU1sUXFJYk9GOHAxYW9OZXJKMzVveHlMYmo1Vjdu?=
 =?utf-8?B?NUNjM0x6ZHZHRDZ1TURzQXJSOVUrRUFJQ1Q4Zy9YUEZ0WVVmRUROUmtXVkE4?=
 =?utf-8?B?YlE1d2lTV04yWFp4bVB0WVBxSlUwUmw3RTRJVzdMZ1JUYnA0c3hncGRKNGFt?=
 =?utf-8?B?enJpUGxLZzYyOTBUN1daYVR0emRMMzBPTkNyRFdMRXNCQjI4QnY2aWdYSG5R?=
 =?utf-8?B?Nks3TXRDeXQ1bDdiOHlFdkdnc3N2RHNWUHpxMHovSS9qejd2T0lWTEJTZXMv?=
 =?utf-8?B?N21JeU1YYWtnMTJxc3VoZTZwWE1xMzUzdUZnVmQ3OEp3djhMbGN0YWNaaENM?=
 =?utf-8?B?UDc4Z25DaUQ1ZGVGMGloMFl4ZlFNeUo4cEFWeHU0ZlBwK1BxM0RGeXUvRVAw?=
 =?utf-8?B?YWwyUWZjeFVaR2J6eEpLM1VwQTU5YWhRNUF2QVUyT1JWbWJzRm0yeUJEQUpB?=
 =?utf-8?B?NjhTS0dlTzgvQUVuL0tZckthb2tLWU9FUnM0dUFnUTNZWGc3UENSTW14b2VY?=
 =?utf-8?B?THZ4WXJ4WndBczdPSUFQRnY3RFk0WGJCTFJzYk51WVFRZ0NZeHF1Z2g4VnVT?=
 =?utf-8?B?QnRCd2tvMDhEaHkyQkd6ZkV0V3RpbDI1QkJpY2tTWXlTUFM1RDdJeWpHSkRZ?=
 =?utf-8?B?ekxHWG9TdXVaUEVSS1lZUVNva1NuSnd6NkRzS0lONUc3WVh5di94VHJWMVM5?=
 =?utf-8?B?ZDMvV2JwUG9YaU4yYi9yVlBMOE1BRHhRU0NuSDJhOVVSOXpRZUlSQlBxYTEx?=
 =?utf-8?B?Ungvcldwa1VDaXREcXRWK0gxaGUzanczWCtMbGExMndhSFpBSHJycklQM0Vs?=
 =?utf-8?B?VW9YdFBOdG90K3R1aytZOElONUVhWWRxKzZxcDZXV2ZvNGRPYzdSN3ZHSGVw?=
 =?utf-8?B?Qm9yWHpwclg1NDR2MDhuZWhFWk9IVWtxd2t1S0wwcm9pdm1wWEtFc0JHUk15?=
 =?utf-8?B?NU9OelZEeUJ1LzFUZUo3RHNRNTNaQXpEOGt2aXR1aHU0M2dHTDN0TS82cDRS?=
 =?utf-8?B?SVNOa0x1NkF2RnNIT0xhcm0ra0Ixd0o1ZTJGa1V4ZXBFekhUZ1Z0cGhmdFpv?=
 =?utf-8?B?TCtwUmd1a3Mwb3BBQm5ML09oT2l0U1NtTmt4RlI2U0lIakFxU1FkWUdzaWsv?=
 =?utf-8?Q?u2+I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a21c95-a849-4ff0-188e-08ddb818dd9a
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 20:58:29.6844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFVLP1qI/7Ya78rN+1DXqgq9mOewr9/FHsNdO+XBA1N9aO+13pNlBOsZjuqmELcP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229

Hi Reinette,

On 6/30/25 10:44, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/30/25 6:57 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 6/24/2025 11:18 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 6/13/25 2:05 PM, Babu Moger wrote:
>>>> Reading the monitoring data requires RMID, CLOSID, and event ID, among
>>>> other parameters. These are passed individually, resulting in architecture
>>>
>>> It is not clear how "event ID" and "other parameters" are relevant to this
>>> change since (in this context) it is only RMID and CLOSID that can be
>>> found in rdtgroup.
>>>
>>>> specific function calls.
>>>
>>> Could you please elaborate what you meant with: "These are passed individually,
>>> resulting in architecture specific function calls."?
>>
>> Rephrased the whole changelog.
>>
>> "fs/resctrl: Pass the full rdtgroup structure instead of individual RMID
>> and CLOSID
> 
> nit, can be simplified to:
> 	fs/resctrl: Pass struct rdtgroup instead of individual members

sure.

> 
>>
>> The functions resctrl_arch_reset_rmid() and resctrl_arch_rmid_read()
> 
> (No need to say "function" when using ().)
> 
> But wait ... this now changes to different functions from what the original
> patch touched and even more so it changes _arch_ functions that should not
> have access to struct rdtgroup. This new changelog does not seem to document
> the original patch but something new that has not yet been posted.

No. patch has not changed.

> 
>> require several parameters, including RMID and CLOSID. Currently, RMID and
>> CLOSID are passed individually, even though they are available within the
>> rdtgroup structure.
>>
>> Refactor the code to pass a pointer to struct rdtgroup instead of
>> individual members in preparation for this requirement.
> 
> "this requirement" .. what requirement are you referring to?
> There is no requirement that individual members of a struct cannot be passed
> as separate parameters and there is no problem doing so.
> 
>>From "Changelog" in Documentation/process/maintainer-tip.rst:
> "A good structure is to explain the context, the problem and the solution in
>  separate paragraphs and this order."
> 
> This new changelog has structure of "context, solution, problem".
> 
>>
>> Additionally, when "mbm_event" counter assignment mode is enabled, a
> 
> This seems to be primary motivation since passing struct rdtgroup will
> simplify the code (when I consider the original patch, not what this new
> changelog implies) ... but if this change is indeed to the arch API as the
> context suggest then passing the individual members is the right thing to
> do because arch code should not access struct rdtgroup.

Again.  patch did not change.
> 
>> counter ID is required to read the event. The counter ID is obtained
>> through mbm_cntr_get(), which expects a struct rdtgroup pointer."
> 
> This is even stranger. mbm_cntr_get() is private to resctrl fs while
> the new changelog describes how the arch functions resctrl_arch_reset_rmid()
> and resctrl_arch_rmid_read() need struct rdtgroup to call mbm_cntr_get()?
> 
> Reinette
> 
> 

Patch is same.. I am having trouble with changelog. ):

How does this look?

"fs/resctrl: Pass struct rdtgroup instead of individual members

Reading monitoring data for a resctrl group requires both the RMID and
CLOSID. These parameters are passed to functions like __mon_event_count(),
mbm_bw_count(), mbm_update_one_event(), and mbm_update(), where they are
ultimately used to retrieve event data.

When "mbm_event" counter assignment mode is enabled, a counter ID is
required to read the event. The counter ID is obtained through
mbm_cntr_get(), which expects a struct rdtgroup pointer.

Passing the pointer to the full rdtgroup structure simplifies access to
these parameters. Refactor the code to pass a pointer to struct rdtgroup
instead of individual members in preparation for this requirement."

-- 
Thanks
Babu Moger
