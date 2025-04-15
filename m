Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B792DFA42;
	Tue, 15 Apr 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729264; cv=fail; b=ie67bnWpaTk4Kdp/d1i2LrpsnUJBMIrdHQN/W30Npv/+b/DNvN1iYWUUJ9s3FLr2IyvH5Pgph3lAn6Dpw6Sm5oA6hrm9wW+U93CUoJhq7yut5/p1EL5UZHG9NsbzCJbQTLbrJPUUmb1AWjCRL8HlSLcoC3AxyAfWIpN0oOUtni4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729264; c=relaxed/simple;
	bh=P84mCDy1KbE6y+GyNaxPFwnbNQgKpxV4t86wCMXmHnw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t3HUVr406NEysrDYEPqfdadAiY8S73wGLq5jVGD/hepTr9DG6drQQTINLLAYNA999lE3MxQM94hu9n73scJsqwSgJiegKNomZapGhN6T0+oPEWUgzSCPqzWiKWmsef78MXcNGUsqCKjU29lCKLeTpvDPs2JcyeUqjinXkzPQERI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S7IMbtAN; arc=fail smtp.client-ip=40.107.236.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S7IMbtAN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miZh7ABSUqBttL7o00z+N+/0h0cyA6IkwSr/GA96trjTN/n0AhzGNt2LPuSTMpPSY4o6x+07wsGFL7v102YADBSjbVmSCANK5nDxJHrTh3wh8ckQrwnzzgE/jYUQ9pSdzQh01bPwmqCwtdI0z4n6SEFGfomQWb+REIyGVc5XFDm+P9NujTdgLG7CTmJkEfz5VQRP0EuPAs1wM9agYuSRcdfJX/13jhxvmAMXPIiImJvbcXQn1VMEPlrC94/HXJaLnHcl8TBUZ7jrCyz2e1OUpBrePq8ljg5JR5tzwDqmVvvYT48u+3RDQHFTnIKGdHShEFZFYiWmWTjIJ8t7QV3T6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yrd+b6pSSgEroQnSMgldPgUGIjz/vAufwILYsol1fwY=;
 b=h0sWTggGyAwFZoRAWZdHrlPdN5ION6C9QwD5PpcRG+zQvT4ndopxaiL2VZRp2fbZr0bnlrH9J62sUNEvhAP1bThHeqdBT/bTap1JbDArdJkNlRPxnsmxZrIFnZQOi9K3SBZvJEccUjCIIIGTJnrlFoq0hamoRkRh8lhZIbAX3eFmVqidKRbJJ8xahEqxYZFR+Jqqxe9TYckMcarFAPq04VKfxYhaHMzZBkpXvtYmBpro+t4TyPaWmGGNc/BL3aCbHaEEBWMp3CBp4S1BNPh/RsHLxsnAVM8mmcOycb7IC4XNYkC4ZwKhlA2+YQ5UQOPoy6G9xbc1CE7nWJWh8zbw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yrd+b6pSSgEroQnSMgldPgUGIjz/vAufwILYsol1fwY=;
 b=S7IMbtANl1OSDOngezeiChpNIVwj1Y6jv+sqEsmQA9kdvz/5/6tkZZ2yjFH3p5O7FxmjGpCWxcQQ9Lt/hnT/2d2292kFRpEGJ5cKXA8zFrwsPazzfadOTNryTPpyglquMor0Drg5rf/cn2SXTrDJS8+Ibe1MLwvkswezwQ3TT+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY5PR12MB6552.namprd12.prod.outlook.com (2603:10b6:930:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.37; Tue, 15 Apr
 2025 15:00:58 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:00:57 +0000
Message-ID: <0c2f9239-2299-4316-a375-a417f61a8238@amd.com>
Date: Tue, 15 Apr 2025 10:00:51 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 16/26] x86/resctrl: Report 'Unassigned' for MBM events
 in mbm_cntr_assign mode
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
 <5aca5635ae7e41bd4e1f13b81c3e279ed542743e.1743725907.git.babu.moger@amd.com>
 <4bf73e0d-3533-43af-9622-94d70425d22c@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <4bf73e0d-3533-43af-9622-94d70425d22c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0063.namprd05.prod.outlook.com
 (2603:10b6:803:41::40) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY5PR12MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: cfee13ad-83d3-44f1-93d3-08dd7c2e53fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wkp2NDMyYXhZeG5JRnF0V283aEFTc2FVcmFvc1JlTlJyRUFmelhSdzhZdFVN?=
 =?utf-8?B?aXhaUWZqdTJHbCtlTlFRVUNUVGptTGw5dVMyRGNVWFowSXJyTEswY0swMS9F?=
 =?utf-8?B?cUJka2JMNU9RRE5BYkY5TWgxNXFnaTNCdmV3TGJaVTFDeW1CaktxakgxRHp4?=
 =?utf-8?B?T0Y3alRJbUVZK1ZCWnFFUEsxOHJuNzhxaVdTRGtHcWllV2p2OE9WMTkrOUc3?=
 =?utf-8?B?WHdEaEdlMWRwSFFQSlZETGM5clVTWnUydlFFbHRiUlIxb0Mxb1VyOFZEemo2?=
 =?utf-8?B?a1BzMzBoVnJmeEtoNmVnbjhCbHRlRldUa2QwVHh4TFNqckxtcTdqOThRWHh3?=
 =?utf-8?B?L3drYkxXQjE1WGlhUjN4bUF6VlZUSkJTYXRIa09HbFA2c3VEQndaVlN6czVi?=
 =?utf-8?B?OWRTVFhXelIyeFlyMFhEZTBNRUdnRUUzSTZ6S0xLNjVKQ1hON1JMNzRIYTdk?=
 =?utf-8?B?Qm85Q1k3THJzelNMalNmRjVNeUNFQlh0L3VLZFFZK0FQMXliRnpGcmVBWS9J?=
 =?utf-8?B?c2ZRMk9kaHhVd1ExdGczKzdaRUxtMUNiZ0txMHBVSGYwQjNkMUVzaGxuMGRY?=
 =?utf-8?B?dW9la3IrVHdaY2dNRjdrTHJyMkQvUWtVcHlzMHN0aWFpK2E2NGVTd0JYQ0VR?=
 =?utf-8?B?VW1xaVFzY1hZcFc1ZlhIRUk1N1gzY21GTWNoWU5jR2xPbUQ0RE03NlIrZUla?=
 =?utf-8?B?QVBLSlo1a2hCOVlsd0F0QWE1N1lmQWhNbU1CZ2dDU2U2c2hjSDNtdjZRSlpo?=
 =?utf-8?B?YW9QZ1FwS0N3eTBpUmNnRGIvM2VJWk1CQVNhOVhYTzhOTE02UlV0dnNEUGtx?=
 =?utf-8?B?UmdUT05QZlM2NHNSbFMvUnFiWmZjeThJYU8vQ3h1Mmg3WXVwWk56ZlNtUy9a?=
 =?utf-8?B?VENUUXo0SnpiSnBrdjlqSHFLSUVRckQ0K3ptdDJ5RWlYWFNjaStnZ280R1ZL?=
 =?utf-8?B?b2I2dHBoR21BSnJIS0QvT1BxUVdNZzRjaElKKzVFK3YyaUxYdytra0JRVVFJ?=
 =?utf-8?B?YmJKa0pQTk5nWjBuZlpXNlVVN1Z5NFFNK3M5OWpFb2hJc01weFEzWGhPZ2M3?=
 =?utf-8?B?K3JiUFpTQlBuZGpZLzBUem9ySFl1eFZVYWkrOVp1bjZaQ2JtUG9IUG9zZ2lP?=
 =?utf-8?B?a0lBTjBLZi8zYWowRVpVTUQ0RXRpOWRqNjJOLzJBL2N3Z3NYamM5VjZOakRy?=
 =?utf-8?B?TFRNandicDZxWC9ZbzB1VGVRaWRiTlR3VkZ2UTV6ZUZPT3hYTHhlTFNhSXZq?=
 =?utf-8?B?NE5jNTRYWkZSbmYwbVp3YmRlNlBoMG9GL0NWcndnK2o5MFR5cHE0UkprUDM2?=
 =?utf-8?B?NEVyaFNHa1piU3hpa1dRaDdZOGdHblZuQ0RxZk12TUhoZ1BXNDJINld5dWxy?=
 =?utf-8?B?cEhrYkJ4NCtITlgzQ2tjdEtWbXk4cHZwOWEzWjJUS0NpcEYxS1gyRlErU2Fv?=
 =?utf-8?B?ZFNwTWdCRFltTVFVVUswRmVLUHNlYk4ybDFBMytNaDBrdHhSS2tsaVY4aTFU?=
 =?utf-8?B?Z0Vldm5NRjVMdWxXcDdVRVFsS2VmemN0ZXZTdkUwMGNBRjczQi9PTHZCNVU1?=
 =?utf-8?B?d0R5cUpNUXJyT1Z3R3RRRlRodmlOVysrWkNNY3lVRE5oL2RXMTF3YW1tOWJH?=
 =?utf-8?B?K0lQYVBJYk5pWGVaMFFGbnlOS1lGbkVjZ1NwQlZ0TlE5OTJIUTVyVlBUemJZ?=
 =?utf-8?B?RmIyNG1qcUxQUXMwZUdQbmJEanBuVldtWVJCNVJ5Y1F4NWZTYXk1anZkL1ov?=
 =?utf-8?B?MHJuRkxrdFlXd3hrOTkzWjk5bkdqa1lEY2Q4dERERndZbG0yRUlzZmo4TTVV?=
 =?utf-8?B?SVdHTllDRGpBTnZubmN4YmV0MUtyT2o5Z1c3Y3hZVnhMRXRxV1VtZ3E1bW9Z?=
 =?utf-8?B?a0hYMUxQSkZwTlhEN2dJby9ETGZaMnkwZjFqNUgyT1lLaDY5NGQ5ZEZ1Qi94?=
 =?utf-8?Q?bsaKDT/IFcU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STg2bXAzVERJSTFMTDllWjZKYno0b0k4d0lJaW5JSmE4cnErZG9MWnhpN0RD?=
 =?utf-8?B?cWgxWDU2VUdDNjYzeHlsSE1WZnJvazhwbGdSYWZNbUFLK0txVWZRdzNNaFp0?=
 =?utf-8?B?SEN0V3VqN0l1QkxsNWVUOURsMCt3UmVLTCtiZzlWc25FbzN3OWVEMlJILy94?=
 =?utf-8?B?aU5Tcjc5NE5LUEQyNzlYQURzNXNOY25ZemxuSThvKzh5ZTFGK3FEdzh3dkJi?=
 =?utf-8?B?cXFvUjZ3MnJPWHYrWHpjQ2RBZ0lIdy9vYTlqT1A1RFV4ZkdVWFVsYlNERlcz?=
 =?utf-8?B?MUNhc0JlY2pUMjRINk1uUWx5clN1cHc3NS9IbmZkUUZPSk4yUElrVkQ4UXZT?=
 =?utf-8?B?MXh3RGtRWkJrQVdkejdVcCtvd1lhOXdDYjFOMU9Va1IvNy9SM0xzYWZHRWZF?=
 =?utf-8?B?OXQvL1dzdmd4YkV1dDBJeFlyQW9mT3JZdGx3d3l0cWpUNTlMLzczcTk2N2F2?=
 =?utf-8?B?anF1VnVGMW9GT1FqV3J3bmtiU0MyOEM1bkhxeUdUeC9jTGxxT1JNZjd2ZmRG?=
 =?utf-8?B?bldqWUxYbDM0YzA3amxsK1FiU3ZRdkc4OWZ3cEpzZUVkRUQvSUhvNFMyUDBa?=
 =?utf-8?B?RjFYd2hERU9SYjFCMFE2clRzems4dHhlemR2MHN2QWdpZklLTmpiR2NZRm1C?=
 =?utf-8?B?YVJaeERiMXNJMHhWTFFmTVNmSFh0SWI0bitSL0FyVVhMZXZSOHIvbWN2elNp?=
 =?utf-8?B?d0RBT1RlVHp6WHU4TUswWCtXNzJYV1BWZ3JuK05lM1VzTmk4bytIV1FRR3hY?=
 =?utf-8?B?RkhHeGhBVjNtbVQ4UUJWMGJwWS92MjdMNGdrbnllUEJBTlBVQUlOa3RNYVJQ?=
 =?utf-8?B?a0RRVXd2TVNXVFhMTXoweVE4TnY3NkoxV0lWOW4vS1RkMVBmbWNzU2syTjhS?=
 =?utf-8?B?bHNNRTh3aGMyOVpJWUZUTHpRaFA5WTd3eURaalZiQmUzN0dNS1JkK2cvdkZR?=
 =?utf-8?B?TnNSb2J5UkdmZjYxSDRIVk1JejRLUitpRU0zdkMyYVBMdzhUajRSVm0vNTVS?=
 =?utf-8?B?bkVwVjNLNWlHMmdhTndXUktpMm5LL2w5RTB0TjNXTjFibG12OW1IYTJRNzJs?=
 =?utf-8?B?eW9xa29vaUkwekZwTFkwWlF1bURFejd4azByamVwaDJIbWVuM2FYSm9OTUo0?=
 =?utf-8?B?cWkwUHhmeGRJUVpPbWxEKy9ndU8ycXlTWTNkOEQ3R1VhekdHcVBnZ2M1NUxv?=
 =?utf-8?B?b0NpZ3ZvNFFndU9lSk52MG5zb3hrVXB0TVVtTE9MSTlnTzZncXJ0aDRtMklw?=
 =?utf-8?B?aTQ1ODJHbGI4Qy9Pd0xCaDFrb2Njdm5VMzJybzlYL1FudFNCQ0NpbG1OVWNz?=
 =?utf-8?B?Wmh0aE9OeW43VGFQcHh5RXYrVUQ1RktMUVlsdXBzYjFxTER4S2I3bDZobFdo?=
 =?utf-8?B?L2xHcXowWkF2S3c5cEZvOGVXNDFnaW9tZ1dtd0QyVmhMU3BiaU9teUZVeUcr?=
 =?utf-8?B?eWNJOEZoaEhnQ0xGbUo2ZTVJWmF2MzBOSC93T1V2UHFLWXc0RDlnVW1jMmdR?=
 =?utf-8?B?S1hWbUhqUzlTRW9kbW9EbCt5eEx6QkNZQ2F0aVJMcFFYeldaQktTTXZqV05z?=
 =?utf-8?B?Ym9iSytSODFtMEQvZzVLT0NuYWFId0ROSnhpSWpUamxWbDdubnUzM21WNzIz?=
 =?utf-8?B?WGZlZ2JSQ0hTakVaeklFMWVEcmVrRzdmc3Z1ZjdQd0tpL1pCSS9KKzNzLzMz?=
 =?utf-8?B?a3pURzZyYUR2Z21qSHYrYWt5S21SNFRycXUyNmVyMUM2OFFFWkxkYnUzOTh3?=
 =?utf-8?B?bytXK2pFMi9XZjJ1aHcvUFFwN1dnTndNVHJQZ0hkUHNKMXJYZHVGckRmYUJK?=
 =?utf-8?B?dDJrM2JuejQ3QU52RHhpQUZrcVZpQy81M2ZLSitFUXd3K21NZllTNCtTQmY5?=
 =?utf-8?B?aWJldUlDRGFVSzBUakRWYTFxbGhhY2ZKanNMaDBGdFVUbUdUZHFlY01hVXVG?=
 =?utf-8?B?a3crWFRNaFZzR0FybEgzNWJETzVIbDBGdTlkeUhmdi96ZEF6b3l5MHhaQ2cw?=
 =?utf-8?B?UWlSd2JxWEpGaXMwZVE5bU9sRHc3MlhCclZCWXdHSEFkeEFkRmNXM25oTHdW?=
 =?utf-8?B?Y2poOTJWSmpHYWJLT1JWTXNDeFVFMWlBWWRybHhOd2pxd0V4L2tPSEpoUFky?=
 =?utf-8?Q?vWuQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfee13ad-83d3-44f1-93d3-08dd7c2e53fb
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:00:57.7873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivQdlghaMLSy/vrmnntioGp8F6zuaN+XQMZZ7t+PY4FSWS26hr9ihIDBFBCROoN5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6552

