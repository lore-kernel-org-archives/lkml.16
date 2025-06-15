Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113561AF4D5;
	Sun, 15 Jun 2025 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750014378; cv=fail; b=WcqWd8oppzMN4xIU96QzjhICK81OfK1Vn4x5VbNSnjpC3bSMRD4VeuijPtsBf63+n6Hqh7x6U1i5aLtEwas9Wo5ELk6J76QpT7WvKBISotpcSjffszqQKOg1GGykpmYffTyUcIVC4qk939sosm9+xOZRIydzqlTBORXCRIu74B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750014378; c=relaxed/simple;
	bh=8J9oisQLaE6nBbAEp/w5mxUTKTrq0R7PWqQGBXtM61M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NfMkEwNoOAYNwF7veBCbcDzbKAceI7a7Cu0gpUwuu76t6By+xd8n/X5h+oTo8ucraHzUg6Jrgi/FcxsEhKCJRSil7POb97Cq1yWbzDGxtlVBErOo9WOftASXiHpj09VsnvuxhP+EsdW127Hz+qL+0seQKS2/OvBbgU5Nbi8/Q+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OxxvQo0C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QBKOx50Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OxxvQo0C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QBKOx50Q"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FFMLRe030111;
	Sun, 15 Jun 2025 19:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=deBLPQMVYrZAB2X1/fBt5vIPUUQIpGR9acZOVDbNMtY=; b=
	OxxvQo0CYvBXggsSI+4gejqXchMX3g5bnA9QNpdCFl9Oi26Loadhg4R6pT7zn+D1
	UhNeyt1hJ/uhmXmdAcWxwPXiKdPS6tT0VprF/o3ZhViXH1iXI1IQriIDuaFo618K
	cHlCgy8/kersDUuaockUmsi5DapKsPmdzqVbzPiXH7SqamwynMMcP2nE/gh/SUA9
	mhRKrwLtTW2992yphhGGxlQgzoc2SIi2c9asSfGlL8w/qYj61Kj10WUD95LsVt4E
	RPg240XAPzDnWKBTsqsnAMhun9wasLoe2uzARwPYHr340jXvJuNm3TV0JXXXXE7P
	CABSwVABM8RO48nZWryguQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914ehad0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 19:06:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55FHJpTS036350;
	Sun, 15 Jun 2025 19:06:04 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhdp9p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 19:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/CuWfN0ddw6hnrKqxMkhLoERGpB5HQKEIFxW96ndMxuweaa5WvjssCEUUrMvSQgwowVobWdJ/WF0eeI2Ax5w01Eby4FruwPX6kKUgCG3mqgS0yGQCOJxCR0nOnQWbEo1HCclCZhdoJr9IqAXNG5HTgKUIn47FtA2pxI7NDjvTxiTh4uwF73D8Kjx2nnmDt4f3f4AxF9nShMBfsWU4xxPpg163CIrJrbt8KHydGCsxGvnL7oR8iXYInOBV4US884du6Znrl9eJ+z1Ha1zSAhqcxAkC2Q7037eK6HtYvHB8yz9bw7nxbW9B0dDTzZBVR6AV194kxgSd/5g9aB8C+cww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deBLPQMVYrZAB2X1/fBt5vIPUUQIpGR9acZOVDbNMtY=;
 b=YlvQ69/2WUS9niGuLNjFVPRpu0sOUI/w4cJJ/yOMGcC4eLvDUZXCuS1fD3sAv2LIegO/gxnN2RzRkNFF01sMCeddha0vfFkeXaCJEhVnzhA7p4MTVJa2hUcJG2jWz78uI+Nj6zcx+/JAbfTe8mAA26qWZgU5DWlVHSV4UozuRJW0VwSW+8OaKbMqnEKkhD8+z+sngQhOTUyNJ4+NS3F8kct3IW2MvrGkJ7+PqLcVtYmFgSDa8TP4p/aznP1ZM5GJmD8uVI50wpGpkHVszvVgm7mCKm4EEnWCk0r7Mh0tQXZpGVprQXAVFL12eL4mma6Ego7OGHSz6BRAUlGh8+doxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deBLPQMVYrZAB2X1/fBt5vIPUUQIpGR9acZOVDbNMtY=;
 b=QBKOx50QpUpKB9y4npkCpMPViw9YMycHIl4XqOzzNQW7FDrK9MWsCH1+97Y7HBZZxE/QPaUysC6lSwLynF0NiC+NSHR/GOltPIADTTysvr4ApUTwh9zt7N/ZJz6OCqK2p/ZTl80C2srK1oJFqovUyviCtBN6z2ZRRcywsZjp/1U=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CH0PR10MB4859.namprd10.prod.outlook.com (2603:10b6:610:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Sun, 15 Jun
 2025 19:06:01 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 19:06:00 +0000
Message-ID: <78c3f757-0ca9-4017-9360-4f97e0086c5d@oracle.com>
Date: Mon, 16 Jun 2025 00:35:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] platform/x86: Add Uniwill WMI driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
        hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
        wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-2-W_Armin@gmx.de>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250615175957.9781-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0168.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::24) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CH0PR10MB4859:EE_
