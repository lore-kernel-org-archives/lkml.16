Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D94D15A868;
	Thu, 17 Apr 2025 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900494; cv=fail; b=SAL/i8C0e+mVeSBXTxIqB4Ggq3Bq25CbmTYXxdkLd+V5FyzBX696rP3xzu6xxLjRdcwa8WRsRjsISC664GhXsM29kLR7p/4iiRoKk/AoxssKLQURjrLe9aaGWJuWjKWFVHGDlt/YIE+2AqyVy5Duf5pWTnrGbTvz2wfpcE2Ezrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900494; c=relaxed/simple;
	bh=FKd/3vkAtRlVHp/D/x90lkvNfVczF94URxO/yIbOXgE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oWrb5Ia8yx2sZG6xtFbce7vX0YEavwq94s2G+7xK8yS8dxHNmEAen63HwGK5/l21RouHRWP9xpvh/lPm9HdniZeczbgirAS0zt1boFOIBH2o/lQ4eWRIDm4lhEwF+2dP6FSH7+iO0wXEeJCMqZMBf4H1nD/8HH/rWsu7Gb3kyRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xct/q6d6; arc=fail smtp.client-ip=40.107.237.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xct/q6d6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWYsSLBFPWiDbiZHiNXG62Kd2rzLkJUVeWN2/R3IPF2tI8wIJNLhiQbce/D3Zj7FGyzmHAG+1dWFEHE5pi3IzZ8fJjHoqeaqQkxjXCHcJuAmtzKrLNkg93ELtOcQCnCKKBdlaqlIqk29JXsekAfJ7YrCT6EBHcWXQcKW3p2OM497rOOsle4TFVwDfBvaK94RUE4hlsnNxzu7WgKlMSpxTZN06vpbPLQ2gOU6b2u+JVrT9PGtIHS3s7MsOlM3KL+5INHEMQhItqiJyLMsAGT7bv7MbiB4qDRi9PfYZuoTW5y5fr5pj6LlLNks9FoCeApKSpB4lZR7xSUOy50U5dlEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xRkXtogehxAGs7dKDnJd7DnM3k2KLlBetPYe6kWwUo=;
 b=JH81wCggaGM6xgBtVQHQCPlIlhsmRXliKKoE4pqKzbRusLPXLueM1eUux46zwGqf+ntzA/DfTP7bNH7rLwpxFlXIGc+M20XsSWjnlGfuDZgnaCbxYfiz/oPPmCIXLDoqKoNpWVqmiN49b2MAzzVHtNuNVTridX03uH2ghA2BiGxoa7Se2ylZLYmWwFC5pzqeknmxSQ50dqQ58qrr5aJibuBjiZxc2Yv1WoPskVlQFo5kujo5fA2snQoV5Yb04Q/A3vgdVU6aY4UR3wQYn+7txMs7DF7l6fGIF2Ly+URMR0kNDADpRT9YZC0hmRfaBBGnBNVRERmc8nCKZQaTU/BVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xRkXtogehxAGs7dKDnJd7DnM3k2KLlBetPYe6kWwUo=;
 b=xct/q6d6UCU7ynxfqn/zU2MFCgYZI5wIqMt+hbqO6Uf3Vks+z7rvEBrgHXT1W/7X967qFLoXQ5eqZIBguPf7N2VxyDFJHEsS98NAlhWUhMV3UAaKOQDaMYrrTC5FrUplWap9oVGuqa5C9ZqYYo231HJy+8CIMFK+2eTozTGQCtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 14:34:50 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 14:34:50 +0000
