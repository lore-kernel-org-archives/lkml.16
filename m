Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16D61C3BEB;
	Mon, 30 Jun 2025 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304048; cv=fail; b=XQ++zib19w5dBcEk5Fec3IEiDUmzb8p4GLVphq2EiCanh6WgsyvVbHwlclyiJOnw/GGqB7i/LEMRWW50H173Uq0aNObrpPa2Y/ex8vWBYEK/yIwtX47YrlT2zGuqGWg4mlBJoxZSMSd2k7qIFdowK1JZxFagFg2iRPrQOuYfhV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304048; c=relaxed/simple;
	bh=ERks6GEQDsgrmCcizyUgpnn4Rkczw8FIsqxzozqkwNI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ol+ucwQrNU1o0Ibt0+GS14w/WEfQdD1ZQuCzeWfyJzzzvwFnGQTXAKTXRaOA26Yk5n2K0BSjTMoaFlm6fvzMbZrTz76QvrRUgYFgFX88HCUaOHR0LmtB5Eq/LaVKOcyqB4B9XTKGgUlhhkszy3hzw3lDOuEjlQoTATqxinhMHEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C/lQ4kyp; arc=fail smtp.client-ip=40.107.102.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C/lQ4kyp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0uUUhT3GjXr5RWxlxVRe5kmsPDU4Tna8BG6585MQHUDnwCLBD41K4KcHoHusubCv1jnvHEj/zHj00BrSLoVFX7XoUn42dGmYdHGBgclM+argo8OjVndOQm65x8zK70VeSY2nHmWft61Q9FTspE0dgaHbIEheDAAukz3zLLqIOn39WFS/OreBasa9F0EtWxX1erbt8HTSyvHIwr/T0vh4GTC45YQz7wkeCifHsfox5Er+fw4zrPz5YmbX2VDN/KZ7FUSOlgAYF26f2PrJcqqKJKILHKBN1YAhfzyJZn8Sex1zVE2A1TMZa/LEfI6cwHlKDijBQRTkacNzOM5wtpZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N3K9wuvScORzNF0WCgncLeClEgh0jw5j5Hh0EBQXeI=;
 b=OFe5vrfNd3QTHBL/3wicGXBo0I8XGp8hznwd9xrueLQvwLz3jqUmk7BAjncWW0oVG8JFeUs/mnpxO5AY+7CP7JtylpQvGgjuO4w4bmaqOM6M3fgIRf8E5CQt4YWi4nUQirfCAnUyQs+3kol44h5OzruavXUPZcbCDisCX7mAxo80MPAm9yhIEGL3lmpse68g/DfNJ3HSELRZm4Wdk99+jQe2chX2ZBt31EEwmflnta6YCIQtfRcpTlDPsThf9tsjaxX3omH8otatkX3xlfsPrJbYGUNmB5j/TEcPAHBhRc8T3cJSjoTDjCx4Cqh906CGh/HKdwBSalexzC/kkITwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5N3K9wuvScORzNF0WCgncLeClEgh0jw5j5Hh0EBQXeI=;
 b=C/lQ4kypPBcSxMtjsab5tBEEeQQBNJWHL9WPEI0oGW3jDVdwG3vXcH0MRayWz1Ztz9ylxsOd6vZNfzGdk6xMIQsOLCB/o7PAVz8sFOwyXqJU81yfrwjqlnZsOunId3cNoyaAULBemIzFR9zKMGSIyQy80ffkmSSNlvYVgqa24vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 17:20:43 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 17:20:42 +0000
