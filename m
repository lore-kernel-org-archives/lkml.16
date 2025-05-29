Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C461F2CCC5;
	Thu, 29 May 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748558167; cv=fail; b=dgYFcpwXktHEXpXG+KZVCp/pG+wUbngdnQU3dK3OG6HBiiexYCfq8H3QI8C9IChJKRDrb3b/Ynx5kqXPT3CbBHMomEjEzNSFXe10HXbJUTh9AF8+tS1zPikdHLBoHMY2fVf69Rq0eSy3ro76P18g85s/a5pDKZ5bjfV39aXxgXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748558167; c=relaxed/simple;
	bh=5WPuesAJlo3sjTe4cjCW3U+zctRn2v9IMarQV50HTgY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V5ci/EIje2eHoOQSUSt+H4t1AGmNB0GBThFzP2ShBwLnHojEtzjkma/IGNpJJqk0y3lh3X7ErGWw55VS35lhQAZtkAhXCbw6F2lxaGfAUTsp/sq/ain4ZdZLE1hjrP5IIH8vx7WXbi24GL3xjwHPIKIAQxEscj1ArLyZ9qwB/ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yQ1P4YHB; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yQ1P4YHB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbOOjBjrSXO17WiKtZ+tfEWsbqMFHYhIml3MMlnp2qIl2lc/GY/xBi3lE0HJraOyNth+Z7a//AoFdHlXF7moD5F9Pse9ShzZpZV2f9bhbzQqZmOURYuc1/BIAZCNl4GHEbSXSsOkRcadIbp+RBLI9mF9hoNv1oqaFoXhcmCO1IkbmH0D6IInNJ9ckemgLFZki+zfKQpxYpDSXFUxoSnQX9Obq6DB3SMT8QS3LbWrbtrHtv6L4a7o/JqlzkhB9hjHNfPeU47uCX/ZhsBKjE2TOkeyim2S7Glk7Wq7DZ3tWo4lw1BqbyWE7QIELY6TDREzk8/vJZjUFdlHF4XRO9Q2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25tldycgpFGf0e/DwvyWnluOzyEDQ7tdw8WMgtAvMc4=;
 b=uLgAPiNnTlzcDJ5b1uo7aEGRAyDcRuQOLDcXkNeJ+SIj5nPBKSyHcJADAQYZJMSla6fBXfxq5z6Pn/7CgykeHVbfinV3IdbFIkSoz5mnjMFxgxqWQ/5VXXJQ66qggXqTTmFLU4Wpjfn8DpnzWX+xVQsDtXuoIQg5/xKBCeZbR+DJkSKkf0XT+huuOTf13X0IZs2XAB6PLWfaJ3DSoBF93S3/4BDsG/2W4oxfl8Pvzk8K0LLDVUVzW2pVJ4e6YjscTveleOaUYzNQ01nnEfDpOKcHm8vBBiUfP20nuRbfh46Q4lZwcLRq6lLnQqnJ9X/CfHcYn3IcuAejXyXXbw14Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25tldycgpFGf0e/DwvyWnluOzyEDQ7tdw8WMgtAvMc4=;
 b=yQ1P4YHBjffIQbIFaM2W7iwbBW0iQvVcTcjR3EwrGE4SO1OchYv+LxzM+FgALiWKEOs9Grwgv1RtfkrFjVuEW7kR8RL5dM7KsqhsBRoPXfKYpKgodL9bSR7GTNeTx/uwl6yLOtT/NsLnLE3wapRSZgNj77R3MtjehLnMyE2zGBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 22:36:01 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 22:36:01 +0000
