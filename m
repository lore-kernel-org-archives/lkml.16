Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBA913EFE3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743137723; cv=fail; b=LHPz/TEHrTaLuzqg4WSfL+YOgm7MWQQCtmUDEA20Tga1L8I8TU3hCB8jB2tCzTgn1RIrLRYO2FBM2Tgipsxn2RzNbOeSxe0Cf+o40S2Xh1H8XRCx7GufnzWESwGFNBb8LvavruYynPjdHPTdA4ixczYXMBU25m18jAkdjr49ld8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743137723; c=relaxed/simple;
	bh=iDOAugKYYnoPNt/+9t4kYcnkJDCJNPmMlLUdObvUJ6A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y13XSXXf81I+pFj8jYBR96Dd0prr3wxd8mRP/LLa+j+ZsV0jZtMxCKfc33W7brMiiLGc5VI8wSQznf0ONuEmvueW9zlxI5pmK4VljETuAC9f+0Ay222SOJt92qJLg8hW9Pgbe01HBzBuBPDpHchslr0OGGcsMTgf8/zMX506giQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=olR5h+Uh; arc=fail smtp.client-ip=40.107.92.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="olR5h+Uh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRUfm0ZDDxIi5IVuK6wSFfE7ddyE8zjUwQYGX7PM3v0DNVe8KXaCdcYZpRp52mvAnYtQHE5cYS6m0ytk97Vc6ul/IZamoi1+fHun2peiQsVlThBK9HOVYmco6KHHyV4h6KP3Ff5JXeA1R4tMgvQ4mUfIXkET2ewWtMvA+6CaWZxRQFnM1yJG5/66XNHnWrfdJu5GWa4mGZd+fPDUkyAgKgwvUX3sduPkAH+vvf74I4l2Oc2KgnZ8HSSFGfz65gTWcnCAo5iU6jkMVdBxG70R7vPatbIdHhGbG9jYIXa3qf5uVm1GLDI6G2j5awYuUlwmdF2ZVABb16TYgiLrcKqiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Slgd5NiqbaQsNpkU8nz0MBxvP4Y4VAca05xsyy6EeTg=;
 b=DJeF0HD/7Sp8TMwco2GFLhJRHIuYMJXpFlD7racprsZxKaQANi5MoXR41xQJ2rfB0z5Ww6xD3pQ/j9Uf7YoKeY8N/23r2lC6EZWrT27UcFBBMlZ2op0buv9icnQidJFAJq6xtoE4Xu/7Z3MFLyLO68LJ8+u5qbEgbI/5m81wwu1KPkkQDun1/SPt7n/QEXpK/mjnd3ZxM8b3+7Krtai1BTgkRdGFRKiZG7WR20bioiOFF7C8TQFy6W429G3rgj7DbxjmbO9H6jBidVeyvJ0pJMKHJ2IN78mhvb5dp+wue3wPqqZD/g2IyRdGbIjr8SrWQjFtRVQotWhAda05hV/eBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Slgd5NiqbaQsNpkU8nz0MBxvP4Y4VAca05xsyy6EeTg=;
 b=olR5h+UhRv5a6K44dNvZED+q4vvFS5nLsePgGvLnImx+w7TJq/cHXGFQNoK8/YD37hRJHNbjDEgtCsorl0ZuQbEsfoPs7FXiNdbeGPW+mhIAhtrgu9jJP2wAjYaLwfYHV0BskedABWDbICA3AREBnUPK0VjQ/zi2I9SUO6awe10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 04:55:18 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 04:55:18 +0000
Message-ID: <3a43054c-74b8-46eb-a614-43c8beb18c85@amd.com>
Date: Fri, 28 Mar 2025 10:25:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] mm: kpromoted: Hot page info collection and
 promotion daemon
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: AneeshKumar.KizhakeVeetil@arm.com, Hasan.Maruf@amd.com,
 Jonathan.Cameron@huawei.com, Michael.Day@amd.com, akpm@linux-foundation.org,
 dave.hansen@intel.com, david@redhat.com, feng.tang@intel.com,
 gourry@gourry.net, hannes@cmpxchg.org, honggyu.kim@sk.com, hughd@google.com,
 jhubbard@nvidia.com, k.shutemov@gmail.com, kbusch@meta.com,
 kmanaouil.dev@gmail.com, leesuyeon0506@gmail.com, leillc@google.com,
 liam.howlett@oracle.com, mgorman@techsingularity.net, mingo@redhat.com,
 nadav.amit@gmail.com, nphamcs@gmail.com, peterz@infradead.org,
 raghavendra.kt@amd.com, riel@surriel.com, rientjes@google.com,
 rppt@kernel.org, shivankg@amd.com, shy828301@gmail.com, sj@kernel.org,
 vbabka@suse.cz, weixugc@google.com, willy@infradead.org,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 yuanchu@google.com, hyeonggon.yoo@sk.com
