Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65759183CB0;
	Wed, 16 Apr 2025 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827434; cv=fail; b=HkCcgIq+imV4fkZ4Hg7C3cYRkrbEVfEOyhRdnjPm8oNPmof6NZ1JvP0kekh0FuLiLYHwNgffwBJv5+nN7I7UXfPqYZI+Y33LxomV+aHaNxoCBVhY7X4MEaUCbZhCQHBPsPvVOE90nTWfiYuLBBPLcSCVQVx+FewUx0JH3j2o7/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827434; c=relaxed/simple;
	bh=Ulf89X0s1vMljndysuDHcXKNJipg5QiZ894eqSkexy0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nzeCXiWCb9AgoodkJT+Kw7pY4O+DFdBAdJBHgvvPu1Lfo2Y9UUMpETCjJ5jqbpzQZOwoArh1PgS/TvINDYD/uuK0BUiJbpF2DEhFeswaKs2PHupbqFZMESuxqE7VlY0DQ3rlWZGHD40wc+P/Y4gnbjVetRcAnB0C4PdIpYyueFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s43ZzCgB; arc=fail smtp.client-ip=40.107.100.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s43ZzCgB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFDKCTVCHR0ra7pOgayCvSOlXNWJXTyIt1nES09yR6kS11UwTKvHaWywykq3vzUahnWu4tVQQcSceAkmMgqXubOkKK5CnlsRGF8mkIKvbwOKc7VA2m8WuVJjD7wawfOfuoLgStWlEeUGs3VgPJXK/2RZd1Mi6lLAOi7XxmQZYivmDikC7i400diVz9BaOX+pSU/yxZ64eiXtnhcYkQ8mfgyiFkCFJ53iExKfra4lOLvo8efzTGrbARAKVFdOvv8oEpDGmNYiUfBEzvrttvHtF56Ck80GTZYsmWkX9reEh3K/5BQ9ri5Zo6iQpcGmeCB0CTb74mgFOyAfck0UaP5F2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6f9El8VuJclWUtlVHRjX8rqnhOnaXEqJHeAOjOOz9ME=;
 b=l0q2vxnYixTMNM9IAEnkwhcRA9pY90t/hwu38EmZYh6SfCis/R7VNVldB7Y+jYrePnuqp6AtMEAwelI7Fn1gGzOdCQvbH5SegN9pVrkwBU/5ol/9rKePAiMwJzF4AoMSQOi+qbacc+IlJd/hrNsMm6Ffc4yPNrCJ7HCzrZTCY8NPCyQzNJNNtaZtex5HTTrYx3GIy9wIDzvhiTG4qKCHXM9t6ZGSnC1vrmHpNGuGvNFUs+jj+MJ2ypuJhGgfWC83iTupJHCTulyawii5Sqd5abybZ4jOkWLHoDHnqvBZeLBdoHWY3MswUWpixZzBJzP88vcBtfKCUvIF+0umlKXO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f9El8VuJclWUtlVHRjX8rqnhOnaXEqJHeAOjOOz9ME=;
 b=s43ZzCgBlpJiOiCpqFEO/caZ3G9eG47FmG+KzZagjU/Ot8zzLUGIFx7u+mnCDKUgCA5mVigf2i6v6GF/sBd7Ujvidyn4FtmkGc9FCd1Ig2uBb+mONQOIjYwYeYcSYO/8tAfJ/hVfzCNeDlZODlGztaBIema0sKfz/+S9L4S2fqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ1PR12MB6314.namprd12.prod.outlook.com (2603:10b6:a03:457::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 18:17:08 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 18:17:07 +0000
Message-ID: <35e9442d-0b09-43b8-aa18-9752d16b4656@amd.com>
Date: Wed, 16 Apr 2025 13:17:03 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 14/26] x86/resctrl: Add the functionality to assign
 MBM events
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, peternewman@google.com,
 corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <22889d46484b2393d701ce83c82f253c1454216b.1743725907.git.babu.moger@amd.com>
 <59fbd325-04e8-459f-a724-ae0c4536b1a5@intel.com>
 <3d31259c-cac0-4b96-883c-6d2e8e427988@amd.com>
 <efa7aee8-d1f3-4d15-9a6e-09b19c296e47@intel.com>
 <b8ad6ebd-405e-4ce9-99ed-1658c3b94f73@amd.com>
 <Z__vIEObB27Rq7Le@agluck-desk3>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <Z__vIEObB27Rq7Le@agluck-desk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0064.namprd16.prod.outlook.com
 (2603:10b6:805:ca::41) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ1PR12MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: f706610f-7e4b-45dd-8e69-08dd7d12e5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmxObGVFNU5oY1BWY3JOdXNoRjAzYW9IRGhYMUw1NzFQYUQxZFNUeGFRMFE5?=
 =?utf-8?B?MG10enJiL2l6SjJtaUVuOFRxTkZDNWo3d3FjY1pnQXVXUmdLMW1oSjFiV2hQ?=
 =?utf-8?B?d2Z0OG5tRGNuRFh6NlphQUFhMEJLelpDRVBwM1lRNlhTazBSS2VmRy9JcGZU?=
 =?utf-8?B?cG9SNGFtWm1PWTE2VFlvWkpTTlAwYzRsZGFwODlKZzZwaGpRUkQxMkxYZlNR?=
 =?utf-8?B?bUxnMjNSSUxlM2Y2OENJQUF0bzJIM2h3b1VNYUwzRUxtKzkxOVpvdk03YUVP?=
 =?utf-8?B?ZEw2MDh5dzJ1cVh1MVJIalFkVXpoVDYvT1dhQnhNOGV0OHZzNzBMTmdFdzNZ?=
 =?utf-8?B?S012dHlGV2RoSjd5bFpFdUZTUmcxK3hzYzg0cFladTA1dE4wYXRLSEdXbm1r?=
 =?utf-8?B?VW14TjlvZ0J0QVRYMWx4bVRRSEh1MFE3MU1lVVp0VU5MNmVrZlhmSlVUTHlY?=
 =?utf-8?B?QkhCdEVxOXFFQSttcWpzUEkzUktPSVdOdldsR09tckhyQUdaMnNRakFvai85?=
 =?utf-8?B?SHNRd1RxNWFvNVc0NFQrZWg4WlpTTUNJRldkOEluT1dLK00wZjJ6N25oVGpt?=
 =?utf-8?B?d0NkU284VkVPa3hiRkFxUXVIWkRLV2dyNlZIYmxmSjRpanRQRTJtbzFFZStI?=
 =?utf-8?B?UGVNU3BXZm8rRDk5TzRRMWlwQ05hMG42VUhnSmY4aVNqZUxzbUEzcHYyNzNi?=
 =?utf-8?B?SHZKYnVyNnF6bVZGanI1Z2FtMWRzQzRlNHFHREx0NWtqMFNxRXJPNWsvRDJL?=
 =?utf-8?B?dTFtU0lmZGphd2ZaNUk3MitYVlZVOW1pbkhFYUhMcDFNSjVPWGZjeXhzbjll?=
 =?utf-8?B?dmttZjM3NUxtUm1IYUljelBRaFpveFFjZXRjOHZyR3hlb2tEVUdOcm1ZalVS?=
 =?utf-8?B?cXQ5UERCd2YrVFkzVEh4bktQZW5QdDQ3OXdVTy9TUEJQRzJBdlFrV0hGbWc2?=
 =?utf-8?B?TVZCT0tocnVVTVV4ak1LekZqRFZhcDVnTEN3cmxxNTRraHdDNEs4SFlhRldh?=
 =?utf-8?B?d3JGNnpIZVFnUGlJVm9PSkkxL3pSMTJ2V2RSMExobE80Sk9aRk4xajBoS0RJ?=
 =?utf-8?B?cHBrLzI0VnNhUFk5UnZpSXdoYTZZSXRZZFBROXVzQzZURGt1QUQxYVpGOEo2?=
 =?utf-8?B?MmFZZ0IxZmpDSWlQS29WMFZvNUFYcWdnMXpaRXpud3JYT2RQUStwdTZiTXp1?=
 =?utf-8?B?dXRCd2tOellQcDdXdk8yR25wTlZGVStLKytWaUhFTzM4R3M0MmlBTE9ieG9J?=
 =?utf-8?B?VStDbUlQdmJ2Wit5dzRJbnNTOXFrUkJSUlRyL2NLdnlYS040ZG5yUWNpZGNk?=
 =?utf-8?B?VTN2bHE4b2pBVU04YThkVGhMdk5ldk1HRThDOGpZbXY3SWtRY3phZ3VvTEI0?=
 =?utf-8?B?TTM1cmxkekFtS1pWN3d1OVlLTmwyeGtyQVJzK1BMY2pReVNROFlRTTlhSFNZ?=
 =?utf-8?B?U3czUHB2MnpNeXJvbUhoREFsdFhPZEI1TVhHTkozdEUrTStvNUFFd3hqN3Fa?=
 =?utf-8?B?TlhGYXJqNVZZUi9zU3VVbXdMa3F1aHpWV0NrUUl0dkc3NThCTnJLU2FnZ2Iw?=
 =?utf-8?B?bUR0aE4ybUR5NnZBYSsycHQ3ajVRNFkwZGhOUS9QVm13ZzB1ZURHa2dORC9L?=
 =?utf-8?B?TDhDalRmN0NVL0N3MjZtWThhTzhHb2laeVpvcjJrQ000a2VZZjJjVjNYK3By?=
 =?utf-8?B?Zi92dENQZW16S2IvQzhNVFlxY21QV29UVE5Yanp5WXhYYlVaUFVlTEhHcWxj?=
 =?utf-8?B?VFdoOFFUcVZLQjYwbElSR1BORWxoUGFoVnQzd2VDZzBXOTlkeHJRVEUzV2V2?=
 =?utf-8?B?Rk1DaEduVUphQis1bnB0c0ZjaUxTK1IxQjFmZDVBdmlIZzFxanZ3QldETHIy?=
 =?utf-8?B?L3dmVW9UQ3lwcVNSeU9nZnFMT0Q2SnJENFdRZzMvVFZBK3RWbHhYOW9xbTJQ?=
 =?utf-8?Q?q4dufjr8O2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTM4L1M1d25PM2lYbFE0STh1bXlQSGFzMHhRV1hoNm9TTjl0Ny9jTDFYL1Zn?=
 =?utf-8?B?cE15V29KWFdROWFJQmtGd2dBd0dYMEk4RTZvWlJVdEd2TmdyWkl4OWdPSkxt?=
 =?utf-8?B?RmVJNzdLeUIrNWFtcjk5bTJiUDE3UlZwa0lDdllVRnpkcnRsZmJJcXBCNkxl?=
 =?utf-8?B?a2F6SGc4aEN1Y2NhK3NZVlZmejcxaHIvRU1vUG1EMms5ZnI4amthUFpkcENw?=
 =?utf-8?B?SDg0Yk94c3FYT1FOb3lqMVJ2dW5TSWNMcXVhSTlhWk5IUzNpdGRNeDl3ek5P?=
 =?utf-8?B?cjU5bkhDSUp4d3J2VXcrNVRmSkNYc01qblo5c3pGd29uYndsNU1xdWo0UTRs?=
 =?utf-8?B?bzdyd25jNi9ORlhDVWxlYk1hUDAvWWlhRXVxUndzSEJmblpvYkV3Y1V3Smls?=
 =?utf-8?B?SlhVeE1iNUZINUh5U09Tc2RuM1owSlFjUWVNeUlPZkQ3ZUJGK2NjMjZYY3d1?=
 =?utf-8?B?Q3ZRQ0svQm5MOEpRUGZtRjFDMEo2Qi9LOUlnUDl2YkNzeWV3UUt2MHBXTStF?=
 =?utf-8?B?SlVicXc5Ni8zVWEweHlvbUUxUXJtdEgxS0tRU1pGTFR1MnIvNEcrR0s5VFFt?=
 =?utf-8?B?cUNZcTRLUjF3ZDN6Q3pFWURHM3NhNDZLbHM1Y2V3R0Y4UkRiVHRzL2d6ZlFB?=
 =?utf-8?B?S3c1TGdSTXV3clovVEpLVkpmZFM1R0dBdUxRWmNzbnhOamk2UGpNU29lcjY5?=
 =?utf-8?B?SDRoS3hiVXNzM2lWNWdadUkySXdiTnZXVE82NjhrQmJYdVhxeFlkQ3JPQzRu?=
 =?utf-8?B?aU5CbC9lM0FXa2ZscWFSWlA0QW1MaklDdzI4dzRxZWFhU0swS1BobzE3SjRZ?=
 =?utf-8?B?WHJxdUF5b0RpSGU1RnZSOTQwN0VlSWFZaUxHRmdwNkppNG83aktCRTFTVXkv?=
 =?utf-8?B?dU12WjBibFdSTWNTMXd6TzlxWU1raldMaXVZZFJOVjM0b3hwbWw5cmJYT1Vo?=
 =?utf-8?B?TDdLMHozY3dzcG9lNTA4NCtFOEZtNUNPYkZ5djZsOEFydTZNYk42TnlkVitm?=
 =?utf-8?B?ZTdFOXo0Yk5XOWIrSHJlTEVJcGg5ZElTd083NE4yTkVzMXl0TkhwMEIyRG5k?=
 =?utf-8?B?dVB4TGxzaE0zaUdXNjd5ekRNT0IzU3V1SEE4T0NCaGY5NVI3dHRiUTN0b3FR?=
 =?utf-8?B?ODFWSVNhUnZOWVl0b2U1L1pHTFBYbFhacXV0aDg2bHJENVVTWUdreUdDckJ3?=
 =?utf-8?B?RkkyV1lweXBFQmZhbzJtVFltS0ZnbUlYMVRSNUMxT3VHMDdsemRaTUN6UktG?=
 =?utf-8?B?WkQyaDlGRml6Nm1IbDhSOEpoTlJ5OFRYU2xSTllVUkpiemN2WWNMSHdlem96?=
 =?utf-8?B?K25kcm5oZXVrVWxGN1JRZGU0cTN2R29aNnJTc3l1ZHVtbXBoaGozS3BnZDBn?=
 =?utf-8?B?SGx0WjdYMHExYXBHdWhkNW1lV3B3Rzg2NkE5NUszc2c2QnJKWEhwem9MeXdZ?=
 =?utf-8?B?UC9pdy9MN3dyMk51YWh4clBacUVRZlJSTEdzREprWFdNcjBEOHk4dGRGdFo0?=
 =?utf-8?B?S2txVkp1cmNaOFdRZkJqZDV0UEdwQWZyQW8wcWwrK21PZmNjUmtES1JwMUsy?=
 =?utf-8?B?Rkg5V0NySDlvZTFuN3ZHTjY1U2dMNFQ3RStUdzVaeXVDMnF4Q3cwbXc2aHFV?=
 =?utf-8?B?U0pvbGZZWm1FS290KzFrdnJmUzBjd2lyTXV0UkR3MWhwMU5JMW1WQmNoZk5H?=
 =?utf-8?B?ZnVKNUNWcTZreTRBZElxZHJJSWxZdkRRWHVOMEhjWU9FZWdFdnEvcDhtOUlT?=
 =?utf-8?B?UTlSTXJmRnZUQVVzQWNVKzFjNytwZ1pETG9HR2RRYi82NWF4YS9nOCtNNXU2?=
 =?utf-8?B?MFFqVXVDR1hkRGRYdXVwcVl4U3pkbHBTQXhmZnhuUElIM2xwUzgvQ2pDc2NK?=
 =?utf-8?B?SkcwdHZJTk5zdGJmclpaTlFma3d3NFg5KysvRG8xZ3VDNFR2aW0wMzNJMHB1?=
 =?utf-8?B?bDhXY3ZrS0g4T0NxcE5TSDZtb0Rldjk5b2FqL3g0R2NqbW42bzQ5Qm54UTZ4?=
 =?utf-8?B?M0RsbC95ak9JVko4ODZ2VVRLV1VWWGROSFRIU3h6dWV1Vkx1dlFvM3J1bk9R?=
 =?utf-8?B?Q2x4dkMvVkhQam8vTjFqZU02YlVEb3ZRRTE3ZkFWbUlsL2tiK0VEamI3OVBx?=
 =?utf-8?Q?o5zo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f706610f-7e4b-45dd-8e69-08dd7d12e5b2
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 18:17:07.5646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jSLblpafnLHrtAv7UCCZVgfKfksaKhKBEiDIse0tAx9OKFJcwvOi3Tkyrvv0Y9t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6314

