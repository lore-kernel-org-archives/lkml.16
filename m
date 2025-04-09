Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393712C190;
	Wed,  9 Apr 2025 00:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159294; cv=fail; b=Uu31LD/dxApzNcKRDTsZZxpMkSZXTCcwe30GZTSbTVLWHCfTd77gtp/CnSUDmEl/g4DAGYyl3CcD9iw482IFp7hLSV96YwpF6tErj8PsUyHpTo06Un3TEAsUxHeGcf2Wwi9NHmBSe6s7eEotfBDehDJn349gwQfIHSXpOUbZE8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159294; c=relaxed/simple;
	bh=G7mHPhzIIBsnWUwhwAipFZmMGKLm4et6dIBFIFO0/qA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BoOBNa7pGcsRSKnkLSyTpgzAUbOgy2jEoJvCid3fLx9was3poQvhfd6oCA05EZvnKTja2TWPDU7cyjRy2/+HK5sHoFTpfrxCdLmsE9cdgL/uDkOKyu89QY+7TWAgJ1wViiAbeJ94Eymv6L9dJ81w0WmDpH5nbn9U8foU9Mvd8KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KmEi2ItH; arc=fail smtp.client-ip=40.107.220.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KmEi2ItH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcLTOISW+pwxfjA6zf5uD1qGFLXRWJIGjWGI6l+OvsNS604lCYiIzeKWeXx8ZVa5SUd4AJwB2nFm7rBo0MIJQqsn+5Ubnpb4hzp/haj7Cmnm4PCL9QQI6jCdyk4VTBb6gMEPj4KhBu1weTOM0+5hSABeYvqXF1Qk+l1Zr9Ge9VUa85gYiejD/fMxNgdOb2yQJwi606FZlQd2K1UjQS3QaxMeAI6H++3z1veoTBHw1W2StXcGJErmkqu/d8xPl81O0HRe5wnHiYfp9CFVqoSbuHy9mMunFVeNHF4vhr2g+RWcBcot9O5xjhF6Ch0odcFGLhAwAm6nvP7mkK9+Z+qdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDwVYywNgRR1pQqee6WlrPoVYjYXFI7U9iUYtH1Be5w=;
 b=G75/wLr9nB6XLpv+t18FLZjntpRhTgxaFqaV5Im9w59tpn4Yu6cRKuXVMhkOJdjnyMsv/TbL/ehMzlwcBAUpc9lxzEgjRHoscS3OC+JM4kLp2x8BKpVIPc4MBx2d+88nhU5VZom+wNtdqXqSQtR3SjQ9f+mx5gaccavYDpdjC8jKw3CNd7bXbT6D9M0nkcdLzKp4fsjH1QKGt5aEG4Wbs22KoODKD+RTgBZEbRMGC2xXA5uOBOo9e2CbzeMucyYlFLOUVJRSku1GXRXZ5VE9aYsoJ5GLqNwFMj8XfrOrwfKR16tKBkyLnsgxRYuOaRySPgTM+NGmC3hpqDiCY9a6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDwVYywNgRR1pQqee6WlrPoVYjYXFI7U9iUYtH1Be5w=;
 b=KmEi2ItH2ergh+JEhrmgSI0dLDFryyLm0Ff6E4HbN3OoFgwEPZNO55rkxJ/rLP9Ik4mdPQ1Hj3kKKYI72NM60P9TAY664t/Kxv46DvYPPa42krzDavHZvJ+0icvcv7HCJSz2H0+hFywzi876DsHOcASqNiNeM6DkY1f2UK6V8fg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH1PPF4C9628624.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 00:41:27 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 00:41:27 +0000
Message-ID: <46e40771-c73c-4ceb-acc3-812693f98f19@amd.com>
Date: Tue, 8 Apr 2025 19:41:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 jpoimboe@kernel.org, daniel.sneddon@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, sandipan.das@amd.com,
 kai.huang@intel.com, seanjc@google.com, xin3.li@intel.com,
 ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 tan.shaopeng@fujitsu.com, james.morse@arm.com, tony.luck@intel.com,
 peternewman@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, corbet@lwn.net
