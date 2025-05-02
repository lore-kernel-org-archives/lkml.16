Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F42905
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204334; cv=fail; b=DnOcwXze1+Owf6QTB/6SGLN53c8tNgLjchGrHjhVxFv80J0GJr2YBPYC7qqT9LmqcbakJ+xQXgJqtrMw7j/YFC/Fdi2Ugkr934hzMn6m7+koqEebs1+7+v3KMmiBQWx0m7FnOG6OPCLDCut84csur2UHaDKjPoYfArk3xfx+oIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204334; c=relaxed/simple;
	bh=0CNSlhQqUSrvne5OstKqKFk/1Gv8xP3YEzLyAcFhVdI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UkE3U1jkGuy9y92lGSxAAvlorS31wrGnF1/HF/B4BLwrTXk10sQ+bKMiAekFEWFy+bIoAejx97Rl10ZSyoG12obv/3DiCvs8CtIMy1kpmAaxQeq9qGvxA7S/sN6DzL5Nb1N419nEdBbLyL4JoNiLRZEZG1vfb/AsIVcRn0L3re0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mPVqrxSz; arc=fail smtp.client-ip=40.107.95.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mPVqrxSz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wxr6Sh26UokcpQTE2Py8hI18QPkHf/IIYNEYZQqdwjGNGniKAILYRUbL5kR6J2D7xDBp7DVT28CkQHWMHhosgzHPeURAXbuDW9TELlTiJpLc5SNcnNQwNMilqXACrk/EQXHjAxServeVBik9pWgwN00O+vzg6J1wIeH4Wp9kZ6K+FNZjJPWfFrf8LPPKRduUhTsscS0oV3Gyl7DfJmk+Z42+LYupUQBa4+moDxeOlvBypE2sboaIrk0V+0Wa+xXXAd9VZFpe1gsArD6KYbxiWPWLO1F+jz/jbfwi9z7yfyIL7QkYuhXpHWN2an89jHHYA4cCEhMWq3aAc5wfzXj9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26AEURZxxnhddrAa41vVmxVHxVF5HY3497PYox7f5Nw=;
 b=LKmDkK+m52li1JsFmaq5+H8y4uaaVCExpghGlyqNC5vp/hWPEUkTrMURJI1TCUgR0J4MqFdr9O1mvGheW7R5pVb1IAzbwBgT11M1/W7M2dXuvJp4yHEs25MpY/wPmObzqGh/z/aKGvUJV+vflyaiPpgYa9RjRdY62WuINcCnZVfbEDPZDTNud2sl6PQmgH8veMQEuZQETraNz6EYMLmVygiGqi8282qa7NLYH/5oW/XbphdDZw7brPXlfmThqRBpaTPKm/gkI/1euLa2YHH+yxXkLIpf3rqC5UhIXivdx7XGq7ea1fSkXuaZyI/8KI8hhPMLOKjR+hz41zaRcpDrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26AEURZxxnhddrAa41vVmxVHxVF5HY3497PYox7f5Nw=;
 b=mPVqrxSzrR2NHxspv/MfviQqvmX+PeWJMo8UMfiKfv1dGzvW8mspxgEiDazgN4l/BD3U3qO8voBJ75M6N0awGfaCNpZsFTMQGJBW8+05go0Lo9BE7jRkqyqP0/wKOQD00k+Hn+97eNFRYZH+g87mV3suhGueH2q2ZSqdlEWK+b8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 16:45:29 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8699.019; Fri, 2 May 2025
 16:45:29 +0000
Message-ID: <c88ebda2-8506-466d-9687-07566b7432cb@amd.com>
Date: Fri, 2 May 2025 11:45:25 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: Reinette Chatre <reinette.chatre@intel.com>,
 James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Dave Martin <dave.martin@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
