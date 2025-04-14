Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0052F1ACEDA;
	Mon, 14 Apr 2025 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744663882; cv=fail; b=mYrOez0KbeUAEP5QxcawqbU4J8zCFyH0Qrc8jRYXIRcJDZtTbjVHjZxUsBSS/E8YE7fFmivT7dd+qOj3fZ+j5y+YQ8SAtTez2TQyrQ714H5GaksarS5lIzw7HKUDFNU6qzJAYlw9+AdFTsncv/UaZJpGhyMUilaFho6cDnS6Upw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744663882; c=relaxed/simple;
	bh=qc0zIsmIUDcs8I5Lhbu9gLN1sI+mBgq4HND/q0JH62o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R3Ggi3Vh68m/s/jrojX5z9+THyc4ACsmOVq+8mM3OHknUteWrpl90x/SR3HyUm6TgLuk6uT2qxmVQ67SuCpeQTxl0nhXMNoD/rpy+vQZu3xPsO54RGU/Q2s6nVXt3tYUZQSwgmI24UwR+C60gb/ja1mnsZsxI2UzpbmkqrJVsMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=45fIW34x; arc=fail smtp.client-ip=40.107.212.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="45fIW34x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFH2wjT0pdx2rk6JEvs4aijNChPdFTt96LFpVV5629rgYCYxIpMcmhrti1iw87ZEqI4KOLiJG7peFqJM5NQgHRKqcZTPiSDwCuVs8EJB56FLNafDlEbTDS6DEceuvKz1eEMqn6gHZSThkqUos5axxkS6HcdrtSPBNPD9tZ3u+mqzAs6GM/KBQUKfuHtRr0BPO/XYZ34QskepGdTAzGU5UPg+UzWaZlLFFUJR3B5uW8mW4SF2vu7nQkZ3wxbDpW86+Oyo59srNJkJD+NGUUBmjv0IcZ8jG1VWZKYwI6yNPW6pw2T/LnpqqfAu+ufIUnu9POLwQ5VfWxllZybOVrM1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s7NgmOyJnyUSdJ9Ob8vgi+R+9gvW3kiR+yA7ixVHBU=;
 b=OWiutegVmbfg6YJkQuPFUqaIs9m8lWpRocMf3xRNFuEbTu3V+LMB5lq5oEPw7tITQlP09AlKExLwJvaAnjlrOCLCVE/W2If8a991NIjsCHDwl7KK9U7xMw5TPzU/enTRbaMSbimS+k6aTXa3CdqHGH8/M08pREDRmRMhFEYP14mUEF6cPxUB2uBTf4U5Y82iVcx8CuQhbmEWvWLu4raMMjL6EaZ9ZV5gbf8S64MczEhq3GJ/YliojVNwZov4fxNCru3o9fiexLAFMK7UuMq/5XjldjOPlbk2NTNQ51nuzgIUevsswpqyd5QP7IjYCivT9mmHy44F3h9QvKWabs5S2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s7NgmOyJnyUSdJ9Ob8vgi+R+9gvW3kiR+yA7ixVHBU=;
 b=45fIW34xjAAXSOXBySKpJR3x1lV/gvTikhq6kBdZ0onmWNoXSeHa657r44WCVgAdkg4PTUFA8B78IUjnC2hPu7zvv7AA6xofDNy0xujM1Qbu1VqajtPXiiPWLYpB3xBSRxo71VPhNZKvt4i6ThpknN75rokHPMlCuY3v+X9vCYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 20:51:16 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 20:51:15 +0000
Message-ID: <a05b3226-b341-4003-a0d3-8e1594d95052@amd.com>
Date: Mon, 14 Apr 2025 15:51:11 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 13/26] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
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
 <187d14b81db5f9a2f19657dd3af07e8555d68261.1743725907.git.babu.moger@amd.com>
 <ef0fc176-ce2e-4ad5-b752-f1d018ae985e@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <ef0fc176-ce2e-4ad5-b752-f1d018ae985e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::29) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN2PR12MB4341:EE_
