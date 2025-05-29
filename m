Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691EE1D6187;
	Thu, 29 May 2025 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748534729; cv=fail; b=o1PWNFgbn/2Pcs4KrgAyyVwX92nI08VAT7o8C49lL1xEScXiNXZtpenpI65FJBG//reiiJZ+K+GJYSzI8C82SrpS7e+b79HQGObINbkjX1saqv4dQiLFZ3oPMkfSzpbHiD46Knaqcp1P2WtcppL4wECaC30JNUKtm9aaCKJ6F54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748534729; c=relaxed/simple;
	bh=zhPiK67FlUluEngvlD3WgRVDuMH6NFd4cG88k4Z29eY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XwipWDv04Cs8yU/ZfpwwsC+xczVo9BpCXkgFPzAiuOW/FO3R2ou9XqWLU4qwqQM8YC7PXxVJb3xT+7TSYxoYH99En2JHMctvIzxUdIsMWIxk3I1V13J6TtJ+fxJu7W7mCue6EBUBgih5hUm4gGazG7smdGcHPooIYPyI7XwvRFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o2LppHIp; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o2LppHIp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkKLD7i/COrYvAH3s7cKkdKDXI/EHxMAFt0FjxurO72+j28s32pJpd7/MugS7uxLXD59CcaCIEGLdDqM2PFodd9wPwRXmjKvwTedvWavnjBZTmLM5U3RHYN1sVZH0j46ELVLUkJZz04JlOy2+UEzLzZks+MaDGkutim1i5G5gJxQzGTMtskWDBP+E7m6ybfWBGlHt4LXMhn2QNyuUB0n+nRLB8UxRJYgQLvR85PaoBFonM+8XZ52vd6Efr5iS8HFXSgJYEuli3oQGZ11DbOqsCY+qhWUpO/GuBXiZhVYBCFOdE7IOB8GdTbgUTRw0ts6UuM6VqEzORVGmGSDX9JK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyjt0N8t5ugKzTzAuALtKsKGj9Vg7nnrEwzXVPQaxys=;
 b=ggc56PA8OAp9mAsiYNoAVOoPyQIKz8tG0f5fHTkeM4mUcCYFwP/InYejnwZ4lwogqRM9O4MCHZSQcHUWeicOcYj2LYDAmuopJcnBCinygAst3KrVYr53vHkd4mcItucUct7X6+lZXmS6x6/ZtwntMwxd5u2Z6uL77uLXQVXjY0t7xgzR8KeN5ITZ7Khcp6jfZNUOIbSa+OYUnVclgH1pqcgpN6LS/SGHNYspSB1jbBz/uy6wc2bZsw9lTw2+49OsruobjCUe1DPVXqm0oO9LlF4/IfPJ4B/oRYx4RTKfs+Mc7bxJJB9kV+DcPgB21/6wrfLPIfj/Y/fV5NtH4Xoq2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyjt0N8t5ugKzTzAuALtKsKGj9Vg7nnrEwzXVPQaxys=;
 b=o2LppHIpdHoivLdCIzp6eFqcyzSoRw2q6g9gsoXB7GtAHn6xl6t95E02J4W5yVr6N6wdEeyJRqDsJhhFAppMVnC2b6al0/wczrbFbeFyAeCX0Xro1Qo9fzik27bni+Z5LpVNrgwLEVSPHioA8gI2vqvtRmPE0ZM/kEIpBtAtHtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH3PR12MB8993.namprd12.prod.outlook.com (2603:10b6:610:17b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 16:05:24 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 16:05:24 +0000
Message-ID: <dfc593f2-b0e6-4946-9dcd-c5f3986c9e6c@amd.com>
Date: Thu, 29 May 2025 11:05:16 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 13/27] x86/resctrl: Add the functionality to assign
 MBM events
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <690c1af39c9f7d4d9d5a1f2f84e89717bb756f23.1747349530.git.babu.moger@amd.com>
 <9b38056d-c0f3-4e28-87e4-413225fee91e@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <9b38056d-c0f3-4e28-87e4-413225fee91e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::16) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH3PR12MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: 3316af99-8dc8-4743-15a0-08dd9eca9ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rzhvd2hQL210NTl3NE9FYjArcmZMdjc5bzZya3RWZU83UGtGdFY5VFAzOU0w?=
 =?utf-8?B?b244SUZhaDFhUGZ0UFlzZ2tjSlFMRG1HWDY2Z3hQYmJCREliamEzU0lIT1Js?=
 =?utf-8?B?QzM4ZmJzeWdHbVNWYnVicE8xek40ZHQva2Y3Qmd0VmowMWVXR2NmbmR0RjBV?=
 =?utf-8?B?bSs0ZmoyK1R4WktZMldIRnhQQkU5TDNra3JMcU9GaDE5eXpiblVPZFliM2tD?=
 =?utf-8?B?OXhSeWRIdWtvQndoUnRhYWdJb2Uva1h5Q1Bub0pkUTVaeU5VRlh6a3lIVVJC?=
 =?utf-8?B?TXVoWk03ajBoZVlJaGczZUllZ3F2blRMWEsxSUMzNzlTMFFTT2dsUDhWdlNR?=
 =?utf-8?B?c1YwSjZKbFZWRlNaMzNJaTY2SUkxalB3aWRWNTdwdXJKTG9nNUUxSVRFUmNJ?=
 =?utf-8?B?d2tzQWN5Q21yV2NXYWQzblZmVFNWcXRjeHovTTA5QU93cFBuQ3VMd3VIamVP?=
 =?utf-8?B?NVFTUWd1YS94NDlaNitsempKQTdPUmhVWERKanVqeHpjUFdTSHphU2N5bzVH?=
 =?utf-8?B?Mi9UQlBFMjRtWTkxcExpMSs4Y0d3ak04bkdodG1mcU1TWW1SVDlWNVJiRGw4?=
 =?utf-8?B?NTl5UkhoeWVZSXczYm9tZTRMZVlhcTJ3djIzSFQ5TFpaQTJXVDczZnNZcDhD?=
 =?utf-8?B?RXl1a2thSXA1Z2Y0VzAraGtNUE5YQWxvczhxNlZvc2VQa1plQzcxNldwUXM4?=
 =?utf-8?B?ZGtDc1pCVmVwcmM3L3BvNXBQcHdVMElrUCs3dWUxNjdjL2FpZUNkdWI1Tmdr?=
 =?utf-8?B?cEtxbWplUUVVR0ptMkNCUmdmN2ZDaEdlTmRXNHRwdmdqZ3FzVzNGQmI5bzhE?=
 =?utf-8?B?ZFNIVk1qWDdIeHQ1NUF3SWxyMTdvWEoxSDJ2eVRSRkw4SEhwSkE4dElTajdT?=
 =?utf-8?B?V3R6ejZBNWxuaE5Jd2JkRUE5VzdtNHpITDZiQWY1cWdsSS9YdU0vbFdENDlK?=
 =?utf-8?B?cHFZendweVBOcDRFakNzNkNtb0FYY1lGR0RPcGJtdmNYWXg5QzVPanBxQ01M?=
 =?utf-8?B?TVR0SmxNd3ZmaFRPQmtCa0dkYmpPVXdBaTRNUUNnZlh6WUUyS1dXQkViOFMr?=
 =?utf-8?B?V0t0Z3VWeUFyQy9pL241OWNCS1pGSjJXTWI3b2IxcWxmY0FLRmVYbTA2amJX?=
 =?utf-8?B?TGR2Ty8yaUVJS0N3UVAwSXlodmFqdnh5Q1AydGtHSW1kaFI0aVBkUHJ3cm5z?=
 =?utf-8?B?UWJGMDdWZXlTUzNDaGpBVjBNV1luUkFBdHJ4K2JMUkFaVUJKT3NPZ24xTVRi?=
 =?utf-8?B?Tit5K2VmQmg2VTlHZXNGdnpWUm9QMmJTSUNVRHBqTldQM1MxbFpleHlmWE45?=
 =?utf-8?B?YU5EUUdmY2ZUSUdYYWRrN1lwL29YYlRlQngyclk4ZzYzQk5IeEpnem5qamxT?=
 =?utf-8?B?T0RYSjNpaUMrcDdNbnpLZkxjQURESnFFV0FaU0N4c2Ewb0kzT1AvZXJ0TkR3?=
 =?utf-8?B?VG5Qdnd3MCtZMW5SRXRvWXowL0VTQm5lQlg0TElRbjVWZGd5MWxUNk5pMENS?=
 =?utf-8?B?Y1FrLzBoRlJCcDdNS0JoWFpEcW5oSWluL1ZBcXZrbFRhQWZvSnh5TGtjS0pY?=
 =?utf-8?B?Z3ZjL2pMcHoyU3RrN21zaUxTNXBPVVRzUFJvK3NLMnNRM04yVkczOXd4eFZ4?=
 =?utf-8?B?K0dyTStISit3TEVMUFZUTG1sbE1GNXR2dmJCUDhTcmxLRS81UHlPL1lOVmFO?=
 =?utf-8?B?ZEFrMmlpZHRpN0huZ25ram9yNkI0aEIyY1k0UGVrRlFXTFo4aWFEWE9HTjNo?=
 =?utf-8?B?RnFOa1JqSzdmNXJFQnI3V2grWnJ1WFpJSXd3bzBsaHEwekJxUkVLSXdJaXBT?=
 =?utf-8?B?Tms5TlRrODFieWtxakd3dk8rb2NuRUY5UUYxeURmNm92ZGtTd1BKZXFpeVl0?=
 =?utf-8?B?SU54TnNSMWVwdElrUFlrZ0FKM01uM0hiSmRDMHdCaDlJSUErK1FjZmkzQ0hB?=
 =?utf-8?Q?4gkbCGJ2lt8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFloMDVhVk15YkVUZGcvZE9GOGNmZFZCZlRURHI2Rzd5QmxjVm1ySzRuZ214?=
 =?utf-8?B?QndBKzhKUDQ4eFlZZXpNOVdxRnZKNkp6a2xTd1BETlBiNENZZWdQRERrcm5V?=
 =?utf-8?B?UlRrbFlEa05lVWk0ckVYazVzRWxqN3Y2TG4rVW1EZWxzdDY0NUhvV3FacU95?=
 =?utf-8?B?MmEwZjFYd2ZSWTRtWGR4U2RWQmR0THgyT1RaU1RVY1FxV3ZQR2ZHZzFyek1k?=
 =?utf-8?B?WHd5K1ZEVEp0dm9uWkxDbmFtclRWWG05RlVUdTMxbmJjazQ0aXFMbEhBQXVZ?=
 =?utf-8?B?ZVRmNVJkN0t1VWh5VW9RTFRmTXpTOTQ2VmVxbzNoZjJGcDNkRW9LaW9aWGg4?=
 =?utf-8?B?ejFFRnpQKzRLY2cwVXlwNHpINWZHV2NYd3c5OGR6b2pMbk1qWHRpNTlkRXBn?=
 =?utf-8?B?VXF1OVVsVWZTZEQ4ZE9idlY5YnlNNjVCa09Ea0V4azM3YisxVUZSQnFORFN0?=
 =?utf-8?B?L3ZhL1NkcUNjVFhSTHRhSnhQTE5MMU4zY214R0MvaWFha2hBTnhsTFdQY0Zn?=
 =?utf-8?B?VzRpVGV0Y20xUzN6c3JndTNlWks2NE9uaXc4VXhLN3lIY2VaT1VpSWJKano5?=
 =?utf-8?B?bE9MOUNQOFFkdFcrQlgzQVZXUHoxLzJDY0hydkhtTFhzM0FtZWVrejBrT0xR?=
 =?utf-8?B?c2xTdGlsSXNsb05NT2ZpRTN3QUUycWd4WjdveHA4bkVUeVFnSzdMbUJwZzF4?=
 =?utf-8?B?azhkYzdEWWV2REV2a3Y5RWxTUlVCcUplMndiWFdDUnh2WlZmbklCM3MzMUpi?=
 =?utf-8?B?Z1RrV1VYZVcxZHk2Vk4veTJseGNDdXdwNW9BV3FRUUVKeTVaTFFTZTlGcGlh?=
 =?utf-8?B?SXZnMHB3SThaVDFDY1N1WnEzMWtuS3pVelo4dDFPd1N4OTJQTUdzaG1rUXJo?=
 =?utf-8?B?VlgyNEhqSGFBT3M3OHg1VTBMZVUwTUlmaytwaUtQYlNIZTIxazJFTVpIWmVk?=
 =?utf-8?B?RHFlTlp4OENaRCtCMFE0VGV4aFJGTU5HSUFxN050V1VhWmFPOW43MXk3eCtI?=
 =?utf-8?B?RnJYRGtZSzBaditWelhyWUxiZDNIWE5yRTRoVTVHR1hOQitES0p2d3JyR3Br?=
 =?utf-8?B?UzdhY2V0dXozTTR0NXNtZlJuRXVMR1lVV2dzZ1RvRzc0QzZ0eXMzM3hFYkJJ?=
 =?utf-8?B?VnM1VXhEc0VrNENGcmN0K0l5cldOMEpVbXpCWHVpWVpKcEdadHJFUnlHaGVt?=
 =?utf-8?B?Y1QrUVQ0VVBiYXpaNVFBbXNRZ1dicitYWnJFNGdXRkdPSzQ0TVJzYW53RlR1?=
 =?utf-8?B?Vy9QSkRneTJ2MUJpdmhsbVBtL3pjaXEyampNdW5LQVE1L0FHSWhiS2UvaU80?=
 =?utf-8?B?VVV1ZmZOTzNjdFhIVGVvdUJEcHdQYng5bERjWG8yTEplSWhhaS9NTnkxaHJk?=
 =?utf-8?B?T1NXTGQya1ZPTDFIQ2JjZWJxYnB5WDk1bkFSTXNKUjNBa0FJWWljNW5zMkJO?=
 =?utf-8?B?UDYvSlFDTE9HWWJXUG9SR1BTb1pwQ2pldmZqUnNkdS9nVm5BNGdiUUxoSjNY?=
 =?utf-8?B?TjJWdkZNMHUrUmh3VXFNWFJsbUM0U0pLOGUydUQ4cjBJRDNNU2w1RVNVOU1P?=
 =?utf-8?B?d3JoZXhHT3N1cUIwSVZKdWRQVVUrYTU3WlVhZCs0cm5kdVpmNWZTbjAyUnU4?=
 =?utf-8?B?NURnWGNDQnFuOEZKWkNWcUpzN21mS0E1bnZKckhoczI4M2NCOU8zd1UwS2Uv?=
 =?utf-8?B?MVFCbHNCK1NvUHpRZzBOdDhhcUg2dEJLV1Y4Z0YvNVFPb0pUbURVWkJ4ZlAv?=
 =?utf-8?B?V2FMekpyeVp6NlJudlVZS0x2MjlYWU53Rk90R2JiOXQ0Y01ZYlY0QWhxOXJX?=
 =?utf-8?B?QXZlckxIekFHbzlIV3RxSGUyTEpJV1oyMFJhYWlkNlVRUmh5azUwSFNGcHhk?=
 =?utf-8?B?amRWc3pFQlc3MjduWjk2YXBPT29GNnc1NVBJUTlMczVET04wcUdFYUNZTHdy?=
 =?utf-8?B?TlM4MHZGdkNOcEMyMW5PQVdSaXB0MXZDZEFKTjBPRHdqNzlBeUVuV3d1Rm5Z?=
 =?utf-8?B?QTJ1R3grRlFReWRaZXJ4S2czaHRyT2RWdm1STG5iaVdGcDBlaEl2L3kvUVNJ?=
 =?utf-8?B?VlIyZERvK3ltTEdrRE42Y0owNHJlelNHNlJqS0JNa1BRcnY2TE1rdzZMcjd3?=
 =?utf-8?Q?WcT8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3316af99-8dc8-4743-15a0-08dd9eca9ecf
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:05:24.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxB1A8pduYtcEolxOU5Lj1tR04ZFRwomu7FyYlRPn2B6bIXOdzQDI+V2gu/g1mgD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8993

