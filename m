Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02FE27FB0C;
	Tue, 27 May 2025 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366628; cv=fail; b=d8W9SzOedapmWpx+K8K4vuEZCvAud6DBAy+1fwgzqHd37URb0N31F6AVa99IzckxIrkdZmdt1LK5UfS2+1XJgWlZnLaJ/KKcW4eV1UTMc1Zm1pqoJUJHwD9u7Qru6P0wigvj+3W1n5TqdTZoRZDfqf4f/nl5zkICRY0jjjhl2gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366628; c=relaxed/simple;
	bh=/6mWXqoRcLYeG9xdhNCXcyTMVB6ewFybGaiI/KOAdsw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lm9yqAw+YHO1098PSsy+ZO6pF8VKZAZWq1OxoztHxmM0l229e66/NgpDgie+ttqsa3cCoDc0hD/X3qjcalwRbrs7hdY68oSfLix9oxkf2pcf/7XG0e3c7pvB61ngxfhrUvJ0/YpjJ1TdsI62vBCvMLyV1CmW7qj7TQeXwOWGwOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MWE4kewe; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MWE4kewe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2YgJgmG0t0cf06ovPOn0Mu7F+ulBe+ZFE6FLGaSEe0pjuBdpQbl8zBLHe9HfEjm3TGRxAEj0oSKUQ3wdBID/nUu/Wbb7s5ungRF95+ArRf7v7ksNofAyfx5hMkxHbH/jEz8JY+G1Ew0pSr938OjgsuDJ9OloKPQcwlXQnqRDr9ZN+5qjQaImquh37cp8ByvtJ80e/NKvh+5wIwz29GRinGqu8NkQm2Il/XJEkOn+DhYAZ2sGjzYo5tSGXX9XSZYZktSQPh73ktz149xZjLLth0GaBV9cR/QQuevvqQtm5U1zviMHAds1itIhRMj7kPpssdQtPlu3ayEjxcm2+LAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQtt3O7Zb5Y2d05lSVMERmWvXwqJ3vpNrBXWVn7fRnI=;
 b=uLkzrYhzx4Zz87QuYiT0uK7KWLRlhY7OCr7MGGjX7N93a30GTpyZTb6dcQY092LdEjbuVHMMNQ+6fw7KVWdj2J3OfihqEBmq5xT5m/4NPZR8y7e7x35mE5oqQjTl+amuvbgKQePk45ITzfrdGXqwtZIIxWmFXP1wrYHHgp72c1/3TbST+MpeJ2r+OOqgJJnIaBzyQxVZ5Qps3pOk2+i08/vHtNoTVc/1cjZVxzWSZPiHKX0J07l1xhl7rC7MRo4u+Wf2gxxQBMneLHS6Xp4XzouRcbYbRc1IqbM+R8l4pmxkuTZrRGwWGlbeRd55WTLfNu0l4EcZevnTrD4DvSvrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQtt3O7Zb5Y2d05lSVMERmWvXwqJ3vpNrBXWVn7fRnI=;
 b=MWE4keweUtTEth0ewA3xD5xJTylbOnd0SCHlY532oedIjyOTn/2qXgISVPhw0XNq9TXJAUHmddUUEJk1+0+MrcKKuwp81AKnxUSL3/zduQeg2ozc0PXLVx1IBjflOxRPY0zPFKhKZyf+HTBnPZWGIUPoLdWW6+FLzcQG3KJGzD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 17:23:42 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 17:23:42 +0000
