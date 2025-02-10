Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B459255E4B;
	Mon, 10 Feb 2025 17:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208435; cv=fail; b=tMeBvETVZZ+CD4zTkiMDTJsoA9sxaxmhIj1Ixfnv06fD8WlOX4E4aAarkkSHTf8jwuNkW5+aWXZiQMhJfWp7adPR6CXpWbPBGd3ahAsg1I4BYleBKcDyAJpapv+H+m2ziwfJxWJv+ahxn1AQv/hTiJBLWXUSPAT+ijyY0y/Pry4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208435; c=relaxed/simple;
	bh=Gmxdryhwbq99RLy2ESr6wan1B53pkNQMBRDbzBQHr+I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bVnfvt/hzXqTo+q6ecJP73CCV3DgiA7BWcCMAhqnB7iQ398fwA6Us1Gt8EMR9jJgd2WuTCkMd5QqS/0GrPeE81/XJuBBbLre4EUvsdxUw3RuGEnEV4sAcAdCM/ubDISVN+BdgkCuj4gjY6nHkNVvN//MG9gRdkPGrhHJChdSIFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wji7PXlh; arc=fail smtp.client-ip=40.107.220.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wji7PXlh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNi3PYxBeWok7EU/lWhNpvJqFbeKojmOY/+wfjg63MfyLlGOdWwEViZ9i4Fa21WU1FY8SbDhgjchMc/yKMuNprwFTCUpJhW4e3E48QMwmmOn9+bcYfJaJIZgVldZZxbZZg3OMvf9OPaKuKflb3N/TARguinDMRbm/jk0SNFoV9fPXEO62823wqvhkSWbdoKyvYw/VTVqGrB2An94l/mSwLyEQvwtLO8mX+Ot7CKDqNol6PF/BJrQsRAykyhBKWjYzLr00twzFuiNMv5zZZkC9Vs0vrjZubj9Rii6KO4druyvaYFBRXf/AOxGG85EvGxiPTPPP1Upmkb3InfE8TY0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5lv3s48+VfwtOLTiq7NBTMJRiTOuFC/LIR4MjKjt7w=;
 b=FyIG0gaS3ztm6dvjWDWJVmuRviX7AGds+0kCvZzVzXUir7rWE5IYE35qShs7qFtYwSFQwTIMyNx65tFH8g47glcNikS6hKAU8ln6AlW1vPvySYgS6IyiYZCzI60i/YXKGh6cVgWd1D74UD42XMEoJJHDvw5JcBXiS3VPtEN5MQ2oq3ZAfYum2xCBS8Z7oL2YmuEhJ8lDdy1m3eimh/kbcUk8CXVbvqazt97btE3U49x22InVr9OLM4ZOhDARAKpxYlM4gEyCIY1j55L/kbcA1bHukOl8r4DE1IHX5YNt/MWlxfhNiHTfFhfaq1JCfX01gmqNt+zGHWeoYlt2kOIrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5lv3s48+VfwtOLTiq7NBTMJRiTOuFC/LIR4MjKjt7w=;
 b=wji7PXlhVpXUGLsenFR+6pR3f74Ifv2bgOBRkAid09VdrAwwH2UPrf3L+YHHmNkcXq2S2hJp5HG2F/cVAKIxFsZXhfDb4pPZs2NdmK1kaLDV10XDSgsOq9BIhrCkBf87C1GAKTdeKsdfS/3wVlTE75wtsnoul9VAvSs92Ji9v68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA1PR12MB8698.namprd12.prod.outlook.com (2603:10b6:806:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:27:10 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:27:10 +0000
Message-ID: <283b3726-1ecb-4331-9b81-36016ee02767@amd.com>
Date: Mon, 10 Feb 2025 11:27:06 -0600
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v11 17/23] x86/resctrl: Auto assign/unassign counters when
 mbm_cntr_assign is enabled
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <2119b76ef8be21b1d8b2deedfab23e8e33ba724c.1737577229.git.babu.moger@amd.com>
 <8d04f824-d1cc-461c-9c57-0f26c6aa96e0@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <8d04f824-d1cc-461c-9c57-0f26c6aa96e0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::34) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA1PR12MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f6005b-370d-433d-a778-08dd49f82660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFRYam9xQ1I4UGF4d2t4eG5IUG9CdHFiVnpxR2hjTHV0eVRRN1RoQUNxU09i?=
 =?utf-8?B?MEVYL0ZZSXdWVXpzcnY0MTJoa2kwLy9RQlJ3eGFPL00ySGxIYUVudTVsSG1D?=
 =?utf-8?B?dkRESWloTDBWcGoySHI5OTZseEYvZkQzS2lFL3g2dDc1MEltcjA1NFR6WU4y?=
 =?utf-8?B?RWhwRklReUxVQS84NC9LbnpGZHRDQ2V6SW9hLzF1RWc4QURocjJ5RFh0Y0Rl?=
 =?utf-8?B?UEhMVTVsYlJZdDRIQ25QS1Z6Qzk5UGFLYXNhZERpWHNzL3VQMFc2VWs1VGVL?=
 =?utf-8?B?eWIxTWFydzJuQ2I0anJGQmhQTjVHNHpXanJiOVptcjNqUEFDUDJnVGd3SVdE?=
 =?utf-8?B?cEo3ZnNuR2FyZFRnZ0lreEQ5MURZOWUyUkcvRUN6L2JacWVPTFI2dzFIdkhP?=
 =?utf-8?B?alJuT0tocDFoL2ZtbytZOGZRRnJjb055YXZmTjZNcllKNDVoZXpxMWk3TjJl?=
 =?utf-8?B?c2piVnFwVy9qZWJtRkY5KzBEYzU0dmdyQk5pRVVNTXdDczU1aXFLNGJxQTJz?=
 =?utf-8?B?MG5QUE9NZTdhWmxCbTNTZkZzOXNoTkxPS2xMdUFBZmZMVG1WWTdFWG51ZUJK?=
 =?utf-8?B?cS9QbS9aOEY5dkw4SHI0MDF1L3E0STFjdDgwdmdLQmtCUVVIeDlFUTQ1Y0I3?=
 =?utf-8?B?ekxhS21tVUxxRExzTmdZTi9FbmxoYkFYLzd0cDJnSGdSeFBJQlNzZWFUV045?=
 =?utf-8?B?UFM4U3JiVkVWQkJiZmgvZTlKL2hNbTJiUUVNK3l4ZmdZMFU4QzRhaWZIVWM4?=
 =?utf-8?B?ckZVU2VEOU51bm5rb0VaOWR0UU1PTmd4N0xoSm8yQ0FOekRRb1RnV2xpWGZ3?=
 =?utf-8?B?cnpjcldUSzA3YUdSS1p3TE1LT25kK2Y5dU5VYjVnWDlWaEhvNmlpMlJaQ1Fi?=
 =?utf-8?B?d1lScjIxbFM2K2xSQUd2cS9Rc3N4ZmpSc05UTUxHd2FLM2RwTm1DQzIwSEVp?=
 =?utf-8?B?U2dzZER0bGdsa3JJcDF3TkxuVHlVNXZVa2kxQlA1RXNJSWtUdGFISEhHNnBW?=
 =?utf-8?B?VGprak9FWlhHdnROVUVNQi9LU3VwZnFrM1MwZWp3NXcxMHNWeUFNOTFCSEtS?=
 =?utf-8?B?UTR3dEdSQnk2OU9PZzNQUmVtR0hiNGU5NkV1WlJTUjNyU3UwbGNMV0ROdEMv?=
 =?utf-8?B?cFpyelJIK0EyVnhmTnQ3TmJVNHgzMGlIcGFkY05QT1pTN29yeVRXUVltSFVM?=
 =?utf-8?B?ZStNNC9qN3JTWFlSc0F5aTBsVjc4NnM1am9KVURMMTlXVEtscE5nQ1lNMDVJ?=
 =?utf-8?B?Q1daRjhab0M2RWtTNXV3T2dLeWxRcXJlNlRpYmxJUGpTQ1hudUhhVk9kTFFq?=
 =?utf-8?B?UzNEQ3VqYU1nYW9LVzMyNHhvZk04b0JZNmlQUGJCRTc1blNibU4xYzJUREhq?=
 =?utf-8?B?MHgwSlRJZ1FSQzE4dytIWkVQNWwxMVJEdTVVbjhtazd6akRLNS83SktwY0Uv?=
 =?utf-8?B?Z3ZYZllQV2xtd2xNM280VlZmSEU3NGpNWi9tRWsyU0RVdmxyK3FLNkpxMy8r?=
 =?utf-8?B?R3FiRnNUeStYaFpYL2crd3JqamgwRkJ2aEZEcXhVMUJJMEZwLzVpR0dhKys5?=
 =?utf-8?B?ZUhNcWpwWkhCWVdKOE9YN0ZGcStkQ3VHZjFGMjJ0Tk81ZmM3UUJ2SVpnUFMr?=
 =?utf-8?B?VGpUUW9ZVjNsS1Q0UndGcmN2aVNXcEhnZ0pWbDVGSGRxRFphb2M1NXhRbUp2?=
 =?utf-8?B?dEtQbXFhMEFwUmJnRGVsdG81WDh0NXluazFTbzJWL0R2ZXF1QjF1aTd0bW1z?=
 =?utf-8?B?ZDNXbXgxUVdSY3l3WHhYSlVkL2l0UDBlM09aSWVWUTF1bkgxV3I2VHJoeGNm?=
 =?utf-8?B?Wjc4RkxLK055U0lxT29NRkhWR0NaYnNYVnVpaE1POWFxZmlWa3lrbjd2TG9r?=
 =?utf-8?Q?o89JObGiIcDH6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDhyVkVhRHM0dlpxNkpMU055TURKeS9xcEJOeGxtSEJjb3JIWWxXVWoza2FN?=
 =?utf-8?B?eWhYODVuRjE3WjE2VEJVMXBoYWVvR0xHc0VJc2FXelNiOFNWZCtGbmNjWVBY?=
 =?utf-8?B?azc5RytmQUtSUHdlWkNsQWwzZUhzR3Z1dFpvZjI1Uy80azlYZFlhUG1LVkov?=
 =?utf-8?B?TDdmQTI5ODZUTXpHSzlhVmFYbjJJajN3Lzd3Z1hhTEc5WHpROFdFYjdvVE1B?=
 =?utf-8?B?TkZlY2NDakUwUXZ2K1hzSEJhblAva1kwT0Y3YjFic2gzR1lYTTRPdjNMbkR5?=
 =?utf-8?B?MUZubXg2TkQrbld3eGVDUE5KR2FiWkp6UWpUR0Vzdzk4eUtoOVJsQnVaaTF2?=
 =?utf-8?B?bUhGaE0rSDJCeStDVXk4TlRVdnFKRnBBQVJRWDZqV05pbWJZN0ZDQysyNmJx?=
 =?utf-8?B?aEFua21wYTExZzFzdlFrSmYvTGJuRDJXa0NhT1BCV1ZRazQvcW5ncTFjcHVt?=
 =?utf-8?B?ZDNLdjROd0lCR3pvcjdRYXMvaTZ3dUtvWUxlYnY3RGVTNTFjY0R2L0puOVZZ?=
 =?utf-8?B?anVKSjFVeE4xeXdHcUR0YzJnVEZKR21jL2RRTW0xankzeDhKQkNlNjNvY2U0?=
 =?utf-8?B?YzFNekUwSy9EVWJOYTJlaUc0cnRHaWFoUzZHL2IxZXB6VmJTSTF0ZHVQdTRu?=
 =?utf-8?B?VTBMQ2FLeVZTQndnUlVwV0E4ejJCMHA0WGVaNlZOcWwxY21hbDI2dmRQWGpG?=
 =?utf-8?B?elZkbDBZbmNuczZzKzJJSlllL0RKWk1PSk1tN09Va0xoWFNZK3gxKzNLblk5?=
 =?utf-8?B?V2VJbTczWnFycEhOcExEOXZ6cVF5TkpSZVZ5NlBsNW9adllXVkFLejR4RExO?=
 =?utf-8?B?REtOb3M2UXg2ZjlPNmwwVldmMTBKQUdSYTBEWTVmeUNMRTVwa25BZjFGYy96?=
 =?utf-8?B?RDdpdnVyZXNxV3BNdkNZNU5CMVdYL3VWZTY5UlpwUjNSMkZZaVNoSXJOUmNi?=
 =?utf-8?B?QzlPcHA0dUlYZ0RSTFRwSXVPNFNOYWtrSjJ4SGp6N2R2MlkwcHNJdHFBRjho?=
 =?utf-8?B?ajJJVjMwcGVyWFd5WTROZkxUbjBscUpKWVVSZlJuSGRjd0tTR3o1UmxxS0Nr?=
 =?utf-8?B?ak51OEhkMU5TSCtudml4MjA5d0t5V1dvdGdKcDRhT010VWlnZGNRWW1ibVpE?=
 =?utf-8?B?MUpWVWpBSExVUFRSZ0h1MFNkQStMN2lBS3FRUTB4SjQvU2NHNE1vWFBtYjhS?=
 =?utf-8?B?UWxOYXVLOGZMS3UyM3hDOFUwL01tWnZOL1A2TDJxMk5GTWt1UXYrUmxNTnFM?=
 =?utf-8?B?T2NENW5WbGt4c08xMlR0cjVrNXEyUThFdkFmaWs4VVN3aHQzSmhvRWVBME1L?=
 =?utf-8?B?OFNzVms4UmVGU0QxblVtMXo2VEhyNjVCdlRYOEZMSjZBS05PTUQzVFZxQmhM?=
 =?utf-8?B?bDR0K1VzYXJvRGdoRGlONmNUa1B3NlRReHhKMWxiTjk4MDlrSEltMFV4M1dr?=
 =?utf-8?B?eFVYS1RYL1piL1E3Y1NmUE5FUE5ycHBNNy9pZCtVS0twVmtoVk1WQkRzWU1t?=
 =?utf-8?B?eURZTWNQUGFvMHJxc3h0Z2RVbFM3R3JHaHNvTm9KSFU1cDY0bktpblRZOU5h?=
 =?utf-8?B?NWFaVFNnYkttQXpndjlDNnZVVXM4QU5QZ0VKSGNWZ0ZnRHJKREEycEFDV2My?=
 =?utf-8?B?K056a2Q2MlJvZHdQTDNxa1E3NEdaN0F4ZWZQT2FlUEd5MWdIT05UN0FHdVVP?=
 =?utf-8?B?ZDZmdFZFaDQ1VlZOS0k2MVVKcUFHLzYvaC9PTVRXaVRvSWJMcVdxbzBwQUxV?=
 =?utf-8?B?Y045a0EvcHZ5cGJFSjVlbWxiR0lCTzQ4RE1TOEJNSzFJUjczRjJncHIxMklZ?=
 =?utf-8?B?K2ZCWlAvV2pxYzZzTm5YT3dQcHNSemk5eFE0TlVmNE0xKzJuMjlwTWZPQWxa?=
 =?utf-8?B?RHNJWExZUXZHbGtZNUMvckJjWE1TWHplM2R5VHdhZEEwbUN4aTNCdDFNd0xx?=
 =?utf-8?B?WHh0THZYa0RuL3QzdWpSTVcydHRLdlY4NEJ6YUtCRHRGRUN0b1VyZWo1NXQ4?=
 =?utf-8?B?Sk5sRlZlUnVpWmFnUktWRjBaQS9kUnYwdWpYdUdjU05vU2F2ZTJhWmdRTDNl?=
 =?utf-8?B?MjVnLzZiZXdEeUxQYXpaYTdMeTg2WnNCbTdKbzByRWZLRDN1VDM1ZjN6VHBX?=
 =?utf-8?Q?Mvzo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f6005b-370d-433d-a778-08dd49f82660
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:27:10.3403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kb/jPVGnTQXIMsFNIDcToDW5qqPYDqOlaSCIAzi2FlhuZhfoFfdesul5RDLtGpYF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8698

