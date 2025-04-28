Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B19A60B8A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863839; cv=fail; b=UvLsIDDWsDvFdbgQliTV63UDXWv1oAJj0PY5G7ePFpE7H2tZbF3ZzAi6pOTrxOnjkiLe4f8Fv2HQXeOvW2DjXy/Swq+7D6NDOtg9gbkEOl0mta95FUIl+dnlSCMXCgGtXx3wbo/7O/vXbAHT8cclJMEibsm9nXeNGtOTgsZBxBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863839; c=relaxed/simple;
	bh=9KfbGoba83iyRlKfxSprdXhRAd57oRV6EDagVVvgLwc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qi+gGcu0qFBFMAo3jaUdWcK2TAEXEofj5omwPPUaHwzhIYEKaZCKF+dsI1CZOCc4rwe3NAHp6AGjKOtzCqgc2R/XhS79j6EaV/QPuka1wLuuTuMwL9+XJj1adqfYC3GazpnDt151V2s2aewztEpqqkKG4aDZhx1IVHB65Pr9dx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O6fIv+p7; arc=fail smtp.client-ip=40.107.220.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O6fIv+p7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnmSJ2w0/MFokNoN72bHmsIjTJ9ktxQM1CzzfYqyJg5G6YHJvpCSCmJNhSSns0XsE5oDvL3qJAvb6Dt5/jWhU8lx1quHoHAO1AoGROHInnjQEsHf4DKnSrHDWBfQUPi8aVuRIS16kcxg2oYQMFYANDvY7i1EaxDUg2u9bW39GZ+eBDFO2bEroej311asROi8YfZrilzfQ8UgSrKMNK7eCEahMeRX04Uu8fg+jdhz/q8rF9piM80zTL6pfUhdEhYV/RyuseYVd8paKTHozJni/Vy1hgTSuql6sCjs5LMYAAtxwPOhWdhn0VgcASizu6x8C5Kf5kc+VuNYk2knXFQRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UFvY7kRi9iwsKifpvxbVJeoSTSrblHgMC/coHkKpZ4=;
 b=Hlhkma6+XsuoyfLwos7FK7gfw/RtvabJZV3lmaZgMvulQU8HOn7GqFiaB2jOY2CNQVfUf81vnsCqYj+coPVT83GB2GDq0O+Z/1OwHmTesT/UjJoMZsT+cetX2PknZ2UuKU2fz6JAWoSbd9lEu/R5xhuMnUbuuQyuEI0pHImUq0x8YJDyT52S//PGLLgiNLCRF/N2RwXGjnG8iLl6jxLl7NqFs+SZ9Req0yJDki63TQXP3S84jZtQt06W7wskwbUCSRPCxX66z88ilLz0BEdwFTpVRnY9EzpnQ1VgBc7hahw3s19/hrAda1iAXBf2RpY1TKzZxgvIPkP0Lv8MVXwjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UFvY7kRi9iwsKifpvxbVJeoSTSrblHgMC/coHkKpZ4=;
 b=O6fIv+p74+ZjP/U3KthIqH68/fFaVOYw0kLwQMq4LXDNlT3jqWYWqAb9Dpabw3P0A620m+K9M4eiXoGGNw8YpI+fVofK7JOJSuKlfX4eOh+qV1i7FbYn47F1N9vH2t6/XOzIhwAXS9mdBQVN9GyYMjKJA4u4/IUSQIF61qlMwxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by PH7PR12MB8123.namprd12.prod.outlook.com (2603:10b6:510:2bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 18:10:34 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 18:10:34 +0000
Message-ID: <64c04e6c-43b1-996b-f83d-5fb1751debaa@amd.com>
Date: Mon, 28 Apr 2025 13:10:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: SNP guest crash in memblock with unaccepted memory
To: David Hildenbrand <david@redhat.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mel Gorman <mgorman@techsingularity.net>,
 "Kalra, Ashish" <ashish.kalra@amd.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>
References: <f12f5bd0-135b-91fd-9703-7df98500f9c5@amd.com>
 <b037ffeb-bfeb-41a6-b200-d8c57076370f@redhat.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <b037ffeb-bfeb-41a6-b200-d8c57076370f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:806:f2::33) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|PH7PR12MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba982fd-b1a9-43a2-1984-08dd867ff823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjlMY1B5VTZoNWFvMVVzTE5JWFV4MUUxQnQwZXpyTE9hU1NqUERYdk1CUXJL?=
 =?utf-8?B?QzFuVkZoVDBWZGN3akxVdFpicVZLTDl0cytiemUvTW5QY0hDSDRZUHNDMEg1?=
 =?utf-8?B?aG52aXI5U25yL1EvWlNVaFB4SnFkYW5wOUhLaE94aUZoMEFTZ0ZxMWlad25G?=
 =?utf-8?B?Um8xdVRWZ3AwcTkrQXVqZ2VQM1NnTVdMREo2c0JIcC9MYkpTOXZFK2xGRVlT?=
 =?utf-8?B?YWRzQndhYXJ3YSttS1RqK2VQb3kraExxUDk1VmwwV2ZvRHZtRmVCSUNvdnRT?=
 =?utf-8?B?NEwzWStBMEVuYmpNZHVTcVZYRUJ6QzkzcEZhOXBHU3NQN2l6cDl4K0FJQlJG?=
 =?utf-8?B?VTR1ZGFVc2tCMElFQWJSZzI3UjFHRWs1c1JHZ2U0WllNSHB0ZWRWVVNQdWd3?=
 =?utf-8?B?aldPOEdQMFcxemFZRHFWNk9OelF3RGJGYWkrUXlpUXUwMDhRSXp1R3hGODM1?=
 =?utf-8?B?Z2VheGEwZHdLN1d0Y0JBQkxITm95R3M0cFc2YzFzdklRK1JCS3VSZjlXa3VY?=
 =?utf-8?B?VkhsbEFacVhiVVFsTmVsTHdMdXZ4UnFHenBMMEx3VVFlS3JodjRGQnBBdmw2?=
 =?utf-8?B?K25hMWYwalFUdThiWWpDcGdmcUJiOXBEMzhqOFM0NVdobTZBM3lYTUIrbUxy?=
 =?utf-8?B?d3RHRVJXbk5PNzA5dW4razgvNnNzVGdQdWlEdHhPOFBzTmlaeVNoVkliSG0w?=
 =?utf-8?B?MmZwUXRTZ1ltOTNvNEJjWk41d0lPNUp2OXhvT3dYVzkzeE91akJLblV6Z1NX?=
 =?utf-8?B?NjQzQW5UN0YzVlM5S0o0UG5pSUl5a0EzWmhMVE4wWXdhazdCZEZVN1NyYlNM?=
 =?utf-8?B?Nlh6bnk2MnFWQWdMVTVqU2tLVmZ1QzdUQWswWU9POFVzRHpHdUZ2K0YzQ0Vj?=
 =?utf-8?B?Q0pzcGlHaUtyYWNGb29LVGIyMklWTDBkb1hQQ1BRZ2Q5MlRDOUlIZUR2eTlt?=
 =?utf-8?B?cW80akh1bzUvdG9kYUpsNXUyZnAxVHhFOVNZWitZNkRESlpBeHh5N2YwUlFF?=
 =?utf-8?B?VUdNRkJHRThleVczVEhJdDZFR2REdENXK3J3dTE2bnIrNFByVTk5dDBKd0Np?=
 =?utf-8?B?MzdQTlJnODJKWWlCOTIrd3RvaVVFTktsR0t0Vi8veUxJV1NRY01PUDA2My9u?=
 =?utf-8?B?b00zOGVrVVB1ZTlqRnNlaGRtOGtlc29KSnB2YUp1YWxSYzZYYkplWTJOUzFM?=
 =?utf-8?B?MS8yMFczREZvNzdNQzBCK2crbWFObnZqdjZYdUpybXc4bU9CVUNoU29iYzR4?=
 =?utf-8?B?YzRhaGpRMWIyVG1CM2VoMWU1RXJjU211bEtNR2NWczBWT29jS0lEb3laR3Za?=
 =?utf-8?B?ejlkakV3QkJNWUFRLzBKS0QwU2xzcG9TQ0s2RlBQVWhNVGV2RkhGNlp3dmsv?=
 =?utf-8?B?S0FSa01FaGZyTFJCN0xGNkw2c1JCS3hITmxsWDdZYnFpTFZHRFlvUmtNSzh2?=
 =?utf-8?B?d0hsNmtJUzc5dU5SbzBGODlkc0I3bzhCWGtZL2R1VUZvdFlXemVldlA1M0Vy?=
 =?utf-8?B?em5kcDNnVmszckUwM2ltUUV4WlZKN3VRMXpuY0E2V3RyWHJyYnJBb0pFM3Ex?=
 =?utf-8?B?M0t4SjFPY0hkbmduSzMvQU84OVhsSFVGeUxQVlU4bmViZVBaTmdoYnVSaUhE?=
 =?utf-8?B?OUwrbXZYSVBqSktiT0QrUFJvM2JpbnYxSHM5K25USlljRU9IcmJtOUZlY1l2?=
 =?utf-8?B?Q0gxMWY0d29jbzNmWUhQOHVraXZ1OGJCWExlMzhmL0pzdnh6ZVdGZHVWMjdq?=
 =?utf-8?B?cmlHNmRLK3JaV0crNWNUYk80amtnQ0dwalJhMDFtdVROYmpDNEMwVnl0Vy9i?=
 =?utf-8?B?aUNPWmpCT0dtczE3dkZPdEVzbzFTb29kYTV2emV2b2R2c0hzb3JvNE5OR0or?=
 =?utf-8?B?SXN1b0NySHBLc0xsV0N0dWVyalBWZk1OTE44RDQ3cjVDVmNiTzRpTWVtZFpj?=
 =?utf-8?Q?kiPhVxqKZOU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmFFbmFHQ2NmK3pQNHpBRENCalBZV1NxUTdtR0FJUndEbWJoRjZSOFhOQTcw?=
 =?utf-8?B?Y0IrVjVHRHlmOTlabWljaXRsSnFrbDIwZ2F3SnU3ampoTUlONXI5VWJ1SnhJ?=
 =?utf-8?B?QVVtRTRBakpJb2JkL1VScHJlaWFuWTNnVncySzhDdjZtaFQ1N3Y3OWc4QUI5?=
 =?utf-8?B?djZlRUVUelkwYUYrZXpETFdnbmIxUjVIZlpncFlNcFovNXdFNzZ0UWE1QjdZ?=
 =?utf-8?B?aWtKWXlYbVBOR0xQWTBJd3F4RmVSV3VGbWEyNnJqZTZkNlpDZHdLTDhXb0NX?=
 =?utf-8?B?T0pQYWxzSCtWdGFENzloZ25zdzJMaTB4RjVzMVgydEM3MzducGVUOWhvWXE0?=
 =?utf-8?B?QTRJRTZpeXJqeTZhNnpIMEtTbEdvZEZCZElrSG5iK1dnRGZ0eHAwV0RXZEsx?=
 =?utf-8?B?WjlERlBGaVVydU9sRWZtZlZnUExaaWZmK0xCTEM3ejZhazUraXEzM0tIMnJK?=
 =?utf-8?B?VThoQkd5RVh5d0lGSzdOcElZVFBFLzZzZEd4NXhjdTVIMG12LzV3WTVDWE9m?=
 =?utf-8?B?U0oyS0xiKy9BL25SSGhocE9jSGs2TXN5eFVJMnBHc2Jqd0JVeUV6cE9JMUNZ?=
 =?utf-8?B?aVhhUFB5Y21XM3JCTUpYNlRkNTBaWHp3Mk5qdkpaMWI1eC9kMjY4T2dFVndk?=
 =?utf-8?B?QkR0MitleWJCV3dJRExqWDZkK25zOFMxWGs0cGVUVkNHT1YreE1CakVMS0VP?=
 =?utf-8?B?dGR5WGVHYm5HaWc4aDFCd0NxaTF5MmdxVGpOWnRqQVorVFQwZ0YwYkUrVDJa?=
 =?utf-8?B?ZmpvM3VPVzViY0s3TnZsakRLSmU5R0ZFUktFMGVLR1g4R2JSajdKQnpqTXlv?=
 =?utf-8?B?ci91YzlwQlFESHFMQnNScVBVbXBiZ3FmMEtZUFJia3BEbXViYzZUTGNZQWda?=
 =?utf-8?B?TzVaUlIrdjg3QkRmK0VwK2R1WHVPTThvR3FkcUhHaXp4d0ZFcUlTUjZkTTJS?=
 =?utf-8?B?dnBuRkR6K0Z5Z0xTdERFVEF2ZmtsMHd6VC9OQWdOOW8vQk1TVURZaGVrZHVT?=
 =?utf-8?B?Z01BZnE1dXJXbzRjWkhJdWRSTTlJVWtXSGZLNElCZlZZK1BIV2pzdkFBRGxT?=
 =?utf-8?B?WEJHM1NEK0RSSEZnSytzaDRETW5mTHAzYTA3OEJhRWtKSmdDUmFGY3VjK1U5?=
 =?utf-8?B?S2VCMUNFZXB2czI4VGZYaDludExLQTd5QTZ0RjlYb1ZJQzNYVVBTc1laSFJP?=
 =?utf-8?B?OFpoK3hGQ3V5QjF2UmNzNUc4MXBhd2kvajFHUjJidStNYndsMnVxekVqdmY0?=
 =?utf-8?B?SnNBUXJycU1aTWtJNGRVK0Nwc01GekF6YUtpTFlFR1YyNnJQb1oyY1hoS0ZH?=
 =?utf-8?B?UGVRRjltQ2xacHJPa0FTdUZTdG1TTnNkZjVyT251ZTRkajBWTmFVcSs1cjJS?=
 =?utf-8?B?SWFPVkFoc1E2aDVHYlZvNDhkdk03MDdnQitEb1JBSFI1UHZlY0NBaDlSRGxh?=
 =?utf-8?B?ZDRhTkdwUDkvbTZxVUsreXpWTFgyYklyMmIvTGxoN0tUODZIU096REQzaXE3?=
 =?utf-8?B?bGdJU05WWFVEOXd3dUFTTlVCb1p0S0FKRFVOYUt4QlpmRVdOakF6aW1BLzVD?=
 =?utf-8?B?NUZCTUFPa3VjMTZ5RDh2RHJCb2FnSTNJOHlUMDhtZkNBK29vcDd1SkhqcGc1?=
 =?utf-8?B?UGUydXZQbXM2cFJQUG9uQXVvQXB6TFNiK0xFTFNSU2ZCT1lQZGxGL2xHTUlK?=
 =?utf-8?B?WXRyZlJ5TVpGam1KNE5iQnh1RDhndkRPYldZNlEwQXpBVk00bWtWbGY4d3hX?=
 =?utf-8?B?U1l1K1loUWpTYWw3ZDVRaVFFYmZlM2dFT3ZrTllxVmd4Wk0wREFsdkhrN3ht?=
 =?utf-8?B?R1dxaDl3elo1bnVGYUlOb2QvZ0VSYWJKL2diRUsvV3dia1YxeVhnYjFYNkN3?=
 =?utf-8?B?bXNwKzZ2U2hXYmNqT0FudytVS2tMZTdaN2ZNSzFDKy81RW4vTjVHTkwyMlZk?=
 =?utf-8?B?QzdaWGZEZ0liVUkwWWwwTGxaUjcweWp5VUNXK2tLOHRQcVFIR3E0WHowUTM1?=
 =?utf-8?B?Z1lINVRVZlJmcSs5dE4weFhhNThadFdXT3RjZTJoempmdUcxTTdEanRxbW05?=
 =?utf-8?B?S3YrNjZKdzB4R1FHWWh0UFV4U2ZCOExKNzIxR0hGRStFQTF3eW84K0hvNXhZ?=
 =?utf-8?Q?QeoBhrxlunz4jc/IcRky7SHXj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba982fd-b1a9-43a2-1984-08dd867ff823
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:10:34.0582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glonFAzF3Pn5na21Gj+9Tnqw4q8e3LxrxIxOBz9vl4zQYOOwNJsFzFUq0rWxe+QoxpSHqQJzqOKS/XBBvWeh6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8123

