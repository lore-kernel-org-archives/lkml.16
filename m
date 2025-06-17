Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42875237186;
	Tue, 17 Jun 2025 05:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138008; cv=fail; b=rdp5swA8bO9gRVuc59r2pe8X03JD7bttrxW19coF1RIo1jpHsCsRATq5oNQLfVyc1OmJo03G7wh7uNbIZ+FOek+pIU8Up77Fi2tE5GhqH/Ah7sbbQVdZWHRpRWlGfJZ05+Oj4KbvuXNcoazA59GzrGu2NxASNX0NtSTahm43ydI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138008; c=relaxed/simple;
	bh=XnR9CXMw5MB5DDCVoAMsKkXlhrdFOmxZtyofxbKyO5c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e/yqz1QxzdiP0kcbk2lAb+/HmVeYqRQc0P4sVzSrlhr82wB0Q0hbySKkMG+V40JBN9V750DX2fvuKuvuu/8wujb4Iq2vv7ShwqCGgzw/heOiIQ7UKnCyQ83AVxAQstwv4dFwcdwKF7jQp04ey9y6LiaOWferiAvXkX91AXb+7uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H4x5Je027482;
	Mon, 16 Jun 2025 22:26:25 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkjcgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 22:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJWhXFiBeOF+3OMBKALXZlypI4MANs3gWf9ilt5NCRxjXgURBhx9WEgHRXgVwlc8bDHbqek9VOKTJscbbsc2pwP3Vg1FLvVdeKOxkyiBgdAZYglWY/7OW5N1fVGlqSiaAFa7N08Bhjtfrlal39cMY1FkjfxjEC6FUQAe2KrC0SWOdasE7faYUhB9VOPbbV6laDMTOS2J0lOuyk65X1bIKRLapZd8PYx7J+fu625L0JwmXdAbvysCtXxrtyogMNNCWGHsrgpwPwW62n0uYRtGlUM1fii+Y9PkcxTOPPzS4F4+QnxJ1FLtRCS07TEpS1NxFmp9/G2Qo/KpfAtALLubDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0N829LcjPXKY2iBB6ACPys8lWS/nO2Z3vPEEoP118ZI=;
 b=Si4CBZK+ch7NfXYRF441UJi2YyEo7sGADPB7MB+SdQmn5HXBYV1+BmCK+fW4CqMv1rEP+9DMeSiylJXB9y95Uz+wwUiN7BmoEsZK5yzmuQsDw8xOtVL2+8lNamN6kfWen8uxyUaRCXlEIZ5VNE9qbJCNk7kyy5IVRWsxk3vT/21yQG+dsGu1dxsL7cwHvMQmh06y34BBEEK917bSkVt2to2XRzrQMrFASYBNnQA8rN9m+HR88wpBc7bW/c4i3vcG5wwLXjrd2zRepI1CVBxvxsKd576IdH8VEcqoXLT5MstDkHoohjgZwki5troqAXpNconuclPVfa2b45x2UEOUyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CO1PR11MB5153.namprd11.prod.outlook.com
 (2603:10b6:303:95::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 05:26:21 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::18de:be50:513:1a84]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::18de:be50:513:1a84%2]) with mapi id 15.20.8835.018; Tue, 17 Jun 2025
 05:26:21 +0000
Message-ID: <3923f285-f347-4e59-907d-ff61d7678f4f@windriver.com>
Date: Tue, 17 Jun 2025 13:26:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: Fix an out-of-bounds access in
 dispmix_csr_clk_dev_data
To: Frank Li <Frank.li@nxp.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250614112255.2838154-1-xiaolei.wang@windriver.com>
 <aFBvZUhCENuRoUtq@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Xiaolei Wang <xiaolei.wang@windriver.com>
