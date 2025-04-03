Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2073.outbound.protection.outlook.com [40.107.212.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A72D1A01B0;
	Thu,  3 Apr 2025 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669485; cv=fail; b=Y6MFMbMlUMi84FljKPNDYDOQCK6BrIMABn3Ezs4y6DJZ1nzPTlDBbDXhu+TbhRbvwvf4wXdCfRKBhvh47NThZnqgO3mD/euw9MbzDszWLlZXkvKbW77RAJQDHUbL0R5ppl7edfpVyzniPF4u6600N2khWjZBnjkL6utTRCfcl9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669485; c=relaxed/simple;
	bh=4K0XeEyYL+qNh8xXvL01ICEgRTM+UDcF+bQaEblZC+s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cl04CQHVVuOk3wtGikYaJB75pu+s0ELd1BH3WbDdy3PhMsPRgXE2PiZr7V6gFee6GHticabdwCE+O1YTXJubKSHVxsQ/GgE1yUXThV68UDlIAVedZbFTkmOj9GMkySqHgH6xv1Qs4eNAZ6NQ8ut9dx1dc8J5ujESdcTE2PC30E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KqhqxJoS; arc=fail smtp.client-ip=40.107.212.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KqhqxJoS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDYbWMRczAmmwdeEiD3c9kPiPxFdwp836nFiufyihCsp+muRTWIJ+xsOA1Pdeca4iwucN8JPvus1yXR2XSeveIzAOzijqtoIkluq9IJ5N0+yCsD2BBAuOyaLvHmkPQ1rzpvJfXz/9VMBXYKvWqblY1KedP7IKc0sd8YjPcZwuMxUjWVDgeKi36eYCKSuJNKgEpAOA2i9rcp6SSnpCDvqRzWGDc2XkFe73hl8O2zTKqXWSNqCiPHs0aDaRZaZ0FeTvphhFVxu3ljJnfKZomlGrSkfM2kb7xWs1uecPSQIphQXvZbFEGh+I477nlRt5J6p7vnurJzyCGdIZ8GPxb9Ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dfx+Ii4EG7pr0h3+01VJsuK+eW8OTmP9rClx8+cScOU=;
 b=gEukvWCw5x6ANHl9P+nFzKvxFhPKTM+HMWUMtLlU8Ztrh8dfGFPxHqP9U4dH7RRegrJPfUxqf1Vfj5UnivP4l4qRZJw91uvEkJmk7O/rQ7qgmdUM83x2NOBt201UMahagI2AMb1y6W6okp6IuC/2V5xzAAEzEiIBqFKReHDKjBtNuFUOH1+LvytzP1Mot/8cCPKptYrz+IC2T17Ipe9h6T0YWNP4n/xG6bev0+5Rl2vSoYLVnrU7lSyJY9LfkraLTv6fOWMq16/Yu0ky4HUifEXKKnVe4s2xelNIE+cOxBP0/TNZ381sAqJg5frg9JuOzu6yHDfdGdxaxFbwRhou+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dfx+Ii4EG7pr0h3+01VJsuK+eW8OTmP9rClx8+cScOU=;
 b=KqhqxJoSpkZUQZlAt/X0lNN1XTJYG6qyfAaUVf9GvekX44JDXNt2A1vqDXX50ftynmTA6df52Lw1VyswGD5psCx9JrR0w5O5EmUAY6RdjXBvdTcaPPAVmXbQI+8Bv7g3Us93K/pH05Dd5gVQSg3qk4vW/qgS7xfgBJPdWUIOgV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 08:38:01 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 08:38:01 +0000
Message-ID: <8bf37fba-8c7e-4b9f-9864-4ca2a6c5c657@amd.com>
Date: Thu, 3 Apr 2025 16:37:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] transport-pci: Add SWIOTLB bounce buffer
 capability
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev,
 hch@infradead.org, Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?J=C3=B6rg_Roedel?=
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, graf@amazon.de
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-4-dwmw2@infradead.org>
 <20250403032152-mutt-send-email-mst@kernel.org>
 <9635c502-3635-4875-ae1f-53b4b7aed855@amd.com>
 <20250403033718-mutt-send-email-mst@kernel.org>
 <d151e78f-aed2-49c7-8f59-abb23db4cbf4@amd.com>
 <20250403041519-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20250403041519-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d87edd-78ce-409b-fa9b-08dd728ad7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWJOeG1vSGIrTlBYb2hZQXBBVWlndVloaXZKNTF6NnZqRlEzb1ZJZlFlSHBM?=
 =?utf-8?B?YkdsRHgzVkM3OXFnSWE3TVdYaWdxVk9jNVd5bHQ4TWRGY0ZJSHhqOHBLOFZB?=
 =?utf-8?B?cGRqci8wSnJTdEtmWERxU3d1K1lZUzd1M3hEc1E2dGE1QmpwYlcyVmxTbm5t?=
 =?utf-8?B?UGx4ZTRzQnliZ0VpVG5zSkw3LzB3dFIrdG9tZmJYYTNiVEZsbm0wS0h3SUZF?=
 =?utf-8?B?NGl4UU5WWktvQzZUL0hYaDArQ1JHblZYVUVCWDc3UHd3TU10eHhRZlVqby9F?=
 =?utf-8?B?T0xUNUI3cGZ0eGFOajFoVWNQbHFLUDk3OXprTjdMNWNCOXZZME1EUTlMa0JK?=
 =?utf-8?B?UGYwWEdNcWlUMCt5K2RKZHNJVFAwRDlWRTdXSHo3Qk05ODFuamZZckJQdHBt?=
 =?utf-8?B?Q2daTkFWWjFvNTdVd1crTzZ5OG5mdmxoVWhPdHdrdE5WRXRqOVZYdERiUTRK?=
 =?utf-8?B?RHlaMWFubTRGMVR5QVd1bFVLQS8zMm1keU1hRy9HbzhDcENHWXVtOFl2bFQz?=
 =?utf-8?B?V2xQZGtkNUJHTGtkTlRxaTlCS1VzVm53azNHalZMSlVLeklkeU0xUmRaejNK?=
 =?utf-8?B?SGs1RURYUGRHL1VycHRqc2JkNmszNGtGTmNjZmFDa3htbkFJYWxobzJjdzNv?=
 =?utf-8?B?d2gwQ3U0U1hiekRsMllhZVpEUEowOHJZOWl2VE4vc1dCQTRUMXlvRkNack15?=
 =?utf-8?B?TmdlaWlnR3M1MEVNQlFTbENqb3RhdnZsQ1ArOUtIUGtYNUtIT3ZxTzg5Umpm?=
 =?utf-8?B?MktIcHBEWnE2NytUcWpqeVhvbzNEREFpcXVvZnliL2xnNFVDV2xsZUhlQU1q?=
 =?utf-8?B?VkQ2Q1l2NCt2MThhem9CTXpUWTg2bDJienpKaURpRlpiR2NHRXhLdGFmemsr?=
 =?utf-8?B?ZGVYblJEdGU0NHpTVUQwMm1INHM2dHA0OEpLa3Y0Sk1jeDB6VmZxbnRCNmt5?=
 =?utf-8?B?ZWcwN3R0dWpYQWdJbS8wOU1iSGJqQS90MlpUKzJhbFhvTDY0RW9QWmxCaEQz?=
 =?utf-8?B?cnVWdk9SRTFFRzd1WUhpY25OMVc3NDFFeThBMzRubWxHa1Y4dTZSbWV0alRs?=
 =?utf-8?B?N2VCOHBQdUFSN2psSjU5RTZIRlF2WHJxKzVtYnE1OVJwQ0dJK3JudXF5RExF?=
 =?utf-8?B?R0ZyaDBzMDBrUHVROWJNOHFKaXI5MGNRL1lFVjEwNVlJMzhYTTZtVVBnYXl2?=
 =?utf-8?B?V2xiTGhsenBrSjZMaERJeHdTbS9UR21telV4Q3BUd1Z2dEZieVF1QVNlckI4?=
 =?utf-8?B?UXpxeVExbnhyTWtJRVRwNVpDdWR3NjlNY05obDFzNUhwRm5DaVZERHhkYzhO?=
 =?utf-8?B?ZCt4Y1pzSWc0ekR0YlZUSys1bzhBakhNL2cwVmtEc1ZOdjZramJsN3d5ajNH?=
 =?utf-8?B?MmU2K3ZaUXFNS1VwTHVFZ0poNmVMMjMwNUhsRndDN3dlMGlWWlJBSWNQb3Rn?=
 =?utf-8?B?U2NOSzVVeTUrMllGc1J5S3BYY3o1RHNJcGNId2lROU1iUEoxbGVXcklCUjZ0?=
 =?utf-8?B?djY2S3l3NmMvUUVjMGpSdnNDUEtMV1U1amtSTEx0RlA3bWVlVitkU2dSZDVY?=
 =?utf-8?B?aTNWTEJtMEMzd01DN2kyb2VkZTRHOC96VEJhRjk2Y1FrbGNCbWw4K2Zac244?=
 =?utf-8?B?ZzVVUnRRQU1Xa3lLZDAwNFZjMGpkKzFKUkluNXhqdlk1NHRENWk4NHplVUdv?=
 =?utf-8?B?OXZPM2N2Zjh5Qk9JYWdkUzZ3OHBxc252MmR1TUc5dXdHTGlFcFpZTG8vS2Vy?=
 =?utf-8?B?d1dzRkRML21QUWNad3dteDZCSmE5MTFaeTdBZ1RCWHdhSE1EVEtOaGdkVzE0?=
 =?utf-8?B?YXJIMnAyS2ovYlNoOGNCMTZkV1RoVStVRDZOV1Qrcnk0VXd2T09JQno2SG9i?=
 =?utf-8?Q?UkS0P0f5cRESb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTdNZDhFbGpwa1ByN3FyNFlvdHJxeUc1QXRyMmwxTko3VXNoekJJNm9vbFc4?=
 =?utf-8?B?UW9pdXlWOUh2MUY2RWtnazlRSjZDb1FXRzU5ZFlTdUhiTXgwcERKdTdLY0x4?=
 =?utf-8?B?MW9vVkJmTHhmRVFHeUlGUUdoTUpJS29HZzRjZHhuVTlGTGs5a1JDOUZvL3Fy?=
 =?utf-8?B?S01FVzlJMlZXTGsvNytEelV0R2lMdnI4ektJWlRsaGNHVGJxcmhSSVo0bm1i?=
 =?utf-8?B?ZWpnMFc2eUI1cXJrQ01KQjRPSVBrQTZadEp5Umg5UzIzNXF5YUJIdktDUHh1?=
 =?utf-8?B?YXpXRU9IRE1iV0lSeXZISVZSS2ExNEdzVktNUlVzMFc0cnYrdUJOL1FtK3BZ?=
 =?utf-8?B?WjY1aEdOcWxydnZXS1QrNm12ZG5xbHZlNlBCc3NMQjRmMEdJOWZjMEwyZjRj?=
 =?utf-8?B?OUQzZ0FKNXQ2eE43STdrV0dnY3VTcitYYlZNcjVWVVJhV25RZWhOQXZlSENW?=
 =?utf-8?B?ejFJc3Ivb28yR1R4SFhWTFd1N1JmT3RYcXJ2Smg0S2JKTHFveTRSWERSb0Fz?=
 =?utf-8?B?RzhuangxN24xcHNrOFBFNkFXMDFxVUpmRnVwSCtKOVNYUlNialBxRFMyeVNZ?=
 =?utf-8?B?MldkQ0E4QVJQNlRTRGdWYzZ2cEp2SkdxenF5MFo0RDVObDBRY0p2Q3o1aGxY?=
 =?utf-8?B?QS9veWdFV3RiYjhxS1JuVzN2UHJRUmdZNmd1T0gyVXdlMENBc2JSaXYyRU91?=
 =?utf-8?B?bmVxaWFKUG5NSlhTV1JrWG5NcnJ1UXJYM3h1R2RGbW9zYnVEVlZSMDdFV3Yr?=
 =?utf-8?B?SzZwSDFFbm00THZDZlZVUDJSRzdOVXBhdEo0RGRVL3lLOEZFQm5CRGhaVFha?=
 =?utf-8?B?NDBrL01Mc21hZWFZbURPS3czQW1BWkQ5M0RrQURYdG5qNEo5VEtjNW1YanZY?=
 =?utf-8?B?M3lZTS9XVkpCcFQwUUtibkFVT1BrNGR6ZjNmcG91Vm1VWmxUSXZta2lhMWgv?=
 =?utf-8?B?Y1c4d3hBbXJBK2N5QVhaQWUrWDVwbzlUWkZIVHlOUUhYZURPNm5uTW9nRUtm?=
 =?utf-8?B?MkpzTDQ0eE03cURhYWxxZDlodFhxSGt4WVhhS2hOMEZZQ0RqYUl0UGxVZElN?=
 =?utf-8?B?c05FdVduTTNSc2U1SVhESGNXUWVrditIdGR4TlhaLzRWVklqcXhXL3ZsTUh2?=
 =?utf-8?B?OVZ6S2M0SU1mWThmYWVraWFhR2VkbnVVODcxK3hJQ3NBOTZZdTNxcmJ5YnJF?=
 =?utf-8?B?QU9qMEIvRTY3Q1VnbkZWT01naGxGSnlkMHRUZmdDeGlaL0lUWE85cFoyL2JE?=
 =?utf-8?B?alBMQWtNZUVvejdGMXc3ZStCTy9icVRLVkxTU0dDdFhXa0Y0emwwVkpvbUk4?=
 =?utf-8?B?Q2Z3VkMrN0w3Z1lSeE5BOHBLc2ZqUlJZaldCVHMzMCtwZEtNZXU0YWJEMC9F?=
 =?utf-8?B?cjhxWVBUV0hyYlhZaXllSXRCM1Y0YUdwQ1VhbG4rUjNlMGJzODVXNVFhZVZH?=
 =?utf-8?B?US9WUW1uUUUvV3BKZ2pKTHoyQWNMMHErV1hvUXFDOGZkbUQ2MFBhRDRtKzZh?=
 =?utf-8?B?dVR6UUNKUnNFYlNZWU9VZGFoV1M4enZDbjdzSzhRK2dYbTVwU21GN2NUKzZ5?=
 =?utf-8?B?U1ZnY3V4T1BFVExvMDlUcUk3TzZVc285aTNLdTU5aXJEZDdOY01SOVdpcVhy?=
 =?utf-8?B?R2JjZktNUEZQckd6bytCbnRIZlZUWW1mYmdCU292TGNZQmlnOGRiWjAvQlhs?=
 =?utf-8?B?dEZNV1QvWXpmWVZldC9XcDNPOVpaMzVmay81c2lPWnRHT0toK0E3djcxQ1hU?=
 =?utf-8?B?MGdNOUlFNWt4VUJnbE13d1RhdlNNanZEQk9PMkYrYU9HTmxtM3Y4K2NzQlBF?=
 =?utf-8?B?akJjZTR6U3Y5QmFTcmdKYU5nb0EvV3ovVmN6OUZGRk50QmJRYXhHWCtBRXAx?=
 =?utf-8?B?ckd3VWtvMEFnVWZXcm52S0dQbzBTcmFlME84S0J5ck1qK3VOektuNDFwUXVh?=
 =?utf-8?B?V25LYmVjK0cwVmZrM3pTRWorRGdGY3d6Vmx0VEFPT2VMdVFlNjdzenQvM0V2?=
 =?utf-8?B?N3Q4cHorN2RvRDdJRC90WEVoQjBmbTFROHB1UVF1a1NVWFV1My9tdmprR1pE?=
 =?utf-8?B?OGQxUjU3a3FnU0pVbHJjYmYvNkMvaDJSdXp2aEFwLzFFdVFFcHdyNEU3MC9Q?=
 =?utf-8?Q?va5CT6tNQm9+MhlKDCfK5Vxr/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d87edd-78ce-409b-fa9b-08dd728ad7d6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:38:01.1444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjFmR2bvqo8PpQnCHr4aC3YLEEhQSBBEQbLHEIBiIj2UtjidwV2JWQSDGDBHwee/HtCKm/GtfjE0Bv1/fPYYGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268

