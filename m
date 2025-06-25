Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDFB2797B1;
	Wed, 25 Jun 2025 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868927; cv=fail; b=U3foHlG27amntEjWiHs26XtB0u0zvvtmGG2ZOXufiSjbtR0N/ju32RUYbwRfxbNKVZW/q43NPd2cD5LIiraZSQshwGCPaO7REiVHoRUEEcF2bYVpAWCtjafadSdeUnBJ1+tLOh7/dl5f5pihO6eejfPJilDz3DbbkuadgBUxe5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868927; c=relaxed/simple;
	bh=pKNt6qSkXc1dDoBtImbNFOecp5bnSJQxrOWP147nzIc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pzm6hzwaKIfVPWcvdTA8ti8CqkzlR/ct25govg6BDC5QO46bdfr0McPPFZdOMy3c8tpOOHHS1ZRvM6E/0iAOsSNpHShoa95iFGyUkEqW+gsc16Gfu451cnxqRa+SGb6mAhDcB9cQgEAVoYbt5tskcjC9H3q1+kMpSulBl2PkVMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5mdh1Obs; arc=fail smtp.client-ip=40.107.243.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5mdh1Obs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyC/mkQcKXZXvmOfoY0x6NQcJ1RCaefPVFbFsDvMCC7dceKQMNd5YF+E2DZXnUmMcfajlxxIopGIcmy8LsLj8lbaSIWfu7DPmzGoc9jDR2jx2cTaNZxzgC0fyIcZ2KC04G40uj6TfXvYH7kZxTX84UMB6GMvFm/YuwepOihJAu3uHI98bDwIBJPPjZhj482JJHlwMVhREJ2dVEuu1zSR70dhA9aPhINxLVTv2P2/uupMriUWXISSMFuNs47FECp5hlJIq3Al2JP8HzrMUxEKJG331vwzqdK8yvIzly2DH6i+fmnWLRRIB9KCl0+M5kmy2+PyyuK1Hqx02ocQ1jnIwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPlMVbcVzCTqYZPCSA1XVT56R9abLlmUooJd22Ae+Xs=;
 b=EW1Zta9FBiLb3f184OVK/uilQSVnuPO6FU21caXftgfjcWSEs9qln3XZwFI5y2LIuhGsDGDefNgUTdKFoDLcU3kDTAlShACHFlgsIUUerbbdnPRnt72iZB/sv2uuef/T/dA370isFMjrOGySRnzsHoSc3rJWXJK3KVgRRQPUG9ayJAosT9vRlMimuVAFqTSvm/hV6vhcUVRqXb/k5Rqyic0zKHom7ebMn34nsFtGuRhIzXKXVGJZpAF7q1IHRbPXUGwzJ3rKTjfNDQ4ZVtduXi67oJphfZH63f/mBVhM7GIgMnDZHPKPuvSordKHY2BREYGqsWkJaHVl7lku4RE3lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPlMVbcVzCTqYZPCSA1XVT56R9abLlmUooJd22Ae+Xs=;
 b=5mdh1ObsuKhr+qhd+t7Ce9YTpipq4HYqmRrR9wVyp+KGAFWPQ2uW8qkcLHzJTEJb/sZgMo5BQwiYqWAw4VssMpnd//m3372roRl0424NOQ90fzMt1cOjVu+4cOtU4KyvAHuIFCG+3ms1lHagOkKMCEIcx6GLMyhCEsJg57713M0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY3PR12MB9679.namprd12.prod.outlook.com (2603:10b6:930:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 16:28:43 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 16:28:43 +0000