References: <20250306054532.221138-1-bharata@amd.com>
 <20250306054532.221138-3-bharata@amd.com>
 <c9c7e0da-115e-4f81-be81-193431fe838e@nvidia.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <c9c7e0da-115e-4f81-be81-193431fe838e@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0127.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::17) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a5748b-e8c6-474c-6a09-08dd6db4bcb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3JZUlJza0JtZW1XWGROZk5jcHd2MmtkenJneFFZRnZ6dzMxUEdOMEIzV2ly?=
 =?utf-8?B?azU3RVZxcXBieDlkQTlKbjZ2dXhTcEY4bGFOcENCZ1p0SzkrWUQrOGhxdisw?=
 =?utf-8?B?MkVTYTI3SFMyQzJPUGgwWlNLUjVmY3cyVERpVzBsYjUxemRiWmJFUWlFSVJF?=
 =?utf-8?B?UzR3d0h4TUpWWlJQTTNCWmd6QVh4MnhOcW5zQjVMQ3hhRkUwS2Rta25WRHdU?=
 =?utf-8?B?SG52UDFsUllxMkhaeXgySGNBb09CQ1Z0OVNwenZKdHZBeUxVTUYvSEpBcXlD?=
 =?utf-8?B?UEdZMHNTN0tiK1U2VCs1ZUUxcVNUZ0JqN21QMDVKTUdObWR1aG9KWGJaSWc5?=
 =?utf-8?B?SHNOMS80dXROVDVXSW1GRHR5aXJFVDhLcnNJaGFLUVJHd3VXaFdNMEN3NEFy?=
 =?utf-8?B?WE9jU2I0d3VSOGFPUGQvdVZHby9YMTlzNkZpRXhZUjIydjUyTi81dS9CRkQw?=
 =?utf-8?B?eTF1d0ZKOENRc29TbzdIU1QrdWhuVWlHMGVTYnFuYlV0M1RmSmlld2Y5YzJw?=
 =?utf-8?B?U3JLcGFEaGtHZ3RnSXRMOExRZnZkTzI2TlFuQWxGcWthQmdpN1lNR2lNZzVY?=
 =?utf-8?B?c3VBa20vdXZtRHBsOGtWNEp6SWZCTmVRZDZ1TkdYQjhPQnhJTjNQZGptd3pl?=
 =?utf-8?B?bU56aDM3eVI3Mi9mMTlJalp4bi9Pdm4ramtOM2EzbjBaR0VHMVBLcVRYMWUx?=
 =?utf-8?B?RXhhTmNZMU5qMlMyUUlXKytuQmJpSFlKeHUxVVZ2UlZiYkhZS0ZDbDVpM1px?=
 =?utf-8?B?Q3B5ejZHWUxUNldTc2RXOFZ1MVVtUVBhdWVrYnpWekpxcXRHRFVlV1FDMjlY?=
 =?utf-8?B?RWRVQWl5OGYwdll4K29ZZmVJbHpoWE04TlBMd3YvREsxZlFGN3kvSDhvUzA0?=
 =?utf-8?B?dlVRaWNOSTRmRUhGMVdzSnB5Q0ZwYkZCaGlHZUwvcVdTOE8rZWgrNzU1enRh?=
 =?utf-8?B?cFZZNmJleUJmN0x0YVc0MkxoVW52clRxdjVnMWRYUzFnUmJ4djdlQzJWM0xu?=
 =?utf-8?B?b01CZ2tCZnk1OGpGTE5MdW84REJuOVVSQ04rUzhJOVBOTCtJaWx1aWpHRXho?=
 =?utf-8?B?ZDlYeHliaTRFYUlNOEFUbU1HZm9paUJqZnJGeEsvb2xQK0YvNmxRM3ZyT2wy?=
 =?utf-8?B?aVI4cjJaRmlyOXdOZUJpVEhWTG9rWFFYOEloeWszamQybFFJUzFmMFdxbHJR?=
 =?utf-8?B?SWplY1RGWW83ZTk1d0Z4cnY3VFN1VENJNndoY25kY1FjenEzRXlWTE9NOEw2?=
 =?utf-8?B?NWh5TWlpK0NCcFlDWmk2dW5kSkJyaTFkRFhtVGJ6K3ZNYzR6UEpMdFlGaDJ0?=
 =?utf-8?B?dUptUlpHVVhQL2tpY1FvMG9GeFpDc1JWYTBnaENhQmFReTMwUWYyNkt5ZlNI?=
 =?utf-8?B?UEUwZXFoNHlKRm1IbHVmUlBubG04TExlS1pEWkRheUJYMWd6YjJ3eGFFaHp4?=
 =?utf-8?B?MEQvTmsvWmNzUzZjKzM2WEd3K0RnSVRxbkpqa2RiWlRoU0ZuUGMxcDNqMWY4?=
 =?utf-8?B?V3dHRnF5UlRSNFphV3Q1WDB1ZWllUHdsSE9XTjNWYjN2am9Ba0NXeWxncVBo?=
 =?utf-8?B?cUxoNlVFeE01TEp2MVhSSG0vLzQ3UURHUnhrYXhmbUE5OWpPcEhHcDJHYWVY?=
 =?utf-8?B?SE82N2VIWHFvdlNOME92ckxrQzVNTlVJdmNQVkhlNGgvdnYzdTAwZ2I5TXIz?=
 =?utf-8?B?VlFDbTF6ME51d3VXa041MjFrRHhvVmZ2Yk93b0FFc1ZaYVBzcXA0RjJ4b0xE?=
 =?utf-8?B?Z3JLTkt0c25zZkl3SHhPSXA2RG9mOFNTTTMwcFFZMUt5bGdvNUFyNkhzbTc0?=
 =?utf-8?B?ZUVOVWpwUXMveUxOYXpta09Cb0lScEVLc01ZQm5SeENvbWhyNVplWkJlQmhO?=
 =?utf-8?Q?fDQZGiFj8tyd7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGE1VWJiY1RCalYzeFJIUE41OUozc2JXb2FhU09qUzNEa2hTSzN5SWVSc1I2?=
 =?utf-8?B?WGlLLzc0ZDY1U2RNS0tHQmp1bHVWMHU0bDNEaGNEV1ZIWkJtbkxKMWVEblMv?=
 =?utf-8?B?ZDRnR1YraVM2VmU4TXo4d0VsY0hOWUhQY3ZHTlBMWTV5d29TNXhodXBHanB0?=
 =?utf-8?B?cjdkOGliRFN6SEFTckx6Tk9DYk1VWjZsRmF4ZXdyc0RGV2thVWhvVldSUDJX?=
 =?utf-8?B?VVorbVZ2Y2JWa0kyRFlFOVdabTh3cU1GNHRncWNrd1d5U3VqMkZWTnl2TXFB?=
 =?utf-8?B?emw5WDNZWVdTbGFVT0J6RWNtNlZCM2g3eFpwRDJKR1Rpdit2ZXlGV3RhWC9E?=
 =?utf-8?B?cDFNR1RUK3FzUTBZeHNSdnEydDVRcjZHbU1oOVg3WmluTS9jSnNNUFZsVURo?=
 =?utf-8?B?QUFML1c2WTJPTUQyV1Z3V1FUaC9GVzM3YTlOaUlKaWhXZE4zR3haU2dLclJZ?=
 =?utf-8?B?STQzWGpSemtGOGllVTVKSDBKNjFubWZ6QjJEQlZPNkh1VkhhMWJ0T2tEdFFv?=
 =?utf-8?B?aXMxZGxnOTlXU3V5eElqSW5ZNEZMSFAyeWJzNkU1RlA4YnZPY2tvUTBLUldh?=
 =?utf-8?B?bnhPcllWK3dxNHczcEJiQ2NSZ2pnd3RCTllIaXB2RzRoU3ZwK2tTSnBzN2xK?=
 =?utf-8?B?WTM2TmNITit2Q1dQdHQ5aWQySnZvQlNvOTRDM2VVNlhlRm51VEdWb1g1b3RK?=
 =?utf-8?B?eU43UjVmUHlPR2pFeHpmQnp5QWNKeGhaMHozNUwyaUFDWFBHdGVDOXBaS0ps?=
 =?utf-8?B?dCtxem01YlUvNFhhNVJtWlBKSnRtRVl5VzIrbU42TFNXVjU5aDBRV01JZ1lj?=
 =?utf-8?B?Q3JGam9sUGJ3cjBpK21xMnlVeVNoeVhTN1FkQnovRGZrVldJcmtEVURsM1kv?=
 =?utf-8?B?TW9oV3RHNkt1OHZJbjYyMkNqK0xFR1V4OWlUeHVDQVlXY3ROZHVUa0JjZEww?=
 =?utf-8?B?WXNsOERsRE9FWWJsTGZuSXA0NExLdVAxb2pCbzdySE5VQUdtSXFPaFRXd29s?=
 =?utf-8?B?R1g1elV6Z0FaVU93dzVGWnJRSlI3V0JMTHVjZGF6QW96RlNxcjQzb0JiK01h?=
 =?utf-8?B?Kzc0ZFNFa0Q5Tkl1YkRXM1JFSTNKSWxGN0hlaGRDY25FVU9zOUYwajFTc0lK?=
 =?utf-8?B?M3MvSGVVeGVpMFNEdDUyS2pZeEduc3gzdEp0bFJwVEdNTVQxcG9CS0VreWZN?=
 =?utf-8?B?UngzeUZtNDBJT2VLMUp4V0RYbnF5eFQxUHVPdXRpcGlxdkhWdEx0UFhRZC84?=
 =?utf-8?B?U2s0YXhsNkl2dlBKMFhSeGV0Uk82OXB2YW81bisrUjQ3aDZmN0NDS0Z6Z1lq?=
 =?utf-8?B?c3pMMzR0Y1JLY0IyVEdnK0hnenIzaFJ1NFkwM3REQ0NwY3IzMWRUV3RyWDlW?=
 =?utf-8?B?VmozUHpzQ1JYeUdHay9XZnRtNkpxS0Frd1FkWXoxRTkwR1NYb25yL2UxczdE?=
 =?utf-8?B?QjllY1hJYjVtOGI0a0RnZXZPMEFoMW5tM2M5YmRGZ2tzRUprSno1bVYyWk9I?=
 =?utf-8?B?WlZsNUtjSnlWamVmY0dSVVRDbXJlMWdDdUkrRmo0aE9wckJlU084VHZrRnA1?=
 =?utf-8?B?aG10dTJpUXF3OTRsclo3SFlkTWhTckg5UWdTampRdFNqc2F5UGVyam9UMVYy?=
 =?utf-8?B?NGtyNTlMa0JFOG1PclRPTlI1aGYyemV5R1l1dWNKSURNMVhWdmVnMG5zRzZT?=
 =?utf-8?B?R1dBY0g2YU4yV0Q5bnYyN2lpRTdZY28wbmJRR1doM0F1dzhPQ3dqTVYxSHV4?=
 =?utf-8?B?a0Q5ek5CNDJ0N2dWc2txZU9nbUtjZFFEcVNNSXcyWVNMV0d1bzVyV0pCZmg5?=
 =?utf-8?B?TTdVM1ZWM3orNTc5SllSd0ROY2NZYkJkQ0FvMVZmcVE5RUZoTWdiYUh3Nkkr?=
 =?utf-8?B?ZCt2eCsyaDVKUHBXQ2V6SXRpY2d3b3ljOGxIWWV0bk9COFBtVldVN1J0MStO?=
 =?utf-8?B?ckdWRnJSaTNCQjBNdHJYKzJmaWtqVnF4TEFGZmZKK015MjZ1SnlkUDU0Y09O?=
 =?utf-8?B?dWF1UzNaanViRVZYcHpZckV5U0kvc2pHZFJ4UXJDbC9KbWNnNndNSUdUTmVO?=
 =?utf-8?B?cFdvYkRHVDRzY2hSNFFiQ3YrL0k5cnpucHpacEg1cXhZeGRHZkZQbys2bzBC?=
 =?utf-8?Q?FpH31JWAS4xScOYLarzIvGQVs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a5748b-e8c6-474c-6a09-08dd6db4bcb2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 04:55:18.5548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zwJAvqRQfSLcnwx0s5IpsOuA06QbxAT+FWdGDqZRAXmKvFcQgg/rCPNjuk/n4zF17JLX8s2LJsQlHX8+3b9pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108

