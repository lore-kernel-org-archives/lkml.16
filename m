Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1508D10E3
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748500786; cv=fail; b=cA5IHedzHNZv9XkyENTTiS+oYV2DW5fZIE+i59SRLcQDTVQjGqqcMbQFVVeyGfFWo5Tpps7iTK87kVSRAPR2bxrKm0R2JnXPs1NhF/7DLwZJzg6lZ6niFLFmMyXOYOUK6/wuFcfK7sOS6tC/Ka3TziaVKyceQfynGZOE0mDT16A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748500786; c=relaxed/simple;
	bh=DB9mknzpUHCrRZX7GIzmVoT4CjnyX/EPQwjouRpEG44=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TDDnGGn7Tu8GEgHMbK5xq+nINMkCs/fDGB00EJIQG0g9ghTHphoUkl9YdgsXUefI7IH3azpbk3Cehee1yc45+XNrY4Qr7oO/UGVLSZyt9LQPoibcYdzDri4U8f3oIcuLxsPh3u6T/h85MiSH5wWx5F64Y0paIk+r+kQ4ioedXdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TIOqQmRn; arc=fail smtp.client-ip=40.107.94.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TIOqQmRn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL28yuQXJTF2G05Ji/LayaOi1pj5fBTYN9/4DaPkvVHRRvRToWa+3D8VLY0CWjF0NYft0OtJWHc0kPQHicd3z/YpC5TCdRAFBcdrGQmuUyETrlMTd+uv7t36ISP0bhRiJ0msz1NytCUZ7jD2CA34jvH166RI0jSfel372yiMYt/l7g9m4I046+6yMmE5Qu6Ekg0XBS1LP5qwAxXgkauNdAPeefTW+Cfp36abusAGjJ8TVpEXu0PcGXDxiTlWzhWfpuq60ZBfbZhoqAC/BkjSbpS7ESaOQf7G7sw1KM4g8+Sjw3XO7AA1QNQe/t4WUZkfO5jfnQcKj3+jdLVG3iSf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFaQ1a2rma7HKwZLVLtHyv/2BmnfdNaDNcx8i3KDBCw=;
 b=gaguD6lA5k6zJ8slAntwS15BNPFAzaGsSJqKtwxotzk77qq0LJj69JAlP7SqWoWN3HATXUTYRWa63Bq3HM5URhF/r6PmY+mBffhEQTIVu4UKNA6zfTzeUddDCjcCm8dkdKwlp3yFV6Fiq5l+DyG9PFK8AggSFdsS7arIzqlRYTT74KAegskQuKdWIsRsnX76qtpeieESUUF3jLSyiCSDEZbdrkzC8UwgIvhiN0JnsSJ0DyW7aC+SF0RI08rK207JrxTDelhh2+W3fjYGVWZliON7/O8EC7pc6rVwmnX3H3ddi4VqVx0WzgBVQcaU+qBrwt8yGwyhoBM6lPxPffGd/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFaQ1a2rma7HKwZLVLtHyv/2BmnfdNaDNcx8i3KDBCw=;
 b=TIOqQmRnN8iFlTiggjfEzdealEdPqwExMXS4GG+mfRijJxJ2urbGPBGJzhmwGsAmzD/i49mvxtiVae7VzqPcB+znjgRcAohLvLS6pFdThHeTmihOEFiJzZZ+W9HtrFCWvrXHFFgvhnsrSGPcEz8rB3y7Y1D7s44fRtpF4WhafKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by IA0PR12MB7676.namprd12.prod.outlook.com (2603:10b6:208:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 06:39:41 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 06:39:40 +0000
Message-ID: <e2b79e4e-f964-4fb6-8d23-6b9d9aeb6980@amd.com>
Date: Thu, 29 May 2025 12:09:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: allow imbalance between LLCs under NUMA
To: Jianyong Wu <wujianyong@hygon.cn>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
 jianyong.wu@outlook.com
References: <20250528070949.723754-1-wujianyong@hygon.cn>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250528070949.723754-1-wujianyong@hygon.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::31) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|IA0PR12MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 247132c3-252e-4b54-1cf2-08dd9e7b96af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3JBS2lFQ3lpbWNqT0xsczBXU2Y2ZUVCOEphczlpdlBpNGFBTzJUWEVXRnVq?=
 =?utf-8?B?anY1QTJhanZjQnVIYjk4VGxGT3hrLy9XS0dHczZ0N2NzTjZTZy9JZEwyYUNF?=
 =?utf-8?B?OUw5YmtHS2VUeUlHWVJxK3hTalNtd3JiaVhGd0dzTi9ZNVlTWjVkWXNNZ3ZQ?=
 =?utf-8?B?VFBRaDBmNTlSMEpsTXo5eEUrNkd2TlRnOXJmK3NQUlBDNnMxTjJLcFk0aHVv?=
 =?utf-8?B?UE1NcHhZUHREM3FFdEJobW1FU1ZGNnBJSEM5amg0bmVYZTBUWVR2YkRLS0pW?=
 =?utf-8?B?cnM1SUxzOGJhMVY0ZUNpVjRKMmZ0WURla3BOL1JLSGtFZjF2dXJCZEdkUXRV?=
 =?utf-8?B?SWgvZlQ1ampwLzg2TGNiSTdGTVo0YitXdDNXWU5nVk9uUGZ0OVFpYWJXTmdO?=
 =?utf-8?B?L05MQmJkZlhuK2pUQTJ1VWFrYWdONXpGOXMyQ3gvbWFSMWw2VCsyWDRJcEZz?=
 =?utf-8?B?aHU4a2VyRVoxZWpsV2srR1V1WG9ZOFpmTU8xOWJtZEpDU0lEYW5MaGg2aTB5?=
 =?utf-8?B?MXN1WlJvd1BOckE4R1RNSDBCOGNlRGtiSS81MHBRckRlS0d1b3BSV1BBZ3lo?=
 =?utf-8?B?RHV3ZXNBdEJMWEI5dG1ZaGVSczFaa21KNmY0WVdQQ2p3THUwSHZURXJDdnVu?=
 =?utf-8?B?bnkvS0JrYTd1ZTk2Yk0yMkhaUS9RWWFKdEdqNFJia2ttS0l1K0VWaHN6ckc2?=
 =?utf-8?B?UUhpYTExS3hiR0pDZEhoWkdWZ2N2NWFIM21pS1JlQjlrY3hkNmE0QloyNC9h?=
 =?utf-8?B?NU9MVUU4dzMyKzR5V0ZFYUkxNFI2eG8rVUt4R1NsZkdmQVR1SXErN1R3YVlx?=
 =?utf-8?B?cnBUVXlNL3k4eXY4U0c5eXJaMHIzUVdLeERLUFljS3hEQUVzdHpRV0FpczBs?=
 =?utf-8?B?emZ6eEdwWU04cHA2NG9vOUYweDVsaE54RUlSbkE2T1BLTWVSTGllZ3hTWmZN?=
 =?utf-8?B?NlFtZGp3Z214Z2wxeVVLK1VlSHA2RzR5ZnNKMzhRMjhseWJTWTlUMU44QU5p?=
 =?utf-8?B?VlZFSmRuV014ckVIV2o3SHFVZ2NDWUNDYitRL3BPeWhmMXN1SXBtZkt0clZk?=
 =?utf-8?B?MEUwUks1enh1bTFtN2QwWGJYcGprOC9rUWVSVm9uZWh0MW9Ca1NNSGh2WGZE?=
 =?utf-8?B?cjd2amI2bUdjMW8walVRV1VjMWRuY2RDRlNEOVo0OXBrc0Y1MGduaGF3Vy93?=
 =?utf-8?B?cURYRFRVRmVMa2NiOFBDMjVtQWUyWkFKY2N3N2RRUXBLZkdNSXBuaXFKRmJu?=
 =?utf-8?B?akVUMzdWVVlLVFVMK2R0QkJzT1V4VnlJYnd1eFY4QmY4NFhqZWtDQiswTkdI?=
 =?utf-8?B?Ylg4ejlCaFAzdzZBblE0SEtaTitveWVVOTd4bEYzYmZiWDNvVWJ3c3VIampw?=
 =?utf-8?B?M28rSGVNejRPZHFmV0dEcjRGNnhUaU5yYU0zTmtYd3ZPcyt4REZOU0J4MmdE?=
 =?utf-8?B?V1dDN3FRanFxK0pGTkdkWWRmRCt4YkxUcmg3MjhxZUpnNUwwWms1NTcwTWZR?=
 =?utf-8?B?d2M4bm1oZ2gwWk42M0l3MW0yL0xCY25NL0hjRFpOOElETnhBRHNYL2xvRzRP?=
 =?utf-8?B?Y0J6blhmc2VreXhkbktMdVZ4VUFRV3k2RndwNGM5bXZVRU9TN2NXZWZtUFkx?=
 =?utf-8?B?Uk5DQTJrNFc0OHo2emovTjVMZWpVTEtsVXhzS1JrKzFLYzJFelBVbjhsekVy?=
 =?utf-8?B?TzF4OFRvNUcwNG1peFFUdk1xdThGSkZzMFJVL3FId3Q3NnZaRnkrVFc0cDJK?=
 =?utf-8?B?ZEFDd1d1MVpqQlhHS0t1b2gzZFUvd3MzQzhwSnZMRnJHRExUUzc1c3lVaGhz?=
 =?utf-8?B?WEorR3Bwd1YvWjdUZmlVZTVlMEplSmp6WXJZOFRRSlJPbDBYTnd2WVdtUFA1?=
 =?utf-8?B?cTBtSmY5WTFKOUlSZFl4NGJybkY5YWQyekFCb1NCVjFPenNMTGYxYnFMRTRK?=
 =?utf-8?Q?QNLidkitXYY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmEydURERTRXTFRMeEFwR2ppMW1JNHdDT2x1OWZmamxaa3RQZ2MxODhOM0tq?=
 =?utf-8?B?RXVGNTA3SUhHUDhocG5TVnJiSVRVUWV4M0FXMmdXcHBFV2Rib3AzSUhJcTBm?=
 =?utf-8?B?WGd4Tm53YlJTWEN1clA0SE5xQmxtSVFVcXI4ZU1oSWpqWFJ6ZEUzZTRqV0ll?=
 =?utf-8?B?NnFjbjJEOUluV3BmRlNzdnhMb2M5RXZzOHRjRHZwYWQ1YVkwcWtqclFVN3BR?=
 =?utf-8?B?a0c4emMxYkhRRUlNUldpRXExMXBLZ0FYdkhQV0xnejFYQURDTjBrZG5BSmVZ?=
 =?utf-8?B?VU0xZytNbGlqdDU2b0NORU0xc2RSL3lTeUlobHFFMkZUWk9xNmNiY0dRT3Rq?=
 =?utf-8?B?VXVCTGVOdzc2OGI4SG90NC9qakR2WFk5d0xuYUNNWDg4bDBSdjl0Y3J5bU41?=
 =?utf-8?B?b2pUeW5tZ0k5YVdTYjBWWnVTcWxtR2RabXBtRVhQSGFzY2tGUktScmF3bU0z?=
 =?utf-8?B?WnlEWmZkRUp0RC9MK2JsSjJQQmZrZVFIc29XcWJhamZZOFJIOEwxTi8yZjAy?=
 =?utf-8?B?Skx1NXV5dnJuK2gvVllKK1VacUFKTFJkN2JsWGhIYVV4aW5Mc2tVZmtVQ2Q2?=
 =?utf-8?B?SnVLeXEyNXhDbE90U3FTQ1NJaWRITnVFN2M5a3VVTCtDa25LU1hvQWM2Ly93?=
 =?utf-8?B?Y0NhaCtiaHl2ZWpOcGM2VnBhdnNIRHhGR0g0Y3FkWU95d2pwWDg1ZmxuUVBn?=
 =?utf-8?B?TlZ1T1Rydk5ybVUvODFrODZpT3FpNm1kQVRIbmh1MWZINHVBblN3aDV4L3FB?=
 =?utf-8?B?ekp3MlczdyttejZxUG1ieXZyS1VmdHpwMnlNRmgybjdhcE44S0NDenJrQnJv?=
 =?utf-8?B?MFd6MlBWNlkxMkdmTkRUNkdVWUxvMHJhYlBhbzdCeDE4WStaZGluTnd3dDBJ?=
 =?utf-8?B?dWtzZlVQN3dOWnhacGszakF1YzlodzlKY051aG1pYzRPM1UyeDNsNGV5akZx?=
 =?utf-8?B?Q1FHQ1RnQzc5b3JZcTBUd1RWaEJmd1RVT1ZuN29lcDZyNzVtMzIyQzI1ZkRO?=
 =?utf-8?B?RFZsRFdJMzU4MDF2Z3lRYWhPYkV3MFJ2UFFHUHF5bThQcFNCR20xNzRvVlps?=
 =?utf-8?B?SHdNZXRTc3Yza3ZNUnp4eiszVThjY1REZ3c1NEMxSVFWTEJFQWJRS3ZTUCtN?=
 =?utf-8?B?dlV3YmZpMjRqbk84ZkVTN2dEU2ptVTBXY2hnQzZnR0hIcTJBcWFteW0wd0N4?=
 =?utf-8?B?VHlHWm16VmFmZGRBL3M5K0RqVGp4NkNJUkNTYmFUeXhDSWZoYXZqL2xEeEtO?=
 =?utf-8?B?c0hqQVQvV29BZEtSU2pvUkVDeC9JM1lsTEJKblZFTlI3TFBKV01wWnRyUzd2?=
 =?utf-8?B?UXEySEZmZkcwT0RHZFU4OHpiSVpCWjBlV1ArdEtqL0hQYTdNVnZxYXNEdzJH?=
 =?utf-8?B?SG5KMi9Vb2VvcXJ4RCtpYnY0QVhlS3NkcGlvU0JpQkdvSlpMY3F1WXRwcDBj?=
 =?utf-8?B?aTlSZG0rQmo3VklOYWpTN1JSOURPenNSVHVqay9lYVo0Q3U4TkE1ci9KVSsy?=
 =?utf-8?B?QXY0bkd0ekxxS2pjVHQ0YzN5ZUVsSjd1OTQxRk83Mi9PbnRIUG9sOGlWcEFL?=
 =?utf-8?B?V1Q1Z1N0OXpCc29RSUtwM2NheCtYei9YT3B2UFNlTHJCWUhjVHROMDM5b3RR?=
 =?utf-8?B?azBRbzVSZDJtSU9POG90aGRJd1BjV1M5aFZRKy90bE9Welkwc2NxendEL2VL?=
 =?utf-8?B?c1RCM21yeHhVNUptaEpveGNrQjd0U0cyUjZ5RWN0WmdxSDlMb3A0cTZERjJj?=
 =?utf-8?B?VC9xNm5hZlhmU2JXYS9PUWdDb1pIdkxSMDI3WkhYOEIrdlpxY3gvR0J4WVd5?=
 =?utf-8?B?YmVjbkltTlQ0NmR2UTdmZ0VQQW5abERFdjNLTWRwc3BJTllwUHo2QVZYaDla?=
 =?utf-8?B?aExDVmp0aE50Y3pKazk2cUVxWUV5Nm9sVElucUxENUwrTTJYU0pxUzZZYnVj?=
 =?utf-8?B?bmE5dnMzNjBncEJVaGsya2VzSXdWTTI0YnhoY3dJSzdPVkFSUzlMbkpEWEUx?=
 =?utf-8?B?bDhndS9BVksvVHEzNnc2WWN5N0pnTm0ySUgrZnBrVUQwQWZidHNkT2U3Wkla?=
 =?utf-8?B?VWpndVo2SlZ3d2lOTkJrSW9hMEgvVEZDMFZyVFJaaW8vTmNsNmlkK1BhOGRy?=
 =?utf-8?Q?owJhi7oldCmyAEIr4Qa5pBd/m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247132c3-252e-4b54-1cf2-08dd9e7b96af
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 06:39:40.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFKhMDYxYqdE4ehHOUQQRRQYWMOQpiJ/Vd1AGutCRpOv0Y23id4i9r8ehOQDx8TEogPRkWrhAfi9F69sgO9Z3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7676

