Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A31C8634;
	Mon, 14 Apr 2025 19:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660355; cv=fail; b=GmUvwCi9ScClt6ve75ACxjzz4GJ8+Jq6ViFpAoSr/Db1B7oDBBeyZ4dhk3K8NuDEm3J/iZxkZ4h9u1SeSOVY+/NNcb2tCyXlyLkNz5QYRvntWmjkwf1nGjSTPiu2E+3o9hSEkwUbZrxzV/zSQWWFuqKG7E48K1CxggIZXbuw3pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660355; c=relaxed/simple;
	bh=bGk9skDbJReXaJ48PBE21fRUIQMI2mbhk76Q2kFSNd4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fu41bd8jxE1FKbs7QSvPHsTh4wQXV9aNe/bOF+rJjyhCniXiukaEh9Q3j1TQXwkPEqMxXrUxnZsnuxPAEvIkdTZtR7hVF9hIrkvUA9u7oWtRNXX8bEyyM94fkcXUMAbKyUvtSORnPQAwNULQMWL2RxOwYEMg+xu+fkaO9p97kqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5NeJr7RW; arc=fail smtp.client-ip=40.107.92.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5NeJr7RW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkgtJpMahDOo93fctff/6JSjr2C+Xwgsepd4j1xvy5ikYUfkWkrDsPLiJudJKueFZUfFAmta0v5vkjBnaddw/8auAiVDgcIzWuMyuT4N0+lXJhCGS86Kqqxb5oifWcAke9QIB4OVpkCTpynueiKpRqbBCfxMntJ33UAE+fsziRgS3kYF70iu2Vhlfrw5aFR2sqwEgKIVekjBS3PPxD0fucf1ei7E1C4xHTRXZplyhlkwWAi6G7yjcUhNlRR/O2+B5TPT6gy7sss3DIk1wI1p9t741RtvhK5TMD/Scvd2wVG3mnXKib0VHjVxXP9PCdJRC/YRZ9wR7amd+SwKAAuvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khR1WPHrbtOjKM65arR+b36QOw5wutnKBJwhW5IporI=;
 b=p5d4rmGRpaQhvVPmLTKFCJD1RcO0Vh4/VFpKSrgWtOeVIdxnTQODGK5YTDVzToz4APFzkJRJjqCBMtTraAhp1jHsqXriIqOTPXKqIOyuuHdUBrozwF44ovdvmBkV8SPJY1MAEW7JX5FPm27pWkoVwOCXjtEMGWL1KCk4I1Rl+oy5EC1upKNOtmOAHei7TiD5xCqwNghZetOB3dOBZeqrFGZ9GAENREH4jAxEWt3RuDeqr8GlzFHdA50E76Vtfu1tUsFGC/doZGRX0r1C7bIg1Bp7oul+U6nfxzRydgiUo4nb1mTBZBSF3D0yk2qZnvD6rRViqQyDkFTHfhds3t7vxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khR1WPHrbtOjKM65arR+b36QOw5wutnKBJwhW5IporI=;
 b=5NeJr7RWL5IQ485RL456LD1LXJ/nNpMwTM6tD1Sj3AqbI1A437m8inY/+1DKtEWvtcciGdHhP+N6s9d/ijIjJUD9VSQ6pOzETRa0RGoJld/FxeB62lKq+/Z6af8Lq+bMZl3fp7sFx5YM+BZ6ax+z7zntsic6sDHlHI1rthduwV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS7PR12MB6261.namprd12.prod.outlook.com (2603:10b6:8:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 19:52:28 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 19:52:28 +0000
Message-ID: <4fc02936-237d-4060-86af-79efc28a72e5@amd.com>
Date: Mon, 14 Apr 2025 14:52:24 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 08/26] x86/resctrl: Introduce the interface to display
 monitor mode
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <272948ba495f51acf707d48ef60d0ba35b4417a1.1743725907.git.babu.moger@amd.com>
 <59829882-20e4-4b94-ba46-8fa622841857@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <59829882-20e4-4b94-ba46-8fa622841857@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0167.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::22) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS7PR12MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c841a5b-2669-40ff-879f-08dd7b8de2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTA2YjJQdHBEUDNMVHNMc0hjc0c3ZURObTFMYi90REtGeFc5d3dvdTBmVGxM?=
 =?utf-8?B?RlpDM2FPdHBNRnpGbk1LNTMxSXNuTnhHcEgra0c3QUZUV1dqOTVZelpnbGZU?=
 =?utf-8?B?bk52L0JWWkc1NnkrUXl5YXMxWmpKc1hSYnE2QVRBM0UzNTNVWjc1R0poa09m?=
 =?utf-8?B?YnZXRTBDc2U3QXdBTGp2QWFZWE5kZmdVeFB3dU1MeWQzejZJQzBYa1lNTEpk?=
 =?utf-8?B?VGRtazlVUzZjTGZDZlQ5aUN4WEkwb1BHbnl3R0xzNDFWY3o4akp6U1M4TXd1?=
 =?utf-8?B?b1ovUXlMelI5TEJ0OExtWWlVL25QR2VVRE95czZ6d2NVZk9FWEtCNWZncThI?=
 =?utf-8?B?MzAvNVA2d2RmakFKNmdLSEhQSXhHdDYrdEEwMnp4c2w0MmFmVTdYRnR2K2c2?=
 =?utf-8?B?eTJjdHNSWWloRUdyV2lJSnd5L2NhQ2w0U0orL2JpeFViY3ZhUW9EWFhoaVdN?=
 =?utf-8?B?U0c1L3Y0bXBKVW9wM1lvcUlUVHVGenJOZGFGT3JZSmVpMlVEcVo1Wnd4UWVU?=
 =?utf-8?B?Z3JTMkV3M0g4bFNYVjNRd3hUQm9HS2FIWS9MY2I3WC9qYWlOQVpQdVpleFJI?=
 =?utf-8?B?SDJIbUFJendMRTNvMUM4VmhQMWxDYVZ1RmRqUkxucnVFc1R6TjZ6cGl6NjlN?=
 =?utf-8?B?NEVIYzZSVGNBYm9hM0l2RHJ1QXpCbEVsOGtSSis0MmNnS3A3Rmx4b3Jwdmk4?=
 =?utf-8?B?QjFIUFZuaVRCQitiWHhyckkvNzNWSkVIL0ZaN01wTjBWeHlFL0Fheld1V2dI?=
 =?utf-8?B?d3pUUlpudjVOb3o1SnY5cEhGQ3V5bDNKMDVyVHBta2l4RWUzTTBBQTNzbENO?=
 =?utf-8?B?azYwekQ5ai9KQzNiL0tPMUhRUE9LNHFxb2xnUWNCd1pwWEo3cWltdDk5dFUz?=
 =?utf-8?B?OHJFNlhveExVQWlSYmdoQVB2WHVyZlk2cGl4dXRQbnl6S1NsTERFVE1ZaGFx?=
 =?utf-8?B?UHZNbHFXL2xXazBIL2lwdERwdzRLL1krVWhSdlRsZmVCUWZxR1FUMm9BbVRH?=
 =?utf-8?B?OE5GcjBqZ2Q2Qmh3V1B5WHkxMThBSERmaC9GNEpaOXNPUk1YbStDQVJwMzJG?=
 =?utf-8?B?NnZna0V3NkpNTzJON3h1M254bHZLR2hyQitoQzlFQ1prZUxDdm5wc1VmQUdS?=
 =?utf-8?B?Vzh2a2x3YmlFRWZadjJ1MlJQZFZQdnB5K01rTXNiRWZPK1F0cS8raFNreEJ6?=
 =?utf-8?B?dUFWZVdvTi83YVBBa1RuemtYN2VkMGhGbFREQlNuRlFXbDAwOFJtVUZQQjNI?=
 =?utf-8?B?endvd2FtTzBETXhYZllEU3VFOUxYdWJwME01L3kwbFFRMzlZZ0dkcmVmZmMw?=
 =?utf-8?B?YUVuTG5vQXZmYzJtcWdFNFd0UjZ4NDBaeVJSamVZZmZPNDZ1NVlnUXkvTERn?=
 =?utf-8?B?YU9MbVJlb2VBeURIdi9ZeTFuUGRyOTdTTkEyR0dPT05hV3Zmd1BkakxicjRO?=
 =?utf-8?B?ZmVZbTRpUHdHcmJxOElkRXAyWm5DZStQaytjbkh5WnBEQUh0dlhQSjRFa2VN?=
 =?utf-8?B?MkJHWWlGM29xT09WZkwrWnB4WDNsUVEyU3ZOQkJvZ3AyU01DN2dUekl5TStx?=
 =?utf-8?B?RVZ6ek9hTkRvZGtISzM0OEt6RFIzNDAyTTJKeGJwNUQ5WWVyRkhTeHJxNXZ5?=
 =?utf-8?B?WlRtVlZtLzREaE1SaDNHbkoxZkx4a3FzcjN2NXBWUUhaTFR6YkJVd1VZS1V2?=
 =?utf-8?B?YVJQMVM4cnlwemhBaWdWUVRaMHlJemRBVVBBT0lpZUhCVFdpZlI3MWJKUkpw?=
 =?utf-8?B?aE9IdGQ0TFBianRock5xdkI4WDh5SUVQVUhKRSt1YkdkRDFzZXBadkNrTkN2?=
 =?utf-8?B?WjdncXlkRGZXVGNXQWpkRmRtK3k2MHJIb1JxSjJuaFRSMFJsT1VicENtcXBa?=
 =?utf-8?B?ZWtuY0ZyRDJqMXZFN0JGVURwMnJnUTIzV2grQWNRdEJUQkxXVXFudUVCMUtQ?=
 =?utf-8?Q?aNhe6plEdfw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm1mT0tabzVNaEYyVjRLK21uWCtNT2RyOWY3alR5UE8zNzdVYk5HVGlXZnFn?=
 =?utf-8?B?elIxV0xyS2hrU1VGbGZTYzRJclo1aUhGaURKUzQrcEdGeVpZb1JOM0ROZTg2?=
 =?utf-8?B?VjZxampYUU9yTk5MWFlDZWxHcmpzcWtNSDNLZldrRU9RSzhCZkE1SWtOVGd3?=
 =?utf-8?B?OHJmbm9ZYnpweXFCWnJQTHkxSEZpMnhuRlFleDNNS2dlM2ZQZlIyVE9zeWM1?=
 =?utf-8?B?QmNDZDhUN0RKdHNlRGhLYTlKWUlTOVppL1NrSVFWeHpSVkl3VVBSUTl2OElH?=
 =?utf-8?B?a0tDTzU0bkhkdVJ0TmxxOG4wbzhzbXhDWnYyMjlEWUhRenZ3VTBDMGVidzRL?=
 =?utf-8?B?VDg1cmdOQzNqaE1BZnp6Mm53cndaMnp0YXJFV0NxUk5uY2VQd1ZSMmVqZGhH?=
 =?utf-8?B?c3ViZU0ybE5GY2l0Y3Jmc0NuaWJkN09yVFFFRXRqWFFjS2JrRmI0d2dJZTgy?=
 =?utf-8?B?TG5uajVobjZUQTZ5RGFkS2w1ZmQvWDBaZEtpS0c1ZlZ1eUh2S1JpUzZQWG1M?=
 =?utf-8?B?SUVCWWsxU1gvclU1ZFRERE84SEZldlhBUHU0SVF4QmFTUG9IN2c5YTVYemdo?=
 =?utf-8?B?RmczQnhtV29zSWVsdjNHUndpZWlKU0Jkd3BPMXgyZGR1eDVneGFSdFJhdTVV?=
 =?utf-8?B?YXEyRTZUdnBQNGlNUUVPamVtY1JwajNQdmlQZzhUZ24wT2YzWlFzd2FlRktV?=
 =?utf-8?B?cGg0aG9lRUZPYlBYcUZiWFozVjVCYU5aWnNQRFluOXJGY3BXSnRma3ViYUxX?=
 =?utf-8?B?OGI0TG5WZXZYNVNhcUYyZm45SFJRS21GdWJsVlhFR0wzRUl2TFFrMFZVeUp1?=
 =?utf-8?B?R1Y1MUU1Vk05L2lWcGY2K2VoTUFVd3l6N2V4SkEvRDhGbmJ3NjNIR0NFWU5r?=
 =?utf-8?B?KzVSSSt4cUdCcmM5ZmZTZFFGRCsvcFpjSUJiSG9OTWlRS2NpbFZFcFBzOG90?=
 =?utf-8?B?Nkk2OVRvS1lxYTRteEZiMytyVVY3R2MyT1cwNjIvL092UTZCM3hFWlZBM1JL?=
 =?utf-8?B?TXV2RWxVZFI5Y1Z1ZUZudmw5RW5SRUwxVHkyRmhZZ3VEd1pLRTZYZTIwaWJC?=
 =?utf-8?B?NkxNcEJoYVVNbGZMVURzeHlXdm5LVklqcmh3QUl1Q0NHa3pnZ2FZcGhRWHRx?=
 =?utf-8?B?SE4rRDNMMlFjYXJYMVYxVnRQZTRNdUZRckRSY0xmNUdNdVNIeldnSDhUTDRY?=
 =?utf-8?B?c2ZHRGpyM3ZhRjcvOHdhM0VtMUpuUDR6MExRVWM5TTVHaHhVUEFpV3lHNWUv?=
 =?utf-8?B?TWJ3dzREbG1kRDdWNGhaV2FzNGlNWU80ZjF0cDVSRU9SczNDczJzbjZtQ1FW?=
 =?utf-8?B?THAvdmgwR0EvQXorMXZRbGJlb0NoUWNlMnhCKzZxZE1ubTNxeW5IWHUxR0po?=
 =?utf-8?B?ZEd6Y1ZKM1dMTnU4bmR2bExHNjlUQ1A4MzYvN080MW4rbXloZUp2YTVZR0xs?=
 =?utf-8?B?M2pNb0RsVmErRWgzdlROUC9CcXE4Z1VqUnM0UTdCczhuRGxpZDhkU1ExbGVS?=
 =?utf-8?B?OTI3eGhDTU5WR3VWZllTci9nL2Y2amZsYWlPdS9jVFZweVdGMVNFL205ZkpU?=
 =?utf-8?B?Z1kvZnlxNEMrdjFock03bk5DdjBLVkp2WERPKzJSdDhzV3JPelFFMlUyWnFO?=
 =?utf-8?B?alF5eW9lY0hVSTF1SUtTNCtyM2NHUEE1WWxJV0wwcktCMkF0R3ArcHhISGlL?=
 =?utf-8?B?Z3FDd0tEUjVkTzlmaVpoKzVPNDIwbmVMMXN0OFNucjJ4S0lKT2greDVWK3dx?=
 =?utf-8?B?aTRYMUlBd0hxL0tscy85dXFZNjBZTlc0Kzl6cTdtdkhjNE9Ea251YXA5Z1d0?=
 =?utf-8?B?bUVoUWdJQ0xQMHVlWUh5ZytxUkRoUkJKL2srZjdVMUhaalFLSDg3ZzM3Tmpa?=
 =?utf-8?B?Q2I0c0hZYzBVT2F0dXFaWVE1UFBQQjhxL3IrNkpPYkc2L3hRUGZLbjdVQWJV?=
 =?utf-8?B?SjBVS2FqcWZzWXg0QWRQbmNJOU5wOGU2dFcySGZRc0c5azFVeURBcWN3ZzRT?=
 =?utf-8?B?bWtOWTR0MjRQL3BTNEFFai9HdzdHNVBZaFRZQjZrZzB1TGQ2VVFoK245QitT?=
 =?utf-8?B?UUR3eHFMejJza25lTHUyc1dTWnFZd2hEK28rTEFBNHlMZFBaM0NUWVNCMGI1?=
 =?utf-8?Q?qzFg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c841a5b-2669-40ff-879f-08dd7b8de2a6
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:52:28.2005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IazqmGKHDySKzbQBPrxm0ZmLj+rcSbjDAZdPnP6Us3FSeiY9TJeehV5ORdlQGp05
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6261