X-MS-Office365-Filtering-Correlation-Id: b04c1ace-b0d7-48ac-91f2-08ddac3faaaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dE4zSzB3R2dWSnl0MGxlMTRia2JqbUtTWExubERFN0FjT0RYcytsSEJBREYy?=
 =?utf-8?B?L0lLUU43YWNtanlESkhianlPVzh4dENXUzBFVElOVWN4TTVoQmowMUNiV2t5?=
 =?utf-8?B?YXZ1VDlLZ0xUdFJXUmdUNXZlSlpTc2xSWG9YT1R5U3h3ZHhsaXpTQ01kcEdI?=
 =?utf-8?B?SWRmeGtud2hGMUpCMElRMzlCM3BtVWJYWEtVV2JLbURQVytSc0Z4MDZEZnli?=
 =?utf-8?B?dTJta1NFMHRNWkNWTVYyaDl2U3BlVjA4VlZDbkdrTVhiYURrajdUMzVuSlNq?=
 =?utf-8?B?SWo4VDRYRzZSVzNER05YdUdxYXVON1QxbjE2MW0yVUJCdUVTRUU4NXBYVE45?=
 =?utf-8?B?eXMrOHBXdVNkdkxiWkMyZit6cWpQN01mRitOWk1OdTRNTjB0d0E1UWMyZWtN?=
 =?utf-8?B?OVRnWXd3b3I1WmhQRVhqWkRWcnk3VmVkandiUXFrZ3dDNjFVUHVFU3BJZ0JT?=
 =?utf-8?B?UmFXak5tY0VyRXlibUdXa0dsdlB4YTlhL3l2SEZnOUV4c1kxK3o4NTFvdHdh?=
 =?utf-8?B?b0xxeElPYStvbi9Xd2tLcjM4cEJtYkEzMkMzcWc1dFFpN2RvdVd3N2lGbWRP?=
 =?utf-8?B?czJLZE5sVTBpMDdLTUVuMW92WXk3ZlFnN0pIWGNZRnpaV21GNTdWa0QzU1Vw?=
 =?utf-8?B?anZSSElLVVFPRzExQld5aHFxN01VL2NTWkZlVkdXckdMOTFKQXVOV05IZVFF?=
 =?utf-8?B?SlZHOWlvY25qWjFYM0l4OUt3K1BWM1pGbThYeHA4SVd1cTVTY3c3SzM3Q01H?=
 =?utf-8?B?WmRSc0Qxc1JqSStmeG9vU0Yxd01mdXprbFRKRDh6K3l0VERIaFlxZVg1TldS?=
 =?utf-8?B?ZVBiRkh6UzZxZi8rQ0FMQWdWbHp1RTcxVzN4WlB6TTZqR3lOY1FHVzByYWZV?=
 =?utf-8?B?M1ZiV2lNRkxjUVBVelNYYUp6NzVvR0ZCVFloYUpnc3ByblhNL2NxaFhXZUhP?=
 =?utf-8?B?Smk4c3VJSGNINnVZSEtwK3F3RWxkeU8vTTQvMS9vMHNodURLelVKZDNsNmRI?=
 =?utf-8?B?d05HRzFtbFlBV0FVMnVjUVIxYVBRbElBZlVLbG8rNVdmRUFJTDkrcVVGVHJ5?=
 =?utf-8?B?cENLWXJ6dlpBM1k4R1BDVE1GQ3hLVjR0b1V0V29CTFlyK1hYYUZaMXJZVGk3?=
 =?utf-8?B?MEM0cEIxaHNVd0RCd1JEV1pQZStHSW02ZWROMHN4R0dnVzQ0dWFIQllCMlZi?=
 =?utf-8?B?bVZBS3pmZlBEbUNGRi9pSGhTVERVTUMwaUJIbERuUUdjdWU4OWw3ZmhjMW1t?=
 =?utf-8?B?bU4yaHdXTUpVU3ZPTnpYY2l4NHc5eXUxa1g0SGlIclE5VWFUZVF0d1BQRGVW?=
 =?utf-8?B?ZGNoZzhSYTZWbFVyM3crWFdBZjduMG42RmNBME5yN09ONWg3RzBaVFJUTXBS?=
 =?utf-8?B?Y04xaXFPK0lPdm80RmNJYkVIdUpJd1dJMUZWTUd3RC9YYkFmV0RIcUhsQ3Za?=
 =?utf-8?B?WTZpSUs2MkVoT2xUaituQXc0Y3RsU3RXbkVhTDVTYzVSUk0weXhSYU5JWkFC?=
 =?utf-8?B?dUxMNUpRUUdtNENQd0tWT1hkRW51UVlrNDlBSzRWNUl6cGYzWHNhMTk2M0I0?=
 =?utf-8?B?UUo1ZHpCTFhrVnpxT0JLK3BnUk9tNitqbHIxMWE1S24rd1VOaGZTaVFnWkVr?=
 =?utf-8?B?NDJkb09NblpyV1pzSFBybEI5eEpKTlIyL2QyeW91LzYwOE53cGp4NXJpbkhz?=
 =?utf-8?B?S3o4a1J5NkoyL0lGMjZZK3kwaXpVMDVKaXF4VW5JbGp2QnRKcFQrb0tKQVZy?=
 =?utf-8?B?TVVBQXR0bjVTQm5Pc0tqd1B2K0g5a2ZZUEJtc3JyRU5XK1gxZmNGTUk2Vlln?=
 =?utf-8?B?NDFUek95dm5mdzJlSXByM3lsZHpyYVEvUUJCalRkbDhJVEQzYU9iOHhXaUVE?=
 =?utf-8?B?ZVk3d0Y3cndTKyttSkhWU0tNd25MSkRRSmFsWWlJcFUwa0FFZGNZb0Iwc1BU?=
 =?utf-8?Q?LkFo7ZRoMf4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDYzeElFdWtPQitzWEF1UVpGLy9QWUpnUXc4QzloUmgzdDJoQVBGaEk1K0hC?=
 =?utf-8?B?WWNreThyZU51bzdaeXRjMWErWHAwZ0tTKzVHekx5SjVQRU1VaXdZc0RmMTN5?=
 =?utf-8?B?ZmZJNlNjU2tpV0RwMllHMG9MTTRaNjEyRDM0bEpVeVZ2c1VzV3dWOWFQVStR?=
 =?utf-8?B?SUwwNjZSMGVJVDRlMUNONHV6SkpEUkVKS1V2WndCOTNBOG1naHNvVUMyZnY2?=
 =?utf-8?B?WlNkY0d2K3pmMWMyeGtOL1NieTVSYjVvbDh0dzlCRndydXVTUDZ4V25KZ1A4?=
 =?utf-8?B?dFVUemNIdk5wWGdMRmdqZzdubE9KR0cxVmppb1NJWjlDMDlTSkREWmhvSmx5?=
 =?utf-8?B?Z1BSNTJmWVlDcDVvOXFPeXFsNExZb0NaTHJLQ3ZpTjBhUHJFZExiZXpWVXJr?=
 =?utf-8?B?aWJUWHpXSjRMZ1pHaEdEYjQ0SE5TRUNhbGxDZldqamc0T1FkaDZZNUc3UDBn?=
 =?utf-8?B?blNBeUNBQmY1U1YzVllnNFh0ZDdXRmVzTUlZWFRldmhVTzZBTGJQdWFTdG5O?=
 =?utf-8?B?RXhtN1FyQ2NtbEh2Z2FFMFpqME9JZ1VpVlFuMllXNGFwVVlkTU1HY2xnZitB?=
 =?utf-8?B?RWFqc04wWlN5UXhXK1NaZHdSZzAyZE9ZT0lHYmRyRFd2cmErUlZtLzlVbmha?=
 =?utf-8?B?d0dFVnhnWDRCSFpUZmpNVElZQzhiU25oNDc3cXEzSW12MlBqb3U4bndWeUY0?=
 =?utf-8?B?cHRmdjIxd1JYSzNsaU1hbkhTUVg4NFZ0YjNlbG1RNnc0RlQ3SEVXZjE5QWcy?=
 =?utf-8?B?R1lSNnhtUEdqamJ2eVdsRi92RjFySUFvYUZybFg3V3Jzck55cG5pSTZmUnhj?=
 =?utf-8?B?czhXbGNubUlpNGdBcXlhZTJ2UEdzZGRiUUdWdm1nSFRCbjA1dWpkYXRxcFZQ?=
 =?utf-8?B?Z2FvY3Vnd1poZ3V0Y0NMZHdEU3dHNTNTL1hwVk9FUXRYcmkyTnR6MUxibTZY?=
 =?utf-8?B?KzF0TmYzdEgxVVkzblZMMGhkQ1BmYWc0cmpJRlNIdGN2ZnpMblJpblpLQ1V5?=
 =?utf-8?B?dHpEL0ZWMjZrQUNnUXZrbENzQWMwMUtaUXF0L3dXazhUdk5WR2ViZGI5T1E1?=
 =?utf-8?B?bm9SWStMeTVXMWtiNElBUnRwdExydUNQOVZkdTl4UWlIRlRJMTJxNjI3TUYx?=
 =?utf-8?B?WVZadklnQ3VTNEhkK2lZSnFVQjdON2E4VFc2Yjd4UE5pKyt6N0tpQ0lUMndI?=
 =?utf-8?B?QkF2NG5PZmU0V2FmZ21PR1BWb1NLb2Y3TGEzeHlQMmJ5R29LellOMDYwNUZ5?=
 =?utf-8?B?R3A3UG1yYjhyUUlyWFNyUjhyNm13RVcvdk5WRGpyNWNJV1dtWGdUM0U2VEkw?=
 =?utf-8?B?UGplM1RLVHo1RkIxSyttN0daMDZNSXhsSmsyTHY5WnpnTmdweGxITGxnMXgx?=
 =?utf-8?B?Z0RCekZVbFBDTXZjblBHMEsvdFVRa3Z3UHByWHZYaXpwYW9Vdkt5M1F6KzJw?=
 =?utf-8?B?elBzdXlVUllPNGNRcEFmd0JWUXdjSmhRaENpWUxua2lDa0lLWFFwNUt3cjlQ?=
 =?utf-8?B?ZjFDWURkR2lHVUt0U1V6M3lGeGdxbUpONkNoZHdyZVRBRjF1bXp5dzFjZ0N4?=
 =?utf-8?B?bUsycStkdWVaam5jbUJnZkhBV1pjR0VJczlnQ0RjRm02NmgydWluL2tRTVdU?=
 =?utf-8?B?dlJENWtzTlZVeWVZQy9KakdmS3Q1QjJWdE95Yk50aWNINGw4SzBTekJrSUhm?=
 =?utf-8?B?VFd1OHJweFdwQ1VtR1pSZGJQM3BvUTlyRkgrTE9lNjNVUXV6YzdpQmlRck01?=
 =?utf-8?B?REo2cCtrMGVEMFRaVkNBd3FreHdGdHZOWHBCbkErcXdJWHdzL2poK3RxeEdW?=
 =?utf-8?B?ZUVIRkgyeUJ2ajcvR2NXMTQ3Z2dKRTVnZmxCK2ZiVnRpVmM5aXdrbDF1cDlj?=
 =?utf-8?B?b041dU9VWVZDb20wODJHemxlZENqcTNMMkxGQUMwbVZFeVZ5N2JsRUhnY284?=
 =?utf-8?B?a290bXY4SFdFMlFTQTl1Zlo4MGpVNk9NMDRaOGs5YTUxZDNvWUtISHYvMnpx?=
 =?utf-8?B?bXJrY2hWZXBEUnJ1NDVZTEQwS2FHWDFENnNmaHBaRHBlNVp6U3gvOUJrbW44?=
 =?utf-8?B?YjVRODFLL0luSUQyMFhETlhQQ2h5NTNDdVdkOURLMElubHQwT2s4SEd5Z0tI?=
 =?utf-8?B?ak5xT2dPekhheEtxVDdQMklpa21OMDNyYi9QTXZENnhjRE12UXlvVUFEN1Z5?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AkwSne5BQfya+6QGxBpOGAp9RsD7bM9NB0SzqQPR7OmcEPPeNDymiM50v8qeezaaYGR8WMuVd9kAMUBanSul9iWcMnT+jP1S/ZmD4xvYuzkgqBl4I/zk8fuXkzYZe7yBMGCKb0wuc3mZWPKml4TcH9Sh6/g2cBhdGd197RuanM7XsI1UJHlAcSz7rgF+GQjA6+cA9ChuUMMFLXgHdreK38L9P8RrnqrAjAj4ePpT194qOWkWd5XQZd8fUyFR1h/GlJJRuG3/xY1ktbHJN9XAzU6IMpFnkOAhGxJXpO5Z8Fja0Utc+AjPX19Y9ybOVIVRwU7LceY+n12WFbGj6wrtpCSDjoqS9N30yQd6lt28h5cEcCzsZl6Xy2tTGwY+dSFPHd0peOTky0GiUvI8gXuY/038DPq9x3yCx6pVNaqSXAUHIYtuc2AWx+a6oFUxev1AuBmbxLsMAqrlGyIJ3ddJNaafdN62/Ox2fMLVUnZ+u8bnv51gtzMTaHAp13U+CgQDZAU9hJYqDMqvIVOEx1DC0x3514Zabf8nRHrGGMNaybPC8fIVrRCX44HeSZ9UTj0boLZYm42RHniLaPGg+mFS2k45ztCKzh0sW9x0qAyfzzo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04c1ace-b0d7-48ac-91f2-08ddac3faaaa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 19:06:00.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwloMcrFexN7aikk4SaifotIrZzIQ4xl4jDruwJ2vtevM9RuMe3PzddoE5QoZzQNxdiBif3LqMemFxGwAFRhgnjhMCav30dr+A4+d/lLpsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4859
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506150142
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDE0MiBTYWx0ZWRfX0+YXK9hGtqGU 94EsZedsLnGfBYC5llvtAxrdUupy1j8QMJsfDR0qOtBheTr/QOBxDvSYtSsk9Bn4pV1Ry+tlBEF yD+tGUVi8+J9fnKV3/f5wSCf5dMiQXQ4kdm88ocPjoUXiY5L6sgi0VzJO9M9ucR3TmS5V2elOBn
 Mt+D4ApwB6/hB52xiAJgE6aPc+6Swp2a8w8acq7eejLCsLSiHukCLJ3NtHbBb9p0sKIF9FOT3pL 1nO6b1dotV5SWTojdfpIuDQ/xzMood+N9UcuqbzwTMel+DR50Hm4AmIjYFpryXSRzzG4dZaaYF5 wIqrl2OugdpjZfRKo34GvFW3eD+PKdH1/ncMOR/yJHEl+POyBu5QOdfHjhureHbQCDiEy5mjYwB
 JMk4EOa2RXmHTynkUNFbVabEyhyLbzzcyDdYyaUg+m7NobwTGZhsNJ2hMyqMywygMHLNjE72
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=684f199d b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=jhgHGXLX5-4vpxdiDOoA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: fBqSEjnuvYpmK92JJVFG4NovRBjZfnQk
X-Proofpoint-ORIG-GUID: fBqSEjnuvYpmK92JJVFG4NovRBjZfnQk



