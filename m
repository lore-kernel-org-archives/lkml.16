Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3131266B76
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746168783; cv=fail; b=bd3dqOV9QfPkmt9X/s4S6q19v0C2jfu1t+zCgkpVrYB5DbThqX2RcTeojDhGjYu1ll7oCc29lQ+ET8In8PzalOS1xqZcIZPUmvafnFz9brGyGScmmcXoB1YcyUMotKOSzXf0xqJdavFjTxVoOH5BxBlBvzy2ZwiwzbcWZqe15EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746168783; c=relaxed/simple;
	bh=xMtBq1q7uFGFEzLPt808TwBgtMB677N9u+DJxsuE238=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n0Q5I22ES3CZ+Hdu61XuhYYc9RVY51bdsOXuqimIX+8SSdMMVbxqH7+ql+6TUR+O0DEZ6rnfItbNwTh0rCDhrlQWXWdPwBQntdmxIP6ujl5b4wCPSkztsD0bko7bnQbBjpPpg2xB55HJ6sv8o2cTLMp+pSYbUYij47u/QCgFHBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S7PBxMFz; arc=fail smtp.client-ip=40.107.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S7PBxMFz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEMO5WSc5pkxY7FUVsxsjfwm7K+Zd2Dfr1Qsfp0GRiQ93pF+FY32aQgkX+KBWRT4dLT1Hv2oezmpLo5gZNhicqCNhUE8iv5uNVn3qefPE4diwPFFizobaHGijKCU4LcJhjRFZkeP747kiiAsFZuyPAJ6mRgN5DjZ41FlhM6izoWua8Zs/o/ss2Hcun0hX1DyhvWUp/gQEyN63GnvEItIhj+dy1fo6eW3o2jNPjGzmg3e7td0IWhDanBYDFsDvtfXK0BMBAlRwGzRzlSLDH6fi5Mv9IS+LENKE7s+rKAlCZXHnl1DEixT8OOiGYvBFq/VhbA8oM7sVG4fYXxNkxmP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duBPZFARvHPpChybq1RbacOVjGIgc4G1DhKVxyBFZFQ=;
 b=j46xzSnv/vFQeL57/J40HdIxM/HuFkNs8EXJrUXABBJ9MW/C2ntDr2GH6TuEZe4rJACNdZRia1AuKUFgl4lm5jqsj7qBzdyWamMqQO/oJQTGsI1vmi1MjKaE36PSNzeYA+1jDXQWeaPgFsBP+c8QO7IHGltpbEC930IhoDIO6QB6RbDTX+mwTdL/GVp+sCk0y8XZNucMKa3pcd0JKIEOkITqzYu/Hk9FTiokKHE2tmk7oDih+Iv4qCai7INqWrvD+YmWEA3isffTVXQwJ8p0HFyJMvWUmLxuGjSRQjBBHPwtjBB81BHkIYq0NHkzLuRo/mRKhOOfbgyEn+qK81qcrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duBPZFARvHPpChybq1RbacOVjGIgc4G1DhKVxyBFZFQ=;
 b=S7PBxMFzo3H/j76APk1k+ul0Xl0jf5nqA3gMccGpyG54mzFlflfG8sgZ/ZsS+fvmnEzdOY1CKSSxqr+EfPrx0+9ZEDuyN8s8BWOonz06OWRSCbxivsQ9sQu3hWdHEt2MvdNX+N1jmPxsxCTqxuFtqTOyAXOqEVk7dFFz+LvnuSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by CH3PR12MB8307.namprd12.prod.outlook.com (2603:10b6:610:12f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 2 May
 2025 06:52:57 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7%5]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 06:52:57 +0000