Hi Reinette,

On 4/11/25 15:56, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> Introduce the interface file "mbm_assign_mode" to list monitor modes
> 
> Using "resctrl file" instead of "interface file" should help to make it
> clear what this patch does.

ok. Sure.

> 
>> supported.
>>
>> The "mbm_cntr_assign" mode provides the option to assign a counter to
>> an RMID, event pair and monitor the bandwidth as long as it is assigned.
>>
>> On AMD systems "mbm_cntr_assign" mode is backed by the ABMC (Assignable
>> Bandwidth Monitoring Counters) hardware feature and is enabled by default.
>>
>> The "default" mode is the existing monitoring mode that works without the
>> explicit counter assignment, instead relying on dynamic counter assignment
>> by hardware that may result in hardware not dedicating a counter resulting
>> in monitoring data reads returning "Unavailable".
>>
>> Provide an interface to display the monitor mode on the system.
>> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> [mbm_cntr_assign]
>> default
>>
>> Added an IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to handle Arm64
> 
> (needs imperative)

Sure.

> 
>> platforms. On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined, whereas on
>> Arm64, it is. As a result, for MPAM, the file would be either:
> 
> CONFIG_RESCTRL_ASSIGN_FIXED does not yet exist anywhere so this motivation needs
> to provide stronger support for why it is used before it exists. There is a precedent
> here with RESCTRL_RMID_DEPENDS_ON_CLOSID already used while it does not yet
> appear in a Kconfig file. I would propose that this is motivated by noting
> how it is already understood how Arm supports assignable counters this was recommended
> by James to prepare for that work. Since this is user interface this
> work is done early to ensure user interface is compatible with that upcoming
> support. Also set folks at ease that IS_ENABLED() works as expected with a
> non-existing config.