Message-ID: <df5f6ece-0fca-4e4c-a6e8-df48da276353@amd.com>
Date: Wed, 25 Jun 2025 11:28:38 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 06/32] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <c3a7f07ae0e8d1495b778013afb09d078ee4618d.1749848715.git.babu.moger@amd.com>
 <ff41df42-6267-4684-a2e5-ab8b90ce5bb0@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <ff41df42-6267-4684-a2e5-ab8b90ce5bb0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0163.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::22) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY3PR12MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d96da6-70c1-4928-1ef8-08ddb40559b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWk1OU44Y3BBd2VUN2c1bWpBVllGMnMxVXVpeWlvOWtpc3NVdVg4NDAyLzJ5?=
 =?utf-8?B?YnVVZXkxOVRPSmNJa1d3aUtQSm1kc0VkU0MzRStUR0ZPb3h0VXNySkJsSE05?=
 =?utf-8?B?U0xCdnpBZUh6bHd3T1hiVjN5UmRaaHBxRzVnT3VhN290U1AveXlxc1o3djMr?=
 =?utf-8?B?N2xjU2wxUzJjSXBua25PbzlVUy9najN6MFFqdG40RDU1UHMwNmpOUkZLUGxo?=
 =?utf-8?B?Yjgrai9mM3JESnVaTkJmcVlWU3RZeUp6MlBmVytseWxPR3dlR2h3MmdvZi9N?=
 =?utf-8?B?enA5Zzd4QXY2dTNuaFZkT3RpYkQxcUo2a0g1Z1M2NGFlKzI3Yno0aGdiOFdQ?=
 =?utf-8?B?RlNNU09qOW9Zd2R2Z2Z6K3E0RHFZTXM0dDQ4aWdaV2dUZnE1Q2NxY3VTZXRU?=
 =?utf-8?B?SXNER3NXU0ZoVkNnWFZTM0xaQnpKRkp5THk2Y1VaUEJzRG9saDdLTWk3NVlw?=
 =?utf-8?B?clppOVFPL0FIZ1diUkVDT2JWM1NJdEdqVTRnWVc2bTlQcFVxZ2NpMXJvQjZh?=
 =?utf-8?B?aDZFM3RpNmZxL2YvZXBKZ0JIZGVoN29DMERXMHVVbURCK3VxY0x4MU9RbDNy?=
 =?utf-8?B?VVY0L1lDaUJ0Z0RoZTVwUitIY0VhQ2o5RkdkWDNsQVpzSXljVWl5T2QwVXV5?=
 =?utf-8?B?SGRhdCtxS1N0NWVCVDRjckl3STY4OGV4alg1VVdYbVN6VTFHNzI4SUlNQ0Na?=
 =?utf-8?B?OUg5VUhSRzJGclhVbloxTUFhM3JJZ3M1Nkc3dUtEK3hjcG9OaTloUUJJaHBn?=
 =?utf-8?B?eUE1UzRpVHNMMWdFY21tSkZmTlZ5bnhRK044eXJrNk5HREFKZ0JqVDFrVmFM?=
 =?utf-8?B?OXRHRldvYkIxUUNWckhpTXBxYlg2RUd2T0NBbDBLelUxSTYxYUdxSWRMV1VH?=
 =?utf-8?B?RERLSHdIQ3FaZDJWREVERkIxY2l0Zm1zTDk5SUVSSnlSRVRMcWg1OHAyOW1j?=
 =?utf-8?B?eE5tSEdQV1NCSHppb2JTYU5NalkrQW5kNkN5dnRybzVxcXJxNVFmOFpkelMy?=
 =?utf-8?B?VlBSVTdiN0xLbE1EdG9WU003Q0dyL2Qyb3RtQ2xqeTZIaWZXMTJFM2JKNTNW?=
 =?utf-8?B?cnJlMjdVOUxFSHRhRW1KbHlCWmJWajZvMUVwQ0xubUIwNThSbFlSNGM2a3cy?=
 =?utf-8?B?czNoVU0xSzFnZU9adEd2VmZQR2Jma3VqMVA5ckFUdkZhSkpMK2xBMHBIbUJw?=
 =?utf-8?B?LzJwVUJXejlsaktBdkF3c3ZnWWNWRGxta21tWHpMdlZ0QmZVdGNQNHpDZGgz?=
 =?utf-8?B?RFowSnBVbFh6ODJRcldiVkx6UUk1Um9DWmZWV2hkQ3MxemRLbmhBYjBsUis4?=
 =?utf-8?B?ODE3UVNQWDdDVFcwcmNVc21yeUwyalEvVm5PREpnZkFYY0hyNjdEYkZuMHZM?=
 =?utf-8?B?VnlScEFTRCtoSjA1Y2JwbEEwRUlDbFFxejQ1Y0R0WWxveWQvUVM2c1hxYXJO?=
 =?utf-8?B?bUg3V0hJMUVETU5CRDdwWklMN010VEY5NDA4YWtTaFN1OU1XZ0hXZUJtWm41?=
 =?utf-8?B?aEI2bGNwY2ZSaVBDTkpnTEJBVGxkNC82Wnd5RHJFWC9EZ0pqZjlvcE53eGF4?=
 =?utf-8?B?b3NKM29TQ2dPbGdNcEkrUzJzRFJROW5IZTdOMWJBSk5JSUhzWWVDM3B5clBa?=
 =?utf-8?B?dDhpbXM4d0F5azN4OHZXZTBnRTJoNWVIUXk3eVp6SnpJSFBEaXJLa1RFcHVn?=
 =?utf-8?B?TmF0dWQxOHMwL2NFbHlKTUZUV0x6TXdVSElDUXpHTnZrSUVLaDdRaXRtV0FR?=
 =?utf-8?B?RWdRdmtqaXhhQkZWdG1HZUQwS1NZY3hwOEkrMTN5Q1hrZ3Rob1Y2NGdnM2pR?=
 =?utf-8?B?ZnByL0tUODl6SUhDQS9QNGRzNUxOOVA5ZjFZdSs5V05DTjBBSDV1dDF0L3FL?=
 =?utf-8?B?RVM0MmZGUDJ2c0JCM2FlWEpuelZOZ1F4NnVqMnhmUzlxTG9vUno1TDhJR2hy?=
 =?utf-8?Q?L91dIkXhcL0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S29qcUwxV0tQVVM5eEV1RmVvTmFodTJ0aFVNYTZYQkdlckRpZVBCSmJFdXNk?=
 =?utf-8?B?TFdJS3ZjbUk5SExvc3g4c2txcHF3elZ4UCt3NHdxTi9tUGYrZXJPOUZKTWJ5?=
 =?utf-8?B?QXpCU3M5bElKbFVWYzNZZUVudTBLWEYyc05Ed3NLekFuU2lGUDBBeGJNMUdE?=
 =?utf-8?B?a2NVQnphZnFGOWJoVGlpZUR3UGFCUXhhcENmUWZFL0pRT0twZG1Xa3B0YWp3?=
 =?utf-8?B?RDlkTWUxL1d6UHBaL0lUb2lZZ2Z2eTBVMm5UOGkrRjR3V3RMc2V3Y1lMVWQz?=
 =?utf-8?B?MGhZamJKYnBqM01oVkg3NFBwamhBZVJzck9zVndzbGVPdGxDampKdGhpSDNl?=
 =?utf-8?B?ODhoUmVwckhVZzVoanlNcTIvL3prVEtqWWlSYWxWRFQ0dzFNVEIrNHdaS0Rk?=
 =?utf-8?B?K0NJMHYxUEFWMDEwU0txV1FnNTZacXlodFVydnFSOTNaL09paFFUbnFsajEx?=
 =?utf-8?B?ZWQ0by83SFVWTHR5VmNWU1pBK21xWE9TRzVCeGZQbWE5Z2VrMllIMHJsNHFP?=
 =?utf-8?B?NkpZR0piRlFTR005WElRSG1OZ1JkSG11a3VQR1dOem01Y1ZjSHVRbmlrYVhp?=
 =?utf-8?B?Zk4yNkE4WWtjdlhEYUNxaGpaOHMzbTJ5MDkwdmVtdnNhcWh3anlKTmJQUXBD?=
 =?utf-8?B?S0dVV21OS1ozWXBMUlRCSElwcHdSWnJZZEZWeUlJL2VsWDY1WDlCMkVqYmc0?=
 =?utf-8?B?T1hpc2pTbTJSbithbUlOVFpHckJkVnczREdTeVNHSVI0VGZRLzhVRFRBcngz?=
 =?utf-8?B?dlBBWVlPK2o1bGF4L0Z0YytFQmNYMHB3ZXYyNkcyRGJ5S2RhbmR1UEdzN05y?=
 =?utf-8?B?NWl6eGlsbllHZjcxdFl5aXpyQW8ydXU3WFR5WDlZT2UrUHBQNEdDM1ZqNkNO?=
 =?utf-8?B?VzNqcVN0ekhwMnRxN1YvekJQTFhTOXYrNC9Wb1FCdW1OTWIvSitsd282dUU5?=
 =?utf-8?B?clRUMmFueDMySVRXaTgxL0UzM0pBS1c1ZHNYbW44SkkxbjJaSmZRTkRDcDZM?=
 =?utf-8?B?OG4xNkdqcEhhbmdvaUFPYTVKOGVqQllNazhmdmFERy93Y3RMT2dLUXZmMEIv?=
 =?utf-8?B?cm5uaHNKRzNOV2FPaUFSSTFXUjZJZjAxT1ZuUTJRY3FLUUhBSk5uTGY2dVQ1?=
 =?utf-8?B?RkFiZDFadDdJTkttVnd5eEJlVmhFWDRwcXlrZVgyU0JKTjJYUkNsOTN3bHhD?=
 =?utf-8?B?b1JTbThnYWFLdnVienhxK1RBYTFvYWgxUHZvUTU0alArS08vN0FPOUI5cGo1?=
 =?utf-8?B?b2N1cW9wVXlQZFZTekdWc0NrZnNHb2JDMWZCMWdHNHd5S3pHT0pOOG5XQUhv?=
 =?utf-8?B?SE9CaXpNZUJHTlhwdEpmR1Z2QXQ4cktVaTVhSzhoMzFDRllTamZDZnlmWmNM?=
 =?utf-8?B?SzZkbll1QWIyWXRqSW1ycmJ0MStOMEpoVU1Ka0dhcXllRmRMcWw2RDNnZnNj?=
 =?utf-8?B?cnl5b29iS2dxR3FSUmF2N2E3aVRmRmtVa3N5Kzh6WE5ibk1QMWxVS29PSzJ4?=
 =?utf-8?B?dkJnQVZTa24wVnNidklIVFEreTRtaHdOV3RSNWI2ejJRc1d1RHlNcWpZNktB?=
 =?utf-8?B?UThkNHlMcWoxWjM5Uk5JWTJkQkNjZlhZU01iYzdDWlRhSUhZemYrVlVTZGRq?=
 =?utf-8?B?NURZVStjZFppN0szUHF1dWdicVB0OUxCb1Q1STBSVzVja0Z5bnJIQ2NqREI3?=
 =?utf-8?B?SlduYWlVa09ENHpWWG8zRTh4N3RZNGlWWVdGRks1d08wNHhDakpweEpqdkQw?=
 =?utf-8?B?alVXM1U3b2ZrbW0yMlVVUHRqdkVOOFluOE1vZzRER2RKWU1udkJ2R2dlNVk1?=
 =?utf-8?B?YjZ4aUl0cGlzSEZJdDVZVHNVSCtEVUpxUTd3MW10dEQrUTFUTGZWTVFEQkI5?=
 =?utf-8?B?cHM4cmdSeXlwNGhqbHRKZDN5OEFwRTd5Q3U4eVJWMGhObDRHYVloTFk1R3BD?=
 =?utf-8?B?NnA1V2J1SklJcmhMNWNQN3Uvbm1IdUUvMk9jdWt1RUJKSXhOT01BaWhhWHYz?=
 =?utf-8?B?aTNjQXZQdWZLbW5QVG15NGt5UXp5VHF6dE9YN0VXdGE2NjNyblcrUkJjMTJR?=
 =?utf-8?B?bEZPczBCVk9KNnMzRmtxck9NN3ppci96UWF3ckhQdy91VGk5M2FYWVMrTFlP?=
 =?utf-8?Q?PooE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d96da6-70c1-4928-1ef8-08ddb40559b9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 16:28:43.2459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f074WZCWw1V6uQsDohg5Qa6aTiLFVQhzI5m+L1dj/GNA+uT2h2lcwb9KDFcPTJQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9679

