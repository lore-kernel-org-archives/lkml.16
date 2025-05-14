Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6BF25C71A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248713; cv=fail; b=OW5V5bNLl/8Mwo7yb7B/mBm/AbVujjmNJ7B8RRozzeTjd29zBEVrWvxQfSHqaAYbafP6+NvMrA/9dYa5RL5hwSIOoWJZU20iQ90Mm5ezxw7qLzbwlRQNAk2UF1ChMcf2O7w5SZJS3tJWAgk8XH+mvKFKB/q9fBl+lIVyBNYjLSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248713; c=relaxed/simple;
	bh=X5oHx6HDLBqeCQlz1Fq9ptw9WusC8SJa3AbjaeuxUt8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SsuCKbsOr8gQd+6PsQaEHeq0gS8xnGMAGyzMV+YdFmCCaBG91ZP0/p4zh3MO9aVvB0nzsynnrvuI3VFVLev/jzUjzbLeSBux0oDLyX71oVd4Y1U9ILzo1H3Ikg2OJXE6/SOrrm8qI/u0s2MNccIkS67M+GAWz2tGwvBo17JbI74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A9xYg6R1; arc=fail smtp.client-ip=40.107.92.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A9xYg6R1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwsZr3j22hEZSvHB9BCnd1HIbdKknwxJOckXLVGXMMbn7QveFFaXmitIwdLoxLQ2yOtBiS/w+GP9E+wbegJgN8n32JKpjpA+sjbPIKQu11NSuYAeUFZlXv6Xk0+ZRG0Y6mkuatPIRtA/AkDnJZY/YAi9Gz0uapGMBQiJ9lwOzxWwVxpNpioixJwIMFCUSLqUkL0FMOpJ+LqH7D55jIERIRpSs8OVTHKiZcDqm1e21ADqwo9+O7K+j8K8l9yXg060p+ClAB1wm7hc8RTHq9BooeSjT7+7KtBFhyBDEp+k+AYPLxLVvXVcx6yxF8sgpxzdRs88PXQXxS+jfgdkwf3kxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5oHx6HDLBqeCQlz1Fq9ptw9WusC8SJa3AbjaeuxUt8=;
 b=BONCJqFS3usurCyD6R8Wr9m5gB9L/Cil0Bpjfmyxjl7ITfC7mnx00G2jhoqg30LRDvp4rsX916hFEKmC1hsTwxvR0nGYCCx/+Mv90Lbl9eqRNu7+s5dS58f0Z5RdMMXxEKbnZsK6dSNZ4+of7mNPckEzSNg+okhuN9iq0vCKWhU1FZKOC/PFNai8uIBQIdVEutdHpLOWv8HziM9fOK+tVxCEmfnPGIyeHXMM/QVcb+Fl3ZnQveHg5C8NUbjx3wPWxL6d+XSiKantTmd/pR+5Wc5g5ReC0slzcypyC0RWYETBjiWQdFha6hyUD3klCso/x77UIAqYAl7uOgEI44pfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5oHx6HDLBqeCQlz1Fq9ptw9WusC8SJa3AbjaeuxUt8=;
 b=A9xYg6R1Hfwl7XfRM+kKO0xWR1Bi0eUl5pqTZH5akGf1L7KBtcD1NIORk1WqX6VJxFO1USjX/PqUblWiJqx0IebyD0SxLY6yi6lj4dEJuPYPdGMuMT/kUH28sgTM7Noq7XBRKsLuaRj+ROyhY7cgIarF66FhPI+8jiqmpQyu0Es9eFsvG1bAKIzagrrPc9zz0Da1CNmpklipmmWKgPgUfpvrLek7qM4DqRX9H2ZX9qx6DgfueKeIVPK8Oh0nEAVXRJQoqnP//DHcJh3QPtLF2srnQUQ8pxI/mIaM9+qt40xOaXmjghDdnYcdMHglG0PeA3K+pygvH+seZSv6qbYzhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Wed, 14 May 2025 18:51:47 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 18:51:47 +0000