Message-ID: <876401ba-835f-471b-b059-60dad65abd54@amd.com>
Date: Thu, 29 May 2025 17:35:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 20/27] x86/resctrl: Provide interface to update the
 event configurations
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 <ed1ae013a2aa8216444d1b716a1bffc7979a8883.1747349530.git.babu.moger@amd.com>
 <32b93fc9-db36-459f-8b8f-ac38cc156837@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <32b93fc9-db36-459f-8b8f-ac38cc156837@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPXP152CA0003.LAMP152.PROD.OUTLOOK.COM (2603:10d6:103::15)
 To MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH3PR12MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: ed46d911-2d48-4524-3662-08dd9f01301b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTJCR20zd1kzZVVHWi9udTU4ZDJjWUc2RURrNStTeHZwNXpkVmhQK0R1ejFF?=
 =?utf-8?B?RmhBR1VWMWh3NmZOWlUyc3BhSnB4dUhhWG53alRieTlpbjZuRVdXSU5aTWIx?=
 =?utf-8?B?U2hvS21MejBlM3JZVzh5K3BNd1hqL2tnQ1lXNm53bldQM0JjUnVhOGE0R0wz?=
 =?utf-8?B?L0grbzQ2YTIvRzU2WlFKSDdIbCtSc1R2TnNHSXZDcmhqYWFlQXE3emU5dDdD?=
 =?utf-8?B?RStwUkRxOUFzQ3Z5K0ZnelhtWW1HUXYyQ2lpeHVPbmxGanJZU0xLQysvRDZI?=
 =?utf-8?B?TzR0ZDV5NEd2RE4yR01NV1M5Umx0YWdyQTBBcUluY0xqbTJJRVV6cElnUGp0?=
 =?utf-8?B?RWNOVEtTSyszcnNOci9uT1ZYMm5CazdiTUZiOUJCR1k2WDFQcjlmUStGVnRx?=
 =?utf-8?B?ZHIyZzB6RjZ5Z2pNbExLWjB4SmhSMG93SlBHUzRHOFM4WHJ4bUtoREplazZY?=
 =?utf-8?B?T1RTeDNmME1ic2VYQ21FTlF3TldhaWs0MVpRZGZXRlJoMlA4MjFLbzlNd01o?=
 =?utf-8?B?aUs4RU8vYmRJN2xrWjcvL1UzZGVmS05qMnJ0R1Q3QitKS1EyZE54UXlLQm5U?=
 =?utf-8?B?ZGE2SnhQTzlMVkdFekJjUVVaZzhtSWhQZlhXcUNvRHVNRlJGV1pteEZpd2dh?=
 =?utf-8?B?NzlmRENuUTk2NWVBV2hUc2hXMXVlcE9IM0tsWDJmUWZWSW1QRDBtdHFVMUlI?=
 =?utf-8?B?c2pZdkNTSy81eVUvYm01YXlJZUhJVVVOVzU5ME04WWhKSVF2cndicnJSUkl3?=
 =?utf-8?B?ZWF5U3VZZkJhZkJQb1ExbUtiak1xUUpuYk8xU0VuWGV6NzAxMW1Id2xoazR5?=
 =?utf-8?B?OWFBN25WVS9CYkZVOEZ3TCtJV0F0eittclBUeEZXRWdrNmtWRGlhVm02M0ZI?=
 =?utf-8?B?a3ZZMk5EelIveVc2SlZnSlp5YVo3bnFCQkZhZDhFQVdLdkNUNjNvWDcvTlNM?=
 =?utf-8?B?N0wzUXArTTg2Nm9oZTFtMHU3dDRlcnYrSnZ3T2VvYmNQZmpqK1BjajlWbXRo?=
 =?utf-8?B?VFZWVjVJOExpVjlkbzN4UEdNakk4WWs1ZngxUTBXK3E5RFVEb3hPOUorb2xC?=
 =?utf-8?B?UGxrWEgvaWVjL2ZEWC82MFk0dkZPMEovV0NEVk5CUDV2ZStsN0ZLYWZxSUdP?=
 =?utf-8?B?b1pJRk9lV3lqM3lPSUdaY2JvNFcyalBmUzdMWTY5NWxJTWVzeGhvbWw2UkMw?=
 =?utf-8?B?a2htWG1BRVRyWFNBeDJhNitzVnNTMGRmRE8wMjN3cHVLbmdVWU50NDhrZlZ0?=
 =?utf-8?B?bVRmUHQrMzFwcXFFL056eFgzKzVsM3BNOHRVVFM3V0ZWVlZ6Z2k4VmtRUjd4?=
 =?utf-8?B?ZkY3Qy9IYVlSamJZVUxNTkhTaUJFa0oyaGVLb2YzeTBlUTUzbjlZc0pOaDFN?=
 =?utf-8?B?SmYvTXRmM2EzLzN6MThVOW1lcU5BUXpFQ3FSR0Nod2Fqd1dZY0x4RnRKRWVV?=
 =?utf-8?B?d3ZyUGg5cS9QL05KMjB4andYeWc4NXg1a3hEVkttRXlHM3o2Wm50SlFlQ2R6?=
 =?utf-8?B?Y0NzbFpxN1N2VGRlQlRlMkFKRXM3M3ljVE9jWGpUR0ZFNWpMUzBLTksybVBM?=
 =?utf-8?B?dUNWeWw1dVB5azFiM3hNSzhseUxlMVBIVDNzZUt1K3ZqTnhYenQ5OTg3MHVE?=
 =?utf-8?B?M01Kc05ERDAzUHJuYWlYZmhCZG42UTc4WWovK2hqRVVTMVNnV1NTcndMYzZ5?=
 =?utf-8?B?NTBzQWk0QldtcUp1OFlpRDJ4WVhlcU9JK1Q4Z0hMUitXOSt1ZW5Pd21Ob1Fj?=
 =?utf-8?B?N3BrK1owZnB5S01OSnZ4WGhnVUxXQWQ5YUN0Qm1KZGF1WE16bEZ5d1JNUm1y?=
 =?utf-8?B?d3VCeVBsRHhHc2tVN29STzcvT1d5Sk1VUU4xVStEZk8vRWZRWjNJM3NyV2Jj?=
 =?utf-8?B?QXllVllxWUEwaFdzUURrS05JMnJ2SHNjeFZUK2F3MGlUUngvRTRQeHNCZWcr?=
 =?utf-8?Q?9avltSQXa8s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU41VWZxZGJ4dmFvSXcyemF1RHoyMFpGUXdvS3U3ZjZKaUZobTZ0OHo3am4v?=
 =?utf-8?B?cXl6Y2ZnZGo4Q1U2a05RNDIycWorZzh5ZDczcFFDcHRaWnc1OWNRUTQzdDBL?=
 =?utf-8?B?ZTdSYjI2Mk1HYTA4TnllazNDL0NybkwraCtMTjI3MVAxYnhjOHFmZ01oNXZK?=
 =?utf-8?B?VkFZQmFTUjQ1RmxpeDJKaC9nUEJDY05KM1pROWt4U3RhUnR1TmtRam4vS2JE?=
 =?utf-8?B?NnpEaWxjTWpodVgzWVN0SEdTWXRwZW9jZFZsU25mKyt4MnNpNmlGY1pyY1RG?=
 =?utf-8?B?YlFlMVNQcjR4VUVPUHhsNFRuT0pXQ2h2bndBc3BNTlFma1hoeVpBNEc2a3Mw?=
 =?utf-8?B?aEtjUE9MTHIycmRLemlSNnNHZkNLd2tPdnVQNWs3bEF2UzFaY2wyOEJ4ajVi?=
 =?utf-8?B?UGN2VVNjaS9VektlTzd4T3dSOGJmZXZTcTZYOUhrWDFDWTEzWjRJemFKQjMx?=
 =?utf-8?B?T1ZERFJxeXkxL1VpNHdrK1lzb1hjVFpMVm8xcWNKano3S2p4RDVXSWwrclFK?=
 =?utf-8?B?aFJCU2dUNjljWHZKcXMwTUg1bGxCNS9MSHRaZStmOHk0b3ljSFErZTdoU2Zt?=
 =?utf-8?B?RlpUMzVvSjRXZCtYOEJjajRTa0hVejlLN09BU2NkaVIzVnd6Y0tQQWFENWRq?=
 =?utf-8?B?RWpTU1VuMTFnc0t6ZW9WSTUwVm50Y0kzclM1MFBxQ0E0c0I4VjUxWVJJTUQr?=
 =?utf-8?B?NDc3TjlLTjJqZllscDJyYjJUVTgyVFBqVTNNRUFqb2xYdFNBYVhJMEQ4c2I5?=
 =?utf-8?B?NldyT2ZBdnB2d0lYV2p6eHNFbW5iTE9waHh2NnQ4SGs5ZkNiVHBDMlFzVU1E?=
 =?utf-8?B?S21EdlpMYnVmaUh6aUZyN2YvbVlVd1BEQ3k4UDNUNmk5ZDVOMVlSU3RWOUtL?=
 =?utf-8?B?bHBIZ0RWdG5CbWRIdi9UMHRyQmYzdGc2aHJkOGFSb2REdEROQ2Z0Z3pjOGdl?=
 =?utf-8?B?eG5zNkZSeGcyV3J4R0NITHhJZmFOcWlxUVRabjBZOVprU3FtMHI4MXdvN1Fq?=
 =?utf-8?B?UkdRU052aG00STFVbHMwQ0tQN045L3ZqV00vNEkxdUdwcmxTcW05S3F0bkl5?=
 =?utf-8?B?Mkx5bS9tQzl6MjJtdHBycjFRMVUreEFscW9TaEk2cXZaTVhTL1J4NTRVZWlX?=
 =?utf-8?B?d0dXVit2dUYyOGJ1eFZwWFczWGp4TmIyb2MzVjZnbXRQU3Vubk5YSXFBU1Rk?=
 =?utf-8?B?OEZUbVY3T2JjUG5mQzBvNCt0R2NPUG5lR3BwUi9DN0IyKy82NmVqdTNPR1Js?=
 =?utf-8?B?K2JjS1ZKdkYrKzAwZVFKNy9PMXhJS3VYNTdFK2Q3Mi9CZlU1NUtOT2YrZmFO?=
 =?utf-8?B?c0QzQVkvZGVjRTlWdEtYMWhpZWdNM3BpYS9HVFJEWnhNenpTZFFuMDVUOWVT?=
 =?utf-8?B?aThNZ29oZUlQQjQvdFlQMXZnbDBDaVhmcmtJTFFLbncwNlpuQmpyVDNWbnRU?=
 =?utf-8?B?aXIxWC9DN2MwM2VRekc2M0dxWkF0V1hySEQ1TnJTanZWZmcrV3FCK1lFZG1t?=
 =?utf-8?B?NzMxeVpaazJvM01hU3RuUlN6a3dHakErKy9zNEhnR0hSOVBhSnppNis3dE56?=
 =?utf-8?B?R2pubkxGZHJYbDZQY25xUlcvYmY0ZGJ2VkJqZ2RYa3hUTFBBdVdxK2F4VW81?=
 =?utf-8?B?OTVKczRRWDNVZURqekYyYXB1RmpUVGJvRUMxS0ZQUjhuMWR1WGU0bEpXdm1l?=
 =?utf-8?B?YXR3SnkvMXpQbjhKQkRiblpOc0NiSmttRFphRS9CQlk1N2E2bmxmVXltQVJP?=
 =?utf-8?B?V0xhQTZmb3pReGRpcWNjdVBLb01INTgwa1RyYkFKWFdUUERRdjB3bXZnL1ZM?=
 =?utf-8?B?QUcxSCsxRXNsaDBlVUE5SGJoRmdYeEZKNzhJcWpBY0c4WWVmYXU0ZlpWS1lD?=
 =?utf-8?B?MjJ6SnZSUEFxZXZJSitXSWRObFRmWjVJcmN6eFBYU3JHZm9kdVhvVGkyZUYx?=
 =?utf-8?B?ekV3S3BEdVAxSzB4VVZndklNMEdKNXFYS0ZvSnk1KzNmZ2xwTVA5Mk1ER2Nn?=
 =?utf-8?B?UU90RDBRb0NzNENlY0hPTUI4bGFSU05GOGZaZjZVUlJHWkJteGg3OEk0MDJS?=
 =?utf-8?B?TUE4YXlET0FDdFE1cm41RlQxSmphbUZvZkNvQUtJRTd6SENZVnRKcGhtNkNQ?=
 =?utf-8?Q?1gOE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed46d911-2d48-4524-3662-08dd9f01301b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 22:36:01.0755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAgZB5ada8ijnfLz0fVgAiNITTloTEESfZI4V/iy6+q7tEGYbBy66pLqYaHTJTOt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028

