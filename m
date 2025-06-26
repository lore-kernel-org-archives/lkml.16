Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8D324503B;
	Thu, 26 Jun 2025 21:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750972365; cv=fail; b=onYVoHtB5SSo2iV51QZHmRK7yUG/yRj3XXipjdSTlrjbCouO0Tf49IMzjrDwcTOegF1r8FP9VUAqsdcXJT/DVT5gjuQ58kg4yTmnjW/f+LmktNnx4xQD4Z7GERJyNTaxlDmtg5Ap3YmcrKEG20XRuVlkJh2GX7tTAcJcFhID9zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750972365; c=relaxed/simple;
	bh=PtyWPsJox2hBfAtG1dC4rAfAUi3KgYqSM3HNy6roRlY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UZ+0KTqA1jPVnBBmEn4NCcOxeQPwDl9Q5nwDEiJHZtIfdGcBJwRIf9pwoeitmRjdUW3Db66XqlzKvBdj2it8nLOXBukzVWRka50B2bidZtdG8KrFijIp4ufRwKoaoiLN8JCDwO0RL4KMif5y++LAM5tLd/tUh9dDyKOdMdiXV+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q3SSNPGF; arc=fail smtp.client-ip=40.107.237.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q3SSNPGF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxxtRx2RNvvAaQxnImIiJ8PQUUB20P4grFbZkgx6wzLCppJLXI4JKbkLQedhYQrDcdOlFyTlk6vu9FAAjJ7fUmDwSQWKf/d+EXpgH8Pwovn/E9brZZB46/EhpVFm4aJtf4Yn0ugs+RZzH0Ux78/rrHqQqkZ0y1ogOPakjjpzMITeYEtQqeuEJaaDSEIhnLTm1tfuk8dYevoYNVE249xDPQnLX1AiTnbeXYTl7GytSk8fC8TvMJPDqUyaqKvBGtG3jPFxH+S8KhX95wY4faI4+tlml1KFgpQkW1sNHHIt6+P8MnzZHOTXnFmuiu7UovNm0YN7APcV2ibLVGKj69eGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GeaZU9CLdyxyx3xIV0wsantwQ5Nfquf8lmuOc9oqz8=;
 b=pl0Xw8/H00Y8jMzcCQH2BfWygwRjCbaJoh4gU6PTaLVzdc3u3R7rKQE1R6W96k0sW2uzysJC4p+EkDdUv9s1b71+ONLri+7iLkNsNrl8D0U+bOnt48xSv2F7oUDi5FykJAYQmLNKus+Ezt9/56RKMBey9h2+iPGldIkGOx8XF2Xv30hCbV0n5k/RtcowLWUpGoyuzJNY6kcZtnV6FMnWsDkmUVLIamV57SClveVDv+LR6uzcUXVbTrlp6pHKv8+tlGabaDWs/sClOZCTqcj03hET31ROjbYAPsETd1ots/YE68637zBCe7HhY2Dyk/58YYIRT749HZoOkdM8fjdazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GeaZU9CLdyxyx3xIV0wsantwQ5Nfquf8lmuOc9oqz8=;
 b=Q3SSNPGFkIlBxcXR4VPREuCt+ABr0keCFBQpT7vgyFVh/yZfPaInarG5C6sLia7PbdyzCV0CcTKqXWIo/5DmilKB8V75NWUg4dOxuGZOOMVNQBObyt0zqhzmTXo47GDLXL94PoNOsO6ovCcdULbXDgUPU1LHrDRWmz+o7Nsj/O0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 21:12:39 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 21:12:39 +0000