On 4/28/25 09:04, David Hildenbrand wrote:
> On 27.04.25 17:01, Tom Lendacky wrote:
>> Hi Kirill,
>>
>> Every now and then I experience an SNP guest boot failure for accessing
>> memory that hasn't been accepted. I managed to get a back trace:
>>
>>    RIP: 0010:memcpy_orig+0x68/0x130
>>    Code: ...
>>    RSP: 0000:ffffffff9cc03ce8 EFLAGS: 00010006
>>    RAX: ff11001ff83e5000 RBX: 0000000000000000 RCX: fffffffffffff000
>>    RDX: 0000000000000bc0 RSI: ffffffff9dba8860 RDI: ff11001ff83e5c00
>>    RBP: 0000000000002000 R08: 0000000000000000 R09: 0000000000002000
>>    R10: 000000207fffe000 R11: 0000040000000000 R12: ffffffff9d06ef78
>>    R13: ff11001ff83e5000 R14: ffffffff9dba7c60 R15: 0000000000000c00
>>    memblock_double_array+0xff/0x310
>>    memblock_add_range+0x1fb/0x2f0
>>    memblock_reserve+0x4f/0xa0
>>    memblock_alloc_range_nid+0xac/0x130
>>    memblock_alloc_internal+0x53/0xc0
>>    memblock_alloc_try_nid+0x3d/0xa0
>>    swiotlb_init_remap+0x149/0x2f0
>>    mem_init+0xb/0xb0
>>    mm_core_init+0x8f/0x350
>>    start_kernel+0x17e/0x5d0
>>    x86_64_start_reservations+0x14/0x30
>>    x86_64_start_kernel+0x92/0xa0
>>    secondary_startup_64_no_verify+0x194/0x19b
>>
>> I don't know a lot about memblock, but it appears that it needs to
>> allocate more memory for it's regions array and returns a range of memory
>> that hasn't been accepted. When the memcpy() runs, the SNP guest gets a
>> #VC 0x404 because of this.
>>
>> Do you think it is as simple as calling accept_memory() on the memory
>> range returned from memblock_find_in_range() in memblock_double_array()?
> 
> (not Kirill, but replying :) )
> 
> Yeah, we seem to be effectively allocating memory from memblock ("from
> ourselves") without considering that memory must be accepted first.
> 
> accept_memory() on the new memory (in case of !slab) should be the right
> thing to do.

Thanks, David. Let me add a call in for accept_memory in the !slab case
and see if that resolves it. May take a bit to repro, but should find
out eventually.

I'll submit a patch once I verify.

Thanks,
Tom

> 