References: <cover.1738272037.git.babu.moger@amd.com>
 <7c135464-d859-459b-b86d-e8c18f106fc4@intel.com>
 <251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com>
 <4a98eccf-4d31-40ac-8112-c89cde7a1c6e@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <4a98eccf-4d31-40ac-8112-c89cde7a1c6e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:805:66::39) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH1PPF4C9628624:EE_
X-MS-Office365-Filtering-Correlation-Id: 51180c42-3f1d-453f-5eaa-08dd76ff4339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3hrbDVWWE40d0wxd01XaVYwSjd4bWx6dDgwU1BwbjJ6VC9uUmIrN0w5SHVB?=
 =?utf-8?B?cm5uclJQV1FDaDFMQythK2diNjMvemVmS2JFVWJLSHNFOCthYXlSOGtmZ1Bq?=
 =?utf-8?B?blBxNVk2ekZBSExJc1EzcDNBWTc3V3V4RTJSMmE4OVV6UmcweGNIdVY3U2c5?=
 =?utf-8?B?OXB1OTlra3lybDZNYmFEbXgrU001RDQzdnE4WE9PNllwL0grRG9YOEVjTURt?=
 =?utf-8?B?N1c2ZHRrbVBYTGZMd1hPRFJVQmx3MDk5VVIyZnpLajJ5S2NvbkhTZjk3OXRR?=
 =?utf-8?B?ODFtaFFJSGRvNUM1dUtrNVQyZ1F4ODN0M2Yza21hSHhLa2tzYVVOR3J4bVJW?=
 =?utf-8?B?VGkxUDNpaExPSjBQWldvNHBnZktlM05Ic3Q3S1pTZmdFcFJXQVpPNnFJRGdq?=
 =?utf-8?B?emhEbngrVTFZYkFKdkVwdDl5elRoQXhTWVZkTDNQcjhFVUNZMWFUck53eDI1?=
 =?utf-8?B?OHMya00yMlNOeE9Vd01pWmJKL0dFTTFkZVA3bllMSWJ1QjgzZnJTZzBQcERz?=
 =?utf-8?B?WXRxV004UHZSVmxUY3NlKzdIY3N6T0xKM3BOdC9TTytjWVdaTzVsMngxMzFG?=
 =?utf-8?B?Vm1GdThGd2MyV1dDOFRYdUZvb2M4WndYNEdQYVF1N1hFTllySDVkS1dZSjNX?=
 =?utf-8?B?enlkS3YyeDA1dlhhWmdyOHFZdXY1L0dyWmxqWjZTT095cTd3T1VlUnltY1ZO?=
 =?utf-8?B?RHFLbnVnSnZRamJMVzFIbTZYblIraEg2TFI3UjdSaXdJcGpyRkJ0K3pkZTE2?=
 =?utf-8?B?V04reGhwVXZZNjVLNU1BakxnNUFqcE4zamJwaHR4SGdVNXhaNnhZS3ludS9J?=
 =?utf-8?B?ZGJ1Q1dEcThWMUg2ZHdjUFBwN0xDVUczZXRNL3NaZ3lWVzFlSzkyQzZtZFUz?=
 =?utf-8?B?cTMxNHQvZy9Pdlg3WVNyU0ZrR0hEeWRYdDBxOHVYM1FRU1VrVWgyQ1BZcUxI?=
 =?utf-8?B?bUhJajd4eCt2V216WjcwRkE0OTlaUG1SNmR4UTZqTEdpT0FqNlN1bDAzZ3Fj?=
 =?utf-8?B?Qy9NQlNWaTY2VnhXdVhiT1QzNzFtZkVlaFFaaGRwK1R2c2NkQjJSWXpDdjhZ?=
 =?utf-8?B?aFIrcUg4T0MzVFcrRzB6YWVOMi9vdUpJMDhzcWd0RFZBVjZ5YTNkb3g5c29X?=
 =?utf-8?B?aE1xMmdRRFpkdG1PUXRsV2ZqSVBlVHJ1dW5yOTFGNmg2SVJta3graHRvSEd1?=
 =?utf-8?B?V3RWVUo2Nm9Rc0FiR1lwbVV4Si9kRE5JY1h5WFhTcDJoNWg5TzJBMms0NFEx?=
 =?utf-8?B?MG92Y0FsRlFKdWJ3NE5pK2hiMHFQNzFEMDQwMzlMQU11dWJhdmt5SVNxMVhi?=
 =?utf-8?B?UjZrcmFpeTFDdzQwWTdJSzBlUGVDQzFQZmg4WmdJakUwMjdpa20zK0V2aWRW?=
 =?utf-8?B?aUhOc2dZT0FlVHZCVUwxU1BzRUtGRmtmc004dzNpTHZobVVnL2QraDgwZFdq?=
 =?utf-8?B?NHBKSnhaenFlTnZBWmNmVDRyck5xUHI2dXVoRlliTTBIcC94NHFOTEIrZ2dB?=
 =?utf-8?B?ZTVHNHB0U3ZPM2VaNGdxeGtKWUJTeGRqV01TeVFnYW10MFdvNm91RDMzeGZT?=
 =?utf-8?B?Q21pRVRXaWtvcWg3NmlQai9NcFB2clJJN2wvZzd5M01sTjR3Q1VNZ1lnN1ZB?=
 =?utf-8?B?SzMxeW1UNUxGYkh4WERIdkU4UnZPb2FxWWJrWWRhRnA2djRCYUdUa25VSE41?=
 =?utf-8?B?dFJhRmVTWkwwS1U5a0JVdzk5UC9PWEI0VENtYjF6emJaaTBMdTU4TEtkMWlq?=
 =?utf-8?B?TVZiTDV4Sm9hREcybnBCQnB3cEdMOUptOTl2bjJaR0U4WitiaEZyYkJ5Rysw?=
 =?utf-8?B?bFRNa0RXQ05ZK3RvcG5GMkgvT3Y0a1EyZzJvVmprOGltYmlpa1dEc0s3RHU1?=
 =?utf-8?B?SXBWSi9GQTdIbU9Wamlod0NUYWtmTkRNT2NqclNCM1BITHZmeW5rOHR0a0tK?=
 =?utf-8?Q?uo936A/D0yk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWYza2hHaWZ2a3B0bGMwMU5XTVNoSi8zKytlMmxuUFE5WVM0MDc2a3hkemx4?=
 =?utf-8?B?T09ScCtlT3N0L0tOU1BlMUg4ZHB2eFFPcVBUc2M1aEEyTDNYcHBqT3dvc0h4?=
 =?utf-8?B?UlVVdk9aSUlIeUZFSVFvNXBxamkrMmRBTW10RER6MnhIdElQTW54S1BFRlY0?=
 =?utf-8?B?U3ZHb3p0NUhOM3UwUmg3Nk9WWVNKakUxRjR4STB4ZHB6MXVheWdRQ3B0ZUFF?=
 =?utf-8?B?UFcrS0F0WHlYT3M5SWpIeVExc2Rmd01LNU4rV1ZKTnJIaFo4YzNPeUNmcGR1?=
 =?utf-8?B?cWhuMWVvMW5OeVJUT3NNTk9kajAxL3lBZENvWlkxM2g2Z1l2K2xqMnNGTndt?=
 =?utf-8?B?RkFlTytnQWFjaDV6V1dTcVpYanJ0c1NBQWViaXZQSHB3eDIralNBaHZpcWFl?=
 =?utf-8?B?QXl0TmppVjZ2RnJzeGc5bk54NUF4dDVraERSeGRCdFBYbisramJ5aWlrUjQv?=
 =?utf-8?B?Z3lVOHVzTUNXUHByRnRUbERNemczTEgxeFIra2N3b0w1WFZVd3ZBZzhqYmFQ?=
 =?utf-8?B?RTZHOVA5OUxsVS83NXdqRWZWU2phS2ROMlpLN0VxNG9YOWF5OGNsbll3RkNn?=
 =?utf-8?B?cjBJMDNwdzJKNDlVSmlPdEMwWEZ6Q3RibTdZYVJkaXpaZnZuTE1qVXdOWEFC?=
 =?utf-8?B?VHpqWUV0UnRiVXc2UWRhc2RJUWhQbHpxYWNWV1VmZ25OT1hzL0dUTDIxaXlT?=
 =?utf-8?B?K0RDNDUvMzBtMGhCcU5XUWZ0emxlQmlzUm9oZDZlUUVxMnY1QWFQQVk5OU1v?=
 =?utf-8?B?bW82eHg5QVVEdVBKS2tIQUNJRVRRays4alFCejRPemRTS3pUSHdXNUI2N0NX?=
 =?utf-8?B?YXhKeWlQemlWbmpCc0syekdRd0NZYXdNbnM4TjZTTGxiTXRZdWgrWEFuZ0cv?=
 =?utf-8?B?VWo3aFBkMlNvR3A4NHRzVEtSLzJuME9sczUvUkJ5SGNTQTFBMXBRWlVic1dG?=
 =?utf-8?B?cGwyMGhlUit1VnJTc3k3T3dvNFdSYnpTUnhuM2ptakM0OUVIbHN5M0MzdFgv?=
 =?utf-8?B?RSs2OEhjQ0pQMHFLL3FCMFVRbDlSMUgyd1lPd0xqWVZOSVVuRUR6QzVBeHRs?=
 =?utf-8?B?bmVkbFNnTFNWVHdXWW0rWEpRVmhaMENLakczSDE1em5RMFVyZkg5VTAyVU9u?=
 =?utf-8?B?MWRLcjNZZE14T0tKdWtIYXRDRWROL2FXWHJBcUptZmNXUWNjRkVrZGRLTmhS?=
 =?utf-8?B?dmFvbW9BMnBnSGVaaU1NQXhCQ2R6UEZERER5bWVSVnRmR0p3ODBYZmVNY29r?=
 =?utf-8?B?K09DeEVTa2UxbXp2NUNHNjgrdDdzWXRFSm9zWXJ1T1ZvTThGbUNDUTRGR0U3?=
 =?utf-8?B?eWhPcDV0OXNrNXNaRW1iOTU5ditidWxLVXk3QzBCREVXbVY1S3A4MFVrOGhV?=
 =?utf-8?B?Q0RtSUhOSXQ3bjdqM2ZDSHNaeDd1dSs3T2JReVExRzRpbklSaTF5clcxa2NE?=
 =?utf-8?B?RjNaeGtWb0JMbUFGaEJkczJGbEFJK2xCU1BlazhpcWd2dGh3OXFSdHFOcmg2?=
 =?utf-8?B?ejJGelJYUWNRSGY2RmVDVGRFdEVOdVhnNE4xK0dKOUhiYTM0OG1YQmp1a3Bt?=
 =?utf-8?B?VHlTcjJqbkY1MGhsdFN0YzdFWVgvL0g1WHVtWTFwcE42dS8xNHdnN0MxVHNx?=
 =?utf-8?B?M1Q2YkRVaWZhQ0lRNWpsUHV6c2hMRzZSb2l0SEF5MndwNEFIeitwcFdZSnRC?=
 =?utf-8?B?MFVhRUlxb2MxMjI4bXNDZGMydG5wV3Exd0t1cjBZNVphdFl2ckNUWng2b2NS?=
 =?utf-8?B?UjdsbEtXYjhUN1NwbXNLNkQ1YkZtNnE4ZEZLSnVGV3haZVNMRldxMlk3TDFQ?=
 =?utf-8?B?eWNQTDFDSmRFZHBqQWhTRU1DRVNHTk0wOEhtdCtpQ3dlYWNrb0lSamU4NUJV?=
 =?utf-8?B?U1MvTlpjN3pxVGpGMHlXa0FCWEJKRDdIMnhtMlVXYzhKZW0vcjN5ZVFVTG0w?=
 =?utf-8?B?UGlRRVdISUNWMWRXbWpnd01VdWxOVnBpbTJoaWxaTERkY2ZZMkx2V0NrT1k5?=
 =?utf-8?B?SEUxS2tEVFp3RUc4RWV5aFMxdkxBWlJTVDlZanQ1K0ZuV1VXOHExSEFHbitQ?=
 =?utf-8?B?VDdmNWR0Zjd1ZGNmVERmQVBEOFlzRmFaSzZKMlpJRVJRK1kyMW9ocmMvVGZx?=
 =?utf-8?Q?hPgw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51180c42-3f1d-453f-5eaa-08dd76ff4339
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 00:41:27.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWC3z0Q22+VqrN/CiovSSAPwbLw10Gg3sw65dgyZpbiIczz1ZRGDax3bVbgEHlQS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF4C9628624