Message-ID: <6cd9873c-1add-4d19-8d08-a7c3a514bfea@amd.com>
Date: Tue, 27 May 2025 12:23:34 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 01/27] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
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
 <aef9947e5ed68feb0d33a2c882c140e2e472276f.1747349530.git.babu.moger@amd.com>
 <505f530c-810a-41a4-b3cf-7eb326bb6990@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <505f530c-810a-41a4-b3cf-7eb326bb6990@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:408:143::15) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e633d0-ee09-4997-760f-08dd9d433a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDd6Y21JL1ViVmZJL2k4Vjh2Mm1BaUpIS3VXWXNmRkx5anYwUjBpZjJ6NjNO?=
 =?utf-8?B?dnFzZlNreEZ0d01rQ1ZhZnZMZUU1YUhxOTZud0wyTkVDUnVjRVdaYUtHUjRI?=
 =?utf-8?B?MUpJWFNncThDbTlnVm54SEZZN3M2Qm9yWE1FM1JYWVVlNU9lUHNnZytrU0RV?=
 =?utf-8?B?cC9vOE5PbGwremFYQ05HOC9Ua2dUTWpITzFUR0FnVEtHekpqZ25ZazBCV2pO?=
 =?utf-8?B?UjVOSzduSkJXZDBCMXdLUEsrQzJMd0tKdjdFWDlhc0pLaEtMV0dDMlJ1OTJB?=
 =?utf-8?B?M0RtSVIxQldIbGhEdzhkMFF1SitqUjV6ZXN1M3J3NUdyTGRFS0svR3BvSzFz?=
 =?utf-8?B?bGJqNnVBUGdoTmdhMDhiNTQyZzZRUHRxcXBMeXMxZjJ2aWxMbWZRODA2U3Fi?=
 =?utf-8?B?QitRWFRrU2tnTmJ5bGN2T2tEaGp0YnVDTHNyRFBRWWRvMmtjSnFpL1IxdVNa?=
 =?utf-8?B?SkpPYkoraFh4MHUrWTRMOURieWZxWmJmWE9ZYzlZekhyTjNhdHU3ODYwWmFM?=
 =?utf-8?B?VXNCTDYzRWxGZ0dPb3VqZ2FXTHByRC9TZE01TG1wMXk1b0ZXempIc29qeTFV?=
 =?utf-8?B?cFBQZUIwZHQ1TE5hRUJlWVhhYWxzNHFGZkhkc1hDMGZuQXE0WXVuWTFpM1hU?=
 =?utf-8?B?VVZCVXdZS0c1dWJjZnY1dkc1eDg0VUx2c21jYkpwa1BTSEd0bXRPeUZNa0ly?=
 =?utf-8?B?VWdkR3VobEVHTGRIMjBxVW1XRTVFWW9VMVltUmt1UUplWVkyTENQbTBjMW93?=
 =?utf-8?B?Vk5sSTNPcVZVOVRIRWptS3NleHFTeDM2bUhNQ0d3VGFJVDBXclU5WG5YTHFz?=
 =?utf-8?B?MXlCM0FGNWZxY3p4Ym55K1RaTi9Sc2xzTUllL1Z2ODVHVUVnRTJUTWpzYmk1?=
 =?utf-8?B?NkkzejdHUXFwNm9Gd0c4eE83cEMrMldobkNoWUE0RWI0bEFyZ2Q4dmJ4Rjc5?=
 =?utf-8?B?bTlEd2hHcngxZ0xpTVQ5Rzdpc0dycGx1cWdoYzBYeWNWeTJvTUZuY1V5REZj?=
 =?utf-8?B?Q0I1aFFCTHRpVjFkeGlvWitsY3I1dVpqRk9Wc2Z4bWpUcENEcjNzSDh3MUVS?=
 =?utf-8?B?RTZjc2JtVnpZQnFleUk5aEhncjNacUw0dCtSaHd2ZjZrN1V0WU85aTQzUE4z?=
 =?utf-8?B?L1orT3ZZT20wTUI5QlNIaGFMSjQ0V09OeHpZNysvNWNmbUhwaHFhVXZ1MXZH?=
 =?utf-8?B?VVdSTGdydm9icjhKMWs2Um1lcm1nWWJsa3lHdnV6TVdZOXlxR1liaUptRG5R?=
 =?utf-8?B?RGdYR3IzMktpWnVBdnNHN2tjbjdJc3BWU2NGL3RYWUFycGlnUXhBVENSVmNV?=
 =?utf-8?B?dlZJMkoxVFlEcGk0bWk0NVMyeTFZK1FMekRDdWc4ZXNwUkFNTWhTZzFDS3VH?=
 =?utf-8?B?aExzdmZOYi8vaDlHRlhLOXNKYkkwL0ZkeHJiSVl1VHcwVFlFN3RQeUE1YVdI?=
 =?utf-8?B?dVZkR0pmUThZamdtYWVuMDJGUWo4dFQyalVSS1dVV3J5cDFFUEdBMlRaQk1U?=
 =?utf-8?B?QWVnWFJVclJtTytySnpZRnhPM0MzMlBDRER4d3JudEgybTF3dzFaN2VmTWc5?=
 =?utf-8?B?VFo4UzV4Yk9BZjgyUmZYVitsUW16SjRFMlNPaXJ5VlB5TXpNSWFxaTZyVlBY?=
 =?utf-8?B?UGZiMG50TVh1WE1EbkFwY1JSUmNpUnZQR283c29odjVFZDE5d25RZ3hhWnZm?=
 =?utf-8?B?aDVQODRjUlNyOE5RK0gyUjJ0NlhmT2JEUnVPMUtQTnMzRzgxeGFHYkNkVFA5?=
 =?utf-8?B?eWxSOStoVkZLMXZmVEFPTWZHeXVZSktERDNVZHhJMXFGcm5IUHpTY1FzYmFh?=
 =?utf-8?B?S3hHaGQzcG1tNWlJanJBUWtOcTB1Ry9HblhBQnlIVEFseFFIYUJUWHJwaFI1?=
 =?utf-8?B?L1ZRT2NKV2FzMFNJK01IYnZsSVI3M3hBZXUwdllzYjdsaDk1S3B3SDBTWkxT?=
 =?utf-8?Q?Ak15up7InnQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzJLNnlKT3Z5K3E4ZEl3SnQ1ZWU5TjQrdGsrdGxrRFIxMEltU3d3QlB2dXVN?=
 =?utf-8?B?Z21VWVZ3L2M2K1U5UU5RakRDSHlzb1h6NmdJVjhnSEViWEsrVjl5SjdFREJz?=
 =?utf-8?B?ZG1nY3Jwenc5WE5JTktOVHEyK1JyNU80V2plNG03UHpFNDZoNmRZVmJHdkVS?=
 =?utf-8?B?U1lyRXJVQUZKd0xuLytNWUI2WnpOZTUzVnptZWlQVVdLUXJpcHgzbUY5bWtD?=
 =?utf-8?B?OHp3Rk5IN0g1dmwyWnlZOVBWdnNQZk5GdmE1NENZMUpXa0JqcEk5Q2FITC9Y?=
 =?utf-8?B?SUUzdzdJT2RiVjZIZHIzdGU1RHVEQkdmNkQyVVM5ZFBMY09YLzJTd0xZQm9o?=
 =?utf-8?B?elJpYys2YnFRRmRuMHhjMzh5R3lBMVk1ZUZaeElna3diMmpCS0ZKM2RITDA5?=
 =?utf-8?B?bC9ySWNLZGVDU29Kd3BXSGxLeG1GT28wdFlPaU9zQVo5cldpYTRDYjh3VUJn?=
 =?utf-8?B?TmhVc2FBQ2d0OCtMcUxMT2VMUEJWZlpINC9KK1dPdzY5WmJOclhWNVRLaGY1?=
 =?utf-8?B?Ly82TmxHTFRMRjR0YjRmT0tEdldpQWFOa2t1M3FFcmkzcTJBVmJhU3JNazFo?=
 =?utf-8?B?UDZ5amxPR3BCVEdwTmNUVTlnbHR4NldPRHFuUmlzUEp5YUVlaHp1OUpYaXhX?=
 =?utf-8?B?VXNFR1gwTUNXV1FoS3FsbllFamk2QmpCOVV0RFRuOEZJeGZ2QVAweXNlM0Rq?=
 =?utf-8?B?R2hibmtmbXhzVndjTkd2ZzI4ZDdoWXFwQTRZZ3ZSeDZCOUlmZWFJekNxbWVJ?=
 =?utf-8?B?SnhManpXYytuSHRKM1JqTFd4VnFMb24rUks4dnBEamQ1alJvN1MwYTFpZ3dt?=
 =?utf-8?B?NklXU1M0UTlFclh2UE9SZFY2VEhNa3ZTRlJodURDWmcvamZsZUtRZVJlclB2?=
 =?utf-8?B?aUpXZTArUVRaeExxZC9IaEN4MlVxZWpTUTZUdEJLQzdQeDExYThpTEM1eFRu?=
 =?utf-8?B?ZUpoR0R2K2JjZ1BVUHMxUDAvSnlQOWdIdDgrK01reVoxbEtxYU02eDdaSHps?=
 =?utf-8?B?a1htTkZKZVlqNEVzR1ZGdXhTZTRUdmhpRHFPTFF3K1Rkb1pUeXJ4RnhhUTlM?=
 =?utf-8?B?aVBLK2ZXNE01Q0V1aktSWG1aTVNTem1uNlRMREdiTDJVbURZN0llc2I4RmhN?=
 =?utf-8?B?b0trOW5EVW5QTHZuNU01Q1FPNGlRcUVFTjR3anBTOUUxWGxOQVBSQlRNamx0?=
 =?utf-8?B?ZEhvcUdjTVBEcVB1MGJGN3RFMkx4TmlidjNVcW5GVUk5bXZOcWtyK2tqZjVE?=
 =?utf-8?B?ZmJNZWhQRHNSd1Z3M2xRbGp5cStBODdxbkR4TVU2SU84VmRPc3kxNzNBMDZx?=
 =?utf-8?B?ckdsY002NXVFV1psR1BlN3luMytoSEV0QmFMY0ViTXdtSjhPYVVaMEpSTDlm?=
 =?utf-8?B?b09Rd3ZMQVU2NnZ3ZENEUkZERldQMjYrRWxNd2xxSXFyTitpbVd6bFZRNkFY?=
 =?utf-8?B?bzlqU2s2R09lbGdaVG5IVzdjUjhBbFRCTzA2aExoNElYVEVnbHhsYVBxVWtj?=
 =?utf-8?B?UFJNVEl3aFVFTXpFbUFkcEV4WThZM2JhRk9SRlRuTnR2bWlJbnJSRnlKN2Fh?=
 =?utf-8?B?YnpqUWZxVXMrbzRqcnhVNUdtUDNMUldGdTVhUEJJM0plVTlhS3N0OGdSdmdr?=
 =?utf-8?B?ZzQ4NXYxVS9ub2tseUhKZmIvNGxkbDhaV2FnN0hhcmZBMDVIQUlraHZLSndW?=
 =?utf-8?B?T2htN1IrQXpJQUEzeTdSYXVQc3JKZjJXSHo4VExqS0ZRWTIwQ0xEVk5sN0xk?=
 =?utf-8?B?M05RVFdTUVhzNmEvWDVwWGVhSENreVVrVUFqRGtXMi9pRWoveEVBeHdOYWgw?=
 =?utf-8?B?ZzFKNjhjaGxQWjM4aHNHTjhGU3VqN3NleEdzZ01iSGZZaHU2bUlPK1Q1TGFW?=
 =?utf-8?B?OEdHbStRaGpjb09UMGw1Vys1bVRyTUcyY2lCZWhiRmZraCtIWmdCd3k2N2Q3?=
 =?utf-8?B?TjRDQkhmbFNnZVIzeHdYSXJON0hoWlp1V05nZjk2MnUyTTFSUDVoa3o4UVZx?=
 =?utf-8?B?SVR0Tk0wd1QwVm1janFCOTQwN2haUytKeWh2VGdVZFF0dnVLRExwNm1BcVIz?=
 =?utf-8?B?MkYwVDFLd2RTZWtIU3dEc01jcmQ3dU5vK1pFZm5sWkowZzZtYWxMUXhsOHNU?=
 =?utf-8?Q?66rU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e633d0-ee09-4997-760f-08dd9d433a44
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:23:42.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8TnBPCXnBGN2hl31MVzxhNEU8pkDI/IM4BI9i32HIVFquB8TIv3MLI9ssOmwrzc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417