On 5/28/2025 12:39 PM, Jianyong Wu wrote:
> The efficiency gains from co-locating communicating tasks within the same
> LLC are well-established. However, in multi-LLC NUMA systems, the load
> balancer unintentionally sabotages this optimization.
> 
> Observe this pattern: On a NUMA node with 4 LLCs, the iperf3 client first
> wakes the server within its initial LLC (e.g., LLC_0). The load balancer
> subsequently migrates the client to a different LLC (e.g., LLC_1). When
> the client next wakes the server, it now targets the server’s placement
> to LLC_1 (the client’s new location). The server then migrates to LLC_1,
> but the load balancer may reallocate the client to another
> LLC (e.g., LLC_2) later. This cycle repeats, causing both tasks to
> perpetually chase each other across all four LLCs — a sustained
> cross-LLC ping-pong within the NUMA node.

Migration only happens if the CPU is overloaded right? I've only seen
this happen when a noise like kworker comes in. What exactly is
causing these migrations in your case and is it actually that bad
for iperf?

> 
> Our solution: Permit controlled load imbalance between LLCs on the same
> NUMA node, prioritizing communication affinity over strict balance.
> 
> Impact: In a virtual machine with one socket, multiple NUMA nodes (each
> with 4 LLCs), unpatched systems suffered 3,000+ LLC migrations in 200
> seconds as tasks cycled through all four LLCs. With the patch, migrations
> stabilize at ≤10 instances, largely suppressing the NUMA-local LLC
> thrashing.