Message-ID: <81fcb5c2-34cd-424d-8daa-582196726e30@amd.com>
Date: Thu, 26 Jun 2025 16:12:34 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 19/32] fs/resctrl: Add the functionality to unassign
 MBM events
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
 <83d54b00cc873d7d4dec433b7f528da10963d025.1749848715.git.babu.moger@amd.com>
 <96297efd-0f65-4dde-9720-36dd9b689295@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <96297efd-0f65-4dde-9720-36dd9b689295@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:806:21::16) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdab45d-9f0a-4125-cccf-08ddb4f62e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1RnWU10YkFDbUhUNENZYTFXT2J2YUdOZUpJMHd4bmg2cTQ0ZnovdVhZWmNG?=
 =?utf-8?B?a3VVbzI2Z3MzYXpaU3lLTFlQSVdVOUFLRjFaNXpoaC92cDVzNURPd29uQ21R?=
 =?utf-8?B?cU80ZWhVbjFXWnVKWSt4OXpjQ3RXUTZyWXMvSjV5UytwY0FZcXJ0VzJGRFcr?=
 =?utf-8?B?UUFNYXYvUmxOTEc5R2RhSTYyUGc1dmR3N1hkdnlnUjg4dTNBbE83QThiZUpq?=
 =?utf-8?B?dWsvWE9XYjlPc09XZFFPcFNLdFRKcm9hNkNxd2ZjaE40M1RxSWx3VVJlK0Vw?=
 =?utf-8?B?UXlzWXdnTEx1eTJvdWRqcjcxejNJYmE3bllwdDBPTnZoTTVZTTBjcDEyUllN?=
 =?utf-8?B?cW4zd1NGVHFZSk1jaDc4MFNkZWhOUTV1dk5IV1N0eVc0UVMwZDUzZTk0c0RG?=
 =?utf-8?B?VDBmQmNwVExVekszR25kaEwvdDBjaGp2ekJwb0xZK05KNmNOdEN2UG5ZdmN0?=
 =?utf-8?B?UjN0U1lSM2cvTFRlR1RobDY2UXZ1dFdPak1BRlJWTmFkUWJvOUJOdXZFVWZD?=
 =?utf-8?B?T0FpY01TTlVVSlp5RnZBZ2lWZTFzU1BHMWRqak1ldUF2Qld0YUpZL1lWNmlv?=
 =?utf-8?B?SHhnV3BIb2c1aDlrdjRmWHN3UGZPbG1QUFVsNVBtOExYVEdkMGJQay82a0ll?=
 =?utf-8?B?ckQvbHBXZ2dhOU1CVHFwbE5XcXhSM01ReDZPSGxtbGVoMjIyUEUwSDQwaklt?=
 =?utf-8?B?bW52VDFwZVhOY0hYZVE0cnpsS08yZWFaQlFQRkdWWmRnbjNBR3BmVnZwV0hx?=
 =?utf-8?B?RE5HeDVlWm56Sjg2TEJKR3hmTWZWdWREZmNoN0g2YVdTMzhNSEM5Smswazd3?=
 =?utf-8?B?cDk2V3dua3g3cG85dkhmc0JCR3cwcnRnQy9obUcycmlKWVhLb0Q1dzVNeFZp?=
 =?utf-8?B?NHZNd2k1WEFYK0R2NFV3R2dDYkFlbS8xNDRsY3dBb0xPVFYxdk5wOHptbG1q?=
 =?utf-8?B?VlJtQ2lyQlIwTUtxeFpCRkkzb3Y2eUVKZkVZRGhsTTdHZ1VqME9wVGt2K1J1?=
 =?utf-8?B?dGg4ZDZwQWNGVHE2UGRKeWtKeFlKR3V5akt6Nm9IRVhLYXRPeWRPNmxXcjZ5?=
 =?utf-8?B?TTFzOS9KVXFaM28wVFZNU0FldEptYkl4c2UvRjhObWw1SW1VbWJGVW5BVXNX?=
 =?utf-8?B?RlYrYnMrbTBIS0lhM0tZWGZUcUZUZU1xbXF1dWZxQ29UNTdmK3FrRHhmcEtw?=
 =?utf-8?B?M3IvRDhOTmpEeU5CTWpwV0o1blRpa3QwY2NCbWFaR2NGVkIwQXV6amQwVi9Y?=
 =?utf-8?B?djdOYXM5Sm5MLzZSWThoWWdjUjhHRHlSRVZTdnYwS1B3UWlXelFsN2l0N2FE?=
 =?utf-8?B?YVdacUtGK3NyZitiT3lBYm5hMU5pdnR3TjIrUmt2U1JISkoxREpoR01ZKzV0?=
 =?utf-8?B?dEZhYU1pNWx1WkEyOGtlZW9PZTlyakE4NzVVWko1eG8zMElkWjR4M3NOOG8v?=
 =?utf-8?B?SGNtSFhEUEVxWHZxcnZ4aytwd3FzbUVwVDFPWGdETG9rbnpOMkIrZ0tQTXlW?=
 =?utf-8?B?dUZXZ09BVG9qbUlIbUV4dEVkRWdacEpiK2orZC9FOU1NZVprd3FjMmJuSG9Z?=
 =?utf-8?B?RUZaMXQ0Mkl6VmIzMXhJRTJ1ZWxHRTV3NWdpaElJczBpQnRPdjJOaEVNY2x2?=
 =?utf-8?B?Zzc4VkFJaHFxSmlyWjVSaUZtbk0xM1RheEVUWGtlb1FoQ25XVEpreG1NRFB3?=
 =?utf-8?B?am55Z2ZHUWVLMHFTTVBUa2k3a1RlN0JaSDRMeEpKQ0VBenNKNHVxK0hhNE9V?=
 =?utf-8?B?Y0FoQUJkS1V1bGNiMFg2VFdsMUJKcXdVYWVGUTN5ZWJHUW80N3VTV2o3UDhj?=
 =?utf-8?B?M3JJN1N0U0xjdFdYL29jb1Vhc3JCT05KQm9oV05HN2p3Wmd4N2lESW1yMkNt?=
 =?utf-8?B?c1NxRnJ2bFcvbXgzUHFTdmZOWUxMR3hUUGpGSHB4ejBubGwwbGpKbko3Sndz?=
 =?utf-8?Q?aSrnXZJGeKw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGE1dnordm9VVE0zS25xVzVyWkJRaStDbXI2c1NydGt4RXNwRncySjF3d2ZE?=
 =?utf-8?B?ZG5uaFpBTFFaQlJhVkdZRXR1bzdESGlFS2p6WDhKTjVBWVBTZloxUXpzSWJC?=
 =?utf-8?B?VEIyUHIzUm5rL0dOb1JOSjVNdWxPUUwxd2FjUDM0UFVDdlBuR1ViaHcyTVRE?=
 =?utf-8?B?WUNXOGNyNXp5ZGNKcEdvajNHRjBSNWpoWEJmdVlnMVZRWUU5K2ZTQlVKZHFV?=
 =?utf-8?B?OTdhUFdxQ0hBck5OZnJLRjZHVDFyTVNmelFtbTkxVERHb0JLQzBFSGZHVTYw?=
 =?utf-8?B?Y0Exckk2TlE2Z2hJZkdTSkx6WldMUG9sRkRzeGlhTlBVbWZFWGkvOTYyMTkv?=
 =?utf-8?B?YWVkdDN4ODNtRW1EZGlQN09WcE9LTU5mTUcxaU12UUJmNHBJV1ZDdEJyY3Zm?=
 =?utf-8?B?TENOZEFkbERrQWZORGM3aGlZdUpsUk9zM1U4N3pwNklCUk5PcUh2OHhNWjlr?=
 =?utf-8?B?YmhkZHo0a1VBMkx3eU1SaHoxZlNyVHlvWHJETnBsN3hIM2FjUlJhN2tiZE53?=
 =?utf-8?B?L3BTYUxJamVEbnhBQXVwdDZJenZYQTZOZzdLOTg3TCtYaXNGOTZ5WkZnZ2ov?=
 =?utf-8?B?UVVTZCtlYUpDeTZDd3pNZFNtV2VHRURVa09rZVp1dVhPTXoxdkZmWC9RNWRW?=
 =?utf-8?B?RXE1T2tJRlZvRDhuS2hJSmcybDFoc0ZteUxNZnZpbkRtemdSMXJ4RHVjMnIv?=
 =?utf-8?B?RllyWUpmUTM5QzRzQlUxVjFoUjM2TCtnZ012bit5TnVUYnppTVY4RHVXYXZ3?=
 =?utf-8?B?ZGdXZStBZnZ4dFpNQ2cxNUMvUFlTLzQ0ZzBNZkFkV1F5cXJjSlNtOFJWZS84?=
 =?utf-8?B?aEVaUkNZbStncWd4Z05IdUt5WTVDU3JrVUpBM09HSjN4cFpXd2NKbFdkaGw4?=
 =?utf-8?B?VVU5YmpXTjZ5MEpPaHZXOWNwMjdRZHhEeE9zejR5SWxWN3JSR0Z3YXpuYy90?=
 =?utf-8?B?OVcydGh2QjZOUFBRSzdQdFJxYWliV2pVcUgxbFZreVdXRWE0aHBVd2pIY2U2?=
 =?utf-8?B?TlNZNy9Rb3ZxRlM4bDc5K09KeVpXaUVmME1LN1FFakh2Y1hYTGFnR0Q3Zm55?=
 =?utf-8?B?MHB1V0dIZ2swMlpoWXI0dXl0dFlmMXJLV21Oc2EvZ0pWcWFjQXRoK2pPOTFI?=
 =?utf-8?B?TWlZWGpteU41bUxEeXNyL3ZqcjFuNlgvS0N0RFA2R1FBWjBxM1FCTmJMWnln?=
 =?utf-8?B?ZURxUm9sdGlnQkdyYTZRVUtUUm5jYXBNK0hhZW1BMnRJRnNSeGFWNGgzVFBj?=
 =?utf-8?B?VlFHMDMyL0w4djFDdzRSVy9YV1IvRmVwY1VHV2dQaGExbEQ1UWpSaTVnSy9i?=
 =?utf-8?B?Skp3MWNsRmt4SHU5MzNVWkh5Y1hYVkFLUVJ1K1hkMXNwM2k1MEgxSnl6VUEx?=
 =?utf-8?B?QTBSU0ZCdzhGZGh2M1l3U3YwMUlkell3cDNqMGE5ckxnNmJYd0ZxYUNlL2k5?=
 =?utf-8?B?R0pVZFF6OUpWOXJQYndjeHRsd1I4b3VxUHhTSFgzQ2o4dTJFeGNnM3pRSFVO?=
 =?utf-8?B?Sm5lbkxvUzYwcEQzaHFhMHVQSkJJeXN4Y1dPb2txZ3ZIUjhlUUZjT01Va2xX?=
 =?utf-8?B?a3Nib1MxbldmTDQvejFlZk1KcmJGU0FjZ1c0Z0pxWkp2Y3U3cW9GdkNwQjJQ?=
 =?utf-8?B?S202NVJwTWE1cU5rVkxJWURTYjEreTRGYWdxdVdJcVVGNFJXbUdsNGE0eU0y?=
 =?utf-8?B?UWNwWklsRk1iRlNIbVdDbDM0SVRrdEgvRjg0WTFQM0kycU5WTHNqLzBxUEM3?=
 =?utf-8?B?V2kzQkdGQy9QWmczbEhYSU1Uajd5anlkQW5VNkRvaHcreUVnei9kd3NrZVpO?=
 =?utf-8?B?NDIwU3VUMVJzMjZlZk5tUC8yK1FhWHVFcE5ENkpoL3J1MXFDajF6R2JxSnRW?=
 =?utf-8?B?bEMyZWdvN3owV3grUDhlWmhHaUtBN2syMXFTU1BtYks2V3o3d1E2RXUwVmMy?=
 =?utf-8?B?MGY5NkNFWW9ZSjhyQjVQYnFHS2NOOUdoZ1ZPTm52ZFRyUzg5Nlpmek5KSkY0?=
 =?utf-8?B?UHhaSDN0NGtTWWFYbjQ0c0pidFlqdlJId1llR0VMVjZkbklVV0lLN0laeWla?=
 =?utf-8?B?MVIwWFo2NDZmb0RlUkZXbXJQdXRCaWtoOVh3TDlUdFR3TjJzN21yMTBFT2Ex?=
 =?utf-8?Q?QBu8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdab45d-9f0a-4125-cccf-08ddb4f62e36
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:12:38.9494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/KHntCu404rcYgs6BMMRqDqb2C3tpIufwr3U8URvYxYCHQaFoV0eqE7uZ2Fpa+W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180

