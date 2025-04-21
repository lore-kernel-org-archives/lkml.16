Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC04263C78
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745234555; cv=fail; b=CYC+3uHPmNg62mhe2D3gQn3FgnijVYYBQ8VmwVAlJ+10b7nHqrf7Nl2tIDKq8JB90L9uPkQoSgwDAcc3FiLH0kJR8dErPO4zd/bTKx1N/lHGtsVyNGq3vhVbMbjFKbr8EJxiEIZgVV3E8jsmUW6aJX7Myf6C2JoKeUEcWB5bTHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745234555; c=relaxed/simple;
	bh=Fa2dipQQgOltBLMwrE1C55ZKlG6Hr+upMtduOdSTmCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=msgMtukO6oFukVMKfVRSZBDyeckGxQgG1SeKVwMWi1wQcG2XxIdE0Gk3Gwr56eNXKIbqzOdSC6u0BnrgEemZCr50q5HnSpL0tXYYZr4kXXBDyz1dK6U6UcqjjdHN5QG2MCz9Hq4XX/1HOTOkIYWz2afHrxvDmLqDaNaKDej7Qo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l6Fil27a; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TrWMOLFv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l6Fil27a";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TrWMOLFv"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L1C6qb020139;
	Mon, 21 Apr 2025 11:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=JXUp2fmmf9A2UPsgkItRsubWD26Nc5AXNxkvhv7cRxw=; b=
	l6Fil27atiFcRQMAIpYBcgpCzKFp5itsK7n5TBScWRL+LR7U4ThFbDhsJKqJ5CQB
	PN7eLMEiV6wnnYIDLSBQbILRmMSDMiXxX8cltgOJQaLp5nUPQhz5fx4wUAIyFdpz
	tkm6kXl/He6eoXClVuCzphO04bIRYdafuvQsBXMWp1piEt3nUAbi6mzdQ/kHyqvy
	Qky1hddH4Kadqxhc9LIx4npXwJxFm4q/5M0LNzU73K1cXI3SSsztt8aAL04J45S6
	S0008zA0preLod/kRW0JA0PXHaZeX8FBIdLHoZrc5YrjopPL5RSH+dSiajsLytbk
	qFilehxz1alGGHkDsYs6AA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4643q8t94v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 11:21:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53LB0Hda005913;
	Mon, 21 Apr 2025 11:21:46 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010002.outbound.protection.outlook.com [40.93.11.2])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 465deh4026-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 11:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUOg6JG/9tAsl+FXTubOtQbJxdZCK4wYUPmZEJ1kh0UbrRaJssUE730z7603+f7R/AmP1anBKxTt7bddw818zIf6vBx1w1vfjMR521Aa5N6zXj5/XjoGM503dQWwt5xJm2Ie9v9cIAJrwksV/2zYJL8aRL/RCicodagyG4nwSVZJL+/d0LUGcRwk8Yyb9mnjxv/swEfUIC/QC4+nLRbf/kqHsL27PNf3L7OXaG0n+KJz763VL1a+je3wUwm3CaYfMv2yRWOMt+XyNx4b/xezkkREx7sfsSyr7ESjNYtLPZn9Rws0do3wWh0ryc/dhy9F0rP2NVxPe33r5v5828lbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXUp2fmmf9A2UPsgkItRsubWD26Nc5AXNxkvhv7cRxw=;
 b=LG/esyh9jeDbnngkhnJ70mYuOfARoR30gU39SFsw8UlhMXxZ2sWodq9mJdii+N21o4CW+b8lVsuQkmnMhxm2rkzvZcHzznC3tON0FstEMe1BGIG53a5JY7BQ6Dse2gPXn289ZosU4C0kfSgw3PikK7VnL27z3Gd/NVVOf4SlSgNYKw03Xagw4ycCd/8aJxrrs0u29RBqSdbry61J9KsUZxaOBIwe6s3KeWOOjb2bG9lWlu7TyBxzJkSg8stZlz8GDmHqAwowwo7l5orYwh7XQPMp+Ho6lh3VOAdyQsReRLh+zr8xSDSFHMW/8Vm+6Ad3N9L4c/3S5mSnvaU52Oqjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXUp2fmmf9A2UPsgkItRsubWD26Nc5AXNxkvhv7cRxw=;
 b=TrWMOLFv8Wr+6AswbGmXTcJtMdD4GA5h5qiBSv5gib6oYHY5S8WCnLOhZh5iqKFKamaayqfBXj4P0nB6uqHZ5iKFwHLnUd5kEWtlgkFS/+/8ovTbTLxgAyeCwuxyO37RsYVz6ESpRAzgTKVXVGtd5Q5lZX1kf8xIT8ZxfRkh9Ds=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6804.namprd10.prod.outlook.com (2603:10b6:930:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 11:21:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 11:21:44 +0000
Date: Mon, 21 Apr 2025 12:21:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, nao.horiguchi@gmail.com, linmiaohe@huawei.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Liam.Howlett@oracle.com, david@redhat.com, harry.yoo@oracle.com,
        riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
Subject: Re: [PATCH v3] mm/rmap: rename page__anon_vma to anon_vma for
 consistency
Message-ID: <01c1cdb2-6b1e-4cb2-8ad8-31448ddb897e@lucifer.local>
References: <20250421015823.32009-1-ye.liu@linux.dev>
 <9b0bd289-40a8-4e4d-89e0-7eae922bd41a@lucifer.local>
 <1a52c747-3642-4f05-a662-c010240e9e4b@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a52c747-3642-4f05-a662-c010240e9e4b@linux.dev>
X-ClientProxiedBy: LO4P123CA0540.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 70cc9017-6472-4fee-1433-08dd80c6b2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YS9qcHJGRkVsdk5ybk9wbHdpdk44UU8xT0VQcWMwdVl3TjhqYkhrM0RFc3RG?=
 =?utf-8?B?VExVT3YxYVIxeXRveUI5Rm15T1k2Z3RKK0Y3blcvT0pFWVNEamNmME15ODZL?=
 =?utf-8?B?Z240VWxuYWtuTSs5STBaN1p4QXpraEZSekdZZEdockxUdDN6N0FXSE1WVWg2?=
 =?utf-8?B?OTArZm4rSUs2VXQ5cmZrbU1vWGVFT2YzeFFjTUFaU0JzQ2h3Zk9mWEVMN1l3?=
 =?utf-8?B?VU5RSlF4Y3VSaDJadHNybkRUVVRESnl4SGs0T0VndkRqUjk0Rlk4NTR6VmVP?=
 =?utf-8?B?cENHdjR3TlBScXphWkcwZjZVNDBPMDZwdkFoVHl2VUxSN1BsUzdrRTY5QmR0?=
 =?utf-8?B?Ym1Kb3RzRnJEWkpXSFNYL1NFT292Vm1nVmZlZmpubzhYQUVmaUNYU2VuR05F?=
 =?utf-8?B?cm9lVzkwTFVkcEN3N1V5Y21LQTluSkFuZ21IeTJqdVAvcWFjbmRrdnNDTkZZ?=
 =?utf-8?B?RU55WGxhQ3VCditTZ0xlS01XN0tXN1dSa0x1WDZHYzhrRDBuOXIxYUVKUmV0?=
 =?utf-8?B?M3YwWDV6ODJkOUpLYzlsNXBxNVBuVlI0UXZ3eE1tcThyVmQ0SzNRWm1vOVg1?=
 =?utf-8?B?Nkl3ZXZiY2VrUUNXSGt4UWxkeXpMUHpNVEhvbDQ1eVRFempvQmNIRkd3ekRq?=
 =?utf-8?B?ZTFvZUhadjBmbXlyOStrNnNZU0pRcC85eTNCRjRoRTJyK1ZZbjdxVSt0UGY5?=
 =?utf-8?B?QXVHZXJzcG1kU3JQYjhva2V6MGZrUENZWG1tWkhNV1VjRDZhQnRKQlN6WFZs?=
 =?utf-8?B?ekI1bHlCaUdBd1ZvQVIvZjQ4d1NXZGl0U3psanR2dTB5UlZmZGt2ZWNjRkgv?=
 =?utf-8?B?SkNUNzB4NDlENEwyNUVoQndpYXVxcEFMaFhlSnM2N0swTUtaNzVPOFAza2tR?=
 =?utf-8?B?MUFNV01Wcjc0SzJGRW9wazk2OEFReVlxR0I5Qis2S0I1QWN6aTZNWTZHSk5R?=
 =?utf-8?B?b0h0b1pMWlRsODJCQk9FV0pzMEo4aENlU1hhdEJrYmNHUEZnQU0rR0xOL3RD?=
 =?utf-8?B?RGZxeGRRVE1raVR5N1E5SGFlZzBTcGhNdFFnb1UwZ2hTVlkzdzhnd0NPaWFm?=
 =?utf-8?B?NWRqb1NkZmEyNWhYWUNDOXE2d0hwcllsc0s3NTRUNEkybUsyUHBiZVNPcEx5?=
 =?utf-8?B?dGZDOG1VMkNORHJKYTNPVFJKRUpMTHNzNWp4VU1wWWJxWGtpUVNJTFJXRnJO?=
 =?utf-8?B?UjdWeDlBcVdIaE95R1ViOUlycHdCZ3d1eW5oSTFLSFl4dXVjR0xNRXdQam10?=
 =?utf-8?B?Q2NPK3hTcmU0SlhiNXVWek5vU2FPQnhJRHJBaUR1dUJ1bHJBRFVYM0FYT2VE?=
 =?utf-8?B?aTJ0cXZYRnNTU0ttbnJCUWl6dnFxMkQ1ZGtubXN5WkhhSlNNcDRLVHFiZWJP?=
 =?utf-8?B?RU5UZEY3djcxTXF1Wm9LYzdhOHljOFJRRVUwcmdrTU1JNW1hTzBSVkVsMnlC?=
 =?utf-8?B?RlRpZkttc01nZHRRR0RCTnUvNk5tYzF0ek02YUhvR1Q1aDI2aEVIQXk5LzFy?=
 =?utf-8?B?SlZVeHBhQ2VuVDBhSFZGMTUycGZlMldEWkx5cG1sTGtPQzUxYThYVjdacytw?=
 =?utf-8?B?M3M4aklKOXNKUGoxdzUrSzBOS01lSWIrYi9TM05YYUtqQlBwQUtlYU5HN2xt?=
 =?utf-8?B?VE5uL29pZzlmY2dmbXdqNWdpenVGcStaZ0NyazF5UXBpdStaWU9kN3hHSHA2?=
 =?utf-8?B?aHdScGUvT01BQnJsajJ2Y3JJU2tuNVk1SmI2S0xmdnFSbEZ1SVUydzA3Q3Uz?=
 =?utf-8?B?OFRKS3VOY3ZsMlJ1L096bVpCMktDYTQzaENHMHBSVGxKaHZJZmIwM2Nndjgx?=
 =?utf-8?B?RDIwSUNJdmhHZSt6OE9HMlZPdWFrMjBQQlY3WGpuZmpSYVBBVzlUZ1E0V2pF?=
 =?utf-8?B?bmcrZDc4SXpSdk5KczVwNGJmbllMRzNqSXA1UVdIWTgzYjFLUTczOVkwUys4?=
 =?utf-8?Q?AqHwvt3HilM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckpESXBocDByUm96eE5XcHlmc0ZGcE84TmJweEs3TlFxUlgxTHdqTXlxdjdo?=
 =?utf-8?B?b2Q1bWVjV05YVUo0M3g1QlN1dEd2UE0wWW0xdG1ScmxOSjdod1IzQTgzb1E3?=
 =?utf-8?B?cS94MlZXZ2l5L2RRS1RTaS9zUi9JVE1RR3drRkhVUEwvVVAzYmo1NHZHQVY0?=
 =?utf-8?B?aDdjc3d2WVFpZUxoNWY1aytpS2lTVTQzb0Vqek9YZ1VhUFJPVngvRTViQ0FT?=
 =?utf-8?B?TzJYRnl1ZW5BeVR0VWNzb0NheU9DcFhtZ2dLdjVjcGQwMU1sUngxNUJ3UHJW?=
 =?utf-8?B?Uk9EZWhHK1k1RmgxbGJjK3NhWTNFZllTVktwUGtyelJMMHBkQnlWekIvZjFR?=
 =?utf-8?B?QjdsRisxbmN3VTEvdlVZMGN3aU9qNmkycmR0MVQ4RTMxUXI1RTBwVjlKejVs?=
 =?utf-8?B?ZnhDckZLVU5MMUpTVThRczJURnJpcWZwNEdDY3gzSWJCcTRCOUx1cUFYMnVo?=
 =?utf-8?B?bmFGNXBIcmcyTWxRL1hwNHNZenlzZG1YRmUwbWg0anIyR0VqQ3MzNkRXNHNx?=
 =?utf-8?B?YlpqWmY3SUVZaC9tV082Yzh4ZDgwUStSbklnUTZENFEza3lIK1FSRWxBbzNj?=
 =?utf-8?B?djdrWlFHMG1mNWkyUzNqdWcyMWVxbjViU3NqWmVmcERoTGJrVCtkU3k1S1RH?=
 =?utf-8?B?TGxFTVdneE5ac3JVUWFaSUZOSkhkcndTenBNR0cxSUJoR2ROMUdkLzd3aFBQ?=
 =?utf-8?B?czYrYzdTZ1FYVjkxbFlWeWJMWG0wN0JiTURIUVVHTmVYV0RKeHF3MDY2cXM2?=
 =?utf-8?B?QUxYdHVnQTdyT0duZGpXYlZUVnkrUnhhUHgrUVcveHRqblVtdE11bjdQYXcv?=
 =?utf-8?B?N1JSaGVDbW54Ry9IVmdVblU0SmtWRVdGUWpwZERWMjRubDZYVVM5ZWVSbkpn?=
 =?utf-8?B?a3BoZWhXVGRFYlp1R1gwSU83ZXBSVUUxOXJjWGNjeDdVdk5BN1ZNeHNGVmhv?=
 =?utf-8?B?dUR2K2svMmZJRkcraWJQZUExbUw3NWd4d1Fsc0F2Wm93MnBteWJWOHRndk9R?=
 =?utf-8?B?eTNhdVozdUlhUFFrMjJRSnA2UUJYcS9jNDBRU2U3SlFzQUNTL25ScW5NbVJz?=
 =?utf-8?B?NlNkV2Z6QUp2c2hsbGI4dEY2aGI5VmtjdmUzU2s0Snh0L1VLZ1cwc3RjSzJQ?=
 =?utf-8?B?ZHkxOXFpWC92ZUN0NGZRRGJ3R2NSZ2FQY3lpRFZpU0tXWnZNMlFKekpxOEow?=
 =?utf-8?B?SHd3anJReTFSak5UaFFnWU1rSEsveHROQ2l5Tmx2L2c1clh6eTJJUnI2U2dZ?=
 =?utf-8?B?dVRRWHZKSk1xcFRjQlJpQUEzeCt4WXNhSnRsdXkxTkR6dzhKRzM5c3ErOU9L?=
 =?utf-8?B?N0piaUxpd0VZYnhFMCsrTVhxYWNLaHVwQmFyb3QxYXVPNXpoeW1NcWZGVDJ2?=
 =?utf-8?B?VFNlWjQ2RHh6N2dwQ0tkalBIWDlNVzdZTS80bEovNWNzVDJrV3I0UDlOR0da?=
 =?utf-8?B?TkhXd1h0dEJuek5zT3ZlYjNHYmdURytHSzB4cFJBV1VlOVRQNFJxWVZkUWFB?=
 =?utf-8?B?eTZYMDQyLzZCSHNENXE1NXliNWxjV3FKenc0V1lTeTVLY0M4RUxieTJPU0Fx?=
 =?utf-8?B?RDllQUMrUGdpdk5uTHlTMk5BM1ROYzg2dkhmTGc3ZngzOENzN1JTMkNaRUxm?=
 =?utf-8?B?MisxSXZ0S2thZE1rSmpLTGs0TEZHbTU1ZjdCamtUWi9DbGNNSW5LTnRiNTNC?=
 =?utf-8?B?dERtRG9uTHZFemhQT1lDT0hrQ20xdTIxOXNMdUR3eTY0NTBERHpCcHJBNzRt?=
 =?utf-8?B?SE9GMjlXZ2p4RWFKWE1wUWFGbUJKRVE4VFN3aDh0MUk2QnIvWEl0N2UwVlkw?=
 =?utf-8?B?QTNRNDVBS0Y0R2RQaFNQNjZRU2RwSkRJa1BScG9zZzJPRmxXd3p4bXZjZ245?=
 =?utf-8?B?NDJkSW4xNitSRSt1NTlRdW1LRVNaR3dxY1kyeUhZd1VaQ0lFU1I3eFpya2FQ?=
 =?utf-8?B?b0c1TkhwUEhyd0FON3RzRlZVdVZGT1BSREpNZzF4eDJWOHFZQktwcTd2MVhw?=
 =?utf-8?B?anFaK1ZjSnBKekxYNkZVaFN1ajhyL29xN3EyL1V0bWpyYzg3RUZiUHVFYjJw?=
 =?utf-8?B?REd3Q0MzclFnMndRMmppb01kaGpuTDJTRlBMelR0QmtZM2kvclhlSEJLa2kw?=
 =?utf-8?B?VERiREdYSTJSRHdHNnJRRWRWOTFsNWsrV1ljYVI3S2lXVklOZkZSWktKOTIw?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NJKJJWWd6nMxSJ4T8WGUWqtsG8vqRX24QsUECk7yx715lmLXgQXAErs5nLNWbDno+cwMamqOP1DINV99XSaarWGB8WiF/Jvm+cmKcc3BJ5dJZZAMt9DWHsvuIO6mcH0uwSos896mfBmNpCXsnev9OQlSlfc6MuQfWYX9fKTRqtgHTto1JmhEvUnWuFaw2zqovsNTzt0uCOzkeHBArK5qpuEVKV87iFUNzzfoFITtSp1/EWZhmUbrNNeaUfDRfkE8oE9ipUTKEQaZ34PaM7IFKFt1oXbJO9Dxu3UbY8Oln9hoj3xJJMPubTAl5NI9FfUWjTArry5Emy5CuAESc0rDCfzLW3UyNuT0jhJ5LBbyoLKIoWqkLf3GWfK7ZK13LeHnvtZ7Asf5DXkkuenX47P5TWkPU7862S8eSpCB9eliLfxLwRo6nUTWPVGeIHT5nI8fjdMf9E+wGhaSvFDQQjEXP36GrGre+yHOfVhBYhKv05+AqAYlTeIEu8Vf2sozKZqJ+MzAr2QDJ9ZE/DS5nYjS2SAI3bbVEe0kJGL68YyOW30S+oDxlms9bLSCsA7VdSIz64AeDYF5LAgASKNxQOegbXN/PRqbKZFIJjPF2ikSkA4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cc9017-6472-4fee-1433-08dd80c6b2b4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 11:21:44.7868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NK7AGDfjg4GpEtNjM6viKcbmvCUlTGi/NcCM6F6c6rCTPLfA92R0ryYe/cW5+KOusKS/z3u/v6K6jdey9+vFGmVaWrN5RxSFvGFktp2EzpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6804
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504210088
X-Proofpoint-GUID: gFj_ebD-OFzPGW-d6UuD4qIqeFH6lQ4d
X-Proofpoint-ORIG-GUID: gFj_ebD-OFzPGW-d6UuD4qIqeFH6lQ4d

On Mon, Apr 21, 2025 at 05:11:22PM +0800, Ye Liu wrote:
>
> 在 2025/4/21 14:03, Lorenzo Stoakes 写道:
> > On Mon, Apr 21, 2025 at 09:58:23AM +0800, Ye Liu wrote:
> >> From: Ye Liu <liuye@kylinos.cn>
> >>
> >> Renamed local variable page__anon_vma in page_address_in_vma() to
> >> anon_vma. The previous naming convention of using double underscores
> >> (__) is unnecessary and inconsistent with typical kernel style, which uses
> >> single underscores to denote local variables. Also updated comments to
> >> reflect the new variable name.
> >>
> >> Functionality unchanged.
> >>
> >> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> > Hi Ye,
> >
> > I see you're still getting used to the process :) this patch isn't correct,
> > you're sending a single patch at v3 against a series with 2 patches in it
> > [0], but you have sent it entirely separately - this is not correct.
> >
> > If you want to revise a series, you have a couple choices - you can write a
> > 'fix patch' -in reply to- the patch you are altering, which provides the
> > delta against that patch.
> >
> > This is the preferred way in mm, unless you have made such a big change
> > that this is infeasible or if multiple files change at once or if so much
> > has changed it would be a bit silly to do this.
> >
> > To do this, you use a client like mutt/neomutt/whatever you use (but one
> > that can do the linux-y In-Reply-To stuff correctly) to reply directly to
> > the mail, and then say something like 'hey here's a fix patch please apply,
> > and add the output of the git format-patch that contains the delta against
> > the file at the end after a single line with '----8<----' on it.
> >
> > See [1] for an example.
> >
> > Here, however, you've confused matters a bit by sending this as a v3 when
> > it's not really a v3 properly, so I suggest in _this case_ you just resend
> > the whole thing as a v3 with this correction in place.
> >
> > You should also propagate tags, I gave a reviewed-by tag here, so make sure
> > to include this and others given when you resend the v3 series.
> >
> > Thanks!
> >
> > [0]: https://lore.kernel.org/all/20250418095600.721989-1-ye.liu@linux.dev/
> > [1]: https://lore.kernel.org/linux-mm/13426c71-d069-4407-9340-b227ff8b8736@lucifer.local/
> >
> >> Changes in v3:
> >> - Rename variable from page_anon_vma to anon_vma.
> > Also _please_ copy/paste all changes for all versions each time, and add
> > lore links for each prior version.
> >
> > You can figure out the lore link as https://lore.kernel.org/all/<message id
> > from mail headers>/ - I always do this manually :) you can see I already
> > figured it out for the v2 in [0] above.
>
> Thank you very much for your detailed feedback and guidance! I sincerely
> appreciate you taking the time to explain the correct workflow and the
> options for revising the patch series.
>
> I’ve taken your advice and resent the entire series as v3 with the
> following updates:
>
> - Incorporated the variable rename fix directly into the series.
> - Propagated all relevant tags (including your Reviewed-by).
> - Added complete version history with lore links for v1 and v2.
>
> Your patience and clear instructions are incredibly helpful as I learn
> the community’s processes. If there’s anything else that needs
> adjustment, please let me know.
>
> Thanks,
> Ye Liu