Hi Reinette,

On 5/22/2025 11:45 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:52 PM, Babu Moger wrote:
>> Users can modify the event configuration by writing to the event_filter
>> interface file. The event configurations for mbm_cntr_assign mode are
>> located in /sys/fs/resctrl/info/event_configs/.
> 
> heh ... looks like you also started thinking that "event_configs"
> is a better name (also missing L3_MON).

Interesting... 'event_configs' seems to have made its way in somehow.
Alright, I’ll go ahead and add L3_MON."

> 
>>
>> Update the assignments of all groups when the event configuration is
>> modified.
>>
>> Example:
>> $ cd /sys/fs/resctrl/
>>
>> $ cat info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>    local_reads,local_non_temporal_writes,local_reads_slow_memory
>>
>> $ echo "local_reads,local_non_temporal_writes" >
>>    info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>
>> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>    local_reads,local_non_temporal_writes
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v13: Updated changelog for imperative mode.
>>       Added function description in the prototype.
>>       Updated the user doc resctrl.rst to address few feedback.
>>       Resolved conflicts caused by the recent FS/ARCH code restructure.
>>       The rdtgroup.c/monitor.c file has now been split between the FS and ARCH directories.
>>
>> v12: New patch to modify event configurations.
>> ---
>>   Documentation/filesystems/resctrl.rst |  12 +++
>>   fs/resctrl/rdtgroup.c                 | 120 +++++++++++++++++++++++++-
>>   2 files changed, 131 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 4eb9f007ba3d..9923276826db 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
> 
> ...
> 
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index cf84e3a382ac..8c498b41be5d 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1930,6 +1930,123 @@ static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq,
>>   	return 0;
>>   }
>>   
>> +/**
>> + * resctrl_group_assign - Update the counter assignments for the event in
>> + *			  a group.
> 
> This name is very generic with an unexpected namespace. "rdtgroup_" prefix
> is often used for a function that operates on a rdtgroup. This can thus be
> "rdtgroup_assign_cntr()".

Sure.

> 
>> + * @r:		Resource to which update needs to be done.
>> + * @rdtgrp:	Resctrl group.
>> + * @evtid:	Event ID.
>> + * @evt_cfg:	Event configuration value.
>> + */
>> +static int resctrl_group_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>> +				enum resctrl_event_id evtid, u32 evt_cfg)
>> +{
>> +	struct rdt_mon_domain *d;
>> +	int cntr_id;
>> +
>> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>> +		if (cntr_id >= 0 && d->cntr_cfg[cntr_id].evt_cfg != evt_cfg) {
>> +			d->cntr_cfg[cntr_id].evt_cfg = evt_cfg;
>> +			resctrl_arch_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
>> +						 rdtgrp->closid, cntr_id, evt_cfg, true);
>> +		}
>> +	}
>> +
>> +	return 0;
> 
> Can just return void?

