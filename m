Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E0535D8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899230; cv=fail; b=mvoT3cVZ8lCShDGzVvV9pPR2RWjd9U9kCuOX1lz5QOtTF2/ENhuloRomTfxjCvVQaJMY8X7gU6v2D6uj7bUC4GBVwB44rFh9c3nC2Yz6HsTc2rKcs7j39yVNV5/Ym3qQ8LfNXN8NMWwN/elPJKfVeFLSi2xGK0gYIp4+EblvUgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899230; c=relaxed/simple;
	bh=RaJspr52WXM4OpVSbHkDrf1p6T8xG30mpM21M+sJcs0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ni6zww4f7TqB1HKDOZZpV1kUk1z4k8J88x2kbL1TDUSWouNssMEZOVvw6SEcYzU3oIJpslkdCfyqrJgbWPNH2OQn0/p7cAkAEkutrLAEhHA1g27KLp11fa8jhhBY3B3tW9WztZzAG8A0wjduT21DBNxaZg87X9UE8oyXMitt3Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XJPpP4Ig; arc=fail smtp.client-ip=40.107.236.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XJPpP4Ig"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZ25jS/NuZBlwCE+kM9meBuVlvVTr4UbHpBJ0LnsoS2LUexShKYq7cA3f4IuRlzLZzdjuhEcPIJv7Bd3yawktaKOxYIzWMubG6rmSCu8YMALGl3nbBQZQoj6L+P71qGBKzx7ngZ9BFO6JSXrMETFC9vjXM28sZUZyBYXkkaBUdpxmbzyv56icm70YuOnPkykNGQPZuh7evixyk/sd1RLCdykHnG9qvsg7Sma3VWXxy54QL9JxHrRMdPjvxdAf55uI1Xa2400AdaOu9KGE9b8ITEf9AesESAze+KfHIQqSSUl/YFq26qVakEeeYSK6PSTGEIeZZRwrjoJ2iDAIEBDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SttUiIe44A72Q0jmujz48uF0TqZ6HMrfr/TOiYkom0=;
 b=WmUpxaq1zOKGlhihog4fjK2P6a7dGGgSEVXS2dFmNe+hfIS0dU3+m0LHNfqWRMmVMQyqonoKxd5c/WqK0LWWLgmZGLFypUlvMszA6LjESFPPfT97l74kI0xf+wydJH2HwMzzsq54kZps2VDMFD6dkiiU8163ewB+InIOuGzT9BhKa5vhK61Cl9sQRTMmsK/J2C0xfPSB7gbhl5ilW7QM3Khz1o1waUJhcSIhjWSbwAExYug31pobFFdeFBaFuRB+PkMz/Fyn2pKvtOovH0BNdcMW5PY/mg0Z5x+AHYNMen+z4OhOFLimR7WJLZlKuwEMgoy3dvhHFIS/2sNn9tq+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SttUiIe44A72Q0jmujz48uF0TqZ6HMrfr/TOiYkom0=;
 b=XJPpP4IgMFVzONjo8pjtEu/xjFs8tCzz6fty/duDhelWMACGbgRGCmSd9g5QN65goLsFBuBSWR2zfQN+Jywg1MOnypHZF1Dhb7pyAnrB6CZSjLBLXKW03DdA3yf5hy6mTlSLLkV3VYOwSOPvwI3sEHXWPR7nKaPet2cDNfF2uxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by BN7PPF7B4E3DFF8.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 22 May
 2025 07:33:45 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 07:33:45 +0000