Hi Balbir,

Sorry for the delay in response and thanks for the review...

On 24-Mar-25 9:05 AM, Balbir Singh wrote:
> On 3/6/25 16:45, Bharata B Rao wrote:
>> kpromoted is a kernel daemon that accumulates hot page info
>> from different sources and tries to promote pages from slow
>> tiers to top tiers. One instance of this thread runs on each
>> node that has CPUs.
>>
> 
> Could you please elaborate on what is slow vs top tier? A top tier uses
> adist (which is a combination of bandwidth and latency), so I am
> not sure the terminology here holds.

Slow is used to mean bottom tiers here as determined by the memory 
tiering hierarchy.

> 
>> Subsystems that generate hot page access info can report that
>> to kpromoted via this API:
>>
>> int kpromoted_record_access(u64 pfn, int nid, int src,
>> 			    unsigned long time)
>>
>> @pfn: The PFN of the memory accessed
>> @nid: The accessing NUMA node ID
>> @src: The temperature source (subsystem) that generated the
>>        access info
>> @time: The access time in jiffies
>>
>> Some temperature sources may not provide the nid from which
> 
> What is a temperature source?

Temperature source is a term used to refer to the subsystem that 
generates memory access information. For e.g. LRU subsystem that scans 
page tables for Accessed bit becomes a source.

