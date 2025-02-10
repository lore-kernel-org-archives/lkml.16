Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F3B1F4628;
	Mon, 10 Feb 2025 17:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209165; cv=fail; b=MPQG1mFEDJuHMELa+148x8dd0T1tTELjUPniBB0j0nTqqy4AZJ7zNGXdS4IpVoXQhFfX3vbzGLU9gifBpF0KwSDxtznJIYqY9H+5gMJbPEqWdgMpzuDtoPXWbaFLzvxNGoDJhi66jbZQIhWIvYAUyMH+PnIuBxP/XtPhq4UH8Qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209165; c=relaxed/simple;
	bh=GxqcYteKqU/c0jx+ireya1QndDvD3/S6C5ecWBB/ogc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q7MuGAwSZMqmD6t6KpFwR1VmA+HSBgdxopbI6EM+a6sOxWb3/mVK7aMTYbeqBXQ/fYLliBW8oayoaU1FJ0l7jvIZ+MVnMp3KIEIGQ3QYVE4JvmmL82ZERM1EaM0YrW6OJobUKogTpOM/1fIEouDQnliWAPDgE7x2kBmMXDSCau8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JT73Xgcg; arc=fail smtp.client-ip=40.107.220.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JT73Xgcg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWQOQpZb97to+MBZQw6id6ZqQixI1FMG15ybNvI5jxUdJLb5s9ftVzpnKMSnhkvsI6FFCdo7f63L3oFOAvfHnzOKS3gCaWPvQYStlTY6/4rl/BBRGc4IgTt/S6uvQrNzOavg+R3T43+Y7PPQTJ1b4XZuuaSAV7CG01tNJb2KlaEDAa/Mt85EHVwdBu5mvpGugxWvrfZ7GAcyKhN8xhevLFQ7l2g+GwG0+Vg6mmhKqKE8NAKRgL91zy8clhBTcrOJKkoqvtsPZ7FHkHt3l6Pl2bvLkMBy6+Argwu3FF1z5Vv9DnVhfOez09KteBJQ+w62cuOjqZgSeyRV+VI4s8viUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjlRh2C5G2C3+cfUoSEtJcWRP6c3f7ZrAnLRb1lbteA=;
 b=uiO28YkUMOSoiALnaJlT1QqW/6p7HF8/PkdSk/H8ycpDq6PIepldYSlEIAtd/F15LiC3/nA3HQdXVJkrzJYWkdmbQlExOV5LunSUmUQzrPEFk9ZZ+bFieBe9IPRouwPrWksBRBUZHh9ifMXlBhD7T+HdjV3IjSv6/MlGIXFyUX5dwt72YHPjEZWFUbIiHpdg88R3HA3rpHRIVj0nVa2MfSCM1Ct6LcaoMbjGGHGIt1MGN18uFofwh+ZvjLvMcC4ZDVPv4Kvu0uYPCJhblsgW9I0zqsxq/6R1w1mpgwEmHX5krVBA6gxdvRDI8TivBIpJGnfw217+p5HbVEJvqLkqAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjlRh2C5G2C3+cfUoSEtJcWRP6c3f7ZrAnLRb1lbteA=;
 b=JT73Xgcg0jTD78ziFL+mX+meEw0eQeEsuoukOf+YrMrLvbQ/4U+l5BgyE4hhzg8h9hpByPRdctLu2tw+0xbjklzbaQzJF07IP7iIGVRRZBqxv6oys3ud5ga/AwisEmmKrr5AeKmBNYmcTW2qb6idrgjITjStbc2YQSoSUw52Fr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB6980.namprd12.prod.outlook.com (2603:10b6:510:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:39:19 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:39:19 +0000
Message-ID: <00bf94f7-9992-4db1-a5c1-c2708defc806@amd.com>
Date: Mon, 10 Feb 2025 11:39:14 -0600
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v11 18/23] x86/resctrl: Report "Unassigned" for MBM events
 in mbm_cntr_assign mode
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, tony.luck@intel.com, peternewman@google.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <22cdafb381295c3802388613686d7b89a5e313c6.1737577229.git.babu.moger@amd.com>
 <5e911112-55f5-4b43-99f3-1dc11077da9c@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <5e911112-55f5-4b43-99f3-1dc11077da9c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::26) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 29064d1b-efe6-4f04-9204-08dd49f9d8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2xyZWdkYjBQLzB3eDZGUWZMZlhvZ2tGZHl1SHF0VWV4VjJJb1U4RWtKaXdQ?=
 =?utf-8?B?RlhpblJua0JWN3BtODUvUmJzQUhONFYyNWpSdzc3NnRCSWl4aGRwRGdqODJn?=
 =?utf-8?B?WXdDcW9wSTYweXVYQ0RZYnVCdTFUalpxUFJhaHdaQTFjbmxtaFRsUEdvRmFF?=
 =?utf-8?B?T0tGZC9FVzlsTUt3cksrdG1jR0NkdnF0NHV0RTdiZE9VVkx4MFlHdVRLV3Bl?=
 =?utf-8?B?V3F2N3o0bjRYY2k1QzNaQmVSUkFNSUdvY2JkTlJINVJTUTNtWlNZVFpRU212?=
 =?utf-8?B?WUZsQmw1dUVCWVZwaHZDeWhPQ2JuSi9Bb2tGQmI4T0kvREFISXpyME1qUERS?=
 =?utf-8?B?ZVk1WUNieE5WaFhLZmV1UElYbEl2aHRVc1Z5cE1SWlFtZ0sxK2UrZitMcGZP?=
 =?utf-8?B?UU9qZG9GSGZvQWg0a0o1TlR1dUxpQ0doS2tkOUd3eU9SSnZKVHB2cFJnK1JB?=
 =?utf-8?B?QndIRHkwR0ovZEtiSEwwdUIyYXNTd0tVUFpKTUNqVEhiVmRvVENQOWVoZGI5?=
 =?utf-8?B?b1JsMkFVVWhUYlR0R1FEL1JwS3p4cVdCMm0waTQ3V1BxcGtQdk1nSlNPT2c5?=
 =?utf-8?B?QmIzMlk4UFFYRFl1TmYwbEZoWmFIRXV2cXdUc0pkVHpsOUpRQUR0R0FaK2Ux?=
 =?utf-8?B?MGVOcFpJd0xSc2U2Y09pZWFpQTdxOGFGcEkrd2dTZzRpK3I5bmdibWRsTzJZ?=
 =?utf-8?B?Vk8xMW1vdkpTcVBha2czV2VJU2cxUDgxTkpGR1ZXbGJHbTFUL1ZqMU1Lb01p?=
 =?utf-8?B?cEZzTmJDb2NSbC9HRGgvb3JDRDM0dHZjYS9KdmFPd1JmZ0kwR1lhT0FLODl5?=
 =?utf-8?B?Y2w1eWdWT3diNGttNEpWOVhUaTZDeDhaelpGb3BkZ3Nzd0h3ejUybHNUckJW?=
 =?utf-8?B?SmE1a0RiTUtWbVovRm9iL1Mra1piMThCNDdyTkZvY04wTFFYdjF2bTBob0JG?=
 =?utf-8?B?Nk51Tk84T1ptZnUzN3hxSWcxYlo4a0lOSWlhSjRMSlZ2cHJTOVpxNUJGZXJ1?=
 =?utf-8?B?VTlUQTRMZ2xTWEJ5alpCZ1hXN2cwOTVMMXpwSEM0aUVYWDJVZk8zTHo2Ukky?=
 =?utf-8?B?QWkzWk9tNCsrYnhwM0RPZDJFekVVUCttUUIxNWVKd3lueldzMGptTWNCVVhW?=
 =?utf-8?B?UHA5M0lrTzRTRWtXbDV4MTZUN1FlWlZTY2pNR0hkMVdQdGt4NWJqVmZVYkRI?=
 =?utf-8?B?U1A4aFAvVG8wak1mcWd6TTRJckVnYldybWNYdTVldVNiZ25kTEVoejlTZXpZ?=
 =?utf-8?B?S1FFeUh4dU5VYy9yanhqV1ZiOGNJMGU5dWdUQXBhZnBlbGRzcEtlZ0dqOWVR?=
 =?utf-8?B?T3RtZmFXS1RoRDRpdk5CTDBXL1lnN0d4MGFFenJpTWxpdTY1MUV6MXpnNGlx?=
 =?utf-8?B?VEYxUjNVNEtZS0pzM0VRanVxalRTVlhpZTBRS0UvRFBRZEs5dGs1UXZDRjB6?=
 =?utf-8?B?a3Nib1lmdEZ6TlIzRGlrTHhURkNEeVJVTHpGVjdMNWZJVEUxdDBNMHpvalIz?=
 =?utf-8?B?dXZpbmxLM0NrM0x6d2lWSVlSK0k2aGo3bmluUDdGaFNiL0J1YlE4bGhwV2Va?=
 =?utf-8?B?ZHhFTUw0dUwwNjRpTlR4TkpiYkl5WXQwcysvWmVEbS9TNFhXaUJuMDM3emUx?=
 =?utf-8?B?S0laYzZuNmgvWkgrdTUzeDVLc0Q3bVhkUVcxcDlmWDE4VjAzOGNiZXhmYzJZ?=
 =?utf-8?B?SjBienlBdzF0VGl5NGVYd0w2dXcyMWhqRWhiY3FHQXhFVGxvZFBnL3hIT04x?=
 =?utf-8?B?b3BuRmREbFk2dkZuMUJ0MjJmMmEwdG80QjlwZWhVcTVqQ21Ga3YrMkFhMiti?=
 =?utf-8?B?RC9seUtUdStuZnI4b0VHNkt6NkhIMzN5REJOYXZNOFgvNk8vZXdDYWhHa0Qx?=
 =?utf-8?Q?URNfkH+XlIOy6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SS92VXJMVWZCNlhubVRabFVPUFNMYm1JdFhrS3czelkxMkJ6eVp3WjhVRm16?=
 =?utf-8?B?R2ZINmIzOFRobU5oRElITEpOODNvcDcvMjgrSlAxOHBET2J2M0FRSXA2Wi9S?=
 =?utf-8?B?YUZtWkpkSDlVdjh4NWRJZ3JiYkpIa3V4aGVZQ0tSWURFTTlmb01aVmxkQ0RJ?=
 =?utf-8?B?US9OMHdJaFZkWjRLRmhxWWo2cVIxN2t2YnFzSEZQRFFvaWM3enV4Q0VDU3k2?=
 =?utf-8?B?YmVXQ2V4L08xU21wWlk5ZjRlcDFYdmFFOXdvbVBNdkgvQVRUdThvM1ZYUENj?=
 =?utf-8?B?VDZlVmgzTTg4NzFRQXR1L0ZSTDExWUI0V0tRNDJaalRnR0IrY0hWVndiV3NO?=
 =?utf-8?B?ak5udkhGVmY3Rkd3Ny8yZ1pnK2drM3R5QVYyR3dzMndlR2x0MExYK25pTlN3?=
 =?utf-8?B?ZWt5ckJxSGRINVRTM1VSLzBEc3lyUzRqcEZ6ZjRaejJFUisxRW5yTGlTRTJ3?=
 =?utf-8?B?dWpzR21sei9EYmZDRlZROHVuQ240dk9nZVZ1bm1OY0txWENzS0ZXSFFOQjRp?=
 =?utf-8?B?RHdCeE5NYTdBTEhMcWh1Vmd4MU9aN0QwNm14QUtVa3cxQzRjOHU4cks4dGJE?=
 =?utf-8?B?MnpUY2UwcEs4ZS9aZU1IT01WK2thQUFmaHp2RU42bVB5SzI3VDlid0J5ZS9i?=
 =?utf-8?B?czVWZkZNV3BHK1RkWk13TU4xeUc2dkozUDI3RmtqeCt6dnQ1d1Q4RFFzem5q?=
 =?utf-8?B?WCtHSmVBRVdzTStCOU1iL3JUSkdQUk1MRitKN0FmQ1hsTjJxZnQzRytqQ04y?=
 =?utf-8?B?eWc0Y0p1bGlsalRGR2svMndtZEpxbElPYW1ZMFhDekxpdEduZHcwKzBEYlpP?=
 =?utf-8?B?ajFpdmc0RkZHM3djR05iMWlvd3BMMkJYY2hRY0RvWXJhVi9OVFRuZmRNTnlF?=
 =?utf-8?B?c3FJVXRrekMyOXR3ZnR5WDM5VGpwZFRXNlBmUHA2M0QyY0cwcVlqTVJZUWlY?=
 =?utf-8?B?UEIrZ2tycnBQVkZDQVJZRmVJR05zempTK01EeWxTUzA1RUx5OWpCWTNHVng0?=
 =?utf-8?B?QURDY3UwYUZ4cGdCVVJod09oZDY5YmJJVHdyOVlHMzBESm1OOVhpdThaSzN2?=
 =?utf-8?B?VHdSb2pSWjlyenMyRERTOW1sNVdFbW9oWEFscGZmSFI5NnBUcVc3MFF5MzJT?=
 =?utf-8?B?NjJEUWE2UjBuWVlFdy95dEtITFZqUktmY1gwVUk2S1h2ZFM2UlJZOVVBWWIv?=
 =?utf-8?B?TEdpek8vMEJkN2J3Q1REKzVlTm1GeFBEaVVEektsUDB2MW9ORkdJNkJwSjNR?=
 =?utf-8?B?VTZZc3d5QlE2cHprcDM2ejVTaHZ3VVV4aUVjKy9rekRnV1dyNUpkNndIQ2hh?=
 =?utf-8?B?dVY0R08rbUhHNk9CSmlEWVJvbkhxZk4wV3ZGVzl2NFFkWFgrbTRhOWYxQUNx?=
 =?utf-8?B?MEdkRGNqdHVLeHJDcW9HbERTWG02OUsxVCsrZ0VOQWtpeUNMVmtrNUVSSzBM?=
 =?utf-8?B?Z2Rib3NFRWFnbm9OZko2OW5GYk9hb2d1dGZjc0xsa1VGY243SU1SdDc0aTln?=
 =?utf-8?B?cjMreUN5RlpHeWtZZHZXYUVLTG5nSHJNSVU3TlRBaVBxT05vU1dIb1hEbXZr?=
 =?utf-8?B?b1ZPaVFxQk5KMGlWVWpGUWRLSHdtOWY1S2JtdDd1VXBCL3podVI5bUxUc1lx?=
 =?utf-8?B?Uk5USkpicXduZGdzUW85QnIrdm0wNjJmNUd4ek84cTNtQjhoOW1YMTcwMEhX?=
 =?utf-8?B?VkRBd2dKbnZERlVPTHBzb05SeFlNNFh1dzBVZFg5dlpQMWtZWjBwczRBUFpE?=
 =?utf-8?B?c0ZUYlc4cnU4Q1MxQVBJbldQbVlqTVlxMW50WGR3Mkg2VXE5cy9MNXFVN0Fj?=
 =?utf-8?B?ZExjRE9FU2ZwWk9VeWxMMTQvNHdTZk5XcS90ZFV4Kzk4ejdoOW8rdXJXYStL?=
 =?utf-8?B?OFpwVFB3RTJCd0w2S1prRVlvUFJ2ZW5hNWZLYW1Eb3VHcXE5NDc3TGpWaEVz?=
 =?utf-8?B?aTlFYjVteXUvbVBuTlBobnlwSXJ1VHQ2c04yS3lYbHdHTjZiNWlXVFE3VE5J?=
 =?utf-8?B?NTJZY25VdGcwVHRZSEJVc2QvT09TQkUzd0o4V0JpWFVLR1ZMSjVGSi9kU3Aw?=
 =?utf-8?B?N01hc2o5eDlBWFFEeFFBb1JNWHZBdXBIMW9rekI5NVRzU3BIc0k0YUk5Sno2?=
 =?utf-8?Q?uk5g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29064d1b-efe6-4f04-9204-08dd49f9d8e6
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:39:19.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHU2VkKDuIG3jsnV4YQibKhmHymQLL+iVfjyLjqP2irb4heRujZJk6utvyrs0Y6e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6980

