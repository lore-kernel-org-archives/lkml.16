Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2085.outbound.protection.outlook.com [40.107.247.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D2292914
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142065; cv=fail; b=gfMebLdf2RNsJwMguyq9zSAlnme7xKjnrIAZA5QulobK+LXBO2zq3C8GYd3ektWsafI9iZcD/N85vJlyvee4ipylgl8VUl10WzWEE2T0GZLK6VV3eZl3WNErmHx5A0n7vcHudfIgleQizOgrDrbqEyKAXWxR6u6q842ohA7HTS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142065; c=relaxed/simple;
	bh=4VL7iWczyEythdIOGb06Nw6UaqbXVsdHikq14SLo0f4=;
	h=Message-ID:Date:To:From:Subject:Cc:Content-Type:MIME-Version; b=RVcefNOCDnKEmFWn6f3pd6bcEmb9hN/gcrab4wXmPhpLma9re3V10CWDGvbEpnPKhpwI67fU3f+Nc3UFj6F6UKYmVgWa/pxovc0zIJzhEOGJJJeUT0FChu1MFtfIwRdW/gGKeu7K+X4o61rf25hpzfTLcvVFtmYNxUzJmj7rm74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=criteo.com; spf=pass smtp.mailfrom=criteo.com; dkim=pass (2048-bit key) header.d=criteo.com header.i=@criteo.com header.b=ELUdObC7; arc=fail smtp.client-ip=40.107.247.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=criteo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criteo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criteo.com header.i=@criteo.com header.b="ELUdObC7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozRtQQoX/WceIQ9xTHxrOCwI03JrPXxpULdnwcC/2sNGURmvUpSOxbLugazzsqDMFOwoRR4OwClLnO/wpmiEcGYD1ujUDJ57yMAkc3DS38AsC+tPPmnUPoc8DqSykit5DVxwNbjU0RLFxJkXEhhxx8tuRHSgC3iubDG5AAcinqnmmRarXGrK3uJadhFyMre9Lmt8mLrhPIOVI2InH0/CkaYp0Z13CeWVfzBr/YDABzVwFii8UDB4yWMI/SHWTNgd3+/myTM6FGlmXIRSsfoUCooAVyMjD2ISEGEv18deNiXeCzQhHCbBGocHjEDbki4O7aIgTTcdyWO8vV1c3yyyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWgKXkRLXm5VKZMNmgc13NgikMeYvV1d16f9sa3QcZs=;
 b=dLlDmTK1tzm8k8RsRUh4cyZAGQUvANA9jm5TkGtKz6NCFjjbp6/1hWb3Mhz3NW+IELUDY9uQQ8OySMM+29QCp0ifIxDecn8HsXOwqGKrb3bnVXKMhajCCJdsApQjGD3h8Jg8c4lejEeZxlQfJDKrgYlGBuYWB8AOBOPcK1DgY0akbh/ylmosUN+G9NgIXQv2NTdemVi5lYqVuesGeue/Bsy7dcLjkvK2TF42vHtIduN89qX7WIBeKRHtqJ45UU1jXehG9cn9jpVsWVBGwBmHGYEVSDqSCuexcoLrz7PEzUwNV/F6vtcinXUDIV+BkZIqNc5CoF1Xpphol6mjVCd90w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criteo.com; dmarc=pass action=none header.from=criteo.com;
 dkim=pass header.d=criteo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criteo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWgKXkRLXm5VKZMNmgc13NgikMeYvV1d16f9sa3QcZs=;
 b=ELUdObC7RaLvywlFIFZpBPoNzmtcONFljFdtw2VyGLYpgnEP9iPKmnp/iCVD5mNYKRGIace7TRSvsDwZnzfcQxCq4lEU5/pM7fjrgngqBF7QgRQy/NG/YnUFaqByk6kb+vR3ukvdvZc4yLQ2etlDwSO/OU78A8B9f8sTAwsqjaX8x7zktemO3uN/fM83RONj9qSC/DXYFWw9fyyJW7MM4h2b0WF0+VyemhcAPjiA8yZijH74BJfyzvQzgie/nXKA7H8HYfliD71oA6wzuRCYifCgR7lhz/7no4jptI4ftQcIZ42gELm/QAfBUFPqpi55HOFGZhdtbqfqlgVDPVo57A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criteo.com;
Received: from PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11)
 by PAXPR04MB8111.eurprd04.prod.outlook.com (2603:10a6:102:1c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 13:14:20 +0000
Received: from PAXPR04MB8989.eurprd04.prod.outlook.com
 ([fe80::8c60:3570:e7f6:bbb3]) by PAXPR04MB8989.eurprd04.prod.outlook.com
 ([fe80::8c60:3570:e7f6:bbb3%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 13:14:19 +0000
Message-ID: <294a5a56-e5cc-44c2-841b-25ef73560223@criteo.com>
Date: Tue, 13 May 2025 15:14:15 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: patryk.wlazlyn@linux.intel.com, len.brown@intel.com
From: Erwan Velu <e.velu@criteo.com>
Subject: Turbostat is duplicating pkgwatt on dual socket with perf mode
 enabled
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0056.namprd16.prod.outlook.com
 (2603:10b6:208:234::25) To PAXPR04MB8989.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8989:EE_|PAXPR04MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 4222c18e-3ec9-4b3e-4f99-08dd922011ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1ZRdjJHc2pkWmUyMklNV2xST0xKSkRTVm1aSHRxWTFla2xBOUtQb1pzVnJ4?=
 =?utf-8?B?NmxTMlJLVENGdXZydHdZbS9JRG9tdkhueDU2SUZJTDdac0RRNGZVNGRYNXNt?=
 =?utf-8?B?TVBXSnhwaEZPWTllYU5xSTNVYk1zQmNuVHBUTC9zck9mcmJQYWo0dXpYcUl4?=
 =?utf-8?B?Z3Y2WERHWDl4RzJHUHNIbVhTN3E4dFZlR1JrOWNiV1dNek54WGhBcDd0SEli?=
 =?utf-8?B?aGthMit3c2VWN1dUZFlqc1hqb2tNd1Y4RGpnSEtRYjVmTFhFTjIrWWxGcmJE?=
 =?utf-8?B?QTIyV2JkSGdxMmd3dThlUDFYN1dsTlFnbnZla0VobWRKZGdWTFp3MDIrQWNj?=
 =?utf-8?B?VXNNNkdnajRXRUdXbkdYYmRrbTZlM05SUm9pY0tNOHJyWkh1ZCtET3VuUHBz?=
 =?utf-8?B?ZlJEUGNvczlyb054Y1d1Z1krekJSSkNWUG1mbFh1aDBsZEo2YTVSNS82YWJO?=
 =?utf-8?B?UlBKbmZIOVlCNElrYmloMi94bEZ6dHVZK3NvNnI1enlJNXYvbENGYkZSSTRh?=
 =?utf-8?B?Q1FtYXJ3eUhDbTZ3eGs5Q1dyNDhzeDNHQktCUzlYbGJtYy9EZlNYZWlsMWdS?=
 =?utf-8?B?dkxpbU5jakxHYzFtbStOK1BidFJjdEsvSWNWeWI2YjF3THFYSlZESit0RFQ4?=
 =?utf-8?B?UjBYeURzMlJpOGpGTDlrbllxdkpJcUU2VDJVWGptVlNBOStYaG5QTno1NjdL?=
 =?utf-8?B?TTN4VjNUTEZLbGM2Q3R6QzVRaTZoUGlCVjJ0ZDFnQi9mcHpyOWl3c0E5ckhx?=
 =?utf-8?B?Z0RvQTA4OTVXNTUvNjFqS0Z3REdZT21nM2l4RWdlaEovSUh3N3NvQ3hSdzN4?=
 =?utf-8?B?TUdsbzk4bHVQS2NGa1FsRGI2UHhhaG1UTGE3SkYwRGZ4NW5keXN1NzgvSjM3?=
 =?utf-8?B?T3NOOE9VbDlXeEhZckxNTWdLOW5VdG9WWitIRWFxbUNPWUVqMkRBaGVRQmtl?=
 =?utf-8?B?THEwNncxc0ZqS3VzUVBSc0FrTFFUNU96NFZwY29DWmdaWVdzVUlyeEJ5eUgx?=
 =?utf-8?B?aUhSeGlxeHpwZDQ5MFJMTkI0eFkxS3pydXZGR2s3Rm1YZkE2QWhxNGJrOW04?=
 =?utf-8?B?OTI2ZWVkRDFvZkFQYWoraVJZMUlFcTFDYk4walhmRS9aSktwdkpzUnhrS1Rv?=
 =?utf-8?B?NFNDMVgxT1E0dXIvOWM2Qmx5NUR6bTd5bFRiYUE5Z0dHRkQ5VlpyMVBEZkRD?=
 =?utf-8?B?M1VBRWd3bzFKN1dhMXV3L2YvOXFKWUlvdlV5cnpGcnN2Vy9aQVFOYkJQbXM2?=
 =?utf-8?B?MnVMN1lQOThXSVBwMWVxY1dlbjlxNFZEZEMzS0RPUk5sdUlnU1p6MWcxR2dR?=
 =?utf-8?B?ZWdBRFBRT0lMZUlrZ255WDg5Vkh1cFdxMWdEY0pYMWFpOGlUUUgzcGxBU293?=
 =?utf-8?B?TXI5TlMxQlp0TkErbXhORjZrUmdRY2luNk5nQkJvcjI5VXFiSlR4VGpoV1VT?=
 =?utf-8?B?VDNjMnRBTEFSa0dtejRySEdwVkpkS1BSWDZBOEFxV1I3NjVWL29ONWhrTkdN?=
 =?utf-8?B?R3RXWElxME03T3BhRGRLME9CMm1xdm14QjFTSGRYNjFxUkVuODlveTdmZFh5?=
 =?utf-8?B?RlBkbUk4K2VhMUZJWjdrQkpRZEVCdCtGKzdZNmhmbmpOK1pnTjJpTFFSd0Vt?=
 =?utf-8?B?ZVovUU1CNDkrV3NmRmc0OS9OK2ovTEtEL1djbUc2TUFhUnQ4cHc5Wlh1S1Fx?=
 =?utf-8?B?bHdqbSs0ckkxM0pxS2dlNE5sUnFmZlNDTFhCWXFWRjM5UDZyWlJiTGNzUW9h?=
 =?utf-8?B?dXErQ0FwWUZqSjdOdWRHYzhJNEhoNUZ3U053Q2VJdFhKQVJsNkNDRFdPNkZ4?=
 =?utf-8?B?VVRPSjh0UkVpT0FOTnRsWmprM1E0UlllRWNsaUczVk9LQU4vcVFwZzJoVWtU?=
 =?utf-8?B?eGlQOFdEYWxHMm14OFloUGJmRk5janR4MEsrOTZ2MHhKcENOQXhCOVVuSnhz?=
 =?utf-8?Q?2g6HA1q25qQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8989.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjA0VUcwSkhabDA1T0hwK3Iwc1B0R0tFbWxlQm9VTEhyczlUeFdMblJ2dnZs?=
 =?utf-8?B?MitRQWtRSEg2NTNGK1NkUS84NmkwY2pZVFR4WTNJamJqY1U0emR0dzlLQ3Rr?=
 =?utf-8?B?bFpia3hBOUhKOWZzS3ZQcTg2c1lZd3l3NWtieFgyUWdLdngyRTd3SlA5bkpH?=
 =?utf-8?B?bWNuc2hNT1gzc3M4ZFFXV1YxbE95OU15ekNmYVF5OHJrMllMTFFtTHZBcnNG?=
 =?utf-8?B?NW16VkRlOGlCc1pGMFltd3FaRExzQkdGNU1YSkJQVmtvQVR0c1ZjRDE2RVlJ?=
 =?utf-8?B?emFVK0o1MlhsN3NjVjRaZGVmYmpSYkE4ZXZGTktiLzkwbEZ0TEQ4dUExY2Ju?=
 =?utf-8?B?MUNFNk5Pc1NUTXVSaHpYa0pySU9xbGZRS1pndFV4R0RWK3hzMkp3ZDFNQ3A2?=
 =?utf-8?B?QnNUZmxLUVZxQXZoQ0o2S2Q0eU5CZ0hTelVrRVlsNDY0Qi95WUtwV0swUE5N?=
 =?utf-8?B?TGJmampuOWhSdGNDdThqUUxiZUlSemg0U2FldXZMK2NwZkN2bW1Mb1pORDFV?=
 =?utf-8?B?cEYvRXhDOUxhb3JaMmx4Znd5bkRwblNZV05rbWRFeWtMNVJMRi91MTNXWklx?=
 =?utf-8?B?L2xDOXU4OGovb0p1cmdkUU8vdHJsWlY0SXhFSy9hVmpxUlNWL0VFQmhYN3BN?=
 =?utf-8?B?L3V4Q3RRNU5PZndXd3p0QzRveFQ1TXJLY3pxa3FHNTV4MDJOaVZwL01scUh0?=
 =?utf-8?B?UWFjc0ZLb3BWMU9JbFZzUS91N1A1RFZ0dWhnU2Y3TlNuUFVEZUZvMTIwNFJ2?=
 =?utf-8?B?ZStseWtRZFkwTDVHOHN6dUtXZFpiN0V5UkJNMGNCVnVKTHhNQjBraEIyZXBq?=
 =?utf-8?B?eDhPT1RocU9DZ1gvWVlmenBYVXlnVW5zaEVxMDRSdzJYQW15V2d0YmJEc2Rj?=
 =?utf-8?B?K3RoS2RoVS9QVnNraXMvR041b001b1RTeURZOXQ3eDcvVDg5SkhxWnJHQ3FF?=
 =?utf-8?B?ZmNFdGN1N0RKeXRwRkRLYlZKTjlReWIwL3lqeVNnbkF2aE5SK0d2dzAyY0RI?=
 =?utf-8?B?S0VjL0RBYUNQVU5WdnFOb3JXZ1dVVVowbFVOM2cycUMxTjZ0WjRyM3VGamVL?=
 =?utf-8?B?SUdiQkdRendQL2NCalY3K3ZkSnVVUWp4aHdOR24zOVk1VGNhRHNuUDMxTFZJ?=
 =?utf-8?B?MnU2Y2V3UDRFUXJlRDMxYzlFaUYyS2FtMnFMNWF2bUcxWE5vK25RNjVQenF0?=
 =?utf-8?B?QkFMMWZEWkRhN0Q4ODBGbEoyNXVlTGNObnBzaFQxV3ZBK3kwcE1GNzJsQ1ND?=
 =?utf-8?B?eDJYVEc4dVppb0JYeGhqUEJyUWxrNHBZVlY1bFNjL0lsS1V0VkZ5UnFsMERL?=
 =?utf-8?B?ZDhwOHYvSVJ6SXJFL1Y2TFF2RnBQaEtIUDRWRkR6ZUxNMVlJMkJkdmlQdG9s?=
 =?utf-8?B?eHVmbzB4d3B4WCt6cHRmank2NVVBRUl5eGNNYXJzM0xUcHJoQVJrOWt3TzdE?=
 =?utf-8?B?a3BFRlZzNlVmb0xWakR3ck8rcVowVmRaK0JPbzFiOHpHOGNKRUNFVnFIUUF3?=
 =?utf-8?B?R1FNMmw2NERyQk4xa1pFUGptUHJ5ZG9mSmptTUcvczFTdGFaM0YwbG5NSE9E?=
 =?utf-8?B?VnN5VGIydHdmTEVsNll6eVFxaHBzTnRZc1NNZHJwL05ocUdqZ0pKeVM4UlJj?=
 =?utf-8?B?UmVtdW9yZWwvUVlnQ1czcnNBMUVoMUkyRmliYzVIRzJHU3NyeWpjWEQyc2to?=
 =?utf-8?B?eG15SEhNVTNpb0lrakRVenVxQk9BTFIyMzMvUTJZYmxjTlJrVmJnWDlsTjJH?=
 =?utf-8?B?aUZpaFRhMU5qN0lMQktOY0w4VCtjTVhxbWxiMGxIbTdqbUtYcDcyQ05KRVBI?=
 =?utf-8?B?VGJCWkVsUFNYVXZFa1EyUW50cy92ZUtMOU5VVDI3ZklNSGdBVjZ4OHdDaTF6?=
 =?utf-8?B?OVRPUmlRWG5UOGpNMDFZNkpCSDNieGZOWUY3MURncDFZTWRyVk5KYmsxQlVa?=
 =?utf-8?B?R3JOTUkzMDVuME1kd29PV1F0ano2ZDRmdDVUOURKdnhNZVdkMDMzRmx2V1RN?=
 =?utf-8?B?MVpSMTRDdkVwbnNLRFVKbFhkc2J2dVExVDc1amRsQ3VxMng5MlNrWlA2MDFR?=
 =?utf-8?B?VVhJRXdmM2JXQkY1eEFKMUtrTHRZdHp5M2szTmNFSXIrbmRUdTlFQWQyK3Bt?=
 =?utf-8?Q?+us8ZCyqfR9tLCx2rtjV4TRz2?=
X-OriginatorOrg: criteo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4222c18e-3ec9-4b3e-4f99-08dd922011ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8989.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:14:19.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a35d8fd-574d-48e3-927c-8c398e225a01
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DHx9m4W9kbj/taMfMdw2dMDaFYQ4MPL0hvOQSDdz+ph1y8xxYT5vZIXl/wbSBZBpfRR6s7MwH12o38cQ3s4hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8111

Hi,

I'm currently testing some dual socket AMD servers and found that 
Turbostat is duplicating the pkgwatt when Perf API is used.

I'm loading only one of the two packages and they both report the same 
pkgwatt which is incorrect according to the raw value reported by the 
SMI interface.

If I'm adding "--no-perf" the pkgwatt gets the proper value.


I wonder if you have some hints on where the issue could be in the 
turbostat code ?

I can make a patch and/or test some if you have hints on a possible reason.


Erwan,