You're welcome :)

The resend LGTM!

>
> >> ---
> >>  mm/rmap.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/mm/rmap.c b/mm/rmap.c
> >> index 67bb273dfb80..447e5b57e44f 100644
> >> --- a/mm/rmap.c
> >> +++ b/mm/rmap.c
> >> @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
> >>  		const struct page *page, const struct vm_area_struct *vma)
> >>  {
> >>  	if (folio_test_anon(folio)) {
> >> -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
> >> +		struct anon_vma *anon_vma = folio_anon_vma(folio);
> >>  		/*
> >>  		 * Note: swapoff's unuse_vma() is more efficient with this
> >>  		 * check, and needs it to match anon_vma when KSM is active.
> >>  		 */
> >> -		if (!vma->anon_vma || !page__anon_vma ||
> >> -		    vma->anon_vma->root != page__anon_vma->root)
> >> +		if (!vma->anon_vma || !anon_vma ||
> >> +		    vma->anon_vma->root != anon_vma->root)
> >>  			return -EFAULT;
> >>  	} else if (!vma->vm_file) {
> >>  		return -EFAULT;
> >> @@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
> >>  		return -EFAULT;
> >>  	}
> >>
> >> -	/* KSM folios don't reach here because of the !page__anon_vma check */
> >> +	/* KSM folios don't reach here because of the !anon_vma check */
> >>  	return vma_address(vma, page_pgoff(folio, page), 1);
> >>  }
> >>
> >> --
> >> 2.25.1
> >>