> 
>> the page was accessed. This is true for sources that use
>> page table scanning for PTE Accessed bit. Currently the toptier
>> node to which such pages should be promoted to is hard coded.
>>
> 
> What would it take to make this flexible?

The context here is that sources that provide access information by 
scanning the PTE A bit wouldn't know from which node the access was 
done. Same is the case for kmmscand approach though Raghu has some 
heuristics to deduce the best possible toptier node to which a given 
page should be promoted. More details at 
https://lore.kernel.org/linux-mm/20250319193028.29514-1-raghavendra.kt@amd.com/

What kpromoted did for such cases is to just promote the pages to a node 
whose nid has been hard-coded for now (like 0 or 1 etc)

> 
>> Also, the access time provided some sources may at best be
>> considered approximate. This is especially true for hot pages
>> detected by PTE A bit scanning.
>>
>> kpromoted currently maintains the hot PFN records in hash lists
>> hashed by PFN value. Each record stores the following info:
>>
>> struct page_hotness_info {
>> 	unsigned long pfn;
>>
>> 	/* Time when this record was updated last */
>> 	unsigned long last_update;
>>
>> 	/*
>> 	 * Number of times this page was accessed in the
>> 	 * current window
>> 	 */
>> 	int frequency;
>>
>> 	/* Most recent access time */
>> 	unsigned long recency;
>>
>> 	/* Most recent access from this node */
>> 	int hot_node;
>>
>> 	struct hlist_node hnode;
>> };
>>
>> The way in which a page is categorized as hot enough to be
>> promoted is pretty primitive now.
>>
>> Signed-off-by: Bharata B Rao <bharata@amd.com>
>> ---
>>   include/linux/kpromoted.h     |  54 ++++++
>>   include/linux/mmzone.h        |   4 +
>>   include/linux/vm_event_item.h |  13 ++
>>   mm/Kconfig                    |   7 +
>>   mm/Makefile                   |   1 +
>>   mm/kpromoted.c                | 305 ++++++++++++++++++++++++++++++++++
>>   mm/mm_init.c                  |  10 ++
>>   mm/vmstat.c                   |  13 ++
>>   8 files changed, 407 insertions(+)
>>   create mode 100644 include/linux/kpromoted.h
>>   create mode 100644 mm/kpromoted.c
>>
>> diff --git a/include/linux/kpromoted.h b/include/linux/kpromoted.h
>> new file mode 100644
>> index 000000000000..2bef3d74f03a
>> --- /dev/null
>> +++ b/include/linux/kpromoted.h
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _LINUX_KPROMOTED_H
>> +#define _LINUX_KPROMOTED_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/init.h>
>> +#include <linux/workqueue_types.h>
>> +
>> +/* Page hotness temperature sources */
>> +enum kpromoted_src {
>> +	KPROMOTED_HW_HINTS,
>> +	KPROMOTED_PGTABLE_SCAN,
>> +};
>> +
>> +#ifdef CONFIG_KPROMOTED
>> +
>> +#define KPROMOTED_FREQ_WINDOW	(5 * MSEC_PER_SEC)
>> +
>> +/* 2 accesses within a window will make the page a promotion candidate */
>> +#define KPRMOTED_FREQ_THRESHOLD	2
>> +
> 
> Were these value derived empirically?