On 4/3/2025 4:16 PM, Michael S. Tsirkin wrote:
> On Thu, Apr 03, 2025 at 04:12:20PM +0800, Zhu Lingshan wrote:
>> On 4/3/2025 3:37 PM, Michael S. Tsirkin wrote:
>>> On Thu, Apr 03, 2025 at 03:36:04PM +0800, Zhu Lingshan wrote:
>>>> On 4/3/2025 3:27 PM, Michael S. Tsirkin wrote:
>>>>> On Wed, Apr 02, 2025 at 12:04:47PM +0100, David Woodhouse wrote:
>>>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>>>>
>>>>>> Add a VIRTIO_PCI_CAP_SWIOTLB capability which advertises a SWIOTLB bounce
>>>>>> buffer similar to the existing `restricted-dma-pool` device-tree feature.
>>>>>>
>>>>>> The difference is that this is per-device; each device needs to have its
>>>>>> own. Perhaps we should add a UUID to the capability, and have a way for
>>>>>> a device to not *provide* its own buffer, but just to reference the UUID
>>>>>> of a buffer elsewhere?
>>>>>>
>>>>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>>>>> ---
>>>>>>  transport-pci.tex | 33 +++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 33 insertions(+)
>>>>>>
>>>>>> diff --git a/transport-pci.tex b/transport-pci.tex
>>>>>> index a5c6719..23e0d57 100644
>>>>>> --- a/transport-pci.tex
>>>>>> +++ b/transport-pci.tex
>>>>>> @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>>>>>>  \item ISR Status
>>>>>>  \item Device-specific configuration (optional)
>>>>>>  \item PCI configuration access
>>>>>> +\item SWIOTLB bounce buffer
>>>>>>  \end{itemize}
>>>>>>  
>>>>>>  Each structure can be mapped by a Base Address register (BAR) belonging to
>>>>>> @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>>>>>>  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>>>>>>  /* Vendor-specific data */
>>>>>>  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
>>>>>> +/* Software IOTLB bounce buffer */
>>>>>> +#define VIRTIO_PCI_CAP_SWIOTLB           10
>>>>>>  \end{lstlisting}
>>>>>>  
>>>>>>          Any other value is reserved for future use.
>>>>>> @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
>>>>>>  The driver MUST qualify the \field{vendor_id} before
>>>>>>  interpreting or writing into the Vendor data capability.
>>>>>>  
>>>>>> +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
>>>>>> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>>>> +Software IOTLB bounce buffer capability}
>>>>>> +
>>>>>> +The optional Software IOTLB bounce buffer capability allows the
>>>>>> +device to provide a memory region which can be used by the driver
>>>>>> +driver for bounce buffering. This allows a device on the PCI
>>>>>> +transport to operate without DMA access to system memory addresses.
>>>>>> +
>>>>>> +The Software IOTLB region is referenced by the
>>>>>> +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
>>>>>> +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
>>>>>> +capability, if negotiated.
>>>>>> +
>>>>>> +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
>>>>>> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>>>> +Software IOTLB bounce buffer capability}
>>>>>> +
>>>>>> +Devices which present the Software IOTLB bounce buffer capability
>>>>>> +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
>>>>>> +
>>>>>> +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
>>>>>> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>>>> +Software IOTLB bounce buffer capability}
>>>>>> +
>>>>>> +The driver SHOULD use the offered buffer in preference to passing system
>>>>>> +memory addresses to the device. If the driver accepts the VIRTIO_F_SWIOTLB
>>>>>> +feature, then the driver MUST use the offered buffer and never pass system
>>>>>> +memory addresses to the device.
>>>>>> +
>>>>>>  \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
>>>>>>  
>>>>>>  The VIRTIO_PCI_CAP_PCI_CFG capability
>>>>>> -- 
>>>>>> 2.49.0
>>>>>>
>>>>> So on the PCI option. The normal mapping (ioremap) for BAR is uncached. If done
>>>>> like this, performance will suffer. But if you do normal WB, since device
>>>> and this even possibly can cause TLB thrashing.... which is a worse case.
>>>>
>>>> Thanks
>>>> Zhu Lingshan
>>> Hmm which TLB? I don't get it.
>> CPU TLB, because a device side bounce buffer design requires mapping
>> device memory to CPU address space, so that CPU to help copy data,
>> and causing a more frequent TLB switch.
> Lost me here. It's mapped, why switch?
Because the number of TLB entries is quite limited.
But never mind, this is not a key topic of this discussion.

Thanks
Zhu Lingshan
>
>> TLB thrashing will occur when many devices doing DMA through
>> the device side bounce buffer, or scattered DMA.
> Yea I don't think this idea even works. Each device can only use
> its own swiotlb.
>
>> If the bounce buffer resides in the hypervisor, for example QEMU,
>> then TLB switch while QEMU process context switch which already occur all the time.
>>
>> Thanks
>> Zhu Lingshan
>>>>> accesses do not go on the bus, they do not get synchronized with driver
>>>>> writes and there's really no way to synchronize them.
>>>>>
>>>>> First, this needs to be addressed.
>>>>>
>>>>> In this age of accelerators for everything, building pci based
>>>>> interfaces that can't be efficiently accelerated seems shortsighted ...
>>>>>

