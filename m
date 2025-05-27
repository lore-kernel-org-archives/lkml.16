Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AD11487F4;
	Tue, 27 May 2025 20:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748377323; cv=fail; b=FRbWJ7TKGcOriGI/T7KkKcb2rv4xt9lYQb+eXqD2QPtwazelNVIP5WP2/kvlIDYbZvEoJ9v76wDTEbRaedY89fQfgpW8yFMKBx5M72+pPdFdWD0hfuiH7HImGFWBFjAXiOxJOKvEwrpqD49OA1HA/zn5orQmtZDGjqZjVCAyjd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748377323; c=relaxed/simple;
	bh=UrlgopsihYUApVXDDh/Dup3WMOqHznUx8McRBkbLOjQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=esX4GOWmo+dOCYbDD0YjQFWMytGZkQJslQO9BaDchGuxfRwi2oNif/5HHwOPFJvvy1RIQfQ1G3I07Nsp437KmL+eUU1FzbwP33EqvHbo2Jac5G87Mz1HVjfrDqrrgoVWgNHu7KdvdRm5XC2HDvTSbdmvkC3++tj1cM2XAPe2Edo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3iS03hb9; arc=fail smtp.client-ip=40.107.220.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3iS03hb9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGGa1Pg+I6aQx+UJCtcIyFiC8zz7c7NJFCbENSkiuVvhKOctL46raLL//h+XOSCcwo+AQq8SoJH6ECTyIScBTbzS1OeVvE0Sv8ifI+xK8Lz8oELgSaDXBHCcPvIVNz1niRhWjyYOwOb+RfFI7U2LF1JIMc0QRxXHbIY5SKmB19iOcP3/dO2aVekacPMSk8snHd45IDv89qS7XXOlcwR1JtksK03iv489MkIwb0x+vk06s1Q4sYI/OdJjAhrUyUN/2jdnAb7ZAHJemOGEMPsuzkojzEHOhMDBt/czo5bWeD5wdm3ReemS4BDyrkJiRJ4kwmXI/9sLacvqIrF3ldiFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpFv0rcRnLeehBVwjB49KLpMVkh5b/pj6CGFw5P76s0=;
 b=Qh9ACPZyphsC0KTVs8CVGeRnEDZqhj1+S9aHHkVGK/l5DNQqzS9kbygmv9IhAyfEsDm2ov9WAn2grMyGMXrLqUrb04HCdVf4kMVBoC90rEAlwCv/1NAfvvWJgHEoAEW+8vMXMhew5Gc6rVlTVQTK3FAIhC+OiYvYjNvexbKCBdqEBn4HOWeBtYnS6JLEDFWPSTmPGEan1D9QSabLXJqjHVWnGl2lZbvsf7ffCmoTchi9aDfNdxCCRFnLPKwo0ILIIz1lVbwskXgngHMcUzrzzU9HBF/Bs3U46kBnRsMbhUZL7RcwpjZlP+s93+iEoy/CWYwaiwQhQ0TP9RSXZy9Q2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpFv0rcRnLeehBVwjB49KLpMVkh5b/pj6CGFw5P76s0=;
 b=3iS03hb9t7+GHK5L0QkBaCZSgVlRPLvc6d3aqYGnfPa2GFCxC06zHPXAlXxUMSJk+6mW73buTflPyMo4sokd2uIt8WGAYBZs3rLFrKsFRL3FzO6mNvwwF/Imp6mMexjWD2liq63+TH9gKcUmtkGA2aP770Ls3CDVaJ9/Ohwk75Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DM4PR12MB6301.namprd12.prod.outlook.com (2603:10b6:8:a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 20:21:57 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 20:21:57 +0000
Message-ID: <cea0d707-743d-4e17-80b0-4ba6c4930132@amd.com>
Date: Tue, 27 May 2025 15:21:36 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 05/27] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
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
 <e7d0c61696b8f1fcfe9e520b4b41fdd3a624878c.1747349530.git.babu.moger@amd.com>
 <eb4f459c-cdf6-4ca7-b6dc-7e2d0828505c@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <eb4f459c-cdf6-4ca7-b6dc-7e2d0828505c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CP6P284CA0037.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1ac::13) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DM4PR12MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c4bab0-4a9a-4a1d-4bfe-08dd9d5c20e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y05sbnF0TE1DNHBlcDFkYm1oRnZlbXN6R3BNT0dXSjZHamJ0WVJBMUNTT2Vp?=
 =?utf-8?B?dEpEMTQ5ZXp4SHpwRjVOWFQ3cU9kNGNGVmVoVW9pSUFBZWg5VnpWTWUzZmU3?=
 =?utf-8?B?VEdtTURjWkdPMGNKMXlSVzJ4MVNYVUN6WmwrMUhDeHJzKytFRUVHVHp2Szdi?=
 =?utf-8?B?OXR3ZDlIM05nZUxnVlREdXF5ZVdWd3ErY1RqZU93RWZPZElvaWYrcitBTEl1?=
 =?utf-8?B?UnBrZlQxL1poaTlvRFlGRm1zVWdnN3pWSXdWdjFjRWYrelBQV1ZXV0liUEsv?=
 =?utf-8?B?QkpOQXJwM2pOZWljMkdvNGJVVStWa1hGQmJWeW1UWjFETzZRQThqTGRLRmFN?=
 =?utf-8?B?N1VxdkpiTnRDODFKdStFV29CdWY0ZjVFWUJCM2d0WmM2NThMakRha3FXR1R0?=
 =?utf-8?B?Uldwb042RlBjSkJ0ZGFhV0Noay8yZjVhQkl6MC94bjl5VnhEVW9rWW85NEpz?=
 =?utf-8?B?RTEraFNOcHREc01KS085MVZZaXo3Q0dyTWF2MWZDRXJDenRxT1pxQlZ4QTJU?=
 =?utf-8?B?VGgrUzlZZytBTnhETGdDN2R3NnovaG9zWS9wNnFxZ0MzMWZ6dU05SU5ONWR3?=
 =?utf-8?B?TlQ0SWY1RUY2MWNsV2FXdldPZlRjb0dReDhGbEVGZ3FvMjk0Z1FrN1o0K1dm?=
 =?utf-8?B?WmpFcUhKT05mZ0NVYVBCTXFFNktRcyt0K2IwYTdKL05nQ0JJTmRyV3piY0da?=
 =?utf-8?B?Mk5Uak03UGJ4NVNRdEJHRWoydjZkd0hlclpKbXUzN1M4TitxOStNazIxaEhS?=
 =?utf-8?B?L3c0bHk0a1FvcGhhMlhCa0I2WVROc1N5TVFYMGpXWGo3V3dzajAxZEhJMzNK?=
 =?utf-8?B?c2FLQkc1RnZCTTJ5TlZEa1lMOEFMU2xmTnhpNER1eFhpOE42aWNZSnJQMjBW?=
 =?utf-8?B?YlNsZXBYUThPeU9lc0dxS2d4dW8yZmQrd1NTaUs0RDZOMS9PWUdtZkgvcUJC?=
 =?utf-8?B?Q1hKZUlHUHhXSFRIcC9RaTdUT3JvRXhYSjhVWENTMllLeDF5ajNiQ3huR2pN?=
 =?utf-8?B?WnpWbHJSOUF5MFFwSG1WSUdmeGV5WlpWMjN2SjBBekx1RTFaa1lDWUFVQ1po?=
 =?utf-8?B?MGRDYWlCdkJ0cWpkUHFSR0VTRW8va2V4RjQ1SlNVOTFpRTNVRzhlOXJCNjNS?=
 =?utf-8?B?Z3FQZnhIN3AzS0ZnVUVQR2JtNjVhZlgralVuemI0N1ovY1lDUVlCQ3lNamZL?=
 =?utf-8?B?RWxVbFZuSDFOWE1BZU1hT3ZUMUpKTS9LTWFWL3MxUmdEdGk2aWFhYzZFQndS?=
 =?utf-8?B?SlhYb1M5aVRjcG1ENlpTN0FiN2k2bXpJQzgrNjZnNGhSSzRxQysyUmlZRGV6?=
 =?utf-8?B?R3R2czhyQitwcWs4ZVFWZ0RMcnU2SlNGUXluT3hSNUx2YjhGSlh2cUZadHBk?=
 =?utf-8?B?V2ZINTlRb1lqQTVJVzZXKzJJY2VhSmFnaytzNkdzS0JmNzZkdzY1TFNleVE5?=
 =?utf-8?B?YTQrd2JYSE9uc3Q5bS9RNVJ4WTNBRnM5bWZNSkRKMkJhR0RUb2RBeFlWeEVx?=
 =?utf-8?B?U0NsM0oxRUJ3ODI0RndSRjk5WStUd1NNWGN6SEtOVkhBeXB3VFR4WFJKaGFG?=
 =?utf-8?B?ckt3Nzg1MVk1SVFLdkhld3k3Nm5zcGpZWFFrbUFHMk52T0ZxU1NVbXIvVjJa?=
 =?utf-8?B?Y1h0eUVDaVY3S2N2M3UySVE0MTZWSDRFOXBPME9PMVV6aUsrWGhJeGRCSGZF?=
 =?utf-8?B?TG51cmR4NXh0YUNodG0rMEZUSHpHa3RrTm1waEg2S3FPQlY0L3hyZnB0elF2?=
 =?utf-8?B?Wlhnc3BYT3ZydFlUMmNmczhzWmdPR09Ed2hHcU5Tc3lIVUtMZW9Pd3A5ODJB?=
 =?utf-8?B?T3B5TS94R1FDWVBhOWprRzVMTGZoZUJPMlhHRFZYcUFLVm5xYjl5em9WNitH?=
 =?utf-8?B?LzE2ZU1yczI0Vnhpdjk5VWlYa3A2cE5RWXU2WDBZeEVQVkUxTzQxdU4wSWRi?=
 =?utf-8?Q?domn4rafxdo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDJOSk8wRm1ocjRxMkFNOWN6S2taeHRhWHlWTEY1S0lGOVRFdDFaWnVMYkpX?=
 =?utf-8?B?dkw1NEJ4VlpNZ2dyQ0YzWDZSUlE0M2J3QUNyb2grUDlZQmVGaWJzUWVKVE9H?=
 =?utf-8?B?QWppcGN0YjNxSVp4TWpzVnE2MUtZa29YSi8wTnJwcW5WMDkzcTdGcTZ1eHpU?=
 =?utf-8?B?b0lHUkR4YUYyQnRZWjRBNjhGcFMxTGxmRm9aUGR5dHY4bmt3bEhaS1lDWTdR?=
 =?utf-8?B?a0FGYmVuMS9YM251aUhhcEpzM0pBVEJ3emZVSHdGL1lRMGkwL3FKYUxBWjZx?=
 =?utf-8?B?WTV6WkNMbjVHQ0hVa1M1ampWWlp6c20zK2JYSzNHRTRFQzdoTnN0cit4TlRF?=
 =?utf-8?B?Z1ZRN0xUc2JTS095dmFjeTV0MHRlL1EvU2pVSWE2TmpyZzFVVG9wWXlSaVJr?=
 =?utf-8?B?TytTaXNIY3lMUkoxNzI3clNOUTkzdFFySERGaGo0b2lLWGRXQUdNb3RXTmZX?=
 =?utf-8?B?bXoxK0xjdEtxdWovb2hudU9NWm9IUVRFbDdiOTF5WTc4L2ZGRUxuNkQ2VFA5?=
 =?utf-8?B?UUh5SkN6d3lkdmcxQnhxc1ZhTTl3eUg0NWoxb1JpZWE1UXFMV3VzTjJXU1Jq?=
 =?utf-8?B?bmZldDFVSlRHQ1VSU3lGSDM4ZC9FV1JSdWJlNm85SzB0RU15UU5SMG9OSG1y?=
 =?utf-8?B?cm9jY3JzbWlyak4wS1ZTUlg2OEtRRkxLb1dpNFUvaUlrc21xQk5sS2NKL0Np?=
 =?utf-8?B?WkFRK05WSlBTZ3JGU3k1TE91emhFbXBNT1krMmI4Nkxsd2p6VGpjc051RU16?=
 =?utf-8?B?MTJIRjZZZ3JUSUtZQUhIbmV3MHdhWURWZTE3ekgrREE5UzNKYXFoRTVNd0dP?=
 =?utf-8?B?a0lhano1cHlSWTdXZWJQVExld3FiTjREdi8vcUsyNWMvZmk4UGk5VmVuS2xw?=
 =?utf-8?B?VjJET1UzcUwxZ1VlMVFQdEt5WERIYk1jbjF0a0FraDBYQ04vRU9HNFB0cEph?=
 =?utf-8?B?NlJFU3lsSjlpeVdkV2xaWStZMjZwU3paei90dW1CSWkyMnAzWGxITkZ5ODRk?=
 =?utf-8?B?K2szcmsvNFdyTjhuM1ZCb0F0Y29EdFg5MWdsL2kzTERFZENzbzNYNVNLV0VN?=
 =?utf-8?B?Qy9kTVQwNm5lVGNlRTh0d3BlV2pFUUxUOXROdEJlU3RlQnNXazZmQzMvRktD?=
 =?utf-8?B?cFk1dFNLdEV5aldCalRsb3VpeUNhSFgrdzdQS295NmpGVlRRTllRelIyc3h0?=
 =?utf-8?B?SFJyY0dwbDBIM1Y3WEk5NndyS3c1MjltRzNTTk5YUjlGOC9zOHBXY3R1K0ZW?=
 =?utf-8?B?dGF0VkR4L1EyM3pPY2QrbFRObmRaU3c2ZTdQdjNSWkRUN0hBSHNPVGtERW1n?=
 =?utf-8?B?VDNqdnV4Vm5TSjQ5QVNkaGw2NnpLUHZEdUJIS2VyMWV5bVIvRW1mYXdNOTYx?=
 =?utf-8?B?djRtYjA2Y3IremJTOGJiTU9tRmNDK3RHY2xBSTdVVXlSLytENFUzQ01Ba05I?=
 =?utf-8?B?VnFDeHZYVU9vSnNzYlVQcktDcFpMOE40a0l6ZzArNUQrNHNXbDZnOE1WbFU0?=
 =?utf-8?B?U0tWb20yMzQ2bW5IQ3RCOTZRYzFFbVV3OU5rZmxhSFN1VGRJMHkrRlZQNGNq?=
 =?utf-8?B?VDRXaS9iaWlNY1JabWMvV3RHdUJPYVJ6bUJ6VUxydHRxbm16eGVZVFZFazdi?=
 =?utf-8?B?MVZWYkx1bDBUOEF4VzZlcGJDWHRiWXpjQlQxekordDBaTkxsT0c2NXd1RXNo?=
 =?utf-8?B?WW1kNitUZVJYbGVETkMzVklzbnVNV0NqaGpNZy9UaFN3bThRSi9qUEx0LzdX?=
 =?utf-8?B?aWpSZXJwaGlXdStYSGVONjZFbkZUNVgrNDNoNk9qNjZTVzNySlQ3Y2dYWWJ2?=
 =?utf-8?B?RGlBNERvTG9aZHlHcTlhcW4vdExxazlpNXNMRGxRNkFuR1d1MHl6Q1VVeDNl?=
 =?utf-8?B?dzVFRDRJeS9uSE9EQitRQzZwL0x0d1BBN05uTUZRRVViTFlFd0Zsb29VSnh6?=
 =?utf-8?B?ZTBwS3hDeUFRZDZXK1hoOHlja2lTVS9yQzNGRjNMOEtVeDN1Qkd3K3ZUcm5V?=
 =?utf-8?B?S1dWdDM1UllYT1dGMHZXVGk5QlNOamhobDJGRWoyeTdzcXlXYkxIK2taSnI5?=
 =?utf-8?B?R0dxUjlaWnZSaVVEbTNaZjdrSFNRTEkrZS8yRFdwTzBhakFaeUpnOUVKRHMv?=
 =?utf-8?Q?R1Zk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c4bab0-4a9a-4a1d-4bfe-08dd9d5c20e8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 20:21:57.4590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Svqy+aUP6nbjjZFyhV8wjgmICikm/OWNjnRYHiqZYukkwBN0UhXptEXW89ybCLgH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6301