Hi Reinette,

On 2/6/25 12:03, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> Assign/unassign counters on resctrl group creation/deletion. Two counters
>> are required per group, one for MBM total event and one for MBM local
>> event.
>>
>> There are a limited number of counters available for assignment. If these
>> counters are exhausted, the kernel will display the error message: "Out of
>> MBM assignable counters". However, it is not necessary to fail the
>> creation of a group due to assignment failures. Users have the flexibility
>> to modify the assignments at a later time.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index b6d188d0f9b7..118b39fbb01e 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1557,3 +1557,30 @@ int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d
>>  
>>  	return ret;
>>  }
>> +
>> +void mbm_cntr_reset(struct rdt_resource *r)
>> +{
>> +	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
>> +	struct rdt_mon_domain *dom;
>> +
>> +	/*
>> +	 * Reset the domain counter configuration. Hardware counters
>> +	 * will reset after switching the monitor mode. So, reset the
>> +	 * architectural amd non-architectural state so that reading
> 
> "amd" -> "and"

Sure.

> 
>> +	 * of hardware counter is not considered as an overflow in the
>> +	 * next update.
>> +	 */
>> +	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
>> +		list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>> +			memset(dom->cntr_cfg, 0,
>> +			       sizeof(*dom->cntr_cfg) * r->mon.num_mbm_cntrs);
>> +			if (is_mbm_total_enabled())
>> +				memset(dom->mbm_total, 0,
>> +				       sizeof(struct mbm_state) * idx_limit);
>> +			if (is_mbm_local_enabled())
>> +				memset(dom->mbm_local, 0,
>> +				       sizeof(struct mbm_state) * idx_limit);
>> +			resctrl_arch_reset_rmid_all(r, dom);
>> +		}
>> +	}
>> +}
> 
> I looked back at the previous versions to better understand how this function
> came about and I do not think it actually solves the problem it aims to solve.
> 
> rdtgroup_unassign_cntrs() can fail and when it does the counter is not free'd. That
> leaves a monitoring domain's array with an entry that points to a resource group
> that no longer exists (unless it is the default resource group) since
> rdtgroup_unassign_cntrs() does not check the return and proceeds to remove the
> resource group. mbm_cntr_reset() is called on umount of resctrl but
> rdtgroup_unassign_cntrs() is called on every  group remove and those scenarios
> are not handled.
> 
> To address this I believe that I need to go back on a previous request to have
> resctrl_arch_config_cntr() return an error code. AMD does not need this and
> it is difficult to predict what will work for MPAM. I originally wanted to be
> flexible here but this appears to be impractical. With a new requirement that 
> resctrl_arch_config_cntr() always succeeds the counter will in turn always
> be free'd and not leave dangling pointers. I believe doing so eliminates
> the need for mbm_cntr_reset() as used in this patch. My apologies for the
> misdirection. We can re-evaluate these flows if MPAM needs anything different.