Hi Reinette,

On 4/8/2025 4:44 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/7/25 1:12 PM, Moger, Babu wrote:
>> On 3/21/25 17:50, Reinette Chatre wrote:
>>> On 1/30/25 1:20 PM, Babu Moger wrote:
> 
> 
>>>>
>>>
>>> AMD also supports what is exposed to user space as "shareable_bits". According
>>> to APM:
>>> 	Depending on the implementation, some portions of the L3 Cache may be
>>> 	shared by other system functions or used for some other purpose not
>>> 	under the control of the PQOS feature set. The L3 Cache Allocation
>>> 	Sharing Mask returned by CPUID Fn0000_0010_EBX_x1[L3ShareAllocMask] is a
>>> 	bitmask that represents portions of the L3 that may be shared by those
>>> 	functions.
>>
>> Here is the complete text.
>>
>> The L3 Cache allocation sharing mask (L3ShareAllocMask) returned in EBX by
>> CPUID Fn0000_0010 with ECX=1 is a bit vector which represents portions of
>> the cache which may be shared with other system entities or used for some
>> other purpose not under the control of the QOS feature set. When software
>> sets a bit in one of the L3_MASK_n registers at the same bit positions a
>> bit in the L3ShareAllocMask, processors executing with the corresponding
>> COS will competitively share that portion of the cache with the other
>> function. If this mask is all 0’s, then there is no other entity in the
>> system competing with the processors for use of the L3 cache.
>>
>> The "L3ShareAllocMask" is always reported as 0 on AMD systems.
>>
>>> Could you please include what (if any) the relationship is between the CBM
>>> discoverable via Fn0000_0010_EBX_x1[L3ShareAllocMask] and the CBM of
>>> "highest-supported L3_MASK_n register" when SDCIAE is enabled?
>>
>> No. There is no relationship in here.
>>
>>>
>>> On the resctrl interface side the documentation currently states:
>>>
>>> 	"shareable_bits":
>>> 		Bitmask of shareable resource with other executing
>>> 		entities (e.g. I/O). User can use this when
>>> 		setting up exclusive cache partitions. Note that
>>> 		some platforms support devices that have their
>>> 		own settings for cache use which can over-ride
>>> 		these bits.
>>>
>>> Even though this was originally used to expose the content of
>>> Fn0000_0010_EBX_x1[L3ShareAllocMask] the intent of the content does
>>> seem to also apply to the "io_alloc" CBM also.
>>
>> It says "shared by other system functions or used for some other purpose
>> not under the control of the PQOS feature set".
> 
> This is a quote from the AMD spec, not the resctrl user interface documentation.
> 
> Please consider this from resctrl user interface perspective.
> 
>>
>> "io_alloc" is PQOS feature set. I feel it should not affect "shareable_bits".
> 
> When I read the resctrl user interface documentation for "shareable_bits" it
> sounds relevant to io_alloc. The "shareable_bits" contains a bitmask "of
> shareable resource with other executing entities (e.g. I/O)" ... is this
> not exactly io_alloc?

I agree the text is pretty generic. Actually, the whole bit mask 
(0xfffF) is shareable with io_alloc.

The 'shareable_bits' is coming from CPUID 
Fn0000_0010_EBX_x1[L3ShareAllocMask] which is always 0 on AMD systems.
It will be bit odd to manipulate these value. Not sure if we have to do it.

Thanks
Babu