X-MS-Office365-Filtering-Correlation-Id: ee553dfa-4b25-42c7-f41d-08dd7b96190d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFFsdmswZE8zdllpTUdOZXNnT2FvUEFDVFlCSmVpZUthTGoyZjhqeUNsOExB?=
 =?utf-8?B?b3FOL3JxTFNBYWV6WnBwWUpOVC8yNEtVVUVNdHIrOER5MnlybHVhWC9jZ0FY?=
 =?utf-8?B?a3RNVTl2c1dJeDdhT2hlSzZ3QVVYRWFLa0MrTG1BL01IK2xnMmEzeFNUVTVk?=
 =?utf-8?B?Rm9keU0vb3FPRnI3bEkrSGo2ZzBGUlJ3YW1rNUdjWE1ZMVVzTTdMcVg3bzln?=
 =?utf-8?B?MWQ1TTl1Qjl5YmNMQXBGVXFHYlBDREVIM3RGRWJDR2dYS052bmliMTh2cnRt?=
 =?utf-8?B?cDFRNHBJV1JhTE9WbDdhMGJvcko3WXE5a3ZrWTdmZ25pQ29UUmlkV1hWb0Ix?=
 =?utf-8?B?eGRaZ2x3TjVrRFRha201cUxOZmlLNUhUR1g3azJUNTlNdTU2bWJUOUU5Vmsy?=
 =?utf-8?B?NG5iYTNZaC9qbTcwcW5mOUpzUDh2bWFjUU16czBQdHNKQW1CT0c1SUlHWDA2?=
 =?utf-8?B?UER3UkRkUUtLSmFYcnUwSjZ5M29wakNGWFQ5dkFMYy9RcitsUTZYeE5HdXVj?=
 =?utf-8?B?aExoTGUrZkxGaWF5Ym1zQ1dWNEVJMHRBZ1RNVmtFMzNKL3cveVUrYzZHL0pj?=
 =?utf-8?B?VERBNzRuUi83SnVoT0p3U2JUVWMvK0ZlaWE2UHAvKzlXblBJZ0UwZU84RTFS?=
 =?utf-8?B?c0o2bjhDM0NOOTB1Ylk3VXRTYWF4OUpyRG4zKzBiNlBFZkpEZTNoL2xMOFlh?=
 =?utf-8?B?eWhrbFRPMHI5Q1hQUmVyODl4Nnd0VkJjUURmaGNheXlySlNLUnNBdjE2OUJi?=
 =?utf-8?B?QnlRb2tLVDBkcGxLZVZyckpJemFxUkxidTNuZE0zanQvY2lOU3ByYXJPUUtK?=
 =?utf-8?B?MFNuVEhoNjk0YWdIdEwvNGRIL2M1Wk5MQlJiTVU4MWVPZzNkMTBXdjM3d2tW?=
 =?utf-8?B?RStxQUxGb3AzQ1ZPWkJ2U05LSUI3WGM1YndrL1p5cWZHZktxb0dFTEtqYjVn?=
 =?utf-8?B?TXI5QWwzcjU0MVgwTmhTbEFlYkxEdWJyWWpSUGxaRW1pWnVvM1NYbDRsc1FJ?=
 =?utf-8?B?b1YrcDMzRE04aGNGVi9OM1Y3VXlvSGdjaDhnaDBEejFoZW1IMjBUaXlLbzRO?=
 =?utf-8?B?QzRwTkZicHlVYlZ1TnoxY3BqZ0tiaGFTQzlIM1VuTzBMQ1pmV0tEa1l2aVRw?=
 =?utf-8?B?QTBveVdtdkdJMnRrdzdCclBudUpNbUZCVkJHVFgwZXRUZW1LRHlkVE9WYTVD?=
 =?utf-8?B?RWxZZEQ0cnpkTkVSUG9sOW95TFBqT1hqbEFnV291cHIxTUpvNXR6TitldGRM?=
 =?utf-8?B?SW4zczU5SU1IUERKYXJMd2RQL05jUDAzV2ZCLzZtQWRkN3Izc1JHSG83a0x0?=
 =?utf-8?B?RlNkV0VQbnBNQndNeVBEd2RyOGtlUTB0a09Vc1pWL3Nta096NUZYZFVSSUdT?=
 =?utf-8?B?YlNJdVVBVTJCU2d5V2VBNXNNbTVqdkkvd3dqQW55NkdPTU1YRERYRkQrY1Nw?=
 =?utf-8?B?bEJ4YkVMZGNWWGZaU2RBZmdXenU3b0RBM3k5TXM2bXRMMVBuTmw2N05WYXVK?=
 =?utf-8?B?MUpCenpkT3BRbVZiZnVDc2ovR0VORlB0blhKMFNGeGlBSXIxREJnZ2pDa3hQ?=
 =?utf-8?B?YkN4UGgyNGlqTW4ramJhQ1pIREZKeW5sME93T1hNbkZvL0ViT05TUlBLb3hz?=
 =?utf-8?B?ckZ3eHFIVEVmbzhqL0ZINGhLZmorV2R0OGpyT2g3bUw0L3JXQ21ua0lTZ0hl?=
 =?utf-8?B?N1kzNGNlUWdzWEhYSks5UzkxS2s4V1dZL2xqcld3bmE1WlhlaFdCdUVBdENV?=
 =?utf-8?B?TVBNakZTN2EzOUdkb0JOVjMvRENLTFlNUFZTYk1jWVJHb3R6Vml5WW9PV3hM?=
 =?utf-8?B?Q3ZBa0lQVitxSkFaWE5kNXNBc1VMZXgrbjYzWnFNTTJCVDJieWIzbkRSVzJC?=
 =?utf-8?B?cTlMbzdDMjUvWUFsQWxRSm1ma2ZVQjVzVHNzVjhXeVJ1OVF4L0QxVFRVTDZp?=
 =?utf-8?Q?cJE7AWWey1s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1BoMnI2OVJRa3MyMnFDR2hUcHdUY3FwTnZZd25TdkpCbHhWbjdyU0xOazV6?=
 =?utf-8?B?b2RXWUl4WGc4eCsvWkJtd0UwM1dDckxUMjdSQTR6c3ZwTUZnTzFOMGxkY2dm?=
 =?utf-8?B?OTR4Ymswdm10SlBKZmJMQ3oxWUZJdkpNQktkektvMzdtUW51cVpvMk5VK3RH?=
 =?utf-8?B?dlFUbGFOL2hDMmE0bElnendlaFo4dzA4djRmYmttT0dLVlhrOFlEc3BMNkE3?=
 =?utf-8?B?Q29tZ2JvYlExMkMvN3BjUjJFMGhQeVpQM3l2Y0JCMmE0VGl0ZGpyblJOTUtK?=
 =?utf-8?B?SzBtZVhtT3hOdURXeUtRdXFTMzhvYUc1V0ZUMmhoUVM3S1VyRDBtelBPZnRJ?=
 =?utf-8?B?OGoyVlhJR2NjNVprSUlRdFkzNHFwS0RqV1JDcERZZW1sQmdRbnY1cTFlN1No?=
 =?utf-8?B?dTRtSDBPZnhJdXJOSkFsNkdWbG5OQVBBSUo2M0VXWjRsK1doL2UyVk9uSnlZ?=
 =?utf-8?B?OW1GaTBpUXZoYi9CREpiMXRsRHVFeVpOeEpnSW1WalE5U1N2VXZLaFVZZVZl?=
 =?utf-8?B?K2NpQnhua1JoTzNGam5yQjRmaCtiVjlTYUxiSDBzdWxyVUFnalhhSHlxMXlt?=
 =?utf-8?B?RnZPc1ZPaUQ1YmMwRXN0d28ya0xaODROcGN6emVxUEdqZ0duaWhqK045Unh0?=
 =?utf-8?B?RGVNbGlOR2VTelA0dEV1M2Z1S3ZpV21kZkdDZWV5eWthZjI0dkY1dUt0SEk3?=
 =?utf-8?B?cVIxYmlJSDhuUnlBZW1wbVNTUXczWUdxKzBuMnBDZkNmZ0ZOdEtxZUZ4OUxH?=
 =?utf-8?B?elJQajhWNHp3MlJDdHdUdTZ2NnliZXBrNUxSNW1tVTV1TWRIRmVEMW5SaENk?=
 =?utf-8?B?V3JCWkZxcXVwUTczZ3JUMEp4bG05NTB1Y09SL1ZmaUpwUnZ0QWFRRkVXakFq?=
 =?utf-8?B?eExHVW80b0VxbkNmWkpXYU1iQks3bzRDdWJLQmxHcUl4M1ZiQWVEQVdkYStR?=
 =?utf-8?B?cjgraG4wUmhkRXplU3JTb2ovTmMxVWFlbCtjSis4R1lKOTNUeHZBaXQ2Yk11?=
 =?utf-8?B?TXlKVjVLT0U4UCtvTzVIR0F0WWI5Y0E0azZQb3VwaDQ1aExnbEt6VUdYSExX?=
 =?utf-8?B?K08yTVF5bUtIZU5UcjNkUmQxT0hLTTN3c2x6T2J3anBpSzk4c3V1Q3RLMWJl?=
 =?utf-8?B?QUJYeFJOK0liVFZuU05EU1NDdi9EMjd6b2x1UU1XM2c0NkluYmxVWlMyejFL?=
 =?utf-8?B?R3owVXBKNWluMDNUVnlxZVNLUTcyOUY1TUxoRTRrZjVlQUt0V3BkbUkrTkNr?=
 =?utf-8?B?YnkwakNCQkhkZzk2MXN4dE1NekM1SGowNHd4cWtTcVBwcVkrdkluVlRWZFAv?=
 =?utf-8?B?SDNtb1hoUFJXQWR3b1UyZVVQazFWNGQwOHpOU1BBUUhkV1FFV0x4RmNmU1cv?=
 =?utf-8?B?SXhORERXZE5VVjd0MTlmOFF6YU8yckEwOGxiMTZzSGlwZTVnMjIzeWdtMUNN?=
 =?utf-8?B?R2JKaThaK3NXeE9iYWUybUZGc1V3VGxxZlBWdDIzbUg2MGRUV1ZXYXpzRm8r?=
 =?utf-8?B?Qkhydmo5TUd6L1dROGp0TDI0cjljaXhnMHdqSHpUSWREcjY2QUtQTE8xQjh1?=
 =?utf-8?B?OW5DM2p4cG9oZHBPQ0RCTDNreW41RVJ3MXJITytVK011RnVWM0NTYmlYZFNU?=
 =?utf-8?B?cUIyTFhub1UwUm5HSjVVeFRoYVhwTXdCRGRqK0xQWlczR0lVT1dOK2l2Wll1?=
 =?utf-8?B?MWdNSStZR00rVFFXNTEzeE16SStRZjdmNFh5V0h4cWxMK3VieFgrRWFsY2Rl?=
 =?utf-8?B?NmZ6OW84NEgyY001d2hpZW5lZ2NwUW53M040aUhLMk9UTnBZY1VvbzdFbm4v?=
 =?utf-8?B?MU5pOUxKZktPVWl3U2JQaXlBS0h3U1ZzNEwrbHpTSW9DRloyS3JKYTNHYUJH?=
 =?utf-8?B?dVkxa0ZMWHc4NHZhWkhzUFkyU3VPV3ExV0tlU2RUR3greCtZeWRhc2ltY1R0?=
 =?utf-8?B?MkZtQWRRN25VZXdHVGl0R1RKdDRSTTFtalV2bDl5TUJSNXp5RE5jSDRZUDdR?=
 =?utf-8?B?cGszY2p2TDJTWE8zVlZTQU1uM1ZCRC9ac3JQQVBKV3ZSRVpidWhGZE1OMDFW?=
 =?utf-8?B?V29oRjcyNjFLclhJdWtmcXBJSE9sM3dKMTJxSy9hdGZGNWdMZlRlMDI0WDVR?=
 =?utf-8?Q?0LQI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee553dfa-4b25-42c7-f41d-08dd7b96190d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 20:51:15.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfNBggj+A06SYxKykw1vzdnPPGlBEQrmMBjO+aD3CjXK2yFU3XzC7uhf5IyQs6e3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341

