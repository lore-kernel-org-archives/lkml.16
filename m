Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11020092.outbound.protection.outlook.com [52.101.46.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEB719CC0E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746467628; cv=fail; b=MVCNbkqswsT6Dake/imEz0iUwp1aH/OxZGZEy+bEV8UUVYqPeJsc15Jyp6kmVIFs7kmrbHHyKW6uhToZ4swKzqDWEOEvxxS3tbymU8QO5dzOYDkX4JjWaeVKjTNPLu4j33hz1aCBZlo0Taw1Ikdl8RlEj2WOeg6Kmt2Kuvmhyz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746467628; c=relaxed/simple;
	bh=pFlqScHQLhbv84lcnlydEUPpFBDWJXVAHRpzhujWjEo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=evPEC90hmx88M2slvTStTBDebSzHoGuIQYL/l++6XTkgEAak1NUsiwb3ocQTbzXNZBb5qpS2QmfmGJpWBpXCJ9/sjGEog5mceekjRdaCE7gTv/1s+4MQv0ftH3JxczVbALrAm835Vo92Ob5DhilF+V3M+j68s3L2uc//6wwvf9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=vqm6yQwC; arc=fail smtp.client-ip=52.101.46.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="vqm6yQwC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5WI1wwlNQ8+SWtI538falvBp66EQEtMtOZqvxJVc6qiOPbS725ST7CqqeqXNhT0PnE7O4FiVruLJFZND7jCWZxrw3ILiYCmYBMn3TO5Z8KVfXfOs+oISJQqnj390ngj4xGiKGmNNaskSypeaK1+lIp7uGUEWm9xdMQIagGZMksOzGQx/wNniiQkIqDanqYHtBGVPVi8jk9ITsnSV5oAO5TFRYAIdM+Zu0eFbU0eGJ+tuvrVfH2PyrUDJk/5oskYgmG0vlGtiH2p+FFdpSgWyguY2zF0IZG6mu+LI6wlnu2r9e9gemLJpbaNqgKjC1qrr+lpq9kDWrl8xniK1SfZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4yGAG0WQIq54+BDZQdnRKvixOlgMHm2zo4PT3lxSxQ=;
 b=KwKlPL2NrF+BNhI4PlvoBUz69XaX4mErMX0A/YdM5I8kge4V9zAOGgFdzPdIvy40QEXKKEoHSg14h6aGO/gKhikHegTpg76+r0zzVNuduTzE8qTiny6HHTcb+b86nVD17Ko8FPOUH9+6IxQbbXYMr7omIS/FDmtmNvRsfd28ULDCc2yiwye/4aGhhxyFEXQ6H5zn0vQ4O97cPQ/Iclk3eSRJfH/Gli4wBIiomZTrGOgi/3xj/EbaUBoy21x/AR+dXvFsesB8NXMMcm/lAnsCLQ+AZ0cBwwWW8sq4ks9+Qqev3HKMgCwG0Bd/c9N1lbxPo9IEKDmO8Jo2xsGgA5u61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4yGAG0WQIq54+BDZQdnRKvixOlgMHm2zo4PT3lxSxQ=;
 b=vqm6yQwCkSw0bridzHpyOKwxdwP4gyNU7kgSvMSNA7tat6KzlXffL3MEatteGXM0lV0SX56nm65eK8wTe4euU/6/nFAowUumeEMR7bBjGv+yF/WnuU5fxpCvxObsRtSaW+uh7Da8twGjb4A+tOqbuc+wSUm4Y9m5l/wm+ugOdcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BL3PR01MB6836.prod.exchangelabs.com (2603:10b6:208:351::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.29; Mon, 5 May 2025 17:53:38 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 17:53:37 +0000
Message-ID: <f6d3f386-06ac-4580-9bcb-d17bed0c55e0@os.amperecomputing.com>
Date: Mon, 5 May 2025 10:53:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ignacio.MorenoGonzalez@kuka.com, Liam.Howlett@oracle.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>
References: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
 <ad1aa0fa-f1ab-4318-b423-35f59ebf0599@lucifer.local>
 <60bc73b0-48b3-4529-8a73-2b85e3217e59@os.amperecomputing.com>
 <ee95ddf9-0d00-4523-ad2a-c2410fd0e1a3@lucifer.local>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <ee95ddf9-0d00-4523-ad2a-c2410fd0e1a3@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BL3PR01MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 514e7126-c856-4bf5-a2f9-08dd8bfdc349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnRCMVZOcmZpMXdMMy9UVjlBZnB3L1hxZlgyK1NqYlBiTnNpaW1YRzlCZWsz?=
 =?utf-8?B?RERzajFRRzU3TU0vdDEvM3JDWEVGcWNKUHRsdEtpNTZZWHZ4ZGo4YlRpanN3?=
 =?utf-8?B?ampWVHFhUUd1U0tnWkJhbjJHamFZNENOd1FpSTdVL1hJYjRvdjhxUE9KYXRZ?=
 =?utf-8?B?TFg2a05WaDN3bFVWSXZDS1hKbi9rYmNBQ0hKR1BTblJ2cDM3RkxVL3l4V0E2?=
 =?utf-8?B?QnpWaHJuZ001L2hzdThROTRWWnVleGZrZXU3SWk5Q1Q0S0l4NWFrL29FTzgw?=
 =?utf-8?B?akp2aWZDYWlHa2VJS2cwdGhEZlRoVEdLTzZPRDJvc2hHVzl0MENPOFhqSjZX?=
 =?utf-8?B?QU90QkFUOXRkcEpIc3BGaVpRenNrVWZYV0ZlSFJ1UE5zT0psUmpCMmx0b3lo?=
 =?utf-8?B?ZXFXRjRjZFJNajBDc3k3eStVd3BWbFRnaEw0dEpaaGNFZFNrY3hHNklwN3dL?=
 =?utf-8?B?VksrTlNRR2dZb25yVUh2NlFGVjkrdjJaTmNNbUxtQjRpdC8zUjdrTkgxQzBV?=
 =?utf-8?B?Yzg4NUpDQWJvVUdlUXJabjlSUyt6dHpkTFgvOHdNV2grSXZnMTNBdXBmMW5j?=
 =?utf-8?B?TThBbVprUXBKeXJrMGxlWXhVZ2Z4eVJ1L3p5c3FsZG85UmQrYWJDZUwvaWN2?=
 =?utf-8?B?dVl5NEJTZU50SHdqMklFV2VtR1ZVVWJ1MUNFdHNrTW1lUDRiNGtEZ0EvdzZx?=
 =?utf-8?B?MmozNGE3UzF1RU1CblUrUUVPbXRtR00rK0RjM1pmTjI2ZGtJU3ZRbC85Mkwz?=
 =?utf-8?B?S09oRHJMbDdQTUNqMFRRU054TzQ5cElob25SbTd1Nk12czNhdlcrQ3RTZzFZ?=
 =?utf-8?B?NkZHWnI3dzA5dk1aeDJyY2FtUXJiVTBua1JhNjlndkdSYkl2Y1N1MW9jQm1S?=
 =?utf-8?B?TmpiY2tySlpWZkhuUmZ3SlB5VHZxTnhkR1I1MWVwb3JieXprajI0RVc3ZE1D?=
 =?utf-8?B?K3gwbmFnZEFRelRlTnZQUDh3bWcyTnhtZmtKKzFwTFB3S25ucGZnbERKRHJM?=
 =?utf-8?B?aGZLSTQrbU12Z1VmS0VLWmdoWHMzM0s5RWNRcEVxcTNaWXlwSHRTWmNRekZK?=
 =?utf-8?B?Zk9rdlNMcjBXTWRIUjBIL01Qam4yT2s3ajJpQmZvdEpFUWNjOTQyaDh5RDhD?=
 =?utf-8?B?UE51amlnRG5KL1ZGRWhyKzZJS1J6RmtyQ01lZXVQeFBjb2NMbUpCeXh3M0VK?=
 =?utf-8?B?eVZMamJsTHBlVTRIdjBVRGUzYk1DdUY5UjB5TTZRRjBpWmRSUmZ5azJPelgv?=
 =?utf-8?B?YmJyNHQwOGdJRmNyTDVhaVdRc0V4ZDRCeTRlSGZwd0FaQWFXNjlnbytSSEx3?=
 =?utf-8?B?TzNCWk9GQnRkZ1dEK0hZOVJLRmNsN0dCeURiNE1lc1hLMklmMWdHUjNwekx3?=
 =?utf-8?B?amVuT3BRK2hDMWJhNTFnSFBVVlIrUlVQdURXQ1lsRHRrVFNWTXlOKzFONWpO?=
 =?utf-8?B?U3pmdHNSQkMyK3pOMll3N2hRaS9ubmpVYW9XTExIV3VNNmpha2VTbllCRHhs?=
 =?utf-8?B?a1o4VmlNMW5ZU3QrUHorQnZvU3EydWptd0FIQ2FRV3hiR1l2ZFFqV3V1Z09R?=
 =?utf-8?B?RDM3eElNdDhGRXFtemo4bHJDK2xURkxVNGQ2QXJZaDRlMWRvaHJ0V3UyVElK?=
 =?utf-8?B?ZGw2ZWpMdGZub2h3R1FMU1BLQkNHUkxzckwwdkRoajBWbkd0ZkFvd1lPOFNn?=
 =?utf-8?B?ajZXa3g1WnVEWWFOd0hObWU0Rml4a0V2T3VialZWaisxRnh0N01QNzZxZHBi?=
 =?utf-8?B?V1NCSVhobUpjK08wZ3VxeFpQelVVRnl3Mzd2RDBkRUNlQ1FTT1lrcXJDWGNj?=
 =?utf-8?B?NXptT2JmWVZTR1pjTmRxVXI4UlY1MkxvRzFrb044ODFDc04xUEtTOUdMZ1pt?=
 =?utf-8?B?cjFkU3N0djg4SmRibGQ5aG1CK2pnTG9WcUVtYmE0bkgwbXhqQnBJaGFSMy8v?=
 =?utf-8?Q?q2VJX+0rvok=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVBJRzJYSHRubGltVEl3aTVlOWc5MDRGb0luOVdzOUZYd291UTV2b3RtV2NU?=
 =?utf-8?B?OVRKRHlvaWljNHo5d2QyNWlkZXlETmlMVURjdFRtZWVsRXJGTUNlbzk3U1RZ?=
 =?utf-8?B?eG5wRm1jM1hMSjJHUWVEOUp4MGp2Uk5ZMnYxYXhyUUszRmtGTENMVUlrclI3?=
 =?utf-8?B?UlJ5bm5uWEsxaStVWkxJZUhtWFVWRjQ1ZmFYaFB2Mmp1S3RGNURURnlnY2Fm?=
 =?utf-8?B?STZMV2oxR1JtOFhhZGM5VHpreXZjbTYyYnBkNFBpZ2FWR241eElwKzJOWU9v?=
 =?utf-8?B?SWo5MkFURUM5VTc1ZWN6Rm9Sd0MyK21MQmw0NC9YcFFucm5ROHlGbjE4VzBT?=
 =?utf-8?B?L2tSU1RJM1puS3VZYkNZV0swcWpMUWtnblU0NGovUCt0cjJuMk8rRWNOOU91?=
 =?utf-8?B?bCswaDByVXlzT2ZUTWhzZDZpelRZbW1DYjcya1VkTmREL21oc3RXWU9rMm5n?=
 =?utf-8?B?WkZEakR4NVdmS1ord3hEOC91c3RyVGdkL0JLTnJlL2lnTWFySk5hM3VHOXQ2?=
 =?utf-8?B?eDFWWStzUEpaL0ZUS2p2eTZ4eWxOd1lHMFQ5OGtqbS85VTRHRXNyUHhyd3Ix?=
 =?utf-8?B?R0xlaTJza2s4TnJTeG56T1paUExieXhHbVdkWTFsK0JFUWMyZEtFMnAvdTdR?=
 =?utf-8?B?M05weldWUUtkbVkwMUZDTzQxb2JCenRCa0FreDlmN2Zldi9zWlZBUzhVcjM2?=
 =?utf-8?B?czhxV3VFQ2ZZNWNqazY1djFUYTlsamY5WjZab0hEVEpZeUs4WkpDWmxzQXA3?=
 =?utf-8?B?KzdHdjNuaXdLU1pSWlhhYkMwaWsrZnA2NVczNTZOaUhXVjJCbEQxaXNNMkRh?=
 =?utf-8?B?amJ2TGZrTWducUthWW1vQURwcU5MVzl2enkzRnU2NUdqc3I2QmJGOEFWZW95?=
 =?utf-8?B?K3FlM1R5OHREemdHZ3o2QklKc0V3QWhxTFUvM0NlM1l6bkhuTEJ0ZlBucDRs?=
 =?utf-8?B?akZvdFVlcnpVbXlkclFsYzdRc1pIcFRaN2JpSFhtNzJ3LytvUlJleEk5aUdj?=
 =?utf-8?B?TllzYVlMRE44REFNeFIvYys4NFBubTJmZEthOHBmTXdHbnpLZGRmYjBjcmdj?=
 =?utf-8?B?b1dycURXRmtMWHdGYUUxbDFweE4rUFJ4TVpzQXBMS3g5Q0IzcTE0c2JNVE9v?=
 =?utf-8?B?T01UWjVlTjBLYnFYVTE5STZQOU4xSGVPQkhEQ3FVdVhZeG5VZlBWWlg2cUhr?=
 =?utf-8?B?cDErZHcwRUZXVEZ6K2F0U0lwbkVlR096eXZBRm1TRUkxRDh2YnA4Y3pOQVc1?=
 =?utf-8?B?N2haOE5saVNjOHJTN2pITG9EWTlsb2oyY3NueVVYN0x5VlNJSWVwelk0RFpu?=
 =?utf-8?B?VmtwVTBBakIvT0RtUzlTdUtTRzJXN1haU0pmSlBSVXc0RjVzYjRpUzFtVW9N?=
 =?utf-8?B?V1M4L1ZkazluSFlOU1EwYXJyZWppbmxXZjh1dzN2TlZqL3RCSGNYNGZpL3Ns?=
 =?utf-8?B?MjJROXpMOVU4SUg5TUk3UStsZDBjRjFqQTRkRHdjdkd1OUVvbkdzQW1PRkQr?=
 =?utf-8?B?SS9YNGtGQ0pCQjE0SEN0ZnFleEZqU2dhMVc1MHBNNlllNU1GYmNQSDlzZjY2?=
 =?utf-8?B?d1hLQVBpcGNxRFdTM2h1VWd0NW5Ba2V1NHZsNEErZE9PS2U1NlZhWjdOOENu?=
 =?utf-8?B?ZVRzZzZXU1NUVlgxWEFqdVF3Ky92WGhSa2QyN1hLL2M2TFZwMjFkZ3lwSTVL?=
 =?utf-8?B?eUo4bmU0bEJ1TmFxT0FIRmY2RnVTQVhUK1hGckJYY1N0YnhNTXVzc2xualBa?=
 =?utf-8?B?Y1BQOWpNaHRPVWNKS29pNVBCQ1dhSVZPNk5wTjRQRUVadzJLZUVYRjZuWVRZ?=
 =?utf-8?B?U3hIM0txbm9MN0NsQ3o0OXNQbUpVK0FnQm16N3BDS096THdKNUV5cklNV1pR?=
 =?utf-8?B?WkVsUWdBaUNLaEZOS0NGV042RzlubHZIbXl6RXExQVBVWG1vUFE0bHhSamZR?=
 =?utf-8?B?TlJub2YvczlQSUoxNU1jeHBlT1ZmZysxRUpGeEpqY1lkaHgzY0ZTa0pIQkpO?=
 =?utf-8?B?UmZ0am5NMDByU05NRmlpZDZNcDErSkd5K3pTZjJzMUtqUUQzdzZIZXQ1KzFu?=
 =?utf-8?B?VFBpYmYwa1JHT0gwdEx3NnhGellkalZ5NE03MmVWdnJxL3ZhVHdCSHAzdGFZ?=
 =?utf-8?B?dzNPSS9IbXhkY0JYdjBzeHp1cDh6bkVhV1dPSHV2NnR5bUc2eCs3ZGxGSjR5?=
 =?utf-8?Q?WboKYCetHvArLrI0VSKcQaw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514e7126-c856-4bf5-a2f9-08dd8bfdc349
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 17:53:37.8426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAp5huPH0giFPF9LwI7OsngUEvWHJE78SASDRbvNivC6TUsMabRWtcCyl3xLOXt0GuhS41BETwRdGE9kHaGZa1idKxJTUr9MDaW8Y86D3Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB6836



On 5/3/25 2:50 AM, Lorenzo Stoakes wrote:
> +cc Matthew
>
> On Fri, May 02, 2025 at 01:53:15PM -0700, Yang Shi wrote:
>>
>> On 5/2/25 5:46 AM, Lorenzo Stoakes wrote:
>>> +cc Andrew.
>>>
>>> Ignacio, you should always include Andrew in patch submissions to mm :)
>>>
>>> +cc Yang Shi who added this in the first place in commit c4608d1bf7c6 ("mm:
>>> mmap: map MAP_STACK to VM_NOHUGEPAGE").
>> Thanks for cc'ing me.
> No problem!
>
>>> On Fri, May 02, 2025 at 11:31:41AM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
>>>> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>>>>
>>>> commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
>>>> the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
>>>> CONFIG_TRANSPARENT_HUGETABLES is not defined. But in that case, the
>>>> VM_NOHUGEPAGE does not make sense. For instance, when calling madvise()
>>>> with MADV_NOHUGEPAGE, an error is always returned.
>>>>
>>>> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>>> I don't see how can this cause a problem, and it fixes one in practice, so
>>> LGTM. Though see note below about CRIU :)
>>>
>>> I also added a nit below, if you address this you can re-use my tag.
>>>
>>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Yeah, I agree. Looks good to me too. Reviewed-by: Yang Shi
>> <yang@os.amperecomputing.com>
> Thanks!
>
> I also believe Matthew's suggestion (see [0]) is very much worth doing
> here, in my view doing both is a sensible approach, would your R-b tag
> extend to that?

Yes. VM_NOHUGEPAGE is a no-op on !THP kernel anyway. It is pointless to 
fail it. It should be unlikely any real life application rely on this 
behavior (returning -EINVAL).

>
> In which case, Ignacio - could you apply both Matthew's change and address
> the nit below and send a v2?
>
> Thanks!
>
> [0]: https://lore.kernel.org/linux-mm/aBTCtOXBhUK_FLU6@casper.infradead.org/
>
>>> Thanks!
>>>
>>> Do we want to back port this to stable kernels? If so we should have a:
>>>
>>> Fixes: c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE")
>>> cc: stable@vger.kernel.org
>>>
>>> Appended here, and Greg's scripts should automagically backport, assuming
>>> no conflicts or such (I don't _think_ there would be...)
>>>
>>>> ---
>>>> I discovered this issue when trying to use the tool CRIU to checkpoint
>>>> and restore a container. Our running kernel is compiled without
>>>> CONFIG_TRANSPARENT_HUGETABLES. CRIU parses the output of
>>>> /proc/<pid>/smaps and saves the "nh" flag. When trying to restore the
>>>> container, CRIU fails to restore the "nh" mappings, since madvise()
>>>> MADV_NOHUGEPAGE always returns an error because
>>>> CONFIG_TRANSPARENT_HUGETABLES is not defined.
>>> Yeah this is really not a stable or valid use of the /proc/$pid/[s]maps
>>> interface :P CRIU is sort of a blurry line of relying on internal
>>> implementation details so we're kinda not obligated to prevent breakages.
>>>
>>> CRIU is kinda relying on internal implementation details so debatable as to
>>> whether we should be bending over backwards to support.
>>>
>>> BUT, we also don't want to cause unwanted issues if there's a simple fix
>>> and this seems reasonable to me.
>>>
>>>> ---
>>>>    include/linux/mman.h | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/include/linux/mman.h b/include/linux/mman.h
>>>> index bce214fece16b9af3791a2baaecd6063d0481938..1e83bc0e3db670b04743f5208826e87455a05325 100644
>>>> --- a/include/linux/mman.h
>>>> +++ b/include/linux/mman.h
>>>> @@ -155,7 +155,9 @@ calc_vm_flag_bits(struct file *file, unsigned long flags)
>>>>    	return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
>>>>    	       _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
>>>>    	       _calc_vm_trans(flags, MAP_SYNC,	     VM_SYNC      ) |
>>>> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE)
>>> NIT, but can we use ifdef here for consistency? Thanks.
>>>
>>>>    	       _calc_vm_trans(flags, MAP_STACK,	     VM_NOHUGEPAGE) |
>>>> +#endif
>>>>    	       arch_calc_vm_flag_bits(file, flags);
>>>>    }
>>>>
>>>>
>>>> ---
>>>> base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
>>>> change-id: 20250428-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-ce40a1de095d
>>>>
>>>> Best regards,
>>>> --
>>>> Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>>>>
>>>>

