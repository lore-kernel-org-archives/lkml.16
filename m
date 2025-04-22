Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F521DD9D3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344779; cv=fail; b=clJQ5pY0bjTew5JUkxuoB9Pngg03mZCSSxcDg+EkwKckV99KpUf4d/xvcYCcPcFN11Ez1uUf7U0V+dzfrGM7rR2pdy/6JZ10h0kApgVbX+ZvvSydLEtcs6JNmlY2VSqWd9PJsWoiMkqPRGdxXRO7CdNYIYMY5cqbtuiSrB4tf8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344779; c=relaxed/simple;
	bh=s4SWVVWHR+yr+5GxxDVuyKTsU9xGlPSo+nCtGXrWeQ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MQqE6lm+vMt+pvIaRg/q+xk7GSywBvcKtnmT0yl9R4LQS8hZ05vWVxDipoPWsfGd9p2kCEOjvP6xBByR7snYmgkZLRKNqsofPpXMei2pIM73DnDzV/XAKq57+7Qm5QOTcYxoeM1Ce11iPouJdu0JYdfj6a1m2G4uCSsOSjyYDOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pkoMTLy/; arc=fail smtp.client-ip=40.107.100.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pkoMTLy/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyKKRyon3b155IsPmLTKxowLn/ubtaZlh9HIXM/01GcQLziDsW8dPny3hDLr4rtDVTt0UunGuesfaE4I4Nd5PdHLV5w6zryAxizBtxGh9nPBnfZn40/UBwAmxtU28WAZ8bXlcbm/4vQC8rfboRfnn7xysI1xc0CpggV0VoUEsqzto0HuTCKC4oSBTh01VI3TF5+ByuLUJEqrQxVnbtZTT2fOwxTl0eynQG/RrRnwpZ+C91op9Il4GCtI65XO+MgCceK9Oo/yOhLKGuJPo0F8xOor6IbATCOvhC06zB7Y0dNRqcCDYU0tR3iGkVgaSngMPCKaIvpMWmwO/ij4NbuuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4AyF2TtBczr0ApANRQS/9rilLIXho4v8bvFgsbNNLQ=;
 b=V4Tq43/qmycbmm1pfUMB9sYviyVrq3UdTQ16knrMcBMHf2ZAOiLm8zSugGEuop7mcpyaWMGqCpSAncY5UNVQx61B4SnrSllU77zeHsW8r+MPtl7KO1hWMKEp9MnlcEyIxC3y/Ybj+r5njReLHqSfFRfZUg0MXBmaQepUpGAFyQ3rrb9ZPU9FGnLVEnOnnaJ830M2DIC1N6Vh3+gMhZbKNVd3k367+7LxEoVS0Y2+pse31pYUAK6ZjegWfx0vW4c5bwkh8ZYb5VwuiVT/ldzNKqeW5fJaTov+12V7PNaEsYvt2hJBq/4kI9NVftW3Kfk98SlsFvBs+SokUF2sDY9Mhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4AyF2TtBczr0ApANRQS/9rilLIXho4v8bvFgsbNNLQ=;
 b=pkoMTLy/7MWzbmWXg9t+Hlj/s0fNN/r0bRGIh5qnEQ9vJQBS/v1ZhvhYHPtoOwiIx+FDzhu8ytM2xtpiukAPaVPTM1Es2vd1iPG7YUehew7PenFQ8MSHY/zEARPSrs25wqKGrZZneQ9TayIFqg/8zaiRvAalAUN43cPm/o2Fdng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Tue, 22 Apr
 2025 17:59:34 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 17:59:34 +0000
Message-ID: <93da0002-a326-49f2-af5d-f89da9d3a8f6@amd.com>
Date: Tue, 22 Apr 2025 12:59:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH v8 08/21] x86/resctrl: Expand the width of dom_id by
 replacing mon_data_bits