Hi Reinette,

On 5/22/25 15:56, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
>> Add the functionality to enable/disable AMD ABMC feature.
>>
>> AMD ABMC feature is enabled by setting enabled bit(0) in MSR
>> L3_QOS_EXT_CFG. When the state of ABMC is changed, the MSR needs
>> to be updated on all the logical processors in the QOS Domain.
>>
>> Hardware counters will reset when ABMC state is changed.
>>
>> The ABMC feature details are documented in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC).
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  arch/x86/include/asm/msr-index.h       |  1 +
>>  arch/x86/kernel/cpu/resctrl/internal.h |  5 +++
>>  arch/x86/kernel/cpu/resctrl/monitor.c  | 43 ++++++++++++++++++++++++++
>>  include/linux/resctrl.h                |  3 ++
>>  4 files changed, 52 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>> index e6134ef2263d..3970e0b16e47 100644
>> --- a/arch/x86/include/asm/msr-index.h
>> +++ b/arch/x86/include/asm/msr-index.h
>> @@ -1203,6 +1203,7 @@
>>  /* - AMD: */
>>  #define MSR_IA32_MBA_BW_BASE		0xc0000200
>>  #define MSR_IA32_SMBA_BW_BASE		0xc0000280
>> +#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>>  #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>>  
>>  /* AMD-V MSRs */
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 5e3c41b36437..fcc9d23686a1 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -37,6 +37,9 @@ struct arch_mbm_state {
>>  	u64	prev_msr;
>>  };
>>  
>> +/* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
>> +#define ABMC_ENABLE_BIT			0
>> +
>>  /**
>>   * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
>>   *			       a resource for a control function
>> @@ -102,6 +105,7 @@ struct msr_param {
>>   * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
>>   * @mbm_width:		Monitor width, to detect and correct for overflow.
>>   * @cdp_enabled:	CDP state of this resource
>> + * @mbm_cntr_assign_enabled:	ABMC feature is enabled
>>   *
>>   * Members of this structure are either private to the architecture
>>   * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
>> @@ -115,6 +119,7 @@ struct rdt_hw_resource {
>>  	unsigned int		mon_scale;
>>  	unsigned int		mbm_width;
>>  	bool			cdp_enabled;
>> +	bool			mbm_cntr_assign_enabled;
>>  };
>>  
>>  static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index fd2761d9f3f7..ff4b2abfa044 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -405,3 +405,46 @@ void __init intel_rdt_mbm_apply_quirk(void)
>>  	mbm_cf_rmidthreshold = mbm_cf_table[cf_index].rmidthreshold;
>>  	mbm_cf = mbm_cf_table[cf_index].cf;
>>  }
>> +
>> +static void resctrl_abmc_set_one_amd(void *arg)
>> +{
>> +	bool *enable = arg;
>> +
>> +	if (*enable)
>> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>> +	else
>> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>> +}
>> +
>> +/*
>> + * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
>> + * associated with all monitor domains.
>> + */
>> +static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_mon_domain *d;
>> +
> 
> It remains a challenge to consider these building blocks without insight into
> how/when they will be used. To help out, please add guardrails to help with review.
> For example, this could benefit from a:
> 
> 	lockdep_assert_cpus_held();

Yes. Sure.

> 
>> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +		on_each_cpu_mask(&d->hdr.cpu_mask,
>> +				 resctrl_abmc_set_one_amd, &enable, 1);
>> +		resctrl_arch_reset_rmid_all(r, d);
>> +	}
>> +}
>> +
>> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>> +
>> +	if (r->mon.mbm_cntr_assignable &&
>> +	    hw_res->mbm_cntr_assign_enabled != enable) {
>> +		_resctrl_abmc_enable(r, enable);
>> +		hw_res->mbm_cntr_assign_enabled = enable;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +inline bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
> 
> This "inline" in the .c file is unexpected. Why is this needed?

Not required. No specific reason. Will remove it.

> 
>> +{
>> +	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
>> +}
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 065fb6e38933..bdb264875ef6 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -428,6 +428,9 @@ static inline u32 resctrl_get_config_index(u32 closid,
>>  bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l);
>>  int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
>>  
>> +bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
>> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
>> +
>>  /*
>>   * Update the ctrl_val and apply this config right now.
>>   * Must be called on one of the domain's CPUs.
> 
> Reinette
> 
> 

-- 
Thanks
Babu Moger