Hi Reinette,

On 2/6/25 12:04, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> In mbm_cntr_assign mode, the hardware counter should be assigned to read
>> the MBM events.
>>
>> Report 'Unassigned' in case the user attempts to read the events without
>> assigning the counter.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 99cae75559b0..072b15550ff7 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -431,6 +431,16 @@ When monitoring is enabled all MON groups will also contain:
>>  	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>>  	where "YY" is the node number.
>>  
>> +	When supported the mbm_cntr_assign mode allows users to assign a
> 
> Same comment as previous version.

Sorry about that.

"mbm_cntr_assign mode allows users to assign a"


> 
>> +	counter to mon_hw_id, event pair enabling bandwidth monitoring for
>> +	as long as the counter remains assigned. The hardware will continue
>> +	tracking the assigned mon_hw_id until the user manually unassigns
>> +	it, ensuring that counters are not reset during this period. With
>> +	a limited number of counters, the system may run out of assignable
>> +	counters. In that case, MBM event counters will return 'Unassigned'
>> +	when the event is read. Users must manually assign a counter to read
>> +	the events.
>> +
>>  "mon_hw_id":
>>  	Available only with debug option. The identifier used by hardware
>>  	for the monitor group. On x86 this is the RMID.
> 
> Reinette
> 

-- 
Thanks
Babu Moger
