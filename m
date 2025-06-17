Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75AA3BBF2;
	Tue, 17 Jun 2025 02:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750126305; cv=fail; b=ShQjLFT9My/O19oKebTQZLZb9sG/ZGGQRDqZZ8oJ4YkTRXhHCgx4Od8P8edw6ZCjLhCTjDw8wDK7P+7ckTq4H3MwnY/pjFdH2KoXh9R7HoNLbGgA8UaP36dAHmnOXiTQ4y6pPTrfS+aDKB5VUPS9h3QCwCRoJ54tkYXCdqLMO4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750126305; c=relaxed/simple;
	bh=y0x8pSK61lKfI5iO03VdL5pO219c737mRCrlcKn+K7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tQyyW/g92EXA+mwAWOm32982208Y8QBUnlHmnio6goO4WJFgaoL5sPrvUAzO72OmVGR6PsdqA0LpaMX6RImADKDHiclnTLX9NJxIDxrDipr5yRR3bDjFyRHSi6SLYUb12UDZb7SlZBWqJ8pMg6mR3jVKXrGEMLYRYgKKR9TNe1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GKZdam000961;
	Mon, 16 Jun 2025 19:11:24 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3td9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 19:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCL0xgfNi9mxWVbcYeLSxF1cDD+8RP6dLHLs092Dm//iyPTKiPqfCBjW2R0+096fC2DD/IYPAaXtIgpIRLMMYWRVXW4j54oCfs9XJHsqpZpkYpQldf05D+hbwMmsW7IbHHx7agxhca+QnRAvAwdKA5mq4Gg/FS0WzRckXobaN0HwMvUJA6XhpYCgf7HQ63rhUa9H6w2PrQkWS3ra/5NOk6z7dE/Jxs+q4+4IAqH6QFJ9XeAQ2SkjHtkz8Aau7wQTma0wkQjJolfcYVGfbmLy2ysX/eA93Aht4rJop6WFYQoE7XNAgFIzpqfjkW1lO5jaHFkoXXUdWZK6NAU/gz0Kvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaB0g54WbdWksxHWjQH5IDIfIsVQfQ3Lg7BOuDPcB4E=;
 b=Jt5ESF1dzCXm6H8NlQ4ondzOkwPMupsSQCwCG0wvdutMIjTkNcYUMeWf9w9VQGymK6SFH5MH3r5briTVyfXUMf4lurhB6PPegosXsukJQK2bd0g00DwcHnzKhvJAC0fSBeEY5mSXhehnN6ckEwjBCYNEMn3qLmXELIIcyP1Cb299VPjy9VhyLI090YCwnDrvoctqyRptkLUqO/QpafhfspfDmX6Bp5Nam7NyZnv+ZHC1mM3NynBtGOU9N26gf/EO0tqFwpuWdUHJseZZGlTRkk7YripTRo5ew/+OpS3K6E51zyy7BEyJlAaJgCjFyCDNRZXVZkQvsNJlLT0L4dokgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81d) by PH7PR11MB5861.namprd11.prod.outlook.com
 (2603:10b6:510:133::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 02:11:21 +0000
Received: from SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com
 ([fe80::71b1:1b01:cf93:1447]) by SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com
 ([fe80::71b1:1b01:cf93:1447%5]) with mapi id 15.20.8835.019; Tue, 17 Jun 2025
 02:11:21 +0000
Message-ID: <dc9e8093-6439-49e8-affd-44accd234a1a@windriver.com>
Date: Tue, 17 Jun 2025 10:11:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: fix slab-use-after-free when
 clk_core_populate_parent_map failed
To: mturquette@baylibre.com, sboyd@kernel.org, dianders@chromium.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425052358.684022-1-yun.zhou@windriver.com>
Content-Language: en-US
From: Yun Zhou <yun.zhou@windriver.com>
In-Reply-To: <20250425052358.684022-1-yun.zhou@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0236.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::12) To SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81d)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF2F7FC4EE6:EE_|PH7PR11MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: a9247de1-11c6-4464-066f-08ddad4440ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2pVeldRM3NyMlVKT1dWNVdYQ2pLQjNzMUdSaGFVVWFNamhBRmJOMTY2cDMr?=
 =?utf-8?B?RmM0K0dZRjVtbmJadE80MFlZNTI5blMxMkpuMisvZXBYbjlxV0RuM2NhNGVr?=
 =?utf-8?B?S3MxbUdyOTB1RFppRndRZ2ZQZEQ3SjhycDhqT3BDNUN0UDNWTXJiNEgzR2ht?=
 =?utf-8?B?K3I5eG1uMG1wTEcxMmtqMXdhTkUzYVhvWFB6bFY3NThRY2RQblRsazh2TWJl?=
 =?utf-8?B?aXpZZS95Qys5SUloU01SR3ZQc1E5cHNmeXFSOGNNam51RnM1UmlVd0NwUDg1?=
 =?utf-8?B?R3BXeUtrS1U2ci9mUGNLVW1aUUN5bkYrcjZLandHMm9Id2lqQWdidXZlV05J?=
 =?utf-8?B?SHIxREZJK1I2eFJqd2RGQmR2OFhWWHBIOGt3b1lzYkt2UGE3QlJ2OElqMFVz?=
 =?utf-8?B?S1RCVUZyeFJ2UVVCczgvWUVOa2RwelV5ZXhNUFUwUVNXTXg0NzJVaVpQZ3dn?=
 =?utf-8?B?Ym80ZzE5VzU2R3hyK3JndnNpY3lTUHJJUnBXVGl4MVdIdlJ0WDdJbGYxUERo?=
 =?utf-8?B?U003dlM2VmxFSXZ0M2xQNmhaVzJRUmZlb2trQ084dXp2Yit0SHpWUEVGR3ls?=
 =?utf-8?B?UlJJSDdlblB1VUpCekFsV085SXF4UGhIY3VJbmV0SG1OL2ZKM2ZHanRXQ2tO?=
 =?utf-8?B?YzdKR01vSWxRMjE0Y2tmQWt6clA1cGQ3TmtZelQrZmFvYnNUYXZsbUR1QUNY?=
 =?utf-8?B?UVVpS2RXZEFDa2YzeVFqaHRiaUwra0VudlhEc1FIcjFaT0Riaks3eWtyMitn?=
 =?utf-8?B?YUE1cEJpT0JqOEpOZ1RJM09ZclBST09ZeUxESlFFVVNZZGE3bTFEdkhva2Qx?=
 =?utf-8?B?TzFQaHF2TlVDeGJIQXlLc1QyRUxOWEJCM2xXVlpicWpJU3NHNFpMbXVUejV5?=
 =?utf-8?B?L2tMcGdHUjREbE9TREtxVDZudmwySUh3TitGS3NVR3dVemluNWVRSUdxV1l1?=
 =?utf-8?B?dTdNVStrS1FhUURNY28zb0FKUHhzSkhhUzNKMGtacEFjdkRZUFh2OXF6d1RD?=
 =?utf-8?B?dTZleEs4eUhSaXdBVXh6Y2hqRWFKZEFQVHl3dkloajV4ZHlTR2dvNk9FUU55?=
 =?utf-8?B?OTNTcTY2WkJNMU5VbGp2K0l6Q044K002bGFEcVZYdVEwKzE3NDJlYmVTSm5L?=
 =?utf-8?B?T1k4QTdtQWExQjhtSDJneEpjZHFBdFBVL21jeTNsUm01UHpkWjZNZGkxQjRG?=
 =?utf-8?B?ZFVkc052eStDdWExS0NaYmQ3bFEwZnJFQi8rVTJnWHhScU4yZ0VjR2hJbjFJ?=
 =?utf-8?B?bUdrRVVja3UrWHZkbi9YOWtXNjFiWHFQVEtITHhvc0M2cDZlZUphd0NPZ0lQ?=
 =?utf-8?B?dmducmdaOTQvYk9GMFB6Ty80dUZxbHZucllmd2VSbkZPbUJSWFdIaitWY3ln?=
 =?utf-8?B?MjVXVVpWL25tMTh3ZGpUN1JoRXpiS1Y4VndOWVJrQlFXcDkzdUM3YkE5RnQ4?=
 =?utf-8?B?MU1Jc2JWbzZ6SlVud05qRnZLUXBuUFI5S0E3Z3d1YXRoQzUzVEtHYzVzak5w?=
 =?utf-8?B?RXI3UnQ1MUhRWHBaRk4xZmM3L1RZb2RDdS9FOGNXcTVwZVFnYXlTNEx4M25V?=
 =?utf-8?B?cnd1R1pQSXNkaU5aV0pOdW1PenlRNDB2bi9zckhOU1FMcEZFWTJGNFVBdjJY?=
 =?utf-8?B?eEVOUU5IeEVXelZFUzJIR3JEcVUzWHJEcDl0ZVVZK0IyN3ZnQXZpQitUb29U?=
 =?utf-8?B?c05qUC83YWtaT2htNGpkSWZndGhhWGJvTkxmVGZNY0hXVjRkcFJhT1BUQUNt?=
 =?utf-8?B?RDNBcVhJZjVUWGV5cVROQkptMDh3ODFBNlprSk92VEVuQWNFVVBrNUFQdThh?=
 =?utf-8?B?WjBhQmhhMzRiWVNzL0t0SytzbTJ1dHFKejJFRm0xTlpXV3FrZHY5UXVzQ1dK?=
 =?utf-8?B?Y2pXTHBtdldFSzR4NDhkd2NpQlBTVlRUZElOUXFiSlNaWVc4MzF1bEpCdVBM?=
 =?utf-8?Q?Mo6zakN+cfg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0lCejFtVm5nMng4QldvbWpnakRpbnlXWXJIVUJiaDhVQjNST05YcllCSkhM?=
 =?utf-8?B?dndNL0xmeHRDdXJudlY3S1dhZHk0aXZkTmxBUFAyT2IySnE4WEFkUFI5dnM5?=
 =?utf-8?B?T0R3R2FzdXIxdjlyTkZENm5CQnVxVEdMRmhYdCsyKzBYRWluUnU5eGIvcHFh?=
 =?utf-8?B?YnhZa1NsYlpwanI2ZDdsbVVSNFNWajROc1JoSytCaEpEV2xEWGJWd2tRK09j?=
 =?utf-8?B?SUl5RjVrQ1VwbHcxWlZVSlVFTU5aUnN3bUo4ZHVzc2UzUk1GdWNHMUFuWXha?=
 =?utf-8?B?NzJML0E5RjFrSEIwZVZ3UTZpSDJuWlRETXVPVzhLbVdwMzJ0dlNkeUxoUlJW?=
 =?utf-8?B?UzZXSS9JU3lYRDhYUCtwdHVPSzVHei9ZWjRpV2VuSnFkTG93azVZYjV2TUZ5?=
 =?utf-8?B?WnJ4RHZFem9aN3UxUGg4L3RGMTdraTNsUkFJVzh4eEx3NFp0RkxNVFZ1d3VC?=
 =?utf-8?B?azZkdm9YcEpQV3pnRzcza1E1b3ZoQ0ZqUW9xWGQ4K1pZQ0VPdmlEQXJjUHBT?=
 =?utf-8?B?ekhjQmk0aXBNMWNvUm1xN2RKbERzcVFxZktXZFBVdUE1dUtKaldSaEluNnZr?=
 =?utf-8?B?clQyVGw0U3ljbEwvYkIzSUwzRTZtbWl0eW01b1MrTWVyQWdKZmxMNGdyNDhS?=
 =?utf-8?B?R3Z3MlR2WFdoT0xiTmZJeEwwekNDZU5McENqOTJjYzlicnNsNnFOVWZCNnUr?=
 =?utf-8?B?MzZON2tGUHgzbytYV2FDR212RXpGcmdoeTZ3SnFCUmlpUVFBUmY4Z1B4ZzVD?=
 =?utf-8?B?RUkrd3g3MTRna1JjSTUyNjJWdmNkWnRoN0xUVFpCZTZIYURQajJOaWxhcHBN?=
 =?utf-8?B?VWRrTEx2cmFPcFNwbS9XRWZXdkdmZi9Ca3BGTmI4S3RKS1pTQTh0M0lDV1Bn?=
 =?utf-8?B?ZmVmemk4T3JKb3dCTko4eC9iMHkySzR2Sm9tcmpaUVlQNmtjTWpMWExCdnps?=
 =?utf-8?B?VllHOTJ1czRoUERPMDBaUk9RRjRlVkdTL042d3pTbGdzVlZ3ZDZ4T3BUMEMw?=
 =?utf-8?B?SGtZNmljVG1WZXN1L1oxL0drWU5XRmdwbVNiaDBwU3VKeDBYeVRjckgwTnh5?=
 =?utf-8?B?S2lac3pXV2NZSG40Z2xBME9CcTNLU212dmQyVGNjSStkQXNaRExpaVJjNjdy?=
 =?utf-8?B?ajdpb2tGRVpVOXBYNHVodlduZWN3M1dibkVoeFU0VFBsMVU3RVcvbVgyWVg5?=
 =?utf-8?B?UmdqK1NDa0JKaGtNOXJMUGVjQkZEMCtndVFGRWxySkFSeUluUVM1SnpOZU1S?=
 =?utf-8?B?VDM5SDMybVBiOVIxRy9vVW1ScHNzZklrVTRYTERzMGdaN3YyTC9meHBOalUw?=
 =?utf-8?B?dTFYUjd0UWppWEZLR0FhbDArTCs5LzEyZW1TUEtWUlgvWnBhR3Z6Q3A2Qkxx?=
 =?utf-8?B?azd2YzZnVE52elpSejhpZ00xbytBL2REQkc0Q1pLSWhZUzluMk5ET1pWbjVn?=
 =?utf-8?B?c3JYdnhLU1hFZDJhUk1XZ2twbzB0VzQvZEpvWW84YlpGSEZVdUdyR1JjOUFr?=
 =?utf-8?B?b01FR2VGdEgyU1F1RnFPK1M1TjdwME5ueEthWlA1eWdGNG1YNTZYb0YxbjRz?=
 =?utf-8?B?eWd3NW9xeDRCdGZvSFNhSFdPMVJwelVabmhrYW5CVklxNTJUV3cyc2Y4Y25D?=
 =?utf-8?B?bU10OHV5ckRYSEVNazRodXdjTjd3cnBKVDBPd0VCM3dwOE14bmV0bXRvQUtH?=
 =?utf-8?B?OERaZVBQK1dWY3BQVlIwa0JYMWNSTktXRUQwNnVPMituZGZtMXRjNFUxdEY3?=
 =?utf-8?B?TysxSGxHYlVVdDFwQ2J2dzJSeDg4Qm5pQWZSczRRbXpOc3pQemhUK3NqVmJF?=
 =?utf-8?B?ZnY2K2U5MGlwNTBHUm9TVE4wRUJpY1JKWUUzdXd3K09zcUJzSzZkdzhJRWtm?=
 =?utf-8?B?NEs4L1BIY0hvNUtJVVNLaGN3OEtlNCtyQ2pVMDl2SHl1ajdGYWhKMXpwd3Fo?=
 =?utf-8?B?clpTdGpTY3JaNzIyRGVlQXpBTS9mZnl1WXVOQUluTGpCRER6NXo4MFlyU2J5?=
 =?utf-8?B?YTVGaXVLcTBwS0hiWkt0VG94VEhUZGEzOCtqQjBlWTFmeExHZkxFc1dSbEZF?=
 =?utf-8?B?MTF6aXRWNVg1UGtJNS94TGYvZlpxZjFmWkRzTDZXM1phejhmSGhxTExvNllC?=
 =?utf-8?Q?UJ+8FsYCtAjzZk8o/BkmGVZ1v?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9247de1-11c6-4464-066f-08ddad4440ba
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:11:21.4610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bER9G60z5KNpwJgc+b3A/YnEfgV58orvSKylxZJZdysKF3spsYpmeca7i3kNEStC64+TinvdxBdLIxdqgf194Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5861
X-Proofpoint-ORIG-GUID: y_QuplDsM7QQRCWOzQJeJ0t5IAXIsx1a
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=6850cecc cx=c_pps a=0de+TxTBwdPc9w0nPmKirg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=2vv1v26NUIOuIaJv1hcA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: y_QuplDsM7QQRCWOzQJeJ0t5IAXIsx1a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAxNyBTYWx0ZWRfX3DdLm+L8UP5R DM/PW7QSSLo9pdMA6chIDDfXATAwYIyaDuNmdzCq9BBqGzYDWSPw5kWiLkIjbOTLcoHQ9RX3D+L 8z4yiO203OnbbRbQN/01Xsf5Mo0ctlYT0//quhw2CmJqVQTmN5mNAPw3JnMwE1+Wil3DqWNyCE8
 0lLU6Pcwgfay3AWLO+ctqUlVP2hSFAzI7o/lRwGibZVMpY/bzUgT67klUWz9vuNPFKdGjx9VXgK yCkUJ3s7z3nCQf84IWuCJ7mQZArSj9iXMcrduc3Aqy5+sPNkSSDZP14Cl+Mk819VYqXpSRX7Vp2 Y//pbNlAEZ7XhmFJ0/BnNvaBNHahQ5gnNKdHXP0ue7JSxRPMB70RaUQQf3H91K5BG99eAj5hAWL
 rtyYkF5gNdmv+qOLUI0XJ55fz4dEcdEFhZE06g3MpB5uMKWbFbpYHrf0hsYMrJPWXHu7XeEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506170017

