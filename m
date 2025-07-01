Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C02192D83;
	Tue,  1 Jul 2025 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396823; cv=fail; b=IA9PQsPyXouSlGvLocBwvcj2sDwehrlLViiw4Dz9Mh/c6XO5laln6ppL7aWVsUQtaciAb91LgZ71EWoA/eWWJg+JuaDtxEb5OeBfIBGrITzMIV4grczqyJ43ijeq9X3Cot2Aoktci9bVRczVvptdqNEqRo4oDwxtM2WXAniK9Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396823; c=relaxed/simple;
	bh=5AGCgRkAwa2xAuCCU9HP/ktSaYfuXAywOg5uy9TRVE0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GhZwhp0WYipIin6yrY20yzVziLrsF8DkmQUnHNHFjArRcStILBGE/jphneoA9GcT6xbO8Pm/3cTZbvDdZ59dpjZ5FXkt/Yzue6ruHMiEIJZ2ERrvioA0MiYSy2c3jA2Ivnb3AQjiInyJdTuNzFb3I0a07fio3MdYQmUvyERn0Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kZXivD2A; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kZXivD2A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7SI6lLGK+40PaDtDYP9unxc7m53Zh7Rd7nJxjhB1cybom2JH+YDC40ZNk1UW33gRXOp2tFmtnR3G1DSTCaK9uJGtC/EdgzuTAwvaK3Jew4YaF0GMdHK2OK8YynfnAlNl+fLOb8/G6TBQnWJScc+P3qB9nvNW4OQWK0bOKGdp8D8fZk5WlGSwbkoNiniUu3EEYcP9h9DzwLrT4MThblPuPWl/omaNVWRJJ9vsni8EVIVoXOQkYUjGWJO8K5EITEY2U5wk67OqLKj2kA7XJkiwr1qg5DyHEFNsm6iQoQghdUN+eo8TQfp1/QT7Lx2hs+r7qf2oruNwAc4AhQsc1Zq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QWv/x0OZUbom/2U35rhMMQc2ChwqFhnXHnubp74+80=;
 b=xMq9Pn0bI1fdcCRHMpiFaYGD+L2FN3p4sey8l4NHobThh4y3h2k6BVzDE6b90NUWuo5NyKxE5UzEUsA9731f/leIkFLOy9YDfRq88opfAofciRvnlqFei0hNO7HNhS0FVJ7ND9SJ5bC6nd7MPuwtU2VU5Mzm0Z4+ZJLMXN0Uxoa4GjNxUpiNyw+Kvp/Me0IwYDnlyMI0VuE8IAzU2hvJQ2CRzJejgyOPvU5hfPXr05L948R/aVY6LIHCODI6+1+iQfVnNLGUIT2PFwGERtoki8pvWOtF8BzFj1T1eMJbzAfO9RbUpbdBqC8x7es4w4gPrcGnysM59ndA8JiVSNlE/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QWv/x0OZUbom/2U35rhMMQc2ChwqFhnXHnubp74+80=;
 b=kZXivD2AwQqzwQ5pbr0xSZ/19LlAwq3zatKGRuSaWJpxLk4K1gU0WX8tPoftVnrjaqPrpcZNDRuIrVCb9+S7SnvcXftU43LddqH54iyzU1g570tVukFMf6u6ygk6INhAMT/E/D56m6M9jQRatEkmGCvHxdSErAViXE8reCo2hcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 19:06:59 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 19:06:59 +0000