How about this?

Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to support Arm64.

On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined. On Arm64, it will be
defined when the "mbm_cntr_assign" mode is supported.

Add an IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check early to ensure the
user interface remains compatible with upcoming Arm64 support.
IS_ENABLED() safely evaluates to 0 when the configuration is not defined.

As a result, for MPAM, the file would be either:
[default]
or
[mbm_cntr_assign]


> 
> 
>> [default]
>> or
>> [mbm_cntr_assign]
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v12: Minor text update in change log and user documentation.
>>      Added the check CONFIG_RESCTRL_ASSIGN_FIXED to take care of arm platforms.
>>      This will be defined only in arm and not in x86.
>>
>> v11: Renamed rdtgroup_mbm_assign_mode_show() to resctrl_mbm_assign_mode_show().
>>      Removed few texts in resctrl.rst about AMD specific information.
>>      Updated few texts.
>>
>> v10: Added few more text to user documentation clarify on the default mode.
>>
>> v9: Updated user documentation based on comments.
>>
>> v8: Commit message update.
>>
>> v7: Updated the descriptions/commit log in resctrl.rst to generic text.
>>     Thanks to James and Reinette.
>>     Rename mbm_mode to mbm_assign_mode.
>>     Introduced mutex lock in rdtgroup_mbm_mode_show().
>>
>> v6: Added documentation for mbm_cntr_assign and legacy mode.
>>     Moved mbm_mode fflags initialization to static initialization.
>>
>> v5: Changed interface name to mbm_mode.
>>     It will be always available even if ABMC feature is not supported.
>>     Added description in resctrl.rst about ABMC mode.
>>     Fixed display abmc and legacy consistantly.
>>
>> v4: Fixed the checks for legacy and abmc mode. Default it ABMC.
>>
>> v3: New patch to display ABMC capability.
>>
>> ???END
>> ---
>>  Documentation/arch/x86/resctrl.rst     | 27 +++++++++++++++++++
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 37 ++++++++++++++++++++++++++
>>  2 files changed, 64 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index fb90f08e564e..bb96b44019fe 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -257,6 +257,33 @@ with the following files:
>>  	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>>  	    0=0x30;1=0x30;3=0x15;4=0x15
>>  
>> +"mbm_assign_mode":
>> +	Reports the list of monitoring modes supported. The enclosed brackets
>> +	indicate which mode is enabled.
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +	  [mbm_cntr_assign]
>> +	  default
>> +
>> +	"mbm_cntr_assign":
>> +
>> +	In mbm_cntr_assign mode, a monitoring event can only accumulate data
>> +	while it is backed by a hardware counter. The user-space is able to
>> +	specify which of the events in CTRL_MON or MON groups should have a
>> +	counter assigned using the "mbm_assign_control" file. The number of
> 
> "mbm_assign_control" no longer exist.