Message-ID: <1ecc2e54-f62a-4937-be9d-5a275dae0634@amd.com>
Date: Mon, 30 Jun 2025 12:20:38 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 23/32] fs/resctrl: Add definitions for MBM event
 configuration
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <dbd02fa64c22ec933ba27e69ded8288d4d4ae9a1.1749848715.git.babu.moger@amd.com>
 <fd9c7ca0-1d16-49b8-b3f7-4f37cbd9060a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <fd9c7ca0-1d16-49b8-b3f7-4f37cbd9060a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:806:27::25) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 5042c9ac-b556-45e6-e57e-08ddb7fa711b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3lsbjlQU2hYajdPbXoyVGdEcnBib3MxUlJBc0JZcWVmVDFWWXM0OTlPbjdl?=
 =?utf-8?B?UnlDWllocE9WZGJncGk5MFdDcFpURjdxWGNVSlpOYUdSZ1pFMFU5UWpoQzFT?=
 =?utf-8?B?ZFZtaXZIcS9BTm92MWo5UmZZdTZGZ29VeG16RnhVbUwyTTJQTEx2Y09HU2pZ?=
 =?utf-8?B?VS9IOUxOMmt3cnFDM1h1WVJNM3dQcktsV0FVZ1Z3NEJka2QzSmdIR0tGU25k?=
 =?utf-8?B?SHlobS9YN0tEWGljWGp4TUtyQUtIOTJTL00yVWZiaktPTkZWQy9XTldmOUNp?=
 =?utf-8?B?ekVzUEx2cjRjSTYxYVFMLzFNV0J3Q1FTcS8zbCtNQm0wQVlrVU4zSU81cVRZ?=
 =?utf-8?B?ajJ1T0tHV0FVdGljT0RZZXNCb1FuOEc1VGhMd01nRW5lQndVSHdyRDgxc29R?=
 =?utf-8?B?aWIrRXNOVWhlaFREWFNEWDhCREltbjJ0VHh3eWRzanR4cjBWUiswSXl4OEw0?=
 =?utf-8?B?K3ZDYnlFS1FwRUNpenN4dDg3OXM5d3pzRDREMU5xNmlQbmwrc3RwamhmOXh3?=
 =?utf-8?B?M2hQREEwUmZhMkQxallSdlhvdGZtR0NNYk5JQkovZ1V0aFpGT3pQdmZmZnBE?=
 =?utf-8?B?d1BJTmlrWmRPYXJraWMxRU1xS0FTdDRXTHpTT1ZMOC9NMHhLdGdZRkFaa00w?=
 =?utf-8?B?RGs4Z1BKNWdSaGJlcjN1UFNWTEp5djEvOGlwaHRUSDRjT0hpdHdGc0F1cWRZ?=
 =?utf-8?B?ODQ1aTYxU1V0YU5KZTdhZUd1ekhBMDBIYWkybWF0YlRSY3pSOWszem5xSWxY?=
 =?utf-8?B?Mi9VR042V2JUZ3FCbS9CRnJDcUxENnczL0YvakM2Rjd4TE04Y01pdDJTd3VJ?=
 =?utf-8?B?R1k3RWVpSmpPZDJXSWFRUzAyb3RRQUdQVG5zTlo3aDk4VzJWOVJpN21CNmdL?=
 =?utf-8?B?ZDV1aWlTV1ljYTlZNXMwYmpLR0Q4YkdueHVPTUM3VzB6MFVLL3FNTGNSeWRa?=
 =?utf-8?B?WldzdkJjalJkWlVwY3VEQnpENjdkeTM0Y1BqRjVpRVoxTStsWUVNb3N2blox?=
 =?utf-8?B?R1FhZGNtdWhqOUhSdG9xQmQwcnk1cSt4cTJ1cUFaQVE3SS9uN0d6aEJyL0ZQ?=
 =?utf-8?B?bklwT2FweURHYW9HL2h4SUJNalphd3QwY0t4RURZcXp3Rm10WE1jREorQ1NL?=
 =?utf-8?B?L0prUHlpYW9mMUNDdkZaY1FaTVlybEFxTzBtNVRBYmZSbkJWc3pId3kzQVVL?=
 =?utf-8?B?aytjM2J3OThScXM1c3g2N0ltQTIvOXhRMGlaK2UzaVpXU2JsOWQvZmlRQXNj?=
 =?utf-8?B?SjVGd0lpTGtiemt3emMxcW5ZclJSWXIzRnNWbDBMd0grVFFHV1RxaTcyNy9L?=
 =?utf-8?B?aGRPRURkWWE0eGI3OXVNUjVqUTJBaklyODBUc0N1aVErSmhVSFFRYWtuNTAv?=
 =?utf-8?B?UDErS1FwbWtGU21Cb3RVQ1FOajFzR3hJVmF6WHZuMG9LdVhpQVd6aTNPQjhl?=
 =?utf-8?B?M2dQVnEySmI4TnorR1lpTllTMG1iYjc0ZXJYMmQySnN4UXFWaHJqcVhHUXI1?=
 =?utf-8?B?Rk9QRFROQjlsQ3RZUUh5MUpab0dPZ2pyZmJzaC9VQmVMTStkRkRoaU9ZcVNM?=
 =?utf-8?B?Vjg2VWtURTJVd01QQXZDd1V0WUR3aGlXVEhscDEwa0RMQktGdnpVbjZVK3po?=
 =?utf-8?B?T2xCUXZtOTByZ1haazBSVTBHT2trNGxhU0RjWWhsNDJNdDAwODFEQnFtcDBI?=
 =?utf-8?B?ZEprdUJOb2llMGZ3UjYvZkFtM3JSckllSmNoUUpSelp4VExyeGJyQXE0QVQv?=
 =?utf-8?B?U2ZzQnA4azZ2UjdrY253RWo3QVVNZXdIREplSmUxd3F6WGFZZ2NTdmZnUUli?=
 =?utf-8?B?QmZaamJSUXB0SC85RnJCcEVEK1lnanNJdnF4YUFRdCsybUt0Zk9pS2NiVzJO?=
 =?utf-8?B?SitQdldTZ0xpNzA0aDhmdXd6L2Y3cDh4S2prakxLdDMycDc2VXVYcXN5Snh1?=
 =?utf-8?Q?+gDpeiitPEo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1VpeFUwTHdxRFptVXAzVWY1am5XcEREaGEwMFNHck41WEthVFcyUWV4RTRk?=
 =?utf-8?B?UWsxYUZIVmZKc0ZuVnNDOTdEM29qUy9ETFBjUDE0eTFETDV0b292dlRxOGd6?=
 =?utf-8?B?aEduVUoydGowbVNsdDF6SThNMXhWMEFVamVBNk04b2lva29XQmFlbkdGOTls?=
 =?utf-8?B?aXNZQXVuWkRDc3d3STdrbEEvTGJuOGExMlByc2NXUlJrWFFCMHZUend2aDZn?=
 =?utf-8?B?L0pHNU1pWG03c2FZUkJ4eFBIa3gwSUdkKzd1Z2phdndweGdkclZPaXdpczk1?=
 =?utf-8?B?WDJIUlQ4YUN0L0xnZXVSc3dQcmYwRmVreHgwajF4WlhIejBmSEZpVXhhTDIz?=
 =?utf-8?B?U2VteXArWXpLZEswU3dIWlBoQjZlQW5nSUYvWFl1K1dqaWI0QTM0YUE0Q2VJ?=
 =?utf-8?B?ZkRxa3Q4NDdNNkFnU2l6VnEzekFjZXFGWHRaVDFwN3JDWlUvQWovakk5VkZB?=
 =?utf-8?B?OURkbmlNWWRzSGNlaHpJMDZGQllDdkI0VXI0SnMzNUlwS3RZUCsyK0g0VUxZ?=
 =?utf-8?B?eUtsd1F5OHd5M0I3N01rYVI1Mmo5WjIyL1dBYTV6ZHM4ZnZBK1R3ZHpSTU9y?=
 =?utf-8?B?WURuYnNreXVsTkxJdk94eXFJaUJZdUVhSjJjRTRBNTA3TW5wbVlnVDNwNkNx?=
 =?utf-8?B?VkJuQ0VuU25XbHlBOEErM2txVW42YS9vbkhPODFxWUFJeU9OY1kvZ0RoR0sz?=
 =?utf-8?B?cnZCMmlUUFkwNHhFLzgvLzRtaHB1RnRQT1NMN204S3R6a1NCOU0ySnhxTHR1?=
 =?utf-8?B?QkxhdjJXK21IZWRjRE9JOEVPVk15US9lVWJFK3hOWG5WZDFLMVk4Qk9uUUNi?=
 =?utf-8?B?OVowZHo4RWJSTVM5eU9aSGN4Y2hXc291Q290TnNPc0lsTFgxZGtiTmprNFZV?=
 =?utf-8?B?TDhDVU50VFRGWEp0UmJ0TDI5YnMvdncvb1Q0OE5Iby94TEozVFBDV3E3WXMv?=
 =?utf-8?B?bkpVb0dkek05cnUrd252aEExZFVwRGNZTWFkK3E0cW5mbmVPOTdOZG1IUzAy?=
 =?utf-8?B?dFJmc2l5aFp3dE1FZUlyZmpIYnhjUzlPM29mSmtzdGwyeWlmUjN4Q1psTUtI?=
 =?utf-8?B?dVFKNkRNS29va2N4THJ4Wmo1OTh1WjVvSERqa1hWWSsxSWcvZ1VXYldYWkdt?=
 =?utf-8?B?ZDc5NzBaMTRiaWUrUFZ1eldTRTlqYi83UUdsQmhCTmIwQWdCcnE2cnZvSGov?=
 =?utf-8?B?ZlNpNkN3WFFVbWo2UTdZMVhtMHM3VUNoOFh6MGMzU0dURDM5dklpd3M1THI3?=
 =?utf-8?B?Z1VMUHZDY0l0YkZFa0wxenhnY0UyWHhSVzZ4ZGxOaWVCd1NISG1Kb1Exb3Uy?=
 =?utf-8?B?QTV5cUV4TGlhMFlFcldsYkJiNVRDekpleEp0SnY5N1JuZkRyMUV4SjE5SGQ0?=
 =?utf-8?B?c1FNcGVsVVBRMjJRYnR2dlAzbEVNaVU4aHg3NTF2LzZUSmhKWDdnMVo3Y0JT?=
 =?utf-8?B?ZFQzdjk5WDJTKzI4dUVtZmlXcUM4RzIrdmxhYXRhZjJRUEJ6T0ZhTkQvMGZw?=
 =?utf-8?B?bzdBOG4wc0pUR1Q4cjg1RW5ZUTQyZk9TSldDbEQ2UVE4YmV6RmY5ZzFFdG0x?=
 =?utf-8?B?WnplS1FRWVcvS1N0bml0M3RFSGlpTjFIbmt2MlBwUVhXbFBweGNvZ0VQUldP?=
 =?utf-8?B?aStCNWhtUmp0NVpyVWpIQlgyUUpsZ3d5UzJoL2dISzdEaExxZ3R6eDFBazdl?=
 =?utf-8?B?cVNDYUcwMVFINTFLZlI5eGxmVVBsSTBvTXBZWkhkWnVPNkhzUVVYUkUwVE9Y?=
 =?utf-8?B?ZUoxd3l6aUpCaE9PNkQzVVpERW1OZlR1VFVhMVpxNjdjVWhaUWxhbjVNd21y?=
 =?utf-8?B?eHpBS3pHdEh1TUZpTUd5VGlDbEc5aVlXbW0zTStaREtQdjM0STV6T1VvRzJj?=
 =?utf-8?B?MHQxNElTd05SYlNEbzFZT2NUaFNvRlg5bHY2MWJ5WlhvSHQwMTZFTTc5SWw0?=
 =?utf-8?B?ZEJFMjQ1bmpuVTFRa1lSV3dCck40NFNtelo2QWhHOFJyR09XaHpyVFF0OWp0?=
 =?utf-8?B?RWhFbXhkaWdsNjcxUTlldGFMUldRV2xkQXV4T3ZKdU9ydzM5T2FVRXp1TjBh?=
 =?utf-8?B?Y05BbEtYcUh6M0l4WlBwdlgrMWZydDc1dFlsUWc0QWNZL2NPRThtN01oa20y?=
 =?utf-8?Q?azx4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5042c9ac-b556-45e6-e57e-08ddb7fa711b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 17:20:42.7534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZQxSBpcSdFas6blieOxZBIHAbgcQrPIBbS8FKKH5Agps8ahcE/R0EF5E7PfDZBc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035