Hi Reinette,

On 5/22/25 17:41, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
>> can be assigned to RMID, event pair and monitor the bandwidth as long
> 
> "RMID, event pairs"? (assuming at this point in new version it will be
> obvious what is meant by "event").

Sure.

> 
>> as it is assigned.
>>
>> Add the functionality to allocate and assign a counter to am RMID, event
> 
> "am" -> "an"
> 

sure.

>> pair in the domain.
>>
>> If all the counters are in use, kernel will log the error message "Unable
>> to allocate counter in domain" in /sys/fs/resctrl/info/last_cmd_status
>> when a new assignment is requested. Exit on the first failure when
>> assigning counters across all the domains.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  fs/resctrl/internal.h |   3 +
>>  fs/resctrl/monitor.c  | 134 ++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 137 insertions(+)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 0fae374559ba..ce4fcac91937 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -377,6 +377,9 @@ bool closid_allocated(unsigned int closid);
>>  
>>  int resctrl_find_cleanest_closid(void);
>>  
>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>> +
>>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>>  
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 8e403587a02f..d76fd0840946 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -934,3 +934,137 @@ void resctrl_mon_resource_exit(void)
>>  
>>  	dom_data_exit(r);
>>  }
>> +
>> +/*
>> + * Configure the counter for the event, RMID pair for the domain. Reset the
>> + * non-architectural state to clear all the event counters.
> 
> clear *all* the event counters?
> 
> "Reset the non-architectural state to clear all the event counters." ->
> "Reset the associated non-architectural state."?

ok.

> 
> Also, please see https://lore.kernel.org/lkml/20250429003359.375508-3-tony.luck@intel.com/

Yes. Sure.

> 
>> + */
>> +static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +				u32 cntr_id, u32 evt_cfg, bool assign)
>> +{
>> +	struct mbm_state *m;
>> +
>> +	resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, evt_cfg, assign);
>> +
>> +	m = get_mbm_state(d, closid, rmid, evtid);
>> +	if (m)
>> +		memset(m, 0, sizeof(struct mbm_state));
>> +}
>> +
>> +/*
>> + * mbm_cntr_get() - Return the cntr_id for the matching evtid and rdtgrp in
>> + *		    cntr_cfg array.
> 
> Please prefix parameter names with @ in description to make obvious what is
> refered to. Although "cntr_id" is a local variable so may be easier to parse
> if cntr_id is replaced with actual "counter ID" term while keeping rest as
> actual parameters. That makes cntr_cfg unneeded.

Sure.


> If intending to explain function context then failure return should also
> be documented. Even better would be to follow typical style of kernel-doc
> (even if not using /** start) and not mix and match so randomly.

Sure.

> 
>> + */
>> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
> 
> A subtle issue here is only evident from later patches, for example patch #17,
> that calls mbm_cntr_get() with a non MBM event ID from __mon_event_count().
> 
> If this usage is expected then these utilities needs extra checks to
> ensure they are only called with valid MBM event IDs.