In-Reply-To: <aFBvZUhCENuRoUtq@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: aed8eb0b-b578-4c73-a419-08ddad5f7e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWcwMCtiSHZadkp4U0ZzdDBXR3doSHFaNjlLRUpQb0N4VXA3dXlVWVBQLzUx?=
 =?utf-8?B?aWN0VTFjUlFPZnVxN3l0UmRTSythODRyRlM0VmpiQ2hXT1hrZGJJQkU2V3U5?=
 =?utf-8?B?YXZZQlF6YjZJWDZ3bHdzODF0eWpEMmxZWEZPUnJxdnk5WXRUUm5zaVh3S2xq?=
 =?utf-8?B?RTRKU0ROTGZqbHVNWlZvS0lrNTR0bXJsM3FuaGtZYzRvTTV5VXQwQ3VRSjZJ?=
 =?utf-8?B?Tlhpb05sVzM3cXMyQjFwWVc1THZJOVRRQnYrSkdIUnk4Z2tGdlhFTTIzWUEz?=
 =?utf-8?B?T2JjZFJqU3dEZzdNWFBQaVBEdVFrenA2cDEyanJLU0RmdmdYOGxjdXhNR1FT?=
 =?utf-8?B?MXkzT056SlZvalZwb1k3aEU4cU0veWphaU54VWVyUDFLdnRtWEdYc0lQSjFw?=
 =?utf-8?B?YURzem9yN0FjT2V4cVRhY2dJWHFXK3hVODRMekI5NmZkVTFlOUdSbWVOZytq?=
 =?utf-8?B?MTMyV2VSbjdjRXoyVkN4RTQvOC8wZ3E1eEROQkpmdVZpdGJtZ1FPWmNmNHNs?=
 =?utf-8?B?ZFRpblpqTkd6YmxFeWExb21MdjJpNjVtdUFFc08rWHRDc3l1Z2dSRHBHSkMx?=
 =?utf-8?B?ODd2ZDRVUUhyc2ZtcEpZRnJTZ2lkbm82em4vU1YyV3FQSzV5bGVqTDAzTlZr?=
 =?utf-8?B?SitubUc0djNoU2o2T1B2MmJwSjhGZlFLV3pPcEI2cWtnOUxSbkF1OUdyemtw?=
 =?utf-8?B?Vyt5TjBVM1h0UUkxdnRndDdPZ2dDVm02ci9Ud004ejBlcVZLN2syejVsejlZ?=
 =?utf-8?B?L3dxU1d0MWFVNVZqSkhsVmVJRjVjL2FvZDlFWUEweGR1bFlhS0VzbnJLVFZC?=
 =?utf-8?B?WXNrRlRpajMrWGl6d09mTU1VYzZzQmRqdlZjaHVRdi9GblhaWnJuMmExeldK?=
 =?utf-8?B?OFVTc3pDcHNvS0QwVFFiM1p5bGp1djF0R3RJU3pxQ2JJZGxNQWJUa21YUUM4?=
 =?utf-8?B?b1JBVGRRaHJ3NUk2R3hCeFc3aHZza2Y1djRETVhBdWFETXJBZmk0cVFSSVdE?=
 =?utf-8?B?RW5WZHN2N0FWaUM3OW5Ed0J3bGJHRHFjamVDbE4vQ1YreloxTDBEeW1JTE5j?=
 =?utf-8?B?QnY5MVFKNjRTb3B2Nm1LdUZkZG9pb2t5SmZIQ3dPZ0VlTENld0U2RUNUUTY4?=
 =?utf-8?B?eW04S3c1d3V6RU9XTTdGanNxYS9mYmtVSXh2SjdCOTRhb0doWk1ocjM2ckpF?=
 =?utf-8?B?LzBQWHJwdEliZFo0RmtZUlBRQUM2Mlc2dWh3VUMyYnE5TFVhODNRV3l0cHZS?=
 =?utf-8?B?bCtEUTVPdDVONXk5Qkt6TFlEM0ZiWlM5aVowcEtyZTVkdjByT05aM1E3SStX?=
 =?utf-8?B?TUgyendwRWVXYWxTUnNzcnhqUTRtNDFDNUo2RXBNNUVtdlFoeHJPM2ErZ3J5?=
 =?utf-8?B?ZkJlVWZQWVA5andmcnpJOTJTeTNkdTZGdWFLSWJXN1ZHNmk2QVpka1A4RjM1?=
 =?utf-8?B?UjNwSkNGaW50YUU0SjZVTVNZSXVFOU44VlpHVmEyK3NiZlQ3SUFlaDk2SURB?=
 =?utf-8?B?clIvN054ankvenptOWlsL1FKNFFMVTQ0ZVk2MGdXaGwrYm9XV0pFeW5nV2VJ?=
 =?utf-8?B?K0RSaE1oZXJ6SytCUVUxOUI1VW13UVBIL2tJYWtweEJBbHNSQTlBVmtZeDBK?=
 =?utf-8?B?VEM4VC9aTWpCRGtyeWxSaWlYeVFvbGRidmtVQmxrQnRzVVoxWjJXNG5LL3Fr?=
 =?utf-8?B?cENFWDZuQWEzaTBnRExqRnRzeE9SVzhRWGRpdEFINHh4YzhsWURSb08yUDdH?=
 =?utf-8?B?ZFhFd1BJbGRvdDNjdjVNekhKY3F6aWZHY1RmOUtIbmxId3BNalQ2ZlIybnNh?=
 =?utf-8?B?ZFhnd1JZR0RnaDJ1UStuWU1Ud2N5UjdoNWJVTXBEaXlGeE4xUzJudkIzc3Ny?=
 =?utf-8?B?U3QrTkpEV0grcnUzQklsOWRNRzJTMFJTaFBJQjR0MnhBci8wZmRBa1U3NlJP?=
 =?utf-8?Q?AcMGT2TU+H0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWpkWnV3KzZPQ1pKNFh1OUYrb09WMU43UW8zQUIySThydWt6ZkxENlljMkI5?=
 =?utf-8?B?UlBvazc2U00xbVdwWERUK3R6VnoxN0lRUWZvNXZKZC9uV0NwYlRKMUhGcXhQ?=
 =?utf-8?B?MUJQamZsWDg3VU1RV2g1NGd5Zk5KVTZETjN6emVXUDQ5dTRFRkhiMEhRQTRr?=
 =?utf-8?B?VVFxNzIrZDJ2cG1pRDdld0NyY0d0d0hJTzRGVEZpY1hiVThpMDNvYkF6VVNC?=
 =?utf-8?B?Z3hMcmNUNmFsVHhqVmhtbUVjRUl0YVRZUDNwYTV4Tk1RMzRKM0RLNDBST3ZE?=
 =?utf-8?B?TGxtclJCRGRrLytJVkhRRVBCN1l6OGU5QUVoMUN5NC9zYzQ3WHhzbXR4aldY?=
 =?utf-8?B?VnUvdjNja0ovZmNKK3JnMWIxMzh0MWF1Z0VUMGRwMXpBMXNSbGJuQUxxcjF5?=
 =?utf-8?B?QURyekVNSW14d2RJRVlUMS9jZG5abHdUMmVwK3hLbEVyb1VOb1JPUVNPMDFi?=
 =?utf-8?B?bDNFWWR3di9jS2tRdWJBMkZhcGhlOVN3eUZOZDFjSWJHS3pRYzRNZmlpRkp3?=
 =?utf-8?B?THRzdU9kanpPRUpQNW1vOE9RV05FSTlEWFhWdTR4QkJ2dzZ0V3Z6OVYzZm1U?=
 =?utf-8?B?ZDIyRmxndDhKQy84akJLNDBoN0FBNHJWaTV6N1lnelNTNHZwTjlRb2hzTEdz?=
 =?utf-8?B?SHZ2UjhhbEdyYU5Lck9LYnppSUFGa29lUGZmSG10TFo0LzdmS1owTWUxak5y?=
 =?utf-8?B?TE5qNkZlZ3B0a0VWYnBaY0hnS1UxMTRiZlduVmZGbDJkdFJZSm1aRTIvNnpv?=
 =?utf-8?B?Yi8vSXBSZC9hTU0xQWl0YllQWDM2ZCtTNzRxWGxKSmRKaVVkdmRNWHZUazNz?=
 =?utf-8?B?V0hhbWswaHZxZWlXNTM3eVVSOFJTQmx4T2ZxejF1Vm5WSkUxQ2Q5RG44WmVv?=
 =?utf-8?B?NEpZM0NYaDk4dmdkV0xKa2lTenZ5QU93ZHpTdzVQaUN4RmRZRnF0MnFFNlA4?=
 =?utf-8?B?SnE4N1BQNkhGWWtqU216aVIrSUFhKzljZDYyWTdjUHVrL29hVGVUaXVTNktz?=
 =?utf-8?B?SEd5T2ZVbDJHUGRaYkkyaEsxQnNIVlZQT3ljVjlJbWU3R1BpQ0NJbHEwNFVa?=
 =?utf-8?B?eWhKYm9xL3RnazYzVkprY2ltK3VsMUxLUkFQeUNZOEkveXc4QUttYzRkTDRS?=
 =?utf-8?B?Q1dvalRFN2ZMV2NmdGFPSDlWSzVSMzg2dTJoT1lUeUpwVTdlTUtZdmZpK21J?=
 =?utf-8?B?T1QyVC9FWFFjbGJ5VkJBeHpickhPYUlBNlAwSC9aa3BnQmI5L3llNXRxeCtR?=
 =?utf-8?B?OUtyS3FzT3N2SlduRW1meW5VY0RzVG5sN1lOUjloa0V0VjRYTTNTSWJpWlFa?=
 =?utf-8?B?OE5QOFBzTWF1a0lJSFZINmwxVDhUL2VDMnhaZS8xN1BkRlZjZ1dvYkRWdmps?=
 =?utf-8?B?WjlRVm9pNGVNWlVxRnlDQWIyTm1Zb0pEWmYyMnpleGh6clhkdWk2T0hTYmhk?=
 =?utf-8?B?eFVvVTBHZVowaWpJZGZ3MEFLTjhVMXh4RlJiS1k0WEpBWFpqNFU5eEptSzFX?=
 =?utf-8?B?VDlZODlTa05zOHJ0b2djdkRFRWNEQjRKa3c5QzcwMW1nSnl4ZDh1cFFzR3NX?=
 =?utf-8?B?Uk1WY20zTWRaMGtYZ0FJMG1hMkp2T05GakRvVVhKQW1NL3pSNnpkVXlmOGVt?=
 =?utf-8?B?eHVaUENMbHBpSTROTG9xTXNEU1hsdGdHeWtuVjE5V1Q5blk5M3JxWmUxNjdt?=
 =?utf-8?B?MnhIMy9FT0ZmeFlDQVQyNGFvbjROZzFraEV0czZ6aGhza21ob09NcFlqQ0Yy?=
 =?utf-8?B?U1NxdzZzU1ZyeHBHZUJNanZLSUNXbkhKV01FOG9WZzZoa0VpMDBpK1JCbVNi?=
 =?utf-8?B?dVBnSmFrSEJORjk5SlNKTFQ3RThVUnQrcFRIT2VSUE1RL3pGdUNJZjhjTkFH?=
 =?utf-8?B?L1pmV3EyUkVlRmtFVHpyVzVEdkV6dWRnY0VsclkrVHBvMlZXZTJFOGduU29o?=
 =?utf-8?B?c081YktseERSVUxTUjJJUENBaE9NRUUwTUM5NUUrNXJFMEcyZ3AwaGhIb2RN?=
 =?utf-8?B?dDBhL2MzcTFUZ1EyMXN0Q3RGcHE0SFk2NlBBSEQ0cFhZUUxLWTBZaEtDY2Rk?=
 =?utf-8?B?ZzFPNDlvV3phWi9raEtxcGdHdll0YW1QQzZQSWFUMDhHUUNldndLcWw3SkFo?=
 =?utf-8?B?RmFnekFZTGE2TW01b2NGWERnb1lsY1E1NGJwZTZQUWFpdDJMRFBNazR5ckNP?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed8eb0b-b578-4c73-a419-08ddad5f7e40
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 05:26:20.9645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4c8/DGLk5MRG8fLkBdZZ6g1wHaK906sJI4qa1ygWhOVexdF0FpRzNbV31IrzCZ1cGD4AsiyoBvOcqDTEzb8KR85k7rCPFu6sMTsBxMf94es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
X-Proofpoint-GUID: 1gqQTgP5yAe_GDPV6ZoHTs70eEdjKrC5
X-Proofpoint-ORIG-GUID: 1gqQTgP5yAe_GDPV6ZoHTs70eEdjKrC5
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=6850fc81 cx=c_pps a=x/nlEq/fV5t0dl3uOxNKNQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=msQzVtyQblvKDVZA-toA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA0MiBTYWx0ZWRfX+SRweOA7Tgwc ouagqqOLRVzcZUheRxuJrwoOAqs0JGvOoTyidugyJsnFpJOi/URrV/wzdj+nFyhLyz+nEJr8uR9 XSxPPfS2B7xefAInAbTC3bqbvRNzW1t2oYWrDGZNOh+JcRJdZkziebEr3BI3JrsBuuiHNI1ePpm
 0JTz5cKnl6eViHPY/oYIqHw8iN4a0VJVL3UXuEVwKJf/RtlMdmbeA3X3wl0W0bmypnzx4Yngv/L QcqD3M4C3tbponQsUt/TniqySeTdNSw9To0UxsvWaJxv/uKI6UO00mt0JWfnWgb9Iha4VprSSdG lAjcKvT0jek7RNvvX/qye8jAsUe/2s4xERoKofwGxA7odFiYE+vq4rig44GAsEPQLxcOm9Bvn0f
 sg5jF3ARO3CmVl4jxMZhlYrblPFYW2xIPagd4F206D9O6ThvPkP/ZvKBuhnfXewB9u9wLgHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506170042