Hi Reinette,

On 5/22/25 15:51, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
>> Users can create as many monitor groups as RMIDs supported by the hardware.
>> However, bandwidth monitoring feature on AMD system only guarantees that
>> RMIDs currently assigned to a processor will be tracked by hardware. The
>> counters of any other RMIDs which are no longer being tracked will be reset
>> to zero. The MBM event counters return "Unavailable" for the RMIDs that are
>> not tracked by hardware. So, there can be only limited number of groups
>> that can give guaranteed monitoring numbers. With ever changing
>> configurations there is no way to definitely know which of these groups are
>> being tracked for certain point of time. Users do not have the option to
>> monitor a group or set of groups for certain period of time without
>> worrying about RMID being reset in between.
>>
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as it is
>> assigned. The assigned RMID will be tracked by the hardware until the user
>> unassigns it manually. There is no need to worry about counters being reset
>> during this period. Additionally, the user can specify a bitmask
>> identifying the specific bandwidth types from the given source to track
>> with the counter.
>>
>> Without ABMC enabled, monitoring will work in current mode without
>> assignment option.
>>
>> The Linux resctrl subsystem provides an interface that allows monitoring of
>> up to two memory bandwidth events per group, selected from a combination of
>> available total and local events. When ABMC is enabled, two events will be
>> assigned to each group by default, in line with the current interface
>> design. Users will also have the option to configure which types of memory
>> transactions are counted by these events.
>>
>> Due to the limited number of available counters (32), users may quickly
>> exhaust the available counters. If the system runs out of assignable ABMC
>> counters, the kernel will report an error. In such cases, users will nee
>> dto unassign one or more active counters to free up countes for new
> 
> "nee dto" -> "need to"
> "countes" -> "counters"