On 15-06-2025 23:29, Armin Wolf wrote:
> +#define UNIWILL_OSD_SILENT_MODE_ON		0x06
> +#define UNIWILL_OSD_SILENT_MODE_OFF		0x07
> +
> +#define UNIWILL_OSD_WLAN_ON			0x08
> +#define UNIWILL_OSD_WLAN_OFF			0x09
> +
> +#define UNIWILL_OSD_WIMAX_ON			0x0A
> +#define UNIWILL_OSD_WIMAX_OFF			0x0B
> +
> +#define UNIWILL_OSD_BLUETOOTH_ON		0x0C
> +#define UNIWILL_KEY_BLUETOOTH_OFF		0x0D

why this is UNIWILL_KEY_BLUETOOTH_OFF
not UNIWILL_OSD_BLUETOOTH_OFF typo ?

> +
> +#define UNIWILL_OSD_RF_ON			0x0E
> +#define UNIWILL_OSD_RF_OFF			0x0F
> +
> +#define UNIWILL_OSD_3G_ON			0x10
> +#define UNIWILL_OSD_3G_OFF			0x11
> +
> +#define UNIWILL_OSD_WEBCAM_ON			0x12
> +#define UNIWILL_OSD_WEBCAM_OFF			0x13


Thanks,
Alok
