Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219502AE8D;
	Tue,  3 Jun 2025 14:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748959225; cv=fail; b=HlMCedlWeuRpT13bmArz9r9Vyt9IIzAEoNoFLublsLigOA3S27EvfE/2t6DIS05i8c87jf00sOz75G0Aihq7QATlh3vMlzVCvEBHC7+kjC/E9Mn676S4wN1mC19t8NJ9Es0A8s5WL6t7zj/7mHS4ZtcuCoaPwuEaIdyjfwe1i7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748959225; c=relaxed/simple;
	bh=hfwPQOCQhDzqZutRRgQResyMSDAvAEtn7p3atcyyOko=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HtaQywNKrWbwSi7jB74FtBlUnuLq747Sf+YCUduV8S8DEOxGuEoPYGdGw97pz5ShUF62VMovmuRkaDag0KEZXEweDEMGu43/otZRctp9aD6rK7sS4KrkZpez9xCPxBxGesKdCZxZkqa/6ng5Lr1Qf5CkCelDJ5q+uCJiLvmk4u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cvivfCKI; arc=fail smtp.client-ip=40.107.96.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cvivfCKI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9b3PVY780Qs4THyuOgOTrrqQ00O2BeNyq2h4j6M2sY5YGLaRbF6dt5E2KJJADNof4O3mQFOt334de7ervu1B3doD2fxsDhZ+50QAD7O7DTutc2SfwZivGvVsaq1H8Zg+ooIyuGM+VpbW9+YcsvIYjC3cQf9NU6d7kxrSgja+DJF+X0DNU7uIEt5osC4CbBHMWk//DnAMtovofFO/XoxItIh3u/2J8QRJUGpUtb53hRbRdRk4niPlHSEpZvGTPlDyEiURw1fzm7xsoLZPB+H+A7WQ5Mt53xxPNxg22GMA6P/mV4e1IWLm3fL+WAa1AqUTE5/jP8jN18PGf7QcqRxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyABBHHdLwE/M38DFLVRRFrYTVNI1XAMEpyi4DqhtcI=;
 b=k9Zc1xziposHq7zNdhNnOtdef7SaCPXI3o3uw//s3WTOrLMmKyC4mn0NKDLjCufZ5UfSL44BWRYnrDYoAhIA9wo6+sWCA0qpyIVosgfGUGgpAqttZIA/KM1z26c2Wwl41mSvG2P1IMxuk1kooQKQq5hTTRHZWhI7LgHtTYjTCLeUQZ8m1wnKg+vSw4ETvDwcDIj+AIUNJ84i+jXCiV6eiPPZluy5G67zX1Z/JP8upaFFk5nvVNt8cUcFnuepjf/JoBR39Hcvw0DofYj//5zIPWwGNVtIVuvqq7ntmAk7uQdBhlVciJrthHuBuaeAhS6GbDjkJ4NpB3TTM1Mf9vfjCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyABBHHdLwE/M38DFLVRRFrYTVNI1XAMEpyi4DqhtcI=;
 b=cvivfCKIToL76JhrSUL4K+K6mWRM54Vld1L1I1pu2lmTgcohh9opJ7FxPV22CAQRy83LURS5NXnYl2eO53a21wfLXrrQKgPCa5r6Rpx0QhzebxIYTgZu2GtlAo/3tORyeXnX/5SJQhtwJSBbSJOJyE0cRFjKM89XQYvRjpJpLZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH1PR12MB9669.namprd12.prod.outlook.com (2603:10b6:610:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 14:00:20 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 14:00:20 +0000
Message-ID: <73f00acf-11fd-4965-aa28-34498428679e@amd.com>
Date: Tue, 3 Jun 2025 09:00:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 21/27] x86/resctrl: Introduce mbm_assign_on_mkdir to
 configure assignments
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <ec8d3053a63980fb7fd2b4fc8bba0a1cfa8a69e6.1747349530.git.babu.moger@amd.com>
 <1395b692-cc65-4d84-a68e-f9b20c37f74a@intel.com>
 <54f7b1df-7635-4c3a-8395-172806fde99f@amd.com>
 <48b40ebe-a1d5-4160-8902-729cf4ac85c5@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <48b40ebe-a1d5-4160-8902-729cf4ac85c5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::15) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH1PR12MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba0e7f0-4967-4664-9f9f-08dda2a6fa48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3JGVkRsb0RoYTJDWitPTHM5UGZxMmZkVU0zN1NYY2FyU01TVHlPNzFwOU5Y?=
 =?utf-8?B?djlIbUZYZGZFcng4eW9xekNLUkNYS0tKYTBjRzAreS91bEg1OUp0cnRoRmc4?=
 =?utf-8?B?WmpOam9JdWVuWC9KaXZzNjVjRkdFVTNSSnVNMTkrTFFFaDc1eWpWbkhXSlpi?=
 =?utf-8?B?S3FnWXk4MG42Wlpqcm5iRWM5VDBuYzFVN1dyS2xNYW1rdUFnUzJ2RTBHZ2tn?=
 =?utf-8?B?UUNiVHpCeHRmZHEvMVRMV21xcFJDQURUcEZBaDlpSXZ6clVyblN0TEVUb2Z2?=
 =?utf-8?B?VmhnR3NlQlV1b0J3R0Exa3Z2b0IzZWVpTHFQaTFZYVJUcVdBbUcvM1Q1aVZI?=
 =?utf-8?B?a2xXRWZ5UlEyRm9ncmxmUXJrRFRmYlRxYzJqclR4elRsTlVPdk1QR3VpQjZS?=
 =?utf-8?B?VU93aW5WU3RrQUpxZlUyS25tZUUxU2Z3SHR4Mmt6TVNsTTc0RklRT2lQNmo0?=
 =?utf-8?B?Ulh6ZVBqOENocmlMd1NtdkVOM2tNQkRkWCtrVHZWbm1MeC9CQnNsdU44Tzk2?=
 =?utf-8?B?NkQ5ZklQQnNPZHdNRVltWldoMTAxblpweGdUcUhQTElJSElveGZUZmNTamFO?=
 =?utf-8?B?dUNZTDhYWDhaUWJsdmxaMW4xOTFuTW1RL2ZEY0UwRlNkODVmS0RDZFhXME9Z?=
 =?utf-8?B?MmlJL1gwSUg5ZGZjUndsSno3T1pzZTVhSm5ORTdPeURxei94N3NNaU9kNFht?=
 =?utf-8?B?Mmd4YTExTVNmWFhsQ0U0ZG1RSGNPQTY4V3NvRVNhcGNaMjc2ZDNMRDhpbWVF?=
 =?utf-8?B?QXdEdVNNcTc5YmdvakM1ZVdXVnZRK2VmSDEzTFBWbFhOeEpmQ0hMV1BIVGo1?=
 =?utf-8?B?V1oyUks0YmE3TElMRjQrdWtXTlJmaDFicm41TW9sT2tXOStNZVlMQy9STzNt?=
 =?utf-8?B?YkdqTk9GaDc4MXhyelFobWZuSFFvaHZ4SEJZdnR4WTdiOG1yZ2hoY1lOV2dV?=
 =?utf-8?B?K05Za1ROaUhqcDh1NkNXWk9BTnhRV2lIQ25aVEFpZk96T1pEdzB4Uklpd2VP?=
 =?utf-8?B?U1BRd2JtQmwvZDJWVmd1NkZhektYVWhZbXNjV2R3UW4wOTlWemhlN3hoa21V?=
 =?utf-8?B?ZUhCajFrdkJQeXBsM2VLa082Z0R0SGhEaytGVnQyVWdKZWUrYk5WUmhQMk1o?=
 =?utf-8?B?SGh1TG1EVy9uRC9OY3BHUEFLK3RnQ3MyczVkRzBFcXVxZVhZRjIrdGxyS21t?=
 =?utf-8?B?STBpQmV1THRIL1pqV3A2bjkxbDRjdW5zVVdGc3dSa1JqS0hrQkZMaEd1aVNB?=
 =?utf-8?B?UlRKZTN0dDZHb0xMMlpvWEhrMG9ZWXE1c3lBdVQ0UTVLamZ4MkdPazNVd0dE?=
 =?utf-8?B?bEZWekJiWkNlTk5uRmVYTlpacXNrc2N2OHpQbDFmakhmeWpPRUJJdHRUQjhm?=
 =?utf-8?B?U01mTXg2VTRWSmlwVEVyUGFadjAyRkEyQzZtK2JMS2pyUVN2TlI2TmxlUXRN?=
 =?utf-8?B?NHNJRDdBbURZMXZkRkh5bjZ6MWZGeWtuZE1QV05GcUppaFRqVW1jVmpBR0ti?=
 =?utf-8?B?dXA5aDBmbUVpdkZmOE01WnVTeUJoSHd2SSt3ZktFc0c5VkY2TENma1BlSi9W?=
 =?utf-8?B?Mm5hOUEwUkNRaUJjL1A1STU2Wm8zMHpoQ2ozMWV4TG5NL0R2aTdxUk10eWd0?=
 =?utf-8?B?eEp4V3hiNnNkQ1dGU25JV0lhdFFRVWM2ek9EUzI4V3RGNmg0OVdpZzBPTXJM?=
 =?utf-8?B?b1VldGlZaVpTaFdDLy9aVFB0RjJIYnI1ZEJJaENnWmpTSm5VVmlZLy8xUEVY?=
 =?utf-8?B?L3dROUhza3gwS3NWUm0vYmY4NHpFYjIvWFpUTTVsV1N4U052OHN6cGtOaEVa?=
 =?utf-8?B?Q2dLbTlKWUZ0K1Rxck9oNDhiZlpmK2dmTGFDS25RZzZ3STRUQWRyN05RRndN?=
 =?utf-8?B?bHR5S0FWdWVBQTBFMkkvSmJtSjYzZithbndhTUxpR0QyRFVWNnZDWTAzOS9X?=
 =?utf-8?Q?RPq5X1qt4s4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGNsOG00cHpmVTM2OUgyRjdlQUtCcXBvV1diemh2SE5wa2psLzBkamZ4cVBJ?=
 =?utf-8?B?NmpFMXYrTmRweVpYZTQyMUpqNTNHbjJieFZRd2ErUThQYmkvbG5PdWFRSmg5?=
 =?utf-8?B?RHFRcXQ2VHhGdFVQcWY0UmZYaGtMSnVpMll1RWxGdG1DMmkvMnRqUDFnR0ZH?=
 =?utf-8?B?RnJKa1NvMHFYanFieWhLcjAzMzlFR3lBOEo0MTI5VGJSdFQvS3BGQlBabTky?=
 =?utf-8?B?VUVhUm5mQ0ZBYkJ4eTVzRGlydHhobUlmd3pIRGFNV0lpcFkrYk92N0gxYW9I?=
 =?utf-8?B?VFdiN0gzaWpVYUliMjBKWFRTU2xlQS9wK0JRbkt0ZzVQS3NsNTFjbDQxSXJF?=
 =?utf-8?B?U09pc1I4RXlZakdtbDFEamIrR2dCckdUUzhQbjQwekZjLzBpakRuODkydVRG?=
 =?utf-8?B?UW9FeTFBYit1NW9PRU5OY3F0UEdldjBTa2dSd2RMa0dkeGhXSm5kTFZkVWU3?=
 =?utf-8?B?cmtwNW9RL2MveS8ycEM1bk4rc0VadXYwZzB5ekpCV0ZLa0J0bmVjeFJFY1Zh?=
 =?utf-8?B?M3VaZWM5SmtSTFJyM1JSa3dNMmxUZndmakduM2NvN0ltVVJ2MWNjNnYzMjE4?=
 =?utf-8?B?TVg5VndnTXl3dDIrUnNVNDdhOTVtY3haRW5UTVM0OVdnZmV1VG4yNnV0VmVI?=
 =?utf-8?B?bjA3ZHFEQjhXZXF3YXJWV3REamRhVXdwTE1qTXR2eElMUWtLbUhKZzVLVkhu?=
 =?utf-8?B?aXFyc2tockxpRXJPKzY3dWF2OEVjSkdhLzNxMDROT3hVMGpmcXozMjBsYURX?=
 =?utf-8?B?Ynk0Z0hWOEdHUGRCMmw5dDRDV2p2SkM4eTZSUVZ5QzJHVlNHck93ZGM3NWVz?=
 =?utf-8?B?MURQS29mbjRHL0xwczV4TEQrSm11T1hEdTBNUlR3MXIxM2dSNDNmWTFxajZO?=
 =?utf-8?B?Y2JvdndRaVpJem5JQkRxbEwwVEo5blBCVXc2Uks5UzViVWZVY1ZzOUNneHQz?=
 =?utf-8?B?ZUpYNDJwYTI1cmgycG4xZUtVdkZOTE10bzBqZkhyNmJYTGlTOFJzNUYvS05H?=
 =?utf-8?B?MGtxeDl0U24ybUN4VDNkbkdBb05GaHQ3TVdGUWpFNzNKY2tPZGdyZ2xIS01z?=
 =?utf-8?B?SEVDMy8ySk5GcWJmWUhrRmt3VHUxZGNYb0kzNEQvVGdZRWxGL3NlanNsTmN6?=
 =?utf-8?B?QTRWSlNoZzkyYkNsRk5NNmlhdE1mSXBEZ2NMbnRRTHR1VVhONjdwTTVweTNP?=
 =?utf-8?B?YTBmbGlPUU9kaHlwWFNCd1A5QmcxMlU2akl2enZXdW11QnUyZ1VuMGhqMjM3?=
 =?utf-8?B?K1lUTjJwVnNRRjFNeVNPVG5NRHBWdE9sQzdLR0x3cXVQTXNWOFBnbmpRTTlQ?=
 =?utf-8?B?QjBlYVBjRzd1dndKcTBRL2FJaitWNnpWOW0weG9mNjJyd2x5QWw3Vk15ZkhX?=
 =?utf-8?B?NHFDMGI1SVdlV3NlYnBqZW5taWtZcWptbDZ0Tmp5S3MxNlVaa2R6MjlpaWFq?=
 =?utf-8?B?QldGMTZxWFRmVk01SzlubE9DaExlVFhNME9VVlNoZVo2aHNIei81RlZVbEtD?=
 =?utf-8?B?TE5vMFdzSWZxMGE4SDdaZ0xQNzh1blNFRVdUS3R5cmpaVFRKV1Y1OWYxSUN6?=
 =?utf-8?B?c3hDUTFlcVJNTUUrRnhYbFVCdjdxZDhWeC9HNE5hOEFTZmtKQXc4Mmg0TGtC?=
 =?utf-8?B?SmhtRjJ1WGo0VzAvN3BNUlhKRi9md25hL3JzQUxQYzBmTVdyRjFadFh6ZWZH?=
 =?utf-8?B?V25aemJ6b3IyOHdFNktLVTFuT3FHU3ZjWXdtYjVyS0doK0ViQUN0SnpKb2Ev?=
 =?utf-8?B?L2Y0SlN6RlkyRVVpOG1sWmQ5dis0SXBHbW9yNHhMSXd4VS9sa01oc2tlQUpn?=
 =?utf-8?B?SjJWOFJpMTF4N2lMcDl5Y3gzOFRJK1RXRXVIWnJ3RUg5Tmowcm9SL05HbmRW?=
 =?utf-8?B?SE03aWdPa082a1Y1T1JWUU4vNEYrQzhhczN5UFBwZENPbE9kaHFVdlFSNlEz?=
 =?utf-8?B?cHdCczFQcUJadlJSby85TjEremZ2ZTdCSU5lczRBVkZWM0lrcWkybTJpYVpU?=
 =?utf-8?B?bmovVFU5bGhEcjZtVW1Xb1E5VzFBYVVMZklBVjdNNlhwSGtNUVhxenhVMDlH?=
 =?utf-8?B?VG1wSzFFR2xVei9VWUlscExKZXo3YWUwZE1velJ1NmRacUxqWVpxQ2RIQ2Nr?=
 =?utf-8?Q?cMkFFzlU8h+fVWca/9vjOm4UB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba0e7f0-4967-4664-9f9f-08dda2a6fa48
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:00:20.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eavdkraG4uRkFR+yba2PCYc+QkKHadoXLsSd/1hkyRAKe1aC1GjEoXqT8lm1fpV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9669

