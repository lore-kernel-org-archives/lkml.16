Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE01C5D5A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649675; cv=fail; b=L5QkqbGnv0luMObKkTM2yVFAGYSgTkV8FoIpM6jML0t0ztqLnQZJNWQpGq6buyf54rOq+4yFfDR3Rfcfu7+ZYBblEb9ey9Dr/SvwT4/sHYbG1oFxE5ZEYceqnz2sMLGpTGm7PWYo3AkHVQd9LLcm3RQGpv27VCxYq66v2qotu1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649675; c=relaxed/simple;
	bh=X0t5KO4YcavShu6eQAvLUwCw5qrGMPf4+WZpau+9nTs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fi8iK7rCJU8qzQorg9sBjTW0E6msA/e1czd0fmExlpo2ehzc0HriSusMWrTkUTaeSd761D431j8fBmRFZ24qt3v5SGCf0lydN0e2e589kW45u2kyQNgcxEJCdi5InnXoFUe7cXgCQZIHM7WeyzQW//qLS3619NDobK68ZRGZIsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ujAmDk4a; arc=fail smtp.client-ip=40.107.244.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ujAmDk4a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbwW+nAjM48p/erggrefXoXHqE48KkeU1gfM4rzO8u9uKXNxXixa7hv8zCqwQyVy5GVmNBy5jsLzx1nbiRauVBINRN5ct9F/ALAmLpQLNegr5cQRrGfKv5pTi9Uh1zh/XY6mP5Fc5Ko3nnNiQUvxIT/sOBB9lBWQXUGW04GkwpWxg7IeSA1oIqbfE+n98Jlsyzq5GlnIpwoPOpjlXhJDYnPRt0j6TqLvumXnAUAPXTj6R5f9LZ9fQI0d7/qQGEuQUIBGAV18okIcTXvNHgIwkOMw1E48tYRR8ij9U16tcx5659e+VQKG9vqNcuGANn1dqesRm5/gDe9WTzNMUdEnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzqTu+b2vg6MWsuod/GzxTS5GND+WvqZ7QpBsKqZNvU=;
 b=ssbFnF+Q7rT0UoZ/+CSQSQ7sDeT+2KLqx8sciq1vwd0Q6RycSuvM8Jc7b1NNGpSq9geKBiUVk/d6eeu9WNR4u86kDcrpT9A8ZlUNxRWm3X5Tiq0+75HafKepKPsyoM4y6GFs91dauzIG3T89iDchcy/HVzfIRt8INXfd6bmAWgnAYfInktID9nokVwgw3GWdo++rv60lapgHh1yNUznpaEMV0F+40A1HvJQYw1plk95evlOeZJowt4Oy5+Alz/3ruRRNI2gBgfoNlbO82kXhODRocqf+bUlXOv4g09hc8RCvS2ra/C3NrF94A2a7O5pHKl+InkdpLERVv0OjQcmmfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzqTu+b2vg6MWsuod/GzxTS5GND+WvqZ7QpBsKqZNvU=;
 b=ujAmDk4a2fvpbZQcY4alLiqjU5gJ2ZMgxndTk4/uwfs9jY7/WAmzrsWo7Suph1/KVHqBeZbDtdYsv6kAbxeBXuvTFIiC62FRm47s0+KqSeFn3qQ3z941V3NUNphOtUYD/trYmB7n9479cDwf6LcIkd9cit4W247uw0LOQAUtaJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 7 May
 2025 20:27:48 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 20:27:47 +0000