Hi Reinette,

On 6/24/25 22:38, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> The "mbm_event" mode offers "num_mbm_cntrs" number of counters that can be
> 
> "The "mbm_event" mode" -> "The "mbm_event" counter assignment mode"?

Sure.

> 
>> assigned to RMID, event pairs and monitor bandwidth usage as long as it is
>> assigned. If all the counters are in use, the kernel logs the error message
>> "Unable to allocate counter in domain" in
>> /sys/fs/resctrl/info/last_cmd_status when a new assignment is requested.
>>
>> To make space for a new assignment, users must unassign an already
>> assigned counter and retry the assignment again.
>>
>> Add the functionality to unassign and free the counters in the domain.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> ...
> 
>> ---
>>  fs/resctrl/internal.h |  2 ++
>>  fs/resctrl/monitor.c  | 47 +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 49 insertions(+)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 0767a1c46f26..4496c359ac22 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -388,6 +388,8 @@ int resctrl_find_cleanest_closid(void);
>>  
>>  int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  			      struct rdtgroup *rdtgrp, struct mon_evt *mevt);
>> +void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				 struct rdtgroup *rdtgrp, struct mon_evt *mevt);
>>  
>>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 38800fe45931..f2636aea6545 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -1016,6 +1016,14 @@ static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  	return -ENOSPC;
>>  }
>>  
>> +/**
>> + * mbm_cntr_free() - Clear the counter ID configuration details in the domain @d.
>> + */
>> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
>> +{
>> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
> 
> sizeof(struct mbm_cntr_cfg) -> sizeof(*d->cntr_cfg[0])

Sure. Changed it to.

memset(&d->cntr_cfg[cntr_id], 0, sizeof(*d->cntr_cfg));


> 
>> +}
>> +
>>  /**
>>   * resctrl_alloc_config_cntr() - Allocate a counter ID and configure it for the
>>   * event pointed to by @mevt and the resctrl group @rdtgrp within the domain @d.
>> @@ -1084,3 +1092,42 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  
>>  	return ret;
>>  }
>> +
>> +/**
>> + * resctrl_free_config_cntr() - Unassign and reset the counter ID configuration
>> + * for the event pointed to by @mevt within the domain @d and resctrl group @rdtgrp.
>> + */
>> +static void resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				     struct rdtgroup *rdtgrp, struct mon_evt *mevt)
>> +{
>> +	int cntr_id;
>> +
>> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
>> +
>> +	/* If there is no cntr_id assigned, nothing to do */
>> +	if (cntr_id < 0)
>> +		return;
>> +
>> +	resctrl_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid, rdtgrp->closid,
>> +			    cntr_id, false);
>> +
>> +	mbm_cntr_free(d, cntr_id);
>> +
>> +	return;
> 
> No need for this return.

Sure.

> 
>> +}
>> +
>> +/**
>> + * resctrl_unassign_cntr_event() - Unassign a hardware counter associated with
>> + * the event structure @mevt from the domain @d and the group @rdtgrp. Unassign
>> + * the counters from all the domains if @d is NULL else unassign from @d.
>> + */
>> +void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				 struct rdtgroup *rdtgrp, struct mon_evt *mevt)
>> +{
>> +	if (!d) {
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list)
>> +			resctrl_free_config_cntr(r, d, rdtgrp, mevt);
>> +	} else {
>> +		resctrl_free_config_cntr(r, d, rdtgrp, mevt);
>> +	}
>> +}
> 
> Reinette
> 

-- 
Thanks
Babu Moger