Message-ID: <c3c54172-087e-4a53-bd66-7849402f4a55@amd.com>
Date: Thu, 17 Apr 2025 09:34:46 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 20/26] x86/resctrl: Provide interface to update the
 event configurations
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
 <d18beb9ca31eb013405677792377542e609ea693.1743725907.git.babu.moger@amd.com>
 <7be35258-f913-4111-b5da-c4173615cf18@intel.com>
 <7423145d-7de7-4414-85be-b7325c01b437@amd.com>
 <fda6c46d-c01c-494f-a2ba-efbcb1f331b4@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <fda6c46d-c01c-494f-a2ba-efbcb1f331b4@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:806:f2::7) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN2PR12MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: 97020b26-5e7d-40f3-22ac-08dd7dbd02ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlJFQ0pUTEJPMkNGRFBGS3kzUW9JaDk3RFJqTlhuRy82a2txY1BNSmpNZlpQ?=
 =?utf-8?B?WWZ1SkVzbjFQay9CK1NacDdsVFZBR1FkTjZOaHZqUWVIbXF3dS9yQklqSk91?=
 =?utf-8?B?RmVNdnZtSWNlS2dkK2xoWmxxcnhqVjVYYXJWNU94ZjVhTlMzTlVkMENYNFVq?=
 =?utf-8?B?VzRHR0h1ZnB4aXR3L2ZoaW8yZFBGT0ZkeVp0SFJOUXlUUlRhZ25PYTdRZUEv?=
 =?utf-8?B?cmI0K2hiZE9MSDk5am9UZzhEWTFORHVXTU1oYVJxMmVwZmNwSy9mTXRaajNZ?=
 =?utf-8?B?SG1jQysvaTdzaFhQRTZSSUd4Z00wZFhOS05ndHlDUlpuMU0vdnNxejRnY2Nk?=
 =?utf-8?B?RFN5NFFQcU12TVVUWEg3SFNZRE9DeXFVMmdXYkJlSmN5MzVhVUhrbmxpV3V2?=
 =?utf-8?B?ZklYY0w3S3lPdENDZmt1VnhZNUdDOG1FdUJGL1pSbzJvMStLWmJLa0kwMmZ5?=
 =?utf-8?B?MFJocUZsWU1ZbWpWdXNPNVZmNS96QUpHek8yd1g0ZG01K3lpUnJVZ3NOQkdK?=
 =?utf-8?B?S2lVM1JGakpmc0p1R091YUliN1Q3cWxXQjJDWFpZMWNsdjBIOVdkVklmSXZn?=
 =?utf-8?B?b3Vzb25aMUF2YTBkMEdNMzdGK2R6RVVyRDB2c01NM3hkQTZNWDNaRVkzSFRM?=
 =?utf-8?B?ZHM2SWpwNUUyQWU1K0tHOG9EMFRwcTRiQ1JVK3dEcFFCYi9MSUtTVXJKbFdF?=
 =?utf-8?B?SE1wUG01MHM4OEMwTTVJRVBPUkNsOFNhallUWjByWGFua2FSSlFNakwyeXRm?=
 =?utf-8?B?WjUxeElmcGNodjd1SUVmcFBEbFpoUmpJUFYzSzJvYWlWUkNpc0h3L0JCY1M3?=
 =?utf-8?B?OHRUWTA5WDU2UThaSkdPUjBqaVBnOENxdERmSS9wV0s0d1pKZzd2OXZvQllD?=
 =?utf-8?B?dG1XUFRkRlo0Ry8xU3hGaFpSVXpYN0NIaUFSOG0zZzExdDFQbFliUHI3Y1dW?=
 =?utf-8?B?aEdNUGE4aEZpY001QVo2NmtnYk1PcUFzWm14a2tGbjdRZVpNbFkzZ1NRRkxy?=
 =?utf-8?B?YzRPMERIZDJ0Y3c0SVBXUC9jSUlGSlliU3hRNkpJTlB0K09aa2owbFhBQm9K?=
 =?utf-8?B?dW44Q1h1ajFjZDd4RjdmM1pYb1lUS1hQTlpLTjJDZmRYaS9zTHZqaVQwd2p0?=
 =?utf-8?B?Vjhpb1hRZW5YZXNDUDRNSmdRT2llSG9ZVHN1N21aNnIwSkIxOVhaV3NCMk1I?=
 =?utf-8?B?V2swVVJDMXNkVHc3ajZEY1pVRnN5TllOTTFFbkVYSXY2ME9ka2RIbllHZzNw?=
 =?utf-8?B?TGdCQjRabzFCZmIyVTM1dHhxZmJUaDFxTGE3ZTlxbi9ENW5UQXdxQkZGMjN1?=
 =?utf-8?B?NXVENzNOQVk1R3JtMzVBbjFnQVgxUDFOODBUU2JYSW1XQmR2d2dvTTNSVGUv?=
 =?utf-8?B?V0lzWnY4Z1o0am8yMkJ1ZmY0eTBpdlkyRGlOUUR1Rm1OTXRpWDdadFpkZ0VB?=
 =?utf-8?B?eitEN2czK2pkR3J3SGtTbEJJbXpsNy9vTmVueHNyZHhBdGhuMEJyaHBTaFBx?=
 =?utf-8?B?K1Mwbzg0eHR2UHRaTFBESGk5OWRhWEtVYWhTODgrSmwrTjBnMHNscElyajJs?=
 =?utf-8?B?Z00wY3lJZTdqYjNrRmZWMWdGM05ZNkRIajlqUkg3L2p2bzhONjhXbldXQVJs?=
 =?utf-8?B?aEZsTkRCYm5reFVGRllvcitIQ2xMUHpzL2RvOHpMbTkvek9rUzJ4YndBSGNj?=
 =?utf-8?B?TlgxV2xQK25ZM1NrZWIyNDhvUEgyUHFXbm9jaWdzS0cya3A2OEdaZnhjRHNx?=
 =?utf-8?B?Q3R2Wk5QaFh1NFZ5RWVhUGp3NTV6aTNjTFR2MTR1bFlNUzBiV05mYSs1UTFG?=
 =?utf-8?B?dVo4Ni9CMk9oc1RTa2dKVCtOQWh4SlV1VTJpMWQ1bVJHbHZCVDErMGNuVC9O?=
 =?utf-8?B?ZUtBZDAvb1R5dnU0MXFhZ1M3QWdWZXhLUjJmMkxFUGdCVUhpb2VxN2JHYWV4?=
 =?utf-8?Q?pTmQVQIYbxI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1c0QVBxME1VZTF1V1BjVTBzR2ZxZHRTaTJiTzFZOTVtZE8xRjg1SGwyaFEr?=
 =?utf-8?B?VlJ6cVRvS212R245TkpPd05tUnB4QXRyV2EwUG9JUVRVMTF1TEdLV29MQWZS?=
 =?utf-8?B?VXFwK2kxemtUMmUwTVkwb3JTeFNoaDVrZVlhWFdRWU9qb3JTelZ3bEJ1Yko2?=
 =?utf-8?B?QkdmbFVDTTRXdTR1VGlsNEpZVS84S3huU1IwS0g0bXJjcmU5NVJGeTNjSXl4?=
 =?utf-8?B?cHp3eVBhNUF1QTUrOWY3UzdFRWdac2NvSlpWejlkKzZ6NzBYaDgyaWV1YlFI?=
 =?utf-8?B?bXFjZG11QUFuNUU1bUl5NXkwc0tZdVdIZ09yaGNMbXJ2MDdReTZNYTN3SHhV?=
 =?utf-8?B?SDBFZVoyL1hqYkswNnFaVCs1eWlnd2c0MTlLN1I0RkllbUI5TFNlQTlBTTBW?=
 =?utf-8?B?STA1THJEWVFKSkdwWVh0Nm5PTjdUdGh4YkxYUnB2K3NBY2ZtbGFkbHJsdS9I?=
 =?utf-8?B?U1FDSGhiTGNETjlmS2xpSWhEK2doa2s0ekMybFpobm1GUTBldWQzcnkvbWpl?=
 =?utf-8?B?Z0tKTzZXU3JiZWJQRVQvR2RMRWFERkkyWForejY1YVl0bDZydlZQNGpDMjh0?=
 =?utf-8?B?STdLaU0yY1VhUmxqYytUcjlrdGt5dWlnREpwK1dxdEg4bStqZmo2cFZDRDJ1?=
 =?utf-8?B?T2ZReDZrTDZEaW9uZTg4L040YXJjaHVXeVBmeVMrbXdOSk5jb1hMZzVtanRS?=
 =?utf-8?B?aDg1azhnWm9aYURScWxCY0syS1dPbWFSelRpRzJyY0NXbnhRT3BHVlJLaHV2?=
 =?utf-8?B?ZEhIR2x4ZnFtTnJVWVlmVkNUcWVraXZwUU0xbHduY2xQZ0dPVENuSFczOE9G?=
 =?utf-8?B?SGYreXNndXp5MlQ4TkRUNS95a1pkbGxpMnFFS0RJa0NvR2Z1K3pJQXdnMG9Q?=
 =?utf-8?B?SlEzM2U5bHhIRlY0RUticS9XZThyQlhxbCtEVUppcWl4ZTJJdmkzOXc2ZklL?=
 =?utf-8?B?NjIvZUFXcE1QQ1JLdU1ZR1U1OGVxM1FwMzl5QXFpSFdPdEZoNTBVRFNZemhh?=
 =?utf-8?B?eVBUSlFnUXozM2VFMTZnSHR1VkZTS0ljN2JhaTZBa1hZWDBXOXdnLzRmTWs1?=
 =?utf-8?B?YUlBdUNDMFNrREgvZjYrTlBtY1k3UlJMY0pacEg4VmFaUWFhc1g4MEE3VmVw?=
 =?utf-8?B?TkFBazJRVS9rZWZLcDNFNm1zcU9YQXVCSEpHNXhuQ2tXeWU2KzhhVFUwZG1Z?=
 =?utf-8?B?MGwxUGxTcUtOVE1VTlRqL0JiRDlweHlzdzA5M0hSRUFjVDZwVS9hbDVqY1U3?=
 =?utf-8?B?N01QVDd5N2d0RVJseVdiWE83NFRrN1ZoSmpMS1ZsY3dvN2hpR1prNTIzdlVw?=
 =?utf-8?B?RHNYajBFbVhUZ1Y4aTArL1RKRTMwOWVTUE1xVzgrUjcxNklZU2VISnNjMDBW?=
 =?utf-8?B?bTBVSDVsV2syZlo0YlYrT24zY1A1TEdlTlYwZm1HYTMyN3h5WEcyanJIcVdH?=
 =?utf-8?B?dDJhMWtiZHhCNWZxUGUvM2ZUTStuN09ZaE52cDU4aUMvSDBJUXZSa1VNRFhC?=
 =?utf-8?B?QjEwZG94UVpUMTNwZVY5SU5lZ1E0TCs1cG1uVERwMFVvT3A3R3JwVlIvQkV6?=
 =?utf-8?B?ZTBBSWV0aU5TTS9sNWRoNzNOVjVtY1ZUMENOUFRSdWxiU2FHV2FIdjl6YkNC?=
 =?utf-8?B?MTRoVm9ZWS9hcEhtTnN0LzFtdmJoWnVPbGIydm5DNmZCd0RUNGFLZ3laSHUz?=
 =?utf-8?B?MUViN3VKSU44QnZla0c5N0RXQXoxRU1WTU0vditoKzlIZGFnNXJ0T01aNmtX?=
 =?utf-8?B?SjdDRTE0d0crVjBiMEJpbWREN0J6OFJ3eFRHT2RScFRxcVVybVdFVWI0NHM4?=
 =?utf-8?B?WG1wczUvc0VxVDhTWkViRkRVeUNNQjlsakc3WTRLQWoxSWUrMFhhQjRLeWZW?=
 =?utf-8?B?TGFBQys2M1YySXpZUkdiYmpxMk9qeXkxV2NyeWRiYlVQS3dGYW9kTmpDeFZ3?=
 =?utf-8?B?eHRqUUE0NkFTOEhyUGo4UHE2My9jTUVZdW1uQXlsa2JPbU5qcGlldUhDamlZ?=
 =?utf-8?B?WjZjUFg5Z1lTRWdBTGxLb3kzRzZ6SStJNjg0OUd6d3dzV25vWmtvRDlwenFR?=
 =?utf-8?B?RGJ4akY0UENnUDdUUSt0OGFiYUxxRm5aZm0rVFZsM0ljR1JzQjNkVFNBMTdN?=
 =?utf-8?Q?nOs8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97020b26-5e7d-40f3-22ac-08dd7dbd02ac
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:34:50.5475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRMMBOp7IrjfwnBXpthJHBLUj32jBEzXIrRSop88qRu5NQtIMNZXX9yWtpUJM140
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078

