Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5B34C76
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775224; cv=fail; b=jCa7edcQqoaEYxiQpGlA/EhqdpkDX0AzWFmoqxAFmZM+fr4zjGe5oFD23uTQywiQPNKK2mjOGeKEn22/qLZGN5cDGtLKydpnPO4M7YqvK49JCanfXWxqGueYjx0s+nZQx+QZCOCZ/3jRgQp6HbNZUPnXPdyZ1KRANb7m7ao89ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775224; c=relaxed/simple;
	bh=rcT72eMqYJJ5YlL2xEeimdTlKD50ZQDvuZmTTA0GzWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cuQhe2ZZMIEtU3lnzKDZWp/D2Qil2lYtx7dlU0g3T3r0lh/LoI0VzdV37Ku3/v1kjuDPSlWOmcFOtASo07zBZAs2cHjo5Nd0yEKXiX7Dp/0uXrKjxy3VGi9QRb+szc3hKdt6r3kMLRxQHuOonn3d1RzU8zdwLreTip86SZr1dOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RqPRYzvK; arc=fail smtp.client-ip=40.107.102.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RqPRYzvK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRD/eHn0RYsqATjFmDwNJv73VMc9CeIhI4dGDygjUU4z9oVLK2ZSvv7XHV+z1NPtMSbjcj5hDv2z1c2rRnn7SgKOS7aUYHLSHZRCwoIKBd/wqnhKtgZZD7mSdB5l1wegrhEUj2fGnncuggG/0liAt0afDce6VI4mILMIECdG/CUEezM4IpqznBCJeNbz37pIzzxmvVZZiSCAsd1UBcaPUy4p4k6LJ7tGVcjJsm8WkmCtS7iARlZBOOJ7mD8QmkA3xOsqzRCT8F+FStTwR0gQKJ2RnzxhN3RC14ni1616tgZZyV2k2OsHODlyeUrCOCi+ylIQDjGA18L0EwzcqN1kqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+YJDSfb7CTIo2AoCebQgpjms1MTVoxrsKTeOIez3DU=;
 b=doK2b92FqhG7rdDkFq9f38b32jDi6AKNDlqpJvpSEaCxlsk1WOBY9rl8v9MilU0cLqn9NqAMz76loQW6gCt5C8TFRdLYuq81yfIIgMZTX/7JhOxO3OpBwUD0ePYQo0s3Qy/6y77CMEtxrxeBpKdVzJJwPcdPDQHrdt/WSgtuGCKe6I+T53VESyCp6+eRq9UahS1d3pS/H4Wkh/q/6RKwOwI7VU3rSnJSP95VD5vfiDI7gHLlJ8a/95aQnmCKH52eEkSyOCLvBE2kXx28dY89CZ2y7inoDGzr2mrFpih+J0hZ1Wu1OIwKPIJgQsxebI44JHvJVi+pdg5+6kAPZUNGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+YJDSfb7CTIo2AoCebQgpjms1MTVoxrsKTeOIez3DU=;
 b=RqPRYzvK2uOzq2BxGFtlkNeW1iWcUDrN5cARNLSclgFsnNrW0johpa4X8hb53sxftNz7ahMObUsCwlXZYDReoogTeLHLah3QoE99300GDsq7q2QYsFq71uL/BD9ili0QieFa8HR9otVWSmYWBQESoljhU0Mw6UgIk02hKvd/LYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 17:06:59 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%5]) with mapi id 15.20.8398.020; Wed, 5 Feb 2025
 17:06:59 +0000
Date: Wed, 5 Feb 2025 12:06:51 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] linux/bits.h: Squash unsigned comparison warning for
 GENMASK
Message-ID: <20250205170651.GA56382@yaz-khff2.amd.com>
References: <20250204-fix-genmask-warn-v1-1-626de7a30090@amd.com>
 <Z6KF8UBsQ4NmR9KS@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6KF8UBsQ4NmR9KS@thinkpad>