On 6/17/25 03:24, Frank Li wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sat, Jun 14, 2025 at 07:22:55PM +0800, Xiaolei Wang wrote:
>> When num_parents is 4, __clk_register() occurs an out-of-bounds
>> when accessing parent_names member.
>>
>>   BUG: KASAN: global-out-of-bounds in __clk_register+0x1844/0x20d8
>>   Read of size 8 at addr ffff800086988e78 by task kworker/u24:3/59
>>    Hardware name: NXP i.MX95 19X19 board (DT)
>>    Workqueue: events_unbound deferred_probe_work_func
>>    Call trace:
>>      dump_backtrace+0x94/0xec
>>      show_stack+0x18/0x24
>>      dump_stack_lvl+0x8c/0xcc
>>      print_report+0x398/0x5fc
>>      kasan_report+0xd4/0x114
>>      __asan_report_load8_noabort+0x20/0x2c
>>      __clk_register+0x1844/0x20d8
>>      clk_hw_register+0x44/0x110
>>      __clk_hw_register_mux+0x284/0x3a8
>>      imx95_bc_probe+0x4f4/0xa70
>>
>> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/clk/imx/clk-imx95-blk-ctl.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
>> index 25974947ad0c..fd11932b12b3 100644
>> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
>> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
>> @@ -223,7 +223,7 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
>>        [IMX95_CLK_DISPMIX_ENG0_SEL] = {
>>                .name = "disp_engine0_sel",
>>                .parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
>> -             .num_parents = 4,
>> +             .num_parents = 3,
> Although this is simple fix, is it possible to change to
>
> const char *parent[] = {"videopll1", "dsi_pll", "ldb_pll_div7"}
> num_parents = ARRAY_SIZE(parent);
>
> to avoid hardcode number here.

Thanks for the suggestion frank, I will send a v2 version

thanks

xiaolei

>
> Frank
>
>>                .reg = 0,
>>                .bit_idx = 0,
>>                .bit_width = 2,
>> @@ -233,7 +233,7 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
>>        [IMX95_CLK_DISPMIX_ENG1_SEL] = {
>>                .name = "disp_engine1_sel",
>>                .parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
>> -             .num_parents = 4,
>> +             .num_parents = 3,
>>                .reg = 0,
>>                .bit_idx = 2,
>>                .bit_width = 2,
>> --
>> 2.43.0
>>
