Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6620A280304
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245838; cv=fail; b=qnlzYw9dRYMQ16+iCId8XSdcDZZimHM+gvs6r2/glSYAWxPf87g508eemXf18PzfmXLzNeCtxg+wqnNRoy5MJlhnJ7XLV58zHxJ+qre1Tx2zFR87ubSATpcPPke4JMo8JW3q1xlIIFKpaN2TizmuYF5K540G953RpkVOSDXBkoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245838; c=relaxed/simple;
	bh=7apgkZtiY3jxkS0GOEhxSQxEKgK2A3GyEvIY7OEu55U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AJxYaah3rD7OL2Owy/KcThzqlRs5IaWlEoIJiqrWUXUMLyFUHJqmDXC7U2ey1GSbfwQEhfqPs3Ma3upI3H/Wg0LpFBWKE01F1xB+gXKjw+pind5IaLRVkiVN33lAvweu3wOusHuDGKP0HmksA0/Gx64GzrR5h6RVjMuekXOLOfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hncA5Tau; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hncA5Tau"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Etm1gt/GejNqT2l9ozxErsNK/5wvOeM/RD7v1rPdPyIRmGAb60Lb5hvaGL8X+FRODl0tfmItnmQKCesjXj/JBYn618toH48NN4807kE7IOAxfGKSCBoVsdCE9grtn8jfahivgJ5VBq/GxVqOXU/ou6uJ2HbZ2dRKdSEEtmGEAQurMX5z42izYHmvT1FzJm7QfrFERlcEhFnneaWqcUQkMTjwZp2EEAbmhzZ/c0JZpMpCAEEDWEKNzcnD4Fvm2jWXqbIGVoIteJTR77iluwteE1yzoX5nOvFJxVtjsNKhLoczoEOO/bjZiGdo3Tj0xSGmTXTaxGZSRjjw6NaHRVFbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSUxrLyoQrtDwXz3oyOY0B0SqHfU+RIjVSLfVCmaVCA=;
 b=SRZSMunAL+O0FXAi1NWoY5YPhxdFQyzRcjYXEuEfM37SVqNmnMas4L8as+mte3yX7rU0YzqjFOpkAeN5M49VR7+9McAvg7zU+2eqdQ60NAOoukufVvxV9DEzfQEnezxdCuF9sfA+2msUalOmje1+h/KCCLcMuA32iPCFnV9SHkagOkDf1UFgXhW7BORyEIj1Tyukeb769PM+GPWwZp4kgT0MpbAOrmJNHSjb0xO1JEZ2R2ZZ9tT+eYlsWwvTlMNKnh2RtAYNEgNpkoldLc/VRPpuyb+FWESyzMnFwPb9knppD2Znkoina3qbqiW3HekKjJaQJk3wlOwGCo5YZLt57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSUxrLyoQrtDwXz3oyOY0B0SqHfU+RIjVSLfVCmaVCA=;
 b=hncA5Taul7bkAkD/pcG/604GT8olG6TNVlgw6gYb8bT8vqA4NTcmHnzbXG81tiBSs7w5eQNa+aKmmVH3isfUZ6N6CoIdHptMnk7dUFQNddCxnVGn0Ij3wX5iQozjUh7a12oKt6W67DvesnoEtkktSt+aQsYIpfAlbcwM6TNVFD8ZufFIKdbGuBG28lH8ZUdLvQLyHOVNvN0ZfS55xgAI8MEfdUhzXz4gOGE+a2OxTuVAB1hw8CF0CZPebP7LTyOW6j/bgEupmjXWcTQ/IeQliUK2iwOgmzDPWW87GwWsiLI0cLbZwOxleBgenqidtvmgG+86psEoSFB8JVgZ8T5S4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 14 May
 2025 18:03:51 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 18:03:51 +0000
