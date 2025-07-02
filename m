Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9305B1B4F1F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751437517; cv=fail; b=Ge9xmfFivdRETkT0HYc6UpZKXRFSxyWCkAgCAYXt3/PKQebRF50D5UCxjD5JxGXDkt5G4fySLq3ZyWGUdcBw4n4nRxiBjEu9/KfhHib26C4DOcS6H4wuRaSQs/ZqncrR4MwHL+9Coj+J8JZs/KUIVkHtoAADX1fYKekjeJg6NRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751437517; c=relaxed/simple;
	bh=/q0Chws0THdZ8nGYE13N9Keo53362adoyyx4bXMkkHA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=muDQuKK6zJSdAVLuRrcLuHj2FjlPzwMokH0cu7f3SwFyUdeQM1JqRjnlZ+yxpC1SKbEPEi6c/F8keob8UI7lp1WGh62d71AQiHt68yeYFF1MsWeNg912usN47EELDm7Ny111ldlCnk6uiacyaxzm69wZePvz+9+autW8HuYa+/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0RSU4HVp; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0RSU4HVp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQKiWz5+gARCDRKl7wSrFzROgY+LrS17f9z7wGKQIEk+gUgnP3TmRA7VXnucgdoZb3T84GnDGbXqVAbDPUhOYPHDn9wmZ0CFaPW/RwgkYL26Sn/yPXVpkMuCwENY5js3vuXIMU6QTRNSG5ABVJYdVADMxLpt3iMarfPSBMEjOjf2Tb0hITPanCtcMv9j2Go74+RuB0OzynxXKSpFadNQxezf9E4cTbT8J9Dak5LMpcEl7ZcQaJqh/hkKi+PJLwumSQc5YkJo4G+6AwApMCToReydrvEWSocfLYkeM1cv9fVpUA0spshUN47ex72vESZx6zE4pefdH6lrsujoHaB0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHWaReUq6KYsqB6w/TnyAol/J3p8ypAyDj2vwf5JKW8=;
 b=cTfsYVEQ3CceXbzR5Ety5vauDAoI6vmHtcAn9UpAygXWIDOnIqhvpFgFhshuHAJGr610/5P+1cgHOv4W9ZkWvVz7ASBZ1DOTmPq4W2bvAMbTjLSlanSg9YDA+a2V/bpdxcJY4KZqOAgRxz9NU1zbPE4GNN3IT03CdHXZqoLqrpJxugq6/Qb75FqawoF5hCTryincD/8CrPfeyjjFR2XzcWIKsIyT5pj6N+Lsj1jFes7pIRvTwveakW+7/40Z5GT/pvUIyLGHnGYBLiBYn847HZf19f3+NfUsvg3wFTD6r+YCr8dOyucy+LbeVOilhJHtOzJ2zDbP6DkCHMFXb4y0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHWaReUq6KYsqB6w/TnyAol/J3p8ypAyDj2vwf5JKW8=;
 b=0RSU4HVpFC2LpxaHYY4m5IFsuHGdqGS4jAcICva/xLYiZsFFkV+JpMlB5JwYvW6ioq2OyLM+EqA4gv+lInhVlaUlBCmh9IoYX24BY9qHbdT/nHYdDHAbQg4wT0aJcz2FyfZ1qMMBR/sR/MEqDet/Au5+nxGtxAW9hiv2kE132Kk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9aa) by IA0PR12MB7556.namprd12.prod.outlook.com
 (2603:10b6:208:43c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 2 Jul
 2025 06:25:11 +0000
Received: from SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 ([fe80::40bb:ae48:4c30:c3bf]) by SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 ([fe80::40bb:ae48:4c30:c3bf%8]) with mapi id 15.20.8722.031; Wed, 2 Jul 2025
 06:25:11 +0000
Message-ID: <3ee3adfc-5efc-43dd-9c75-23564fade7b3@amd.com>
Date: Wed, 2 Jul 2025 11:55:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] proc: kpagecount: use snapshot_page()
To: Luiz Capitulino <luizcap@redhat.com>, david@redhat.com,
 willy@infradead.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lcapitulino@gmail.com