To: "Luck, Tony" <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, "Ko, Koba" <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-9-james.morse@arm.com>
 <70403b1c-d81f-4c5f-936e-f3cf3308822f@amd.com>
 <DS7PR11MB6077A729E4338E6C62939005FCBB2@DS7PR11MB6077.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <DS7PR11MB6077A729E4338E6C62939005FCBB2@DS7PR11MB6077.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:6e::15) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: fa833278-50f6-48e5-b59f-08dd81c770ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1FDVUdkR2J6NTVuaFNQZXFwSHV1djB4aHRTYnJiUWZZcXZxalVrQU5KT0Rk?=
 =?utf-8?B?SUdGV3hTaWdhZ2h6R1lMT1pLeXpnRW9MWFg1Z0ZjZmZURjNVckpGUk9VR1RF?=
 =?utf-8?B?WlUxZVdsb1I3Zi81Ym0vN3RUY3V3UzdaV3J6U2psVDNUTmhMMHBjS2N1b044?=
 =?utf-8?B?TWtkbEJsVlp4WmFBSmVvVkZ0QnplS3ZtS1BRc3pvK05VSVNkQnczQW1TS0Fp?=
 =?utf-8?B?UjIyUXdtVjJwUU9yL2tPbDhLcTRzNjIxMytIYkdYOTFISzlYZDlXUmJsTXdY?=
 =?utf-8?B?cW9qaUxxak9Sd3FOdmdNRXVaK1phMlVmSnl2RjlXY3BINUtjRjVVZ3JKd1RP?=
 =?utf-8?B?U2pXb3VsVUVMOTQ0S1U3K2lyeUFMLzZET0JzMUN5WDBhSHEyTzY5R0k4Kytv?=
 =?utf-8?B?bEVjN3VsMDdvZUVoVXlxckhsMjNoeStRWmZCeEdVTGR4MnVOTG5qRVhTMVFD?=
 =?utf-8?B?N0tpQlg1RmhYeGg3d09wV1puTFhDTG1mUkFnTEgrdHpIb1FWeFd2SXg4UEhr?=
 =?utf-8?B?NjRvT29rQVE0ZW1VQXVzNldIMzc2THJYajg1blA2dWMwbnlKNlN5bDZCUWFa?=
 =?utf-8?B?bHUyOExWRnBSUmJMemZUTEU0QWMrYm1pS0RtUmpFaytad280QW9QYzAwcklG?=
 =?utf-8?B?OWtacWd0QjY1eTJBSWVpUG5iRkY4WU5CcEpleThJVm9yQVFoUHZGWVZYNUx6?=
 =?utf-8?B?VE55ZWgzQXJub3dFQi9CWmxGek1Dd1Z1akNKb1FuaEk0ejlXVjNuUXpENlRU?=
 =?utf-8?B?aWYwalgvM05OVWZ0czFsSng3OGRlVmxSK2FKS0lZd2NEU1RLSjkvaXVTUjZF?=
 =?utf-8?B?L1IvK01WV0NDMDdLTWtmeEtFSURmTmJ6Zjl5ZUJXODdWQzQ0RWZVQjFxL2V5?=
 =?utf-8?B?eCtKTzVBTmtkZVR3QzVMSUlPNmtCQ2k3NUhLVC9Da1NBeWlmZERuTkticjA1?=
 =?utf-8?B?R2xwRk40WW1yVmpLYU9rU1QvZEZUZ0tMU3cydUpLNlNXMDZFMWpsQTVWcmRi?=
 =?utf-8?B?cWpKam5nY1FnRFZ0TWxwVTBXeFliUmZkb2JjREZMNU9MUDNhNUQvNlJCMk9l?=
 =?utf-8?B?Q0FDVzNVRjRvdzVIc0YzdStkMEJlRGlMSVk4cTRzREF4dUNPbURIM1AvK0lC?=
 =?utf-8?B?azV4WmxRWjRJQnRDRlR1V2FKOEVrUWFZUTAxKzdYazdZMmxidlpRTWx3OUhh?=
 =?utf-8?B?SzV5NDdtZXBnY0tWdjJESEdGdmZuUTcxTzlvUTJaZy9Kb0RxajRWQkdOWG1i?=
 =?utf-8?B?cnYxcktoMGowc21uZHY5bjRjWmJQdTVUUnBLc0hBM0FDZ044L3NDVk55dTBL?=
 =?utf-8?B?eC92TWlZNktmeWluVzhWWEk4TDZqRnp1MUJzejBuZnJodk1sK2ZJTm5OZUQ1?=
 =?utf-8?B?RXlQK28rYU1JWS9JUExkT01kZkNYQllZV1FCcjFnQ2ROemFRQ1g5dUM2bkkz?=
 =?utf-8?B?OHBkckhvbmljTTFEdlp5RFhFNkVoc3VvWmUxUCtPci85WDc4WVpwendhLzAz?=
 =?utf-8?B?cHh1ajZKL2w4VURxcEpQbHltcXdiVEVBN1dIU2dRSVBJZnZpbDhFVWh3bWNM?=
 =?utf-8?B?TmxsS0F4M2syRlZub3o3M0Z6NmdibUxOMHR1UTcyVTZJZTRuL1Z4ZzBwVjFG?=
 =?utf-8?B?c0FFcEZKa2k4TklvQk45ZlpWQ3dhN0poSjRGR0lEU0tLczNnT1A1TTVXVE9O?=
 =?utf-8?B?dmU5UndDREJ3NEpCUUl5NlUvczBBVmtXNTZYZ3AxRytqL28zQ2kwa00xVDhr?=
 =?utf-8?B?VERLL0F1OHplQm84SUZoSk44TlZxNms3RnZhU3ZneWs5ZlZrMXBHaHZwb0ky?=
 =?utf-8?B?ZWNnMTNRKzFsZktoQWtjOGUrcVU4QnhxMUNQZUhYcFZqY2s2OXlHeFRNYWY3?=
 =?utf-8?B?M1ZSZ1VWekxCU3QvZVQwa3E2QUV2Sm9yMWZibVBkbHViSjdGUDA5YnBmemI4?=
 =?utf-8?Q?eIUfh+ypPPQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWFQVktXTVBKTjhlYmIySmpxQnhOakF5dnM5V243ZGpWV0J0dE5DNTRBUDhj?=
 =?utf-8?B?Z0pIcUFsaHNPcWZPQUlBZVljYWRxKzgwSE9tc01tajlSWmlIMEtFQ0h0aVo1?=
 =?utf-8?B?UDVrNDZoRERwTEk5NldpRWFUOWlFakxSbThuWmI5TkdOU1l0czZtRlZid0RZ?=
 =?utf-8?B?MWZTQ3RhTWRZSG1NWGZGdXBwUWlzMGF6Skk5L1lWSml3a2VLOEFmb240clNC?=
 =?utf-8?B?bzh6R09oVGlJN0lVekxRYm1zL1UxUGZwanJhdEg3ckwrc1lqOWMzL1pMa0xK?=
 =?utf-8?B?cnMrTG5tSXd2SlBmT3YySmNwcURrUXlLUml1S0k4aHpXSTlvTTRPY1EwY09T?=
 =?utf-8?B?dURYV04zL1d0SmJaWkErV2tWeGFjY1BtejFlR1ZKKzBXMnlWQ244bHRSQ0hh?=
 =?utf-8?B?RWh2ZmdBcFBvMHZ6aXM5YW8ydVlPMGpYOHR6UHZpc0tteWttUXA2N1FnMFBK?=
 =?utf-8?B?eDVkdk5rK0lEK3RSR1pjUlBtK1plZS9wQjh3ajdVVFQxeTVFNXIwWGppeUt0?=
 =?utf-8?B?V3BBZm1nMndnWXp6U0NDVktOUk9EU3lsWEs5bUt5elFJTkRUZDNWUkEyZllk?=
 =?utf-8?B?Tmd5YjJxVzVrVXhOZ01sRjFpd3IrZWtxbUIvSW5kNmJBUTR5NjRVK3ZwSVJj?=
 =?utf-8?B?Y0o5QmxBSU1qUVFrZUN6L1JYdkNuVzRGTWVQckI1eWlXK2RkQi9NS3Z4ZXVj?=
 =?utf-8?B?MEszMFlsSzVNTlIwVWs3T3lXeGV3N1NVRnFxczN6ODhlSi9hMHRIQ1FpTjJE?=
 =?utf-8?B?bEgyeWlxRlprUG4wUVpYbmh3SG5ZSFk5YWhkK0M1d3lSaW4wS2YwUUF0NHRN?=
 =?utf-8?B?ODRDanMyby90TGdSTGJEU0hTTFc4UDhEZXppMm1EM0k3Nmo1RHc1dHArcVdP?=
 =?utf-8?B?QWpLbjUyMTV5QnlCVkVxWjNGbXZSU1l2MTk2TUxYWnoyUFBFbUc4QWtVdTZO?=
 =?utf-8?B?WFFyQU5YdStQOWZ6Z3dveER4QVJlTjNxUSs0c2M4Nzc1RE50ZlBuQVJEZHJi?=
 =?utf-8?B?RTA1ZXNybFZyaUN4alFFSEsra0lZV1pVMExiQ2phQTdqVVlIWjhuVTVOL2dj?=
 =?utf-8?B?L21GTG5MbXAzK1BTN0hCRzNsSW9tb2xic0pqdnZ5ejErMWRLOUNuWXFqdzZ5?=
 =?utf-8?B?V0hrbmtZNk1OaXB4aGRvUXNmRUtlVVZVYzNKTmlETmNmRlphbHM2TmVURVRr?=
 =?utf-8?B?RmJIYi81UEJJVmNSZ2kwZ0gvenF5YS9GeXZMemhFTzJ0UDNPS3NpUEc4Y3BR?=
 =?utf-8?B?TmhtNHhiaDhwYjEwaXFuT2t0MUhLamNiMTlqVkx4ZWdWZVdQd256eWR3RzFL?=
 =?utf-8?B?RlR1YlN1TVdFcC9Gc28zWWllTkVZVlpqejRuS25IY0NBKzQ3d0s4ZXRmOThj?=
 =?utf-8?B?WEgzVnJ2SEdLeWZFcEIvQ0sxcmVkMEJtZm80dk90ZFlNajZRUkJ5ZlhjWnJI?=
 =?utf-8?B?S0dzYVYyMTRLL2ZUVkVDSG1YWXVqUDB0TWhBTzVLVm1JUjBLaWl6bkNhTTJs?=
 =?utf-8?B?K2x4RS9XcElSQVcrS2FRQUFKbWROZWhSQzNYd2dBS29xM3czVzhmQi9QVVRU?=
 =?utf-8?B?WUZZR0gxL1l2NDVpUEZJbVJ3TUxHNlBPbTE1K0NoUFk3VklwL1hIU3JaV1FJ?=
 =?utf-8?B?NEswYXl0WHhleWNFUzFKTWxFVkl0dklwK0JwK0g4dEJzNENtTi9YMTJtaHl5?=
 =?utf-8?B?RkFadnlxVUJOS3BOZTRLRWkvQXQvc0RPdENpYTEwZ0E0ZWw3MjI1WmdSb0Ni?=
 =?utf-8?B?cnlHd1EzYkR1YUgrTGlub3dndnNhWjlEWW5SUW54Q1NtNFdQRlFRaWQ3bHkx?=
 =?utf-8?B?emEyYnMzTS9qc0p6TjZaN1lVWmZuTTQ5NlFaK3A4ZGhsK0M4bDhiYnNCcHlk?=
 =?utf-8?B?UWFPNGRiazYveTZWaVRqWndVTWJZaktzemlUQVE2UERncjZBSXlaZldGck1n?=
 =?utf-8?B?aWFQK1NsUDJkb0NqRUk4N0hUc1ZCL3ZROTVYWi9LSGorTS9SZjFUZTJsUzU4?=
 =?utf-8?B?dG04OHdhQ2lwWmdmSitWUzYwSWZzdjk4S3NhUzdkeWtNbWZ6dE00RnZNOUNU?=
 =?utf-8?B?NVB2KzVIUmZiMVY3ZTR0Zys2V2s3ckk0dmQ2QkJMczFwQjlnSVhuU3NsMlJN?=
 =?utf-8?Q?xcCY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa833278-50f6-48e5-b59f-08dd81c770ab
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 17:59:34.7024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JLm89sZF7nOENtTGh5OuuwXKs5+Iie5qnjJES8hRgWDAO8ryxfMEWlKjAUXUEiw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200

Hi Tony,

On 4/22/2025 12:14 PM, Luck, Tony wrote:
>> Do we really need to maintain a separate list for all the private pointers?
>>
>> Here's my understanding of the patch—please correct me if I’m missing
>> anything:
>>
>> Patch Requirements:
>>
>> 1. Expand dom_id.
>>
>> 2. Pack all necessary data (dom_id, event_id, resid) into the
>> of->kn->priv pointer when creating event files in the mon_data
>> directory for each domain.
> 
> This step includes searching the list of previously created priv structures
> to find a matching one that can be shared.  This happens all the time
> because the same set of values is re-used over and over. Essentially
> we only allocate anything while creating the mon_data directory in the
> root directory of resctrl. James' original implementation made use of
> this by special case allocation for the default group, and then doing
> kernfs lookups while creating new groups to find the matching one
> and linking to the same ->priv pointer.
> 

oh ok.

I went back and looked at the history.
https://lore.kernel.org/all/20250228195913.24895-38-james.morse@arm.com/

So you are saying, kernfs lookup method is much more complex. So, having 
the global list is easy to traverse and efficient?

Thanks
Babu