Message-ID: <565ea9e4-8fab-4a61-a642-177d5f98f523@nvidia.com>
Date: Wed, 14 May 2025 11:03:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
To: Reinette Chatre <reinette.chatre@intel.com>,
 James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
 <79ddbc73-06cd-4ebc-90d6-363c2f1ccb4a@intel.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <79ddbc73-06cd-4ebc-90d6-363c2f1ccb4a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::12) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 98da8868-82e2-4695-b52f-08dd9311ae5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1JXZzdmQnJpbHg3bnpnblI0d2gwQnduUkU5WHM2azNJcnlGZzhBSGQzUHJT?=
 =?utf-8?B?YllpV0owanhYaXJNazZuaFA1SmN5UXFBQnhxK3dwVWtqSUdzbDhrajlDQ2Ru?=
 =?utf-8?B?UVVHTnozdGhYc2hzNnp6NXVOZUVRaTdFUDZPQXpFVURudElTajNYR1ZwOTRQ?=
 =?utf-8?B?a1N0TTkzdXVxamlVYjAxSXVGaE51WDNZeUlhK0pDazFvN1ROaitxa0tTSlR4?=
 =?utf-8?B?TlVJQzFWUEJkd3pYQjNtK1pRaks4b0gvTmpIdG53bjg1UXRRL3hmbWh0aHFa?=
 =?utf-8?B?REpZVHZ6RVI5OVIySFNHck0xdVdLRGtSUkpWdmV4OFpmUmt0RG5LR2wyK09Q?=
 =?utf-8?B?V2Q5UmdjTW5YczJsMzFxUCtGNnExbFpGZjM0WXRXWklHY0ZGSDlEKzFXVk9z?=
 =?utf-8?B?STNOeXR6MFZPbEpsVWdnYlcvNndac3ptTWZDMkhGbHZjVW43dWkyZWFKaG9q?=
 =?utf-8?B?UUJDNkRqNG5paWxJSm9QZ0E1LzRxUWYycXMraFNEb2hoU2dUdjF4U0F5dko3?=
 =?utf-8?B?eDNKWXg3VjFPY2xhRHNaMXVEdXVGekgrTnVqL0VWMGR6MmtzZ2QyNCthNTZw?=
 =?utf-8?B?NHpyb0liVXJ0OE5KWGljc2p6TkxRbWxQdXpHVEZPN0JkN0dVM1lDeTJXS0p3?=
 =?utf-8?B?OFdSd0R2SGRiR3R1VlFxenRwOTNXT3R3eGRnS2pBVDV3Qi8xUmZrdEpRdi80?=
 =?utf-8?B?KzBjR2tCUC9LRkYybGVPYUh1aG1RVXMvS055OElYejFkZm9xL3JpNnQrblpD?=
 =?utf-8?B?VGc0ajg4cEFTbU5DQ2c5TTVXcTJzSGJtZGw2NGxoc0RkdEdKN0hLUlBBM2gv?=
 =?utf-8?B?SS90NTduVzAxQThHMlRXNmtsaFN6V0RwNDB2c2JMVy80RnJpQmJHZlgyRXBY?=
 =?utf-8?B?UzBSNGprRGtsNlZHMy8rTHBOWlE4MHpoZyt5N0grN01rRS9rc0IxQ3QvcjE3?=
 =?utf-8?B?Z3NsYXprdTQ2TXJFNDg1dkExYzFBTkNGdnBWbWR3NFBsaGxoaUpmZWhBakNC?=
 =?utf-8?B?ZWdWd1gvQ3luSFZjZUJuaUlzcWFGYXE2ZWQwYUJnMU5EbDRTOFlFWHd2bnVO?=
 =?utf-8?B?TkRyQ3hEd2F0US8wY0ZsbUpnWkVaQkNiT040UDBPR203V1V6R3NneG9rbXoz?=
 =?utf-8?B?OE5kQlRSclllSzZ4eGdLTlQyRVN5ZEt5dDRONURtaUhBcm0xa3IvdkovOFc0?=
 =?utf-8?B?Tk9Yb2hUMjVwdHVLZnJ4VnlMMkpBVEcweHZla2tkVGFNaUorL1ZvVytyZEl6?=
 =?utf-8?B?TkFOUlgyVnJzc1NIR2hOSXNDREhocjV6ZVBJMzl5M3R4UkptaTJPL1dUUmhu?=
 =?utf-8?B?NXRHKzJ4Q2VUVXlYQ2VUSndPVTQ1RjNJcEoyRUFHZFh2YXdSSEs5VkkzV2Ev?=
 =?utf-8?B?cktFbHhWNDBnTVUxdFM1bDZ0MDFQVnp3eXhrUEdSZ1ZVckV2emRmTlAwTXJj?=
 =?utf-8?B?bE1sbXBLMXBpQVVEaVM1a3F5aTFhcVo1WERBai9DSW4xWlFsK2JpN3N1N2hY?=
 =?utf-8?B?L0RJanhJK3p0VnB3cFI4ZUl3ajNrekJFaU5aSVAycHhlNXVqUkVVWFNSV0tS?=
 =?utf-8?B?WUxCNHo5TXFUN1hNT3VKb1F4dC9zZkx0Z0RLeFR1U3RQcTg5dEY5enFlT0hU?=
 =?utf-8?B?aFEyTmMwekxaNSt3Lzk3eTM5WWtlVEJWck93a0o4VmhGZmQ5ZEs1bm0vZjl6?=
 =?utf-8?B?Rk5oNDduVVZPQkNWUDdtUi9GZEE1WFJCaWdUR1pseXM0V0p3aEpGSlY2dHRx?=
 =?utf-8?B?ZzFpU25hcmhqM2F2QkZzWmpMUWQ3MFZHaExldyt6TUxFMENKZ2F1QW4xU1lY?=
 =?utf-8?B?TDBIWWZHbFBrTWhpSlNZb24zZ1NhUm9OMFVIc2RzdnZvTzlwOUtqNkwwVTNZ?=
 =?utf-8?B?NHFUbStKd29kcEFxZUgvVTRMTVJLbytZMExueE8zd25YcHRIWUNGYVo2L0FW?=
 =?utf-8?Q?hKhaUatXNIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWdBa1htTGNCNFc5R3hpR0p6YzZnQ2VDYXBrS1o1OEpkcW1oOXI0dlVoUytX?=
 =?utf-8?B?eUFFS2hDQjZzWWtKbmJ3bVgwQ2ZKU1RkVzI2UUU1R3lrVzhMdjhKd2JPSE81?=
 =?utf-8?B?cldadXNQN3VlV0pCcDduVXBhc3o2TEFlRDNzbllpak1MZSt0V0wvSHJDeHJj?=
 =?utf-8?B?WVFvV0JrUm9IYlQ5YzlySjVwK3NETCsrTEFpeks0Mk5NRmFrUXRiUHRPVGhl?=
 =?utf-8?B?YVJvcnppWDZkT1FUNlBRRGtkODMwbnUzVlRaUGhBOVZvQm9RWnRUR1piNkl3?=
 =?utf-8?B?N09nVitFdXdTTDNXdit1RDI1dGMvaEd0cFlqQkQ5a081cStCQkxmT05hSExR?=
 =?utf-8?B?YXdVZmdGNjFkenJzejVIS0h0SUN0Skx4SlFpTjZweHFxcmdQbERYek5LMnpZ?=
 =?utf-8?B?SC9LUjUwQkkzc0hSMTNpMm9CbUlJM2lnbERUUlFXblZIUTZDYzU3MGFJYy9B?=
 =?utf-8?B?OVk5K2lleG5Yd1FEekNMUTNsRUNUaW5CMXhXcGlpNXliOFUyVUhMSHZJcjho?=
 =?utf-8?B?UkhsSTZNZWdQc3E3eTJNZ1JwZzFNNG13YWlEREw2V21MQ0pUMDV1MTVxUEY3?=
 =?utf-8?B?cUd6Y1gzTjE1Q2lzZ2xDc0hsc2VOVVNzWlROVUo1WXdXRzZBOEM4S1llOXNZ?=
 =?utf-8?B?UDdhSGZ2dmhnMnVDR1crRDhBdEtPMVgvd2pPbmorK0hLemt3TytaZS9wdnph?=
 =?utf-8?B?bFZ2K0FrZXRuRmFDQklzU3F5ZlBuQTQxQzhWRS9ZWFVkVStIYUZmakZtWVBI?=
 =?utf-8?B?MU5sMGhCenhDMUZBbmVWdW9EN2R5REQ5WUtIc0h0M0xvNnpaaExqTnhDcW1N?=
 =?utf-8?B?VWRXeGRvRGE3YjVFbkhNZ3g1R2FRY0RYWTZFVlNxaFVLMVhoOFZjZENrVDI4?=
 =?utf-8?B?WG9zSFlRT2RvYmUxcjVaUm4yVVZYWWtHeWJpZ3B1S2dLUFhHZWdXLzZncEdh?=
 =?utf-8?B?d2lxQmRZTTVra3RoSkFHYWhKa2krR0Z6ZHhBRlpPejZRYjdLNVVLZGpGQXhR?=
 =?utf-8?B?TzZVeTdJTCtybDkwL1NJQ21QckM3RnVabDhZSkJYbUR0Njd1cDlQekpuU3Vt?=
 =?utf-8?B?ZTJCWUh0U3AvcHBpMVFZMmtqTm1SRzQvTkNnWjhPbFU2MGVGbTZkaDF1U1NB?=
 =?utf-8?B?TkdXS0c0bFFQNFpXcXBNZk5ZR3R3ci93amJHSVhjU0FBbHJkQmR6QndFWHVN?=
 =?utf-8?B?UTQ2Z2RjeEc1Lzh3QmFvckxFSFBlalc1cmdLTTRzbG9QU0szdUJGNDlpcEoz?=
 =?utf-8?B?MksyNC9BMlpwT01RRFU4SWIxb1JQeUh2RkRmc1kvZGRLNU81a2d6UlRQeW1H?=
 =?utf-8?B?VC9hb0o0THdheWY5aXMxR0ZsOWJlUjA1MnpiOUNqMFl6OUhxVG05OWp0WGV1?=
 =?utf-8?B?QzUyczdVSEQ4M0VmQk96UVFJdDJFVXhFRmVLdnBiYXhhWlVGdUZ3VGoxZTFn?=
 =?utf-8?B?TWFMaFVUV044bHJtcFJnVXBSRElaT1hRU0l3cENXTEwyTkx3amZ0RC9GUTZP?=
 =?utf-8?B?M2NnTmEwZURzOU14M0N6MXB2RWFNTjhHWUxBVXB1R1B3OFlZemRleGFBSkVV?=
 =?utf-8?B?N3pDQXRuL0FiaWJ3aE5FeDgrUTYzaENKVmZ2anJhK3BwZE05T2dUdVZseFJM?=
 =?utf-8?B?NDBOOENoWm42MWx5REc4NktaUGFhNFhFR1gybTV1UEtXT1U2a3VQZ1ZMZ3p3?=
 =?utf-8?B?VC8yWFlBRS85SmNPOFVYZzJqVEpDb2ZJbDdIaWFqV0FHcXBQemF4QTBVMmo2?=
 =?utf-8?B?R1cxRXJLNWtsQ2JHalFDQUZBTy9IT3lmdHJhcE41ODJVYW05bElxbWlyYmps?=
 =?utf-8?B?d2hRWGNRRDJFNGRDMnRuNGhMdDN3TTl3V3l6NFM3M0Q0KzFZcnBHYnh6WEhi?=
 =?utf-8?B?WFdZTXdxV2JFeVdoaThXaU9tUktNMmdZUklYMDNVaHlCWU9DVGxIWXVzSmVG?=
 =?utf-8?B?ekVuWkZmbGxOODV3QnJ2bGNBTHlVRlFJV1Z2dzd2VGlkTXN5V3dUSVpyMDMy?=
 =?utf-8?B?eDhORU9WSWxTa09GdHB1dVhUeHFJWTNEeHVJd2YvQnhMR2VRVGJwTGZBRzha?=
 =?utf-8?B?ZmJJMzlPWDdwSStLOEhJVzFCSVFQQnNxd3VWQlNuMnRSVGxNcWhzK29Bb0dX?=
 =?utf-8?Q?N17+ukySjcYoKCrlkwlYACdBS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98da8868-82e2-4695-b52f-08dd9311ae5e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 18:03:50.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4GNPY86CUXAtHZC53SXwcngfnt9YdPucm0KUAWG5/xVb+VMiNJM9dAxZcAldZp95s1Jx21+sJVg/uG7qvkmfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992

Hi, Reinette,

On 5/13/25 14:19, Reinette Chatre wrote:
> Hi James,
>
> On 5/13/25 10:15 AM, James Morse wrote:
>> Changes since v10:
>>   * Changes the online domains check in patch 7 to walk control and monitor domains
>>     separately.
>>
>> ---
>>
>> Patches 24-29 should be squashed together when merged, taking the commit message
>> of patch 25. It probably makes sense to drop the tags at that point as patch 25 is
>> generated by a script, and impossible to review. They are posted like this to allow
>> folk to re-generate patch 25, then review the differences on top. Not squashing them
>> together would expose a ftrace build warning during bisect. (but who does that!)
>>
>> The result  should look like this:
>> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v11_final
> This branch does not exist.

This branch is existing now. I can clone, build, boot, and run some 
light tests on this branch. All work fine for me.

Thanks.

-Fenghua