sure.

> 
>> +}
>> +
>> +/**
>> + * resctrl_update_assign - Update the counter assignments for the event for all
>> + *			   the groups.
> 
> Again very generic with "update" and "assign" that seem redundant? How about
> "resctrl_assign_cntr_allrdtgrp()"?

Yes.

> 
>> + * @r:		Resource to which update needs to be done.
>> + * @evtid:	Event ID.
>> + * @evt_cfg:	Event configuration value.
> 
> Why are both event ID and evt_cfg needed? Could just passing mon_evt simplify this?
> 
>> + */
>> +static int resctrl_update_assign(struct rdt_resource *r, enum resctrl_event_id evtid,
>> +				 u32 evt_cfg)
>> +{
>> +	struct rdtgroup *prgrp, *crgrp;
>> +
>> +	/* Check if the cntr_id is associated to the event type updated */
> 
> Comment does not match code.

Will correct it.

> 
>> +	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
>> +		resctrl_group_assign(r, prgrp, evtid, evt_cfg);
>> +
>> +		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list) {
>> +			resctrl_group_assign(r, crgrp, evtid, evt_cfg);
>> +		}
> 
> Unnecessary braces?

Yes.

> 
>> +	}
>> +
>> +	return 0;
> 
> return void?
> 

Sure.