Message-ID: <df71c9e6-52e2-4afa-b0bd-42f5aadbad71@amd.com>
Date: Thu, 22 May 2025 13:03:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
To: Gregory Price <gourry@gourry.net>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan.Cameron@huawei.com, dave.hansen@intel.com, hannes@cmpxchg.org,
 mgorman@techsingularity.net, mingo@redhat.com, peterz@infradead.org,
 raghavendra.kt@amd.com, riel@surriel.com, rientjes@google.com,
 sj@kernel.org, weixugc@google.com, willy@infradead.org,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org, david@redhat.com
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <aC6gOFBrO0mduHrl@gourry-fedora-PF4VCD3F>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <aC6gOFBrO0mduHrl@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0196.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::8) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|BN7PPF7B4E3DFF8:EE_
X-MS-Office365-Filtering-Correlation-Id: 0562136b-1f7b-4deb-6c95-08dd9902fbde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0MvWkpDQUo5dUxwL1hGUnk4NExoTFZlTWQvOG1TbVlHYUw1TjhOblJJYm5T?=
 =?utf-8?B?b284dmJFR2lscXBkR0xkcjVlZGkwUzMzaG1xZVc2WnpTR1VJTE1tMVZ4aFc3?=
 =?utf-8?B?aUlPV1F0Sjk1QUQ2b3BRc1FNaGgweTBzZW9oSFluMmovYmgzejFNb21NYUND?=
 =?utf-8?B?Vnp6em11SzNBNGI5VU5DS0dNNzcyaUNyZEtSMFBjTlVQbWRyVjVDOUVOcjFn?=
 =?utf-8?B?YW9BcE1mRGZLY1dGTTZ2M2wrOWpLaFphY3cxWm5xUDFXMFNJV3RoQ2taWFJr?=
 =?utf-8?B?R1h3N3prVmkrMjF6dmtnckFTRWRaVy9iaWY4akNabWpxZFBPandhNGRNcTZC?=
 =?utf-8?B?NlhlSlFIcEtTb0ZreFBFS2xEVjBiY2F5Wno2SmtuQU9BUEZSZlBjem9HcVIw?=
 =?utf-8?B?RVZGM2tLblZsRlpVUTRidXZaWWpWZVJla3NuaUxJcWljclBueCs1dEY3YVdS?=
 =?utf-8?B?aXMwcmpVWXVWLzVjbDMvbHltRWk3U1FiNWZSUHhRbEF6UUQ0OW5scyswTWJo?=
 =?utf-8?B?Tm05OWVMZkN1aXZ1YXJqYkhGdFZvVUZsSVErbVYwL2NFb1pVVHkxQ1JBTHIx?=
 =?utf-8?B?ckU0MVVOZHVCc3c3MXJHRzB1N2JIc0VpcTZrckh0RU5CNnVDRjBScVZEdGU2?=
 =?utf-8?B?UjBXbS9LUnR2TExpVzAyU2xQM1FRa3VGeVhTSVlYVEFxeWFMZnU4S3lHV2M4?=
 =?utf-8?B?QmJRUEdKOElMNUV4MUFzZk1NWXdaOGZlWFRWaVNRNG1KVW5uNU42TXlPTFZX?=
 =?utf-8?B?QktWN205aExkTWxHTDFvV1FCZUI5aENybk1pUDI3VWhLZkJidFAweDk1c09I?=
 =?utf-8?B?WTlyMzk3S3ozSnZlRUFJUFBGK1VEcnRETENwMmpITXRzSTVlMU9NcElUMjk2?=
 =?utf-8?B?TlNCc0Y4Y0FRRkhmekFDOUdWNVBsdUFmRTgxOS9wVnZpWXFpczdFTjZTYm4r?=
 =?utf-8?B?cytvTlBoMytpV0thTEJOSkIyZUM0UVhNd1dnQWJyK2k0N1p2VjdBbGZpVWtZ?=
 =?utf-8?B?R1I3K1BqUlptY2RGczV5ZXBBLzhrVDZRUW5NQUY5ZHZPVUY3cFlPaDN0QnIz?=
 =?utf-8?B?UThjRkhJeEdKOC94bGJwWElRMFdUK0p5TXpjK095ejJodTJmZ3JmZDdrR2M3?=
 =?utf-8?B?ZkdacFJHaEdaZUtUeUswK0V4eTk2TzRwL3plcTNvTGFhRWZwUHNNOEdmbzQy?=
 =?utf-8?B?T0VZRU1SNzZxUTJRZ24wTjVQVDhzS1VMRE1ZVVpYeXBycXJSWVpKTWtiMldW?=
 =?utf-8?B?QWdEZktaaXUvRUVaZy9NSy8vUjVsUGhGTnN5NlN2NUxOcnNRZFpnNDEzZHZQ?=
 =?utf-8?B?VFhaUmNYOXhqUlRobXdNWDRsVCtXcE5aZjJlMFZabHl3dG9McSttS1Z3UnJq?=
 =?utf-8?B?NVN6bi9WUXA2ZTRGT1Zha1FXYy9NUXBpUVlDNjljVDBrQ2JaSnZGcktqVVFx?=
 =?utf-8?B?aHFUcGttMDNzS2F6NUUyOFNDcnhNL3F2QnhoQ3Fnd21VUWVBaHhRMG5RalFn?=
 =?utf-8?B?dmpUYnh0VlpSNnM4aXBFKy9JV3NoQWlRbUl1VGlmaWZsekN5STlMa2hTdUVW?=
 =?utf-8?B?aHhPc2pvNVFZRzlMcjNsQnV6STIyZVMyN09SYktIMTVHV0UyZGV1T0VjajBh?=
 =?utf-8?B?LzNieWRLM2trRnRPMWxZVndEdlptV3NaelRZNituc0VzR0JMVlBTako4ZkdT?=
 =?utf-8?B?WE5TZ0ZUNTN4RGh2bTQxNnRiUEgzTVM3K0p4T1VpMGVjd3dXeDdRczZvRm9H?=
 =?utf-8?B?dzdxdDV0bDFFd2ZUdGdIT0F4QU04Y1BMRENmbTJ4NWVwL2FDaDV2T2orRGM1?=
 =?utf-8?B?amJUK21pYUY4ZjlEdkJEOHhhc3RBODVGWXNKT1JqdzFKS2VKTjVndHZTOGl6?=
 =?utf-8?B?b05tVnc1b05QY0drRWcxY2g3dU5xOVpyRksvOGdrQlVZRm9BTkNSTzdFaU5G?=
 =?utf-8?Q?q/QvtPkJHcM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmNEZnc5UGYwN3lSZnpBd1V2WUNYQU8vaEpGalY4R3Q0alk2cVpXVUhRU0Vy?=
 =?utf-8?B?c2hZcS9wSWtha01DdWNXL084Y3NOY1Uyd2FQa09nRkRHS1E2NS9qZEUycFRO?=
 =?utf-8?B?WEJDWkt5QjJhNFROb002OE4vR2c5aTNBVFllN2NhNWk2QzhPdGZpMXErL0tw?=
 =?utf-8?B?ekhFNm56UUhPdDM0SGRVUjlNR1k1VXJXazBWR01seEIwWW5mcjhTRXhFeEFQ?=
 =?utf-8?B?VU5md0lNVEhMSEp1RFd2NEFHSG9ER1AySE4wK2h4RkFqUWUySitydm9IaHU2?=
 =?utf-8?B?WVVpYmM2V1Y3MWliQ2xmKzNrRVFnYWhwQXBJUjV0MkxRRHE1Nm5NdjlhOHpE?=
 =?utf-8?B?VU40RHpiYWx6VmxMWmkxcGVxdG9HQVdJdjR0a3h5dmxPNGRtUE1Ic2tmVFFO?=
 =?utf-8?B?SVNDVFc2OTN0cFNaVGVPZEtsQmdMVDREYkUwbk5CYmttSWM1UzNGT1JDSVFw?=
 =?utf-8?B?ZFQ0UXl0d3huSm1nbkF5T295LzFWb2hYbEM0bkJFM2NYdm9kWkhOMmNJejdU?=
 =?utf-8?B?NnloNzNlRzVTR1Vjcnk2VlV4cUFWb1I4WDE0KzN5YmZGVzRqaFNDajN4WW9J?=
 =?utf-8?B?aHlIajhXWFB1T3FlMGdCdlM2WFZ0YUlTTkt1MXJwWlBiWFUrUmttVHRNcUlt?=
 =?utf-8?B?amp3OStEVFVncVV4bHE5VS9yL2hWTExZY3BPbktFaGxqYVdnOFE0Mm5EdG54?=
 =?utf-8?B?emRoUUoxUmM1SitUdElkU1VGT0xkdndPMGVrVmRJZHRZMjlJZVpnai9YVzA4?=
 =?utf-8?B?SEZBa1ZPTmNKSlBvZTdNeklHVkZQa2ZMcEJYNlZuUjZkS3pzNnZ0VTlvQkgy?=
 =?utf-8?B?VzJZRFFnMCtzNXFzNlNQdjR2Y2IyMjNBQUVjVzhJQzYrVEN3TnFrTXVmMmQw?=
 =?utf-8?B?VFZkbUJTcVpVdWE2aEorMk1EU0pZai81YXhVa3plcEJOZUx1OEw0M1F4dHNM?=
 =?utf-8?B?RHpkZEJQTUlBaHZPcUE2TlhRazFKY3dVeTk0Tk9jMXA4Z1A4eGZiR2lUTlFR?=
 =?utf-8?B?cEJhK0ZIRS8zY3dTTVorY0NGMHRTa2tuQm51QUd2cEIrVmZvRjFESmRoQWpx?=
 =?utf-8?B?UWR6TTJ4WG5zdU1HSm1mVHNHTDUxcEdaY1d4ZzJOQ3NSNHF0QTVOdjJtTEJk?=
 =?utf-8?B?d2VxT05NY2JjRzJZNjNOM3ptZk1WUjNFQ3VNNS9zOFYxckpLdVh3TlNPb2dx?=
 =?utf-8?B?eU9La1JzU3VUOVNwTW9ma1RVblh5ZW85Q2E4T202RHVRa3c3ZWp4dWFxQTVR?=
 =?utf-8?B?eUZhM1g1MEJDZjFlNkRIQkVSNUx6TTE2cWpzYmw1d1VHYjdkWjB4MkYvOVNj?=
 =?utf-8?B?V2VmbXQ3b3EzcHBBRko3QnRNTGNPMHZwSElNaXd1NGdIeVVuODR1czA5M3J4?=
 =?utf-8?B?Y0NwLzVwYkVIb3crVTBuRDlmUjc2bHduVWFPNkFsM0N1UzJYL3JyNGVHWWRU?=
 =?utf-8?B?RGdXU0hiMHYxTWg1TUFPUnBhc24ybWJwSTRwNFRPTjdaQmpHbHJkV1VmNmxo?=
 =?utf-8?B?Y0F2U1o2NXViWU93TmN4RHRNRUpVWDB2TWJyYkZ0bEVjRmJvaVkrM0FSQTFQ?=
 =?utf-8?B?Q2F6dnhNTXBlY3Q4c2VNdTZWVFo5ZWhtNEJQZzVobmNWQ3ROUDk3SGxROEkv?=
 =?utf-8?B?eGRkd0RJK3JrS0dLY3FWMmYzU3VTcVFqVGpVcDhRbk01NnFpc2g3N0VIeGEz?=
 =?utf-8?B?MzZjc01pZTcwQmM0R0FkZ0Y4VFoyRnBiZ09qKzdySjVOeXg3N1lJbmJWcjE3?=
 =?utf-8?B?Zjk4VW4vRzFlQWpiMXV6eHgycTN0WEZqODg5VVNmcFovU016V1owYmlLcVg4?=
 =?utf-8?B?K0NyOTRCWHF4TFNCUElWd3lNY0phajByTm1NOVlnQUNrVHdBb2dTRnBsTDNP?=
 =?utf-8?B?N3g5KzdFOGVoSER3bWd0aHlpeEd3UTk0OFQxdEVzMkxoVTJ4amJ1cmx5enNm?=
 =?utf-8?B?Zk1aRHJtaHRCYTFsajU5WDBJOGJoZlpOOENXV3VrL0ZtbGlROGF1bXNDN2hT?=
 =?utf-8?B?SG16L3IvTGp3cTRpWi9qZ1ZCdWMyRVFUeitDTk8rMmIwdE9ScUNEcUl2eVdW?=
 =?utf-8?B?UXBySDcvWlJzcVhaeHoyUGJQdjFTcXBuaTVGYi9BU2R4VzVtak12TitVamh2?=
 =?utf-8?Q?RW7hunq2nbyFIkshadIFeYGFc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0562136b-1f7b-4deb-6c95-08dd9902fbde
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:33:45.5614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mGsxBhEvQFsuVM93vY5RbDqCf4nL9o+ALdNVnsdghMGbgSV3QP8SXxrqyah+PYYLMMXzoKHs/rXkxPB/tCBPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7B4E3DFF8

