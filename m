Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022078.outbound.protection.outlook.com [40.93.195.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525777081F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 18:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738348695; cv=fail; b=oYmBKFc1JM37/JYqFrHUpJnJe5xTU8iW6PgSE2U/6nzbdthbEN8rZT5L+KzxHLVPZM1rLm7CQI/708NMehw68Uskft4uOTqLPUCMMRDUxoJxR2vfuHOsJx7nI39Qv1pTEpIukTe60hwOpPoMg1eAkwvjZQ0u2DHX+tNPY4Qv4sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738348695; c=relaxed/simple;
	bh=YFUQqqkqFYtSAOp58A9snaxoC6/2SOWH64B11+Q1svg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A+nbGSE1d6uMu5A/ibPysWlLmAMOKQPoIFeggzUFVhJOOpM+jx2YzF0ea9nZIpQLzx1WL5hiyDnDFpg9lfNd0FlmIwi3LeW/UjfxbhsMvj1aUOT3uGL/HorDSMdWlsDL7nPZxnPWjioOXlR7n5AyulBJbLFk0HX5Q78LmKNgW3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=ZuEvHa4r; arc=fail smtp.client-ip=40.93.195.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="ZuEvHa4r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIB71D+9qXdmi8A/BRV8jhgDLsbrjhUuUM+T3LUNrBP1MC2dav+ev4jNtyOXj8RWAZ/HZ/v9fNMiOw/x1MTzLSrLbh3YM483PMO28Qhw97esXKmiHbSr1n9sa9NGPKR7ZYpG/TfkUD+dgL7jX5+ytCWL7i0BCTeW2pwryFkvRNUe/bwgbvpOWScQFJJ+IlfIxvToGzkxl23sWHxPGy2/V218IBNko8pPVlXU/dVR4lHyjhFKKbeb3nDOis1PGBbsSqtd5hWhnVMDBOCtkqix32uX+1RFTUJ3882fRf3v5qNMhqUhGSiKUaeCacqrlG7DwEh1MEgqasOOS6zbE3Qi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHlil8tH0+hx53WAuuGn6d37ahkqEg+DiGOwxB62+NQ=;
 b=PA9klsMeWabV1Jbt43A2q117lE+F2anzrkqjUqPD7k7uZP3oVXYxHL5l8iAnHsgC9i9MYs8VzCnJDQN8jMcgrdCgdVGAl5Doo9Jcj4rOXTTA9NMGuKYEi3d6hLNoBWGaHxb6gcu08ZEJVIHATZKwe60pJPhzRgYDQmtkgqYWWyVD0yyBdGBrYryWTDsLOm1ym74FRhRXQvyEWMkzHTS4S0ska6FDqxFhLbBviDskVP4m59EF3SehBzrZG9mp2bIS6bB236g2B0/BeVH7suaBSNIb1iC6ZiI2V4g99TJZMCAt4heOJv4F1Is2y6aJeXlfS70TR2j3MYefLF2HqeuRxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHlil8tH0+hx53WAuuGn6d37ahkqEg+DiGOwxB62+NQ=;
 b=ZuEvHa4rBKR+M98Oo+lzGOJxmGF4AZ057k6x+WXrNy5Z1sOxBWDmIkOfmTSZb7wxZ8iZvFly71QY2Q0TF2rWqONrbxMvSjT1ULJWEBLzcGXyMffubjkwTVBmmCO+46pbf96QYlJP6Map/URw0bx+QYYB5Ps8HHsdmArGH69XO8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB8671.prod.exchangelabs.com (2603:10b6:806:3ac::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.6; Fri, 31 Jan 2025 18:38:07 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8422.005; Fri, 31 Jan 2025
 18:38:07 +0000
Message-ID: <01b5c112-480f-40dd-892f-5eb7c53e2f68@os.amperecomputing.com>
Date: Fri, 31 Jan 2025 10:38:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] /dev/zero: make private mapping full anonymous mapping
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 willy@infradead.org, liushixin2@huawei.com, akpm@linux-foundation.org,
 linux-mm@kvack.org
References: <202501281038.617c6b60-lkp@intel.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <202501281038.617c6b60-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::27) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA1PR01MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f7a20e7-4645-441c-7e44-08dd42266772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2RJWXBEdUJDbmtaZ0F0ZGFOWG8weUNwZlZqYnBiUU9xTnY3TkcwaGJmbkdD?=
 =?utf-8?B?b1htY3NJdW0zSHkrZHB0aGRkcjVrVTVFNEdOcC9pU0o4dnNaT2Rtd2d0ZTlM?=
 =?utf-8?B?UEFvOTlNNGJRdkFiQTdNaUd1T0xCYTFSWHVuc2ZHcVoyeVFIY1gyZ0RnUWcv?=
 =?utf-8?B?REZyVDl5K2h5a2hJY1NHZ2prVW5Ja1JGS0I3bDhkRWVacm1DK0YrYjI1dG5n?=
 =?utf-8?B?cnVhTmJKakJQMGNNNTRiaktabzJHWDBHTnZRSzlRTUNMZHVNb3JyR1luSHA4?=
 =?utf-8?B?WmgranZGbGRqbHh0SitlVWExZW15bW11OEdUbVhpWjlNdzV4UXZzZzdLU2Nt?=
 =?utf-8?B?TkdzSFYzNXhQRVE4cWxNa2RtY0dFam5zWUxRQTMrR2NYSUd6TTNLMGVJMm1G?=
 =?utf-8?B?YXFjbk9mSkZBVHRsak8vNUhSeHlSR1F0Vk9DQ1JibXkrWVFRYjBpOW9GK0ln?=
 =?utf-8?B?MmxqTDBlVEJDbTFxOFNPOUdZNjRRU2l6bVVIMkp5WmlWMXVVbTdtWDhJWjl4?=
 =?utf-8?B?Yy96VGp5R3l4T0FoVGpzNlBFMWY2WEEvUEE3WmovTjBwQUpZU3N2SHJKZkV2?=
 =?utf-8?B?SmpDbnNhcUVlc1FKWm9oajY4ejltVWdMRzJmMVRtRVh5d1psbzZ0TFZ2ckdS?=
 =?utf-8?B?cUN5ZUtzN1YwUjVsMm9Od1o4T2RLS0JQL29CeFlENEcvSkNhNTd0N0VJMHNE?=
 =?utf-8?B?SnVrcWVab0ZLUCs2dnBQOThuUzNwdHU0TUJVWFZ2WENFTFV1RWpVWGZvTW8x?=
 =?utf-8?B?OExjYTJjQ0pVSFFsSEIvZFVzNllVVThXRnRSU1Q4cHAzd0pqZlI2MFVnVm42?=
 =?utf-8?B?MUY0Z0Q4NjNVbHhZS0xCcS9UQXM1bUFMSkVwMHRXWHRmRjFmUk93MWhXc1Nr?=
 =?utf-8?B?V1hrcGFMdnp3THlwNStPKzVGNzE3L09iZytKZnJic2VVekE4bGY4S3lKczFJ?=
 =?utf-8?B?UUYwSUVScWc3V09qU2dEQitjSlZrUzdabzJiUFR0Y0daN1E3Y1ErQXFRM1ND?=
 =?utf-8?B?dDNlV25QTWpONXl0SzNTMkZ6WlFSbXdYSzlGVTFtN0kwa0xpVjA4SHkrR1lL?=
 =?utf-8?B?T2JYcW5XbTA4UHlmYjhQR0pZVG80M0RyZWIxT0Q1cmFYczZoMjk5Z0V1QjVa?=
 =?utf-8?B?U0tJTW1pMVdlWlhtcGZ4WHFucG90dWgxRHBGeVNxUFNnNTZBMEd6cWJ4ang5?=
 =?utf-8?B?VldzRU1nc1lveHl1djBoQ3ZFd1VvVTlxUnp2NXh6YnpMUi9FaXZwczU4bEhD?=
 =?utf-8?B?T0dLWXdjN1c2empoOGEwaWdydmwxTHVxWkpYeDFCWEN4R2NRQjFraXhsUkR0?=
 =?utf-8?B?NE9XQTFPRDZ0ajNoREtTRzcyTE5UbjJTUGphTzFTRkFXbThaNWc2aGwyZm9v?=
 =?utf-8?B?TFVxZUpEaytSZE9rekQyNE93clZUdXprbG5STlEvR2ZkaVF2UFZMZEdNNEh1?=
 =?utf-8?B?b2U1VmhmeUpjVlBLZmpMVndwb1BoYXBMZW16ajlqcmUxMWc2NnBuZ2txa2xr?=
 =?utf-8?B?cUVoUmt1M0hoMVFLd3RFeTlmR2c5REJvODlxRzNNTEhZQVhNaGZpTi9FdVZ3?=
 =?utf-8?B?YjFJQnNiMTZCSUNtTVJHRkZ1V0ZsYjl6YzJCZSt2UzdycFVUQjFMZjZZS0dS?=
 =?utf-8?B?MVJjKzAwRjdCVVBzWjV5TlJFQ3dubCsrdkRReWVHUTVMQm5wNkpFZi9EdS80?=
 =?utf-8?B?UkhyaHpidktQT0xpWkZkenZHYXRZUlFLWEh6WGRVR2VPQ043b1k3RWhhRDVY?=
 =?utf-8?B?bm5ZY3h4T094eG5USzZLR3hxQkxWQU9YdW5zQWo0cXV3ZHRHcUhKdmROM0gw?=
 =?utf-8?B?TDdMSVo3SHZueW5UZmdSOFp1eGtaZ0JQUXRpU1lzQjFsampmTXpNNnIrbmpU?=
 =?utf-8?Q?RbtoNfj5XJXh8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUpZVjE1MEdNbzdzOEJLZ2tBZTZ1cjcwM1FMYUpsOUR0OWRYbVJ6VHdyMTVV?=
 =?utf-8?B?VmZNc0ZFUDhtRDgzcXcwM1FTd2RLcUdPcVZjWm00MDJpS21vaFkzSzNDc2hF?=
 =?utf-8?B?NlhLR09jdDZnU0kvRjBwRGlacU9tMTFxeTdLNjhrZkxpaEVPYVFvQ3R3bXB2?=
 =?utf-8?B?elZWRHNpK0dMNkZSQVZlSHhQaUkzakQ1MGFyMVZYYjltVTNOcjAyTXVLalc0?=
 =?utf-8?B?SmxDS0RkL2V6Y3grdkEwTW45azdDNFJVNmdSUkUvTzd3Vmk5bDZJc1BaRDll?=
 =?utf-8?B?djM0RUdrZFhoUk1iUFd4dUV5UEsrRnRPWEVJbFN1VlR0UlFtMmtPZEVaT0E4?=
 =?utf-8?B?RWJIUlNIRU5zTjBoMEdPelNBZFlxMXYyamdRWUNBV3NQYnkzU0ZDeUh3Slhp?=
 =?utf-8?B?RDJoNW5obktkSDJWaW15MlpxNTgvOU9SWjNiSkQ5OFB1Z1JFVys1enZkNDg3?=
 =?utf-8?B?SjZtZm01a0U5dExsRTFmcGdkWThybm90NE4wMDhxcUhnVGlMVG11akVvbWFr?=
 =?utf-8?B?Vk5ucDdWYzgwN3phcVpSZmUwVkpQbEU2MG84NUtLNkNKenNEWkxEcCtSZWpr?=
 =?utf-8?B?N2VQdXREdVc3NHRzajFRYmhPa2hvOStpTzRSYmJ5YjV0ZURhVzZhMThXNlRF?=
 =?utf-8?B?MXRBMDVKVmhCbGhaUHpHMTA3MFFndTBUR1hGbDBZOFVRRWZkMC8yVytWYlpU?=
 =?utf-8?B?c1FrMlFTRFdYKzZJeW9mNWIxbjd0QmU4eHUwOW9ZN2NoNlBVMWVMNERYOGxD?=
 =?utf-8?B?M01ucVB2blhLV3hZNGNSY1ZUcFU1V004UXpWWm5kdjV6c1p2QXljRjIwcEh6?=
 =?utf-8?B?YkZHdVhRZmJ4NmpxaDFkd0ZtbVcxMmdhTmlSYnhWZXpwdFVRTVBnditJby9H?=
 =?utf-8?B?bUtCWFYrdEkvZjdhZXgva2wyaUFnYytQcUwwKy9IdXhQbVhyanBpVjZlVHdm?=
 =?utf-8?B?R1R0dFN5ZGJQaHpzOElZYm5RTTJ2NW5sMFNVVm5TTFNlYS9DaW9kaVVrWUFH?=
 =?utf-8?B?NHpUc3lvVTA1eDAzWm80NHZaVUhKdENQWTd0NnhmWmtpL0pkcEJCN2xQVmlJ?=
 =?utf-8?B?VC8veGxrQ1BFczhKT200UFVnbGRhYjFBS1dOV0RSYnVISG5UN0dSaFpPZFpN?=
 =?utf-8?B?RE5FSXB0SldQRldIeXVjZTU1TG40NVhZTEtXaGNHMFp0WS8ySUxhd25aZ2Nu?=
 =?utf-8?B?d3dudzNZNGV5QXl1cXFYclEzT2JhMk5ucEpJaXdVamZVcCtPRW1lQ2NHUEcz?=
 =?utf-8?B?WW1aeXdsdWJCUi9GUHJVLy85Yk5DeW9FMXNxRW1IWUtETkdFU1pOYkpPNjJy?=
 =?utf-8?B?ajJmaXd4RU9FYnBlMjdpOU9lZ2lnQ0ZGUVc5M1JHUWxOWFllMXFjbUtDY2I4?=
 =?utf-8?B?TzBGbkFjNWk2TkE3cnlWRGxDLyt1VS8wNkpJR0ZnQzJoOGgxMUFqZHd1R1ZM?=
 =?utf-8?B?bklVTkhNcjdMT2ZIVVhaKzhTeVlvV1FZNzNGZjRGQWdCam1Bd1o0Uyt3ejNX?=
 =?utf-8?B?QXU4eXFRK2E4ZTB3N2VuNmY5eGtOK1oxQnY0amYwenJvTi9sNFdaUDROWFdp?=
 =?utf-8?B?bGdNa25BM2VYRnRkYXJ2aHZ0bk0wdEJkbG5KakZLQzd4SlBOc3h3WjV6ejFm?=
 =?utf-8?B?Q2hCRFRVMnhicVU1OEEwNEJGb2hadTduV05hSlBVMjhLTGQzbHpTc0NWTENt?=
 =?utf-8?B?a3AzMVJjTXpiRS90ZEZRR3lFTFJCTmtaRWdGWFh6ekFrelhRdlZZSENuczFX?=
 =?utf-8?B?bEVibmtvY2dJRGlXcVY0UjEwUjErMitxNVllZWJWMjVOOXNIOThTYzlySXJx?=
 =?utf-8?B?cUF4QmxlMXU1L0dzM2VmUit5WDc2RmJ0Q3pNSnhyQjUzdERIbDJtUGRBdFlB?=
 =?utf-8?B?YkZuek1MUW5rZWp1NlZ4M3hwNjVXS1lOYThEcFN2cmNISTBJTHpNNDlJc0l2?=
 =?utf-8?B?bjgzVzU5ZWtrcVdjbXVnVmppRld4SUZYZW5VMS9UMFdSK3JlVzJhbzRlQ3dE?=
 =?utf-8?B?a3FyTXlqZGoyMVVkSWJwVWNibnRPU3J6NXV0UEx6R0xsZUV3UUhKdWdKQm42?=
 =?utf-8?B?TWNpQXljTE8wK0F1bXh2V21pNWVVMnZISjJ6ZDN1Q1pTQ1RJU1lEaWw1cW5s?=
 =?utf-8?B?TEVQYW5zenZtRVVtY1d1VklUNTVWekpQM2p3ZlRIVGJxTlkwWk5OMkgrcWtZ?=
 =?utf-8?Q?CZTu1ztznAz1R5BKI12UQYc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7a20e7-4645-441c-7e44-08dd42266772
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:38:07.0775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlYXcYKd1X+xlToC9ynJwqEyKrenrl/B1sRH4wdc1Z+6z7CyF+BmxYbSmpoqCFalg11bkRpAW7QCVa6GY7+GJ44qtqw/l1lhW5qoLGIIEXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB8671