Sure.

> 
>> assignments. The interface will provide options to assign or unassign
> 
> "The interface will" -> "resctrl will"?
> 

Sure.

>> events through the group-specific interface file.
>>
>> The feature can be detected via CPUID_Fn80000020_EBX_x00 bit 5.
> 
> "The feature can be detected" -> "The feature is detected"
> 

Sure.

>> Bits Description
>> 5    ABMC (Assignable Bandwidth Monitoring Counters)
>>
>> The feature details are documented in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC).
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
>>  arch/x86/include/asm/cpufeatures.h | 1 +
>>  arch/x86/kernel/cpu/cpuid-deps.c   | 2 ++
>>  arch/x86/kernel/cpu/scattered.c    | 1 +
>>  3 files changed, 4 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
>> index 6c2c152d8a67..d5c14dc678df 100644
>> --- a/arch/x86/include/asm/cpufeatures.h
>> +++ b/arch/x86/include/asm/cpufeatures.h
>> @@ -481,6 +481,7 @@
>>  #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
>>  #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
>>  #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
>> +#define X86_FEATURE_ABMC		(21*32 + 9) /* Assignable Bandwidth Monitoring Counters */
>>  
>>  /*
>>   * BUG word(s)
>> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
>> index a2fbea0be535..2f54831e04e5 100644
>> --- a/arch/x86/kernel/cpu/cpuid-deps.c
>> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
>> @@ -71,6 +71,8 @@ static const struct cpuid_dep cpuid_deps[] = {
>>  	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
>>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
>>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_TOTAL   },
>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_LOCAL   },
> 
> Is this dependency still accurate now that the implementation switched to the 
> "extended event ID" variant of ABMC that no longer uses the event IDs associated
> with X86_FEATURE_CQM_MBM_TOTAL and X86_FEATURE_CQM_MBM_LOCAL?

That's a good question. Unfortunately, we may need to retain this
dependency for now, as a significant portion of the code relies on
functions like resctrl_is_mbm_event(), resctrl_is_mbm_enabled(),
resctrl_arch_is_mbm_total_enabled(), and others.


> 
>>  	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
>>  	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
>>  	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
>> diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
>> index 16f3ca30626a..3b72b72270f1 100644
>> --- a/arch/x86/kernel/cpu/scattered.c
>> +++ b/arch/x86/kernel/cpu/scattered.c
>> @@ -49,6 +49,7 @@ static const struct cpuid_bit cpuid_bits[] = {
>>  	{ X86_FEATURE_MBA,			CPUID_EBX,  6, 0x80000008, 0 },
>>  	{ X86_FEATURE_SMBA,			CPUID_EBX,  2, 0x80000020, 0 },
>>  	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
>> +	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
>>  	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
>>  	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
>>  	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
> 
> Reinette
> 

-- 
Thanks
Babu Moger