Hi Michael & Stephen,

Can you please talk about your opinion on this patch?

Thanks,
Yun

On 4/25/25 13:23, Yun Zhou wrote:
> If clk_core_populate_parent_map() fails, core->parents will be immediately
> released within clk_core_populate_parent_map(). Therefore it is can't be
> released in __clk_release() again.
> 
> This fixes the following KASAN reported issue:
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in __clk_release+0x80/0x160
> Read of size 8 at addr ffffff8043fd0980 by task kworker/u6:0/27
> 
> CPU: 1 PID: 27 Comm: kworker/u6:0 Tainted: G        W          6.6.69-yocto-standard+ #7
> Hardware name: Raspberry Pi 4 Model B (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   dump_backtrace+0x98/0xf8
>   show_stack+0x20/0x38
>   dump_stack_lvl+0x48/0x60
>   print_report+0xf8/0x5d8
>   kasan_report+0xb4/0x100
>   __asan_load8+0x9c/0xc0
>   __clk_release+0x80/0x160
>   __clk_register+0x6dc/0xfb8
>   devm_clk_hw_register+0x70/0x108
>   bcm2835_register_clock+0x284/0x358
>   bcm2835_clk_probe+0x2c4/0x438
>   platform_probe+0x98/0x110
>   really_probe+0x1e4/0x3e8
>   __driver_probe_device+0xc0/0x1a0
>   driver_probe_device+0x110/0x1e8
>   __device_attach_driver+0xf0/0x1a8
>   bus_for_each_drv+0xf8/0x178
>   __device_attach+0x120/0x240
>   device_initial_probe+0x1c/0x30
>   bus_probe_device+0xdc/0xe8
>   deferred_probe_work_func+0xe8/0x130
>   process_one_work+0x2a4/0x698
>   worker_thread+0x53c/0x708
>   kthread+0x1b4/0x1c8
>   ret_from_fork+0x10/0x20
> 
> Allocated by task 27:
>   kasan_save_stack+0x3c/0x68
>   kasan_set_track+0x2c/0x40
>   kasan_save_alloc_info+0x24/0x38
>   __kasan_kmalloc+0xd4/0xd8
>   __kmalloc+0x74/0x238
>   __clk_register+0x718/0xfb8
>   devm_clk_hw_register+0x70/0x108
>   bcm2835_register_clock+0x284/0x358
>   bcm2835_clk_probe+0x2c4/0x438
>   platform_probe+0x98/0x110
>   really_probe+0x1e4/0x3e8
>   __driver_probe_device+0xc0/0x1a0
>   driver_probe_device+0x110/0x1e8
>   __device_attach_driver+0xf0/0x1a8
>   bus_for_each_drv+0xf8/0x178
>   __device_attach+0x120/0x240
>   device_initial_probe+0x1c/0x30
>   bus_probe_device+0xdc/0xe8
>   deferred_probe_work_func+0xe8/0x130
>   process_one_work+0x2a4/0x698
>   worker_thread+0x53c/0x708
>   kthread+0x1b4/0x1c8
>   ret_from_fork+0x10/0x20
> 
> Freed by task 27:
>   kasan_save_stack+0x3c/0x68
>   kasan_set_track+0x2c/0x40
>   kasan_save_free_info+0x38/0x60
>   __kasan_slab_free+0x100/0x170
>   slab_free_freelist_hook+0xcc/0x218
>   __kmem_cache_free+0x158/0x210
>   kfree+0x88/0x140
>   __clk_register+0x9d0/0xfb8
>   devm_clk_hw_register+0x70/0x108
>   bcm2835_register_clock+0x284/0x358
>   bcm2835_clk_probe+0x2c4/0x438
>   platform_probe+0x98/0x110
>   really_probe+0x1e4/0x3e8
>   __driver_probe_device+0xc0/0x1a0
>   driver_probe_device+0x110/0x1e8
>   __device_attach_driver+0xf0/0x1a8
>   bus_for_each_drv+0xf8/0x178
>   __device_attach+0x120/0x240
>   device_initial_probe+0x1c/0x30
>   bus_probe_device+0xdc/0xe8
>   deferred_probe_work_func+0xe8/0x130
>   process_one_work+0x2a4/0x698
>   worker_thread+0x53c/0x708
>   kthread+0x1b4/0x1c8
>   ret_from_fork+0x10/0x20
> 
> The buggy address belongs to the object at ffffff8043fd0800
>   which belongs to the cache kmalloc-512 of size 512
> The buggy address is located 384 bytes inside of
>   freed 512-byte region [ffffff8043fd0800, ffffff8043fd0a00)
> 
> The buggy address belongs to the physical page:
> page:fffffffe010ff400 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffffff8043fd0e00 pfn:0x43fd0
> head:fffffffe010ff400 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x4000000000000840(slab|head|zone=1)
> page_type: 0xffffffff()
> raw: 4000000000000840 ffffff8040002f40 ffffff8040000a50 ffffff8040000a50
> raw: ffffff8043fd0e00 0000000000150002 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>   ffffff8043fd0880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffffff8043fd0900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ffffff8043fd0980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                     ^
>   ffffff8043fd0a00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ffffff8043fd0a80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================
> 
> Fixes: 9d05ae531c2c ("clk: Initialize struct clk_core kref earlier")
> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
> ---
>   drivers/clk/clk.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0565c87656cf..3f89ed51d4a4 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4242,7 +4242,6 @@ static int clk_core_populate_parent_map(struct clk_core *core,
>   	 * having a cache of names/clk_hw pointers to clk_core pointers.
>   	 */
>   	parents = kcalloc(num_parents, sizeof(*parents), GFP_KERNEL);
> -	core->parents = parents;
>   	if (!parents)
>   		return -ENOMEM;
>   
> @@ -4283,6 +4282,8 @@ static int clk_core_populate_parent_map(struct clk_core *core,
>   		}
>   	}
>   
> +	core->parents = parents;
> +
>   	return 0;
>   }
>   
> @@ -4290,7 +4291,7 @@ static void clk_core_free_parent_map(struct clk_core *core)
>   {
>   	int i = core->num_parents;
>   
> -	if (!core->num_parents)
> +	if (!core->parents)
>   		return;
>   
>   	while (--i >= 0) {
