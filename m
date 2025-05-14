Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744FA211A16
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252471; cv=fail; b=EqKH5l8oclp17JqbgrYUyBxNmtKjn7Iv4kBPy9xkCg9YfbH0vzp64lrXYPm/mhC/KY3804H7Wpy43kCjqe/WGQ3ZuUFmBLwP/0b1kb8vU8Gpc3a/RCHUlyzxf+8sKnUQpIz3j5rWeK32Sr+E/R2Ex6V4JUPdNJvJj2Ha+Gzt3iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252471; c=relaxed/simple;
	bh=KlNAmjMKNTd8AiighwXc8DVgcysCRhNzRxjLK23vOfA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EfeIC2ElZSIhxOkr499TVMfcF/H3w7mnRccy/bxukHdZayQViAOktMSr9OgzlR9Tr2HpI2ZPycl+GdKHkSJbF7J+SyTx8DUvQU1XoOqVyEPglopqhwM9gGFq3s1vI9MjznMpuycD7Nuqpwo4JL6vlCznK/PRig3EaCMievOKu7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uFKMALGP; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uFKMALGP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ka5SDuGovV1HVDYo4adHzGD1kDbEcv+HIC3IMCEzF5feswFPQUXXxOTztAmIJsqNk9psNjgyEpIT8ybHoj+jNg6v0/hmrWnZhA5UppC952wOm2rojcIRl5jjXTX9jlFZapdQtBi1FUvbqjJY1J4YETSxTvn6hELBGdGiLiclJwpZlPPaM5vbObQneqVDcxH/yGwvDF0RyQT495jqGhV78CqbhMNCKxdan9/xMb06eYP0WlWFM6HMS32K22knHO66LFcr7o7N6xasuAVtRlevY72F1ZJMevx8okLav1fWjPRxuCK3ZD+pntdjdsAGeoYHk3X8FcIjSGArNVePQvZgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlNAmjMKNTd8AiighwXc8DVgcysCRhNzRxjLK23vOfA=;
 b=VKY3np40d1tTlfkDrV6AyBgrI3qTSh/RJbV95ntWgXrVMXzKPcUKLK7iGnx6KMVkb2u6Vt/y9weLG0GwbQKqZAXmXEo8w8fPmU+agM1z+YR4F1MXmK6Uv4kzopIXSF5Hy4J/1U+U+tDz+b1CQyWNYsK/sEjDbXW2IgJ25w/Atp4m90yuMe6y6kRh77urm6sON40gd92o0yNwe283voKWCWkj0P2Bb+h+B2M+zYt8VzHjweEqJJNqE3ojB3L5K0CFf4qawWeT0hle23z+OijTCvFQvVzjs9kvj1nzzm202Lgl5ymud4nS1FRPAuSYg+2X9vTNIpj86R4aM4RrZBX8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlNAmjMKNTd8AiighwXc8DVgcysCRhNzRxjLK23vOfA=;
 b=uFKMALGPmiNvNXJeF1xrgcBCzPw8WtxvYAqK+TRfBXQH+hp5TIAF7BGEdEeksuubNL/0oTEZFJWO4bv4IrnPKPi4FyXI8FkI8LqOTdO9xaRDKNtmd9QkRxtcZh9nqpZsKq/RaLuDOQV1TjDGkl+iFpE2KAsKXbIl7gaKCJ/kxRbPc8+npzbIN8TbebBa365cGOLK2hKvlcUVkTKACFGJAhxH33riD9OHmG1a4ZZd9ewa/QNRiv9pfwYqkHW3VMTicec4ht6ReBgIRVjC8LGHfP2IXyuPEralwtUKceHgxuApSbj6PV7Jr2lEKK3n5XOhrA/RS/VOcUna2vKWrrYMrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 DS7PR12MB6168.namprd12.prod.outlook.com (2603:10b6:8:97::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 14 May 2025 19:54:25 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 19:54:25 +0000
Message-ID: <6cd896c1-70f3-410c-9b9e-16dd0ccb5c86@nvidia.com>
Date: Wed, 14 May 2025 12:54:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/30] cpumask: relax cpumask_any_but()
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
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-2-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-2-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:510:323::19) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|DS7PR12MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 112c8cae-bc2a-49df-d9f6-08dd932120d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjFwaC9zOFRRam1wSHVVUVEyQnMvbU5ZaVp2QWozVSsvN2xXQzMraXF4RW9k?=
 =?utf-8?B?WXloLy9HTk5FUno3QWtKQTFVYjg3SmdESU9hcFhIWTNmZy9XRlllN0Y5bG1F?=
 =?utf-8?B?OUV2U0tmRlM5cEVuOXo0bnhQT0dVWkZHZytSSnl1OU52ay9hUnJYTmVGU3Uw?=
 =?utf-8?B?cjEwd2doOWcvWVFEL1NTdGUrdHVZMEcrWUZVcCtJRG5zb0Y5aWx4MWFqVDhS?=
 =?utf-8?B?ZkRnS3RvUmVDTEVGclFiMGwyL0tBVkVqeTFUb2pmbTRtaFlRdjIxSzI4bnhk?=
 =?utf-8?B?cWNEbHpsMlR4WXljcXR0U2pESEpVTnJnZWl4T0V0N0xoWHBXTXBxMmlpU3BC?=
 =?utf-8?B?TGtnK1FxcG16cGpMK1JQaFRaZTJrMGhlWW40eVNKVHI4WDZpbjEzQlZ6RzNy?=
 =?utf-8?B?MWEyd2RNUG15ZTZSS0xjWjNjTGZnbC9rMjJnZmdWQlNITkNGUUxDVTBXQVZs?=
 =?utf-8?B?OEV5MGVXVFUrQVpQdXZoRXhkSmFTUFRncG00SlM4QjV5MU5HQ1NrSGk4ckNU?=
 =?utf-8?B?VFJScWhmK0NJWVBOWDR5akErNHUvMktrN3p1K1QwWnFia1M4UEQxQXByaDFG?=
 =?utf-8?B?aXkyZHBGVzkzaHMxUUJzQng3MjBZenROT1hvTUVaeDl5R0hOYWpNK2FKS09o?=
 =?utf-8?B?V2tjREdBbGtWWnQ1dElKMis1VzgxZkpSOGR4YkIvdEQ3dkUweWxNcG9WdktV?=
 =?utf-8?B?OUpzVVNpbVdMbDVtcjBlVXpHT2VIY2g4OENoWUw2R2RuT3RxaTlFWDhIbjYy?=
 =?utf-8?B?VjBSWlJia3hFMW1LWlN5SUNFbzcwdXFpSVFsclBIR1FKWnJiSEJ6ZU5PeHFK?=
 =?utf-8?B?U1gvTHgyRmtWR2E0WERodlNTdFYxdWlMSFd6QmpDbmNUa2Z2OVBlSWhKOUVp?=
 =?utf-8?B?cTA3bVdtV0lJelkxR0FoR1lzNDBnRStLcmxtUEtESmFNQlRwckZRL2NJR1JI?=
 =?utf-8?B?bHNZd3lIU095WVRsbkc4NnJocUpyVGphRjFZekJXTnRRYTJiZWduYk1reUpM?=
 =?utf-8?B?aWlRbm1QT3pxVEY1aXpBbElpZGdjeEpYbitqdm43VXdsNlJIMnRCVG5Sd09W?=
 =?utf-8?B?bUlRUzFGTEpKN2ZueXFORS9NaHBCOXRCUEdybDhDaDYvTG04REdhendPb3lT?=
 =?utf-8?B?LzJuc2JqZnJxcXJuRFYrdWt1ODA4WFNlUEgxZHU4bEc5YnNvWDRJZDFhQnND?=
 =?utf-8?B?WEJIbllKaWc0L2hyeHNKRnpheElqT2pHYXhMeEZvblVwY3g4aWF6SDZoQXpr?=
 =?utf-8?B?U25aVUNEUmlRNjN6Zlo1ZnV5QU10bE9DdDltZzQycy9hRmJEQjhsSjRmbU1Z?=
 =?utf-8?B?OWRkbndzUDVaUlVvVXl6SVhzV1dDUUZNcnNxUHB5TW16cTRLVE53S0Q4bDdy?=
 =?utf-8?B?RjZCK2pqN2laaU85b1ozbE85dVBycEhNeVRUVXl5bHZKK2tEUVZSMmxHV24z?=
 =?utf-8?B?NzVxS043NVNubHdZY1FBVjNQUUN6SWg0bE1SYlVXNlExTTRZS0hIK1c3OW83?=
 =?utf-8?B?N3lyemlQQmFjdmwvV2xVS3JWMGE3U1hodmtseHRjc1RxMndxRHVWeERGQnUw?=
 =?utf-8?B?eXMzTXdSdk1lVXNxWmlkM2tCYmw5RzRKWkRGcmxrc1JLSk45MnZySUdrNXkv?=
 =?utf-8?B?YVdwdk9JVS9LTVR3Si9FbnNCU2doaElmeXdORkcrR2VJZS9tdE9PVzhFSHdk?=
 =?utf-8?B?MDhhMmhrMHNKRXBYNFhLODA5eVdCTldVK0ZtQUJ1UW5zam56L3Y2VmJDQ3F3?=
 =?utf-8?B?SEQ3UmVvakpIeER6cDNtbkxVYmE2UzRXb0ZaZ1cvRnZtbm9uTFZDY0R4VUl5?=
 =?utf-8?B?WldScHFQREVwcExqUS9QdGdQNVBDUUgwb1EzMkFmTDFIdzdrMTloakZOZGh3?=
 =?utf-8?B?TDFlWG9XV1dtQ29ESVVBekdMVkRscWVVWlZJaEJqWkpaMXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2pVT0tkSUt3Tnl0QWZYNVVrSktuTDY3QUd3bmtGeVBUY0lGd2xGb3dGSmNX?=
 =?utf-8?B?S0daYXVHYS9mYitxM29MVTdFVUJVVCtabVVxcVIwZ2c3Z2xEamM2ZmdJaGN5?=
 =?utf-8?B?UkhaMHZJeHFOU21mVk9iMmt6ay85RWxtOUwydjhwMlBuY2JDOXc4bUEvUHIr?=
 =?utf-8?B?am16dWwzcnBraSt6MG0vUE5kcGdjK2dWNWhvRkw3MFo2cTB1Y083YXFVYnJS?=
 =?utf-8?B?dTkzZ1RsNTluRm1PUHBHQ08xVEdhTzVoa0pGWFB1Yy90cTNDMWlvcitOTWV2?=
 =?utf-8?B?NDNSODd2S2xjUVV5OWZ2RmdpQ2VUVU5qd1VUZkUwWnY2TXRsY2pIaHZDY1JK?=
 =?utf-8?B?eXlwVzYrcFdEcXhaR1orQ2h5YWJVMCtpM0ZaK2xNYW81REFCdllUUWFHWGZ4?=
 =?utf-8?B?ZVY0NVRkOFpGU2ZZU2tXTGZFbFdSemtGZFFTYnlsbklEZEZ1Q2pJczNZRmdY?=
 =?utf-8?B?cWNTa0hVUll4QUY5SnZiOUt4bk5jc0hMdDdGVlNFQ1hWQVNkRkpVRUFnVVZP?=
 =?utf-8?B?bmdIeWFjc2QzeVBvLytEVWdiVVhDTXV2VFZnQXFMUVBnaXlVS2ZHNjZtMlVP?=
 =?utf-8?B?Qm9DQTZicVRYMVpiUVl1Z2ZNT0hYcG9UdDk1aVp5b3MrSXNQVk4rSitzZmE5?=
 =?utf-8?B?TXQzTzhjMHpiWm5wRnZtbng3MFRPNC9wR00za01vSUh3QjRhT1NzMHMzYU8x?=
 =?utf-8?B?TXpTZEE4UlQ2eGZ6bXRqQ1pqTUlpcmMzS0F3Y1lzK3hFTk83bnVJTGE1MlNG?=
 =?utf-8?B?ZTZCdzgvQzQyd1pXRGJXdDR1L2s4Rm4xa2VPOWNSVi9nS0hDZDNpcHhDYmxM?=
 =?utf-8?B?cTRTOEdkZ3ZsV3FwMVpRUnc3c1hpOUtYeDFIU3FsMks4SUFVSCtWUHA1Vzhq?=
 =?utf-8?B?VmhxNDZHTy9QeWJnQW1xTGl2OTJ5bUx2OHFVbHpteThrQUpkMnJjV294TVJ2?=
 =?utf-8?B?RkMzcTJXREd2UzYxbm9qeEJKbWcrUUhLdHMvMEtJMTdxTW9Cc1pwc1hadXFQ?=
 =?utf-8?B?KzdtVFp4NzlHWDl1Y2kwMW9uYmIrQUFhenRTeGYyc3g3R1gyZTB4blRPUVl4?=
 =?utf-8?B?UThzWHlpNi9lU2dseVp2UnhVNTduOWJpNFVRMUtXdUtwK2REYVNEd01SbWo3?=
 =?utf-8?B?ZjZGNGRnRFB1cDl3MEJnb2RuNTFXZFhXWkY3bWdzNlcyWXZNNXBJRGRWRVdz?=
 =?utf-8?B?MUlGMmRZekR3em1JVmJRUFhuczBjRFc0V09DOHExVDRCSVF0aGpsSFYraGhR?=
 =?utf-8?B?TGdIYStLSHNYeTAxWGtzOGg4QlRBa1drdlVKOUVYU0taOVN2Q2hEZk85R01F?=
 =?utf-8?B?MVQ4aXBtQzFOeVpVYUo3U0JYWk0rakpveER3eVFSRGlrRCtUMTV0S1lXd3h1?=
 =?utf-8?B?dXlvT2w0bVRFanQyVDFRWE1JNndYRWVJZ05lYWxjamRCYSttU1NZRVkrN3FF?=
 =?utf-8?B?L05FWTBwUFphaG16OXdiem91OCtyZGRYVDJDR1QvT0laMGlTci9pUDZxUkV3?=
 =?utf-8?B?WFlnaFVzbEtpMVV5NjRDTCtBTkJER0ZPVHVxNUJxank4Z2dTRmlBNTlScCtJ?=
 =?utf-8?B?eUtWbTJzK1AxQTlRR3B4Qkl0Qm9YLzZUbWVFdnh5UHRReVhRc0pYaTNuamN1?=
 =?utf-8?B?VkJtanBQRkRwTjJLMUFuS29MMHBJalhaY2xLb3B2bzVQaGZ0UHI1VlhRZ284?=
 =?utf-8?B?cHVYZ2VrbStXdjgyUTB4dXhKZUp5bkkybTZBcCswVlgvaWZXRGZPd2VvYndz?=
 =?utf-8?B?SlZHQmtWVHF6VENJcjVsZWhDUi9zZExKWnowVnhGRHNoM3A5ODdPbnB2ektF?=
 =?utf-8?B?MXJTWkoydUszNTIwSTI5cnRNSTBySFJnSm8xZ01tNDRvaFhlK1ZpaDJrZGdQ?=
 =?utf-8?B?Q3RrU1RRVFYrRWNwVFltcUZGSUlpRG92THljZnVXZUFBQzJlZjllYUZycVEx?=
 =?utf-8?B?Q0lVdFhwMHpKYnpyNDJNM01JazRnVTVVc1ZSVXBwcWp2TXdiT1I4ci9IYmYx?=
 =?utf-8?B?Y1cyRWN4WHo4T3RLOXI4eDd0MXlxRUoyYWFKK29ZcDR6L2RZMGNYemFMbSto?=
 =?utf-8?B?VU1tUGZhejl5OXc4bHlPTVpWcmtiM0FzZVdDUnh3V1dNM0NPSUg4TUVocE1R?=
 =?utf-8?Q?Mw+nrtLQyxWfZnBfUUQG2R8dJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112c8cae-bc2a-49df-d9f6-08dd932120d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 19:54:25.3005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FCzBqSu5HjNrDhpJrD8l4VWo5z2ablO9dLYXT3E+pj215BYZr8kx+4Icpvo6y1vl4/Nnk5f2ZZrhI7ykI7e/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6168


On 5/13/25 10:15, James Morse wrote:
> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
>
> Similarly to other cpumask search functions, accept -1, and consider
> it as 'any cpu' hint. This helps users to avoid coding special cases.
>
> Tested-by: James Morse <james.morse@arm.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