Sure. Will add the check resctrl_is_mbm_event().

> 
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
>> +			return cntr_id;
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>> +/*
>> + * mbm_cntr_alloc() - Return the first free entry in cntr_cfg array.
> 
> "Return the first ...array."  -> "Initilialize and return ID of a new counter, return -ENOSPC on failure." ?
> This is still an awkward use of kernel-doc ... better to be properly formatted.

Sure.

> 
>> + */
>> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
>> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
>> +			d->cntr_cfg[cntr_id].evtid = evtid;
>> +			return cntr_id;
>> +		}
>> +	}
>> +
>> +	return -ENOSPC;
>> +}
>> +
>> +/*
>> + * mbm_get_mon_event() - Return the mon_evt entry for the matching evtid.
>> + */
>> +static struct mon_evt *mbm_get_mon_event(struct rdt_resource *r,
>> +					 enum resctrl_event_id evtid)
>> +{
>> +	struct mon_evt *mevt;
>> +
>> +	list_for_each_entry(mevt, &r->mon.evt_list, list) {
>> +		if (mevt->evtid == evtid)
>> +			return mevt;
>> +	}
> 
> With changes from  telemetry series this becomes an array lookup.

Sure. Will look into this.

> 
>> +
>> +	return NULL;
>> +}
>> +
>> +/*
>> + * Allocate a fresh counter and configure the event if not assigned already.
>> + */
>> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	struct mon_evt *mevt;
>> +	int cntr_id;
>> +
>> +	/* No need to allocate a new counter if it is already assigned */
>> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>> +	if (cntr_id >= 0)
>> +		goto cntr_configure;
>> +
>> +	cntr_id = mbm_cntr_alloc(r, d, rdtgrp, evtid);
>> +	if (cntr_id <  0) {
>> +		rdt_last_cmd_printf("Unable to allocate counter in domain %d\n",
>> +				    d->hdr.id);
>> +		return cntr_id;
>> +	}
>> +
>> +cntr_configure:
>> +	mevt = mbm_get_mon_event(r, evtid);
>> +	if (!mevt) {
>> +		rdt_last_cmd_printf("Invalid event id %d\n", evtid);
> 
> Difficult to see at this point but it seems that this is in kernel bug territory since
> user space provided text that is translated to event ID and here translated back to
> monitor event. This must succeed. Could this be simplified and back-and-forth avoided
> by passing the mon_evt instead of event ID?

We can do that.

> 
>> +		return -EINVAL;
>> +	}
> 
> 
> 
>> +
>> +	/*
>> +	 * Skip reconfiguration if the event setup is current; otherwise,
>> +	 * update and apply the new configuration to the domain.
>> +	 */
>> +	if (mevt->evt_cfg != d->cntr_cfg[cntr_id].evt_cfg) {
> 
> Lost me. Previous patch silently created mon_event::evt_cfg without initializing it.
> Here it is compared and treated as the "source of truth" ... where does its value
> come from?

Yes. That is correct. Will have to initialize evt_cfg when it is first
introduced. Will do.


> 
>> +		d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
>> +		resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
>> +				    cntr_id, mevt->evt_cfg, true);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Assign a hardware counter to event @evtid of group @rdtgrp.
>> + * Assign counters to all domains if @d is NULL; otherwise, assign the
>> + * counter to the specified domain @d.
> 
> Can add here what is mentioned in changelog that this exits on first failure
> and so highlight that this can have partial assignment when exit on such failure.

Sure.

> 
>> + */
>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!d) {
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	} else {
>> +		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
>> +	}
>> +
>> +	return ret;
>> +}
> 
> Reinette
> 

-- 
Thanks
Babu Moger