X-ClientProxiedBy: BL1PR13CA0412.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::27) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|SJ0PR12MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: bb49c4fd-acb3-40b9-a15b-08dd46078093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWgxTzFmbE9ldDVxc2RzY3FNTU5Pc3MvUGQ3QjRpbm9wTzFkVFNSQURnajlz?=
 =?utf-8?B?ZThXaVFUR3I3cTJWOEtHUUpta2x3b1A0U3BUUU40Z3o4d0xZMXQ5T1FES09S?=
 =?utf-8?B?eEdaUjBmRmQrQW5xZFcvNTR0d2Rla3RMNm10NWlOcEw2NFZTdkF1TmhpSG1N?=
 =?utf-8?B?N3JlTVN4KzRVMlE0emtPaGd2UVZ6WUQvOVhMQlNtMVlZS0k1aGY1cnN3ZkJY?=
 =?utf-8?B?Qmx5ZWw5cE9wYXhFa3VCNlBiTkdQc2RiaWdTWWtIWWIvUk02eDZVU2FjYW9G?=
 =?utf-8?B?bTJpWi9jeUNJL2U0SjY3MFBHanUzdUFuSnB4d0RSQi9xV3FCM2xvQWlKQUFK?=
 =?utf-8?B?aSswaENQcDFPdHIrWGxyNnZoaVI4RGI1ajRDVUJGQzJIWkVYdE9GUC90dmsv?=
 =?utf-8?B?L2lOZ1FqaCt4RDhTTkhkNUhjZHQwYzN6dmZkbUIvQ1g0cnZKRGc0UjBDSWE2?=
 =?utf-8?B?aTJnVk5lcXgrWTJQditadEhJMjJrZ0hQM3VNckFSWFhJT1p6WCtQWURjcEJq?=
 =?utf-8?B?ZXhta25wUHNqZWhSZ0M4VmQ0V2t4ZWxZWUhpTG91a3F5Y3FKeTNmUEVXYW56?=
 =?utf-8?B?V2xVSHBhVWNUVjZxdUtrMnpMSjZNVFlFSkQ5VDBvUGJnSUpseFB3RXdYNVla?=
 =?utf-8?B?c3FHaU9qL1VidkNzY203d0tiSEYwdjl6Yis4a2xKbTdiMWVyM2tSWWJabU03?=
 =?utf-8?B?cmN1SklZV3J3blRxTDRvWThIclExZlJHRSthbTVici9Ucmw4bXNJcVZIay94?=
 =?utf-8?B?VHBKWllVdnBxbTNEODlGQjcybldWVXpoZ25GL3AySTBTZ3lPbmhzVTBVMkZK?=
 =?utf-8?B?LzlmVnhqd0g1UER3NmpEV3lqYWdUV3JrUnZBUGg1V0Q0QXNYSk03VGhwazFG?=
 =?utf-8?B?dlNXS3phVlY2QUlEWlNjb1loNy9jNEpES21MQ1BKMGh5WSt2YUVQSDNOMzhY?=
 =?utf-8?B?YWVvNkFrdUhsZllBczB0T0dlZjZSSHIrREdBYURHS20xUnNib1BicnBNYmVl?=
 =?utf-8?B?bGNXS1RZQm5OUE9qS2lGOVEzYnpqZ3gvdjhENU1RdktWMTgzMktUS1NDU3lX?=
 =?utf-8?B?WnBoZjV3Y1NKTEZRcnlzdUVoMTBvZkhzeE9JaXlWeEJOdTROYnVkVWpNZFIv?=
 =?utf-8?B?cnRHZ0xkM0NwdzErUVBqRW8zalVielp2QWg1YlRxTlZ0ODZJVG15OEZETWJT?=
 =?utf-8?B?VWZqcllkWXUrUEkxekxoL09uUmpRaEE1V3o3TTM5OUNsVExETUhDL1EycS8x?=
 =?utf-8?B?eEVTQmZnWHhPelNZM2dqZUM3Y2RadEFWZThlQzh0NnVJd1pncGkyQy9DNitI?=
 =?utf-8?B?YXV1LzVnY2tsMXJabzRLcjNEYjBLdy9ZRDlDS1JLK0NDUEJzVi9OcUh0ampF?=
 =?utf-8?B?YjBZSVRzd1VCSE1OWnNXYXdDQkN1cUhxSHl5NUJuYVVBamg0LzFSeGNnNkRE?=
 =?utf-8?B?Ly9aNC9jRTNOWnBkUDkxelNRd1g2Y3AxZUV3QXJGUlhrUTROeHRTRlNxemJK?=
 =?utf-8?B?NENaY1V2ZGZ1ZVdWK0YvWjV0Q2xsRVRIekJ1cTNPTEhWWDNHZHU3QTZlSmxL?=
 =?utf-8?B?a1dETmp2N2FNWTBWNzJ5VnFQbUJic2FNS1kySnc1Rk8vUVRQNlJlL1hhck5X?=
 =?utf-8?B?aWhPY05GbUVmOFF5R0JWczIvMFBpQ3daTlU1YmcyWFZldTNEQWZneGJjQ2ZS?=
 =?utf-8?B?UTlOdkY0WFd0OGliMTViVUpyT2ZsVjFPVVNxWjNBYkxNOGRaYkRsanlqNkd2?=
 =?utf-8?B?QlF6OEtFZGpyRm8zWGlnR2QyeFpyUlNPSFdxOWprNjBvRzY0cUxOLzhFWDhv?=
 =?utf-8?B?MEtKekFaOC9HZ3JVSlIzUzdMUVNpd3ladmxTTGkrSFRQMmRNSWk3ZTRML0ww?=
 =?utf-8?Q?aCdjYxwxivlit?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1VGN2ZNU0hpekhDUjdDbGZxa0ppV1VnK05xMFJELzl0S21qbWl6Uy92ckNr?=
 =?utf-8?B?eWozUFZBY2wxYnJ3ZzZrOE56WVRCNTRrNU54bWhrc3MzTGpOMUVFaWdqT0RS?=
 =?utf-8?B?ZmUvMDd0KzF3YTZrWC80UEJNTkcrdklxb2toVFBob2NZcVFMNk0zQjhWbUVy?=
 =?utf-8?B?aFBRVjNZbDIwdkhFVmxPZVNuU05wSUdWdi9PMnBlQlMzMlJOZkovV3Brb05h?=
 =?utf-8?B?cUNMZHJVblZSTDlDaWhVSmlpVXU0RXU5VlNXR284bDVqTXBCcFk5UnEwdSs2?=
 =?utf-8?B?Q1VUTnI2MXUxbHp0eXlFTnJGcnphcUpzcXU1eFE3aDBsZGxYbGNnRlBQSFdv?=
 =?utf-8?B?VnZ4K1BXNGtxVmZyM1crRnlsYVVqL2JJbEQwbDJoSGZ4RFRTU21xb0tBQU9h?=
 =?utf-8?B?WmtUOTdMZnE4cmJvMjlPK3ovZUVMYkl5WDdZeUxwQWlYRlUvdG5XY25RTGJ0?=
 =?utf-8?B?clhSaE9SU0prYTRZeE5BMEUyRS85RkUvRGFUbUZROHpFWTlEZllLUnJXTTRM?=
 =?utf-8?B?Tm12Ukp4eEdOQjJwanZycHpvdWI1cjFlRVlLc0xZeWFoWG50QjgzTTQ0U1ZI?=
 =?utf-8?B?Sit1aWRON2dtdDVOZ2M0dmNUanVqdnlpQVlPUzAxN3BCRFpQVXUxTWozUXhu?=
 =?utf-8?B?QmNYTXBEMHFZT3E5U0dBd3pZU0FnejZ6ZFhvSm1tWGpJR3laNVcwL0JKTGh3?=
 =?utf-8?B?Y3lLL0VCMmhXdTV0NXIwZ1JCenhyakJyc25HWmRnV1JWVVJnQk1YRWluY2Rq?=
 =?utf-8?B?dnV3emV0R3B5ejNWT0tkdEdoelpCNXpwdFhncEFPOUhRZmhJWkhQcUFWTitm?=
 =?utf-8?B?TjIzS3FDVkZybjUxVVduQ256REpYVy9aZEFWR3lmS0NJaTQwSXYxdlNUeTAr?=
 =?utf-8?B?WkwwT2d0Vno1K2pmYTZZKzJnRWRlQmhSQ1ZERUF2b2xqRVFCUmk1TjlHSEp6?=
 =?utf-8?B?Sks0VFhqZkd2dExHdnNLV0w1aEd4L21YT0JlYWtqYUFycCthaFQrL0Q1SDFi?=
 =?utf-8?B?RStJVVdmN2Y3MWp2SkVmWmx2T3QwSGhUc2pCcngvdGNIcEwxME1Lak9xVXVz?=
 =?utf-8?B?RDdxTUdWbXNySnE4emZrSEhjVFRHS2NydGhaaVNoQWxkNDczdC85NTg0U3Ur?=
 =?utf-8?B?VGlhaTl2SXJJVEVDVFl3UVlpSmt1VmppYkdJY1NHcGZBenNTd0NJSWllUjlx?=
 =?utf-8?B?ZTVMUjRIcWxIOVplSFJTR2owdmVsR1FmV0RtM2VLWEtBM2FHT1RuZlpqQ3c3?=
 =?utf-8?B?MEpNUW9XYVliMmxvTnN1eTBGMnN4b0FZK09LTktGcHRDR0NnQUtVYk5udTY2?=
 =?utf-8?B?VXhBejFRWk5Vam9jN0JZQWpMZCtERjJWVGswREQ4QXEvSGtscWplQjNmSTdu?=
 =?utf-8?B?YXNEUDZibEg1TDc5VnJsV2tmUjR6Z3FieWwxMFdrTDg2amZvc1hieXZUK1BT?=
 =?utf-8?B?dmI3aUlUUGRLTlFiSWRkWjZLTFRGVTEzMG00NjlRRW1VdElOZ25tU00vSXA2?=
 =?utf-8?B?dDVOSEZUNTFhS2FLK21xZXdtT25IK3pWVm5UcSt3UmpBdkgwd1pYSDJidWFi?=
 =?utf-8?B?NXYxSTZDenRCRE91WVEvNVo3Ynp1aXVOdGVlbVV0NkJFY0t2NWtPNTFmclFH?=
 =?utf-8?B?RkowRExoWVh5V2dQOG9yOHZtYmc3ZHREL2tzV3dvNFVFTy9PaSsweWVzVDZs?=
 =?utf-8?B?RW5zdXY4QmpaaENmWXBEb1BlLzhoTXlYbWtZTHFQZnNBVnV4UytqT0krYXZV?=
 =?utf-8?B?ckp0VWJQNTBrbXZnRHl5bkVyZ25kSWd5NzhjdnpyTjh2MlZrck5jTStERHZh?=
 =?utf-8?B?cFRjVTZPVkVSTFAyUEVHMFRySnF3dkV0QTFWdm15N1cxaDhkUHhvMVBiQjZP?=
 =?utf-8?B?TlgwMzY1QytnOEtUazhSQm43dlpsVnFjdW5QRnBuL0d4STBXWFNwRWZzUzBP?=
 =?utf-8?B?KzZwVHQ1WklOckROSXNKUStZWEVJQW1wNGJiT2o3c2N6cENKdWJEOWZzUnM3?=
 =?utf-8?B?NldkTUdxUnU0OVFTaEsyM2UrZit4OHdDVXRDNmtHbE0zV1pnaWFIanFhSThs?=
 =?utf-8?B?RjlnWGJtWlFxdzN5Z1JrL3Q1Y1c0MGZZeUF5cVlsaFlsVDB0Z2ZXcEc0UTN2?=
 =?utf-8?Q?ewTa2eA4QzxMeBnWEn47BTWSJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb49c4fd-acb3-40b9-a15b-08dd46078093
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:06:59.5461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTsURBIT/cjG9xRR81kWk9mJ6Bk3vqH0rAgPHdAjNRdPWmJbWQUe4FXcyXqQ5OsjLpi0pjFxxPZkNmbzNavyPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611