Hi Reinette,

On 5/30/2025 3:54 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/29/25 4:03 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 5/22/2025 11:48 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 5/15/25 3:52 PM, Babu Moger wrote:
>>>> The mbm_cntr_assign mode provides an option to the user to assign a
>>>> counter to an RMID, event pair and monitor the bandwidth as long as
>>>> the counter is assigned.
>>>>
>>>> Introduce a configuration option to automatically assign counter IDs
>>>
>>> "assign counter IDs" -> "assign counter IDs to <what?>"
>>
>> "Introduce a configuration option to automatically assign counter IDs to to an RMID, event pair when a resctrl group is created, provided the counter IDs are available."
> 
> Stating that "counter IDs" (plural) are assigned to "an RMID, event pair" (singular)
> can be confusing.
> 
> How about something like (please feel free to improve):
> "Introduce a user-configurable option that determines if a counter will automatically
> be assigned to an RMID, event pair when its associated monitor group is created via mkdir."

Sure.

> 
> 
>>
>>>
>>>> when a resctrl group is created, provided the counters are available.
>>>> By default, this option is enabled at boot.
>>>>
>>>> Suggested-by: Peter Newman <peternewman@google.com>
>>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>>> ---
>>>> v13: Added Suggested-by tag.
>>>>        Resolved conflicts caused by the recent FS/ARCH code restructure.
>>>>        The rdtgroup.c/monitor.c file has now been split between the FS and ARCH directories.
>>>>
>>>> v12: New patch. Added after the discussion on the list.
>>>>        https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com/
>>>> ---
>>>>    Documentation/filesystems/resctrl.rst | 10 ++++++
>>>>    fs/resctrl/monitor.c                  |  2 ++
>>>>    fs/resctrl/rdtgroup.c                 | 44 +++++++++++++++++++++++++--
>>>>    include/linux/resctrl.h               |  2 ++
>>>>    4 files changed, 56 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>>> index 9923276826db..356f1f918a86 100644
>>>> --- a/Documentation/filesystems/resctrl.rst
>>>> +++ b/Documentation/filesystems/resctrl.rst
>>>> @@ -348,6 +348,16 @@ with the following files:
>>>>          # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>>>           local_reads, local_non_temporal_writes
>>>>    +"mbm_assign_on_mkdir":
>>>> +    Automatically assign the monitoring counters on resctrl group creation
>>>
>>> assign the monitoring counters to what?
>>
>> "Automatically assign counter IDs to an RMID, event pair on resctrl group creation if the counter IDs are available. It is enabled by default on boot and users can disable by writing to the interface."
> 
> Same here, please take care with the plural/singular usage.