Message-ID: <f73c1a2a-702b-4869-b562-82bdefc8ede9@amd.com>
Date: Wed, 7 May 2025 15:27:43 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
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
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com
References: <20250425173809.5529-1-james.morse@arm.com>
 <76b16ef7-2f37-4c30-97af-1d372b7fb251@amd.com>
 <f8bf0815-4013-4485-9ed0-a5b5ffab9f26@intel.com>
 <c88ebda2-8506-466d-9687-07566b7432cb@amd.com>
 <4176222a-3583-4a4b-8968-0cabeba6008f@arm.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <4176222a-3583-4a4b-8968-0cabeba6008f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:806:f2::17) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: b35341ed-7ad5-4aa2-5cb9-08dd8da5a183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MncvZ2svQkV5WG9oMHZiZElhS0ZzMm9vQWhiZFJnRTZGT1B1SThrMFhJUEJT?=
 =?utf-8?B?L1dVcnU4MUtqSWdraE1JbjQvVmpkdnhNK2MzVjZJcUxLVjBsTVpsYnV4SEhl?=
 =?utf-8?B?Yk1RYkVMKzZzdm5jTVl5RDRGdE9mOHRDWElNTXovVGVyeDA4WDVsdVVwTDU0?=
 =?utf-8?B?V1RmWFRxZGgxcU5aODhpK3BwM0hqL3Rmc2FjUmhHMGJqRG96eVlHZHFBejg0?=
 =?utf-8?B?UmowSzdFNVF3SmNHQUxZZTdNeThtRmFpZXpYMHhxR1BFTnFqQU1Ic3RsN1R6?=
 =?utf-8?B?UVZ1bFpHOGp0MzFac1I5SUlDSjFWbnRLZ1UweCttL2k1SjZxK29RWURUU2lO?=
 =?utf-8?B?NEpHRk05R2lFMkw5bGpIcjhJaWJiVDJldUlpVmhmTWpUSStyM25obFIvV2NX?=
 =?utf-8?B?MlZ2NXZMb1g2TjUvT1FQYWcxb2ZMMysrUXE5REZiNmlOZ2NkNGhYVEpEOWxh?=
 =?utf-8?B?OGFIbjF1UE55VTJMUzZEUTdLNEtCYmdSeW1GQThUdFpDTURONFI4ZXdIUnUr?=
 =?utf-8?B?cnhWTnQvT1RUM040U2NXckJWYTg5cHZ0c3g5cE40UWphS0M3bkErMFdYRzc0?=
 =?utf-8?B?QTNkRUxnYmhlSktYSWFwVHFzaHNBMnZxRXh3d3Nkam1EK0d5dnpEZGNoSjR3?=
 =?utf-8?B?TitmRUFySkt4YUNkUzlxVndSQWY3QnA5elZPMDQzZWdGeUVuSG5Velg4REpJ?=
 =?utf-8?B?dCs1RlpTS0k1QmF1Nkh5citMQzFINUtNc2U5bnplOExLR3hXcUo5NlRiTm9l?=
 =?utf-8?B?N3VKcGNENElhcVd6R29SSU91NlpsaUlFNUwwZnZqNUd2Y3VSRjNia3FSVVVq?=
 =?utf-8?B?TmZLUk1SQmpRTkxIL3dIVkZwMHgvbUtPTmxaeFFxSE94WlZRMVYzbG04aDFJ?=
 =?utf-8?B?K3FadytCU2pzcGd5Tnh1V3lVeUw4MFVNamEyRzZjMjFmekFSRHl5NCtBaFJx?=
 =?utf-8?B?ckl5c2huSVExTmtXWVU3WlR1bkZaUGI0eFJVRDFrY3B1UWd3VDU4UFF2Mlkr?=
 =?utf-8?B?aDh3aTBtRm5sbnBTdXZFcmxleisxUnM5Wi9DNS92ZWs1cFg1b3ZCU0FWRmRn?=
 =?utf-8?B?NkMrYTl4dkZKWFNSVk81V2hRSDNJeW1HVDBEYXJ4bDZ3YSt3ZVcxRU5EUEJY?=
 =?utf-8?B?K1VIcStPcUd1L0FGa0t5VlpVY255bERxczN4NlltTm9lVnFhN0laR0FIVGV5?=
 =?utf-8?B?RTJFOWYwWnh5WDBzY2tCcmY5dmR1eFpJSkUvUlB3ZGNkMVJvVUxmbWxjYnkw?=
 =?utf-8?B?UDBYT003MStnMDFGUGZlb1JVNXN1TEVQL3hVdllRUGNUSTdOWFQ5Qmw2NHVQ?=
 =?utf-8?B?aW83ZkdUNGhEa2tqaFZCYzZ4MkhncHBxYzZ1dEV2RUx3enEzSk0wcTcydDJu?=
 =?utf-8?B?bUlpUmljZ1dZZk1QWk9VUHVSRnBnVEJEYm1kb3ZzZjhvVWFKcUJFaldSb2tl?=
 =?utf-8?B?d0JMRTNxbnN1bnV5bUhTZ3BsZktxNTR0YitlY2dHRDlaZWlMY0pDdSt2ZE1V?=
 =?utf-8?B?dlpkRjg5OEVuazA2ZE9zMy9uS2c2Kzd5aWZidFV2OVlnQmJldFRsME0vWjFK?=
 =?utf-8?B?Tmc2YXRxa0YyWDJLOUk2R2RCa1JIbi9wK2lrbVJkdXhFM0dpQkgvNmNPTFNx?=
 =?utf-8?B?ZDRFL3VrTXJqZzNFL25naHBTYVBZa2NGdGNMUDJBdlY1NW9QMEhFRng0UEpx?=
 =?utf-8?B?Uzd1RnArMmYzNmpSYnFLRW1hL2haUzUxemJ0eFkrejlDQVExVWRXMHoxVnVw?=
 =?utf-8?B?TVUyUjFMd1hnMW4xckZjQmd1RzNHUDYvdndBOFNleU9zYXhSOGl5M2FFZ2JF?=
 =?utf-8?B?R3hScmE5Mnc3TWhnbVR6ajhLOUNvOG00dm5FY3o1aEJEVEdESk45Y1RFYWJB?=
 =?utf-8?B?czFTQU1xZWs0UU9TU01ZMmlIVUhJQ1N3TVhoLzFZTmVpbEk2NXNhS2tDRm9y?=
 =?utf-8?Q?UAiO9BNEIAc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnJ4cTBHUnF4S0dkK2w2OVp6bVFEYmVCd1JnYk9TaEtLZUdJRm8ySFZkNklS?=
 =?utf-8?B?SW9uU09ZcHErQmh0b2EvY1hxWVVlOG1SWGF0alZ6RFh6T3NRN3JZVmRGNmU3?=
 =?utf-8?B?YkRZeTFENHhFWTd4QzIwN3FuRmxpNzErNVQwWllhb3IrZENsNXc4eDlLN3BY?=
 =?utf-8?B?TEtkZ2Z2MFJlamhROUZMUWtwc2xXZ0lsdS9xNXk0Tm8rdXEvTDNBby85Rnli?=
 =?utf-8?B?T3FMMUJDanNHMXFveWVTTWkvVkkyOEtmMEtYMFhrZXA5Vk9zenF1d3lBeTV3?=
 =?utf-8?B?dzdGQXllZXBkWTlWTmlUcjlFcTdITFFjUUpld3JjcDR2N3Q4SWdXYXRtbVox?=
 =?utf-8?B?TG5KOCtmZFRZVmNGZS9IWXBKeEpNQWtvQTJnSko0M1JwRHA2QXlHczVFbWhW?=
 =?utf-8?B?R3pZdGR1T3kwWmNxaG1xUGtXWjAxeVc0ZFhJRDdYRThsdThmbEI3K1cwa3Fp?=
 =?utf-8?B?MzZvb0U0cGNuU1ZPeENJV0VJcURnZ3BuajlobFd4MnZxU2R1TU16UDI5Undz?=
 =?utf-8?B?cGd2dG82NXRRUVMycStPVVlVZTZRaFJTRnZsMnZuaEQ2OU1GRFlUblc4dy9N?=
 =?utf-8?B?dW9DMVNPdURQd0ljSS9EUm5lbXFQN0loZ1crRU1ycnc4eEpqQVA1R0xCU3A2?=
 =?utf-8?B?NUh2ZFRvMjdxZnYwcTRza21KR2ljV0pKS1RiOUREQkhOSjROWmFPb0NUdEhF?=
 =?utf-8?B?Snc0M1ZCcEdYaW1kd09CdTlKK3FoZDNwYm81VkNwdlpjZEZUQ2FvbWxBVzFE?=
 =?utf-8?B?NVZ2U2EyMFl5UDJLZDU4dVJTYnFrSDg2Si9DNXdhYTMyUFFjdWxvRXpGN3Qy?=
 =?utf-8?B?UkYrQ1EzQmJEa3V0emZTcFRoRGs4b3I1bnF3QXRMRWtvanEySktBeFdwOVJa?=
 =?utf-8?B?WFVPYzJmT2pzcXV2cXQycy9Fd1QzdUFsNGNZZFh6cm4raXpxRGphbFJvZTRY?=
 =?utf-8?B?VkFXbVZPdnBRYjBkYzNWTll1emtvaHhpSnE5VFcxU2pNT2hWQkhRU1BsYytW?=
 =?utf-8?B?QU9QdWlkWC9KS2RVVjcrTTNWd2xCTHVSNzEyY3RGQ080VHdSak9Oc3RzazBL?=
 =?utf-8?B?dHlhbDRuY21ONmpzSW1RcXQvUll4ZHhRMG4xUEVmeEU5VGtDdys5bWtOMHVx?=
 =?utf-8?B?N3dYMEZCb0w5TENhL0xMOE9MQTZRM050b0tpbkRLRGRHelNJd25GRFRkaFlx?=
 =?utf-8?B?VzI3enZEZEgyWHFRSUs0azhrNUFpdFdzWEVjUlM4N05XVnJVVWMwd1NNV1NM?=
 =?utf-8?B?R3ltQnU4ekxoLzJYME9qc0x4bU9pY1MzY1ZCU3g4cklhUlJybndXTHNtREpr?=
 =?utf-8?B?MlZ0L2svQ0NEN2NEWHl3UlNSWXRrYkx1bEpHOVVJdWRVZnBFdk44UllHZ2Fr?=
 =?utf-8?B?Vk0xMmRWN0FESytlUmJzeGlCYVlqdldGT3Fhd3JVbkl4Z3ZEb0RNbG56cVBV?=
 =?utf-8?B?a05ESXVRSTVtQkZ6dE9sYzN1NU9zS2Z2TnZHcTFyMjZtZXdUSVY1SC92SnF0?=
 =?utf-8?B?d3FQeElHMWY3YkIrM0pLSkUxb1UxMXZZTWdpK2Fvc0pTZkpwS2hiR1EvWUw1?=
 =?utf-8?B?RS9VTmt3T1Jzc1VvN2xsQW1BZ2k1WURzbTJJKzNyRnFzNnFCOTRlYjBQa3Bp?=
 =?utf-8?B?WW9rR2dEOFZSMy90TjlOZ1RFQTlRVThVVUltZTBvaDdJVkdmL2diSi91TlVn?=
 =?utf-8?B?VFJlQjI4em9KV2NwUWh6Yi9aaVVHb2ZlSml3WFc1NkJBbmtQbjJMR010UGw0?=
 =?utf-8?B?SjdMUXhGUlVTMzYvSzlKZGVuaUY5bHZhYklqU21hWnpNUWFZQnJKWGFzbjZ4?=
 =?utf-8?B?bXlSbFZnazZiY1FvQjNFSVVGaFd3TytnaGIwV0JnTFIxOUpoTHpsUFQ0aXV1?=
 =?utf-8?B?bVVWV1RjbGd4NnZ6czRzU1FEMmlFQThTeDlPV0tRZEdwNG9DQ1VPNHlSd2VU?=
 =?utf-8?B?QUE1QW5OWk0vSkp1UWU5Y3R4K1IwbUNLWDdjTnZQWHNPNENuTXVTbk1ERW5Z?=
 =?utf-8?B?UkRza3J6NCtkMWR1cXNMN1dlUkFjRjJ2WFNXMDZVa3FwMmxLZm9kb2dBaFF1?=
 =?utf-8?B?Vkt2WlNsSWh3bWdkYzhQa3VPYUk4V0dJc0krdVZpNUhieFEzbEk3aElTbTNV?=
 =?utf-8?Q?qdMQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b35341ed-7ad5-4aa2-5cb9-08dd8da5a183
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:27:47.7455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVjVlKOtQFOJbspMtwfZR9elbyenroQL75jruLhUYpSdrpUAtEkLAz3j2dN4ZLlC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD8C5D7E64

