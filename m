Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F171C4A24;
	Thu, 26 Jun 2025 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750962938; cv=fail; b=W3+mYTKsVtT7iQwJieJ6ptv7aVIL3PuaTgGkphAmWGuuHUuZRkXofAIRiU/wb6VZoQhT+zVTCP/7FqjhrPucgRu7Md7b5VpdddLDprlX+AWj0uH/s1GFkio0YzkL/6Z+B+Ij2HmMoNFT7W4n0Z0VNQGWJ1IekEw7z+8HA46ewCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750962938; c=relaxed/simple;
	bh=TMoD5Vk5zLVvT+hje7vFotEUNiXLMXxKjFVvLaTmwkk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pVxVe36NEAzJsfmRaewlKB/vrNzuiIpLwYFkVQXYOsgDLB4TpXdbcsHhj8tsqc/ZJnAbFpS5sP1su3JyeWy/Ng+AS6pwoAk3xNYmNZ7/Y3Viil0Rwjv+qzWvJHa4TnFf1XfXo1LmNVSD5MsapGPO8v+Bf1uiSYDR3geZzi/rLPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pqhklVAh; arc=fail smtp.client-ip=40.107.223.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pqhklVAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep/9HhSiaLzVkBtk+YYfr9flxYMtDF6gWPjZgnMAk9vQIXoEc6vCTOUXsp4XAjA73iwiPO7PSb7dGazYlilIEMhJBVib9IYDTHXh4rhILKRP+XCviQX0emDYtx1xiFNdU4TvEbdjlyCXpdyPWrKbJdIxpBgRmhbEvcc6CKsP1czuSskXnHK5ksqVu8S69H+Eg+Hl5hCbwlZW+sucBWy1k5OVTj3493GFwmoevxVcDPAh042vlrZwghWX8GC4SgbFdrRZSKffVNKIDKtesBGHo8zu7wT5GpdnMj/ZvKlvVf3WVy52ndJEV/qfxFhwf4m+ZpORHgOhGPq1Qot/SbyZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZTFgTOh+egATrb5IdANE4PoXlpo4OKgkce4moRBmtc=;
 b=ryVKkEqkukHHPuo7w+IrhhLClyAN9KVRJduCzbekGq84FCDkpMmMHfro/7FJBovaMpwY0BKUytp8WRdaCgdMCfpEW3JxBj8sidPLCcfagdgds7hidH7X1myi74flUbU5B9K6uM/EkO2DR5LzFkVQfdN0JJG0m7AhdnOj/GcM1wgDdkUx4u4sLbvFZZebyP3i8lcyLC4uL1Qz9XIxMk++FUHG178tRJXA1Cf5rs8r0J0cHu8mEzUNCXAD3k70Tn/xUn2v54ly3fiPhBSbYq0FT8WYBXaMrXjHzPh4kWmd68t+A5Br0dg0O5oqmLIeNskqq3oduqGV+4jaoEVcQCHySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZTFgTOh+egATrb5IdANE4PoXlpo4OKgkce4moRBmtc=;
 b=pqhklVAhW1vem4QnLjzt9I6Jqz/TJnCztjhhxc/Sn7H/SLDryOpb94GFNXZBBkgMBrxLd9TAQydLN/UazB077Nzt83uY+nwJxrMS9UuA7k/r9VI1cUpy6tB0yEhL94PWg02zqGs2XKPBtDN8DFan9+NVo35jR05Pehxnn1tVyk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BY5PR12MB4225.namprd12.prod.outlook.com (2603:10b6:a03:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 26 Jun
 2025 18:35:32 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 18:35:32 +0000
Message-ID: <028b4f02-48c8-4608-b2d3-73509a989178@amd.com>
Date: Thu, 26 Jun 2025 13:35:27 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 17/32] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
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
 <72b62da44d72938a33b58fe3e853da2e41dfd67f.1749848715.git.babu.moger@amd.com>
 <41eebfa8-34d1-4ad1-89a7-62dc372ab051@intel.com>
 <fb205a5b-0689-4d53-a272-d196d337a9e5@amd.com>
 <d12ea8e3-a7f0-4962-808c-cfed0bd72674@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <d12ea8e3-a7f0-4962-808c-cfed0bd72674@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0208.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::33) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BY5PR12MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe4017b-c1b7-4e60-1a90-08ddb4e03b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3NOb2NIdHJkR05TREp4NTNidi9yRnRhMmd2b05oMHVzT2ExRms0b2FKTXcw?=
 =?utf-8?B?cXZ0aWdoK0tNRU8zaWRQVjRIMTBkTXlzZC9xbGlabEt5M29sZ1RnQmp4cU5k?=
 =?utf-8?B?NUFxS1IyOGxzUTVsTVRuYXNMcURCVS9JT1dtYjY2cThUdTJOSjdZMXNES2wv?=
 =?utf-8?B?RnQ0UkFhU05WeXlLbFNqa1pHTmFVblh3SXpZb2FoU0xCdHJiSCtQTzh1MUJN?=
 =?utf-8?B?czkrZWxKa0doTkhNcVVZMzZRVXFTNGRmdWhhMkxhamJRZnUxS0RwVWdteXM2?=
 =?utf-8?B?NE1kMHBKamZjdThSY25ISmxTWDB0TjdUUTl1ZmhoNnU2aCtldnRYd0toMk1T?=
 =?utf-8?B?dCt5b08yMGhTMU9HYWdkREE2MVdibmMraXA1YTk0am5oRUdQOXZwMmVCVWw1?=
 =?utf-8?B?WTE4MHMyR3Q0d3pkOGdRV1pndnZXTFdLVjd0eDVXdTFLQThEQzZuNmJ2QitB?=
 =?utf-8?B?RElnQ1lFYkZEdTF2TE9GUnVmdzJ1V1phZDUrSVEwTStkS0FjZE4wSi9vVWZN?=
 =?utf-8?B?ZTRSSEIrbHM5RU5QUHVTb2VKejEvbnRSU2czL1BjOFFLaFpsQ1dnVEdkYnI4?=
 =?utf-8?B?Wm5wZXhXRzhhamlFdmo4eW9KN1FVekFDdXBET2xnbkd3QThRVDR4eDl5dzF1?=
 =?utf-8?B?dVZBWWdnYS9qaVFqOHUxVHB6dEVHbC9pZzUxZ1FIekRaZnUwek5nSnRyTU5k?=
 =?utf-8?B?MDlYSS9RanFLbU9zZE5YaUNUbTlkd2k3M0d5eHpjdWtuT0JtOHBsbGRVbGhP?=
 =?utf-8?B?RDFvajdnYk9EeFpoNE9ENU1JRWhNQ1lkQUtTbnFONnBGeTdieFpaM1JUUjhr?=
 =?utf-8?B?RmZTTksyTjlab282TXlCZjFia3NRQnJsWkNrM0EvcjdxbFNhT1lPM0hRRWZB?=
 =?utf-8?B?ditQbGdwcjVKcXlMaUFCYlpPMDIwc1k1NW9pbGZub0pwcmV1NjVmSmFqU1B5?=
 =?utf-8?B?Z0xUYm1wNzBjajhlcXpiYUUwTFFZSVlBMkw5RzBqQnR0NmlFcmZrMmhzakkz?=
 =?utf-8?B?bURNZ3hhZ2laa0NJUVFCeWJFeGdzRWtQajBWQjNKeGsyRmRZSUhKWGFlT1RZ?=
 =?utf-8?B?UnpYTUNGdXVKWndYQnZhK1hLeHR6QVBINHArOW9BQXhFclpJcjFCTEtERVJi?=
 =?utf-8?B?SXNUK29Bb1hTYnhsWUllM1F4WHREeWRDTVhZRWd0NlFycytDVUxKUWZYalhG?=
 =?utf-8?B?bncwTWJ5R3Z4aFJuZ2JoV1cxbU1IV1dGSlRDa0VrcjRwc1plWXJOTFo1Y3Z1?=
 =?utf-8?B?OFluSWZYNEt1cG1QWVdkL0owOXRtdEF5SERaTU1WTjZidklsT0tub21oVDAy?=
 =?utf-8?B?S05kL1FEd0l2azVVZzEveUFTY2ZQZEl1UThtMTUzbWRBb3JQRG95dEU5TjBw?=
 =?utf-8?B?K3RVQWxVMGlJNWxRbW9rZFl4enZ5cmVHYVB6dWFCVm9FZ2V3Z0RsY0xwWDRl?=
 =?utf-8?B?cFBsWHBBWlJzMllHL01Uam0zQUtjSWgwWk1ZQkVTb0pWU3hNd2JoRWQyclZD?=
 =?utf-8?B?S2Yza1BKbjBtWjZiVmROaWFtK2Q1TWVhQTBaSTliR05RUGRsczRLaE9DN2hJ?=
 =?utf-8?B?bGVvMDlYcTYwVHRDcHoyQk5wNzhySGZOd0tTbU9SZlcwZmF5Wm5nKy9DMkVQ?=
 =?utf-8?B?ckhUVHdGMURCTE1GNWtjaHRSUFNFSzN0dmZ5WEc3UnI0ZHZxYWtNbDA4WFJv?=
 =?utf-8?B?L3IvWEdPTDNTUkdTaXo4c2ViQ2tYRkdhak5vMGxCckdyZW5hY3dyaHU5cW12?=
 =?utf-8?B?aFpuT0ppL05IMUdTbkZxYnlUc1Y5SVg5TC9udm90a1dIK0Q0Ri9DYU1oSjJ5?=
 =?utf-8?B?YkxKeHI1QUpFSkRwTlB1R3laZ0NiamRwaTlsTnlhWDZoWWNaeWV3QWVLZ1R5?=
 =?utf-8?B?K05oTzVRc2VVSjVTT3hBVHJkTWY4WWxNWkxvQ09LTmtHT3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDJETDRIM1JJNDFsNVVEWXpCb2lEV2UzSXE3TklyNmJxN3ZZbE5rSHU4L0hI?=
 =?utf-8?B?dGEvUERGQWpZSS9GNzVmZmp6OXJUMzJPY0dON2lzYi9KSGp4bTVaZThUK0Yv?=
 =?utf-8?B?ZlFwUGZKc01XbmFsTTV6MDBVVGdNc0FjMDhSSnJDcnNTL0JKMXFPbEQvN21q?=
 =?utf-8?B?NStMNUJGaUhJbkNkNHk4Z0lyR1F5OFBXSW5FdXNTcWo2MnM5bWx6YVUzMVRZ?=
 =?utf-8?B?WmtlSmtFdVo3MkJQWjZKOUk5NnFqYzRxNHFxUGE1eDdwSnlaN09YN1hOUXJh?=
 =?utf-8?B?S0hlOUMxaktVUmtZSnFnUnM1WTBwcXZ5K3QyQUZkeC9CZWlVYTJiN2xSTzRp?=
 =?utf-8?B?a1FqNlg2OGxTU0RGUHdIaGNHYUkvdkNJc2VndzNLSlJLcDlVbnQ0NmlzMkt1?=
 =?utf-8?B?ZHJuQzFoa2VkTWE0M3FEOHAvOGFDNGttbkdxaERia0plQWFrc1NaUlNWNFRG?=
 =?utf-8?B?alRyQ2hXU1VNbGJpM2JKbXBVWStVWkFqdXZPK3Q1MS9JTklJbWtmUGJvYktJ?=
 =?utf-8?B?emUyK094WXNzdnpJVEpJSm0rNXlrYlVTRHZWcDFRRFlpM1dxT01vKzJBZUky?=
 =?utf-8?B?emI3ZlYxbVg3MldSaW92OWpjQSsvQkJrUzRtT3dKVjVPNStDeXJiaHBaR0dz?=
 =?utf-8?B?bkZpM1NMVUh4VExVMkFXRmlzTmhXR3Jrall2eHpEODZ1dExqOFJOeDNEWUFa?=
 =?utf-8?B?Qjg1dUZCRlBUMkc5RE0wVDBHaURpQlBmZnZENmljWnFVclErWVAzdmgwQ0lJ?=
 =?utf-8?B?a21YZnc3dlBPT1Z5VlZrL1JYT2NBUzVkbTRBZGJEZ3ZHQWVYd1lUbVpySXYy?=
 =?utf-8?B?NnlpL1FXN3RMZ0JQNTR2TXdYOUU5c3lPcUJvZXFHaCtiQTZEd1RHczhwa3l4?=
 =?utf-8?B?QmxtQTE3ZW5zd05iNVhRaFRTMlVoL2tmTHZ1REdmQVFxRlRJUXRHV0tyTXVh?=
 =?utf-8?B?THdqcGJoRnBLeXVQZGpQcWNWL1d5azF0TjJkK2hxbm5JbGdKOER3VVd2SzFI?=
 =?utf-8?B?UUxIYS8vYm9zT3VFeHBkZ2JxbllmV3dwV0hnVk53RjBpVXh4bVVYWWJWTlZt?=
 =?utf-8?B?bzlRc2pDSjJxNTRWK05IbTdRWGpLRjZxdW1tZG1kTi8vbkpHWHhWbkI2SUZE?=
 =?utf-8?B?aGpqRzZGU3hINkdUajJUOWJSa0RtTGFaRlpJLzVpMWVUWWxUOWhMbWhiNE4v?=
 =?utf-8?B?bCs4eTJJVUREeWNERDVYdnNMaWExN2dwb0xBOW9CMGdpUDhEbkI2bnVDT2sx?=
 =?utf-8?B?RURxelgvRi9RWEo3QkZySmw5N1E1eW51VnRxZ2k4OHJRQ050a2xJR2FkMHlO?=
 =?utf-8?B?b3pFOEJyWnRzQUVkd2sxK3psc0JMQ0hJT1RrcUF1SXI4YnNheDZlaVpKVERa?=
 =?utf-8?B?V1YxVy9xSGpvTHpYV0JyY1BUd1JwNmF6UlAxWTNZRS9DdmZGeERIeDg1eHdm?=
 =?utf-8?B?L1hFRzFCclM2OEFVTUVBL3hmVDNhcncvY3gyUzRLQzlyS21ydkVib1dlUDVs?=
 =?utf-8?B?d2swaUo0ajZLRW1EQlBxb0pBbEkzWTZOQTNYQkV4Z25qTS9jc041MUNWSXFK?=
 =?utf-8?B?anNyOE51T0dDNGdjYmk5UnJ6cnRnbVFtRHpGekQ1YWd1djRyWDRVWmlaUlRF?=
 =?utf-8?B?WXlqMHJmNEVPRXpBdEs2U0k5ZjVIWHBhU0lWemJHZC9FRWtFUHk3d29LWm1r?=
 =?utf-8?B?R1NGRW1LYjJ5UlJKWUhXRjlMSTBGc1B3UjJRcEhxWm9KdVlJVHBNYWJlNGtx?=
 =?utf-8?B?QVI3dVVwa2dRMzZ0R0MyUUc3cjRCSEdpRldPQThucVRYOHhFeVRpa3ZWUWpJ?=
 =?utf-8?B?V2RlTE5JZllGVjB2Skl4VzB0dGEzRG1OOG1zbjFuVkZSVVFnRzFjb1B0OWFX?=
 =?utf-8?B?anVhQktIMWJremlZQXQ4clpXVjliN2MwQmNSRzRoQ3lvSDNKbi9nckI3Qzln?=
 =?utf-8?B?c2dhMXpTeURkNUtWemVsNzZ3a0Q2dzRUcjByRjFsSWJvWjhnWmVxbXgwUnFa?=
 =?utf-8?B?UjFNSHFNRlM1cmEreTczbXE2NHF0QmxMRFl4QnJ0NlFvcGZNZ0w0VjhmVTBl?=
 =?utf-8?B?NW1sSXBNOE1zVVFyRjk3MTRUdlV0ZnNaRDErNDVxbi9hZG1FODJ3R1NuYWdn?=
 =?utf-8?Q?95m4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe4017b-c1b7-4e60-1a90-08ddb4e03b9c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 18:35:32.5383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEO6Ejvob6KCg9nSjXhtu4cwZy+PYAqXJ1nq99p/NY+t344q8mU1uPgZYlqhIcHB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225