Message-ID: <0e0c985a-175b-4f72-8014-8cecf5220720@nvidia.com>
Date: Wed, 14 May 2025 11:51:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 25/30] x86,fs/resctrl: Move the resctrl filesystem
 code to live in /fs/resctrl
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-26-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-26-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::10) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|BY5PR12MB4034:EE_
X-MS-Office365-Filtering-Correlation-Id: 8260c1cc-17c3-462c-1f3b-08dd931860ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qm5Held1RnNjT3pPQUFSTU5IRkFkSGc5dENSSDV4SGhwZWIvSHFOMFZvMzdr?=
 =?utf-8?B?M3JiL3lqTi91VFVibklINnZtcmFuTGxxV2NXZU1wSTE3KzZ4SFJ5ZWRNSGta?=
 =?utf-8?B?NXgvOUxILzJxZTVGY3Q1TGpXWkNvY1dzOWd3UUxuODBwMnE5dU5sNmxITVFv?=
 =?utf-8?B?VnlQUUdleEkzQTBNYTdONGQ1eWpIdjBNSm5sNDdFQVJxaHNRR1JwSkJGeEg5?=
 =?utf-8?B?K1NVN0MrdXpRTFFzWXI5UFZHbWg0cWZsUm9kUytYN2pDTmxnY3pESjBZQ2pS?=
 =?utf-8?B?SUl0VUUybWozUDRmQWtkaVV2YTV5UElGZm9CL2d4WjBhSTBtQW9lejNlQ2h5?=
 =?utf-8?B?YXd1MUFPWE8yN00xRm1iL0l2TUtjNW5zN1hlL1JBWXRkQ21HTUNVMlluMWJy?=
 =?utf-8?B?clhCdUhlYW9xOXFRZDg4czNIYzkzZFNOVXlxRlRLRkc4SVBxdDQvRUdRWm5m?=
 =?utf-8?B?NmNoNmZtaEJlaC9ldGdvVjZOVkR2Y1lqdEJpMFZTU3FROWVzKzVoeDZFc1Rh?=
 =?utf-8?B?dlNad1pmZGg0amxyN2ZkNUd2MkNFblFHNkVMaTl6dDc4cEJHdmU1TXkwTVZX?=
 =?utf-8?B?T0FaemhaMGM0bEU3ZFAzb3FJSUd3Qk9HOVBtd3l0MkdpRFBFMTJ1a0IzNTBn?=
 =?utf-8?B?dThhQ1cxOEY1T09ZQ0YxZFE2SE1xSTNRcUNEZUhwb1UvUTQvY0RPUlZMTUZG?=
 =?utf-8?B?c1ZoRGJsTHBBZ0VmaFZ0Z0h1T1UwUlJlcXVHMVpUOE9RaTZhMmtMckNBbktC?=
 =?utf-8?B?MlkxUjB3ZjM1c3JPTzlNSVBadlpndXJ5RjlYRC93a2lGLzR1ajhZYTlTVDRi?=
 =?utf-8?B?eVpqVWYyMXE0b2twMTVPM1NPMXVuanI2eW5PVlNKakQrVDFQUGxsSVJORDRm?=
 =?utf-8?B?OXlzUFlBbDFVZkFMZTQraC9NWlp5cTZrT3VpRSsrUjJxSUdyZzNUWkdxbk9F?=
 =?utf-8?B?NTB6R09pRDk4c3daaDQ3VityeElWcksySlBUR3Q5NjRnNGhhY1hCTnphUGl6?=
 =?utf-8?B?QXpQNEJUazduK1BSMDdNTjJCT3RucTR5NTY0bWMrbFk1RXlMZzJ5RFBHMDR4?=
 =?utf-8?B?SWxUVmNtQVpCdE1oSm0xajIvMW9lTGNaYUc1UDRkM29ISjRSaFdOWEUvYVc2?=
 =?utf-8?B?QlVMSjZkbm1PK1V6U2FGaWRtRmtyQ1RlQndmbExqb0ZpQTBlTkg0UFgzcFNz?=
 =?utf-8?B?VEtFUmxTY0V1UTMxc1BTYjE4Mi9YMC9nN3pTWC9mS3A5dDFMWUk4L1dueEZO?=
 =?utf-8?B?RGZIdnVaVW9xUTk1Vnhpc0lQVEdYb1RtN3BNcVorZ05vcGpoVnlxYk9OZFph?=
 =?utf-8?B?SUFkeTNBTDQvOVhac3V2emZQbUZBTDB6c1V3ZW1BQmwwZ0tLbEZrbzVlUkkw?=
 =?utf-8?B?TnFiM2pQZ1NLdGZtL2tUclZHckFiZjhsSkRHOHlYMzF6Q2NQNnRSL0s0eDY2?=
 =?utf-8?B?R2tYd2hYV0hrV0FGaHNzdFZyZWp1aEtGcFBDZmRPdTlXa2xjd29GUGVpaUEy?=
 =?utf-8?B?RWxCRjdkdDdyUERFdHZ2OVNQUkV3WE5BalNaK0x3a0VqOWl2SE5pWld5Zit4?=
 =?utf-8?B?M2krUXlIVDR3V1pYL3ZFL0JXL3kvQlRhaXV0N010ZVVReTlYMHVUZ1JWd0tz?=
 =?utf-8?B?RDhIbTk5UDNLcDNZREdOM1NIMTF0aTJXSngyYmVSTjZsdEZlWTRLcDZQZUdi?=
 =?utf-8?B?RDBBZ2RFaWhRekFGMzExYnFJOWhsK0NoWmtwVFQwalBpRWRkOHJlc2Q4ZjBO?=
 =?utf-8?B?STJqRUJQWUJWaVRlajJpNUNDbWhxYkM5TVpUSnp5Y1FlUngwWXRNRDJkRnFZ?=
 =?utf-8?B?aGN1MmxIWDNtaGYxeis5Rlp2Z1BqektST1ZaYktuZm4rSVFLenF6aUQ5WHQv?=
 =?utf-8?B?bXVGVXpIMjdwV0VFNUpZcEVlSEVaSzY5Ukl0ZXVtSFB2SHZuU3BzeExFeWhn?=
 =?utf-8?Q?KPAnpGNG4Ps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXZtWENOWVU4MngvaFhDK05zVFVaK29tVUlVVFNOSnhNUGlrcnd6WkhDS3Js?=
 =?utf-8?B?RDErWEFac05CaHRrTTJkVDdiQWdmMCsySnZOQmNGUWY2T0NwVWtxL01TeWVG?=
 =?utf-8?B?a1M3RnVUZHQxY0lHNGFWd3F3QzRoWHA2Mllqem1xd090NDRFL0pxZjVQZlRU?=
 =?utf-8?B?VnM5dUJXRnJwNnljKzAvZWlNci83czRBRngxOFRVRTJJTEFkbGJHM2dxTFFv?=
 =?utf-8?B?UDd5SkN1enEvYzZKWFl2cXRrd0RqajBIelM4RDN5V204bGNBR1dzTTdmUmFw?=
 =?utf-8?B?dzgrek55ZkZwRVE0K0NhS0FwUUVGcVJoRVQ1b21hL1RZN0NzSzkvSzgwbGpD?=
 =?utf-8?B?U3dwQXZSYUY4aDd1OEwvZksxci9ZRjVPd1BjY3htL1ZsQkp3K3FhMWpBanlZ?=
 =?utf-8?B?WVg5ZFRad0VsTzJvQlJ5SldFdTdWU0ZzVTRnbjY3bEVTUy9yTjVjb3hrSlNp?=
 =?utf-8?B?TERQQ24xdVpyb291U2xrZkJxajlyaFhrbXFnbUxldDNmRkxyV3VaOVlNTmh0?=
 =?utf-8?B?K0FJYkJhekdLQ2lMWkJERUtLU3gvRXV0SGJydUEvM1U2STJrMllVRkNXUk9B?=
 =?utf-8?B?TTV3L2JWdHdSSUp6WFBMVS92WDFuNWNFRWxaY3RzbisvaUlOc0dLNUlDS1l6?=
 =?utf-8?B?ZWJtVHpMMnJtNnJ1ZmtkaUEyN0J4OEhJb0xDcVRqeUU1Rm9kbGNDMThBbnFN?=
 =?utf-8?B?ZDV0ckN0WVcwSHora0tkcW9wMWVKY21JTGZNUGphNWo2S3B5NXdwaExTNFg3?=
 =?utf-8?B?aXNtV01tUmVlc1NrK29YcVpobTJXQjYzQ2xleGR1NXNIaVNpUnNmWkJESDRm?=
 =?utf-8?B?ZjFYOHZXcTVGaU4yNm9FNCtWZHhFZlVJYWdTMzR5TlhOdGg3b0VZZ2Q4SDRk?=
 =?utf-8?B?M0k5V3d4TmFPYjdwTXE3UkwwN0ErVlZ4dVAvZHo1d09oeFB5V2NxRi8vN0h4?=
 =?utf-8?B?ZnNtc3MwVDEwTDcxQTN3Rmh6QWxOZ09WdHo1cWZlNWNCWVdjYjhIN3l2Y25X?=
 =?utf-8?B?VEtYaVhXNWt4bTVMNUQxbjM5SlR6ZzZoUWZaTGpLTURiUUQ1eWZuZXlQMTZi?=
 =?utf-8?B?RDlTMEZYSmxSa2J5cWJXRyt4KytubEVQZU9RZTFSdE9FeVVWNDc5WVd6NjRz?=
 =?utf-8?B?REt5OTZvdGxKeHpNelVaVzdybS9zNWl0dkZLb1RKUk1NMnRSL2lTUklhd3lX?=
 =?utf-8?B?RmR6S2MwVFFHb3dpV0tnWUJPOFR0QjRBalptWmZCVDN1aFdqOUhBQmJBc0V6?=
 =?utf-8?B?eE92aGNYdTlsVUNUM0xaNzRCZk5scmRnVlVRUmZaQytsV081VDNFcFVKUVdr?=
 =?utf-8?B?QXoxSGVzQnVxSVoyZjBtL2VycUUzaTdMa2dXT2tXR1dIbk93TWp3dnowUDBk?=
 =?utf-8?B?M1hXWlRBOFNtRWxBbHl4WTMyMU81Y05Ca3pIS3NyT2U1WW10RXBiRk1UcEhS?=
 =?utf-8?B?V2tBNCtjZTMrUmo0QWZYeWN0RWtKMTlrSGhQcmxCMCtEK05VZm84cDRwZSs1?=
 =?utf-8?B?SUlOaExFWkthR280V2Y1S2p3eElkSytwelY0OHFPRVI4WmUyNWFQMDlhMllw?=
 =?utf-8?B?K21na2RtaVNDVXRZdWZaZCtaMTdMdUdxYTBlaTFiTWhwQUtndThGRVd4UnJE?=
 =?utf-8?B?OHUyK0Y2aVhRL1BwRURvNFBzUEY4TTU0cDJyd3d0aXFSZUZnRWZzYS9oZ0Nl?=
 =?utf-8?B?V3l3bkVBVDFrVC8yVFNBazZBWmZia1lNTDBkVHRyV1Q0SFFmb0dZZU1Xenoz?=
 =?utf-8?B?Slh0N0djTVRlMXd3Z0JxNWdMbXoxK2h6MTcvUmIvazhFRWh1Tzh6VXlmVzNV?=
 =?utf-8?B?RFVtWXNiR2gybHhzdzlXSnJMQjVkTHV1ZFlZUmkwNFNJR0JWczZBcGs1MVFH?=
 =?utf-8?B?ZnBnMWUwYXgxYWNWcDBRTHFmL0gvTFpGWk9yT0JtOGRDNnNmVmQrNVhlS1Zz?=
 =?utf-8?B?TVdYY0JZYUF2RG1FTVdpY05GTEJQdkdGNG1xTmNCaGxiYmtJREFhUjFScHVj?=
 =?utf-8?B?Lzl6aitFbUJuQjhQTGlZOEMrMVlzVkpvcEtlcThLSHNSMmtlVGxnRE90eE1r?=
 =?utf-8?B?WWhGdU5MTVVyNndUUWdnZU9uZ1VOOEJZVXVVWFdEbm5rNGRiN1g2eUJXYldC?=
 =?utf-8?Q?u3TiRsineM+dxxuY6b7aSLQbq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8260c1cc-17c3-462c-1f3b-08dd931860ce
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 18:51:47.3086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIOCbJfe2UOU0yh9DmVhBvcJnBklgoLb6yY9knvKLs0W3GCtEi3dTqPJipoSO+RLxxyCzm9zT+q2mUzXx9P45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4034


On 5/13/25 10:15, James Morse wrote:
> Resctrl is a filesystem interface to hardware that provides cache
> allocation policy and bandwidth control for groups of tasks or CPUs.
>
> To support more than one architecture, resctrl needs to live in /fs/.
>
> Move the code that is concerned with the filesystem interface to
> /fs/resctrl.
>
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

