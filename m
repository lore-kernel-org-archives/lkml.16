Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E3120B81B;
	Mon, 16 Jun 2025 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085477; cv=fail; b=tISEpKq9ioh9svEJNUHlh8qzlutrAzrEifRtvwN6dKhk9qv4NWjlX0z9RO3MvZLMGJfyvzmjYXTjBGpfa/mNMB0+1jz+662FBagKAxZBWyBhe16sYqfRmYLkMMVpIZtFiHdofb3z0khTqsBizVKB5vzNhxjUxHC65Vaxpv0+1Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085477; c=relaxed/simple;
	bh=fh6ACGsq2jWcOg34hdfehZYHsAflYoTc9HYzbBomEeM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SO7wyigkEQ11K0Ap1cgIrbsBFdElNQ/zyFVKC6A5QaZucZOR9gLEx7pIIs91bfqv2Lcc7QpyYy38Wv7WDJJqjkqrX7KbnTmPRMg5aQu7bLW2yuWYjcmmAZgQ4DaLeYr9gjkQNPge7NYmDPaX9Si0fgAe2SXvfeyw4/sA1iH+k6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YP9yHSKc; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YP9yHSKc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVQFSo1e8L15PikftgmuIaO/BJGg/shE0lB4fSHdOCRYlP86ceVyery79NWYSn4a0cdI/nqA2SEPIj5tF6q3T1K4hF7WFJJxyimcdKscrGCPw1HytBeVe/45ze6bIhQpJgbZ6ft7j/HmjDQcSYAwxA9+0v6txlt7+Y2IgGHAhYIhkzuIDe4R7GziG3iOMKJsaCs+q2K/GdaaddBQC9UcmsslBJah9oQ54NlSbPzzVZ2XbSL2KyURWQYoiz1UEwbxD1YVE2rOrEXFEYhstPuO3lPjklzNwig/Mo9Z2SbjoA2STQuiu/mkAi8yALPQKBfd9Ch2rwXziwI/UtL0zD6ymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2RjgGgqroWrwpx045V4JODGWlr2RY9hV69eNT+X7oc=;
 b=bHgtOojoXLS1M2BV0xGkglBtw3zRiqjDK8XLnyRjOwFIDeivfdo12MlRap7/PqpbZ7w4dAcGcxMhtE+hVGQ4wpVxUmyMJ4/lYvBrgo9zHGg2EVXnaEZU+DZBvyvFo8nVF8tRgsvHs9+h2f+VpQzsopX5R5kAWMj8EpMqj5i0p2O37JFgbjZkLfw5cFhTCPq90FAjIA/0k3rHfXoIcE4rUuJ+NFotA6SLUfA/uPpUdkn6v/PbLAwSuZrEpJCMZCOb8vjIM6iqD/uSB91aZ3TCxG0Ii0bwD0F9816h6HwhRQj+RBUZ8ys7CBOS3zDfcpNEv2aSJQjnD34wwnRZZDNlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2RjgGgqroWrwpx045V4JODGWlr2RY9hV69eNT+X7oc=;
 b=YP9yHSKcETA/Loj6pv0h00dL6xAdM1md0bB2vwHHzS8HMTphQUIgeZ4tAa2SMaMIxavcnNY0jgr/0p6H2z2hYaDlL8H9e1fxijyKo51lodiQCdsqg62mi8pexofvW2lOXL89esB80YBsUQW3r7709v5NBehQ5tr2ART8f2oZb2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CYXPR12MB9441.namprd12.prod.outlook.com (2603:10b6:930:dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 14:51:13 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 14:51:13 +0000
Message-ID: <6a051ef6-0313-41d2-85cc-494edcdcf415@amd.com>
Date: Mon, 16 Jun 2025 09:51:08 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v6 8/8] fs/resctrl: Introduce interface to modify io_alloc
 Capacity Bit Masks