Message-ID: <c2644e83-89b5-baad-005a-ed578200d956@amd.com>
Date: Fri, 2 May 2025 12:22:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 6/6] cdx: MAINTAINERS: Explicitly mention Greg who
 handles patches
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>, linux-kernel@vger.kernel.org
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
 <20250430-cdx-clean-v2-6-7dbfda9364a9@linaro.org>
 <2025050158-tingly-doubling-9795@gregkh>
 <45859218-1bde-48e9-bdcf-4ec94fbd47a6@linaro.org>
 <86cd570d-416a-49ab-84e3-6bf54873f8eb@linaro.org>
Content-Language: en-US
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <86cd570d-416a-49ab-84e3-6bf54873f8eb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::17) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|CH3PR12MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 56799325-cf46-475f-1bbc-08dd8945f866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWcxR1p0MnFsT0RKdkR3TmJacGJzeGNvU3JWd2RCaHpwdVRSNDF4T00yREVY?=
 =?utf-8?B?VzNRTVQ3bTJVY3dZOTg4VTNHMnZmOVYxeFplM0lFRlcxdFF0cEpaNWVvZmpP?=
 =?utf-8?B?ZzFpTEptWXBVdmQzVWxEaktlN0FxM2piVkNCeDBvZllGclB4UW1TUHlhN3Yy?=
 =?utf-8?B?dGpPVjRIcE1BNDFEVmJNbGhScG83bSs0RmxuaHN6MzVZWlBzMEdGQ0Zuc3V2?=
 =?utf-8?B?RlNBNDhuRGY2dU0xQnlvTDdTS0ZjZU5ZRmNqbmdCTnRsSVliRTRReGoxMW5G?=
 =?utf-8?B?UG9yYi9MaXZjV01mSEEyeWtSL2hMOHZhaW5HcDI5eWNZa1p2YnhNcmp2ZjU1?=
 =?utf-8?B?SDZ3dWJoWmk2RG5qRW9HVGJSSFFpN1oydnQxeFdVSm9DMzQ2d0pJZTlLUUsr?=
 =?utf-8?B?Q3NDMkRIdE9HdFFPTjhTaG4weG4yVG1SZmlNTUNubFRsMmcwUmhnUlAvZ3FZ?=
 =?utf-8?B?eE9RSlpxU3MrUDZ0YTRkUHE1QmM0R25tbnUvMW90RU5vYjZXcG1HZ0hlS3E3?=
 =?utf-8?B?cnh1ME5WdkFSODVZOGxJMG8wT01qeDMvQ0ZGUm1Rak5LNzA1M3hpbTIvaHNM?=
 =?utf-8?B?TG5NajQzemozQmw1REJMSkpEQVhVMUFyUlNNcVBlVHZZUXJJTE4zQ3JPVjdX?=
 =?utf-8?B?VDRQV0FjUUNiWmN5cW5iS21ZWVJqT2dheHBrQXRZdzd3ZWJESStPYzQzN25M?=
 =?utf-8?B?Zlo1MWxQZkR2UVMybmF2WFNkamtzSUxqMWZ1dzNZc1hQaWZnd1d5Tkd1anVk?=
 =?utf-8?B?ZjAxVVk1dnp2US81T2tIQXlpVURkNHVTRk9aVUJlVkYvZ0hiMlkzUWR2b1BQ?=
 =?utf-8?B?WU1jS0hxbGNVQXRBV3IvdnF0VkdxaG02TnduWTNqZUNRc2lxZU00RGhsZFoz?=
 =?utf-8?B?NnY0MGtUd01jNTFMdkJTc3BNMmRzUnM1WW92SnY1QU02T0NyKzgvQjRuRmY2?=
 =?utf-8?B?TXJYT1dCdERMMjBRTWF5Z0ZaSlp1ZUtuR2t6UFlnelFQUzFSZmRWRksyTkNp?=
 =?utf-8?B?OTdZbEV4L292UGIzbktVYS9BTnkvWk15U2RKZ3JLRUREcTNzbGUrNTZMdjRJ?=
 =?utf-8?B?NExDOURzRTUxN2d6OENHUkYyZ3BrTUFROVV0RkhvVjBsZ3VEMlhVamRNYzVT?=
 =?utf-8?B?YjlkSDRmejJ1alJFRDVvMkNMdERXTWRpblRDV2hZSUM1VkdFek1waWpDczYz?=
 =?utf-8?B?UDlpYjdWajErNGlEUnlBeEI4TkdvM2xpbEdiNW1ka0tGVXNUeVArVEV6U3NQ?=
 =?utf-8?B?QjJVcDVhM3c2aWpsRHZVcDZSelYrQnFKaHZoQUY0ZWZmYmxRZ0xRcHB3VDB3?=
 =?utf-8?B?VG5LeENBR0FMMTBxa1Bxa1NJOGVmRk43RFM3cVRmYUhMR3R4WWp5U1JibTYv?=
 =?utf-8?B?dklHQkpBZkR2Mjl1Z2h0ZDNkTC9ncE0yTEdQUXQybGg2amtUTWltM2Zudm55?=
 =?utf-8?B?VG91QmY3UjRITEIvUHBwaTB2aEhJUzViR3VzRVdmSmNBbWlqNm0vWXdmV0Vj?=
 =?utf-8?B?Zmp3L1ZKcHpYVm9ScHdMNDBZMFhFNGdHck9mN1gya1dvVU5IaTdZak9XRlJv?=
 =?utf-8?B?YVJKQ0hoVGNYN2tYaDBRK0NCZXZBc2dXUVRGMjEzUEVjb0h3dDRUN21RUzZ6?=
 =?utf-8?B?S0tMcUNkaDQyeDFQV04vazJzcjNLTVQ4QmwzbEpvbGYyZlU3cEk0WWJvNjJV?=
 =?utf-8?B?VnptRVFUNENpTXVFV1BUVWprajNrRUQwalZPby9Zajk2VjkrMys1dVFFM1dY?=
 =?utf-8?B?Sm1iRDNFM1ZVa29UeGJ0ZHFxc1dMRkVFNHhRTGJ4djVlS2JuSWlxa2d0emFl?=
 =?utf-8?B?K09rdVNaaUs5QUo5MlhQRlhZb2RJZ0pjYXlhOStFUjB4S3VxSDJKREYyVjdV?=
 =?utf-8?B?Q1BNNnNyc2NCVUlIa3Z0SUhra1BGaHdpTlIycmhrOGFiQTBHenFmTys0ZzJp?=
 =?utf-8?Q?hNcDZYjzd1ioywf8Yj5PlLrwVj9WVcVV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9193.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzVmQWRZbUZsR21UTlQxQnVrbG5nQ2NsMVg4azdDSmE1djA4V29lOWxvaXZY?=
 =?utf-8?B?OGNsVURCVTM5dlF3VDYwcUJ1Z0RjcVJmMWxVN2pqMXg0NnZ4WnloZyt0c0Zm?=
 =?utf-8?B?bDVhK2VqOU5Oa3AzVUdnZHhDbTJBdDdYdE55SkZUcHRDL3ZONnYrQ21UWlpm?=
 =?utf-8?B?STZXSlJ4WVZtQm4wRG1UWUMwUDV2NjVSeUtoTEhveFFtWXNKckFrQTh3T2pH?=
 =?utf-8?B?VFFXZ3o2WEIrb05jSUFWWTBBTFczOWJZeDJ3bWpud1R2SjVHZUM3WFRFNFA2?=
 =?utf-8?B?am9OUkJtcWltRVVSQjhnVTFnR1BpK2FsdVltNENzZU1PeG5CRzBDcTJPMFV2?=
 =?utf-8?B?ditvQVV5RmhvclZ2VWZjeFhjcnJMdDJNMGlhWi9DSHlKaUpuVElDdmp5cVlQ?=
 =?utf-8?B?WFJpTEY5cEllNU1mdlFaeFZSZERqd1FMdkI5cUdwZVFacUQ2ZENORU5KQ3FQ?=
 =?utf-8?B?K3AzL1N3eUp5OHRDYkhRQVdmRjRLOUFOd0xzeWhnbDVNbi9TVUtaKzR4cytp?=
 =?utf-8?B?Z1VKRno3R084bDBJaXNyL3FRVXpEb0FmVFExZWZadmJ6T2Nqa2plRVBzeENJ?=
 =?utf-8?B?dW9iV21MR2FuMEsxTGFZRlhHWC80N3lSc3NaTk1GemIwMTM3VGRjdGNLRXBU?=
 =?utf-8?B?TEFUckxwMkZMMXFZbTB1bVdmVzRJbVpBYVZiTkExRWVSYkU3eDRDZXJ1TlFs?=
 =?utf-8?B?Ry9ocGhNc2pQZ1BRNHN3TE5qNWdKZTBBbkVwR3ZsVVgxandWTDh2eDhMWW5x?=
 =?utf-8?B?L1Z0cjZ0MTRBeDZUbFp3MkFXRzBpcEFvdjB2TTJhNlhzUkVNWS9YOWdVWHJx?=
 =?utf-8?B?VGhscjAyeW1pTWlZaVRHaFpobDdHeVZOUTJrK2xKWFIrOHhOQVhnVllKYlhy?=
 =?utf-8?B?ZmFydDhjdlJzN3UzWWpJT09NRGZTWGhENDlOQjVJbkgvUDBPcUxzTGRhelpP?=
 =?utf-8?B?dm1KZ1B6Vm9XMERiSlVBeGRqVm5VNDVsa2JQb0pHbGd3Tkp6YmR0STBJckZl?=
 =?utf-8?B?TlR6dTRiOUdkdVV3TjRzeFpjUlI0dEFnMjhuOW5yMFBSVGNpeHdEOTRvcWtM?=
 =?utf-8?B?Q3dRNE5XbjB5cHhId1ZlZGU1RG1LVGtjK1BvOTVCMlJEamJuSTlWdm90RHdv?=
 =?utf-8?B?M0w1OEVzNi9maURUNlZKcDNaNnJCK1hIdGVwRExZckVkY1RCSnJDOHE2bVBD?=
 =?utf-8?B?U0RFMnB1UHVjcXRBbWJYcXdwZmc3THUxRGg5OWVIaVJRVTVMd291WlNEVkY2?=
 =?utf-8?B?dENEdTZRenpsL3psVmhKcnFnaXNTUkVoTGw0ckloOGs0NWZMclg1MXZqSmpu?=
 =?utf-8?B?M0szRnBORmRDdUxheE9oMkVjT0FJcTZOb2Z3cDl2OGNZc1RuRUwzcWdXK01j?=
 =?utf-8?B?NlA1S0IyNzczeEVPSS94Q3pUZW5tM21mQm9uWjNXV3RrQTlIL1E5TzBvb29T?=
 =?utf-8?B?SU9EM20vRUVPRFo5SDNub3VEaGJwb1Y2eFIrTjhod1Ftcjd1aHEyYmxIdjNF?=
 =?utf-8?B?RHQwd3UyWVhNenk5cGpxdmJSVEhtOHBpT0NJaGxwUVdidnBMZmRHNHM3bW1n?=
 =?utf-8?B?dEhPcGdWWjE0Y0FJVWg3RE5QUzRKL0QreC9sZVZNODNTV0VYY2FVZzdNL1JQ?=
 =?utf-8?B?cEtUSnZSNVU5RnZGWC92TkxpRzNBTEZ2d0dwTUVpbnBIZFRJZCtRQ01BYm9G?=
 =?utf-8?B?Z2tEK2Y4Q3hVSXp0ZW9oa01DUWV0V0h2QWE0RnhTaUhQQ1NBUVFwZWVld05Z?=
 =?utf-8?B?S2RVUHF6eXJyY0dob3ZLWERsQ2RkdGd2TFNtb0lWOElOMnMveXYvK3VxSVVR?=
 =?utf-8?B?eGt6dEwwbUxldFB2MGpLWDVUQmZ6STl3eGJSK0VGV3N4N2xrbWNQZWRXeFNx?=
 =?utf-8?B?VWNpVFhuSjh3dlVFZG9LV0NtTWVYekwzWXBzWE51TzN4b01BL3FUU3cxZ1Nj?=
 =?utf-8?B?eFdGb1l3MEV6NHVJMUZNRXZPRGpxOHZ0UlNlQUtJNXVWWGlnWkdsKzRBaHFJ?=
 =?utf-8?B?M0pzL1RSV0dpNzFwTVY4dDlDUHdLOC9mWmxmWVc1ZmprU3pZRm1KRmQ2VjFI?=
 =?utf-8?B?TUNKL2FoUHlZYUx4NnVhTWdndmVNUEJlMHZvM3lQM2xOQU9LdVJoTmJ2ZUN5?=
 =?utf-8?Q?ToJO0rLdnv0FJvmEaqno0AWwU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56799325-cf46-475f-1bbc-08dd8945f866
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 06:52:57.3836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pv+NUnhWzL8j8aD/Ofudu/Zw+EXi76Bo6JSjDWZN/Uk0jhIkNUU/3QSrubcNpsKG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8307