Hi James,

On 5/7/25 11:49, James Morse wrote:
> Hi Babu, Reinette,
> 
> On 02/05/2025 17:45, Moger, Babu wrote:
>> On 5/2/25 11:30, Reinette Chatre wrote:
>>> On 5/2/25 9:04 AM, Moger, Babu wrote:
>>>>
>>>> I retested the patches on a couple of AMD systems, and everything looks good.
>>>>
>>>> Tested-by: Babu Moger babu.moger@amd.com
>>
>> Correction:
>>
>> Tested-by: Babu Moger <babu.moger@amd.com>
> 
> Thanks for re-testing it!
> 
> 
>>> Thank you very much.
>>>
>>>>
>>>> It's very likely that these patches will be merged before my ABMC series [1].
>>>>
>>>> I'm currently working on v13 of the ABMC series and considering rebasing
>>>> it on top of James' v9. That could potentially eliminate one review cycle
>>>> during the merge process.
>>>>
>>>> What are your thoughts on this approach?
>>>
>>> Thanks for considering this. From my viewpoint this sounds like a good plan.
>>
>> Welcome.
>>
>>> I do not have insight into James's schedule to support this but from what I
>>> can tell this work is close to being ready for inclusion.
>>
>> Sure. Lets wait for James or Martin's response.
> 
> I've got a v9 to post, rebased on top of the cpumask changes. My only question is whether
> to post it with the tail end of patches squashed together - to save Boris having to do it.

You have few comments to address in v9. I would say post v10 with all the
comments addressed without squashing. Give the clear instructions about
squashing.

Let the maintainer decide how they want to handle it. Pretty sure they
have seen these cases already. Worst case you may have to spin another
version. My 02 cents.
-- 
Thanks
Babu Moger