It is something I started with capture the notion of "repeated access".

> 
> 
>> +#define KPROMOTED_HASH_ORDER	16
>> +
>> +struct page_hotness_info {
>> +	unsigned long pfn;
>> +
>> +	/* Time when this record was updated last */
>> +	unsigned long last_update;
>> +
>> +	/*
>> +	 * Number of times this page was accessed in the
>> +	 * current window
>> +	 */
>> +	int frequency;
>> +
>> +	/* Most recent access time */
>> +	unsigned long recency;
>> +
>> +	/* Most recent access from this node */
>> +	int hot_node;
>> +	struct hlist_node hnode;
>> +};
>> +
>> +#define KPROMOTE_DELAY	MSEC_PER_SEC
>> +
>> +int kpromoted_record_access(u64 pfn, int nid, int src, unsigned long now);
>> +#else
>> +static inline int kpromoted_record_access(u64 pfn, int nid, int src,
>> +					  unsigned long now)
>> +{
>> +	return 0;
>> +}
>> +#endif /* CONFIG_KPROMOTED */
>> +#endif /* _LINUX_KPROMOTED_H */
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index 9540b41894da..a5c4e789aa55 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -1459,6 +1459,10 @@ typedef struct pglist_data {
>>   #ifdef CONFIG_MEMORY_FAILURE
>>   	struct memory_failure_stats mf_stats;
>>   #endif
>> +#ifdef CONFIG_KPROMOTED
>> +	struct task_struct *kpromoted;
>> +	wait_queue_head_t kpromoted_wait;
>> +#endif
>>   } pg_data_t;
>>   
>>   #define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
>> diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
>> index f70d0958095c..b5823b037883 100644
>> --- a/include/linux/vm_event_item.h
>> +++ b/include/linux/vm_event_item.h
>> @@ -182,6 +182,19 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
>>   		KSTACK_REST,
>>   #endif
>>   #endif /* CONFIG_DEBUG_STACK_USAGE */
>> +		KPROMOTED_RECORDED_ACCESSES,
>> +		KPROMOTED_RECORD_HWHINTS,
>> +		KPROMOTED_RECORD_PGTSCANS,
>> +		KPROMOTED_RECORD_TOPTIER,
>> +		KPROMOTED_RECORD_ADDED,
>> +		KPROMOTED_RECORD_EXISTS,
>> +		KPROMOTED_MIG_RIGHT_NODE,
>> +		KPROMOTED_MIG_NON_LRU,
>> +		KPROMOTED_MIG_COLD_OLD,
>> +		KPROMOTED_MIG_COLD_NOT_ACCESSED,
>> +		KPROMOTED_MIG_CANDIDATE,
>> +		KPROMOTED_MIG_PROMOTED,
>> +		KPROMOTED_MIG_DROPPED,
>>   		NR_VM_EVENT_ITEMS
>>   };
>>   
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 1b501db06417..ceaa462a0ce6 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1358,6 +1358,13 @@ config PT_RECLAIM
>>   
>>   	  Note: now only empty user PTE page table pages will be reclaimed.
>>   
>> +config KPROMOTED
>> +	bool "Kernel hot page promotion daemon"
>> +	def_bool y
>> +	depends on NUMA && MIGRATION && MMU
>> +	help
>> +	  Promote hot pages from lower tier to top tier by using the
>> +	  memory access information provided by various sources.
>>   
>>   source "mm/damon/Kconfig"
>>   
>> diff --git a/mm/Makefile b/mm/Makefile
>> index 850386a67b3e..bf4f5f18f1f9 100644
>> --- a/mm/Makefile
>> +++ b/mm/Makefile
>> @@ -147,3 +147,4 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
>>   obj-$(CONFIG_EXECMEM) += execmem.o
>>   obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
>>   obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
>> +obj-$(CONFIG_KPROMOTED) += kpromoted.o
>> diff --git a/mm/kpromoted.c b/mm/kpromoted.c
>> new file mode 100644
>> index 000000000000..2a8b8495b6b3
>> --- /dev/null
>> +++ b/mm/kpromoted.c
>> @@ -0,0 +1,305 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * kpromoted is a kernel thread that runs on each node that has CPU i,e.,
>> + * on regular nodes.
>> + *
>> + * Maintains list of hot pages from lower tiers and promotes them.
>> + */
>> +#include <linux/kpromoted.h>
>> +#include <linux/kthread.h>
>> +#include <linux/mutex.h>
>> +#include <linux/mmzone.h>
>> +#include <linux/migrate.h>
>> +#include <linux/memory-tiers.h>
>> +#include <linux/slab.h>
>> +#include <linux/sched.h>
>> +#include <linux/cpuhotplug.h>
>> +#include <linux/hashtable.h>
>> +
>> +static DEFINE_HASHTABLE(page_hotness_hash, KPROMOTED_HASH_ORDER);
>> +static struct mutex page_hotness_lock[1UL << KPROMOTED_HASH_ORDER];
>> +
>> +static int kpromote_page(struct page_hotness_info *phi)
>> +{
> 
> Why not just call it kpromote_folio?

Yes, can be called so.

> 
>> +	struct page *page = pfn_to_page(phi->pfn);
>> +	struct folio *folio;
>> +	int ret;
>> +
>> +	if (!page)
>> +		return 1;
> 
> Do we need to check for is_zone_device_page() here?

That and other checks are part of page_should_be_promoted() call just 
prior to attempting to promote.

> 
>> +
>> +	folio = page_folio(page);
>> +	ret = migrate_misplaced_folio_prepare(folio, NULL, phi->hot_node);
>> +	if (ret)
>> +		return 1;
>> +
>> +	return migrate_misplaced_folio(folio, phi->hot_node);
>> +}
> 
> 
> Could you please document the assumptions for kpromote_page(), what locks
> should be held? Does the ref count need to be incremented?