On Tue, Feb 04, 2025 at 04:26:20PM -0500, Yury Norov wrote:
> On Tue, Feb 04, 2025 at 05:13:16PM +0000, Yazen Ghannam wrote:
> > Cast inputs to 'long' to avoid the following 'type-limits' warning:
> >   warning: comparison of unsigned expression in ‘< 0’ is always false
> > 
> > The 'long' type can hold +/- 2G which far exceeds valid inputs for the
> > GENMASK helpers (current max use is 128 bits).
> > 
> > Idea is similar to implementation in __is_nonneg().
> > 
> > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > ---
> > Note to maintainers:
> > I found some previous discussions on this topic in the mailing list
> > archives. The upstream code has changed a bit since then, and this
> > proposed solution seems fairly simple when based on the latest code.
> > 
> > I figured I'd look at something outside my normal focus areas. I
> > apologize for the noise if this solution is too naive or incomplete.
> > 
> > Thanks!
> 
> Hi Yazen,
> 
> Wtype-limits is enabled in W=2 only, see scripts/Makefile.extrawarn.
> We normally shouldn't see this type of warnings even when compiling
> with W=1, at all. 
> 
> We have quite a lot callers in kernel already that do GENMASK(xxx, 0)
> 
>   yury:linux$ git grep GENMASK | grep 0\) | wc -l
>   13788
> 
> And nobody complained so far. 