Hi Tony,

On 4/16/25 12:55, Luck, Tony wrote:
> On Wed, Apr 16, 2025 at 12:09:52PM -0500, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/15/25 11:53, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/15/25 7:20 AM, Moger, Babu wrote:
>>>> Hi Reinette,
>>>>
>>>> On 4/11/25 16:04, Reinette Chatre wrote:
>>>>> Hi Babu,
>>>>>
>>>>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>>>>> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
>>>>>> can be assigned to an RMID, event pair and monitor the bandwidth as long
>>>>>> as it is assigned.
>>>>>
>>>>> Above makes it sound as though multiple counters can be assigned to
>>>>> an RMID, event pair.
>>>>>
>>>>
>>>> Yes. Multiple counter-ids can be assigned to RMID, event pair.
>>>
>>> oh, are you referring to the assignments of different counters across multiple
>>> domains?
>>
>> May be I am confusing you here. This is what I meant.
>>
>> Here is one example.
>>
>> In a same group,
>>   Configure cntr_id 0, to count reads only (This maps to total event).
>>   Configure cntr_id 1, to count write only (This maps to local event).
>>   Configure cntr_id 2, to count dirty victims.
>>   so on..
>>   so on..
>>   Configure cntr_id 31, to count remote read only.
>>
>> We have 32 counter ids in a domain. Basically, we can configure all the
>> counters in a domain to just one group if you want to.
>>
>> We cannot do that right now because our data structures cannot do that.
>> We can only configure 2 events(local and total) right now.
> 
> Not just data structures, but also user visible files in
> mon_data/mon_L3*/*
> 
> You'd need to create a new file for each counter.

Yes. That is correct.

> 
> My patch for making it easier to add more counters:
> 
> https://lore.kernel.org/all/20250407234032.241215-3-tony.luck@intel.com/
> 
> may help ... though you have to pick the number of simultaneous counters
> at compile time to size the arrays in the domain structures:
> 
> 	struct mbm_state	*mbm_states[QOS_NUM_MBM_EVENTS];
> 
> and if you are dynamically adding/removing events using the
> configuration files, need to alloc/free the memory that those
> arrays of pointers reference ... as well as adding/removing files
> from the appropriate mon_data/mon_L3* directory.

Not just that. Also there is that overflow handler to keep all these
counters in sane state. So, pretty quickly it gets complicated. It is
probably best to handle as a separate series.

-- 
Thanks
Babu Moger