Hi Reinette,

On 6/24/25 23:32, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> The "mbm_event" mode allows the user to assign a hardware counter ID to
> 
> "The "mbm_event" mode" -> "The "mbm_event" counter assignment mode"
> (I'll stop noting this)
> 
Sure.

>> an RMID, event pair and monitor the bandwidth as long as it is assigned.
>> Additionally, the user can specify a particular type of memory
>> transactions for the counter to track.
> 
> hmmm ... this is not "Additionally" since the event is used to specify
> the memory transactions to track, no? Also please note mix of singular
> and plural: *a* particular type of memory *transactions*.

Sure.

> 
>>
>> By default, each resctrl group supports two MBM events: mbm_total_bytes
>> and mbm_local_bytes. Each event corresponds to an MBM configuration that
>> specifies the memory transactions being tracked by the event.
> 
> Unclear how this is relevant to this change. This is just about the
> memory transactions.

Removed it.
> 
>>
>> Add definitions for supported memory transactions (e.g., read, write,
>> etc.).
> 
> I think this changelog needs to connect that the memory transactions
> defined here is what MBM events can be configured with.

Yes.

Changed the whole changelog.

fs/resctrl: Add definitions for MBM event configuration

The "mbm_event" counter assignment mode allows the user to assign a
hardware counter to an RMID, event pair and monitor the bandwidth as long
as it is assigned. The user can specify a particular type of memory
transaction for the counter to track.

Add the definitions for supported memory transactions (e.g., read, write,
etc.) the counter can be configured with.


> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> ...
> 
>> ---
>>  fs/resctrl/internal.h | 11 +++++++++++
>>  fs/resctrl/rdtgroup.c | 14 ++++++++++++++
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 4a7130018aa1..84a136194d9a 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -212,6 +212,17 @@ struct rdtgroup {
>>  	struct pseudo_lock_region	*plr;
>>  };
>>  
>> +/**
>> + * struct mbm_config_value - Memory transaction an MBM event can be configured with.
>> + * @name:	Name of memory transaction (read, write ...).
>> + * @val:	The bit used to represent the memory transaction within an
>> + *		event's configuration.
>> + */
>> +struct mbm_config_value {
>> +	char	name[32];
>> +	u32	val;
>> +};
> 
> "value" in struct name and "val" in member seems redundant. "config"
> is also very generic. How about "struct mbm_transaction"? All the
> descriptions already reflect this :)

