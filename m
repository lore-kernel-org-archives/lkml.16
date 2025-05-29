Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazolkn19011030.outbound.protection.outlook.com [52.103.64.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5B21F37C5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.64.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748514737; cv=fail; b=hRUC9KInhDjBEE5WO+zbwcgossvDLPtBROsLBthSmv3DTydpbtTDCn3Wyif71jt/H3+q5tu8w7pe4tEgMQqdF6QAtFQEeQ7NuDNoWGzAC+x26EpbQiMOuISKfAypivFsCev9a3yVckeULp3gnVUsRHIA3/dxPN3Pn/SeFX6r5Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748514737; c=relaxed/simple;
	bh=1b1sm835p2/dvJgrZLw0QDOVHJKnSmDgYkXT32Yyr48=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WN24asot0WA3a8CAICzDahJrFkAG+zV/pcTBnEmCUJZLi2xV1oxEnGxUDT0MGH33VsSLJl2nMo+c2tGoe1q9t84FLko0viw3JtzVuCN9y3PPKuVeyfJfKEZr58sZqKfSIdCqGDVBY3xAlfUa8rCek2T7cOt1oVPu3Y1KhgT04P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Sg27MXut; arc=fail smtp.client-ip=52.103.64.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Sg27MXut"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCOMhCfsaOiwmA4CjeEnO9q3TCP62HGKNpI71oZYzXVWT4p6UVDymoecA/OlYGc2Pa4Uk8ACzFBHmkOihpVyJVp5vDnTuCVMnRsLjINwmuAJ1lshqRzhipMJa9fAqVcLiPh5OqSIWzkaaUgmWXv2BENfcmIO2iyXZZ2Z7sCHTH3StfR9yl3IJKXFefhJ9Jhkb4L+4ujT6MW5exL4RVR8rVsDdU294Ss1FZwG6cUQM5yE/CVrRF2OFI3mnD6TQhbewIeAHrDcAbKqghXUNDHr3Qph2kJ4IRrSpz0wGRdd+ZXJOCQfk6SHfIy9ujvupm85BH03QOFhBbTW76YyoXgBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQdS4FFv3ECBrYXDhtS3nnKUt+v0iaOLfptq4LbjgQo=;
 b=OIQAUVz82Lat9ZSmLm1PNyBJBBswzmDwC0IKIunHB8Cu/dwG3DVUeLlK8Xr0J4V8e8cRE9CtC9ua1G4s0RYwUgaeb5d7PqSlDd8pHJ/xoPXnaxOrNXChPno6hCS55KotDyJBJvvtGumfVp/85PShUgVIJmkG6bMBsZj//Mfavg1p6hyzE6m/etbOMezSh69SzRnYn4JbE94TqAaPTqmxVdVGxdGhwo/aQTp+XUbZW9GGVXhRs1zjCADd8skF3TFMOnVgy8WgG3rb32tYfVIBwlq89TMGlMi8vS69OcmxJhsk3TnFiwrq+HMVVjk71kCk0oJlHfnOadRs5lAmku0ZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQdS4FFv3ECBrYXDhtS3nnKUt+v0iaOLfptq4LbjgQo=;
 b=Sg27MXutDAmw/Fz8xjwvTP9suWEVQCGEkDCdR/D/+wyQ3buXuKZGB+nerJ5gT5SM5JTB0U6zhvjoSWGY8JBR6Zt2Sy1NfxXBDpIUqJchDTmSriDzMFhCn66EHJmR8QH9C9gpfIkjocrRrWubvWeO8VN1mG03OF1ydIaRWK1ALkI4FDDfEbCvGZ1uNBlDJIIvqMq+SMMHM7dvO/kVgmahXXHwXM11oVg+oH1rCjjJHcoxsOi5uPTDBfsEwYb4bvbsFEy6snh6lV+afOCzgmDJhgrH2ofxl0CHhO5vWsWIIVrqLz3+aJRwIhKznfjlLO0lTedrqwiAI6UOjuGyJpP76g==
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com (2603:1096:4:149::12)
 by TY0PR04MB6253.apcprd04.prod.outlook.com (2603:1096:400:32a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 10:32:09 +0000
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963]) by SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963%6]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 10:32:09 +0000
Message-ID:
 <SI2PR04MB49310190973DC859BBE05DE2E366A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Date: Thu, 29 May 2025 18:32:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: allow imbalance between LLCs under NUMA
