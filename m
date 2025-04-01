Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E461E7C03
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535516; cv=fail; b=kqxwdX4ChYahvaoozEg7PAdEyWCi5SZ0r0GR9+l/ji26oYZfd68ssSd5xc7g8JFToFCxmpyvMMNZB56VdeJ7VEZSYSlqBFyhpZ7Mmcner4FRXKNSDGXDcYu1tSneIrBldarFj9nfIhe1Yy68VYmHsYpxQ6tS9pRYAMMYDpVR/Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535516; c=relaxed/simple;
	bh=JJYlv+mdA1Yfn/QTQWwzsBJzeC7kfpG5VbDy6P+1hLM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z06Aa/65Nmb1dA1ZSHCP+B4S2YKYCuA+IZhfg3uoS0AtRbmzrteWqEa5SBlIa5LdCyrEWxLJGsHQ82KBEV5mypxumsBGlVurHQ0okmg4aLj4tkUN/B0inoX9NnL2XjLvY9Gdg/BkAh9TQBU1JZa3enbO4VSIA/QXDe6wb6YGFrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a9Fp/5v9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZFoHPsZQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a9Fp/5v9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZFoHPsZQ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531IJxkW030530;
	Tue, 1 Apr 2025 19:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YbXkIkQkCHFHUGCogOUYOTbL/mLLmL6UtvypCF1OteE=; b=
	a9Fp/5v9SG/7tT9Rp6+u0t1UJbaf5BnOPAe191nD0kNqmgct1fII0auzASF3TNrp
	RzwjfxB1FbK+eyhOL91mdi3fpmg/a7cbd1lFDv0oSml/4wgSNlVliI4BxFDI7VDz
	pbOugSVZjAz1/rTgTHrptvm6xiGK+h+G2U9OGqar/M3Mjewby8G2tV2qsLIqbhpe
	MziMgVe6/AasE/7BqNHmwmNfayz6gA1y/aCoaI4t2vSKeJzeF1Dx0leG6NDZTelq
	CLh+5qJ9dYIziHDSEE8YHJUd+ZCX9aj+5Hq1GNVrAs/OS9ACKM8ltjbvfUAKmTlU
	8avXdc4uABEmn7STUzj6Bg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7f0gxum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 19:24:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531Inaln016846;
	Tue, 1 Apr 2025 19:24:37 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a9nq28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 19:24:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqnZjBKesYQz2isf09QBMvIH8Scg4gypEmBDLOZPP4tAoJJs3KkVr6KGh3Pg+CVPvWbEy02928n7GM54jNn+DJ0EgGH52w0abAq2vemlGFSHlI+knG9rh+5wXDMLFF31pN2USZTRkueG9DHvu1DvB0w8GQ+TO69v8YKNeAzzYPFebS9/pHiy/E3QeGjxW6EKgzJWKXFUHocWFKexaa5IEJfW2CBZU0KnHE9DmNM2ytdfFtw0fxiWswaN198F3RAv6pyhFWktjLlimsQlZS5U260PMNdziVyE+bLUB05myoiO3Jua8heErytQKhlNHUA+iDlTgq6wZFsAgJwjUr3L+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbXkIkQkCHFHUGCogOUYOTbL/mLLmL6UtvypCF1OteE=;
 b=n4vb67Cv8AnUpncYsjeYtPGfykd8v0oQNXQ49j5B/pjrmmglxYkRyY2i4Gi6LwpXyeccnHw5qK0932p0KuWmFUklPBWoW9FEcq7O66crAA6AXP8sBtBC1qXQ2OXvEthpb0qwvOg03LT93+mKe5Tcw4OiBAwezULWyoXg9ctSIcCfEOuH559X9KZYbuZ/ctYHz72rvk/SMftcTFPHh7FZh57M2xoc5ULsuo6V6KDGiWd0CSHWnL19/kgs681f+7daMrAs7GI4ZUUgcKWEa4bBQHAj15cefATlfCMing9IbZYEf/3iOX7L3z2KNbXMNy/WAEcR+mNyQXUNPjJy2JOmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbXkIkQkCHFHUGCogOUYOTbL/mLLmL6UtvypCF1OteE=;
 b=ZFoHPsZQ3GvN8CFw0urao5ZBeqKgf00NcJEaFIodmSpaRR9C8/iY+revw6rHdsR+J3o0YmiP/4ALf1xrBLCr1l03sDArT9aAv7php5S+DQXs/ffX3nE5pEFSM6cBbRNOGeOk69nddO5fydZtj2rNwzk7EiR5449iNYPngTkg2wk=