To: kernel test robot <lkp@intel.com>, corbet@lwn.net, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, hpa@zytor.com,
 akpm@linux-foundation.org, paulmck@kernel.org, rostedt@goodmis.org,
 thuth@redhat.com, ardb@kernel.org, gregkh@linuxfoundation.org,
 seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
 yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
 peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, sohil.mehta@intel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <6f8158ba0eebf41c9ec59e82dcdc28d4d3151c3b.1749677012.git.babu.moger@amd.com>
 <202506131403.MWHHLsxB-lkp@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <202506131403.MWHHLsxB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:805:de::19) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CYXPR12MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: d814c7a4-1b35-4c0f-3105-08ddace53ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czM3bktoTjl3ZWdKd0VKZzBOL2N1YTUxWm9sUVpOdlMwa3QrQnR2Yll1bEVF?=
 =?utf-8?B?TjFyUzdnR2FvNndXb1pUK2dQQlZTZjZSUUVRRi9jUGJJdHRaSjl3dHpjTndJ?=
 =?utf-8?B?L3JoaDU4cldDdVRXdVpRUlI4TnZKZEU4Ump2aEFUOFhmblozV3llMzducnZ4?=
 =?utf-8?B?cTNCbnlmcUwwanFRUDRuSEpUZThheEpON2RvTmxZazF0ZFpuM0FxZXk3ZFFi?=
 =?utf-8?B?UkxDMW5NY0lQOXlKK1JIbHBlN3BTa3lTL0lNK2JBYTV6TlhLWTVOLzRNdklM?=
 =?utf-8?B?TURLTU9sZXlvREcyLzRZNHlKR0poMkkvSlVRdndCcUVtZnlaSVpSQnlndXNX?=
 =?utf-8?B?T3pHcEYwQmZpRXRrTy8yVU9rU05JV3VrQ2NPc21QUEU3dDUvUEdLM1NsMy9V?=
 =?utf-8?B?RXZraEVuQ29iUVlkblVoNDJqRzNUV2lkVkxxNHd4QVJvbVhuTzdLMlNXNXF1?=
 =?utf-8?B?WjEvSXFyTUdUNDZqSm5TVmJURmE3Nlp2bWFLRitQTU5OZHBOZ1lNQkFNYkxC?=
 =?utf-8?B?K2ZoYlpHQy9VU2x1YnI5dUFVYXgvSTFhVG5vblkrbWExVmQ5S0FKRDFsOGlU?=
 =?utf-8?B?eW8wdkdTcmY4OWNQSE91blZMaWVPSG44Z1ZRQlpZMkxZOTh0VXMzVkpFMVFU?=
 =?utf-8?B?d3pkcDFBZUhvV3Nhc29aNEQ0cTkyK3ZEM1Z0dkNLSTJIdVVEb1l3YWx0d2ky?=
 =?utf-8?B?NURzTXVia0xaVytwL01LOWRyK1RGT0I0SXJzY1QvVncrbjdjUUJ1SGZZNUMy?=
 =?utf-8?B?Szh1ZWVQcERTUGNoREx3Yi85UTBjQkg2TWwxTWxydkp1VXR6T2thNFVsU1Vw?=
 =?utf-8?B?UTRIRjdUd0RFckNOMVorZzg4aUpBZ2huWURjdTVNWGRFZFpnN3N6eWJPRmhk?=
 =?utf-8?B?b2d4dFRFTFA3QzY1TFd1dXp5WW81YXpXaUxNSXdpRk1pdnYzQ09rOWpKcVhv?=
 =?utf-8?B?MWdmWko1REIyL2U0TDhNS054RFBrbTd4a05CZW5iOGJvbStyY0RSSW1UZnl0?=
 =?utf-8?B?M0Z2Z3ZmL1dOMlM2UXhERG1vbzBuS0hyWnA5YW9yYVpnbjdsU0tJMVNUbjcx?=
 =?utf-8?B?TGJOS3llOWdJUkZXdGlGRFZxNUJhLzVjNnZaZW4vRTBMNi9leDk5Uk1Wc21k?=
 =?utf-8?B?Qkd5Rytxam1PNzVKbTRWYis2ZHI2dFY0alpBdSsvWXNLcVFFbFBXVytkaVl2?=
 =?utf-8?B?VzVzb2lpT0Q4NUV4Vk5Na3VQNWVJUGF6T3g0cnJjWWE4SituSnFDZzRyVTJh?=
 =?utf-8?B?TGJmU3E5MlZQVjEvajhlUlNsclFzTGpjR052RjVoYjltMVlWOGgveWdsSXpK?=
 =?utf-8?B?aE5qTkI1dXJsb2xnSG1uRmdSRDh6NVlZVFRndnAxMXk5QWRYb1ZTVmI4aHpF?=
 =?utf-8?B?OHJQR0VmaHl6bDhOZkJwMXE3bEZRcjhxbEp3aHllaWhWL1BBZURIcFNvOW9t?=
 =?utf-8?B?MEZnc0dkME0yQVRtQmNFS0I4TVNKQnJ0QWJUb1pxcXlpU1FKMlIvcEQxUXVr?=
 =?utf-8?B?VXEvSlRudGJacHVzWU0xR2FDYlFPOHNBTmNYODhrQTBTWVhyNG9jNXRRSXdS?=
 =?utf-8?B?TzVTdDJIUXgza0hDSUQ3RmFjQzlTcGV3Wk1tTlpuK0lyNnlvY1RQd2wvOGpm?=
 =?utf-8?B?Rklhb2xYd0MwNnBzaTllZHVWWWE3Rm4rd29WWlI1c3hWdXMvZXRsWVl3M3lS?=
 =?utf-8?B?V1lFcU8zcVZWYWdrbXQrbm9vZHAxUDA1djFsSk5jM0kwWENaR3F3WWt6b050?=
 =?utf-8?B?OGxWMXZMMFN0NFlYMU9DUUhRZklBbGpjaUJGYmJwNzZUTjhRbUdON3RHbVV0?=
 =?utf-8?B?WHVzd2ludGpLMWtyaXVGZVVqYjY1ZVpJL3M4QzFZYmgrK0VhbzYrbWF3d3Nt?=
 =?utf-8?B?d0NIME95ZmR0T1g2RSt1RjFBdU9oaktwU2NxZlBFbnhGcGtoaFNFVkxJaDFV?=
 =?utf-8?Q?I7gftEdrUaQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGRFcklaeW1oWHNlTk1MOUJURk1PQVhZRzdXK0o1R3k4b0xEanpwT1JDTFdr?=
 =?utf-8?B?bC9aL1JQR1RvdmRwbzE1czQxQW5Ba2h5ZWFXNUQzOHE5Uzd0eVhwa08yRTNV?=
 =?utf-8?B?WlBEKzhyOWk3MlI5NnpEUUNnamZlZTNLN0JKUUY4bEZVUFRsd0xhTjlHTFdw?=
 =?utf-8?B?VG9iQldJNlJkM2lUbFRoSURoVG1DVjFFdTlwT3hNWEVrcVRvaFZ2VFpadFcw?=
 =?utf-8?B?Uy9CZ2pWSzZtdGFyNGpzUi9DSWFlYSs3YlpScExhcnZDeTVoS0g0QkdGS3FU?=
 =?utf-8?B?UXBuVGx2MVp6N2s0OEp6cVBkZkxBMm5TcE0xTmFsaHVINHpJemFoK0R4ZzdP?=
 =?utf-8?B?WDZmalVLUkJZcmE3a2Y5MzlkMkt0RWhySlAyZm8xU1QvbWM1bkFvV2dXcE9y?=
 =?utf-8?B?T01LWGhITUZKbXV2K25pR3pxYmZKWjBXTWFhZURKVzRIUzVtU0diY0k2T0Rw?=
 =?utf-8?B?VXFpOUl2N0RtYmdSd3o5OHM4dVVNTk5wc0hXZkVFZlowbFFkS2hDQTFGTlpj?=
 =?utf-8?B?b3NpZnRPMkhIRzMySXNVMGdpVGdLRXF0b3loOWdtbWJXMzd5djg3cVhENk85?=
 =?utf-8?B?Smxma28zbmkrenJyNys2UlA5bDZ0WFMvdng0REtJZFE2cllXN0E2Q3N6VXRI?=
 =?utf-8?B?eG00SEhwN1lPZk1qTllFV1hpUXAvTEg0MjBnUmVRZFJTbXUrYUM4N3Fuc1Uz?=
 =?utf-8?B?b1lXMldENUxCTzRSRXFTRDNHeXNoUk5ueFhVT0xGelVjZndpNWo1VkpybWxM?=
 =?utf-8?B?TERranFKSnYwTy8yaXVmTHNVNmxBaVVKeExYUC9LUk5MOGdOa1pHOUdSVms4?=
 =?utf-8?B?UjNGK0ZGbURpL3JKcjYxbEUvcEpUSFF6Ym9JcWRWck14ZGZBWnFzQXQ0bzI3?=
 =?utf-8?B?K3JMWlFxc2dFSFd1K2VHM2dYc1JsNENLR0FWay9samdiY05pWHNaZEVaSDVn?=
 =?utf-8?B?U3VRdXAvekluelhHMjRiazNqRXNGR1R4STh0cVFJckJPOXM5RzgrZ25kTlMz?=
 =?utf-8?B?QmdHU25FZExsMmxFSXo3TXdmajQ0YjF3QWNXRTZPQXdlbmh6MzhBcU01dG5O?=
 =?utf-8?B?MVN6QTh5VWc1bm9LdHpOR3pZY0NMbkoxMHZiVHI5YVVoR2ZOaHR3aXhxWGJQ?=
 =?utf-8?B?RUtwSkcvSmJUK0cvbkVlVjdSTlgwZ1BrbGtDbHJuN0ttVCsrMHIraTc0THFV?=
 =?utf-8?B?NGI1MXJndmNsRm5TclBSVFdaaExOZ2t1OC9tV3o0bXhmZ0RmcGpCbjNFeFcx?=
 =?utf-8?B?eVNoUlFZdkdDRGR2cjc5NXFHOXlyZC8xM2hkQjhUZ1BTSjhiY2ZZbGRnQzlh?=
 =?utf-8?B?c3lRV0ZkNHdvaWRxWVMvVE03MjBjdXp5Z1hheWg0dkYvRHdHNTh3UzVPRytQ?=
 =?utf-8?B?MytvOWwrcENKZGJEb0ZibUwyTS82eFdZbmd6Vm52RWUxV2pUQ1BwNmJNaXVW?=
 =?utf-8?B?dGcySnAvSm5sWlVLUVpmaE03ZTVYeTFQY0pMcFZzQ1Nvc1B0NEJFU1R6ZXZV?=
 =?utf-8?B?bTVYN1lqUlMvdUlSV25HSnBKTzlOcUl1eWlkU3BBSEhEbll4RkRzZWdwTGNT?=
 =?utf-8?B?Y3dvcXJlc2ZLbGhHNEt1N2w4K25GS0Q2NFN5MVZTcDRYMUdsdGxZZGwraVd1?=
 =?utf-8?B?bllzS1BUZ0QyOVhEeDJrdU1GMG8yenIyWUlzaVZ5NGZQeSs3TWllT0pjOU1h?=
 =?utf-8?B?bnZpWC81R2loeUc3dWQwL1lHWGhuMzVSQnJCKzVaT0tzbGx5VitkeG50V3J0?=
 =?utf-8?B?Wk9uaDg2ZVZYV0pURTJaODB6cUx4WVF0d3dMaXB4ZG9RMnVCWHd4ajRYQUVr?=
 =?utf-8?B?eXM5a3VUVHhybVlUazdLZ0dyMVMwSDBpZE14QVBqdU5jak9oaXlsWmczdHRk?=
 =?utf-8?B?am5DdTJzZnJySWVFNXNsbm5zUUtHcFh5dEFuRFVleUN2ZzIxTDE2T0lkNXNG?=
 =?utf-8?B?T3V6MmFYN2xLb01FejdNVGhXd2MyOTIrMkZQOXRYa0ZpQkEveXZsOUU3REZU?=
 =?utf-8?B?Q1phK28zYUltaDRyRmNTaGdnMzhGc0trNTBqZlBNRXdVVytIRzc4dFg5UStT?=
 =?utf-8?B?c3lDNDN6eVNVTUk3amtBY2tyOEh1V0RXRldHUmgrWm03SG9uVkdsNzRaSFhj?=
 =?utf-8?Q?ZeLA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d814c7a4-1b35-4c0f-3105-08ddace53ceb
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:51:13.0083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMSCs5GGfDyKt7ilxWXzeMPMANVmE6lgYyQtIooL9mJgHcFHywd7IwGiC+kIMGW7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9441