To: K Prateek Nayak <kprateek.nayak@amd.com>,
 Jianyong Wu <wujianyong@hygon.cn>, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250528070949.723754-1-wujianyong@hygon.cn>
 <e2b79e4e-f964-4fb6-8d23-6b9d9aeb6980@amd.com>
Content-Language: en-US
From: Jianyong Wu <jianyong.wu@outlook.com>
In-Reply-To: <e2b79e4e-f964-4fb6-8d23-6b9d9aeb6980@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ME3P282CA0093.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1c0::9) To SI2PR04MB4931.apcprd04.prod.outlook.com
 (2603:1096:4:149::12)
X-Microsoft-Original-Message-ID:
 <ac8b4c98-abfc-40ea-be6b-74c7b72bc9e7@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB4931:EE_|TY0PR04MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3bf063-ea3b-4d77-a0f6-08dd9e9c1049
X-MS-Exchange-SLBlob-MailProps:
	dx7TrgQSB6eredufKlHx3shQhUbyqdtFbJ8XqSYubxoX0sHh9KNhd/sdhjajBjuVyypzrmD8TPNMvOKGknypk6iP2HZLOwiURDSjRxkIX+ExuUw8uVdb9VCYDcGnFtULRsqtIF6CU9+c5kgDCJiUNTdr2/BHb0wqOMByocZABT6JW12s9ZKgOyJS/Ac22rmDxK8cfBU341LQxvtpMFh8DxXxvQ07ar3MjXU4ExRS8dXhLVQmb0VnMFgMVSDQx1ta5sVHuf1GCbb8+lj0ZeuF5U+JLBEezoBBg+j5oMt0BZetVVs5wseM5f6shdTQPfp74DHwuevcABErJwRWpRxH1eQDNYpEkd03HP4qEKGUo2jNCvJb4UV8JIounhBW/z2oThgna5GBIQMdr0meA8FsCAZ00WFjotQRyGUSJP6L1O6dV0624z4gidS4oe8Eog8IwF30TsOpL4Z30+qNIVM1icYCGcLV1c9nlwIB1/4XKQQ/MIhjCV9iB/gxVR7veUnRaBHNV1ti5fJQDPBelcziFJVNBXoBl/+tF5PTrQziqDDhEI8BJGsh/azzdDZClqaAvNFRIShWYdFS+Hv2wxar69qgugdd4sFNHKG8+2fCRvUOaoB6KZ7KpGaNCPs2EOj8p+a1H/clO2dZ2BTvgMbYF2+iQf/HujCikB2zxT6r2DvMa63uVTXX8Q49gysn3ZpuWltXSqSyUtbsiQ4bBl4DNuqYf6bC0/Z0C0kczGHoi3hfpYclHDHn/JvHjUuz9HDFZrdBkzpHLCk=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799006|15080799009|41001999006|5072599009|8060799009|12121999007|461199028|6090799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUZJUXl4L2d0Ny85NlIwL1JHZGtFWUpQc1pnUU5WNG11QlkycGNpWXNCTzZp?=
 =?utf-8?B?bGl4djBoUUVOaFdMRUN2eTR6Qk5xWndiVlpCM0tGUUFPUTVnWVVoYnVkcHdu?=
 =?utf-8?B?UkhBbXZ1UHp1dlZ5MUVGaXRVbzlsdTdIaFlyNHpvVzU1Z3RxVVNzc1gvN0FJ?=
 =?utf-8?B?Yld0VWE3K2g1MGp5WGs3em8rTzhpN0NIbTBzWTVROHl1MXBDZVhadVgweEh2?=
 =?utf-8?B?VzMzN0htRHZ4S0dZVSs3MlRwNHMyU2l3SldvQTd6ekhVSkNyK1J4RkFUTWU3?=
 =?utf-8?B?Wm9DM3FSZnFaMmpMN1hVOFRQSGVMdjN0QnJoOUZuVE16aHBnVzg3b1ZuWG5M?=
 =?utf-8?B?clo3S1F4NVQvQTNraHFKNkI5WmphWlhNWlY5cmZZWDAvMWV1THgwd2grYU1T?=
 =?utf-8?B?cmVralVsRnFOMmpIRkdlMDlxYXZBZWpLSTM4OVBtVHZrcnJ4emtLbnQxbmlQ?=
 =?utf-8?B?STRhbmdtcDZaTnJkb1NBWC9VK3J4cFFmcGRlZEh6a1NXbUVHSHY3cExvRFZM?=
 =?utf-8?B?NTBtaEFjWnpwTE5FdEoyUlR5QURhRWlleE9rSXBvMUR3bC80ZnFqWkllSlZq?=
 =?utf-8?B?c1M1Umh6NExBY0FqV214VWMvOW1SeEJURzRkM3ZYUGluWlE5VnA5anorRGV6?=
 =?utf-8?B?SUhGcElVV0Ria2NSNyt6TDdsY0lSNVYrd0lETWxnYSs3WVk2RTRSWW1mdlBH?=
 =?utf-8?B?Rml5eEphWTREb3pqSGR6VUhpMzAreTFKYjlqWjFwSHo5NnJYeklwcHQwaXlI?=
 =?utf-8?B?VFpjQnlHYjRPVzhORDJYV2N5Qjg0cjV2ZDVBVktTZXlkZ0pFUTFuYWpkekhh?=
 =?utf-8?B?U0lJUWZvbGdoMzBUeG1tY2JqODB5M0xiclJHaXZhNlR4U2FrekJma2R2b09W?=
 =?utf-8?B?ZzM0alNsOVFhVmhmcDlONHA5SEt4VExPcHh2aCtYYTkvZW9yRm94dHBaL0o0?=
 =?utf-8?B?WVRDQkd0Ylh4cWhFM1U5QzlEb2hhU05seVdFNzVzalRUcmtWaU9jRFVld1VB?=
 =?utf-8?B?dTN6WjBnajA2Y3A5NEFXTkZPVWozd29IZkZUbnlnaG1RRTZtRDR1QU54aUlz?=
 =?utf-8?B?aUF3d2JXdWdvZVlxYit1c2VCZUJjcUw4ck1lRTZjMTRuTzNaK3ppUXRzTE1l?=
 =?utf-8?B?N3JrWFl4Nk43ZHpGV0RHVlJ5QzhESEdUV2VMU2YvcEtZTkYvMWQrRTR1ZkRB?=
 =?utf-8?B?ajc5MzZPYkt4aVlFMW1Fb1NYMXpweWVjTkVheHNTbkVoUlZuUElpaTh0UGpy?=
 =?utf-8?B?aXRLcERGd1FQNURSMk15YzFnZ3loVlVjMUtRemFJbGgzYWEreHM1THhJTTdl?=
 =?utf-8?B?NHJWVThJTVNEODBkZjkrWm5YaWlJbkFvSnZWM0hMV3NrakN4SGxkL01FWVBz?=
 =?utf-8?B?WGRIY0szVTZuNEh2N3ZSRG56QjRXYnI2MlJVczB0ZkZvUWxZVmVNaW01NXFx?=
 =?utf-8?B?UDZIQWFCaDNLZmsyWTdHdTBVdzdTY0h4RmxzYXZEVDQ0Y015KzRoSnJwbFpX?=
 =?utf-8?B?enlVRHRJeENGNnpNRFhYeVN2MGwwbTdXVG1YTWF4MHRrYjJGeGxabmxxQ1A0?=
 =?utf-8?Q?PvqFqW8AQ3qcBKyxK5jLU73FA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkRSL2ZlN1BSemdFRm5XR285NGJ0NVhzMUNNUEVVM25NQTBaY3hrVWh1RzhL?=
 =?utf-8?B?bHduVmVKaW8rSzdTTkNoM3VRMVFzMkQrOHZpSFZNZWZPOHZiQXhsTTV3SVM3?=
 =?utf-8?B?Zi83QzJKZkg4RVlJRXI3ckpBbjhyaDJyNWRDMFVEd3FNczRja1p0SFQvZGZW?=
 =?utf-8?B?TDBBblowNlgrUVZHUk1HL0loNW4wdjJKY3JyZEVkQlVyNFAyUGRWZXd3ODgx?=
 =?utf-8?B?dnJuV1ZmK0h0ZlM1RjZ1WGd2WVNmV0cyeDRWQWlSNUEyNXBTU2NGMzZIQUF5?=
 =?utf-8?B?UnpsTnUzUW1mUEc3L3BvaXZURGt2QVZMOS9kR0t0NmIwd3BKYU83TVAraW5U?=
 =?utf-8?B?ZVBUWndxMTd3b3FZUys0R1k2clFYQ0MrQlFyVzRiTGRTdUlDVENtNDlObTJT?=
 =?utf-8?B?MmtNMU9CK1YyVVYzQUs5blJGc3hZM0FPMEFSSDhjRDB2dDZLQ1BYT2RwMlpV?=
 =?utf-8?B?ZmZOV1ozY1Y2M0tYdmNQY1NBMktxRnFEZERoYWJrc3UzaTFWVWxkNUl3T1FP?=
 =?utf-8?B?OXpSaDMva2pHa3g0N1N6UVZXVUtRZ3d1UHRUMEVqZndaK1pMUFJTNDZ6Nk5i?=
 =?utf-8?B?YUJsVlh3YjMreXFFa2Q2b0ZwRk0zdFU2a3ZRQldUQlcwUHRVN0t2Tmxmamlz?=
 =?utf-8?B?R0tWY25IWEd1TEZvZGd6bGtIM0hLeDg1bnJoWXduZVlIS2tYN1JMdlNiMWlu?=
 =?utf-8?B?eGR0R0ZYMlpPRzB2TlU2ZE50clczOEdGd1lON0JQUXlNQktWYUpkN0R2Si9m?=
 =?utf-8?B?THNGVnN4d3ZXY3phOERYT1kvQ1NCUytqOFZOL0dpcEJOb1JDNlhyN0lOVExq?=
 =?utf-8?B?eDh5RVdGN2hwY2xzajhUaTFhWDdacjd1UXkwTkJ4bEFVc2NQMEp1STMzNXdC?=
 =?utf-8?B?SWtQTk52ZUNRQXVZazJzUzZBMWw1RXE1QXFUZDU3RTNiMEJhSG1KQlpaUGw0?=
 =?utf-8?B?bkZTaElRU2UrNE5CNTJkcWl5WGRNTHRibWV3cDhkQnVmMEJURHNzVnMzOW9J?=
 =?utf-8?B?RVRpNWJvQ3Q2ZXhSZzZ4S3A3enMvb0tGNysyM0RMK05VT1VQeG5aSFFNaHFx?=
 =?utf-8?B?cWtsNDlsTzBJU0VHMHovb3cvcTAyMCtPMGhRQmdZOUQzODNXYVF5SWZYaHdC?=
 =?utf-8?B?UmRyMFRkSFVtTWRuTnJIQnh5Uk8rbkkvcW0xUlhaZUpDTWljTUdpY3dKOFkw?=
 =?utf-8?B?SFl1OVVvSXpIQzhhaDA3Znp2dkZCVEQrUWNJbWxtSXJua3daM200MGFIa09M?=
 =?utf-8?B?QnUwaWM4ODJiK1dvWlNwYnpRUEt5bnA4UHluUlkrSi9DVktJa0FGK0MwUmdz?=
 =?utf-8?B?UllmUWc4QmZXd29QdEozVDhiTm1MR0JPd2RsOTRpc3NaUFJaOGM0eUVpUy9h?=
 =?utf-8?B?MkUxc0FGTGJmWEEwUGdibmZlakJ5THVnS3dNMndYaUw4b3JpUjZqY2ZKalNj?=
 =?utf-8?B?a2x1L1AvUTRmMkZrbng2N291SkxJbys1bitiVEpVUjdVTjF0OThNcDdUSHlh?=
 =?utf-8?B?aFpVaUYzZEhvZEptMDJTQjdLWUhrNVY5N0hYN0U2L05MR1ptbHZicGg4cHRT?=
 =?utf-8?B?RUFhc1RaaHRQaDFraWRKWXROVGhZK0YwQlFESEhhNmhSNFFoR0xURmVWSkdD?=
 =?utf-8?B?VGkxSG5FaXVpNmlEcFUrdTlsaVVneGN5S1VWWVFicUxtcE8zaXhXVHJsZ283?=
 =?utf-8?Q?8UuJApPKi6lQY5D0/8LT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3bf063-ea3b-4d77-a0f6-08dd9e9c1049
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB4931.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 10:32:09.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6253