Sure.

> 
>> +
>>  /* rdtgroup.flags */
>>  #define	RDT_DELETED		1
>>  
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 08bcca9bd8b6..5fb6a9939e23 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -75,6 +75,20 @@ static void rdtgroup_destroy_root(void);
>>  
>>  struct dentry *debugfs_resctrl;
>>  
>> +/* Number of memory transactions that an MBM event can be configured with. */
>> +#define NUM_MBM_EVT_VALUES             7
> 
> I think this should be in include/linux/resctrl_types.h to be with the
> values it represents. Regarding name, how about "NUM_MBM_TRANSACTIONS"?

Sure.

> 
>> +
>> +/* Decoded values for each type of memory transactions */
>> +struct mbm_config_value mbm_config_values[NUM_MBM_EVT_VALUES] = {
>> +	{"local_reads", READS_TO_LOCAL_MEM},
>> +	{"remote_reads", READS_TO_REMOTE_MEM},
>> +	{"local_non_temporal_writes", NON_TEMP_WRITE_TO_LOCAL_MEM},
>> +	{"remote_non_temporal_writes", NON_TEMP_WRITE_TO_REMOTE_MEM},
>> +	{"local_reads_slow_memory", READS_TO_LOCAL_S_MEM},
>> +	{"remote_reads_slow_memory", READS_TO_REMOTE_S_MEM},
>> +	{"dirty_victim_writes_all", DIRTY_VICTIMS_TO_ALL_MEM},
>> +};
>> +
>>  /*
>>   * Memory bandwidth monitoring event to use for the default CTRL_MON group
>>   * and each new CTRL_MON group created by the user.  Only relevant when
> 
> Reinette
> 

-- 
Thanks
Babu Moger