Message-ID: <6485fc52-15cc-4a6f-93cd-72d953cf7858@amd.com>
Date: Tue, 1 Jul 2025 14:06:54 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 27/32] x86,fs/resctrl: Auto assign/unassign counters
 on mkdir
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
 <e20b41f127668098a9e662e866767b582878b98e.1749848715.git.babu.moger@amd.com>
 <c5d040fa-1e27-4edd-a808-0ef9811c2e9a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <c5d040fa-1e27-4edd-a808-0ef9811c2e9a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0009.namprd18.prod.outlook.com
 (2603:10b6:806:f3::17) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dac8866-c4d9-4e61-2194-08ddb8d2743c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjBpK3BnSWdaQytZVEh0ZjFGVDFHR1FmYjVGeTBjZitJTXc0QTcxQVdRcXFl?=
 =?utf-8?B?VkVWZWxZcWJIUlpXK2JXby9VUmpjSlJHVVhPc2VxRTREcEZVZGZ1aXppcjJH?=
 =?utf-8?B?N3VQQzhSM2F1VDJtaGpUMmZFSjB3SXQ3cmZvUm9KdHlFbThPcEZmdCtMSnBP?=
 =?utf-8?B?cUNHSlh1TVBxZVlXNUNiS0x6ZjZaVjBCR2luNXhwc2daWkNoQnZ2d0hNaUZl?=
 =?utf-8?B?QkRVYVBmTjRjYWoxMVY1Wk5yT3ZNVW5pR1pqajk3ZVVmbjdoQXhybU5WV0hI?=
 =?utf-8?B?OHpFcnRUNmdxYjFINkFWd1lSUEdMUnZYc1ExVUZ2ZjJqWmFaNUhFczdxc0lx?=
 =?utf-8?B?UHR2N0pueThPZ0xMUERtM1RkTm1EVTFUemRCdytGcWJ6Smc0QXgxSDF6aEVF?=
 =?utf-8?B?TW5RcXZpZjlYdG5BQ1o4RklUM2lLM3FiTzlteFdNb3VFK3NhWHVNTWd2a0RS?=
 =?utf-8?B?aFYwaWNkQ3NuanRUQkN0NVFaMVFKSHpiWWFLWUc4bUJ2YkpFNCtEWUdxdk9O?=
 =?utf-8?B?M1ZvN05RbFRqemMzNkJtdjFyUTB5ODNmdkVNN2x1OWpkYTVUa3d6N0RQZWY3?=
 =?utf-8?B?TktwWnNkYVFWdEVUM1dGRzB1THVxSGlOOW9zSDNhRTNwNkVMUnpyRENSVzgz?=
 =?utf-8?B?WTU2bDBCQm5reFlWKy9KT2NQeDllMnA2QUlGQVA1WU1QZFU3OGRYNWZpN2g3?=
 =?utf-8?B?SDhGL0pTT2FZemEzWGxUTTBZZjkyNUxvL2R5NGxXNzV3QUZ5ZkpKUEp2dzNa?=
 =?utf-8?B?S2EyMm82N3Jubzl6RXArNjJmbEwrMjBVZG80cldESTNGZUNXNXdlLzNSTk51?=
 =?utf-8?B?NklOV3FVblVWVENEdmRzVjRoYk1rRjBadHdnMXIwdU0yc0ZLb2pzNlQ5dnc3?=
 =?utf-8?B?eVE0cHRlWk52dDBrdmh2WDRrN1JrQW8xZFFrbjkwd0QxcEhuTFpoTFNwZlI4?=
 =?utf-8?B?YVdjZHFQZHlscEdydmFXcFlxbGJuZEJ4N08zWnFDSXVybWZxM3h6ZW1rbURs?=
 =?utf-8?B?bDczVzBCVHlJMWY4NHUyVWh3VlVZbjRPYlBkSk9Hc0dPU1hXakNqOVNGS3pa?=
 =?utf-8?B?Zks3T1VHajJBUUhnVit2cUVJY1hOU0V2aHdYVllVL2lRdUNzVGh3Nzkwbng1?=
 =?utf-8?B?R0xWOWRyanB3eEwwWG1hVUlwUXdiS1hWV2ltbk1kalE0a2NMdkJETzA4R25j?=
 =?utf-8?B?cDUrY21VMmVmS0hNVCtrbG8zWC9ZTWRVNU5XenpFNVhTUXhXbGNlSXJkMjY0?=
 =?utf-8?B?NnVKeW93SWt0MGQ4NDN1U3lwL0ZweXV5UmhJUUtjaHY5NnlIUzJQM1Q1Qndr?=
 =?utf-8?B?YUxLakZGUHRIa1V3UVJTZ1JDSjRhVFlzRVF5c1VGaExnNGE4Y3cyL2RqTkt1?=
 =?utf-8?B?enMvZmU3eERXeGRjVElYbS8yOVFXK0JieDBZWmVWMVFqQjlRWXJaZjZubjEr?=
 =?utf-8?B?Tys3aWNIalpSSU1rcW44dlQxTi9jRlpvZXl3V1B6enE0YmNCUkNHbnZqVWFo?=
 =?utf-8?B?dWJMV2kxUnBYOCtsY3pFcXgzNHN5R0JhbUdKaFFsazZvZmpXQnNDV2dhSGZK?=
 =?utf-8?B?K0gvc045dm44bDJrMzlBd1JOOGxtZ2NUZDFIZ0YxWkI4cnJiN2FDMDYvdjNq?=
 =?utf-8?B?dDFCQXp2SitoNDFTVk4wY1JDRmhkZENiMzEzSXBNakpvT1gwNFRWeWNVR0hZ?=
 =?utf-8?B?K1hKSUpYNjFxWG5LeHBPdHFjUy9jbm1STzRtVUw5cnQ1TWc0cUlaYmhoSzN0?=
 =?utf-8?B?SDhXb2hIaVNPdW9lWk5PY09zdE00TUVEcXhRc1FLWlppTWU5MElSQ21kU1Qy?=
 =?utf-8?B?ekxKS3lDd3hvbVV4eVFMcDNvZUF6TmdpZGJjakRYTkR6SGpvbitZUWRjRmp3?=
 =?utf-8?B?bW9Wbm5YVDdReGRBNGQrY2t6dXpHQldWOU9yc0xUQm5XZ2JjMHQrcWlPOFZ4?=
 =?utf-8?Q?hyglhEEZQhs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3U4VXZ6TlNqZHdaZnA2ekFza3YwMlR5TmpyZ0NjQ1dHeHoveWFVQzZuRW5J?=
 =?utf-8?B?Z1k4TWNWakNxSTgxM25sNnlicFE4SVNuQzFJRjU2MHNzZW1hNE5tNWJuZTdY?=
 =?utf-8?B?SUJudVBJSUhCSU80KytLdDdENGlIcFEvUWwvMGdqazJPVVNCVllBdkVCQVgz?=
 =?utf-8?B?NlErRWVzbDBEczJWRUlDdmd4YjhZMGl4ZHIwN2tDS1Z3eDcxbXllektXdUV1?=
 =?utf-8?B?TTU4UjFiVnloMHZyUm1teG1rRzRORTlOeGo1ejNoemROZGhBeG4reWdVVTFu?=
 =?utf-8?B?WC9ROC83UjZJRnRLdXpoUHFzQjZDUjB6eHBodFFCVm5pVDc4bG1QUXU0ZGJj?=
 =?utf-8?B?SFYvSEh6NDJpeFV2UHAvR2kxQmZzU1RRTHIxV0dXQmpjRUZjWEtDSnAwa3Zv?=
 =?utf-8?B?TTRqTFMwVUZMWnJSVFg3NWF5ZTdBZlF1OFpZaGtVbFdBY3pwOGtzY1lSOVZa?=
 =?utf-8?B?TFJvM2R4cjBkaWtuc3pxNzA4bEN0RHdublM1YWJpWXZRK05kU2dmalZ2R1NF?=
 =?utf-8?B?S3lDMFNZRjhTb3A1M2RjZ1pQdUtENEZGYjVYb0hNQ3dNUldJRUoyUjFHb2Fz?=
 =?utf-8?B?QmIxWGZ4Sm8yem5iMm1lVVVlbFBCUERsdUJGNzNzSzgrMWcwWlV3R2pxa3FQ?=
 =?utf-8?B?dmFXVnE1T3VpeUFvZHNhMnl6UHQxMlMrRlhSY0V0VkY5L3dTRXBaZTRLSmVr?=
 =?utf-8?B?ajFJQUtkM2lFMzRrTXY1cExsVU5qZ2JySXVyRUczeCt0N0lRVWhObE1kNHll?=
 =?utf-8?B?VC80cFlRdjZGWmVWaFBoNTAvaHlHbHE2cUJHRGhLUXg4V01rNUh0eUVDdUNT?=
 =?utf-8?B?OEIvVnZTTmxuZHpqUE1ReWlMMlZ3Z09aR3ZJd1RvZ3VJaFVEZGRhK291Wjd1?=
 =?utf-8?B?WVJSOHFvaDZoUWFJRHJLU2ZnUURHR0Z3cmN4TWQxWGs4SnJLYTZ3Ym5IZ2Vi?=
 =?utf-8?B?anYvc1J5L3kxaUNYWUNnbTJmUDNXRHpUTW5wSGNTcE93YXBEQVdUSVlSNHI2?=
 =?utf-8?B?YW9FM3NocmRYLzBGSVppZXNnUWhCN0ZzTW9qQUo3eFQxUGhLSHNReUNiTFl3?=
 =?utf-8?B?N3RDeXBVMEZ3UVJkMm4zeTUyS25QSmdMem5YU0xOMjg3ZGF4SGthaC81d3Vp?=
 =?utf-8?B?V1NIdU1iYWxMSkhsNkxaREt0eStmN05HdkxqUnNBVUdLcFAzL3oxbXVjeEkz?=
 =?utf-8?B?bnBZV2VmMWRXRzRCM1RkL0w4VEF1Rjl2NzVlSDNsbEpQQzRSKzRXb25TQ1d2?=
 =?utf-8?B?bDREY0ZybUhOK0p0a2M1ZHpIQTl4aWNGSjBRU3crTVVWb2IyTGlmRVRhSlVn?=
 =?utf-8?B?UUNXMGgyM2o4cTczZzBaZDJqSVlFWHRZM25obnlncXF1NVpnT3J3ZE4xVFVV?=
 =?utf-8?B?VE1Xa2Y5cCtWZHFGOG5BeVptZE9mRDhTdDdWR0lTeUZodGRGZVg2dHQ2YmZ1?=
 =?utf-8?B?WmJaZFdzdHFyMGQzVWd4eGFycFZvd3ovWVkxWi93d2pNY0hPYmZMUUFPZmE1?=
 =?utf-8?B?aDk0TENpMXpEUjEvTEgvL1R0cmQ2OHBlM2g1TENMSXNIZEp3TWRMcFllNStN?=
 =?utf-8?B?aWhscENwOWhrRUVHNFJtd1BzYmtlY0ZSaXlqNUEwY3dFdU5aRDdzajRCdzlM?=
 =?utf-8?B?elA2RXdFZkNmR2lZQW9zalE4TEl5blpOZUFkUTFIVGJhR0kwblJFbC9BdmNo?=
 =?utf-8?B?YnBLbFBtMDNWSGhWZVhyMzdxdGhmZ2RoMmhLN0dSUTc4bzZqMk14ZXdCNVEz?=
 =?utf-8?B?VGpTaVBwRDFsQmE4YU52d2h0UUxybWJHdnp4MzgxVXVVTkl3cVVqUUpOU2NJ?=
 =?utf-8?B?c1dsK1pYVmpGOHhPQ2lWcUdnM3N3ektDMVZzS3ZhclhaeXlQUVlmYUNMSFUv?=
 =?utf-8?B?ZWhIUk5wZkY3aWlWNVJ2dE5Oc2VMVVR3NktrMU4vcGpGOW1LeXlpbzh3T2ps?=
 =?utf-8?B?QmNEMzYyN3ZhUkFwRVBWZ3ZJNm5BenBqVld2YWlldVdFVkhsRUxyYnZmVFdS?=
 =?utf-8?B?UWJQQ0oxVlBmc2RKTTBKTjZsU0IzUnAwWHRQY1hFa2dUb3M1aGk3NnRERVBB?=
 =?utf-8?B?engrRms3UER5VHB1TmpPSUtkS1hjcXVIejZqWmRUTjZNSXdPWW1udnFhQ0Jo?=
 =?utf-8?Q?QMJw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dac8866-c4d9-4e61-2194-08ddb8d2743c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:06:59.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNgkbz4cNfbSMmZ/1kLAwdLW+ZupGfX+kHCWI9hmNmrqHmFoZ5JtOKrBPeA2eOzy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653