Hi Reinette,

On 6/26/25 13:02, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/26/25 10:41 AM, Moger, Babu wrote:
>> On 6/24/25 22:03, Reinette Chatre wrote:
>>> On 6/13/25 2:05 PM, Babu Moger wrote:
> 
> ..
> 
>>>> ---
>>>>  arch/x86/kernel/cpu/resctrl/monitor.c | 38 +++++++++++++++++++++++++++
>>>>  include/linux/resctrl.h               | 19 ++++++++++++++
>>>>  2 files changed, 57 insertions(+)
>>>>
>>>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>>>> index 0ad9c731c13e..6b0ea4b17c7a 100644
>>>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>>>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>>>> @@ -444,3 +444,41 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>>>>  {
>>>>  	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
>>>>  }
>>>> +
>>>> +static void resctrl_abmc_config_one_amd(void *info)
>>>> +{
>>>> +	union l3_qos_abmc_cfg *abmc_cfg = info;
>>>> +
>>>> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
>>>> +}
>>>> +
>>>> +/*
>>>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>>>> + */
>>>> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>>> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>>> +			      u32 cntr_id, bool assign)
>>>> +{
>>>> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>>> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
>>>> +	struct arch_mbm_state *am;
>>>> +
>>>> +	abmc_cfg.split.cfg_en = 1;
>>>> +	abmc_cfg.split.cntr_en = assign ? 1 : 0;
>>>> +	abmc_cfg.split.cntr_id = cntr_id;
>>>> +	abmc_cfg.split.bw_src = rmid;
>>>> +	if (assign)
>>>> +		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(evtid);
>>>> +
>>>> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
>>>
>>> An optimization to consider is to direct the IPI to a housekeeping CPU.
>>> If one exist, a further optimization could be to queue it on that CPU
>>> instead of IPI. Your call since I am not familiar with the use cases here.
>>> Looks like all paths leading to this is triggered by a user space action
>>> (mount, mkdir, or write to update event config). This would require exposing
>>> the housekeeping CPU code to arch.
>>
>> Do you mean something like this?
>>
>> cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask, RESCTRL_PICK_ANY_CPU);
>>
>> smp_call_on_cpu(cpu, resctrl_abmc_config_one_amd, &abmc_cfg, false);
> 
> Please note the returned "cpu" may be nohz_full and if it is it would need
> an IPI. Similar to mon_event_read().
> 

Yes. Got that.

>>
>>
>> You want to do these changes now or later?  It requires few other changes
>> to move around the code.
> 
> I'll leave this up to you. I think it would be ideal if cpumask_any_housekeeping()
> can be hosted in include/linux/cpumask.h instead of moving it around within
> resctrl.
> 

ok. It will be couple more patches to re-arrange all the related code. I
would prefer its done separately.

-- 
Thanks
Babu Moger