>> +}
>> +
>> +static int resctrl_process_configs(char *tok, u32 *val)
>> +{
>> +	char *evt_str;
>> +	bool found;
>> +	int i;
>> +
>> +next_config:
>> +	if (!tok || tok[0] == '\0')
>> +		return 0;
>> +
>> +	/* Start processing the strings for each event type */
> 
> Does comment intend to describe one iteration or all iterations?
> Also, "event type" -> "memory transaction"?

Sure.

> 
>> +	evt_str = strim(strsep(&tok, ","));
>> +	found = false;
>> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
>> +		if (!strcmp(mbm_evt_values[i].evt_name, evt_str)) {
>> +			*val |=  mbm_evt_values[i].evt_val;
> 
> check spacing.

ok.

> 
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!found) {
>> +		rdt_last_cmd_printf("Invalid event type %s\n", evt_str);
>> +		return -EINVAL;
> 
> Looks like this will return partially initialized data. Please use a local
> variable in which to gather the new configuration and only assign that
> to provided pointer on success.

Yes. Makes sense.

> 
>> +	}
>> +
>> +	goto next_config;
>> +}
>> +
>> +static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
>> +				  size_t nbytes, loff_t off)
>> +{
>> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
>> +	u32 evt_cfg = 0;
>> +	int ret = 0;
>> +
>> +	/* Valid input requires a trailing newline */
>> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
>> +		return -EINVAL;
>> +
>> +	buf[nbytes - 1] = '\0';
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
>> +		ret = -EINVAL;
>> +		goto unlock_out;
> 
> "grep goto fs/resctrl/rdtgroup.c"

Will change it to "out_unlock".

> 
>> +	}
>> +
>> +	ret = resctrl_process_configs(buf, &evt_cfg);
>> +	if (!ret && mevt->evt_val != evt_cfg) {
>> +		mevt->evt_val = evt_cfg;
> 
> ah ... here it is. hmmm ... but it is mon_evt::evt_cfg, no? ah,
> fixed in next patch.

Yea. My bad.

> 
> I still seem to be missing something because I expected mon_evt::evt_cfg
> of mbm_total_bytes and mbm_local_bytes to be initialized with a starting
> default. I missed where this is done in this series.

Its not done in this series. Will do in next revision.

> 
>> +		resctrl_update_assign(r, mevt->evtid, evt_cfg);
>> +	}
>> +
>> +unlock_out:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret ?: nbytes;
>> +}
>> +
>>   /* rdtgroup information files for one cache resource. */
>>   static struct rftype res_common_files[] = {
>>   	{
>> @@ -2056,9 +2173,10 @@ static struct rftype res_common_files[] = {
>>   	},
>>   	{
>>   		.name		= "event_filter",
>> -		.mode		= 0444,
>> +		.mode		= 0644,
>>   		.kf_ops		= &rdtgroup_kf_single_ops,
>>   		.seq_show	= event_filter_show,
>> +		.write		= event_filter_write,
>>   	},
>>   	{
>>   		.name		= "mbm_assign_mode",
> 
> Reinette
> 