On 02-05-2025 11:57, Krzysztof Kozlowski wrote:
> On 01/05/2025 18:06, Krzysztof Kozlowski wrote:
>> On 01/05/2025 17:59, Greg Kroah-Hartman wrote:
>>> On Wed, Apr 30, 2025 at 08:41:34PM +0200, Krzysztof Kozlowski wrote:
>>>> Patches for CDX bus drivers are applied by Greg Kroah-Hartman, so list
>>>> him in the maintainers entry because otherwise contributors would be
>>>> surprised their patches got lost.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>   MAINTAINERS | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..505d7d45ad7d1c007e89a555264ff8cbeaf6e1f4 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1008,6 +1008,7 @@ F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
>>>>   F:	drivers/w1/masters/amd_axi_w1.c
>>>>   
>>>>   AMD CDX BUS DRIVER
>>>> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>
>>> Sorry, but no, I'm not the maintainer of this driver.  It's up to the
>>> maintainer(s) of it to send me the patches on to be merged, it is not up
>>> to me to maintain the code at all.
>>>
>> Sure, I understand. I  will send a v3 without maintainers patch and I
>> assume the maintainers will pick them up (unless drivers are orphaned).
> 
> 
> And now I found this:
> https://lore.kernel.org/lkml/929198a2-6b3b-0f1b-3f36-cd8955ca6f19@amd.com/
> 
> "We do not maintain a tree and  patches go via Greg's tree."
> 
> which means that patches won't be picked up. Your email does not pop up
> on b4/get_maintainers. Overall this means cdx driver might be abandoned,
> from contributors point of view.

We usually copy Greg once the patches are reviewed/acked from our side 
if he is not already on the list. Do you suggest any alternate approach 
in maintaining the drivers like cdx which do not have their own tree?

> 
> If that's the case I will send a patch making this orphaned.
> 
> More patches which never received any attention or were not picked up:
> 
> https://lore.kernel.org/lkml/20250118070833.27201-1-chenqiuji666@gmail.com/

This is applied on the Linux tree.

> https://lore.kernel.org/lkml/20241203084409.2747897-1-abhijit.gangurde@amd.com/

This is also applied on the Linux tree.

> https://lore.kernel.org/lkml/20250425133929.646493-2-robin.murphy@arm.com/

This was recently sent and we will review in the upcoming week.

> 
> 
> Best regards,
> Krzysztof