So, new requirement is to free the counter even if the
resctrl_arch_config_cntr() call fails. That way after calling
rdtgroup_unassign_cntrs() the counter is freed and it is in clean state.
So, we dont need to call mbm_cntr_reset() in the end to clear all the entries.

Here is the call sequence.

rdtgroup_unassign_cntrs() -> resctrl_unassign_cntr_event() ->
resctrl_free_config_cntr() -> resctrl_config_cntr() ->
resctrl_arch_config_cntr().

So, only change here is.

/*
 * Unassign and free the counter if assigned else return success.
 */
static int resctrl_free_config_cntr(struct rdt_resource *r,
           struct rdt_mon_domain *d, struct rdtgroup *rdtgrp,
           enum resctrl_event_id evtid)
{
        int cntr_id, ret = 0;

        cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
	if (cntr_id < 0)
 		return ret;

        /* Unassign and free the counter*/
        ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
                                          rdtgrp->closid, cntr_id, false);
        mbm_cntr_free(d, cntr_id);

        return ret;
}


> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 2b86124c336b..f61f0cd032ef 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -2687,6 +2687,46 @@ static void schemata_list_destroy(void)
>>  	}
>>  }
>>  
>> +/*
>> + * Called when a new group is created. If "mbm_cntr_assign" mode is enabled,
>> + * counters are automatically assigned. Each group can accommodate two counters:
>> + * one for the total event and one for the local event. Assignments may fail
>> + * due to the limited number of counters. However, it is not necessary to fail
>> + * the group creation and thus no failure is returned. Users have the option
>> + * to modify the counter assignments after the group has been created.
>> + */
>> +static void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
>> +{
>> +	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
>> +
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r))
>> +		return;
>> +
>> +	if (is_mbm_total_enabled())
>> +		resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
>> +
>> +	if (is_mbm_local_enabled())
>> +		resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
>> +}
>> +
>> +/*
>> + * Called when a group is deleted. Counters are unassigned if it was in
>> + * assigned state.
>> + */
>> +static void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
>> +{
>> +	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
>> +
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r))
>> +		return;
>> +
> 
> It looks to me as though there are a couple of places (rmdir_all_sub(), rdt_kill_sb(),
> and rdtgroup_rmdir_ctrl()) where rdtgroup_unassign_cntrs() could be called on a system that
> does not support monitoring and/or only supports cache allocation monitoring.
> 
> In these paths it is only the architecture's resctrl_arch_mbm_cntr_assign_enabled(r) that
> gates the resctrl flow. I think rdtgroup_unassign_cntrs() and to match rdtgroup_assign_cntrs()
> can do with at least a r->mon_capable check.