On 1/27/25 7:14 PM, kernel test robot wrote:
> hi, All,
>
> we don't have enough knowledge to understand fully the discussion for this
> patch, we saw "NACK" but there were more discussions later.
> so below report is just FYI what we observed in our tests. thanks

Thanks for the report. It was nack'ed because of the change to 
smaps/maps files in proc.

>
> Hello,
>
> kernel test robot noticed a 858.5% improvement of vm-scalability.throughput on:
>
>
> commit: 7143ee2391f1ea15e6791e129870473543634de2 ("[PATCH] /dev/zero: make private mapping full anonymous mapping")
> url: https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/dev-zero-make-private-mapping-full-anonymous-mapping/20250114-063339
> base: https://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git a68d3cbfade64392507302f3a920113b60dc811f
> patch link: https://lore.kernel.org/all/20250113223033.4054534-1-yang@os.amperecomputing.com/
> patch subject: [PATCH] /dev/zero: make private mapping full anonymous mapping
>
> testcase: vm-scalability
> config: x86_64-rhel-9.4
> compiler: gcc-12
> test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
> parameters:
>
> 	runtime: 300s
> 	test: small-allocs

It seems this benchmark allocates huge amount of small areas (each area 
is as big as 40K) by mmap'ing /dev/zero.

This patch makes /dev/zero mapping a full anonymous mapping, so the 
later vma_link_file() is actually skipped, which needs acquire file rmap 
lock then insert the mapping into file rmap tree. The below profiling 
also showed this.
Quoted here so that we don't have to scroll down:

>       95.60           -95.2        0.42 ±113%  perf-profile.children.cycles-pp.__mmap
>       94.14           -93.6        0.54 ±106%  perf-profile.children.cycles-pp.__mmap_new_vma
>       93.79           -93.6        0.21 ±171%  perf-profile.children.cycles-pp.vma_link_file
>       93.40           -93.4        0.00        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
>       93.33           -93.3        0.00        perf-profile.children.cycles-pp.rwsem_optimistic_spin
>       93.44           -93.2        0.24 ±178%  perf-profile.children.cycles-pp.down_write
>       94.55           -93.1        1.40 ± 51%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
>       94.25           -93.0        1.30 ± 59%  perf-profile.children.cycles-pp.__mmap_region
>       92.91           -92.9        0.00        perf-profile.children.cycles-pp.osq_lock
>       94.45           -92.7        1.72 ± 34%  perf-profile.children.cycles-pp.do_mmap
>       94.46           -92.6        1.83 ± 31%  perf-profile.children.cycles-pp.vm_mmap_pgoff

It significantly speed up mmap for this benchmark and the rmap lock 
contention is reduced significantly for both multi-processes and 
multi-threads.

The benchmark itself may exaggerate the improvement, but it may really 
speed up some real life workloads. For example, multiple applications 
which may allocate anonymous mapping by mmap'ing /dev/zero, then they 
may have contention on /dev/zero's rmap lock.

It doesn't make too much sense to link /dev/zero anonymous vmas to the 
file rmap tree. So the below patch should be able to speed up the 
benchmark too.

Oliver, can you please give this patch a try?