Hi Reinette,

On 6/25/25 18:25, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> Resctrl provides a user-configurable option mbm_assign_on_mkdir that
>> determines if a counter will automatically be assigned to an RMID, event
>> pair when its associated monitor group is created via mkdir.
>>
>> Enable mbm_assign_on_mkdir by default and automatically assign or unassignq
>> counters when a resctrl group is created or deleted.
> 
> This is a bit confusing since I do not think mbm_assign_on_mkdir has *anything*
> to do with unassign of counters. Counters are always (irrespective of mbm_assign_on_mkdir)
> unassigned when a resctrl group is deleted, no?

Yes. That is correct. Changed the text now.

> 
> The subject also does not seem accurate since there is no unassign on
> mkdir.

Changed the subject to:

x86,fs/resctrl: Auto assign counters on mkdir and clean up on group removal

> 
>>
>> By default, each group requires two counters: one for the MBM total event
>> and one for the MBM local event.
>>
>> If the counters are exhausted, the kernel will log the error message
>> "Unable to allocate counter in domain" in
>> /sys/fs/resctrl/info/last_cmd_status when a new group is created and the
>> counter assignment will fail. However, the creation of a group should not
>> fail due to assignment failures. Users have the flexibility to modify the
>> assignments at a later time.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  arch/x86/kernel/cpu/resctrl/monitor.c |  1 +
>>  fs/resctrl/rdtgroup.c                 | 71 ++++++++++++++++++++++++++-
>>  2 files changed, 70 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index ee0aa741cf6c..053f516a8e67 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -429,6 +429,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>>  		r->mon.mbm_cntr_assignable = true;
>>  		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>>  		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>> +		r->mon.mbm_assign_on_mkdir = true;
>>  	}
>>  
>>  	r->mon_capable = true;
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index bf5fd46bd455..128a9db339f3 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -2945,6 +2945,55 @@ static void schemata_list_destroy(void)
>>  	}
>>  }
>>  
>> +/**
>> + * rdtgroup_assign_cntrs() - Assign counters to MBM events. Called when
>> + *			     a new group is created.
>> + * If "mbm_event" mode is enabled, counters are automatically assigned.
> 
> "counters are automatically assigned" -> "counters should be automatically assigned
> if the "mbm_assign_on_mkdir" is set"?

Sure.

> 
>> + * Each group can accommodate two counters: one for the total event and
>> + * one for the local event. Assignments may fail due to the limited number
>> + * of counters. However, it is not necessary to fail the group creation
>> + * and thus no failure is returned. Users have the option to modify the
>> + * counter assignments after the group has been created.
>> + */
>> +static void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
>> +{
>> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +
>> +	if (!r->mon_capable)
>> +		return;
>> +
>> +	if (resctrl_arch_mbm_cntr_assign_enabled(r) && !r->mon.mbm_assign_on_mkdir)
>> +		return;
> 
> This check is not clear to me. It looks to me as though counter assignment
> will be attempted if !resctrl_arch_mbm_cntr_assign_enabled(r)? Perhaps
> something like:
> 	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
> 	    !r->mon.mbm_assign_on_mkdir)
> 		return;
> 