Yes, will document. However it doesn't expect folio refcount to be 
incremented as I am tracking hotpages via PFNs and not by using struct 
folios.

> 
>> +
>> +static int page_should_be_promoted(struct page_hotness_info *phi)
>> +{
>> +	struct page *page = pfn_to_online_page(phi->pfn);
>> +	unsigned long now = jiffies;
>> +	struct folio *folio;
>> +
>> +	if (!page || is_zone_device_page(page))
>> +		return false;
>> +
>> +	folio = page_folio(page);
>> +	if (!folio_test_lru(folio)) {
>> +		count_vm_event(KPROMOTED_MIG_NON_LRU);
>> +		return false;
>> +	}
>> +	if (folio_nid(folio) == phi->hot_node) {
>> +		count_vm_event(KPROMOTED_MIG_RIGHT_NODE);
>> +		return false;
>> +	}
>> +
>> +	/* If the page was hot a while ago, don't promote */
>> +	if ((now - phi->last_update) > 2 * msecs_to_jiffies(KPROMOTED_FREQ_WINDOW)) {
>> +		count_vm_event(KPROMOTED_MIG_COLD_OLD);
> 
> Shouldn't we update phi->last_update here?

Hmm I am not sure about updating from here where we are checking for 
migration feasibility. last_update records the time when the page was 
last accesed.

> 
>> +		return false;
>> +	}
>> +
>> +	/* If the page hasn't been accessed enough number of times, don't promote */
>> +	if (phi->frequency < KPRMOTED_FREQ_THRESHOLD) {
>> +		count_vm_event(KPROMOTED_MIG_COLD_NOT_ACCESSED);
>> +		return false;
>> +	}
>> +	return true;
>> +}
>> +
>> +/*
>> + * Go thro' page hotness information and migrate pages if required.
>> + *
>> + * Promoted pages are not longer tracked in the hot list.
>> + * Cold pages are pruned from the list as well.
>> + *
>> + * TODO: Batching could be done
>> + */
>> +static void kpromoted_migrate(pg_data_t *pgdat)
>> +{
>> +	int nid = pgdat->node_id;
>> +	struct page_hotness_info *phi;
>> +	struct hlist_node *tmp;
>> +	int nr_bkts = HASH_SIZE(page_hotness_hash);
>> +	int bkt;
>> +
>> +	for (bkt = 0; bkt < nr_bkts; bkt++) {
>> +		mutex_lock(&page_hotness_lock[bkt]);
>> +		hlist_for_each_entry_safe(phi, tmp, &page_hotness_hash[bkt], hnode) {
>> +			if (phi->hot_node != nid)
>> +				continue;
>> +
>> +			if (page_should_be_promoted(phi)) {
>> +				count_vm_event(KPROMOTED_MIG_CANDIDATE);
>> +				if (!kpromote_page(phi)) {
>> +					count_vm_event(KPROMOTED_MIG_PROMOTED);
>> +					hlist_del_init(&phi->hnode);
>> +					kfree(phi);
>> +				}
>> +			} else {
>> +				/*
>> +				 * Not a suitable page or cold page, stop tracking it.
>> +				 * TODO: Identify cold pages and drive demotion?
>> +				 */
>> +				count_vm_event(KPROMOTED_MIG_DROPPED);
>> +				hlist_del_init(&phi->hnode);
>> +				kfree(phi);
> 
> Won't existing demotion already handle this?

Yes it does. I had a note here to check if it makes sense to drive 
demotion of pages that are being dropped off from kpromoted tracking 
presumably becasue they aren't hot any longer.

> 
>> +			}
>> +		}
>> +		mutex_unlock(&page_hotness_lock[bkt]);
>> +	}
>> +}
>> +
> 
> It sounds like NUMA balancing, promotion and demotion can all act on parallel on
> these folios, if not could you clarify their relationship and dependency?