diff --git a/mm/vma.c b/mm/vma.c
index bb2119e5a0d0..1092222c40ae 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -1633,6 +1633,9 @@ static void unlink_file_vma_batch_process(struct 
unlink_vma_file_batch *vb)
  void unlink_file_vma_batch_add(struct unlink_vma_file_batch *vb,
                                struct vm_area_struct *vma)
  {
+       if (vma_is_anonymous(vma))
+               return;
+
         if (vma->vm_file == NULL)
                 return;

@@ -1658,6 +1661,9 @@ void unlink_file_vma(struct vm_area_struct *vma)
  {
         struct file *file = vma->vm_file;

+       if (vma_is_anonymous(vma))
+               return;
+
         if (file) {
                 struct address_space *mapping = file->f_mapping;

@@ -1672,6 +1678,9 @@ void vma_link_file(struct vm_area_struct *vma)
         struct file *file = vma->vm_file;
         struct address_space *mapping;

+       if (vma_is_anonymous(vma))
+               return;
+
         if (file) {
                 mapping = file->f_mapping;
                 i_mmap_lock_write(mapping);


Because /dev/zero's private mapping is an anonymous mapping with valid 
vm_file, so we need to bail out early if the vma is anonymous even 
though it has vm_file. IMHO, making /dev/zero private mapping a full 
anonymous mapping looks more clean.

> 	cpufreq_governor: performance
>
>
>
> Details are as below:
> -------------------------------------------------------------------------------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250128/202501281038.617c6b60-lkp@intel.com
>
> =========================================================================================
> compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
>    gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-cpl-4sp2/small-allocs/vm-scalability
>
> commit:
>    a68d3cbfad ("memstick: core: fix kernel-doc notation")
>    7143ee2391 ("/dev/zero: make private mapping full anonymous mapping")
>
> a68d3cbfade64392 7143ee2391f1ea15e6791e12987
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>   5.262e+09 ±  3%     -67.6%  1.705e+09 ±  3%  cpuidle..time
>     7924008 ±  3%     -88.9%     875849 ±  3%  cpuidle..usage
>     1585617 ±  5%     +13.5%    1799302 ±  2%  numa-numastat.node1.local_node
>     1667793 ±  4%     +13.2%    1887467 ±  2%  numa-numastat.node1.numa_hit
>      399.52           -78.0%      87.79        uptime.boot
>       14507           -24.4%      10963        uptime.idle
>        3408 ±  5%     -99.6%      13.00 ± 40%  perf-c2c.DRAM.local
>       18076 ±  3%     -99.8%      38.67 ± 36%  perf-c2c.DRAM.remote
>        8082 ±  5%     -99.8%      19.33 ± 52%  perf-c2c.HITM.local
>        6544 ±  6%     -99.8%      14.17 ± 35%  perf-c2c.HITM.remote
>       14627 ±  4%     -99.8%      33.50 ± 34%  perf-c2c.HITM.total
>        6.49 ±  3%     +10.5       17.04 ±  7%  mpstat.cpu.all.idle%
>        0.63            -0.3        0.35 ±  2%  mpstat.cpu.all.irq%
>        0.03 ±  2%      +0.2        0.18 ±  6%  mpstat.cpu.all.soft%
>       91.17           -29.6       61.57 ±  2%  mpstat.cpu.all.sys%
>        1.68 ±  2%     +19.2       20.86 ±  2%  mpstat.cpu.all.usr%
>      337.33           -95.3%      15.83 ± 35%  mpstat.max_utilization.seconds
>        6.99 ±  3%    +190.2%      20.30 ±  5%  vmstat.cpu.id
>       91.35           -34.8%      59.59 ±  2%  vmstat.cpu.sy
>        1.71         +1073.6%      20.04 ±  2%  vmstat.cpu.us
>      210.36           -12.7%     183.65        vmstat.procs.r
>       34204 ±  5%     -41.8%      19899 ±  6%  vmstat.system.cs
>      266575           -23.1%     205001        vmstat.system.in
>     1609925           -50.9%     790974        meminfo.Active
>     1609925           -50.9%     790974        meminfo.Active(anon)
>      160837 ± 33%     -77.3%      36534 ± 11%  meminfo.AnonHugePages
>     4435665           -18.7%    3606310        meminfo.Cached
>     1775547           -44.6%     983546        meminfo.Committed_AS
>      148539           -47.7%      77658 ±  2%  meminfo.Mapped
>    25332110 ±  3%      -7.7%   23373667        meminfo.Memused
>     4245538 ±  4%     -26.2%    3134309        meminfo.PageTables
>    14166291 ±  4%     -11.9%   12484042        meminfo.SUnreclaim
>      929777           -89.1%     100886        meminfo.Shmem
>    14315492 ±  4%     -11.8%   12624243        meminfo.Slab
>     1063552 ±  4%     -27.8%     767817 ± 12%  numa-meminfo.node0.PageTables
>      125455 ±106%     -83.3%      20992 ±155%  numa-meminfo.node0.Shmem
>       48482 ± 67%     -44.8%      26748 ±127%  numa-meminfo.node1.Mapped
>     1062709 ±  4%     -21.9%     829672        numa-meminfo.node1.PageTables
>     1058901 ±  4%     -27.5%     767469 ± 14%  numa-meminfo.node2.PageTables
>      770405 ± 30%     -74.0%     200464 ± 77%  numa-meminfo.node3.Active
>      770405 ± 30%     -74.0%     200464 ± 77%  numa-meminfo.node3.Active(anon)
>     1146977 ±108%     -94.5%      63226 ±114%  numa-meminfo.node3.FilePages
>       52663 ± 47%     -97.8%       1141 ± 55%  numa-meminfo.node3.Mapped
>     6368902 ± 20%     -23.5%    4869231 ± 12%  numa-meminfo.node3.MemUsed
>     1058539 ±  4%     -27.8%     764243 ± 12%  numa-meminfo.node3.PageTables
>      558943 ± 14%     -97.0%      16946 ±195%  numa-meminfo.node3.Shmem
>       64129 ±  4%    +885.2%     631788 ±  3%  vm-scalability.median
>       45.40 ±  5%   +1368.7        1414 ±  5%  vm-scalability.stddev%
>    14364828 ±  4%    +858.5%  1.377e+08 ±  3%  vm-scalability.throughput
>      352.76           -88.2%      41.52 ±  3%  vm-scalability.time.elapsed_time
>      352.76           -88.2%      41.52 ±  3%  vm-scalability.time.elapsed_time.max
>      225965 ±  7%     +62.0%     365969 ±  2%  vm-scalability.time.involuntary_context_switches
>   9.592e+08 ±  4%     +11.9%  1.074e+09        vm-scalability.time.minor_page_faults
>       20852            -9.7%      18831        vm-scalability.time.percent_of_cpu_this_job_got
>       72302           -91.9%       5866 ±  4%  vm-scalability.time.system_time
>        1260 ±  3%     +54.9%       1953        vm-scalability.time.user_time
>     5393707 ±  5%     -99.6%      21840 ± 49%  vm-scalability.time.voluntary_context_switches
>   4.316e+09 ±  4%     +11.9%  4.832e+09        vm-scalability.workload
>      265763 ±  4%     -27.8%     191828 ± 11%  numa-vmstat.node0.nr_page_table_pages
>       31364 ±106%     -83.0%       5332 ±156%  numa-vmstat.node0.nr_shmem
>       12205 ± 67%     -44.4%       6791 ±127%  numa-vmstat.node1.nr_mapped
>      265546 ±  4%     -21.8%     207663        numa-vmstat.node1.nr_page_table_pages
>     1667048 ±  4%     +13.2%    1886422 ±  2%  numa-vmstat.node1.numa_hit
>     1584872 ±  5%     +13.5%    1798258 ±  2%  numa-vmstat.node1.numa_local
>      264589 ±  4%     -27.1%     192920 ± 14%  numa-vmstat.node2.nr_page_table_pages
>      192683 ± 30%     -73.9%      50195 ± 76%  numa-vmstat.node3.nr_active_anon
>      286819 ±108%     -94.5%      15799 ±114%  numa-vmstat.node3.nr_file_pages
>       13124 ± 49%     -97.8%     285.03 ± 55%  numa-vmstat.node3.nr_mapped
>      264499 ±  4%     -27.4%     192027 ± 12%  numa-vmstat.node3.nr_page_table_pages
>      139810 ± 14%     -97.0%       4229 ±195%  numa-vmstat.node3.nr_shmem
>      192683 ± 30%     -73.9%      50195 ± 76%  numa-vmstat.node3.nr_zone_active_anon
>      402515           -50.8%     197849        proc-vmstat.nr_active_anon
>      170568            +1.8%     173597        proc-vmstat.nr_anon_pages
>       78.63 ± 33%     -77.4%      17.80 ± 11%  proc-vmstat.nr_anon_transparent_hugepages
>     4257257            +1.1%    4305540        proc-vmstat.nr_dirty_background_threshold
>     8524925            +1.1%    8621607        proc-vmstat.nr_dirty_threshold
>     1109246           -18.7%     901907        proc-vmstat.nr_file_pages
>    42815276            +1.1%   43299295        proc-vmstat.nr_free_pages
>       37525           -47.6%      19653 ±  2%  proc-vmstat.nr_mapped
>     1059932 ±  4%     -26.0%     784175        proc-vmstat.nr_page_table_pages
>      232507           -89.1%      25298        proc-vmstat.nr_shmem
>       37297            -6.0%      35048        proc-vmstat.nr_slab_reclaimable
>     3537843 ±  4%     -11.8%    3120130        proc-vmstat.nr_slab_unreclaimable
>      402515           -50.8%     197849        proc-vmstat.nr_zone_active_anon
>       61931 ±  8%     -73.8%      16233 ± 34%  proc-vmstat.numa_hint_faults
>       15755 ± 21%     -89.8%       1609 ±117%  proc-vmstat.numa_hint_faults_local
>      293942 ±  3%     -66.1%      99500 ± 20%  proc-vmstat.numa_pte_updates
>   9.608e+08 ±  4%     +11.8%  1.074e+09        proc-vmstat.pgfault
>       55981 ±  2%     -69.0%      17375 ±  8%  proc-vmstat.pgreuse
>        0.82 ±  4%     -60.7%       0.32 ±  3%  perf-stat.i.MPKI
>   2.714e+10 ±  2%    +413.1%  1.393e+11 ±  3%  perf-stat.i.branch-instructions
>        0.11 ±  3%      +0.1        0.19 ±  2%  perf-stat.i.branch-miss-rate%
>    24932893          +321.8%  1.052e+08 ±  3%  perf-stat.i.branch-misses
>       64.93            -7.4       57.53        perf-stat.i.cache-miss-rate%
>    88563288 ±  3%     +50.5%  1.333e+08 ±  3%  perf-stat.i.cache-misses
>   1.369e+08 ±  3%     +55.8%  2.134e+08 ±  3%  perf-stat.i.cache-references
>       34508 ±  4%     -39.5%      20864 ±  6%  perf-stat.i.context-switches
>        7.67           -79.6%       1.57 ±  2%  perf-stat.i.cpi
>   7.989e+11            -7.6%  7.383e+11 ±  2%  perf-stat.i.cpu-cycles
>      696.35 ±  2%     -52.8%     328.76 ±  2%  perf-stat.i.cpu-migrations
>       10834 ±  4%     -32.9%       7272 ±  4%  perf-stat.i.cycles-between-cache-misses
>   1.102e+11          +310.6%  4.525e+11 ±  3%  perf-stat.i.instructions
>        0.14          +426.9%       0.75 ±  2%  perf-stat.i.ipc
>       24.25 ±  3%    +855.3%     231.63 ±  3%  perf-stat.i.metric.K/sec
>     2722043 ±  3%    +867.7%   26340617 ±  3%  perf-stat.i.minor-faults
>     2722043 ±  3%    +867.7%   26340616 ±  3%  perf-stat.i.page-faults
>        0.81 ±  3%     -63.3%       0.30 ±  2%  perf-stat.overall.MPKI
>        0.09            -0.0        0.07 ±  2%  perf-stat.overall.branch-miss-rate%
>       64.81            -2.1       62.72        perf-stat.overall.cache-miss-rate%
>        7.24           -77.5%       1.63 ±  3%  perf-stat.overall.cpi
>        8933 ±  4%     -38.7%       5479 ±  4%  perf-stat.overall.cycles-between-cache-misses
>        0.14          +344.4%       0.61 ±  3%  perf-stat.overall.ipc
>        9012 ±  2%     -57.9%       3797        perf-stat.overall.path-length
>   2.701e+10 ±  2%    +396.9%  1.342e+11 ±  3%  perf-stat.ps.branch-instructions
>    24708939          +305.5%  1.002e+08 ±  4%  perf-stat.ps.branch-misses
>    89032538 ±  3%     +45.9%  1.299e+08 ±  3%  perf-stat.ps.cache-misses
>   1.374e+08 ±  3%     +50.8%  2.071e+08 ±  3%  perf-stat.ps.cache-references
>       34266 ±  5%     -41.1%      20179 ±  7%  perf-stat.ps.context-switches
>      223334            -2.2%     218529        perf-stat.ps.cpu-clock
>   7.941e+11           -10.5%   7.11e+11        perf-stat.ps.cpu-cycles
>      693.54 ±  2%     -54.7%     314.08 ±  2%  perf-stat.ps.cpu-migrations
>   1.097e+11          +297.8%  4.362e+11 ±  3%  perf-stat.ps.instructions
>     2710577 ±  3%    +836.2%   25375552 ±  3%  perf-stat.ps.minor-faults
>     2710577 ±  3%    +836.2%   25375552 ±  3%  perf-stat.ps.page-faults
>      223334            -2.2%     218529        perf-stat.ps.task-clock
>   3.886e+13 ±  2%     -52.8%  1.835e+13        perf-stat.total.instructions
>    64052898 ±  5%     -99.8%     124999 ± 22%  sched_debug.cfs_rq:/.avg_vruntime.avg
>    95701822 ±  7%     -96.4%    3453252 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.max
>    43098762 ±  6%    -100.0%     148.27 ± 21%  sched_debug.cfs_rq:/.avg_vruntime.min
>     9223270 ±  9%     -94.6%     495929 ± 17%  sched_debug.cfs_rq:/.avg_vruntime.stddev
>        0.78 ±  2%     -94.6%       0.04 ± 22%  sched_debug.cfs_rq:/.h_nr_running.avg
>        0.28 ±  7%     -28.9%       0.20 ± 10%  sched_debug.cfs_rq:/.h_nr_running.stddev
>      411536 ± 58%    -100.0%       3.77 ±141%  sched_debug.cfs_rq:/.left_deadline.avg
>    43049468 ± 22%    -100.0%     844.45 ±141%  sched_debug.cfs_rq:/.left_deadline.max
>     3836405 ± 37%    -100.0%      56.30 ±141%  sched_debug.cfs_rq:/.left_deadline.stddev
>      411536 ± 58%    -100.0%       3.62 ±141%  sched_debug.cfs_rq:/.left_vruntime.avg
>    43049467 ± 22%    -100.0%     809.82 ±141%  sched_debug.cfs_rq:/.left_vruntime.max
>     3836405 ± 37%    -100.0%      53.99 ±141%  sched_debug.cfs_rq:/.left_vruntime.stddev
>        8792 ± 28%     -81.8%       1600 ±106%  sched_debug.cfs_rq:/.load.avg
>    64052901 ±  5%     -99.8%     124999 ± 22%  sched_debug.cfs_rq:/.min_vruntime.avg
>    95701822 ±  7%     -96.4%    3453252 ±  6%  sched_debug.cfs_rq:/.min_vruntime.max
>    43098762 ±  6%    -100.0%     148.27 ± 21%  sched_debug.cfs_rq:/.min_vruntime.min
>     9223270 ±  9%     -94.6%     495929 ± 17%  sched_debug.cfs_rq:/.min_vruntime.stddev
>        0.77 ±  2%     -94.6%       0.04 ± 22%  sched_debug.cfs_rq:/.nr_running.avg
>        0.26 ± 10%     -22.4%       0.20 ± 10%  sched_debug.cfs_rq:/.nr_running.stddev
>      411536 ± 58%    -100.0%       3.62 ±141%  sched_debug.cfs_rq:/.right_vruntime.avg
>    43049467 ± 22%    -100.0%     809.82 ±141%  sched_debug.cfs_rq:/.right_vruntime.max
>     3836405 ± 37%    -100.0%      53.99 ±141%  sched_debug.cfs_rq:/.right_vruntime.stddev
>      286633 ± 43%    +421.0%    1493420 ± 42%  sched_debug.cfs_rq:/.runnable_avg.avg
>    34728895 ± 30%    +380.1%  1.667e+08 ± 27%  sched_debug.cfs_rq:/.runnable_avg.max
>     2845573 ± 30%    +406.5%   14411856 ± 30%  sched_debug.cfs_rq:/.runnable_avg.stddev
>      769.03           -85.4%     112.18 ±  6%  sched_debug.cfs_rq:/.util_avg.avg
>        1621 ±  5%     -39.3%     983.67 ±  9%  sched_debug.cfs_rq:/.util_avg.max
>      159.12 ±  8%     +26.6%     201.45 ±  6%  sched_debug.cfs_rq:/.util_avg.stddev
>      724.17 ±  2%     -98.8%       8.91 ± 43%  sched_debug.cfs_rq:/.util_est.avg
>        1360 ± 15%     -52.9%     640.17 ± 13%  sched_debug.cfs_rq:/.util_est.max
>      234.34 ±  9%     -71.0%      67.88 ± 27%  sched_debug.cfs_rq:/.util_est.stddev
>      766944 ±  3%     +18.9%     911838        sched_debug.cpu.avg_idle.avg
>     1067639 ±  5%     +31.7%    1406047 ± 12%  sched_debug.cpu.avg_idle.max
>      321459 ±  2%     -37.0%     202531 ±  7%  sched_debug.cpu.avg_idle.stddev
>      195573           -76.7%      45494        sched_debug.cpu.clock.avg
>      195596           -76.7%      45510        sched_debug.cpu.clock.max
>      195548           -76.7%      45471        sched_debug.cpu.clock.min
>       13.79 ±  3%     -36.2%       8.80 ±  2%  sched_debug.cpu.clock.stddev
>      194424           -76.7%      45370        sched_debug.cpu.clock_task.avg
>      194608           -76.6%      45496        sched_debug.cpu.clock_task.max
>      181834           -81.8%      33106        sched_debug.cpu.clock_task.min
>        4241 ±  2%     -96.8%     134.16 ± 27%  sched_debug.cpu.curr->pid.avg
>        9799 ±  2%     -59.8%       3941        sched_debug.cpu.curr->pid.max
>        1365 ± 10%     -49.6%     688.63 ± 13%  sched_debug.cpu.curr->pid.stddev
>      537665 ±  4%     +31.3%     705893 ±  9%  sched_debug.cpu.max_idle_balance_cost.max
>        3119 ± 56%    +590.3%      21534 ± 34%  sched_debug.cpu.max_idle_balance_cost.stddev
>        0.00 ± 12%     -70.8%       0.00 ± 12%  sched_debug.cpu.next_balance.stddev
>        0.78 ±  2%     -95.2%       0.04 ± 25%  sched_debug.cpu.nr_running.avg
>        2.17 ±  8%     -46.2%       1.17 ± 31%  sched_debug.cpu.nr_running.max
>        0.29 ±  8%     -34.0%       0.19 ± 12%  sched_debug.cpu.nr_running.stddev
>       25773 ±  5%     -97.0%     783.41 ±  5%  sched_debug.cpu.nr_switches.avg
>       48669 ± 10%     -76.8%      11301 ± 18%  sched_debug.cpu.nr_switches.max
>       19006 ±  7%     -99.2%     156.50 ± 11%  sched_debug.cpu.nr_switches.min
>        4142 ±  8%     -68.9%       1290 ± 12%  sched_debug.cpu.nr_switches.stddev
>        0.07 ± 23%     -94.0%       0.00 ± 57%  sched_debug.cpu.nr_uninterruptible.avg
>      240.19 ± 16%     -81.7%      44.00 ± 19%  sched_debug.cpu.nr_uninterruptible.max
>      -77.92           -84.6%     -12.00        sched_debug.cpu.nr_uninterruptible.min
>       37.87 ±  5%     -85.2%       5.60 ± 12%  sched_debug.cpu.nr_uninterruptible.stddev
>      195549           -76.7%      45480        sched_debug.cpu_clk
>      194699           -77.1%      44630        sched_debug.ktime
>        0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
>        0.17          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.max
>        0.01          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.stddev
>      196368           -76.4%      46311        sched_debug.sched_clk
>       95.59           -95.6        0.00        perf-profile.calltrace.cycles-pp.__mmap
>       95.54           -95.5        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
>       95.54           -95.5        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
>       94.54           -94.5        0.00        perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
>       94.46           -94.1        0.31 ±101%  perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
>       94.14           -93.8        0.37 ±105%  perf-profile.calltrace.cycles-pp.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
>       93.79           -93.6        0.16 ±223%  perf-profile.calltrace.cycles-pp.vma_link_file.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff
>       93.44           -93.4        0.00        perf-profile.calltrace.cycles-pp.down_write.vma_link_file.__mmap_new_vma.__mmap_region.do_mmap
>       93.40           -93.4        0.00        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>       93.33           -93.3        0.00        perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.vma_link_file.__mmap_new_vma
>       94.25           -93.3        0.98 ± 82%  perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>       94.45           -93.0        1.40 ± 51%  perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       92.89           -92.9        0.00        perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.vma_link_file
>        0.00            +1.7        1.73 ± 34%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exec_mmap.begin_new_exec.load_elf_binary
>        0.00            +1.8        1.82 ± 56%  perf-profile.calltrace.cycles-pp.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
>        0.00            +1.9        1.85 ± 31%  perf-profile.calltrace.cycles-pp.__mmput.exec_mmap.begin_new_exec.load_elf_binary.search_binary_handler
>        0.00            +1.9        1.85 ± 31%  perf-profile.calltrace.cycles-pp.begin_new_exec.load_elf_binary.search_binary_handler.exec_binprm.bprm_execve
>        0.00            +1.9        1.85 ± 31%  perf-profile.calltrace.cycles-pp.exec_mmap.begin_new_exec.load_elf_binary.search_binary_handler.exec_binprm
>        0.00            +2.3        2.28 ± 38%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
>        0.00            +2.5        2.48 ± 25%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
>        0.00            +2.5        2.48 ± 25%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
>        0.00            +2.5        2.50 ± 48%  perf-profile.calltrace.cycles-pp.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
>        0.00            +2.5        2.52 ± 31%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +2.5        2.52 ± 31%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +2.7        2.68 ± 27%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
>        0.00            +2.7        2.71 ± 40%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
>        0.00            +2.7        2.71 ± 40%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +2.8        2.76 ± 59%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>        0.00            +2.8        2.85 ± 54%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry
>        0.00            +2.8        2.85 ± 54%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt
>        0.00            +3.0        2.96 ± 53%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
>        0.00            +3.0        2.99 ± 53%  perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
>        0.00            +3.0        2.99 ± 53%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
>        0.00            +3.0        2.99 ± 53%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
>        0.00            +3.0        2.99 ± 53%  perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
>        0.00            +3.0        3.02 ± 31%  perf-profile.calltrace.cycles-pp.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64
>        0.00            +3.0        3.02 ± 31%  perf-profile.calltrace.cycles-pp.load_elf_binary.search_binary_handler.exec_binprm.bprm_execve.do_execveat_common
>        0.00            +3.0        3.02 ± 31%  perf-profile.calltrace.cycles-pp.search_binary_handler.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve
>        0.00            +3.0        3.03 ± 52%  perf-profile.calltrace.cycles-pp._Fork
>        0.00            +3.3        3.31 ± 26%  perf-profile.calltrace.cycles-pp.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>        0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>        0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>        0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
>        0.00            +3.5        3.52 ± 20%  perf-profile.calltrace.cycles-pp.execve
>        0.00            +3.5        3.54 ± 41%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
>        0.00            +3.5        3.54 ± 41%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
>        0.00            +3.7        3.69 ± 37%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00            +3.7        3.69 ± 37%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
>        0.00            +3.9        3.89 ± 50%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
>        0.00            +3.9        3.94 ± 44%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
>        0.00            +4.2        4.18 ± 91%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
>        0.00            +4.2        4.18 ± 91%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
>        0.00            +4.2        4.18 ± 91%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
>        0.00            +5.5        5.54 ± 38%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
>        0.00            +5.8        5.85 ± 27%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
>        0.00            +6.5        6.50 ± 62%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
>        0.00            +6.5        6.50 ± 62%  perf-profile.calltrace.cycles-pp.main
>        0.00            +6.5        6.50 ± 62%  perf-profile.calltrace.cycles-pp.run_builtin.handle_internal_command.main
>        0.00            +9.1        9.05 ± 54%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        0.00            +9.1        9.05 ± 54%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        0.00            +9.4        9.38 ± 52%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        0.00            +9.5        9.48 ± 52%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
>        0.00            +9.9        9.92 ± 57%  perf-profile.calltrace.cycles-pp.read
>        0.00           +12.0       11.98 ± 50%  perf-profile.calltrace.cycles-pp.asm_sysvec_reschedule_ipi.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
>        0.00           +18.8       18.83 ± 38%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.00           +18.8       18.83 ± 38%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>        1.21 ±  3%     +34.3       35.50 ± 18%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
>        1.21 ±  3%     +34.8       35.97 ± 18%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>        1.21 ±  3%     +35.0       36.19 ± 16%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
>        1.21 ±  3%     +35.1       36.30 ± 16%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
>        1.21 ±  3%     +35.1       36.30 ± 16%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
>        1.22 ±  3%     +35.5       36.71 ± 18%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
>        1.22 ±  3%     +35.5       36.71 ± 18%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>        1.22 ±  3%     +35.5       36.71 ± 18%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
>        1.22 ±  3%     +36.4       37.61 ± 15%  perf-profile.calltrace.cycles-pp.common_startup_64
>        2.19 ±  3%     +49.9       52.08 ± 18%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
>       95.60           -95.2        0.42 ±113%  perf-profile.children.cycles-pp.__mmap
>       94.14           -93.6        0.54 ±106%  perf-profile.children.cycles-pp.__mmap_new_vma
>       93.79           -93.6        0.21 ±171%  perf-profile.children.cycles-pp.vma_link_file
>       93.40           -93.4        0.00        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
>       93.33           -93.3        0.00        perf-profile.children.cycles-pp.rwsem_optimistic_spin
>       93.44           -93.2        0.24 ±178%  perf-profile.children.cycles-pp.down_write
>       94.55           -93.1        1.40 ± 51%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
>       94.25           -93.0        1.30 ± 59%  perf-profile.children.cycles-pp.__mmap_region
>       92.91           -92.9        0.00        perf-profile.children.cycles-pp.osq_lock
>       94.45           -92.7        1.72 ± 34%  perf-profile.children.cycles-pp.do_mmap
>       94.46           -92.6        1.83 ± 31%  perf-profile.children.cycles-pp.vm_mmap_pgoff
>       95.58           -45.3       50.30 ±  6%  perf-profile.children.cycles-pp.do_syscall_64
>       95.58           -45.2       50.40 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
>        0.00            +1.2        1.22 ± 40%  perf-profile.children.cycles-pp._raw_spin_lock
>        0.00            +1.3        1.26 ± 34%  perf-profile.children.cycles-pp.seq_printf
>        0.00            +1.3        1.32 ± 78%  perf-profile.children.cycles-pp.kmem_cache_free
>        0.00            +1.6        1.60 ± 42%  perf-profile.children.cycles-pp.sched_balance_rq
>        0.00            +1.7        1.73 ± 41%  perf-profile.children.cycles-pp.open_last_lookups
>        0.00            +1.9        1.85 ± 31%  perf-profile.children.cycles-pp.begin_new_exec
>        0.00            +1.9        1.85 ± 31%  perf-profile.children.cycles-pp.exec_mmap
>        0.00            +2.1        2.09 ± 40%  perf-profile.children.cycles-pp.do_pte_missing
>        0.46            +2.4        2.85 ± 54%  perf-profile.children.cycles-pp.__hrtimer_run_queues
>        0.53            +2.4        2.94 ± 49%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
>        0.53            +2.4        2.94 ± 49%  perf-profile.children.cycles-pp.hrtimer_interrupt
>        0.00            +2.4        2.44 ±101%  perf-profile.children.cycles-pp.__evlist__enable
>        0.00            +2.5        2.54 ± 45%  perf-profile.children.cycles-pp.zap_present_ptes
>        0.00            +2.6        2.58 ± 54%  perf-profile.children.cycles-pp.mutex_unlock
>        0.00            +2.7        2.68 ± 67%  perf-profile.children.cycles-pp.evlist_cpu_iterator__next
>        0.00            +2.7        2.71 ± 40%  perf-profile.children.cycles-pp.__x64_sys_exit_group
>        0.00            +2.7        2.71 ± 40%  perf-profile.children.cycles-pp.x64_sys_call
>        0.00            +3.0        2.99 ± 53%  perf-profile.children.cycles-pp.__do_sys_clone
>        0.00            +3.0        2.99 ± 53%  perf-profile.children.cycles-pp.kernel_clone
>        0.00            +3.0        3.02 ± 31%  perf-profile.children.cycles-pp.exec_binprm
>        0.00            +3.0        3.02 ± 31%  perf-profile.children.cycles-pp.load_elf_binary
>        0.00            +3.0        3.02 ± 31%  perf-profile.children.cycles-pp.search_binary_handler
>        0.00            +3.0        3.03 ± 52%  perf-profile.children.cycles-pp._Fork
>        0.00            +3.3        3.31 ± 26%  perf-profile.children.cycles-pp.bprm_execve
>        0.58 ±  2%      +3.4        3.98 ± 47%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
>        0.00            +3.5        3.52 ± 20%  perf-profile.children.cycles-pp.execve
>        0.04 ± 44%      +3.7        3.72 ± 18%  perf-profile.children.cycles-pp.__schedule
>        0.00            +3.7        3.72 ± 14%  perf-profile.children.cycles-pp.__x64_sys_execve
>        0.00            +3.7        3.72 ± 14%  perf-profile.children.cycles-pp.do_execveat_common
>        0.51 ±  6%      +3.7        4.25 ± 31%  perf-profile.children.cycles-pp.handle_mm_fault
>        0.00            +3.8        3.79 ± 40%  perf-profile.children.cycles-pp.zap_pte_range
>        0.00            +3.9        3.90 ± 26%  perf-profile.children.cycles-pp.do_filp_open
>        0.00            +3.9        3.90 ± 26%  perf-profile.children.cycles-pp.path_openat
>        0.00            +3.9        3.91 ± 43%  perf-profile.children.cycles-pp.unmap_page_range
>        0.00            +3.9        3.91 ± 43%  perf-profile.children.cycles-pp.zap_pmd_range
>        1.18            +4.0        5.20 ± 19%  perf-profile.children.cycles-pp.asm_exc_page_fault
>        0.19 ± 23%      +4.0        4.21 ± 32%  perf-profile.children.cycles-pp.__handle_mm_fault
>        0.77 ±  3%      +4.0        4.79 ± 27%  perf-profile.children.cycles-pp.exc_page_fault
>        0.76 ±  3%      +4.0        4.79 ± 27%  perf-profile.children.cycles-pp.do_user_addr_fault
>        0.00            +4.1        4.13 ± 38%  perf-profile.children.cycles-pp.do_sys_openat2
>        0.00            +4.2        4.15 ± 35%  perf-profile.children.cycles-pp.unmap_vmas
>        0.00            +4.2        4.18 ± 91%  perf-profile.children.cycles-pp.kthread
>        0.00            +4.2        4.22 ± 91%  perf-profile.children.cycles-pp.ret_from_fork
>        0.00            +4.2        4.22 ± 91%  perf-profile.children.cycles-pp.ret_from_fork_asm
>        0.00            +4.3        4.25 ± 37%  perf-profile.children.cycles-pp.__x64_sys_openat
>        0.00            +5.5        5.54 ± 38%  perf-profile.children.cycles-pp.exit_mm
>        0.00            +6.1        6.09 ± 48%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
>        0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.__cmd_record
>        0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.cmd_record
>        0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.handle_internal_command
>        0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.main
>        0.02 ±141%      +6.5        6.50 ± 62%  perf-profile.children.cycles-pp.run_builtin
>        0.00            +7.3        7.28 ± 26%  perf-profile.children.cycles-pp.exit_mmap
>        0.00            +7.4        7.40 ± 27%  perf-profile.children.cycles-pp.__mmput
>        0.00            +8.5        8.52 ± 58%  perf-profile.children.cycles-pp.seq_read_iter
>        0.00            +8.6        8.56 ± 52%  perf-profile.children.cycles-pp.__fput
>        0.00            +9.1        9.05 ± 54%  perf-profile.children.cycles-pp.ksys_read
>        0.00            +9.1        9.05 ± 54%  perf-profile.children.cycles-pp.vfs_read
>        0.00            +9.7        9.72 ± 54%  perf-profile.children.cycles-pp.read
>        0.00           +16.0       16.03 ± 41%  perf-profile.children.cycles-pp.do_exit
>        0.00           +16.0       16.03 ± 41%  perf-profile.children.cycles-pp.do_group_exit
>        1.70 ±  2%     +26.7       28.38 ± 16%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
>        1.21 ±  3%     +35.0       36.19 ± 16%  perf-profile.children.cycles-pp.acpi_idle_do_entry
>        1.21 ±  3%     +35.0       36.19 ± 16%  perf-profile.children.cycles-pp.acpi_safe_halt
>        1.21 ±  3%     +35.1       36.30 ± 16%  perf-profile.children.cycles-pp.acpi_idle_enter
>        1.21 ±  3%     +35.1       36.30 ± 16%  perf-profile.children.cycles-pp.cpuidle_enter_state
>        1.21 ±  3%     +35.2       36.40 ± 15%  perf-profile.children.cycles-pp.cpuidle_enter
>        1.22 ±  3%     +35.5       36.71 ± 18%  perf-profile.children.cycles-pp.start_secondary
>        1.22 ±  3%     +35.7       36.87 ± 15%  perf-profile.children.cycles-pp.cpuidle_idle_call
>        1.22 ±  3%     +36.4       37.61 ± 15%  perf-profile.children.cycles-pp.common_startup_64
>        1.22 ±  3%     +36.4       37.61 ± 15%  perf-profile.children.cycles-pp.cpu_startup_entry
>        1.22 ±  3%     +36.4       37.61 ± 15%  perf-profile.children.cycles-pp.do_idle
>       92.37           -92.4        0.00        perf-profile.self.cycles-pp.osq_lock
>        1.19 ±  3%     +29.6       30.75 ± 22%  perf-profile.self.cycles-pp.acpi_safe_halt
>        0.17 ±142%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
>        0.19 ± 34%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        0.14 ± 55%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
>        0.14 ± 73%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
>        0.10 ± 66%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
>        0.11 ± 59%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>        0.04 ±132%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
>        0.07 ±101%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>        0.02 ± 31%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        0.02 ±143%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
>        0.10 ± 44%     -99.5%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
>        0.12 ±145%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
>        0.04 ± 55%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        0.25 ± 41%     -95.8%       0.01 ±144%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
>        0.11 ± 59%     -99.1%       0.00 ±115%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
>        0.40 ± 50%     -99.6%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        0.32 ±104%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
>        0.01 ± 12%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.08 ± 28%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>        0.01 ± 42%     -90.6%       0.00 ±223%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
>        0.18 ± 57%     -99.8%       0.00 ±223%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        0.03 ± 83%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
>        0.01 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>        0.32 ± 47%     -97.1%       0.01 ± 55%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>        0.07 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>        0.26 ± 17%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>        0.02 ± 60%     -83.3%       0.00 ±141%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>        0.01 ±128%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
>        0.06 ± 31%   +1806.3%       1.16 ±127%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1.00 ±151%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
>       25.45 ± 94%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        4.56 ± 67%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
>        3.55 ± 97%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
>        2.13 ± 67%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
>        3.16 ± 78%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>        0.30 ±159%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
>        1.61 ±100%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>        0.03 ± 86%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        0.20 ±182%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
>        3.51 ± 21%    -100.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
>        0.83 ±160%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
>        0.09 ± 31%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        3.59 ± 11%     -99.6%       0.01 ±158%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
>        1.60 ± 69%     -99.9%       0.00 ±104%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
>        0.81 ± 43%     -99.8%       0.00 ±223%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        1.02 ± 88%    -100.0%       0.00        perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
>        0.02 ±  7%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>        9.68 ± 32%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>        0.01 ± 49%     -92.3%       0.00 ±223%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
>       12.26 ±109%    -100.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        5.60 ±139%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
>        0.03 ±106%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>        2.11 ± 61%     -99.6%       0.01 ±160%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
>      171.77 ±217%     -99.7%       0.54 ±195%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
>        3.67 ± 25%     -99.7%       0.01 ± 47%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>       37.84 ± 47%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>        4.68 ± 36%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>        0.21 ±169%     -98.4%       0.00 ±145%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>        7.92 ±131%     -99.6%       0.03 ± 75%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        0.36 ±186%    -100.0%       0.00        perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
>       33.45 ±  3%     -88.6%       3.82 ± 80%  perf-sched.total_wait_and_delay.average.ms
>       97903 ±  4%     -98.0%       1998 ± 22%  perf-sched.total_wait_and_delay.count.ms
>        2942 ± 23%     -96.3%     109.30 ± 43%  perf-sched.total_wait_and_delay.max.ms
>       33.37 ±  3%     -88.9%       3.71 ± 83%  perf-sched.total_wait_time.average.ms
>        2942 ± 23%     -97.2%      81.62 ± 52%  perf-sched.total_wait_time.max.ms
>        3.97 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        3.08 ±  4%     -96.4%       0.11 ± 94%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>      119.91 ± 38%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>      433.73 ± 41%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      302.41 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1.48 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>       23.24 ± 25%     -95.7%       1.01 ± 23%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
>      327.16 ±  9%     -97.5%       8.12 ±202%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>      369.37 ±  2%     -96.6%      12.56 ± 89%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>        0.96 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>      453.60          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>      187.66           -95.3%       8.75 ± 90%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>      750.07           -99.0%       7.40 ± 73%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1831 ±  9%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        1269 ±  8%     -43.3%     719.33 ± 26%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>        6.17 ± 45%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        5.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>       14.33 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>      810.00 ± 10%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>        3112 ± 24%     -96.8%     100.67 ± 72%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
>       40.50 ±  8%     -97.5%       1.00 ±100%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>       13.17 ±  2%     -44.3%       7.33 ± 28%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       73021 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>       40.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
>        1122           -98.5%      16.33 ± 78%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>       11323 ±  3%     -93.3%     756.17 ± 25%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        1887 ± 45%     -99.9%       2.33 ±117%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        1238           -93.4%      81.50 ± 64%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       35.19 ± 57%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        1002           -96.9%      31.26 ± 97%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>      318.48 ± 65%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        1000          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      966.90 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>       20.79 ± 19%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>        1043           -97.6%      24.88 ±123%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
>        1240 ± 20%     -98.7%      16.23 ±202%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>      500.34           -90.4%      47.79 ± 94%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       58.83 ± 39%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>      505.17          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>       19.77 ± 55%     -68.0%       6.33 ± 54%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>        1237 ± 34%     -93.3%      83.40 ± 33%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        1001           -97.3%      27.51 ±141%  perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        2794 ± 24%     -97.4%      73.62 ± 55%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       49.27 ±119%    -100.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
>       58.17 ±187%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
>        3.78 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        2.99 ±  4%     -98.1%       0.06 ± 95%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>        3.92 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
>        4.71 ±  8%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
>        1.67 ± 20%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
>        2.10 ± 27%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>        0.01 ± 44%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
>        1.67 ± 21%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>        0.04 ±133%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>       67.14 ± 73%     -96.0%       2.67 ±208%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
>        1.65 ± 67%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
>        2.30 ± 14%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
>       42.44 ±200%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
>      119.87 ± 38%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        3.80 ± 18%     -99.7%       0.01 ±144%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
>      433.32 ± 41%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      250.23 ±107%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
>       29.19 ±  5%     -99.0%       0.30 ± 28%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
>      302.40 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1.40 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>        4.03 ±  8%     -96.6%       0.14 ±223%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       35.38 ±192%     -99.9%       0.05 ±223%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>        0.05 ± 40%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
>        0.72 ±220%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>        1.00 ±120%     -98.0%       0.02 ±193%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
>       23.07 ± 24%     -95.7%       1.00 ± 23%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
>      326.84 ±  9%     -97.5%       8.14 ±201%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>      369.18 ±  2%     -98.0%       7.39 ±103%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>        0.89 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>        1.17 ± 16%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>      453.58          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>        4.42           -27.8%       3.19 ± 26%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>      187.58           -95.4%       8.69 ± 91%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        0.01 ±156%    -100.0%       0.00        perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
>      750.01           -99.2%       6.24 ± 99%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      340.69 ±135%    -100.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
>      535.09 ±128%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
>       22.04 ± 32%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>        1001           -98.4%      15.63 ± 97%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>       13.57 ± 17%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
>       13.54 ± 10%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
>       10.17 ± 19%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
>       11.35 ± 25%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
>        0.01 ± 32%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
>       10.62 ±  9%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>        0.20 ±199%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        1559 ± 64%     -99.8%       2.67 ±208%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
>        6.93 ± 53%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
>       14.42 ± 22%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
>      159.10 ±148%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
>      391.02 ±171%     -99.3%       2.80 ±223%  perf-sched.wait_time.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
>      318.43 ± 65%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       13.14 ± 21%     -99.9%       0.01 ±158%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
>        1000          -100.0%       0.00        perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      500.84 ± 99%    -100.0%       0.00        perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
>      641.50 ± 23%     -99.0%       6.41 ± 48%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
>       10.75 ± 98%     -93.5%       0.70 ±  9%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      966.89 ±  7%    -100.0%       0.00        perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
>       15.80 ±  8%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
>       16.69 ± 10%     -99.2%       0.14 ±223%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       41.71 ±158%     -99.9%       0.05 ±223%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>       11.64 ± 61%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
>        2.94 ±213%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>      175.70 ±210%    -100.0%       0.06 ±213%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
>        1043           -97.6%      24.88 ±123%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
>        1240 ± 20%     -98.7%      16.28 ±201%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
>      500.11           -94.3%      28.64 ±118%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       32.65 ± 33%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.vma_link_file
>       22.94 ± 56%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>      505.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>       12.20 ± 43%     -60.5%       4.82 ±  7%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>        1237 ± 34%     -94.0%      74.19 ± 53%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>        1000           -97.2%      27.51 ±141%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        0.36 ±190%    -100.0%       0.00        perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
>        2794 ± 24%     -98.0%      56.88 ± 94%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
>
>