On 22-May-25 9:25 AM, Gregory Price wrote:
> On Wed, May 21, 2025 at 01:32:38PM +0530, Bharata B Rao wrote:
>>   
>> +static void task_check_pending_migrations(struct task_struct *curr)
>> +{
>> +	struct callback_head *work = &curr->numa_mig_work;
>> +
>> +	if (work->next != work)
>> +		return;
>> +
>> +	if (time_after(jiffies, curr->numa_mig_interval) ||
>> +	    (curr->migrate_count > NUMAB_BATCH_MIGRATION_THRESHOLD)) {
>> +		curr->numa_mig_interval = jiffies + HZ;
>> +		task_work_add(curr, work, TWA_RESUME);
>> +	}
>> +}
>> +
>>   /*
>>    * Drive the periodic memory faults..
>>    */
>> @@ -3610,6 +3672,8 @@ static void task_tick_numa(struct rq *rq, struct task_struct *curr)
>>   	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || work->next != work)
>>   		return;
>>   
>> +	task_check_pending_migrations(curr);
>> +
> 
> So I know this was discussed in the cover leter a bit and alluded to in
> the patch, but I want to add my 2cents from work on the unmapped page
> cache set.
> 
> In that set, I chose to always schedule the task work on the next return
> to user-space, rather than defer to a tick like the current numa-balance
> code.  This was for two concerns:
> 
> 1) I didn't want to leave a potentially large number of isolated folios
>     on a list that may not be reaped for an unknown period of time.
> 
>     I don't know the real limitations on the number of isolated folios,
>     but given what we have here I think we can represent a mathematical
>     worst case on the nubmer of stranded folios.
> 
>     If (N=1,000,000, and M=511) then we could have ~1.8TB of pages
>     stranded on these lists - never to be migrated because it never hits
>     the threshhold.  In practice this won't happen to that extreme, but
>     in practice it absolutely will happen for some chunk of tasks.