Hi Reinette,

On 4/16/25 13:52, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/15/25 1:37 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/11/25 17:07, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>>> Users can modify the event configuration by writing to the event_filter
>>>> interface file. The event configurations for mbm_cntr_assign mode are
>>>> located in /sys/fs/resctrl/info/event_configs/.
>>>>
>>>> Update the assignments of all groups when the event configuration is
>>>> modified.
>>>>
>>>> Example:
>>>> $ cd /sys/fs/resctrl/
>>>> $ echo "local_reads, local_non_temporal_writes" >
>>>>   info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>>>
>>>> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>>>  local_reads, local_non_temporal_writes
>>>>
>>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>>> ---
>>>> v12: New patch to modify event configurations.
>>>> ---
>>>>  Documentation/arch/x86/resctrl.rst     |  10 +++
>>>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 115 ++++++++++++++++++++++++-
>>>>  2 files changed, 124 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>>>> index 99f9f4b9b501..4e6feba6fb08 100644
>>>> --- a/Documentation/arch/x86/resctrl.rst
>>>> +++ b/Documentation/arch/x86/resctrl.rst
>>>> @@ -335,6 +335,16 @@ with the following files:
>>>>  	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>>>  	    local_reads, local_non_temporal_writes, local_reads_slow_memory
>>>>  
>>>> +	The event configuration can be modified by writing to the event_filter file within
>>>> +	the configuration directory.
>>>
>>> Please use imperative tone.
>>
>> Sure.
>>
>> Basic question - Should the user doc also be in imperative mode? I thought
>> it only applies to commit log.
> 
> I am not aware of a documented rule that user doc should be in imperative mode. I
> requested imperative tone here because writing in this way helps to remove ambiguity
> and fits with how the rest of the resctrl files are described.
> 
> Looking at this specific addition I realized that there is no initial description of
> what "event_filter" contains and to make things more confusing the term "event" is
> used for both the individual "events" being counted (remote_reads, local_reads, etc.) as
> well as the (what will eventually be dynamic) name for collection of "events" being counted,
> mbm_total_bytes and mbm_local_bytes. 
> 
> Since "event" have been used for mbm_total_bytes and mbm_local_bytes since beginning we
> should try to come up with term that can describe what they are configured with.
> 
> Below is a start of trying to address this but I think more refinement is needed (other
> possible terms for "transactions" could perhaps be "data sources"? ... what do you think?):
> 
> 	"The read/write event_filter file contains the configuration of the event
> 	 that reflects which transactions(?) are being counted by it."
> 

How about?

"The read/write event_filter file contains the configuration of the event
that reflects which memory transactions are being counted by it."


-- 
Thanks
Babu Moger