On 6/13/25 02:04, kernel test robot wrote:
> Hi Babu,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on brauner-vfs/vfs.all]
> [also build test WARNING on linus/master v6.16-rc1 next-20250612]
> [cannot apply to tip/x86/core aegl/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-L3-Smart-Data-Cache-Injection-Allocation-Enforcement/20250612-053050
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
> patch link:    https://lore.kernel.org/r/6f8158ba0eebf41c9ec59e82dcdc28d4d3151c3b.1749677012.git.babu.moger%40amd.com
> patch subject: [PATCH v6 8/8] fs/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks> config: x86_64-randconfig-r071-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131403.MWHHLsxB-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506131403.MWHHLsxB-lkp@intel.com/
> 
> New smatch warnings:
> fs/resctrl/rdtgroup.c:2105 resctrl_io_alloc_cbm_write() warn: unsigned 'io_alloc_closid' is never less than zero.
> fs/resctrl/rdtgroup.c:2105 resctrl_io_alloc_cbm_write() warn: error code type promoted to positive: 'io_alloc_closid'
> 
> Old smatch warnings:
> fs/resctrl/rdtgroup.c:1961 resctrl_io_alloc_write() warn: unsigned 'io_alloc_closid' is never less than zero.
> fs/resctrl/rdtgroup.c:1961 resctrl_io_alloc_write() warn: error code type promoted to positive: 'io_alloc_closid'
> fs/resctrl/rdtgroup.c:2026 resctrl_io_alloc_cbm_show() warn: unsigned 'io_alloc_closid' is never less than zero.
> fs/resctrl/rdtgroup.c:2026 resctrl_io_alloc_cbm_show() warn: error code type promoted to positive: 'io_alloc_closid'
> 
> vim +/io_alloc_closid +2105 fs/resctrl/rdtgroup.c
> 
>   2072	
>   2073	static ssize_t resctrl_io_alloc_cbm_write(struct kernfs_open_file *of,
>   2074						  char *buf, size_t nbytes, loff_t off)
>   2075	{
>   2076		struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
>   2077		struct rdt_resource *r = s->res;
>   2078		u32 io_alloc_closid;
>   2079		int ret = 0;
>   2080	
>   2081		/* Valid input requires a trailing newline */
>   2082		if (nbytes == 0 || buf[nbytes - 1] != '\n')
>   2083			return -EINVAL;
>   2084	
>   2085		buf[nbytes - 1] = '\0';
>   2086	
>   2087		if (!r->cache.io_alloc_capable) {
>   2088			rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
>   2089			return -EINVAL;
>   2090		}
>   2091	
>   2092		cpus_read_lock();
>   2093		mutex_lock(&rdtgroup_mutex);
>   2094	
>   2095		rdt_last_cmd_clear();
>   2096		rdt_staged_configs_clear();
>   2097	
>   2098		if (!resctrl_arch_get_io_alloc_enabled(r)) {
>   2099			rdt_last_cmd_puts("io_alloc feature is not enabled\n");
>   2100			ret = -EINVAL;
>   2101			goto cbm_write_out;
>   2102		}
>   2103	
>   2104		io_alloc_closid = resctrl_io_alloc_closid_get(r);
>> 2105		if (io_alloc_closid < 0) {
>   2106			rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");

Thanks. Will fix it in next revision.

-- 
Thanks
Babu Moger