Right, this is with W=2.

I focus mostly on x86 MCE, and I was doing some extra checking.

> 
> Still, I tried to compile a small userspace app that calls
> __GENMASK(10,0), and found no warnings with Wall, Wextra and
> Wtype-limits enabled.

The warning comes from the GENMASK_INPUT_CHECK(). Using __GENMASK()
would bypass this, correct?

> 
> Can you share more about your compiler, compilation command and config?

Compilers with warning:	GCC 13 and 14
Compilation command:	make W=2 arch/x86/kernel/cpu/mce/
Config:			make defconfig (on x86_64)

I don't see the same warnings with LLVM/clang. The '-Wextra' flag does
not include '-Wtype-limits' (at least on clang 18 and 19). But I still
don't see the same warning when I add it.

Maybe other options modulate the behavior? I'll do some more digging.

> 
> > ---
> >  include/linux/bits.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/bits.h b/include/linux/bits.h
> > index 61a75d3f294b..318346f2a5a6 100644
> > --- a/include/linux/bits.h
> > +++ b/include/linux/bits.h
> > @@ -21,7 +21,7 @@
> >  #if !defined(__ASSEMBLY__)
> >  #include <linux/build_bug.h>
> >  #include <linux/compiler.h>
> > -#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
> > +#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((long)(l) > (long)(h)))
> 
> This implies that GENMASK() is OK with signed input, so negative too.
> It's not true. For me typecasting to a signed type just to shut the
> compiler is a bad idea

The cast only affects the compile-time checker. Negative values would
still cause compilation errors in the __GENMASK() helpers. The same is
true for out-of-bound values like '64' for GENMASK_ULL(), etc.

Thanks,
Yazen
