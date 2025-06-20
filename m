Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE44627AC56
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409927; cv=fail; b=UU8+yGkMgqRHeEofBOnGVeCJ7nekZlO0IRrCQkodL84/Mt6eq++7TKrWJ4SkhS/NX+uzQ2iJNVZlMmxEGXq9ouOsGod+mHxg6cgzQli0rJb1FtcekobW5vYHLye1sFBERl9zCoOEzn1aZSm8NOIXyadZJclb21/m9xgaN0Vdv2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409927; c=relaxed/simple;
	bh=C5k5G6VLF4bPyaOfWN9WCpVzlXyFejwDPn6pCce2Lo8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BQ2wNcCrl9vbj+WWOwD1LnNn7IsBo6Fho7R7G9t3k8fE1Aj0ARA+e4M1J+A1BbbzOrcTz9mIWQuSPYdsb1VM7PFLO0/eZDJ1ddq2ptspxialtQ7pYKxKaO5YtqYIHKDFkC0p9KAQJ50nQ0t5dXgHP8e0+Yfc29Lh9q18pCdJNe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zFJAJ3vC; arc=fail smtp.client-ip=40.107.100.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zFJAJ3vC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkQILuM1UAl+ZMRqxNxt6cCsc9LMLCed4eub/HudR/2j4oLw51Y0iLGd4c8A1gGsZsvlphISyxKgbs0bAysmWnkIC+aBA5ZFLkd0XtFM/4au1IZ1xg8N6jK8hhX/LAJDtDxal9H/nEBavxhlMqrXrqLDskd9/rOQ79Kf9YFqs7EjIIlUawsSCwzPe5bGzLhtcIu+S//mImB/YIxNCctAwvlPceAfWqmp3YwJ5SjR+/0poRI/jA6lx/lvMrRhm1GPuIT27fliniwqS3aABsKPl8aCGuijWzXjmVAY1XrsOXVILGWpWosYG5QE0XnBGGQ0sUXI0FdkYBAqG/V7mOVNVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjTeNBKHQVbgys1xS8ZXNMuvmy/XLABr+bxXR0wGZGU=;
 b=CQ7VOLCdk3ToqZNc+rB8iNs+/yCurtgp6t09wLTpsyT4MkalyIBUXQ/oCLul3Kk8hapPs5WZl3akdi1SNDmHBUhOfbgN4ycqEFa0tdQCqna6jporazJshfy755NUCvzFHsVBT8pR428CkjtMh43x3nqvjLfCDVb13WcxXE2/3HrXYMRVrjhFoUhQMFk7fetyAYnmT2M9UH7koM9sQ7JWDAYqksSnOxKps6O3clMhxriLey/SFpbByUqGOnKpsGH+bcufCl8Ms2ZItWDSePryOVdQemqBj/usskY/nnZg4pNpXfz2Blh6SDBhi3Dd+iRZ3PXP8E+/dnNStarW1W/x3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjTeNBKHQVbgys1xS8ZXNMuvmy/XLABr+bxXR0wGZGU=;
 b=zFJAJ3vCGBzYk2vEwepPUrJaxaTKsH7H02AZjehGkJGDBoTqMT1yUU4GwYjAbQYoZQa0EsaOpBcgcz//KKW7UUXGBPEGgX9y0S2kEky+L7uZX3oDK4J5GigW8Q8RSWZ54PQw25YSgO4g2WMOCqLdMGROpnsmrcfaCb/xt56P9pM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 20 Jun
 2025 08:58:42 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 08:58:42 +0000
Message-ID: <cc947beb-2b4c-459a-a388-fe020856f523@amd.com>
Date: Fri, 20 Jun 2025 14:28:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/4] Kernel thread based async batch migration
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com, willy@infradead.org,
 ziy@nvidia.com, dave@stgolabs.net, nifan.cxl@gmail.com,
 xuezhengchu@huawei.com, yiannis@zptcorp.com, akpm@linux-foundation.org,
 david@redhat.com