Yes. Good catch.


>> +
>> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
>> +		resctrl_assign_cntr_event(r, NULL, rdtgrp,
>> +					  &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
> 
> Switching the namespace like this is confusing to me. rdtgroup_assign_cntrs()
> has prefix rdtgroup_ to indicate it operates on a resource group. It is confusing
> when it switches namespace to call resctrl_assign_cntr_event() that actually assigns
> a specific event to a resource group. I think this will be easier to follow if:
> resctrl_assign_cntr_event() -> rdtgroup_assign_cntr_event()

Sure.

> 
>> +
>> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
>> +		resctrl_assign_cntr_event(r, NULL, rdtgrp,
>> +					  &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
>> +}
>> +
>> +/*
>> + * rdtgroup_unassign_cntrs() - Unassign the counters associated with MBM events.
>> + *			       Called when a group is deleted.
>> + */
>> +static void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
>> +{
>> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +
>> +	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
>> +		return;
>> +
>> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
>> +		resctrl_unassign_cntr_event(r, NULL, rdtgrp,
>> +					    &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
> 
> same here, I think this will be easier to follow when namespace is
> consistent:
> resctrl_unassign_cntr_event() -> rdtgroup_unassign_cntr_event()
> 

Sure.

> 
> Also, the struct rdt_resource parameter should not be needed when
> struct mon_evt is provided and resource can be obtained from mon_evt::rid.
> 
>> +
>> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
>> +		resctrl_unassign_cntr_event(r, NULL, rdtgrp,
>> +					    &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
>> +}
>> +
>>  static int rdt_get_tree(struct fs_context *fc)
>>  {
>>  	struct rdt_fs_context *ctx = rdt_fc2context(fc);
> 
> 
> Reinette
> 

-- 
Thanks
Babu Moger