Hello K Prateek Nayak, thanks for reply.

On 5/29/2025 2:39 PM, K Prateek Nayak wrote:
> On 5/28/2025 12:39 PM, Jianyong Wu wrote:
>> The efficiency gains from co-locating communicating tasks within the same
>> LLC are well-established. However, in multi-LLC NUMA systems, the load
>> balancer unintentionally sabotages this optimization.
>>
>> Observe this pattern: On a NUMA node with 4 LLCs, the iperf3 client first
>> wakes the server within its initial LLC (e.g., LLC_0). The load balancer
>> subsequently migrates the client to a different LLC (e.g., LLC_1). When
>> the client next wakes the server, it now targets the server’s placement
>> to LLC_1 (the client’s new location). The server then migrates to LLC_1,
>> but the load balancer may reallocate the client to another
>> LLC (e.g., LLC_2) later. This cycle repeats, causing both tasks to
>> perpetually chase each other across all four LLCs — a sustained
>> cross-LLC ping-pong within the NUMA node.
> 
> Migration only happens if the CPU is overloaded right?

This will happen even when 2 task are located in a cpuset of 16 cpus 
that shares an LLC. I don't think that it's overloaded for this case.

  I've only seen
> this happen when a noise like kworker comes in. What exactly is
> causing these migrations in your case and is it actually that bad
> for iperf?

