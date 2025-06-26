Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19271DFFD
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750896641; cv=fail; b=buLw1MecBnVUzsQqkAdhNoRbrRoA/qnrinAe4jF5HZFkC0lR8fBa9jthTl+pXJQt8ud0vfiW8B1VakYIn1VdIhs3rRGGtPPRKXAcGJgvxqqes4eRk+mut1Or9T7JsP9g0/i61pdJLUtDhZZjATq7Qm0LaBDwrAqLyfXop8yBsNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750896641; c=relaxed/simple;
	bh=O9yboqh2YB/VwOwfc4Y0dKiuruopmtnSZpvhi5HVwKE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aaIQmEr4lKQRLk9PJgBLvtLQP4djRCgX++VR01wRw8tk18yR5mwcL/A4+gpKfvgeo4RnSXlJjhgWk4LU9+/h/7Vxw2BR7/nouK/ncTsKXe0bFu0nLKLPyUxTBFV+RHFZ2DKFEN9Rx0gjy0reaikm5rJly9ZqnCKl+gduOMl8iUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HMSe6nKK; arc=fail smtp.client-ip=40.107.237.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HMSe6nKK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMme6JSziOg74NBrD1/aeN68ycE0eOqCctgu0HyY6/GCyF4ick6WWhMRyGGmhg+3DnyQAD8ZbPzbTjvy3Kvhfq52H6cBRAsP+G/xCoXbJ/weaFUqPNSpmPyFdaKtJFWwSdbNyHaXHkwU/bCWmmKsuuh13E30Se079X9daZcRmuCu2Kn9Vr0cO0ue1FNMRptj+MLG1FmQnbjUJlFEC8wp4Eyr9LuKlaTQVbzKeXZBqkj/sfZlSjpWieUfLxHw+khZHvthvTcjDZXPNdA+kyGG9dqkgHTQiNCBSzoBKfl05QhKBwY8E4spOf5oErETTtYcnqUrBoqLMTFsgwE3uLZTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuPpRriNFcMLvFnVFPHuGjCPjs0Bqgcko0Cvi3DEnXo=;
 b=m56aesjhw6pcxjK/S9h+wYjw27BFg3ww7b/a2R1854f92UINOOdmY+FMLCHpaRah0CXvgkwhF1u4uddIPIRYxgZf6+vXlT8+ZE2Y+t+nOctb4xqXkB1UdRmckIHCVct6jJKjbcdIITJAeTBOtx0Eym8z3XKluJj+3Ab7OPYxCTf9Ly/ILyVuElBrwXCjnin6UVSXhYH7eGkCZmzPRJflGgDPmdV1H1D0V7St97TiWPsXJGvDSXewDbkjA7hz2ZOScFQRGJM6+Dq04oA2b0wu4m3ylIRlA2fSEd14iiffL5EtPlAS5st6DUsXKOvmCRx2FILoGDrZuHBGBnAF+Xrwlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuPpRriNFcMLvFnVFPHuGjCPjs0Bqgcko0Cvi3DEnXo=;
 b=HMSe6nKKefGilDyB5L1Eu8di3CXZfeJzwkuVKQhtbrAHklbn5eee5pt110vjlqiZmPCs4/pYTbT9afqmN9vOn5sLgzBOfW/zxWp95NBZcNtwHErHcjVNh8vkUyf35WCPBLq1lR1jcWUOI1SPIeyg+r+hY9LjEhUv0puuveWAsdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CYYPR12MB8855.namprd12.prod.outlook.com (2603:10b6:930:bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 26 Jun
 2025 00:10:32 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8857.016; Thu, 26 Jun 2025
 00:10:31 +0000
Message-ID: <72408fd5-bd8d-4f86-9856-b3b7858f0b9b@amd.com>
Date: Wed, 25 Jun 2025 20:10:28 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_RX-580_=28gfx803=29_GPU_hangs_sinc?=
 =?UTF-8?B?ZSB+djYuMTQuMSDigJMg4oCcc2NoZWR1bGVyIGNvbXBfMS4xLjEgaXMgbm90IHJl?=
 =?UTF-8?Q?ady=E2=80=9D_/_ROCm_5=2E7-6=2E4+_broken?=
To: Alex Deucher <alexdeucher@gmail.com>, Johl Brown <johlbrown@gmail.com>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 "Yang, Philip" <Philip.Yang@amd.com>, "Kim, Jonathan" <Jonathan.Kim@amd.com>
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx-owner@lists.freedesktop.org
References: <CAOR=gxQahs8SXmObsj-6-ux3BMpTZc=8WrSZ83hikpoBZR3OZg@mail.gmail.com>
 <CADnq5_P-60BpvNJf5W16TPbFDXRM5wtHh10iiZm2z6DEDFqn=g@mail.gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <CADnq5_P-60BpvNJf5W16TPbFDXRM5wtHh10iiZm2z6DEDFqn=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0445.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CYYPR12MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9ee765-f227-4edc-d928-08ddb445dcfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVF6NDJUbnk2eXVWUFRSdlpqSVNLR0FqUVNCR0E0ZlljWkd4ZUxjYXk5NWZF?=
 =?utf-8?B?SlJEU2Z5bDZGL25JTGFTVVhLYnFmSWMvNC9ZQjJydGpIdlNibHdmMy82aSs0?=
 =?utf-8?B?VWQ4dGYzcFUvRHZ2dlQ4NmJUenNyRUhNemFyK2NtbEdZY1ZEc1l3cXI0MkhT?=
 =?utf-8?B?eXEvaVBtZ0VZMVozVGJuenlNSnNGVEo3dG14M3BhWjlOK2h0UWRTcGxmSE5x?=
 =?utf-8?B?RlFrRUt3MnY1VFZEbTJobytBQ2tuZUZKTnZGQVhHS3F6d0pEY0RBWENoUmxI?=
 =?utf-8?B?TW84UVZGM0JQM3UyeEY3TEprdjdENjZXUXdwbFhhYzU4a0tWZmVJVGVMZ1JR?=
 =?utf-8?B?b3Q3R0tyNU0xaXRFU3dlbEhOMUs0c2NnQlN0V2ptKzZpMlZUdUFwbU10ZEFx?=
 =?utf-8?B?aHd1bmE3MS9BUnVuckhXRi9uUzc1Z0FQdVY1dFJTU2tuNGpZNWNuUTB5aVlX?=
 =?utf-8?B?Wm0vdWM1OThoMXhISmp3TzNVSmRpWEQ0dmwvSExLRTRHKzg3YWtnWDArU3cx?=
 =?utf-8?B?WURab0NBWERYWmtBM2p4R2F2VytsTi9odGZPeDlWUnErbFgxTSt3QUErQkRq?=
 =?utf-8?B?bmdFY1B3V01vckIybGRqVzNFQ0lIaFdBMnZIMWx3bmFBY2xCZmRHOXM2blRm?=
 =?utf-8?B?WDNhN3RXeUdObXR1TWQxSGxtOWNkOCsxa2E2SHg0S21XZDg2b0pSVDBOM0FW?=
 =?utf-8?B?ZGZINHpLblRlaWhCaW9qUFdUbFk2RW9ZaEYxT3RvN08wV1EyYnVGbUlEeTB4?=
 =?utf-8?B?cUV2L3pDQzJLb0Z1VE01R2VSRzlqMFc4UFFIOGRqZmUrWkdBeCtkeFRRQm9h?=
 =?utf-8?B?czB0R3J1eHd4ZDUvaVNIUWFtTXY2YzkxWEN4MnZxUXR6cWMxT3ZRRWdXSHJr?=
 =?utf-8?B?eEpZejVDMUd2N3lvOFZuWW14SVVBcHl0OGZ1S2NCYzljVVA3SXU5RkJ2ZHZS?=
 =?utf-8?B?OHlYRjlrNVpGY0lKRDVINTdCQWwxSjhqY2tHbkdIempzVWkySU1CRkNSN0Ja?=
 =?utf-8?B?OGpGZlhLYXl4c3pHVHR0REpQOVZ5VWY4eVIvMkl4TDBQWG1yZ21LT0pzcVRB?=
 =?utf-8?B?d0FzbHMrVmRCR016bHU1ZVZxUWNVWEFWVzlEVHFmenRhRFlnZmdtdHpSK0xC?=
 =?utf-8?B?MGFpZ0dyWHpvWE5nNG9pV2JDejh6WEtUZVljWDJRVE9pejRxQWptOVAvZDJp?=
 =?utf-8?B?Q0xOSmZrdmprVnBxZ3JOVVNsblNiZjFBUlVWNWtCa0VGZzNnU0ZicCtjTlkv?=
 =?utf-8?B?VXdlV2ZxRXhNRXRTSjB1ZUVjRnNqZGJ0VERhRDZJVVBuTmY3aitEbnJnRnJ2?=
 =?utf-8?B?Sk1BRlRRU1l5RlFhWjlzblNNZHJmNTNoUjRIV3FzWlVaN3laa2hFS0hTYitT?=
 =?utf-8?B?bUlTVnhHL2hYSklQTmd3eXJETXRpV3htWFRYSDF2aGcyeFhOVzlQeE9NdUZw?=
 =?utf-8?B?RENWUFlEcWpLWVgxaTZWNTIrQ1dmMmNyWkljcVFUSElRMGlRMklNejhJYzZp?=
 =?utf-8?B?LzRENGR5T2doT0lRTytUVDVnQVdWVnh0YXY1T1hkWDArTFNadHplMVFJYnl1?=
 =?utf-8?B?MytIVzIvSlM0ak1vaEJEUnNId0FtVks4QUVxaFh6ck5FcFFpV3JTM3pyVktj?=
 =?utf-8?B?L0kvNW1iYncvM0lwZWZlNUxmRUhhWTZJTWozTFR1a2F6VWt3NjBDR01NcERB?=
 =?utf-8?B?STNzcGZ2a25WWi9hRmJqWnlOZGkvTFJZMkw5em1FdFpvRzZMYkFWb0tweXpv?=
 =?utf-8?B?UmkyQW5lK1pRZ2s3SjBHL0pKdDBMYTdMdUpvWHdkZkVRNDlhY3M5Y1VNQ1J2?=
 =?utf-8?B?NFJUeDZ3NzJVT0pqcU9LRThINmhsbm42Q2dtR2RTOVp4UlEyYjY0c0F4Tlg0?=
 =?utf-8?Q?McpImyxz++kRp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2RmTm9kU2JLVXkxTHB5L2RpcElWZ0F4UDFjQWpKU2gwRG0yMlg5YzFlcnlV?=
 =?utf-8?B?S3BiQXJ4K2NkcEk3Y2RlbFJOaDZRMVppME9WR2RGQ2x6djBJY3RaOHREa0RD?=
 =?utf-8?B?NEZhV2RCUkJpVW5IaDk1MDVyN2QyVHFOOHYybnVrSVZSMktkNWdNemUyZE0v?=
 =?utf-8?B?SGxaT2RxcnVlWFp3WjhkL3RIVlJjMnVKTE1FTEh5ZUhvQ2o2QTl2U3VSN1hk?=
 =?utf-8?B?Ym5PdkhVV0xDWW05aUsxTUN0SUxmR0RxaVFucldrU1ZtSFJGUTFUeWkvb1lG?=
 =?utf-8?B?Z3NORE4rbGZuR0Q5ZE1yR05RRFNFRngxUlF1VTI5YnUzUTN3dFlLS1B5bFF6?=
 =?utf-8?B?dk9ZRUt3VlYwUEdEZFliV2lteVdESmVVT1kvdTRSRnVBS1ArbkpNK2NXSWZO?=
 =?utf-8?B?Rk5Xamh1ZjBlcXNhYnZaTWM3TjN5V0lUOVdMRkRVVTN6MnRObkR0Z0JaRDFK?=
 =?utf-8?B?eDhQYklvVlNFRHlPaE9Idi9UMnFPcEhIZW43V2lycEdJa2oxTzFVQUk0L21N?=
 =?utf-8?B?eTlwYU9rcEg1WmF4cDhqUE05Y0pFTk5HMmVCclRSQnVqYVJUd0lRR0lBUkdB?=
 =?utf-8?B?VW00MVZOOFdRbVdWcHBFZWI2QnF3ckRPa2R1N1grdGdKZk0zbmNuckhFVnFK?=
 =?utf-8?B?cjlDdnY0Nkl6dW4zOHFOZ3JGN3JvR0lFTzhHblZjU3VUOGZLcWRqb0Fxa3dB?=
 =?utf-8?B?Nlg2TkpKVTBBVmhlSDlOZnFsSlE4UzZHaXZiKytWQmpnMTdlV3lSeE5GeXJl?=
 =?utf-8?B?Z21rR0ZNVjU2U2hxWGhxMmhReVF4UnA1TUFBbU1pS0toeFppZTB6YmdUUDIv?=
 =?utf-8?B?Nno0QnhQT3Nsa05LUU42dWo1MTRYRWxJZzhQVGVJOWNRbzRzUE03ZUltRTBK?=
 =?utf-8?B?aHg5bW5EeWQxZkcyUDBRNGdQS2t4YmUrUjFZOCs1blU2bWNDMTBqcExmY21Q?=
 =?utf-8?B?VlA3eVM3czl1dTNUOFl5d3EwWEV6WDgvNk5WRFBKRm5YTE5seGdTY2tDM1A3?=
 =?utf-8?B?WjA3VnJUREhLVDNHMy9hbHNOL0tnckVvSVA0MDl6dnRGc3NFSXFtV1lsNDVn?=
 =?utf-8?B?S2V0T0UzeU0rNG9TU0EyQytIVXJxWndWNkhybGZZY3RpYmVYa2pVaHdvZ0tM?=
 =?utf-8?B?clgxek14eUpqZ2ZIMWc1L3ExNmJnY210ZWxkUktUeVdCb1dGeDgxYnZNMDVI?=
 =?utf-8?B?RVFmb1k2ZGxzT3V3UWxWcjhlZHROd0NBakNXeWQ2Z1VCamtzdmY2TjNobHJv?=
 =?utf-8?B?SVhzSEUvQkhNaFR6ZFZ2cGlvWHIvZllqTVlVWVE3SGFPUGR5bWExZTcraWF4?=
 =?utf-8?B?Zk1PRDQwZzNsc1hETjVObnNBSGlyQ2hidWZVYXBXTWZvM09lRTBKN1U2Yk81?=
 =?utf-8?B?UkdydWlLek56TEZjbnZoRHcvVEdxUktOTUpGNW1hTXlsczRGSVo3SVFmV1hD?=
 =?utf-8?B?Q0d1SjZxd1Z4RjVMNWx5N1NPVWVoWUVSNmIyU3hDVkFwa1lIZzVkY2lMVTlC?=
 =?utf-8?B?ZjVFc0Yrbml1N2RIQml6dzFxNVkxTkpySTQwUjRlRDVVSmtNaThDZk9NNTEv?=
 =?utf-8?B?dnJ5NWtqL2o4YmZNM0piZkozQWRIVXZsN2ljNGVtbi8rTUJEUTg0dkc3MFA5?=
 =?utf-8?B?WlMzcFZYNldMMDIveFpVR25BMGN2RTlWc21KSlp4K3ppcXFJb1A3dUhrdExP?=
 =?utf-8?B?b0xtL0ZsMG15ckxoNTJrNnVKYnhZd1d1Z0RLVHB5Z25NSTVSUlJicmNhejlW?=
 =?utf-8?B?VzMrWEplYjc3SFduU3o3ZkNNSmJWNC9RQWtQZGZEbmg3V1VVNDRlN0YweE4x?=
 =?utf-8?B?ZCtIc1RlNllPenJvTFkwOWxwWm9JZUhvcHpvRmh6M3ltVlNyS1ArZFgyUmFl?=
 =?utf-8?B?bzgzcXdlancyaEJBd0pYSURackZZRFVHeUx3dkVoenlLbEwzVWFhVkpocXBz?=
 =?utf-8?B?a1pEWFZ6aXQyNXd5L3FJUjlGZTBZQlFqM2U5dU9tZGhFUFM5ZjNzczY1c3FU?=
 =?utf-8?B?d3Fhdk1RZEUzaHNRWUh5UXcreXBMZHlla1UyTm8zallHb3kxZlZITjNLZFEr?=
 =?utf-8?B?a0xJekJNM2dUL2RKMDhUWHRMZDdLYzh3M2NIU2N6T3NRcG5jVmJPdnowMVpJ?=
 =?utf-8?Q?thu5d3l1Qm5A8SLMwgxsEcZat?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9ee765-f227-4edc-d928-08ddb445dcfb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 00:10:31.5611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4EsSoup382/WZw9PgI9hnguz4Q5bRGEzjEmQB7GA+t/2Ki+rn0cMSLL1NNLCwwWcpDnVakmmC4vcPdgYt2ZmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8855

I couldn't find a dmesg attched to the linked bug reports. I was going to look for a kernel oops from calling an uninitialized function pointer. Your patch addresses just that.

I'm not sure how “drm/amdkfd: Improve signal event slow path” is implicated. I don't see anything in that patch that would break specifically on gfx v803.

Regards,
  Felix

On 2025-06-25 18:21, Alex Deucher wrote:
> Adding folks from the KFD team to take a look.  Thank you for
> bisecting.  Does the attached patch fix it?
>
> Thanks,
>
> Alex
>
> On Wed, Jun 25, 2025 at 12:33 AM Johl Brown <johlbrown@gmail.com> wrote:
>> Good Afternoon and best wishes!
>> This is my first attempt at upstreaming an issue after dailying arch for a full year now :)
>> Please forgive me, a lot of this is pushing my comfort zone, but preventing needless e-waste is important to me personally :) with this in mind, I will save your eyeballs and let you know I did use gpt to help compile the below, but I have proofread it several times (which means you can't be mad :p ).
>>
>>
>> https://github.com/ROCm/ROCm/issues/4965
>> https://github.com/robertrosenbusch/gfx803_rocm/issues/35#issuecomment-2996884779
>>
>>
>> Hello Kernel, AMD GPU, & ROCm maintainers,
>>
>> TL;DR: My Polaris (RX-580, gfx803) freezes under compute load on a number of kernels since v6.14 and newer. This was not previously the case prior to 6.15 for ROCm 6.4.0 on gfx803 cards.
>>
>> The issue has been successfully mitigated within an older version of ROC under kernel 6.16rc2 by reverting two specific commits:
>>
>> de84484c6f8b (“drm/amdkfd: Improve signal event slow path”, 2024-12-19)
>>
>> bac38ca057fe (“drm/amdkfd: implement per queue sdma reset for gfx 9.4+”, 2025-03-06)
>>
>> Reverting both commits on top of v6.16-rc3 restores full stability and allows ROCm 5.7 workloads (e.g., Stable-Diffusion, faster-whisper) to run. Instability is usually immediately obvious via eg models failing to initialise, no errors (other than host dmesg)/segfault reported, which is the usual failure method under previous kernels.
>>
>> ________________________________
>>
>> Problem Description
>>
>> A number of users report GPU hangs when initialising compute loads, specifically with ROCm 5.7+ workloads. This issue appears to be a regression, as it was not present in earlier kernel versions.
>>
>> System Information:
>>
>> OS: Arch Linux
>>
>> CPU: Intel(R) Core(TM) i7-7700K CPU @ 4.20GHz
>>
>> GPU: AMD Radeon RX 580 Series (gfx803)
>>
>> ROCm Version: Runtime Version: 1.1, Runtime Ext Version: 1.7 (as per rocminfo --support)
>>
>> ________________________________
>>
>> Affected Kernels and Regression Details
>>
>> The problem consistently occurs on v6.14.1-rc1 and newer kernels.
>>
>> Last known good: v6.11
>>
>> First known bad: v6.12
>>
>> The regression has been bisected to the following two commits, as reverting them resolves the issue:
>>
>> de84484c6f8b (“drm/amdkfd: Improve signal event slow path”, 2024-12-19)
>>
>> bac38ca057fe (“drm/amdkfd: implement per queue sdma reset …”, 2025-03-06)
>>
>> Both patches touch amdkfd queue reset paths and are first included in the exact releases where the regression appears.
>>
>> Here's a summary of kernel results:
>>
>> Kernel | Result | Note
>>
>> ------- | -------- | --------
>>
>> 6.13.y (LTS) | OK |
>>
>> 6.14.0 | OK | Baseline - my last working kernel, though I am not exactly sure which subver
>>
>> 6.14.1-rc1 | BAD | First hang
>>
>> 6.15-rc1 | BAD | Hang
>>
>> 6.15.8 | BAD | Hang
>>
>> 6.16-rc3 | BAD | Hang
>>
>> 6.16-rc3 – revert de84484 + bac38ca | OK | Full stability restored, ROCm workloads run for hours.
>>
>> ________________________________
>>
>> Reproduction Steps
>>
>> Boot the system with a kernel version exhibiting the issue (e.g., v6.14.1-rc1 or newer without the reverts).
>>
>> Run a ROCm workload that creates several compute queues, for example:
>>
>> python stable-diffusion.py
>>
>> faster-whisper --model medium ...
>>
>> Upon model initialization, an immediate driver crash occurs. This is visible on the host machine via dmesg logs.
>>
>> Observed Error Messages (dmesg):
>>
>> [drm] scheduler comp_1.1.1 is not ready, skipping
>> [drm:sched_job_timedout] ERROR ring comp_1.1.1 timeout
>> [message continues ad-infinitum while system functions generally]
>>
>> This is followed by a hard GPU reset (visible in logs, no visual artifacts), which reliably leads to a full system lockup. Python or Docker processes become unkillable, requiring a manual reboot. Over time, the desktop slowly loses interactivity.
>>
>> ________________________________
>>
>> Bisect Details
>>
>> I previously attempted a git bisect (limited to drivers/gpu/drm/amd) between v6.12 and v6.15-rc1, which identified some further potentially problematic commits, however due to undersized /boot/ partition was experiencing some difficulties. In the interim, it seems a user on  the gfx803 compatibilty repo discovered the below regarding ROC 5.7:
>>
>> de84484c6f8b07ad0850d6c4  bad
>> bac38ca057fef2c8c024fe9e  bad
>>
>> Cherry-picking reverts of both commits on top of v6.16-rc3 restores normal behavior; leaving either patch in place reproduces the hang.
>>
>> ________________________________
>>
>> Relevant Log Excerpts
>>
>> (Full dmesg logs can be attached separately if needed)
>>
>> [drm] scheduler comp_1.1.1 is not ready, skipping
>> [ 97.602622] amdgpu 0000:08:00.0: amdgpu: ring comp_1.1.1 timeout, signaled seq=123456 emitted seq=123459
>> [ 97.602630] amdgpu 0000:08:00.0: amdgpu: GPU recover succeeded, reset domain time = 2ms
>>
>> ________________________________
>> References:
>>
>> It's back: Log spam: [drm] scheduler comp_1.0.2 is not ready, skipping ... (https://bbs.archlinux.org/viewtopic.php?id=302729)
>>
>> Observations about HSA and KFD backends in TinyGrad · GitHub (https://gist.github.com/fxkamd/ffd02d66a2863e444ec208ea4f3adc48)
>>
>> AMD RX580 system freeze on maximum VRAM speed (https://discussion.fedoraproject.org/t/amd-rx580-system-freeze-on-maximum-vram-speed/136639)
>>
>> LKML: Linus Torvalds: Re: [git pull] drm fixes for 6.15-rc1 (https://lkml.org/lkml/2025/4/5/394)
>>
>> Commits · torvalds/linux - GitHub (Link for commit de84484) (https://github.com/torvalds/linux/commits?before=805ba04cb7ccfc7d72e834ebd796e043142156ba+6335)
>>
>> Commits · torvalds/linux - GitHub (Link for commit bac38ca) (https://github.com/torvalds/linux/commits?before=5bc1018675ec28a8a60d83b378d8c3991faa5a27+7980)
>>
>> ROCm-For-RX580/README.md at main - GitHub (https://github.com/woodrex83/ROCm-For-RX580/blob/main/README.md)
>>
>> ROCm 4.6.0 for gfx803 - GitHub (https://github.com/robertrosenbusch/gfx803_rocm/issues/35#issuecomment-2996884779)
>>
>> Compatibility matrices — Use ROCm on Radeon GPUs - AMD (https://rocm.docs.amd.com/projects/radeon/en/latest/docs/compatibility.html)
>>
>>
>> ________________________________
>>
>> Why this matters
>>
>> Although gfx803 is End-of-Life (EOL) for official ROCm support, large user communities (Stable-Diffusion, Whisper, Tinygrad) still depend on it. Community builds (e.g., github.com/robertrosenbusch/gfx803_rocm/) demonstrate that ROCm 6.4+ and RX-580 are fully functional on a number of relatively recent kernels. This regression significantly impacts the usability of these cards for compute workloads.
>>
>> ________________________________
>>
>> Proposed Next Steps
>>
>> I suggest the following for further investigation:
>>
>> Review the interaction between the new KFD signal-event slow-path and legacy GPUs that may lack valid event IDs.
>>
>> Confirm whether hqd_sdma_get_doorbell() logic (added in bac38ca) returns stale doorbells on gfx803, potentially causing false positives.
>>
>> Consider back-outs for 6.15-stable / 6.16-rc while a proper fix is developed.
>>
>> Please let me know if you require any further diagnostics or testing. I can easily rebuild kernels and provide annotated traces.
>>
>> Please find my working document: https://chatgpt.com/share/6854bef2-c69c-8002-a243-a06c67a2c066
>>
>> Thanks for your time!
>>
>> Best regards, big love,
>>
>> Johl Brown
>>
>> johlbrown@gmail.com