References: <20250425173809.5529-1-james.morse@arm.com>
 <76b16ef7-2f37-4c30-97af-1d372b7fb251@amd.com>
 <f8bf0815-4013-4485-9ed0-a5b5ffab9f26@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <f8bf0815-4013-4485-9ed0-a5b5ffab9f26@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:806:d3::14) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY8PR12MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 9235d3d2-cca7-4df8-53d8-08dd8998befb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azZKcEVXRTZGemNuQW03TlBLbWxueUE2MzRMeTBpdllEcW9VUFFnR21ob1lJ?=
 =?utf-8?B?UGVidmxoQ0NCazNYaVlTMWJFVVRJY0gyM0JIYlFPY1YwdTZqS3lIREJTN1Qz?=
 =?utf-8?B?T2RlUmRKbm04OFJpNHFwMjc0RjBXaWZkZ2gxNTVDRno1eGpXRGtEUTZoUVBl?=
 =?utf-8?B?QTNIUk10aTNsYWtSbXJxRkxtMkUvTjNkSUhOekVvN1psREZIVmkxSi9veFFX?=
 =?utf-8?B?S2ZzbFZnQzJEYlpRK2MrekJZWkZWTGRqUU5OeFp5VmZRZmVhdk9vSisyVjZo?=
 =?utf-8?B?ZC9rRFRrNlRtUGQvakUrR1NFYVZDUUJXWDBsNzhjK2JvTHN2TllmOTh4UllK?=
 =?utf-8?B?Z1pQd0pLNStUaFJDRG5uc1JYL3gweU1oemdhd2VXOW03ZHJhNjZCcG43cDg4?=
 =?utf-8?B?V0hpTStZK3R1a0pVd0Nxb2R1UEJTb1FsVThNdURVd3pYSEkxWWduV2FYZldF?=
 =?utf-8?B?SXZEd2hGUjU3bk81QTMxTzJ3NGplcUhUUzlhZzJFNnhVbGcybWZXZzZuTXoz?=
 =?utf-8?B?cHAyL3dzZlFxRnk3UGVDY0RRUGVRR1Brb1NVeFlJa1BXZS9hcE1sMzJacTdV?=
 =?utf-8?B?c0JTa09scU1TUk52alFGb1BmNVRsL1pYRS9vdlp1M3pWandMUUo1c2ZEV2xp?=
 =?utf-8?B?MG96Vm5IL093amovYUhGbFNxVWpGd1JpQlJIellUaHdkYm5jTHBFOUYxRitx?=
 =?utf-8?B?ZGpPVGZZWGlEcEtqdTJ3SGl0NVlpMFh2b1ZHbXo3TE1HS2hybmRIQ01JN2Y3?=
 =?utf-8?B?ZEVvMzRuZms1NjNSYllPbFNKbFR3YjhsMElXVkE1WnRiOFFLOVFxZzF2QUNF?=
 =?utf-8?B?QWc0TC9TN1o0OHJ5ZmtQZ00wZzNoTEYrTzd1R3g0NzVxdWpKenRmRWV5bW44?=
 =?utf-8?B?N29JcVZrWEQ1ZFI4YWJYODFuS01yTW9aS0JUMUdCR3FmeEJ5SUVBU3IrdGlF?=
 =?utf-8?B?RTNhaVNzOWZCSjdsT1JVL3RWdnM4MC9KcXpaMHc3Z21wYjV0dEJxcDA1QkNP?=
 =?utf-8?B?UEMxWW00d3laQUwxOU5YZlpHeHpOa2ZNTTR0bk9sQ3ZndzJGT2U4VUhxRUFX?=
 =?utf-8?B?UVNQdkg0Q2VXNGp4R1lZVFRKbEFOa3NaU08ybUNtQysxR3kyYlFob2RseXA3?=
 =?utf-8?B?Z3BXQU9odjVTL1RnZENERVJPWm1GWFpEWkwzZjBmbFhIcWlpd2F1aWg1VzZS?=
 =?utf-8?B?T2JPY3ZWRE4zamNObWpyUzhvOXhpUGl3Ti9CTWJGazZKSk15T3ErSkZQQlYx?=
 =?utf-8?B?TGVKWW5WSEFhdUJqK1FYK0tjRWxlM0QvckJrZm1HYTVxV052RkdxaWFXVDI2?=
 =?utf-8?B?NDhvVmRXMTFkTERTc3NES3FnSzJZdnI5Q1U5a2V0QnlJdWcvU2RGL3NJVGdE?=
 =?utf-8?B?WkRBekV4MUdraG9vNWQvWmV0enBLQkFueFVzeHREdURWUWlRaHd1ZGpEMTVY?=
 =?utf-8?B?MGVDSzI3bVlwcGRnS1dKRkdDV21VQlZhWnlOQVFXMTcyUm1uUU1LZ09kMm53?=
 =?utf-8?B?K2kyUS9LRHUySU5MV3FqS1BJU2RPZitpbVhtZ0U4Ym9sRk1UQmVodUVvWHVH?=
 =?utf-8?B?eTlHMXhsWndjZ0ZXNXIzZ1RzdTA3TjdkNzdPT2NYTkk2a2d6aGJsbUt0eUZs?=
 =?utf-8?B?bEx3dW5JUnR3bjZ5cWJNQlBocitNQnVMSWdXNmNrcjNOZHJsYkFWRDNnNkky?=
 =?utf-8?B?YzVQeG1PcDZyVGphRnkyTVhsQ3N1TjBFc25xM1ZSY2hvZ2FxNXd0MUFOamJG?=
 =?utf-8?B?empmS2RoT2orS2Y2RUpuNnVDR3QvaGRaTUt2TGlabkNDRVdhZWhkc2lTdHJ4?=
 =?utf-8?B?YkpXSGcvdlpRbkF3YUludDVaenZZSXBQY012QW1pQzlZV1kxZ1FTNHliM2RZ?=
 =?utf-8?B?VDllSFBPNW0vUzZnT3F5R1pWMXFEclowUllHMXVqNlBMRDAxTHRGSStoclRY?=
 =?utf-8?Q?7DollzpTmjw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3RmRVR1cCttb2Z6MlVEeVJkcXFGMEg2MlA5aWt4KzViUVVKOFVpempQRWEx?=
 =?utf-8?B?cWVEU0VLeE5wRFQwT1cxams1eGJuRTJubUdIaTlFakM3OUdiTWlTcnR1c3g2?=
 =?utf-8?B?d2ZidGR0UnlUa0R1OHExMXg0RU5EdmZtdXZYUWY1dFRaQVY0cldmWHBKdjdO?=
 =?utf-8?B?aVdOUkpuSjJYRWtSMVR3Kzl1N1Z1aDlVRFVJZlFMNDJ0bzlWWUtrVnlrWjc5?=
 =?utf-8?B?MHA2MmRWaVp6UVRabTBKdkpsajYxYmhCajlUS0tmRHgxclZnT2c5WllhRUJz?=
 =?utf-8?B?cVVFTmhaeTFoZEExa2taa2dKRFVaUFo0aUhDc0t6RHZ1V0c1OCs3bGlOeFFm?=
 =?utf-8?B?ZU8xZzh4Q3ZNdWR6anViWEs1dzh0OElabVc2NEV3OVZEL3FPQ1g4ZDdnbmtP?=
 =?utf-8?B?Nll0QTZVbEVaSnRCdGx1RXNESVM2SFRKSHdqZDBpa2hHcjZTYXJlNG8zcE1J?=
 =?utf-8?B?Z0pLeUIvWENqc0dUZlJyL1NKemJ4OHBZWDlFOG16UEx5dHRaM3J4bzlaRm5U?=
 =?utf-8?B?NFczVHNxd0Rmd3l6aDlPbkZjbXpiNnp0K0JDZkNCU0VJNnJTRXo1ZHFkMmYx?=
 =?utf-8?B?dGIzbEhsU25KZW90SWFESGNWelBaQjd1MHY3cTdVRWk1K0xoZnFOak5xcnhD?=
 =?utf-8?B?WDAyU2srSDFXWTBzTTBQSkRGd2FxT2NzcXpJZUVtc3pGdkM4bng4MnJpbUF3?=
 =?utf-8?B?YkkxWURrQmxmVzlvbC9IRlBGMmJEODdVZ2NGSUNidHBnK2F2bjhkeXVFalJD?=
 =?utf-8?B?cWhLMmFSZXR5M1JETUpTY2t1N1VlVFc5TXk2MGo2RjRiekhNT1ZzdkhFN2d3?=
 =?utf-8?B?Nm9kZnV0ZU1xMWxuWHUrT0xuU3lUKzBNVVlHbzROYXoxM2RDc2tNL3FLR2s2?=
 =?utf-8?B?bnA5di9sUmFYVmNiUWdHN01nOXhkRitFNVJiNzRlSlVwS3NqMXp1RlUxd2NV?=
 =?utf-8?B?L3JjZk5RYnQ5WEF1L2tmUlJlSURWdm1jZ1RRdVlwTEdPeEVrU09lMmJGcllS?=
 =?utf-8?B?UHBxaVIxRldhWmZ6Wndtd1U4Ti9wWEN6NTZlaU1WdEhpeDJpQWNML0FueXlv?=
 =?utf-8?B?aEV5dUwvK2t3Nmk1dGkrR21wZnJ1SmR4aWJVaHZ4RVozR2ZMMUtUWGJxV1NT?=
 =?utf-8?B?QlJZSUx1ZDBwdkYzb3g3dHpxTWF5ZmtKT3BRQmdsdHR2dlgvOEJhQ1F6Tmgv?=
 =?utf-8?B?ODhiVnY2YkpaQXNFdnpQV3NnbUZIYWltQUtBZUtwVTAzRmxtbXNKMVFJRDZa?=
 =?utf-8?B?WkFvRWNKaXg5WWJaWWNJNU5LZUZOdnErdDQ0SEk4NU84cnU4clYrT1A4OWRO?=
 =?utf-8?B?NVJQMG04VjFHK1hoWDJrVk9QVFJROFpaZEhCSzVTUm5STXZjV1o4dllpR2h4?=
 =?utf-8?B?SFpzV2JUZGw1WE5ORHU4OWhiYWcwVFZDanZYVHhuWXJUZTB0WW5uRE9zY3ps?=
 =?utf-8?B?TUsrL2U0QzBnTmNzYTBIbFBjS0toT1cwdjVKcWpvaVhvK1daWldCZTByYUdz?=
 =?utf-8?B?Z1Z0WVYzakdydFQ1aDJUMHFWakZxRVo2cjVDSWxMMGs1NXFnV0szOXIyNE03?=
 =?utf-8?B?RDRxN3FldWU2ZkY1bzJBbThqaEhWaVlsemRqN0duOUR2RjhIaktXNUN6Wnhj?=
 =?utf-8?B?ZlRIVFZnemhnSzJIQkRmTEp5RlZJejNNaXc3ME41Y2x4Wk1QTlZVNW5sTyt1?=
 =?utf-8?B?NWV0M2xvTFlMaXNsSk12Y0Vwck93M1dPNXg4b1N0c2JkK3JJaDVhTEVTek9a?=
 =?utf-8?B?MTJIVUhHZFU0Z3BraFcyOFdRb01VcktFd0NmNHVWZ3R2Mzk1SVJqTGJzZjJZ?=
 =?utf-8?B?cm9saDJ1MXVRL3JlTktFaGJmcmQzMzcrRHZiMXNRQnd0SFlrTGZodmExRStN?=
 =?utf-8?B?OXVEU0syc1ZBbXhQZ01XRUtCMjUzL3pGeWhVOEdYZGs0eEtmLzF0bHo5MkdJ?=
 =?utf-8?B?TkpSLy9qbjVOU3dkVTJDZXZSRE51RTdycFRJTTVxdHgyTlUweTNra2dZUEQv?=
 =?utf-8?B?MHhyTy9zdWxZMkp5MjR1YjFKUEZ1OURVSjl3UFAwYW1BeS9TbUNwcDJKV2ow?=
 =?utf-8?B?b1NqUE5zYmxJZVRUbmdSdmU1V2pzc2NuV3JGTmpmSE5IM2tMTlROVytGb3FU?=
 =?utf-8?Q?ZI9Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9235d3d2-cca7-4df8-53d8-08dd8998befb
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:45:29.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJxPGmJJoTgCQEIGIkX3d8YR6OKle9+RM36cm3wCXb0YpRDHBTX4h7c5TB3hdfb5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7290

Hi Reinette,

On 5/2/25 11:30, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/2/25 9:04 AM, Moger, Babu wrote:
>>
>> I retested the patches on a couple of AMD systems, and everything looks good.
>>
>> Tested-by: Babu Moger babu.moger@amd.com

Correction:

Tested-by: Babu Moger <babu.moger@amd.com>

> 
> Thank you very much.
> 
>>
>> It's very likely that these patches will be merged before my ABMC series [1].
>>
>> I'm currently working on v13 of the ABMC series and considering rebasing
>> it on top of James' v9. That could potentially eliminate one review cycle
>> during the merge process.
>>
>> What are your thoughts on this approach?
> 
> Thanks for considering this. From my viewpoint this sounds like a good plan.

Welcome.

> I do not have insight into James's schedule to support this but from what I
> can tell this work is close to being ready for inclusion.

Sure. Lets wait for James or Martin's response.

-- 
Thanks
Babu Moger