I think it's the nohz idle balance that pulls these 2 iperf apart. But 
the root cause is that load balance doesn't permit even a slight 
imbalance among LLCs.

Exactly. It's easy to reproduce in those multi-LLCs NUMA system like 
some AMD servers.

> 
>>
>> Our solution: Permit controlled load imbalance between LLCs on the same
>> NUMA node, prioritizing communication affinity over strict balance.
>>
>> Impact: In a virtual machine with one socket, multiple NUMA nodes (each
>> with 4 LLCs), unpatched systems suffered 3,000+ LLC migrations in 200
>> seconds as tasks cycled through all four LLCs. With the patch, migrations
>> stabilize at ≤10 instances, largely suppressing the NUMA-local LLC
>> thrashing.
> 
> Is there any improvement in iperf numbers with these changes?
> 
I observe a bit of improvement with this patch in my test.

>>
>> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
>> ---
>>   kernel/sched/fair.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 0fb9bf995a47..749210e6316b 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -11203,6 +11203,22 @@ static inline void calculate_imbalance(struct 
>> lb_env *env, struct sd_lb_stats *s
>>           }
>>   #endif
>> +        /* Allow imbalance between LLCs within a single NUMA node */
>> +        if (env->sd->child && env->sd->child->flags & SD_SHARE_LLC && 
>> env->sd->parent
>> +                && env->sd->parent->flags & SD_NUMA) {
> 
> This does not imply multiple LLC in package. SD_SHARE_LLC is
> SDF_SHARED_CHILD and will be set from SMT domain onwards. This condition
> will be true on Intel with SNC enabled despite not having multiple LLC
> and llc_nr will be number of cores there.
> 
> Perhaps multiple LLCs can be detected using:
> 
>      !((sd->child->flags ^ sd->flags) & SD_SHARE_LLC)

Great! Thanks!>
>> +            int child_weight = env->sd->child->span_weight;
>> +            int llc_nr = env->sd->span_weight / child_weight;
>> +            int imb_nr, min;
>> +
>> +            if (llc_nr > 1) {
>> +                /* Let the imbalance not be greater than half of 
>> child_weight */
>> +                min = child_weight >= 4 ? 2 : 1;
>> +                imb_nr = max_t(int, min, child_weight >> 2);
> 
> Isn't this just max_t(int, child_weight >> 2, 1)?

I expect that imb_nr can be 2 when child_weight is 4, as I observe that 
the cpu number of LLC starts from 4 in the multi-LLCs NUMA system.
However, this may cause the LLCs a bit overload. I'm not sure if it's a 
good idea.

> 
>> +                if (imb_nr >= env->imbalance)
>> +                    env->imbalance = 0;
> 
> At this point, we are trying to even out the number of idle CPUs on the
> destination and the busiest LLC. sched_balance_find_src_rq() will return
> NULL if it doesn't find an overloaded rq. Is waiting behind a task
> more beneficial than migrating to an idler LLC?
> 
It seems that a small imbalance may not impact so much that cause task 
waiting for schedule because we limit the imbalance not greater than 
half, in most case 1/4, of the LLC weight. The imbalance can reduce the 
frequency of task migration and load balance. it's better than enforcing 
a strict balance rules.
we have done similar things among NUMAs, so may be it's reasonable to 
migrate them across LLCs.

Thanks
Jianyong Wu

>> +            }
>> +        }
>> +
>>           /* Number of tasks to move to restore balance */
>>           env->imbalance >>= 1;
> 