In addition to the threshold, I have a time limit too and hence at the 
end of that period, the isolated folios do get migrated even if the 
threshold isn't hit.

The other thing I haven't taken care yet is to put back the isolated 
folios if the task exits with pending isolated folios.

> 
>     So I chose to never leave kernel space with isolated folios on the
>     task numa_mig_list.
> 
>     This discussion changes if the numa_mig_list is not on the
>     task_struct and instead some per-cpu list routinely reaped by a
>     kthread (kpromoted or whatever).
>   
> 
> 2) I was not confident I could measure the performance implications of
>     the migrations directly when it was deferred.  When would I even know
>     it happened?  The actual goal is to *not* know it happened, right?
> 
>     But now it might happen during a page fault, or any random syscall.
> 
>     This concerned me - so i just didn't defer.  That was largely out of
>     lack of confidence in my own understanding of the task_work system.
> 
> 
> So i think this, as presented, is a half-measure - and I don't think
> it's a good half-measure.  I think we might need to go all the way to a
> set of per-cpu migration lists that a kernel work can pluck the head of
> on some interval.  That would bound the number of isolated folios to the
> number of CPUs rather than the number of tasks.

Why per-cpu and not per-node? All folios that are targeted for a node 
can be in that node's list.

I think if we are leaving the migration to be done by the migrator 
thread later, then isolating them beforehand may not be ideal. In such 
cases tracking the hot pages via PFNs like I did in kpromoted may be better.

Even when we have per-node migrator threads that would handle migration 
requests from multiple hot page sources (or single unified layer), I 
still think that there should be a "migrate now" kind of interface 
(which is essentially what your migrate_misplaced_folio_batch() is). 
That will be more suitable for handling migration request originating 
from locality-based NUMA balancing (NUMAB=1 case).

Regards,
Bharata.