ok. Will add following check.

if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
   return;

> 
>> +	if (is_mbm_total_enabled())
>> +		resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
>> +
>> +	if (is_mbm_local_enabled())
>> +		resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
>> +}
>> +
>>  static int rdt_get_tree(struct fs_context *fc)
>>  {
>>  	struct rdt_fs_context *ctx = rdt_fc2context(fc);
>> @@ -2741,6 +2781,8 @@ static int rdt_get_tree(struct fs_context *fc)
>>  		if (ret < 0)
>>  			goto out_info;
>>  
>> +		rdtgroup_assign_cntrs(&rdtgroup_default);
>> +
>>  		ret = mkdir_mondata_all(rdtgroup_default.kn,
>>  					&rdtgroup_default, &kn_mondata);
>>  		if (ret < 0)
>> @@ -2779,8 +2821,10 @@ static int rdt_get_tree(struct fs_context *fc)
>>  	if (resctrl_arch_mon_capable())
>>  		kernfs_remove(kn_mondata);
>>  out_mongrp:
>> -	if (resctrl_arch_mon_capable())
>> +	if (resctrl_arch_mon_capable()) {
>> +		rdtgroup_unassign_cntrs(&rdtgroup_default);
>>  		kernfs_remove(kn_mongrp);
>> +	}
>>  out_info:
>>  	kernfs_remove(kn_info);
>>  out_schemata_free:
>> @@ -2956,6 +3000,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
>>  
>>  	head = &rdtgrp->mon.crdtgrp_list;
>>  	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
>> +		rdtgroup_unassign_cntrs(sentry);
>>  		free_rmid(sentry->closid, sentry->mon.rmid);
>>  		list_del(&sentry->mon.crdtgrp_list);
>>  
>> @@ -2996,6 +3041,8 @@ static void rmdir_all_sub(void)
>>  		cpumask_or(&rdtgroup_default.cpu_mask,
>>  			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
>>  
>> +		rdtgroup_unassign_cntrs(rdtgrp);
>> +
>>  		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>>  
>>  		kernfs_remove(rdtgrp->kn);
>> @@ -3027,6 +3074,8 @@ static void rdt_kill_sb(struct super_block *sb)
>>  	for_each_alloc_capable_rdt_resource(r)
>>  		reset_all_ctrls(r);
>>  	rmdir_all_sub();
>> +	rdtgroup_unassign_cntrs(&rdtgroup_default);
>> +	mbm_cntr_reset(&rdt_resources_all[RDT_RESOURCE_L3].r_resctrl);
>>  	rdt_pseudo_lock_release();
>>  	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
>>  	schemata_list_destroy();
>> @@ -3490,9 +3539,12 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
>>  	}
>>  	rdtgrp->mon.rmid = ret;
>>  
>> +	rdtgroup_assign_cntrs(rdtgrp);
>> +
>>  	ret = mkdir_mondata_all(rdtgrp->kn, rdtgrp, &rdtgrp->mon.mon_data_kn);
>>  	if (ret) {
>>  		rdt_last_cmd_puts("kernfs subdir error\n");
>> +		rdtgroup_unassign_cntrs(rdtgrp);
>>  		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>>  		return ret;
>>  	}
>> @@ -3502,8 +3554,10 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
>>  
>>  static void mkdir_rdt_prepare_rmid_free(struct rdtgroup *rgrp)
>>  {
>> -	if (resctrl_arch_mon_capable())
>> +	if (resctrl_arch_mon_capable()) {
>> +		rdtgroup_unassign_cntrs(rgrp);
>>  		free_rmid(rgrp->closid, rgrp->mon.rmid);
>> +	}
>>  }
>>  
>>  static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
>> @@ -3764,6 +3818,9 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>>  	update_closid_rmid(tmpmask, NULL);
>>  
>>  	rdtgrp->flags = RDT_DELETED;
>> +
>> +	rdtgroup_unassign_cntrs(rdtgrp);
>> +
>>  	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>>  
>>  	/*
>> @@ -3810,6 +3867,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>>  	cpumask_or(tmpmask, tmpmask, &rdtgrp->cpu_mask);
>>  	update_closid_rmid(tmpmask, NULL);
>>  
>> +	rdtgroup_unassign_cntrs(rdtgrp);
>> +
>>  	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>>  	closid_free(rdtgrp->closid);
>>  
> 
> Reinette
> 

-- 
Thanks
Babu Moger