References: <cover.1750961812.git.luizcap@redhat.com>
 <5e94d287b6174098938ddd9959cf3c0619fb610a.1750961812.git.luizcap@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <5e94d287b6174098938ddd9959cf3c0619fb610a.1750961812.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::19) To SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9aa)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPFF6E64BC2C:EE_|IA0PR12MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf92909-0e5f-46c8-addf-08ddb931329a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djNISi9GUEdqM1ZVOVFUOUJNVzF3SnZXcDBZVlFZU0d5QzZkOGkzNW9YcTQ3?=
 =?utf-8?B?bDV6UFB6YXIzOXFTMllVVnJuaWNQbWJtU3YvUkp6WlViUk5DR0hqN1RnaVJN?=
 =?utf-8?B?WTFhZTNZd2htWG1Ca3ZYT1F4ZThPdHJLdjg4TGd0U2JQK2EwMW5laWxHQW1y?=
 =?utf-8?B?Nzk0ZXMvdWR6U25LOEEwU3l5MXUxTWswZWxObHdSRUs0UmQwZVRSeDh1aUZG?=
 =?utf-8?B?c1duc2o0amtrcVNYQjE0a20yMk9zbGZCZG9VbGtRMXNTcDVmOTVOL2QyMEwy?=
 =?utf-8?B?cktZaFc1alFHL3l1UnhQSW83Tlk2Ry8zWDc1Ulc3N2xpTFRnMUJCSzV1UzQz?=
 =?utf-8?B?U0VXTks2S0dkL3djSGNUK05ESWVXazZoMlMvcENId1YvMlZJdVFFRS9ESXZB?=
 =?utf-8?B?ekJ4ek5xRXdzNzUzOTc2d1pNSjlsa2ZXd29sOXI0bXZXM21GOXFDbGE3OTFQ?=
 =?utf-8?B?WTZGYTBGVVF0dFgvZ1phbTVYazdQdTlqZUF5UHhqU0k4UmNhbXovbm85aHcw?=
 =?utf-8?B?VkNSL2VjbCsvRStoVWorbnRURGphbEpzb3BpTXBjNk0xSTFLTVJnTW9JcFJq?=
 =?utf-8?B?OUJPUEh6R2dySlpaZ2pWZmFtWXluWTdLbDRxY0s0b2FQaGVIVVlEdFpKTHFv?=
 =?utf-8?B?QXdzcWhZV2dNSmR4ZXg2WDcyampORExOV3NqRmVNd3gzYnhJRldDTElUbzN2?=
 =?utf-8?B?bnFOamRveDY2SlFVYXBhd00wOUJoOWMxd0RHY1gzTnRockd1WmVqNVlZVjZM?=
 =?utf-8?B?L0JvajRjUzdGSUZYNkt5RzI4YUlHald3eFV6d0ppcEYyUjhWbVFpaFp1a3dP?=
 =?utf-8?B?dktMVEhTbHBhVXlPQ0x5bEpoTjBZQVpvQm5LNE9rckhCSlRaalpqbGNnRzZo?=
 =?utf-8?B?TkhTeFh5WWpTczVpTXRYdi9XdFp2LzJranUxYmtvOXVvUlhtVWFLY1BRYVVh?=
 =?utf-8?B?Z0NRaDdoUktvZ3lSOEVWcmpTY1AydWVHaUZkenZ5Z3Rza1VsNW1VdEhHMnlW?=
 =?utf-8?B?S3JkZm45Nnc5SDdENzFsQzFJYklLbTFabFhRZVJpYkZmbWI5MDM5MEw5WU5l?=
 =?utf-8?B?Sm1mV2Q4eDFGSUVURlNZRXlMa3hBRFIxNkNqNDJZMDBCaXRCMTUwaVJHL3dr?=
 =?utf-8?B?Q2hnSmlZc0NZYUNsZ2xhSkx6QUNSUWVMSTRQaWIxUkhjZnhOZkphVnhTeFlk?=
 =?utf-8?B?azhNSDdDZTNyV2VQaWtFK1FVeWc3Y1JsTkZ5NmEwNWVHbE9yUmFNanhVbkVH?=
 =?utf-8?B?RW9SaUJsNTl5ck0zRmM5b2NYZmlheWN6Wk1BcDJteGZlUmV6eFAzTElKbVB3?=
 =?utf-8?B?bVBVYWJyVGNVbExZVnltcms0ZjA4VUlLR3dVR0hSRFlZMUI3T05SQmpEY0FU?=
 =?utf-8?B?VEo0WFFNeFZaazdEY2lHaDJveVI2QXVjNXI3N0VhRFZCa24xWWQ2UnhDM3Vp?=
 =?utf-8?B?S2c5Mkt6VUx2bjVWZldRN0ZqWXFKWkx3ZUhGa0VDUzR3eFBFdmlDQVA3a2xy?=
 =?utf-8?B?Y0UvdVRUb3dYWGxMSUw1c25zRUdaODNnSU14bXNhaTJVMm5MQmVmTDhpSHpH?=
 =?utf-8?B?RkRaMFhQenU0MXBmSG43eWpYOXNiQUQvOVdWUEM5aEVLRVZ4bmgweVl0NnNh?=
 =?utf-8?B?UEZ2bnlVNzQ4bWR4UzZHNndSQThJWUpjL0tNL3kycDkxUVJING83UkdNUHFV?=
 =?utf-8?B?UEMyTlBtc25BeG8zUlBDMTk0bFVCRnN0ZENBb1BReUdScXVKWXNWRU8xTGxX?=
 =?utf-8?B?ZWwrcklvU3lCTlFReXB0Z1Bad2VxRDJET3YzSHFWM0twanNhZnNXTFo5elVG?=
 =?utf-8?B?Ym5WQnQvbEVqWHY5R2MvV2txMU1naVNqbTlHL2lobjhyNTlKV3dFL3ZhWkQv?=
 =?utf-8?B?cVplQ3BqWkhKTDUzSE1kOTgzYVJoZkVza0xJd2w5S0lKendQbzcxNjA0UWFl?=
 =?utf-8?Q?a9l3kzrrJ+8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPFF6E64BC2C.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZiK1J6Wk0wQWlyakRJRkpIa1NCWCtOZngzTC96dTA3M3lQUlRmd2V6OUNr?=
 =?utf-8?B?M2d2cXFTQ2t2bUFqeXJWOFFlTWwrcFlMTmJ2UE1BK2hUTUJJVmxUVFZTOG1w?=
 =?utf-8?B?ZXRxNW1TMmljTXdkV0dzZ1U1aG84VjZrYkZ4elRiSHREei93MGNSOVZ3dlUz?=
 =?utf-8?B?NTBrNmNZTlFXWnk1aE1XMCsyNVBweHp0WWxEUVk5cUh3NGVIQ3lLNVlITFYz?=
 =?utf-8?B?T1I0MkdpUFJ2cnAwaTlCbXdUUDlUc1RuYkZYbUxLNlExVU9aMnF5Y3NRN2dX?=
 =?utf-8?B?NnpiYjl6UFd2L1YyQWpnSmFtSGRtOGIrZHZ4Q2R3NVUwelhXNTFMOHM5a05w?=
 =?utf-8?B?aHA3aHVacEdUYUQ0OEROdkJkajBJenFvVVZJVFAzZGN5RE51WEh0b0NRNFFm?=
 =?utf-8?B?dnpLeC8vZE5STVgwS0hrQXpmN09URG5HV1VKMFRub3YvVnNoM3Y3OUZZMzNm?=
 =?utf-8?B?N2l3UFRVNkk3TjFhY2J3VVZsVE5YTEJ3TTF2aVBXeVNmbWJtbWg3YnVmTi9B?=
 =?utf-8?B?UW5reGs2ZlNvem54ZW1zQ0dDYnhNWndkWGxiL1BYR1JsMEE2aXRoTk52MDlz?=
 =?utf-8?B?emUvakdsaWtsN1RYZDdudWpLdXprSlhXdEd5MjBnZ2RST3YxNnpqSmhLNFNz?=
 =?utf-8?B?Q1JpdzJ2OER3SFdhK3hCd2JSamtqWm1LM253VllxWkZybEJMTXJSeDEvWHpK?=
 =?utf-8?B?SHVCM0hGdXQreWkvZ1RMNFVBUjAvbWkxTlFIcGt1RVhVbmtEdmErZDVRNlhB?=
 =?utf-8?B?MU51c0hCSExSVzg0Y0NKZStxT0l2QkNIUEcvQ25tdTFOZkE5MktqZ2JiNUlJ?=
 =?utf-8?B?eVJuN1RJWTc0RUQxSTkzSVdrVThmZ3JLOEdZT3lpRVJ2NER4aXF3ZW5WWnNy?=
 =?utf-8?B?ZlFDNFRPWWZvdXdQSnRCd2VabXVaZ1JYdU9rM1g1V2sxWW1vNjNHK3pialh3?=
 =?utf-8?B?bE96UFVYUmIyMm1qejZGUmxOZGM0UjF4d095S1pPZ3R6d2xVRWRpRmc5N2Ri?=
 =?utf-8?B?YUdTM3BaV0tVaG5KeXFGQ2c1cXFTRlBmTm5MSEVMc241QStvTFVzblV0WnVt?=
 =?utf-8?B?Szd3VllnWTdmSU5sMWJqZzByYTFVaGRMSU0weC9uRGxqWVpReUFUNmZmMXFV?=
 =?utf-8?B?YU4wNjJuc0ZpSU9OckRhVzFkdVpGUHcreHJkbFRtVGd3ZmtPNmNETDFkU0Rk?=
 =?utf-8?B?UkdWRC9odzhyd0NwZEh2ekZsRTRwM0FoRzR4MFdQbDZlVTh0SFh3blhERlZl?=
 =?utf-8?B?T2xSZ0VvRkVjZ0o3ZW9YNFh3L3JHSEpDRTFSN2JjVDVHbWpnWGtEVXdwTkpz?=
 =?utf-8?B?YThkSlM5b1k5eW9hVU00aWwxTjNFTzZlWHJqWmQ3cHl4NzZpMjY2S0RWMmlk?=
 =?utf-8?B?Z2NvZ3E1M0hkVzB0eE9XM0E3ZDl4U0IrZjBlVmlOWXF4NG14QndkNUFFb0Qx?=
 =?utf-8?B?aGppeGpFeHNyMDd0MHNtTmZ2bWJzWVovd0I1c1NwTjVxUFB3c2ZEU20yaGJM?=
 =?utf-8?B?UHovSXFlaFliNFphWlJVcSsybmphZWg5YWV1WE13Y0pJWGZ3dG9JOHBuVFJN?=
 =?utf-8?B?d2lpeEU2RzkvdzBYS3Yrd2lLT3JYUjNIYUMxNzlsU2lwRCs5aWtXQzVYYVV6?=
 =?utf-8?B?WmZoek5zWDRhcW85RmRWc282UXhycVhaeUJqUTNaVjdYa0pQR0JVMEZmSG5q?=
 =?utf-8?B?dXoyYVFMSDlBaVNUbXhjRUEybmpwNk5kTkFnKzZObWVxUVhvMXJZNTgzNmZ0?=
 =?utf-8?B?WFhvODdjZkhvNzZKY2NRa2dUenVROThCbThsMEFXVFNCZ1RsbTdUdEpEOUww?=
 =?utf-8?B?MXVjR21Qem4vbkdpeFIrb2Y1N2hlVis1NGM5NkRRajdhMnhqcC9tcjFwNXFq?=
 =?utf-8?B?TldtNUs5Q1BFeXZYQXZ5Z0s5WEh6TW5lK2RrbldCUEszMEwrdXlKNGE2VkUr?=
 =?utf-8?B?QzJrdGxVaGRjODBjMzMzbUNRZkZKV3ZPNU1pUHNkNUJUZVo1V3VwcnBOK3FG?=
 =?utf-8?B?alZjN0FMeUtRY3ZPMVZDRGIwdVlvajgvRFVyS0hiait2Sm5ETVVvWFg0Z3BZ?=
 =?utf-8?B?bGdkcFppZEZPY3I5Q3BHRjFmVE9saEhsNkJsVC9zUGxOb08xbXF5OGJYeDFZ?=
 =?utf-8?Q?7fFUWQr+KHTHAQO98do5Tv9oH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf92909-0e5f-46c8-addf-08ddb931329a
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 06:25:11.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ka5qwIZFE4m73QZAGMrsapqaB3EqNCPkKGvUigxHqfhHKVLps0SHYL9CIjgbdUZpz7Tb1HoS1rixqb4FNb4T9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556



On 6/26/2025 11:46 PM, Luiz Capitulino wrote:
> Currently, the call to folio_precise_page_mapcount() from kpage_read()
> can race with a folio split. When the race happens we trigger a
> VM_BUG_ON_FOLIO() in folio_entire_mapcount() (see splat below).
> 
> This commit fixes this race by using snapshot_page() so that we
> retreive the folio mapcount using a folio snapshot.

s/retreive/retrieve/
checkpatch.pl would have flagged this.

Rest looks good to me.

Thanks,
Shivank