The user-space is able to specify which of the events in CTRL_MON or MON
groups should have a counter assigned using the "mbm_L3_assignments"
interface file in each resctrl group.

> 
>> +	counters available is described in the "num_mbm_cntrs" file. Changing
>> +	the mode may cause all counters on the resource to reset.
>> +
>> +	"default":
>> +
>> +	In default mode, resctrl assumes there is a hardware counter for each
>> +	event within every CTRL_MON and MON group. On AMD platforms, it is
>> +	recommended to use the mbm_cntr_assign mode, if supported, to prevent
>> +	the hardware from resetting counters between reads. This can result in
> 
> "from resetting counters" -> "from re-allocating counters"?

How about?

"from resetting MBM events between reads"

> 
>> +	misleading values or display "Unavailable" if no counter is assigned
>> +	to the event.
>> +
>>  "max_threshold_occupancy":
>>  		Read/write file provides the largest value (in
>>  		bytes) at which a previously used LLC_occupancy
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 17de38e26f94..626be6becca7 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -882,6 +882,36 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
>>  	return ret;
>>  }
>>  
>> +static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
>> +					struct seq_file *s, void *v)
>> +{
>> +	struct rdt_resource *r = of->kn->parent->priv;
>> +	bool enabled;
>> +
>> +	mutex_lock(&rdtgroup_mutex);
>> +	enabled = resctrl_arch_mbm_cntr_assign_enabled(r);
>> +
>> +	if (r->mon.mbm_cntr_assignable) {
>> +		if (enabled)
>> +			seq_puts(s, "[mbm_cntr_assign]\n");
>> +		else
>> +			seq_puts(s, "[default]\n");
>> +
>> +		if (!IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED)) {
>> +			if (enabled)
>> +				seq_puts(s, "default\n");
>> +			else
>> +				seq_puts(s, "mbm_cntr_assign\n");
>> +		}
>> +	} else {
>> +		seq_puts(s, "[default]\n");
>> +	}
>> +
>> +	mutex_unlock(&rdtgroup_mutex);
>> +
>> +	return 0;
>> +}
>> +
>>  #ifdef CONFIG_PROC_CPU_RESCTRL
>>  
>>  /*
>> @@ -1908,6 +1938,13 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= mbm_local_bytes_config_show,
>>  		.write		= mbm_local_bytes_config_write,
>>  	},
>> +	{
>> +		.name		= "mbm_assign_mode",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= resctrl_mbm_assign_mode_show,
>> +		.fflags		= RFTYPE_MON_INFO,
> 
> Needs a RFTYPE_RES_CACHE?

I am not very sure about this.  This flag is added to the files in info/L3.

"mbm_assign_mode" goes in info/L3_MON/

The files in L3_MON does not have these flags set (for example
mon_features, num_rmids).

> 
>> +	},
>>  	{
>>  		.name		= "cpus",
>>  		.mode		= 0644,
> 
> Reinette
> 

-- 
Thanks
Babu Moger