Is there any improvement in iperf numbers with these changes?

> 
> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> ---
>   kernel/sched/fair.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0fb9bf995a47..749210e6316b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -11203,6 +11203,22 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
>   		}
>   #endif
>   
> +		/* Allow imbalance between LLCs within a single NUMA node */
> +		if (env->sd->child && env->sd->child->flags & SD_SHARE_LLC && env->sd->parent
> +				&& env->sd->parent->flags & SD_NUMA) {

This does not imply multiple LLC in package. SD_SHARE_LLC is
SDF_SHARED_CHILD and will be set from SMT domain onwards. This condition
will be true on Intel with SNC enabled despite not having multiple LLC
and llc_nr will be number of cores there.

Perhaps multiple LLCs can be detected using:

     !((sd->child->flags ^ sd->flags) & SD_SHARE_LLC)

> +			int child_weight = env->sd->child->span_weight;
> +			int llc_nr = env->sd->span_weight / child_weight;
> +			int imb_nr, min;
> +
> +			if (llc_nr > 1) {
> +				/* Let the imbalance not be greater than half of child_weight */
> +				min = child_weight >= 4 ? 2 : 1;
> +				imb_nr = max_t(int, min, child_weight >> 2);

Isn't this just max_t(int, child_weight >> 2, 1)?

> +				if (imb_nr >= env->imbalance)
> +					env->imbalance = 0;

At this point, we are trying to even out the number of idle CPUs on the
destination and the busiest LLC. sched_balance_find_src_rq() will return
NULL if it doesn't find an overloaded rq. Is waiting behind a task
more beneficial than migrating to an idler LLC?

> +			}
> +		}
> +
>   		/* Number of tasks to move to restore balance */
>   		env->imbalance >>= 1;
>   

-- 
Thanks and Regards,
Prateek