Hi Reinette,

On 4/11/25 16:02, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as it
>> is assigned. The assigned RMID will be tracked by the hardware until the
>> user unassigns it manually.
>>
>> Implement an architecture-specific handler to assign and unassign the
>> counter. Configure counters by writing to the L3_QOS_ABMC_CFG MSR,
>> specifying the counter ID, bandwidth source (RMID), and event
>> configuration.
>>
>> The feature details are documented in the APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>>     Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>>     Monitoring (ABMC).
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> ...
> 
>> ---
>>  arch/x86/kernel/cpu/resctrl/monitor.c | 39 +++++++++++++++++++++++++++
>>  include/linux/resctrl.h               | 15 +++++++++++
>>  2 files changed, 54 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 8a88ac29d57d..77f8662dc50b 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1430,3 +1430,42 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>>  
>>  	return 0;
>>  }
>> +
>> +static void resctrl_abmc_config_one_amd(void *info)
>> +{
>> +	union l3_qos_abmc_cfg *abmc_cfg = info;
>> +
>> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
>> +}
>> +
>> +/*
>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>> + */
>> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			     u32 cntr_id, u32 evt_cfg, bool assign)
>> +{
>> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
>> +	struct arch_mbm_state *am;
>> +
>> +	abmc_cfg.split.cfg_en = 1;
>> +	abmc_cfg.split.cntr_en = assign ? 1 : 0;
>> +	abmc_cfg.split.cntr_id = cntr_id;
>> +	abmc_cfg.split.bw_src = rmid;
>> +	abmc_cfg.split.bw_type = evt_cfg;
>> +
>> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
>> +
>> +	/*
>> +	 * Reset the architectural state so that reading of hardware
>> +	 * counter is not considered as an overflow in next update.
> 
> Please add something like: "The hardware counter is reset (because cfg_en == 1)
> so there is no need to record initial non-zero counts."

Sure.

> 
>> +	 */
>> +	if (assign) {
>> +		am = get_arch_mbm_state(hw_dom, rmid, evtid);
>> +		if (am)
>> +			memset(am, 0, sizeof(*am));
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 294b15de664e..60270606f1b8 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
> 
> Please keep the declaration internal to the arch code. It can be moved when
> other architecture needs it.

Sure.

> 
>> @@ -394,6 +394,21 @@ void resctrl_arch_mon_event_config_set(void *config_info);
>>  u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>>  				      enum resctrl_event_id eventid);
>>  
>> +/**
>> + * resctrl_arch_config_cntr() - Configure the counter on the domain
>> + * @r:			resource that the counter should be read from.
>> + * @d:			domain that the counter should be read from.
>> + * @evtid:		event type to assign
>> + * @rmid:		rmid of the counter to read.
>> + * @closid:		closid that matches the rmid.
>> + * @cntr_id:		Counter ID to configure
>> + * @evt_cfg:		event configuration
> 
> "event configuration" is simply an expansion of member name and does not help to
> understand what the value represents.

How about?

"MBM Event configuration value representing reads, writes etc.."

> 
>> + * @assign:		assign or unassign
> 
> Please rework the kernel doc: consistent sentence structure (starts with upper case,
> ends with period), use proper capitalization for acronyms (rmid -> RMID, etc.),
> make descriptions informative.

Sure.

> 
>> + */
>> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +                             enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +                             u32 cntr_id, u32 evt_cfg, bool assign);
>> +
>>  /* For use by arch code to remap resctrl's smaller CDP CLOSID range */
>>  static inline u32 resctrl_get_config_index(u32 closid,
>>  					   enum resctrl_conf_type type)
> 
> This patch does not pass checkpatch.pl.
> 

Sure. Will check again.

-- 
Thanks
Babu Moger