References: <20250616133931.206626-1-bharata@amd.com>
 <87bjqi3ohx.fsf@DESKTOP-5N7EMDA>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <87bjqi3ohx.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::16) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: f145ff25-2c6a-4cc3-d2f6-08ddafd8a7d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2JOSjdKbHhUQ3hiNkdIN0VwUzRvekJTYmJPajFsYjVKVGZyY2lOU3Zlczdi?=
 =?utf-8?B?TDZzUWd0Y3JzUUMvajlCeHdDM0krb1UrNWtLU0RQaWpGWWw3ZVN0b09PVDBh?=
 =?utf-8?B?THIwU2JxYmZRdElucVlQUHU2bW9idzhOWWNuUG16S3puRzNkZHA4ME9Kdjg3?=
 =?utf-8?B?TjJmcEJJRC9jSXlPUUZEOTc0NGZmMDlZaG1WbmUwRHYvNWhQMDBETUpZaDdS?=
 =?utf-8?B?Z2dhY3dVU3JjbHNkZ3lCV1ZCZGdDTi9YTVJvcU9aWlU5K3J6ZXhLZVNBYzVq?=
 =?utf-8?B?d1ExbnE0QVZsMDI5bDg5eU1XcW1Yb00xaVp0MTFVSWUyUWpDUmVYQXI5elly?=
 =?utf-8?B?Y0RrUTQyTGVTSVBhWDlNanNka0dQVkt2dTBJd25WQXJzVUZhOTFyak1wM1My?=
 =?utf-8?B?THlNVHZqRkMzQlRrVEVza2xFM28yRGxlMGlJcnY2Mk1UWEt0Q1FDeHVyVDN6?=
 =?utf-8?B?bHQydHhwYXYvTlZ4S05VNGk0SktKcDJNWWVpc3RoUkl5a3NBTWFaeUdpalRB?=
 =?utf-8?B?ZFk1NEd4WDZDZTBFUjJJejhyaURPYTRCM1lqTlJ3akxFdm5ycElzM292eVZY?=
 =?utf-8?B?OGx0NE5pK1hhRUk3YUhmbXE0cWJmeEJFQ1ZLaHpOWXUxT211SVJaWUtQZWJl?=
 =?utf-8?B?ZEt1TFVESjNDVTQ2NVNDbE0wUVVCNDB3WWRFOVRJSk95UjRUbkx2aUZHTGg5?=
 =?utf-8?B?c3J5Rmx1NW5KNlp2dU1SdlFTZWprdFBycjlVbXRoK1k3YkdkbFFMQTkraFZv?=
 =?utf-8?B?MWN0RW5pelpmV0tzU0V3bHhCOC9qaG9YUjdWV0YzM1pDYnQ5SzVxbWJnQlJB?=
 =?utf-8?B?VHR4Y09pTmdwc3V1N0JDMHZuRDlwZDVja05iRTBhQVBLOVkzejhOS1ZKQWNX?=
 =?utf-8?B?b01vWFpta0ZqZTFYZjhBczVacXc5bEJ6cWlQSHZ0Um9WS0tXWjVNV21OeEtq?=
 =?utf-8?B?cmFNdmZlV2Q5c2QwUE9OR05yK3FTVTVuTDl5US9UNllhbXpqRnc4aTBodnVC?=
 =?utf-8?B?TjRwbTdmRzkyTzljeWg4dTlvRGVPQnc1WnZ2MTlJSUxqcTVmdmJlRnZWZ01G?=
 =?utf-8?B?OU95YkZuKzFFbklKRTFQZCszbVd3T21zM0ZWNzNyZnc2MlAxQ0Y0TWVCd0ZT?=
 =?utf-8?B?RlcyWm13NkFqeTZxWm1BWVFMZW9IQm1GS3I1SG9ORTJSSzg1blEwQ3BuTDFN?=
 =?utf-8?B?aUl6RzZBbUFCV3Y3M1JBVHRoS0R1WkJqWWwyUjJmdnp1TTVHQjhLS1RUS0hC?=
 =?utf-8?B?MUJjNFgxVEpQamdhNnNhTmg4aitxL2NFaTQyNHNveWdkMm1HL3R3bkNyZ3BP?=
 =?utf-8?B?a3R0cDljckVQTlJkWjRmM3duQno3VnJxSzZZalpaMGkwamFrZ2I5U0xKaEV2?=
 =?utf-8?B?QWJmN0pwajI1dk5naDQyVEJySnNWdlNBVHo3NnBOWHNIVHVpLzlQMlQxU2c3?=
 =?utf-8?B?Wk5pdTJnMUFJT3hSTUtpTnJPUXhiQUdaSll4TEtZbmZUSHo2cTBaa1QrQllp?=
 =?utf-8?B?VHVabjJ2ckJReVI3L0JFNU1GRWc3c1AzUjh3aDhvcDVzUzJQOXZXeE96RmpX?=
 =?utf-8?B?U0lMM0lCeFpRNnBnNlRiRm9zNGxVVTRpUzlxL0lCeDJISTBTTWxFZzF5bGdj?=
 =?utf-8?B?eElQKytKZWVzazZkUk8xamhNSmx3NTZOeWVUTlQvUnRudnBBQ2FPd0FMdkdR?=
 =?utf-8?B?QTRMc0FpRFcwdVhVWmZTa0NqNXlZT2NBZ2pvNzJYcE5Nc2V1MjZCRGxSaXZt?=
 =?utf-8?B?cVlTUHFTREFoM3VOYTRXTUNLbDdJbGJ1VERRSUJoeklJU21WWnB2V2xSZmlQ?=
 =?utf-8?B?dGlKbXlNWjVtbE95T3hueEprZmdyZ3J6NVRzUUpFNDRpbnMwQUlXNmd3MzhV?=
 =?utf-8?B?ZXpBK05vS21EZWlxMFZ0b1dUcjFENnllWEVUZHZ4VzNjOWdlTkNNODBaWFhP?=
 =?utf-8?Q?73LXscgtTD0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDZ2NXRKWlY4OVBrcTIrSUozbTRTd0ViVXdpdTNDY0NYSHJtY3BDdHNqRjhU?=
 =?utf-8?B?VnR5ZlVRRVJJdWlYa0NOOVdCTzBVYjA2K0ptdzZ2eDNpcEo4TGprTlI5eUQx?=
 =?utf-8?B?Sjd2VXR6ZTh6Tkh6cE5hN1JtSE1JRGlTU0xYcmhlYVlOYXdUeENnengwRUFQ?=
 =?utf-8?B?ZnJRZ2FJVWVwcDRUZmVlbUhsY0graTRVYVgyUVlKUFZ2VEVJcnhNd0lNVkVD?=
 =?utf-8?B?Z0pOYmdTc3lxOHd5MmFwRTA4enMzb0pnYjd0ZnhDTGhCc3FYSkp0cDhnZmlJ?=
 =?utf-8?B?TjdxM3FYOE85dFFadFpzQW5mR2RYa2VDOEYzVFRMWkZXSm00UWYyekdUQjhy?=
 =?utf-8?B?aVlaMitOMWRJLzZPZ2lsMVZVVVBsL1hjYm13RUNSMjZ6VC9MdTkyanI2T2pS?=
 =?utf-8?B?OEVwUHMwL0dsZWhMMmwvUmx3dnRnNmp0OTNPbC9wVWFIQS9PWEZ5UWdLTWVt?=
 =?utf-8?B?V2x3UHQwVlZVQ0k3NVBKcUtTYkdSMjV6RTVxWUI1bmJOL29udk5jOStoZGtP?=
 =?utf-8?B?bURoSnZPOFZMM2dKd2RPeTdLMWl2azdpZ3VHMXphMzN4K3E2TUF6R09UZ00z?=
 =?utf-8?B?ZGFpTVNmRGZMWXpHYTByRWMxR1k0ZDY1c04rV3AveENndWVLeGNGd3BUVHJy?=
 =?utf-8?B?YXhaMThBSU5Tbk80M3hpYWxTZjJHaWdjeW1ldTVHSzdwN3cxSzFjWjZpK1VU?=
 =?utf-8?B?RFoxRTBCQXB0bnFndTJYam0rZXRCVjRLMmRqaHRKY2EzM0NvM1hjU2JqRngy?=
 =?utf-8?B?Z1hYUUlWejNTaUlyQWl4YTlRM1ZFTHRVOStlZVFKbGJJSVJaOEJQbmI4dFVn?=
 =?utf-8?B?dDR3elRidmpWbmNrSG9VTHNSRnZBMUxKV3ZTd1kwZUlZanRQZ3Jwak9mSHlE?=
 =?utf-8?B?a1J3N09CVStXMW55dlBVT2ZxTUNLMzFiK1NPcGgydmpnK3R4VmU1WXFDQ2dE?=
 =?utf-8?B?b1crKzdmdDI3N3FNMFNlYUdzVkM1TFB3ckxqa2NuQ3AvSDhxaUUyYURQeWg0?=
 =?utf-8?B?SkhzVXZsMVp1VlhZMG1GRTBxMG1WenRNazVuYzJRTWx4U3pyT21wcExmTEZn?=
 =?utf-8?B?VDJBaW9JUEpnUE8zeHRvZnMxQ3pOdk9zaWswaGxuOVE2THFER1VySCtZZUdM?=
 =?utf-8?B?ajFTY1huQXdYNW5mclRLbGFyeG1HWDRMNFFGb2x0c085Q0o3aVI2MFUyMXFr?=
 =?utf-8?B?MTRuLythSkt0ZEJsdEpvUWxTUFM4Mys3Y3EwVFJuSTRndnRKS1ZpSitSVWF3?=
 =?utf-8?B?TmplbkEyaVl2Sld6QUt2Yk94bzBJRmF2U2h6TmVCVWU5cCtzbWFteFh2dWFS?=
 =?utf-8?B?RUNkWTU3ViszWVFMMTgzL1VORjVReWtXRDhHb3VCYmdQVTMzemsvMzV0YlRO?=
 =?utf-8?B?ci80YjhHOE4vZjVrM3RyODR5MzZSWDJleDhjdVB0UXJEYzIzWHVRbWMvRGtk?=
 =?utf-8?B?RkY3QllMY2hKeS84MFpCcUNzd3NOd0h4RUp4bDhBUlAzRElmcWsvMlhGUnVK?=
 =?utf-8?B?OUZRbTNNTVY4RG90UWxiNVRCdmxrTiswS0FsOHJzcGI0b0pDN2dUVUcyR1Zt?=
 =?utf-8?B?cDk1QXNPbk9EaFFZb1k4NHhLTzFZb0VNcjduamIzN1pJelNUNzllTkp4eGp6?=
 =?utf-8?B?MTNUTlFCZTNIM3RzUFIrVHdNNWF4bDNrYi81M2ppOUlxT1NFbWxDWTBWazVp?=
 =?utf-8?B?UjNDU1ROSE91Skw4d0JnU05qNm1WU1ZHam01N2R1VnRGdGI5NE5qaWVOMVZy?=
 =?utf-8?B?cmVwRHpDZE5ZU3FRcHhVVUtob2ZZT002eXRxdjJxeFBDRWVxaFhwWk1VT0JG?=
 =?utf-8?B?V0pmWWRRQ2tGT0JQQ2lTaFB2T2d1d09hMk1oSkdQR255ZUtiSFhFTzBhL2o2?=
 =?utf-8?B?ZS9hVmpmRzc0cE1CM09lQTFvQ0dZV0pNZWVJaEJRRnNVbzNZRHlYWEp5V095?=
 =?utf-8?B?azJwTTBWOHhxVnBsTnhqRUFWN1E0RUNmU095c2k5TE84dkhpZ3VsVDFVRERm?=
 =?utf-8?B?K09SaXBDU242N3pRMFBVcDJiNEh2RmNBSUJRRDZOb0xKKzh5elpveGN1S01u?=
 =?utf-8?B?Ump6c3dTZjI1NlFCSjg2VnZOaldieU5Iam9nNzlOdU15dmVza242dUVzOHZR?=
 =?utf-8?Q?vAFBVvLZk8QNVx+rf3PnqUlVR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f145ff25-2c6a-4cc3-d2f6-08ddafd8a7d8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 08:58:42.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrvCJDCFNKyk4egtWb8zm+p2YN++BJ7LlhSITeApfUde/WGBVzOAFYKCW2RGZuw8H3aQaECal6b2s5hT2GzxtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938

On 20-Jun-25 12:09 PM, Huang, Ying wrote:
> Bharata B Rao <bharata@amd.com> writes:
> <snip>
> 
> I don't think page flag + scanning is a good idea.If the

If extended page flags is not the ideal location (I chose it in this
version only to get something going quickly), we can look at maintaining
per-pfn allocation for the required hot page metadata separately.

Or is your concern specifically with scanning? What problems do you see?
It is the cost or the possibility of not identifying the migrate-ready
pages in time? Or something else??

Regards,
Bharata.