Received: from MW5PR10MB5738.namprd10.prod.outlook.com (2603:10b6:303:19b::14)
 by CH0PR10MB7499.namprd10.prod.outlook.com (2603:10b6:610:182::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Tue, 1 Apr
 2025 19:24:35 +0000
Received: from MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::187b:b241:398b:50eb]) by MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::187b:b241:398b:50eb%6]) with mapi id 15.20.8583.033; Tue, 1 Apr 2025
 19:24:34 +0000
Message-ID: <bce70e74-2963-4d90-9c42-04a0247da94e@oracle.com>
Date: Tue, 1 Apr 2025 14:24:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: General Protection Fault / KASAN: null-ptr-deref in jfs_ioc_trim
From: Dave Kleikamp <dave.kleikamp@oracle.com>
To: Dylan Wolff <wolffd@comp.nus.edu.sg>, Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        Jiacheng Xu <stitch@zju.edu.cn>
References: <CAJeEPu++aAiF=ybq+XHEdGad+RsxR8d=tmEe5LxCOnDjWY_OFg@mail.gmail.com>
 <CAJeEPu+0EttQaFYKhGUbn2j=_nLvT-wfdBS0wQjXDkBq962g6g@mail.gmail.com>
 <8548e6ad-c21d-481c-b9c5-bd0403ee26c1@oracle.com>
 <CAJeEPu+AgjJD--boaj79Hp-QKskOm2AMqVwor_k+cwqUg_X2BA@mail.gmail.com>
 <CAJeEPuJt6nhTQM7S=1A==C+5w04R2bWHAYiHgpve-AcL-1u98Q@mail.gmail.com>
 <160fdd56-d7d2-460c-a142-fa2c8434385c@oracle.com>