kpromoted tracks the hotness of PFNs. It goes through same steps that 
others use to isolate the pages prior to migration. So it is not 
possible to find a page that kpromoted wants to migrate being parallely 
considered by NUMAB for migration or vmscan for demotion. I don't see 
any obvious dependency here, but I can check in detail.

> 
> 
>> +static struct page_hotness_info *__kpromoted_lookup(unsigned long pfn, int bkt)
>> +{
>> +	struct page_hotness_info *phi;
>> +
>> +	hlist_for_each_entry(phi, &page_hotness_hash[bkt], hnode) {
>> +		if (phi->pfn == pfn)
>> +			return phi;
>> +	}
>> +	return NULL;
>> +}
>> +
>> +static struct page_hotness_info *kpromoted_lookup(unsigned long pfn, int bkt, unsigned long now)
>> +{
>> +	struct page_hotness_info *phi;
>> +
>> +	phi = __kpromoted_lookup(pfn, bkt);
>> +	if (!phi) {
>> +		phi = kzalloc(sizeof(struct page_hotness_info), GFP_KERNEL);
>> +		if (!phi)
>> +			return ERR_PTR(-ENOMEM);
>> +
>> +		phi->pfn = pfn;
>> +		phi->frequency = 1;
>> +		phi->last_update = now;
>> +		phi->recency = now;
>> +		hlist_add_head(&phi->hnode, &page_hotness_hash[bkt]);
>> +		count_vm_event(KPROMOTED_RECORD_ADDED);
>> +	} else {
>> +		count_vm_event(KPROMOTED_RECORD_EXISTS);
>> +	}
>> +	return phi;
>> +}
>> +
>> +/*
>> + * Called by subsystems that generate page hotness/access information.
>> + *
>> + * Records the memory access info for futher action by kpromoted.
>> + */
>> +int kpromoted_record_access(u64 pfn, int nid, int src, unsigned long now)
>> +{
>> +	struct page_hotness_info *phi;
>> +	struct page *page;
>> +	struct folio *folio;
>> +	int ret, bkt;
>> +
>> +	count_vm_event(KPROMOTED_RECORDED_ACCESSES);
>> +
>> +	switch (src) {
>> +	case KPROMOTED_HW_HINTS:
>> +		count_vm_event(KPROMOTED_RECORD_HWHINTS);
>> +		break;
>> +	case KPROMOTED_PGTABLE_SCAN:
>> +		count_vm_event(KPROMOTED_RECORD_PGTSCANS);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	/*
>> +	 * Record only accesses from lower tiers.
>> +	 * Assuming node having CPUs as toptier for now.
>> +	 */
>> +	if (node_is_toptier(pfn_to_nid(pfn))) {
>> +		count_vm_event(KPROMOTED_RECORD_TOPTIER);
>> +		return 0;
>> +	}
>> +
>> +	page = pfn_to_online_page(pfn);
>> +	if (!page || is_zone_device_page(page))
>> +		return 0;
>> +
>> +	folio = page_folio(page);
>> +	if (!folio_test_lru(folio))
>> +		return 0;
>> +
>> +	bkt = hash_min(pfn, KPROMOTED_HASH_ORDER);
>> +	mutex_lock(&page_hotness_lock[bkt]);
>> +	phi = kpromoted_lookup(pfn, bkt, now);
>> +	if (!phi) {
>> +		ret = PTR_ERR(phi);
>> +		goto out;
>> +	}
>> +
>> +	if ((phi->last_update - now) > msecs_to_jiffies(KPROMOTED_FREQ_WINDOW)) {
>> +		/* New window */
>> +		phi->frequency = 1; /* TODO: Factor in the history */
>> +		phi->last_update = now;
>> +	} else {
>> +		phi->frequency++;
>> +	}
>> +	phi->recency = now;
>> +
>> +	/*
>> +	 * TODOs:
>> +	 * 1. Source nid is hard-coded for some temperature sources
>> +	 * 2. Take action if hot_node changes - may be a shared page?
>> +	 * 3. Maintain node info for every access within the window?
>> +	 */
>> +	phi->hot_node = (nid == NUMA_NO_NODE) ? 1 : nid;
> 
> I don't understand why nid needs to be 1 if nid is NUMA_NODE_ID? Does
> it mean that it's being promoted to the top tier, the mix of hot_node,
> tier and nid is not very clear here.

As I mentioned earlier, if the access information wasn't accompanied by 
nid (which is specified by NUMA_NO_NODE), it will be promoted to a 
hard-code (currently) toptier node.

> 
>> +	mutex_unlock(&page_hotness_lock[bkt]);
>> +out:
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Go through the accumulated mem_access_info and migrate
>> + * pages if required.
>> + */
>> +static void kpromoted_do_work(pg_data_t *pgdat)
>> +{
>> +	kpromoted_migrate(pgdat);
>> +}
>> +
>> +static inline bool kpromoted_work_requested(pg_data_t *pgdat)
>> +{
>> +	return false;
>> +}
>> +
>> +static int kpromoted(void *p)
>> +{
>> +	pg_data_t *pgdat = (pg_data_t *)p;
>> +	struct task_struct *tsk = current;
>> +	long timeout = msecs_to_jiffies(KPROMOTE_DELAY);
>> +
>> +	const struct cpumask *cpumask = cpumask_of_node(pgdat->node_id);
>> +
>> +	if (!cpumask_empty(cpumask))
>> +		set_cpus_allowed_ptr(tsk, cpumask);
>> +
>> +	while (!kthread_should_stop()) {
>> +		wait_event_timeout(pgdat->kpromoted_wait,
>> +				   kpromoted_work_requested(pgdat), timeout);
>> +		kpromoted_do_work(pgdat);
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void kpromoted_run(int nid)
>> +{
>> +	pg_data_t *pgdat = NODE_DATA(nid);
>> +
>> +	if (pgdat->kpromoted)
>> +		return;
>> +
>> +	pgdat->kpromoted = kthread_run(kpromoted, pgdat, "kpromoted%d", nid);
>> +	if (IS_ERR(pgdat->kpromoted)) {
>> +		pr_err("Failed to start kpromoted on node %d\n", nid);
>> +		pgdat->kpromoted = NULL;
>> +	}
>> +}
>> +
>> +static int kpromoted_cpu_online(unsigned int cpu)
>> +{
>> +	int nid;
>> +
>> +	for_each_node_state(nid, N_CPU) {
>> +		pg_data_t *pgdat = NODE_DATA(nid);
>> +		const struct cpumask *mask;
>> +
>> +		mask = cpumask_of_node(pgdat->node_id);
>> +
>> +		if (cpumask_any_and(cpu_online_mask, mask) < nr_cpu_ids)
>> +			/* One of our CPUs online: restore mask */
>> +			if (pgdat->kpromoted)
>> +				set_cpus_allowed_ptr(pgdat->kpromoted, mask);
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int __init kpromoted_init(void)
>> +{
>> +	int nid, ret, i;
>> +
>> +	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
>> +					"mm/promotion:online",
>> +					kpromoted_cpu_online, NULL);
>> +	if (ret < 0) {
>> +		pr_err("kpromoted: failed to register hotplug callbacks.\n");
>> +		return ret;
>> +	}
>> +
>> +	for (i = 0; i < (1UL << KPROMOTED_HASH_ORDER); i++)
>> +		mutex_init(&page_hotness_lock[i]);
>> +
>> +	for_each_node_state(nid, N_CPU)
>> +		kpromoted_run(nid);
>> +
> 
> I think we need a dynamic way to disabling promotion at run time
> as well, right?

Myabe, but I understand that promotion is an activity that should be 
benefitial in general. What specific scenarios do you think would need 
explicit disabling of promotion?

Regards,
Bharata.