Sure.

> 
>>
>>>> +    if the counters are available. It is enabled by default on boot and users
>>>> +    can disable by writing to the interface.
>>>> +    ::
>>>> +
>>>> +      # echo 0 > /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
>>>> +      # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
>>>> +      0
>>>
>>> Please be explicit in docs what possible values are and what they mean.
>>
>> Sure. I can print "enabled" or "disabled".
> 
> I am not requesting a change in user interface self but instead clear documentation about
> what the input/output values mean. Even if the interface changes to "enabled"/"disabled"
> I assume the interface will still accept boolean values? Compare to the "sparse_masks"
> documentation on how the possible values are explicitly documented.
> 

ok. Will look into that.

> ...
> 
>>>> +static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
>>>> +                         char *buf, size_t nbytes, loff_t off)
>>>> +{
>>>> +    struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>>>> +    bool value;
>>>> +    int ret;
>>>> +
>>>> +    ret = kstrtobool(buf, &value);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    cpus_read_lock();
>>>
>>> not traversing the domain list so hotplug lock not needed.
>>
>> ok. Sure.
>>
>>>
>>>> +    mutex_lock(&rdtgroup_mutex);
>>>
>>> rdtgroup_mutex seems only needed because the message buffer is cleared below, and this is why it
>>> is not required in the show()?
>>
>> Hmm. I didnt think about that. Do you think it is required?
> 
> It is certainly required to be able to call rdt_last_cmd_clear() and since it then
> covers mbm_assign_on_mkdir I would prefer symmetry in consistently acquiring
> rdtgroup_mutex on both read and write while resctrl is mounted. Note that
> there is also other read usage on resctrl mount that is done with
> mutex held. Having the mutex acquired consistently will help to keep things
> simple.
> 

Sure. will do.

> ...
> 
>>>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>>>> index cd24d1577e0a..d6435abdde7b 100644
>>>> --- a/include/linux/resctrl.h
>>>> +++ b/include/linux/resctrl.h
>>>> @@ -278,6 +278,7 @@ enum resctrl_schema_fmt {
>>>>     *            monitoring events can be configured.
>>>>     * @num_mbm_cntrs:    Number of assignable monitoring counters
>>>>     * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
>>>> + * @mbm_assign_on_mkdir:Auto enable monitor assignment on mkdir?
>>>
>>> How is "monitor assignment" different from "counter assignment"?
>>
>> I should be:
>>
>> "Auto enable counter ID assignment on mkdir"
> 
> hmmm ... I do not think this is about "Auto enable".
> How about something like "Automatic counter assignment during monitor group create via mkdir?"
> or "True if counters should automatically be assigned to MBM events of monitor groups
> created via mkdir."

Sure. Thanks
Babu