Hi Reinette,

On 6/24/25 16:31, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
>> Users can create as many monitor groups as RMIDs supported by the hardware.
>> However, bandwidth monitoring feature on AMD system only guarantees that
>> RMIDs currently assigned to a processor will be tracked by hardware. The
>> counters of any other RMIDs which are no longer being tracked will be reset
>> to zero. The MBM event counters return "Unavailable" for the RMIDs that are
>> not tracked by hardware. So, there can be only limited number of groups
>> that can give guaranteed monitoring numbers. With ever changing
>> configurations there is no way to definitely know which of these groups are
>> being tracked for certain point of time. Users do not have the option to
>> monitor a group or set of groups for certain period of time without
>> worrying about RMID being reset in between.
>>
>> The ABMC feature allows users to assign a hardware counter ID to an RMID,
>> event pair and monitor bandwidth usage as long as it is assigned. The
>> hardware continues to track the assigned counter until it is explicitly
>> unassigned by the user. There is no need to worry about counters being
>> reset during this period. Additionally, the user can specify a particular
>> type of memory transactions for the counter to track.
> 
> Looks like grammar updates from cover letter did not make it into this
> copied text. For example,
> "being tracked for certain point of time" -> "being tracked during a particular time"
> "for certain period of time" -> "for a certain period of time"
> "specify a particular type of memory transactions" -> "specify the type of
> memory transactions (e.g., reads, writes)"

Yes. Missed it. Will take of it now.
-- 
Thanks
Babu Moger