Content-Language: en-US
In-Reply-To: <160fdd56-d7d2-460c-a142-fa2c8434385c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:610:77::30) To MW5PR10MB5738.namprd10.prod.outlook.com
 (2603:10b6:303:19b::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5738:EE_|CH0PR10MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a2a0ba-f04a-4c41-6096-08dd7152d5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlZqbjVnYURnQnZ5ZG02UFZ3RGh6ZGUxd3ZVSEp6RTlWaFFIZXk0SmgwQmgr?=
 =?utf-8?B?VmNNY01iSzlYcXVGQ1RKQ05uN0ZVRlpVNWtUcUhhS3FqNVRtMWh0RUQ4Tndq?=
 =?utf-8?B?WW96ZVJ6V0UwMTcyMm9uRVJzMDc4Y2lydDMrNldraHlCUkUwSlJMQi80TlpM?=
 =?utf-8?B?MFZRMEJtM0x0SE5hUk8rc1pXQjNtWmd3azlGRTBnUjdxR0RUbWdZWSs5MFBR?=
 =?utf-8?B?Tkx0eTZDK21GZVVqbDhLRHkxLzJtMm1JaGFEWGlBQWlxRndwZStiNkovZnZy?=
 =?utf-8?B?ZHNwcGNrNHBxeWZlbXI1QnM4K0N6UEQrSDZNOENScGMrS0M3U3ltNzRTdldo?=
 =?utf-8?B?S29mY21sdCsxWjh3eFRka0x0em9ZaW92dkJVUGtpQU5udjZBNDk4c0RnMWRG?=
 =?utf-8?B?alhHdTQ5cGZoQWczVDZMQlI3MjRsTXRZVWlBVmNmUEVSamtLa3Znc25Ha3RR?=
 =?utf-8?B?bEJudmNIY2NQckZyS0x0SVgvdCtaMlcyL1lqdVlyYnNlQVBoTncwV0FqUGhB?=
 =?utf-8?B?c25vV1YrS3RGUGFTSHBzdjUxajFoUHR6MDRCNmtZSEZzekduM1dMWFUxcS9N?=
 =?utf-8?B?ZEtPZ2s0Q3p6Lzh3SElydzVGMk5jdjFBd0plVmYxR3FubklraXROSFl4UlFx?=
 =?utf-8?B?bGswQkZ2dUZaT1VxbUMvU2lqUHBoY0ljOUY4YjNuWmFJZ0xBbGdjS2I5TmdC?=
 =?utf-8?B?dzc1RXpKd3E0dGtTTDNhaHdxKytHNWJyRklUTkZscUxGUFYxOXFVSWxzalV6?=
 =?utf-8?B?NExUYVE2NUlibFl5NzRXSmhjM090d084UGJObVRKVGhpTjVwWkp3TGY1ejZV?=
 =?utf-8?B?UVpxQ1BwYkRIbWVvbkxWZmN6V1RTV2poa01xMHVoQTNCYmU2NENqRXRpMUtY?=
 =?utf-8?B?elZRdjNqdnZQN3JtdVQ3a2g2SzJXQmhxd0ZkUnAzOFBXNHo3bzhCRitlYmk0?=
 =?utf-8?B?Z0FQaHJpWGRuT29TalNNcDk0c3lMK0RnNlVHRHJqSU14TncvdWJuTzUyM2Mz?=
 =?utf-8?B?K2d3YTVHR0NqUEF3aHlFdUwxUkpEbWp4aFpRTGVzNGJHZ2w1eEhjVzV1dTk3?=
 =?utf-8?B?N1l4TlZDaWhNbXBhK3BZc3VxdXN4QWpnQTd0eFRMNkNFdC94Ui9mU0RVN1ll?=
 =?utf-8?B?NFJwem5EVE9keXFtOTZwZFFCdURGY0hwa1ZSdmNWVk9QaDErZjFMVTlYTFdM?=
 =?utf-8?B?UDdMTHoraG8ralVMNHFFVlhmemNrT0VyNURIdFpma3VuUGNWd1NCODdVR0Rm?=
 =?utf-8?B?TFVSdkYyY29YSFQwVW9wTklHZDZpUmdNWXlMKzg5QVhZNTBEVy8wVURZby9j?=
 =?utf-8?B?Q0JJbnNmZGRFd0diamNEUU4yMHpqaUlRdjZXdGlGdzlKam9oQUk3Rjg2K1pu?=
 =?utf-8?B?YU8vR0t0WFRURm5sbktvUnRMVUJVYnYyOU9TY21wVXZUTFJZcnZjd1dtaVZv?=
 =?utf-8?B?ckFIdHFqZTZUdWhWY3hyU01iMVE5Vy9UdDRHa3RTK0MrSUYrbHd4aDJUdTRu?=
 =?utf-8?B?ay9xY1Mzemp3MmRzMWxyVUpiRGk5SlNxRHJ5NWpyeC92cTlnNnM2WktodWtr?=
 =?utf-8?B?bkdDN0ZHSmNUTmJRVEVSRklkOENNdkRLSW9ZY2dNZit1UklhNUtMaTVRTUdY?=
 =?utf-8?B?L3BnSkFyTlRzK1BSdFZ4cm1KVjFxTUw1cVF1TmlrTWlPSjVaTDVOU1VGSGl3?=
 =?utf-8?B?TnVRM0ZaQlY4NmhaL3kwRDZSRUNaTG9Vc0RiOWJucVhxNXhBKzlZN0lISFRQ?=
 =?utf-8?B?bDZkeVNVRlQ4SUNVeUdrLytZSDRCTHcwMWtVZFVOd2tqOUFVVzFBRmE1S3Yy?=
 =?utf-8?B?VlhnTUNxaFYybTc5aXRPUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5738.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3d4VTk3OThTbmQ2YnoveFBkRDBXRHJreVFyUVc5bXJkOC9BMThFWDhlb3Nh?=
 =?utf-8?B?UjBwMmRqTFVWUW0rNmdJWHIvN3R3WG1RazlJUDZhekJDTkJTRHhrKzdTU3Qy?=
 =?utf-8?B?Yk9jMldtMDFoREpUWkVoUnpqcjIxU3FrNVU0Y2pVZEd0S2ZLR0ZIdUg1VzVQ?=
 =?utf-8?B?Ri9wMG5sWG1sOGp3Ymw1S1FON3R2SmNMN1loTVN1bkhaaGMraXUrV0pVY1kw?=
 =?utf-8?B?a1pRbDMrR2NlVmJPZzRYa0dJZnRYVFlnZk9ueUlYTEMvcXBSVEI4OFVVSS9s?=
 =?utf-8?B?MGwxZzN2VlJoM2MxeXM2MEdnbGllL2FJQXhkU1o1Rm56YTRiYVNtSnZLUU1o?=
 =?utf-8?B?MTFUakwvQlZ3Y3FreGZGdWpOUnowYjF5SUVnSWl5bUhYSlJJRDN5dTkrZGgw?=
 =?utf-8?B?QjdUeEJwRFNqVDAwOEppTUxYckNmM21vbkNDVmFNUWJ3bUFVZFdhZWNEcFRH?=
 =?utf-8?B?Mnpqc0gxRWNEaU1YQ1VlUitDTHY0bDlFTCs4R0R5dVVhMCsyd1dnQ2gyYk9z?=
 =?utf-8?B?UWpSNitkWW1sKzJSbFdFdkZGRjNlbDVuMHlvVkVwTjN1RnJ2bjcyUDFxVWVP?=
 =?utf-8?B?WC9GZXJFTWNlMGszVFFxaGlaOE9kTGxITVRUZU8rSncwUUZ2QWxTdnpvNzM2?=
 =?utf-8?B?TW85VGFMWE10S2RqcSsvQ1pSMU02UDJnV0dqbkpYMnFLaThtUG5uTFI5RzBj?=
 =?utf-8?B?aEVOcFFtdmRsWmpVSHZzR2M0aU5HV1I5a2ZZNXppdTNSWHg4c2M4dGw4UE1q?=
 =?utf-8?B?V0NsdlFxeVBCR2F3WTM0M3gxK1ppQXZOTTIrOFYyTzFObFdIakNVVTJYaEJS?=
 =?utf-8?B?TUpGOHFwM25sMys4dVBNbDN6MVVDUS9FR0dIZVo0TlNscWRZWUNvUTlIRi9n?=
 =?utf-8?B?Q0JvVGV4SEdXLzVlTFViZE13K0RtQkptM2lCR2MzMXdMWGZUMnV2UEtKYU9p?=
 =?utf-8?B?VnlnS3dLbmlCYUowWlNOcEg0V3RWSldJWTVvbmtjdzduVGo4Q1BWYkNacnJI?=
 =?utf-8?B?dVZYSWNWdVAxaVl2QWZYc3o5WVpTQ0VVK3NEWjlnT1F2aklDRGxaWW80V2V2?=
 =?utf-8?B?UGh0VXdXU1huUGUxMWVuVms3M0lteHAvVlBSWXROTTJlWllWWThZQjY4OVAz?=
 =?utf-8?B?K0JCdVZUeC9lR25HaGF0cWp4cU10emVhNlVtVWcrc293ZzNIWU1CSHhxSTQx?=
 =?utf-8?B?Z090TTUvOUE1REpIVUdqYVVlUVdEZjlyWXkxMFJuV3lldWFrL0srUzdFaGpj?=
 =?utf-8?B?ZHlPK3A5eXR0cVRpZkZ2T0hlanQzSmYyRnJLZ1MyaVNySnFxTUZKSTRuTUwz?=
 =?utf-8?B?QkJUd3lydlNqQVlHb0JhV1REOVE0US9SK0tFSDZWMjhYTXkzbjR0bzN6R0xZ?=
 =?utf-8?B?ZXQrczVqYzNBZVFVNGJ3QU9mczBGTU9taFVNejhMMSttVW9kWkRVQ3RiWTFp?=
 =?utf-8?B?TFltY2dYeTJsS01zcHdJRDNmaEw1eEt1NjRTNXZ6SFBqNERFbUsrSXJFaXRm?=
 =?utf-8?B?cXRwOTJUMEMvU3hibTNPUGRPMkJEMmFwRWdiVlhlbmg0dkkxamJYZlIxdVFL?=
 =?utf-8?B?UGdvejdmZFJtaUJMU2dSVXJsYzUxRG01UFJKOEZTeDNPTVVWaThsaFlmWDZB?=
 =?utf-8?B?Y0hmZWJYLzZtR1g5NEQ0b081dnpjUWNxaDFjNVRmLzNvT05LN0FGclYxR0hw?=
 =?utf-8?B?VE9ZeXM0encveW0wNUhFYzI1YkpFRm5LcXM0MTZMZ0hqNEhoWmV1RUhaMTU2?=
 =?utf-8?B?T3RvME9hcUJ1MkxUS0JBQ1BGRmJzN2NzaUFrbTE3NUIrNHpqazJGT0FSV3FN?=
 =?utf-8?B?dlVBMFh0MDJuT2cvVEJXNXRmVms0dGlZU2c2Wm94VFlNYXF0U2JMMTNvWitY?=
 =?utf-8?B?WWJYdHRtY0ZyMmVPT0R4S25DNEgvWkxMZENqRnVEZmtaK3oySUtvNUNBaTVk?=
 =?utf-8?B?Yk83cFRpdkIxd1FvTlU5V28xVUgrYmd0REIyUEVyT3NUQ29ET3JjekhBMWdL?=
 =?utf-8?B?QWhSQ0RHcDdyS1phdUJXTEZPTDlNTXFBQjdFMmU5c2RMMnp5TG0vUVZTakdB?=
 =?utf-8?B?RnlMOUNUVVI5L2ZnSFFJUFdJY21UUVRFNSsxOUJuUld2WEVLN1c2cWdGL2hh?=
 =?utf-8?B?NkRRbkE5KzhqSHlrS3Q1bko2Z1JLb2VkbkxKVGMzWUtmeGZ2TzhGQ1hXOHFh?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y/028sdWOnNmsYORq5U2+0pvKl1dHFEc3lBk0H+bYdsnl1p5zoDW6fBsFr14WtZoHnwHRyKwTUdSbdajiGst3Xx8DLLsLljSKo7llJ4Wrb8W67chH7hIce5FXHE9czu7sTo9nU8qiQBlcEcyTmaIORYtUfDJ1/1ocvZk+cptPO3pYI22x8mkCpzAWyO2tbpyqm7TT9QGTP76PwHgBZmMJQXfEeBzYNBuUqwYy+VpUc2ibYNXvBrO83XApNZjiPTlHy/4mO83waUAcF0wJRUtOhqG7kYw3NPsGBpLr4sH93mJy+9XGmMFFqx2gp6ooXHpkLj+BdFQPgSiASiT5EWDgZiT5bofp08D/4DuYD20wQfn+8ymfTEekkEw+W6RwexCcA816mC9XkQyB+F1aeQCAOvCbXa2Rc9PMH71m6qIBlmGZBeR6hgr00X2ex9/UJJCK/JUiFFDiGC38QKdh3NgfgPLVnAWt4wcFhNvV+Xh8LSgU3IkIydzJR3706mQR1KnTm/F2RNequDnt7HRazbw59DAItKgSbPO16YYXo3vLeR9cilJmQy8lwIZP7OUKfgxsIzEIbwsupELrCKCZLO7ISlFz3zde+MuA9O+BF9krgU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a2a0ba-f04a-4c41-6096-08dd7152d5e0
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5738.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:24:34.7423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qzw6hxGfp9sH5AT+pAmD1UTTjkCN7hBEAj7100WeogUA3utfxL2WTnDtDd6gCLCOMwfTK4UsUf/1HFeMPQf9nARjxNfxK5UYstjufublOVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7499
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_08,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504010119
X-Proofpoint-ORIG-GUID: Gnz6VA7fhv4zSYQdfwqR7773Z49egiQa
X-Proofpoint-GUID: Gnz6VA7fhv4zSYQdfwqR7773Z49egiQa

On 3/26/25 8:36AM, Dave Kleikamp wrote:
> On 3/25/25 9:23PM, Dylan Wolff wrote:
>> Hey Shaggy,
>>
>> Just following up -- is there anything else you need from me on this?
> 
> No. I've just gotten behind. I'll try to take care of this shortly.

Just an update. The patch looks good to me. I'll run it through some 
testing and push it.

Thanks!

Shaggy

> 
>>
>> Best,
>> Dylan
>>
>> On Wed, Mar 12, 2025 at 4:02 PM Dylan Wolff <wolffd@comp.nus.edu.sg 
>> <mailto:wolffd@comp.nus.edu.sg>> wrote:
>>
>>     Thanks Shaggy!
>>
>>     I've included a summary with sign-off below. Let me know if I am
>>     missing anything else!
>>
>>     Also, we aren't sure if there are security implications for this
>>     issue. Is it possible that induced load could result in Denial of
>>     Service? Could you comment on whether we should initiate the process
>>     for a CVE?
> 
> I don't think a CVE is necessary. If anyone uses JFS in a critical 
> environment, it's news to me.
> 
> Shaggy
> 
>>
>>     Thanks!
>>     Dylan
>>
>>     ```
>>     [ Syzkaller Report ]
>>
>>     Oops: general protection fault, probably for non-canonical address
>>     0xdffffc0000000087: 0000 [#1
>>     KASAN: null-ptr-deref in range 
>> [0x0000000000000438-0x000000000000043f]
>>     CPU: 2 UID: 0 PID: 10614 Comm: syz-executor.0 Not tainted
>>     6.13.0-rc6-gfbfd64d25c7a-dirty #1
>>     Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1
>>     04/01/2014
>>     Sched_ext: serialise (enabled+all), task: runnable_at=-30ms
>>     RIP: 0010:jfs_ioc_trim+0x34b/0x8f0
>>     Code: e7 e8 59 a4 87 fe 4d 8b 24 24 4d 8d bc 24 38 04 00 00 48 8d 93
>>     90 82 fe ff 4c 89 ff 31 f6
>>     RSP: 0018:ffffc900055f7cd0 EFLAGS: 00010206
>>     RAX: 0000000000000087 RBX: 00005866a9e67ff8 RCX: 000000000000000a
>>     RDX: 0000000000000001 RSI: 0000000000000004 RDI: 0000000000000001
>>     RBP: dffffc0000000000 R08: ffff88807c180003 R09: 1ffff1100f830000
>>     R10: dffffc0000000000 R11: ffffed100f830001 R12: 0000000000000000
>>     R13: 0000000000000000 R14: 0000000000000001 R15: 0000000000000438
>>     FS:  00007fe520225640(0000) GS:ffff8880b7e80000(0000)
>>     knlGS:0000000000000000
>>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>     CR2: 00005593c91b2c88 CR3: 000000014927c000 CR4: 00000000000006f0
>>     DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>     DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>     Call Trace:
>>     <TASK>
>>     ? __die_body+0x61/0xb0
>>     ? die_addr+0xb1/0xe0
>>     ? exc_general_protection+0x333/0x510
>>     ? asm_exc_general_protection+0x26/0x30
>>     ? jfs_ioc_trim+0x34b/0x8f0
>>     jfs_ioctl+0x3c8/0x4f0
>>     ? __pfx_jfs_ioctl+0x10/0x10
>>     ? __pfx_jfs_ioctl+0x10/0x10
>>     __se_sys_ioctl+0x269/0x350
>>     ? __pfx___se_sys_ioctl+0x10/0x10
>>     ? do_syscall_64+0xfb/0x210
>>     do_syscall_64+0xee/0x210
>>     ? syscall_exit_to_user_mode+0x1e0/0x330
>>     entry_SYSCALL_64_after_hwframe+0x77/0x7f
>>     RIP: 0033:0x7fe51f4903ad
>>     Code: c3 e8 a7 2b 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48
>>     89 f7 48 89 d6 48 89 ca 4d
>>     RSP: 002b:00007fe5202250c8 EFLAGS: 00000246 ORIG_RAX: 
>> 0000000000000010
>>     RAX: ffffffffffffffda RBX: 00007fe51f5cbf80 RCX: 00007fe51f4903ad
>>     RDX: 0000000020000680 RSI: 00000000c0185879 RDI: 0000000000000005
>>     RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>>     R10: 0000000000000000 R11: 0000000000000246 R12: 00007fe520225640
>>     R13: 000000000000000e R14: 00007fe51f44fca0 R15: 00007fe52021d000
>>     </TASK>
>>     Modules linked in:
>>     ---[ end trace 0000000000000000 ]---
>>     RIP: 0010:jfs_ioc_trim+0x34b/0x8f0
>>     Code: e7 e8 59 a4 87 fe 4d 8b 24 24 4d 8d bc 24 38 04 00 00 48 8d 93
>>     90 82 fe ff 4c 89 ff 31 f6
>>     RSP: 0018:ffffc900055f7cd0 EFLAGS: 00010206
>>     RAX: 0000000000000087 RBX: 00005866a9e67ff8 RCX: 000000000000000a
>>     RDX: 0000000000000001 RSI: 0000000000000004 RDI: 0000000000000001
>>     RBP: dffffc0000000000 R08: ffff88807c180003 R09: 1ffff1100f830000
>>     R10: dffffc0000000000 R11: ffffed100f830001 R12: 0000000000000000
>>     R13: 0000000000000000 R14: 0000000000000001 R15: 0000000000000438
>>     FS:  00007fe520225640(0000) GS:ffff8880b7e80000(0000)
>>     knlGS:0000000000000000
>>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>     CR2: 00005593c91b2c88 CR3: 000000014927c000 CR4: 00000000000006f0
>>     DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>     DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>     Kernel panic - not syncing: Fatal exception
>>
>>     [ Analysis ]
>>
>>     We believe that we have found a concurrency bug in the `fs/jfs` 
>> module
>>     that results in a null pointer dereference. There is a closely 
>> related
>>     issue which has been fixed:
>>
>>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>     commit/?id=d6c1b3599b2feb5c7291f5ac3a36e5fa7cedb234 <https://
>>     git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?
>>     id=d6c1b3599b2feb5c7291f5ac3a36e5fa7cedb234>
>>
>>     ... but, unfortunately, the accepted patch appears to still be
>>     susceptible to a null pointer dereference under some interleavings.
>>
>>     To trigger the bug, we think that `JFS_SBI(ipbmap->i_sb)->bmap` is 
>> set
>>     to NULL in `dbFreeBits` and then dereferenced in `jfs_ioc_trim`. This
>>     bug manifests quite rarely under normal circumstances, but is
>>     triggereable from a syz-program.
>>
>>     Reported-and-tested-by: Dylan J. Wolff<wolffd@comp.nus.edu.sg
>>     <mailto:wolffd@comp.nus.edu.sg>>
>>     Reported-and-tested-by: Jiacheng Xu <stitch@zju.edu.cn
>>     <mailto:stitch@zju.edu.cn>>
>>     Signed-off-by: Dylan J. Wolff<wolffd@comp.nus.edu.sg
>>     <mailto:wolffd@comp.nus.edu.sg>>
>>     Signed-off-by: Jiacheng Xu <stitch@zju.edu.cn
>>     <mailto:stitch@zju.edu.cn>>
>>     ---
>>       fs/jfs/jfs_discard.c | 3 ++-
>>       1 file changed, 2 insertions(+), 1 deletions(-)
>>
>>     diff --git a/fs/jfs/jfs_discard.c b/fs/jfs/jfs_discard.c
>>     index 5f4b30503..4b660296c 100644
>>     --- a/fs/jfs/jfs_discard.c
>>     +++ b/fs/jfs/jfs_discard.c
>>     @@ -86,7 +86,8 @@ int jfs_ioc_trim(struct inode *ip, struct
>>     fstrim_range *range)
>>              down_read(&sb->s_umount);
>>              bmp = JFS_SBI(ip->i_sb)->bmap;
>>
>>     -       if (minlen > bmp->db_agsize ||
>>     +       if (bmp == NULL ||
>>     +           minlen > bmp->db_agsize ||
>>                  start >= bmp->db_mapsize ||
>>                  range->len < sb->s_blocksize) {
>>                      up_read(&sb->s_umount);
>>     ```
>>
>>
>>     On Tue, Mar 11, 2025 at 11:48 PM Dave Kleikamp
>>     <dave.kleikamp@oracle.com <mailto:dave.kleikamp@oracle.com>> wrote:
>>      >
>>      > On 3/11/25 1:47AM, Dylan Wolff wrote:
>>      >
>>      > Hi all,
>>      >
>>      > Just checking in on this report. Is there another email list I
>>     should be using for this issue? Can anyone confirm whether or not
>>     our fix is acceptable?
>>      >
>>      > This is the right list. Somehow I missed this one and/or forgot 
>> it.
>>      >
>>      > The patch looks good to me. Can you re-send it with a Signed-off-
>>     by: ?
>>      >
>>      > Thank you!
>>      >
>>      > Shaggy
>>      >
>>      >
>>      > Thanks again!
>>      > Dylan
>>      >
>>      > On Tue, Jan 7, 2025 at 4:53 PM Dylan Wolff
>>     <wolffd@comp.nus.edu.sg <mailto:wolffd@comp.nus.edu.sg>> wrote:
>>      >>
>>      >> Hello kernel developers!
>>      >>
>>      >> We believe that we have found a concurrency bug in the `fs/jfs`
>>     module that results in a null pointer dereference. There is a
>>     closely related issue which has been fixed:
>>      >>
>>      >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
>>     linux.git/commit/?id=d6c1b3599b2feb5c7291f5ac3a36e5fa7cedb234
>>     <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>     commit/?id=d6c1b3599b2feb5c7291f5ac3a36e5fa7cedb234>
>>      >>
>>      >> ... but, unfortunately, the accepted patch appears to still be
>>     susceptible to a null pointer dereference under some interleavings.
>>      >>
>>      >> To trigger the bug, we think that `JFS_SBI(ipbmap->i_sb)->bmap`
>>     is set to NULL in `dbFreeBits` and then dereferenced in
>>     `jfs_ioc_trim`. This bug manifests quite rarely under normal
>>     circumstances, but is triggereable with the attached syz program.
>>     We've also attached a trace of an execution that leads to the crash
>>     (thread id:location). If needed, we can share our setup in detail
>>     which reproduces the bug with very high probability.
>>      >>
>>      >> Here's a proposed patch:
>>      >>
>>      >> ```
>>      >> diff --git a/fs/jfs/jfs_discard.c b/fs/jfs/jfs_discard.c
>>      >> index 5f4b30503..4b660296c 100644
>>      >> --- a/fs/jfs/jfs_discard.c
>>      >> +++ b/fs/jfs/jfs_discard.c
>>      >> @@ -86,7 +86,8 @@ int jfs_ioc_trim(struct inode *ip, struct
>>     fstrim_range *range)
>>      >>         down_read(&sb->s_umount);
>>      >>         bmp = JFS_SBI(ip->i_sb)->bmap;
>>      >>
>>      >> -       if (minlen > bmp->db_agsize ||
>>      >> +       if (bmp == NULL ||
>>      >> +           minlen > bmp->db_agsize ||
>>      >>             start >= bmp->db_mapsize ||
>>      >>             range->len < sb->s_blocksize) {
>>      >>                 up_read(&sb->s_umount);
>>      >> ```
>>      >>
>>      >> Applying this patch to our kernel locally appears to resolve the
>>     issue.
>>      >>
>>      >> If this looks like it might be a security vulnerability, please
>>     let us know if there is anything we need to provide for the CVE 
>> process.
>>      >>
>>      >> We would also appreciate attribution for the discovery / fix if
>>     applicable:
>>      >> >Reported-by: Jiacheng Xu<stitch@zju.edu.cn
>>     <mailto:stitch@zju.edu.cn>>,  Dylan Wolff <wolffd@comp.nus.edu.sg
>>     <mailto:wolffd@comp.nus.edu.sg>>
>>      >>
>>      >> Environment:
>>      >>      Qemu (invocation attached) running a Syzkaller image on an
>>     Ubuntu 22.04.4 LTS host
>>      >> Kernel:
>>      >>      HEAD commit: fbfd64d25
>>      >>      tree: upstream
>>      >>      compiler toolchain: clang-17
>>      >>
>>      >> Thanks!
>>      >> Dylan
>>      >>
>>
> 