Hi Reinette,

On 4/11/25 16:08, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> In mbm_cntr_assign mode, the hardware counter should be assigned to read
>> the MBM events.
>>
>> Report 'Unassigned' in case the user attempts to read the events without
> 
> "the events" -> "the event"?

Sure.

> 
>> assigning the counter.
> 
> "the counter" -> "a hardware counter"?
> 

Sure.

>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> ...
> 
>> ---
>>  Documentation/arch/x86/resctrl.rst        | 10 ++++++++++
>>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 14 ++++++++++++++
>>  arch/x86/kernel/cpu/resctrl/internal.h    |  3 +++
>>  arch/x86/kernel/cpu/resctrl/monitor.c     |  4 ++--
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  2 +-
>>  5 files changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 44128fbda4fe..71ed1cfed33a 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -430,6 +430,16 @@ When monitoring is enabled all MON groups will also contain:
>>  	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>>  	where "YY" is the node number.
>>  
>> +	The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters
>> +	and allows users to assign a counter to mon_hw_id, event pair enabling
>> +	bandwidth monitoring for as long as the counter remains assigned.
>> +	The hardware will continue tracking the assigned mon_hw_id until
>> +	the user manually unassigns it, ensuring that counters are not reset
>> +	during this period. System may run out of assignable counters when
>> +	all the counters are already assigned. In that case, MBM event counters
> 
> Counters could be unassigned even if there are assignable counters available.
> 
> I think the "System may run ..." sentence should be dropped.
> The "In that case ..." sentence could be simplified with something like:
> "An MBM event returns 'Unassigned' when the event does not have a hardware
> counter assigned."
> 

Sure.

>> +	will return 'Unassigned' when the event is read. Users must manually
>> +	assign a counter to read the events.
>> +
>>  "mon_hw_id":
>>  	Available only with debug option. The identifier used by hardware
>>  	for the monitor group. On x86 this is the RMID.
> 
> Reinette
> 
> 

-- 
Thanks
Babu Moger
